// Native WebView2 in-app browser for Windows (docs/WINDOWS-BROWSER-PLAN.md §4). See app_browser.h.
//
// - The page lives in its own child window (the "host") over the Flutter view: shown at the
//   rectangle Dart sends (setOverlayBounds), or parked far outside the window while no screen shows
//   it, still rendering (screenshots, page timers).
// - Casama's page script (assets/app_browser/page_agent.js) runs in an isolated `casama` world in
//   every frame, out-of-process iframes too, through the DevTools protocol (§1.2): the page's own
//   scripts can't see it or tamper with it. Commands go to it with Runtime.evaluate in that world.
// - Its own profile under %LOCALAPPDATA%\Casama\app-browser, apart from Edge; signing out deletes it.

#include "app_browser.h"

#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/method_channel.h>
#include <flutter/method_result_functions.h>
#include <flutter/standard_method_codec.h>
#include <objbase.h>
#include <shlobj.h>
#include <wrl.h>

#include <algorithm>
#include <cmath>
#include <filesystem>
#include <fstream>
#include <functional>
#include <map>
#include <memory>
#include <set>
#include <sstream>
#include <string>
#include <vector>

#include "WebView2.h"
#include "WebView2EnvironmentOptions.h"
#include "app_browser_cursor.h"
#include "json_lite.h"

using Microsoft::WRL::Callback;
using Microsoft::WRL::ComPtr;
using flutter::EncodableMap;
using flutter::EncodableValue;
using Json = casama_json::Value;

namespace {

constexpr char kChannelName[] = "casama/app_browser";
constexpr char kWorldName[] = "casama";
constexpr wchar_t kHostClass[] = L"CasamaAppBrowserHost";
constexpr int kMinRuntimeMajor = 120;
constexpr int kParkedX = -32000, kParkedY = -32000;
// Timer ids on the host window: commands count up from here; the others are fixed.
constexpr UINT_PTR kDialogTimer = 1;
constexpr UINT_PTR kWipeTimer = 2;
constexpr UINT_PTR kFirstCommandTimer = 100;
// Posted to the host window to refit the page after a scale change.
constexpr UINT kRefitMessage = WM_APP + 41;
// Posted to the host window to give the page its keyboard focus back after the window is
// activated again (the runner gives it to Flutter's view first).
constexpr UINT kRefocusMessage = WM_APP + 42;

using Result = flutter::MethodResult<EncodableValue>;

struct Pending {
  std::unique_ptr<Result> result;
  bool screenshot = false;
};

struct State {
  HWND top = nullptr;
  HWND flutter_view = nullptr;
  HWND host = nullptr;
  std::unique_ptr<flutter::MethodChannel<EncodableValue>> channel;

  ComPtr<ICoreWebView2Environment> env;
  ComPtr<ICoreWebView2Controller> controller;
  ComPtr<ICoreWebView2> view;
  ComPtr<ICoreWebView2_11> view11;
  bool creating = false;
  bool ready = false;  // The view exists and the page script is set up in its first target.
  std::vector<std::function<void(bool)>> waiting;

  std::wstring data_dir;
  std::string script;  // The page agent, with its secret in front.

  bool overlay_visible = false;
  // Where the page shows, in logical points of [top]'s client area: turned into pixels at the
  // window's scale each time it's placed, so a move to a screen with another scale refits it.
  double overlay_x = 0, overlay_y = 0, overlay_w = 1024, overlay_h = 768;
  int park_w = 0, park_h = 0;             // Logical points.
  bool restore_on_show = false;
  bool minimized = false;

  std::set<std::string> approved_urls;
  bool pending_load = false;  // A `load` whose first navigation hasn't started yet.
  struct Action {
    bool user = false;
    bool redirect = true;
  };
  std::map<std::string, Action> recent_actions;  // url -> how its navigation started
  bool loading = false;
  std::string main_frame_id;
  int main_ctx = 0;  // The `casama` world of the main frame.

  UINT_PTR next_timer = kFirstCommandTimer;
  std::map<UINT_PTR, Pending> pending;

  ComPtr<ICoreWebView2ScriptDialogOpeningEventArgs> dialog;
  ComPtr<ICoreWebView2Deferral> dialog_deferral;

  bool page_focused = false;
  // The page had the keyboard when the window lost activation: it gets it back on return.
  bool refocus_page = false;
  HHOOK mouse_hook = nullptr;
  HHOOK key_hook = nullptr;
  ULONGLONG last_touch = 0;

  // A wipe waits for the browser process to let go of the profile folder.
  std::vector<std::unique_ptr<Result>> wipe_results;
  bool wipe_pending = false;
};

State* g = nullptr;

// --- Small helpers ------------------------------------------------------------------------------

std::string Narrow(const wchar_t* w) {
  if (!w) return "";
  const int n = WideCharToMultiByte(CP_UTF8, 0, w, -1, nullptr, 0, nullptr, nullptr);
  std::string s(n > 0 ? n - 1 : 0, '\0');
  if (n > 0) WideCharToMultiByte(CP_UTF8, 0, w, -1, s.data(), n, nullptr, nullptr);
  return s;
}

std::wstring Wide(const std::string& s) {
  const int n = MultiByteToWideChar(CP_UTF8, 0, s.c_str(), -1, nullptr, 0);
  std::wstring w(n > 0 ? n - 1 : 0, L'\0');
  if (n > 0) MultiByteToWideChar(CP_UTF8, 0, s.c_str(), -1, w.data(), n);
  return w;
}

// Takes a CoTaskMemAlloc'ed string from WebView2.
std::string TakeString(LPWSTR w) {
  std::string s = Narrow(w);
  CoTaskMemFree(w);
  return s;
}

double Scale() {
  const UINT dpi = g && g->top ? GetDpiForWindow(g->top) : 96;
  return dpi > 0 ? dpi / 96.0 : 1.0;
}

const EncodableValue* Arg(const EncodableValue* args, const char* key) {
  if (!args) return nullptr;
  const auto* map = std::get_if<EncodableMap>(args);
  if (!map) return nullptr;
  auto it = map->find(EncodableValue(key));
  return it == map->end() ? nullptr : &it->second;
}

double DoubleArg(const EncodableValue* args, const char* key, double fallback) {
  const EncodableValue* v = Arg(args, key);
  if (!v) return fallback;
  if (const auto* d = std::get_if<double>(v)) return *d;
  if (const auto* i = std::get_if<int32_t>(v)) return *i;
  if (const auto* l = std::get_if<int64_t>(v)) return static_cast<double>(*l);
  return fallback;
}

bool BoolArg(const EncodableValue* args, const char* key, bool fallback) {
  const EncodableValue* v = Arg(args, key);
  const auto* b = v ? std::get_if<bool>(v) : nullptr;
  return b ? *b : fallback;
}

std::string StringArg(const EncodableValue* args, const char* key, const std::string& fallback = "") {
  const EncodableValue* v = Arg(args, key);
  const auto* s = v ? std::get_if<std::string>(v) : nullptr;
  return s ? *s : fallback;
}

// Appends a line to the file CASAMA_APP_BROWSER_LOG names, when it is set (debugging only: page
// addresses can appear in it, never page contents or typed text).
void Log(const std::string& line) {
  static const std::wstring path = [] {
    wchar_t buf[MAX_PATH];
    const DWORD n = GetEnvironmentVariableW(L"CASAMA_APP_BROWSER_LOG", buf, MAX_PATH);
    return n > 0 && n < MAX_PATH ? std::wstring(buf, n) : std::wstring();
  }();
  if (path.empty()) return;
  std::ofstream f(path, std::ios::app);
  f << GetTickCount64() << " " << line << "\n";
}

std::string Failure(const std::string& message) {
  return "{\"ok\":false,\"code\":\"error\",\"message\":" + casama_json::Quote(message) + "}";
}

void InvokeDart(const char* method, EncodableMap args = {},
                std::function<void(bool)> on_bool = nullptr) {
  if (!g || !g->channel) {
    if (on_bool) on_bool(false);
    return;
  }
  std::unique_ptr<Result> reply;
  if (on_bool) {
    reply = std::make_unique<flutter::MethodResultFunctions<EncodableValue>>(
        [on_bool](const EncodableValue* v) {
          const auto* b = v ? std::get_if<bool>(v) : nullptr;
          on_bool(b && *b);
        },
        [on_bool](const std::string&, const std::string&, const EncodableValue*) { on_bool(false); },
        [on_bool]() { on_bool(false); });
  }
  g->channel->InvokeMethod(method, std::make_unique<EncodableValue>(std::move(args)),
                           std::move(reply));
}

std::wstring ExeDir() {
  wchar_t path[MAX_PATH];
  const DWORD n = GetModuleFileNameW(nullptr, path, MAX_PATH);
  std::wstring dir(path, n);
  return dir.substr(0, dir.find_last_of(L'\\'));
}

std::string ReadPageAgent() {
  std::ifstream f(ExeDir() + L"\\data\\flutter_assets\\assets\\app_browser\\page_agent.js",
                  std::ios::binary);
  std::stringstream ss;
  ss << f.rdbuf();
  return ss.str();
}

std::string RandomSecret() {
  GUID guid;
  if (FAILED(CoCreateGuid(&guid))) return "casama";
  wchar_t buf[64];
  StringFromGUID2(guid, buf, 64);
  std::string s = Narrow(buf);
  s.erase(std::remove_if(s.begin(), s.end(), [](char c) { return c == '{' || c == '}'; }), s.end());
  return s;
}

std::wstring DataDir() {
  PWSTR local = nullptr;
  std::wstring dir;
  if (SUCCEEDED(SHGetKnownFolderPath(FOLDERID_LocalAppData, 0, nullptr, &local))) {
    dir = std::wstring(local) + L"\\Casama\\app-browser";
  }
  CoTaskMemFree(local);
  return dir;
}

// "158.0.4370.33" -> 158; 0 when there is no runtime.
int RuntimeMajor() {
  LPWSTR version = nullptr;
  if (FAILED(GetAvailableCoreWebView2BrowserVersionString(nullptr, &version)) || !version) return 0;
  const std::string v = TakeString(version);
  return std::atoi(v.c_str());
}

bool RuntimeSupported() { return RuntimeMajor() >= kMinRuntimeMajor; }

// --- The DevTools protocol ----------------------------------------------------------------------

using CdpDone = std::function<void(bool ok, const Json& result)>;

void Cdp(const std::string& session, const char* method, const std::string& params,
         CdpDone done = nullptr) {
  if (!g || !g->view) {
    if (done) done(false, Json{});
    return;
  }
  auto handler = Callback<ICoreWebView2CallDevToolsProtocolMethodCompletedHandler>(
      [done](HRESULT hr, LPCWSTR json) -> HRESULT {
        if (done) done(SUCCEEDED(hr), casama_json::Parse(Narrow(json)));
        return S_OK;
      });
  HRESULT hr;
  if (session.empty()) {
    hr = g->view->CallDevToolsProtocolMethod(Wide(method).c_str(), Wide(params).c_str(),
                                             handler.Get());
  } else if (g->view11) {
    hr = g->view11->CallDevToolsProtocolMethodForSession(
        Wide(session).c_str(), Wide(method).c_str(), Wide(params).c_str(), handler.Get());
  } else {
    hr = E_NOINTERFACE;
  }
  if (FAILED(hr) && done) done(false, Json{});
}

void Listen(const char* event, std::function<void(const Json&, const std::string&)> fn) {
  ComPtr<ICoreWebView2DevToolsProtocolEventReceiver> rx;
  if (FAILED(g->view->GetDevToolsProtocolEventReceiver(Wide(event).c_str(), &rx)) || !rx) return;
  EventRegistrationToken token;
  rx->add_DevToolsProtocolEventReceived(
      Callback<ICoreWebView2DevToolsProtocolEventReceivedEventHandler>(
          [fn](ICoreWebView2*, ICoreWebView2DevToolsProtocolEventReceivedEventArgs* a) -> HRESULT {
            LPWSTR params = nullptr;
            a->get_ParameterObjectAsJson(&params);
            std::string session;
            ComPtr<ICoreWebView2DevToolsProtocolEventReceivedEventArgs2> a2;
            if (SUCCEEDED(a->QueryInterface(IID_PPV_ARGS(&a2)))) {
              LPWSTR s = nullptr;
              a2->get_SessionId(&s);
              session = TakeString(s);
            }
            fn(casama_json::Parse(TakeString(params)), session);
            return S_OK;
          })
          .Get(),
      &token);
}

// The same setup in every target (the page, and each out-of-process iframe): our script in our
// world before the page's own, auto-attach to its child frames, then let it run. A child target
// waits for us (waitForDebuggerOnStart), so it is always released, even when a step fails.
void SetUpTarget(const std::string& session, std::function<void()> then);

// A child target needs its Runtime and Page domains on before the script setup takes hold there
// (without them its frame stayed blank); the top target has them on already.
void SetUpChildTarget(const std::string& session) {
  Cdp(session, "Runtime.enable", "{}", [session](bool, const Json&) {
    Cdp(session, "Page.enable", "{}", [session](bool, const Json&) { SetUpTarget(session, nullptr); });
  });
}

void SetUpTarget(const std::string& session, std::function<void()> then) {
  const std::string script = "{\"source\":" + casama_json::Quote(g->script) +
                             ",\"worldName\":\"" + kWorldName + "\",\"runImmediately\":true}";
  Log("setup " + (session.empty() ? std::string("top") : session));
  Cdp(session, "Page.addScriptToEvaluateOnNewDocument", script, [session, then](bool ok, const Json&) {
    Log("script " + session + " ok=" + std::to_string(ok));
    Cdp(session, "Target.setAutoAttach",
        "{\"autoAttach\":true,\"waitForDebuggerOnStart\":true,\"flatten\":true}",
        [session, then](bool ok2, const Json&) {
          Log("autoattach " + session + " ok=" + std::to_string(ok2));
          if (!session.empty()) {
            Cdp(session, "Runtime.runIfWaitingForDebugger", "{}", [session](bool ok3, const Json&) {
              Log("run " + session + " ok=" + std::to_string(ok3));
            });
          }
          if (then) then();
        });
  });
}

// --- Host window, overlay and parking (§4.2, §4.3) ----------------------------------------------

LRESULT CALLBACK HostProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp);

void EnsureHost() {
  if (g->host) return;
  WNDCLASSW wc = {};
  wc.lpfnWndProc = HostProc;
  wc.hInstance = GetModuleHandleW(nullptr);
  wc.lpszClassName = kHostClass;
  wc.hbrBackground = static_cast<HBRUSH>(GetStockObject(WHITE_BRUSH));
  RegisterClassW(&wc);
  g->host = CreateWindowExW(0, kHostClass, L"", WS_CHILD | WS_CLIPCHILDREN | WS_VISIBLE, kParkedX,
                            kParkedY, 1024, 768, g->top, nullptr, wc.hInstance, nullptr);
  CursorCreate(g->host);
}

// The parked page's size: the size of the area showing its picture, else 1024x768 (logical).
SIZE ParkedPixels() {
  const double s = Scale();
  const int w = g->park_w > 1 ? g->park_w : 1024;
  const int h = g->park_h > 1 ? g->park_h : 768;
  return {static_cast<LONG>(w * s), static_cast<LONG>(h * s)};
}

void FitController(int w, int h) {
  if (!g->controller) return;
  RECT bounds = {0, 0, w, h};
  g->controller->put_Bounds(bounds);
  g->controller->put_IsVisible(TRUE);
  CursorFit(Scale());
}

void InstallHooks();
void RemoveHooks();

void Park() {
  if (!g->host) return;
  CursorSetShown(false);
  const SIZE p = ParkedPixels();
  SetWindowPos(g->host, HWND_BOTTOM, kParkedX, kParkedY, p.cx, p.cy, SWP_NOACTIVATE);
  FitController(p.cx, p.cy);
}

// [overlay_x]… in client pixels of [top], at its current scale.
RECT OverlayPixels() {
  const double s = Scale();
  RECT r;
  r.left = std::lround(g->overlay_x * s);
  r.top = std::lround(g->overlay_y * s);
  r.right = r.left + std::max<LONG>(1, std::lround(g->overlay_w * s));
  r.bottom = r.top + std::max<LONG>(1, std::lround(g->overlay_h * s));
  return r;
}

void PlaceOverlay() {
  if (!g->host) return;
  const RECT r = OverlayPixels();
  g->overlay_visible = true;
  const int w = std::max<LONG>(1, r.right - r.left), h = std::max<LONG>(1, r.bottom - r.top);
  SetWindowPos(g->host, HWND_TOP, r.left, r.top, w, h, SWP_NOACTIVATE | SWP_SHOWWINDOW);
  FitController(w, h);
  CursorSetShown(true);
  InstallHooks();
}

void HideOverlay() {
  g->overlay_visible = false;
  RemoveHooks();
  Park();
  if (g->page_focused && g->flutter_view) SetFocus(g->flutter_view);
}

// --- Telling Dart the person touched the page (it stops the bot) ---------------------------------
// The page draws in another process, so its input never reaches this one's window procedures.
// Low-level hooks see the person's own input (never Chromium's synthetic events), while the page
// shows; only presses inside the page, or keys while it has focus, count.

void Touched() {
  const ULONGLONG now = GetTickCount64();
  if (now - g->last_touch < 250) return;
  g->last_touch = now;
  InvokeDart("userTouched");
}

bool PointInPage(POINT pt) {
  if (!g || !g->overlay_visible || !g->host) return false;
  RECT rc;
  GetWindowRect(g->host, &rc);
  return PtInRect(&rc, pt) && GetForegroundWindow() == g->top;
}

LRESULT CALLBACK MouseHook(int code, WPARAM wp, LPARAM lp) {
  if (code == HC_ACTION && g) {
    const auto* m = reinterpret_cast<MSLLHOOKSTRUCT*>(lp);
    const bool injected = (m->flags & LLMHF_INJECTED) != 0;
    if (!injected && (wp == WM_LBUTTONDOWN || wp == WM_RBUTTONDOWN || wp == WM_MBUTTONDOWN ||
                      wp == WM_MOUSEWHEEL || wp == WM_MOUSEHWHEEL)) {
      if (PointInPage(m->pt)) Touched();
    }
  }
  return CallNextHookEx(nullptr, code, wp, lp);
}

LRESULT CALLBACK KeyHook(int code, WPARAM wp, LPARAM lp) {
  if (code == HC_ACTION && g && (wp == WM_KEYDOWN || wp == WM_SYSKEYDOWN)) {
    const auto* k = reinterpret_cast<KBDLLHOOKSTRUCT*>(lp);
    if (!(k->flags & LLKHF_INJECTED) && g->overlay_visible && g->page_focused &&
        GetForegroundWindow() == g->top) {
      Touched();
    }
  }
  return CallNextHookEx(nullptr, code, wp, lp);
}

void InstallHooks() {
  if (!g->mouse_hook) {
    g->mouse_hook = SetWindowsHookExW(WH_MOUSE_LL, MouseHook, GetModuleHandleW(nullptr), 0);
  }
  if (!g->key_hook) {
    g->key_hook = SetWindowsHookExW(WH_KEYBOARD_LL, KeyHook, GetModuleHandleW(nullptr), 0);
  }
}

void RemoveHooks() {
  if (g->mouse_hook) UnhookWindowsHookEx(g->mouse_hook);
  if (g->key_hook) UnhookWindowsHookEx(g->key_hook);
  g->mouse_hook = g->key_hook = nullptr;
}

// --- Commands, screenshots and dialogs waiting for answers ---------------------------------------

UINT_PTR AddPending(std::unique_ptr<Result> result, int timeout_ms, bool screenshot = false) {
  const UINT_PTR id = g->next_timer++;
  g->pending[id] = Pending{std::move(result), screenshot};
  SetTimer(g->host, id, static_cast<UINT>(std::max(1000, timeout_ms)), nullptr);
  return id;
}

std::unique_ptr<Result> TakePending(UINT_PTR id) {
  auto it = g->pending.find(id);
  if (it == g->pending.end()) return nullptr;
  std::unique_ptr<Result> r = std::move(it->second.result);
  g->pending.erase(it);
  if (g->host) KillTimer(g->host, id);
  return r;
}

void FailAllPending() {
  auto pending = std::move(g->pending);
  g->pending.clear();
  for (auto& [id, p] : pending) {
    if (g->host) KillTimer(g->host, id);
    if (!p.result) continue;
    if (p.screenshot) {
      p.result->Error("no_page", "The browser was closed");
    } else {
      p.result->Success(EncodableValue(Failure("The browser was closed")));
    }
  }
}

void CloseDialog(bool accept, const std::string& text) {
  if (g->host) KillTimer(g->host, kDialogTimer);
  if (!g->dialog) return;
  if (accept) {
    COREWEBVIEW2_SCRIPT_DIALOG_KIND kind = COREWEBVIEW2_SCRIPT_DIALOG_KIND_ALERT;
    g->dialog->get_Kind(&kind);
    if (kind == COREWEBVIEW2_SCRIPT_DIALOG_KIND_PROMPT) g->dialog->put_ResultText(Wide(text).c_str());
    g->dialog->Accept();
  }
  if (g->dialog_deferral) g->dialog_deferral->Complete();
  g->dialog.Reset();
  g->dialog_deferral.Reset();
}

LRESULT CALLBACK HostProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
  if (msg == kRefocusMessage && g) {
    if (g->overlay_visible && g->controller)
      g->controller->MoveFocus(COREWEBVIEW2_MOVE_FOCUS_REASON_PROGRAMMATIC);
    return 0;
  }
  if (msg == kRefitMessage && g) {
    // The window moved to a screen with another scale: the same logical area is now another
    // number of pixels, and Flutter's layout (in logical points) doesn't change to say so.
    if (g->view) {
      if (g->overlay_visible) {
        PlaceOverlay();
      } else {
        Park();
      }
    }
    return 0;
  }
  if (msg == WM_TIMER && g) {
    if (wp == kDialogTimer) {
      CloseDialog(false, "");
    } else if (wp == kWipeTimer) {
      KillTimer(hwnd, kWipeTimer);
      // The browser process didn't say it exited: delete what can be deleted now.
      if (g->wipe_pending) {
        g->wipe_pending = false;
        std::error_code ec;
        std::filesystem::remove_all(g->data_dir, ec);
        for (auto& r : g->wipe_results) r->Success();
        g->wipe_results.clear();
      }
    } else if (auto r = TakePending(wp)) {
      // A command or picture that never came back.
      r->Success(EncodableValue(Failure("The page didn't answer in time")));
    }
    return 0;
  }
  return DefWindowProcW(hwnd, msg, wp, lp);
}

// --- WebView2 lifecycle --------------------------------------------------------------------------

void OnViewEvents();

void FinishCreating(bool ok) {
  g->creating = false;
  g->ready = ok;
  auto waiting = std::move(g->waiting);
  g->waiting.clear();
  for (auto& fn : waiting) fn(ok);
}

// Creates the environment, controller and page-script setup once; [then] runs when it is ready
// (or failed).
void WhenReady(std::function<void(bool)> then) {
  if (g->ready && g->view) {
    then(true);
    return;
  }
  g->waiting.push_back(std::move(then));
  if (g->creating) return;
  if (!RuntimeSupported() || g->data_dir.empty()) {
    FinishCreating(false);
    return;
  }
  g->creating = true;
  EnsureHost();
  if (g->script.empty()) {
    const std::string body = ReadPageAgent();
    if (!body.empty()) {
      g->script = "globalThis.__casamaPageAgentConfig={secret:\"" + RandomSecret() + "\"};\n" + body;
    }
  }
  std::error_code ec;
  std::filesystem::create_directories(g->data_dir, ec);

  auto options = Microsoft::WRL::Make<CoreWebView2EnvironmentOptions>();
  // A parked page must keep rendering and running: no occlusion or background throttling.
  // Overlay scrollbars, as on phones and the Mac: a classic scrollbar takes its width from the
  // page, so anything sized to 100vw overflows and the narrow pane gets a sideways scrollbar.
  options->put_AdditionalBrowserArguments(
      L"--disable-features=CalculateNativeWinOcclusion --disable-background-timer-throttling "
      L"--disable-renderer-backgrounding --disable-backgrounding-occluded-windows "
      L"--enable-features=OverlayScrollbar,msOverlayScrollbarWinStyle,"
      L"msOverlayScrollbarWinStyleAnimation");
  const HRESULT hr = CreateCoreWebView2EnvironmentWithOptions(
      nullptr, g->data_dir.c_str(), options.Get(),
      Callback<ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandler>(
          [](HRESULT hr, ICoreWebView2Environment* env) -> HRESULT {
            if (!g) return S_OK;
            if (FAILED(hr) || !env) {
              FinishCreating(false);
              return S_OK;
            }
            g->env = env;
            env->CreateCoreWebView2Controller(
                g->host,
                Callback<ICoreWebView2CreateCoreWebView2ControllerCompletedHandler>(
                    [](HRESULT hr, ICoreWebView2Controller* controller) -> HRESULT {
                      if (!g) return S_OK;
                      if (FAILED(hr) || !controller) {
                        g->env.Reset();
                        FinishCreating(false);
                        return S_OK;
                      }
                      g->controller = controller;
                      controller->get_CoreWebView2(&g->view);
                      g->view.As(&g->view11);
                      if (g->overlay_visible) {
                        PlaceOverlay();
                      } else {
                        Park();
                      }
                      OnViewEvents();
                      return S_OK;
                    })
                    .Get());
            return S_OK;
          })
          .Get());
  if (FAILED(hr)) FinishCreating(false);
}

void DestroyView(bool wipe, std::unique_ptr<Result> done = nullptr) {
  CloseDialog(false, "");
  FailAllPending();
  RemoveHooks();
  g->overlay_visible = false;
  g->restore_on_show = false;
  g->approved_urls.clear();
  g->recent_actions.clear();
  g->pending_load = false;
  g->main_ctx = 0;
  g->loading = false;
  CursorSet(CursorTarget{});
  CursorSetShown(false);
  ComPtr<ICoreWebView2Environment5> env5;
  if (g->env) g->env.As(&env5);
  if (g->controller) g->controller->Close();
  g->controller.Reset();
  g->view.Reset();
  g->view11.Reset();
  g->ready = false;
  if (g->host) Park();
  if (!wipe) {
    g->env.Reset();
    if (done) done->Success();
    return;
  }
  if (done) g->wipe_results.push_back(std::move(done));
  if (env5 && !g->wipe_pending) {
    // Delete the profile once the browser process has let go of it (capped at five seconds).
    g->wipe_pending = true;
    EventRegistrationToken token;
    env5->add_BrowserProcessExited(
        Callback<ICoreWebView2BrowserProcessExitedEventHandler>(
            [](ICoreWebView2Environment*, ICoreWebView2BrowserProcessExitedEventArgs*) -> HRESULT {
              if (!g || !g->wipe_pending) return S_OK;
              g->wipe_pending = false;
              if (g->host) KillTimer(g->host, kWipeTimer);
              std::error_code ec;
              std::filesystem::remove_all(g->data_dir, ec);
              for (auto& r : g->wipe_results) r->Success();
              g->wipe_results.clear();
              return S_OK;
            })
            .Get(),
        &token);
    if (g->host) SetTimer(g->host, kWipeTimer, 5000, nullptr);
    g->env.Reset();
    return;
  }
  g->env.Reset();
  if (!g->wipe_pending) {
    std::error_code ec;
    std::filesystem::remove_all(g->data_dir, ec);
    for (auto& r : g->wipe_results) r->Success();
    g->wipe_results.clear();
  }
}

// Wires the view's events and the page script, then reports ready.
void OnViewEvents() {
  ComPtr<ICoreWebView2Settings> settings;
  g->view->get_Settings(&settings);
  if (settings) {
    settings->put_IsWebMessageEnabled(FALSE);  // No chrome.webview messages from pages.
    settings->put_AreHostObjectsAllowed(FALSE);
    settings->put_AreDefaultScriptDialogsEnabled(FALSE);  // Dart answers them (dialog event).
    settings->put_IsStatusBarEnabled(FALSE);
#ifdef NDEBUG
    settings->put_AreDevToolsEnabled(FALSE);
#endif
    ComPtr<ICoreWebView2Settings4> settings4;
    if (SUCCEEDED(settings.As(&settings4))) {
      // The person types passwords and cards themselves; the browser keeps none of them.
      settings4->put_IsPasswordAutosaveEnabled(FALSE);
      settings4->put_IsGeneralAutofillEnabled(FALSE);
    }
  }
  EventRegistrationToken token;

  // Notes how each main-frame navigation started (a click or form, a redirect) for the site check
  // below. The check itself can't run here: this event has no deferral, and Dart answers later.
  g->view->add_NavigationStarting(
      Callback<ICoreWebView2NavigationStartingEventHandler>(
          [](ICoreWebView2*, ICoreWebView2NavigationStartingEventArgs* args) -> HRESULT {
            LPWSTR uri_w = nullptr;
            args->get_Uri(&uri_w);
            const std::string uri = TakeString(uri_w);
            BOOL user = FALSE, redirect = FALSE;
            args->get_IsUserInitiated(&user);
            args->get_IsRedirected(&redirect);
            if (uri.empty() || uri == "about:blank") return S_OK;
            g->loading = true;
            if (g->pending_load) {
              // The address Dart loaded, as Chromium spelled it (a trailing slash added, say).
              g->pending_load = false;
              g->approved_urls.insert(uri);
            }
            if (g->recent_actions.size() > 64) g->recent_actions.clear();
            g->recent_actions[uri] = {user != FALSE, redirect != FALSE};
            return S_OK;
          })
          .Get(),
      &token);

  // The main frame committed: Dart checks the address it landed on (the backstop after
  // redirects).
  g->view->add_ContentLoading(
      Callback<ICoreWebView2ContentLoadingEventHandler>(
          [](ICoreWebView2* sender, ICoreWebView2ContentLoadingEventArgs*) -> HRESULT {
            LPWSTR src = nullptr;
            sender->get_Source(&src);
            const std::string url = TakeString(src);
            if (url.empty() || url == "about:blank") return S_OK;
            InvokeDart("landed", EncodableMap{{EncodableValue("url"), EncodableValue(url)}},
                       [](bool allow) {
                         if (!allow && g && g->view) {
                           g->view->Stop();
                           g->view->Navigate(L"about:blank");
                         }
                       });
            return S_OK;
          })
          .Get(),
      &token);

  g->view->add_NavigationCompleted(
      Callback<ICoreWebView2NavigationCompletedEventHandler>(
          [](ICoreWebView2* sender, ICoreWebView2NavigationCompletedEventArgs*) -> HRESULT {
            g->loading = false;
            LPWSTR src = nullptr, title = nullptr;
            sender->get_Source(&src);
            sender->get_DocumentTitle(&title);
            InvokeDart("pageFinished",
                       EncodableMap{{EncodableValue("url"), EncodableValue(TakeString(src))},
                                    {EncodableValue("title"), EncodableValue(TakeString(title))}});
            return S_OK;
          })
          .Get(),
      &token);

  // A new window opens in place, as a navigation of the main frame (checked like any other).
  g->view->add_NewWindowRequested(
      Callback<ICoreWebView2NewWindowRequestedEventHandler>(
          [](ICoreWebView2* sender, ICoreWebView2NewWindowRequestedEventArgs* args) -> HRESULT {
            args->put_Handled(TRUE);
            LPWSTR uri = nullptr;
            args->get_Uri(&uri);
            const std::wstring target = uri ? uri : L"";
            CoTaskMemFree(uri);
            if (!target.empty()) sender->Navigate(target.c_str());
            return S_OK;
          })
          .Get(),
      &token);

  g->view->add_ProcessFailed(
      Callback<ICoreWebView2ProcessFailedEventHandler>(
          [](ICoreWebView2*, ICoreWebView2ProcessFailedEventArgs* args) -> HRESULT {
            COREWEBVIEW2_PROCESS_FAILED_KIND kind;
            args->get_ProcessFailedKind(&kind);
            if (kind == COREWEBVIEW2_PROCESS_FAILED_KIND_BROWSER_PROCESS_EXITED ||
                kind == COREWEBVIEW2_PROCESS_FAILED_KIND_RENDER_PROCESS_EXITED ||
                kind == COREWEBVIEW2_PROCESS_FAILED_KIND_RENDER_PROCESS_UNRESPONSIVE) {
              InvokeDart("gone", EncodableMap{{EncodableValue("reason"), EncodableValue("killed")}});
            }
            if (kind == COREWEBVIEW2_PROCESS_FAILED_KIND_BROWSER_PROCESS_EXITED && g) {
              // Everything is gone with it: start over on the next call.
              DestroyView(false);
            }
            return S_OK;
          })
          .Get(),
      &token);

  g->view->add_ScriptDialogOpening(
      Callback<ICoreWebView2ScriptDialogOpeningEventHandler>(
          [](ICoreWebView2*, ICoreWebView2ScriptDialogOpeningEventArgs* args) -> HRESULT {
            CloseDialog(false, "");
            COREWEBVIEW2_SCRIPT_DIALOG_KIND kind;
            args->get_Kind(&kind);
            LPWSTR message = nullptr;
            args->get_Message(&message);
            g->dialog = args;
            args->GetDeferral(&g->dialog_deferral);
            SetTimer(g->host, kDialogTimer, 60000, nullptr);
            const char* name = kind == COREWEBVIEW2_SCRIPT_DIALOG_KIND_CONFIRM ||
                                       kind == COREWEBVIEW2_SCRIPT_DIALOG_KIND_BEFOREUNLOAD
                                   ? "confirm"
                               : kind == COREWEBVIEW2_SCRIPT_DIALOG_KIND_PROMPT ? "prompt"
                                                                                 : "alert";
            InvokeDart("dialog", EncodableMap{{EncodableValue("kind"), EncodableValue(name)},
                                              {EncodableValue("message"),
                                               EncodableValue(TakeString(message))}});
            return S_OK;
          })
          .Get(),
      &token);

  // Camera, microphone, location and the rest: no.
  g->view->add_PermissionRequested(
      Callback<ICoreWebView2PermissionRequestedEventHandler>(
          [](ICoreWebView2*, ICoreWebView2PermissionRequestedEventArgs* args) -> HRESULT {
            args->put_State(COREWEBVIEW2_PERMISSION_STATE_DENY);
            return S_OK;
          })
          .Get(),
      &token);

  // Never save files on the person's computer (the page script's `download` fetches files itself,
  // within its cap).
  ComPtr<ICoreWebView2_4> view4;
  if (SUCCEEDED(g->view.As(&view4))) {
    view4->add_DownloadStarting(
        Callback<ICoreWebView2DownloadStartingEventHandler>(
            [](ICoreWebView2*, ICoreWebView2DownloadStartingEventArgs* args) -> HRESULT {
              args->put_Cancel(TRUE);
              args->put_Handled(TRUE);
              return S_OK;
            })
            .Get(),
        &token);
  }

  g->controller->add_GotFocus(Callback<ICoreWebView2FocusChangedEventHandler>(
                                  [](ICoreWebView2Controller*, IUnknown*) -> HRESULT {
                                    if (g) g->page_focused = true;
                                    return S_OK;
                                  })
                                  .Get(),
                              &token);
  g->controller->add_LostFocus(Callback<ICoreWebView2FocusChangedEventHandler>(
                                   [](ICoreWebView2Controller*, IUnknown*) -> HRESULT {
                                     if (g) g->page_focused = false;
                                     return S_OK;
                                   })
                                   .Get(),
                               &token);

  // The site check (§4.1): every main-frame document request, each redirect hop too, waits here
  // until Dart says yes or no. Iframes (ads, embeds, payment frames) load without asking, as on
  // the other platforms; out-of-process ones never reach this session at all.
  Listen("Fetch.requestPaused", [](const Json& p, const std::string& session) {
    const std::string id = p["requestId"].Str();
    Log("paused session=" + session + " frame=" + p["frameId"].Str() + " type=" + p["resourceType"].Str() + " url=" + p["request"]["url"].Str());
    if (id.empty()) return;
    const std::string params = "{\"requestId\":" + casama_json::Quote(id) + "}";
    const std::string url = p["request"]["url"].Str();
    if (!session.empty() || p["frameId"].Str() != g->main_frame_id ||
        p["resourceType"].Str() != "Document" || url.empty() || url == "about:blank") {
      Cdp(session, "Fetch.continueRequest", params, [url](bool ok, const Json& r) {
        Log("continued " + url + " ok=" + std::to_string(ok) + " " + r["message"].Str());
      });
      return;
    }
    auto approved = g->approved_urls.find(url);
    if (approved != g->approved_urls.end()) {
      g->approved_urls.erase(approved);
      g->recent_actions.erase(url);
      Cdp("", "Fetch.continueRequest", params);
      InvokeDart("pageStarted", EncodableMap{{EncodableValue("url"), EncodableValue(url)}});
      return;
    }
    State::Action action;  // Unknown: treated as a redirect nobody clicked, as on Linux.
    auto known = g->recent_actions.find(url);
    if (known != g->recent_actions.end()) {
      action = known->second;
      g->recent_actions.erase(known);
    }
    InvokeDart("navigate",
               EncodableMap{{EncodableValue("url"), EncodableValue(url)},
                            {EncodableValue("redirect"), EncodableValue(action.redirect)},
                            {EncodableValue("user"), EncodableValue(action.user)}},
               [id, url](bool allow) {
                 if (!g) return;
                 const std::string req = "{\"requestId\":" + casama_json::Quote(id);
                 if (allow) {
                   Cdp("", "Fetch.continueRequest", req + "}");
                   InvokeDart("pageStarted",
                              EncodableMap{{EncodableValue("url"), EncodableValue(url)}});
                 } else {
                   // Aborted, not BlockedByClient: Chromium commits an error page in place of
                   // the current one for any other reason, and the person would lose the page
                   // they were on. An aborted navigation leaves it as it was, like the Mac and
                   // Linux.
                   Cdp("", "Fetch.failRequest", req + ",\"errorReason\":\"Aborted\"}");
                 }
               });
  });

  // Which execution context is our world in the main frame.
  Listen("Runtime.executionContextCreated", [](const Json& p, const std::string& session) {
    Log("context session=" + session + " name=" + p["context"]["name"].Str() + " origin=" + p["context"]["origin"].Str());
    if (!session.empty()) return;
    const Json& c = p["context"];
    if (c["name"].Str() == kWorldName && c["auxData"]["frameId"].Str() == g->main_frame_id) {
      g->main_ctx = c["id"].Int();
    }
  });
  Listen("Runtime.executionContextDestroyed", [](const Json& p, const std::string& session) {
    if (session.empty() && p["executionContextId"].Int() == g->main_ctx) g->main_ctx = 0;
  });
  Listen("Runtime.executionContextsCleared", [](const Json&, const std::string& session) {
    if (session.empty()) g->main_ctx = 0;
  });
  // Out-of-process iframes get the same setup; anything else (workers) is just let go.
  Listen("Target.attachedToTarget", [](const Json& p, const std::string& from) {
    const std::string child = p["sessionId"].Str();
    Log("attached from=" + from + " child=" + child + " type=" + p["targetInfo"]["type"].Str());
    if (child.empty()) return;
    if (p["targetInfo"]["type"].Str() == "iframe") {
      SetUpChildTarget(child);
    } else {
      Cdp(child, "Runtime.runIfWaitingForDebugger", "{}", [child](bool, const Json&) {
        Cdp("", "Target.detachFromTarget", "{\"sessionId\":" + casama_json::Quote(child) + "}");
      });
    }
  });

  Cdp("", "Runtime.enable", "{}", [](bool, const Json&) {
    Cdp("", "Page.enable", "{}", [](bool, const Json&) {
      Cdp("", "Page.getFrameTree", "{}", [](bool, const Json& r) {
        g->main_frame_id = r["frameTree"]["frame"]["id"].Str();
        Cdp("", "Fetch.enable",
            "{\"patterns\":[{\"urlPattern\":\"*\",\"resourceType\":\"Document\","
            "\"requestStage\":\"Request\"}]}",
            [](bool, const Json&) {
              if (g->script.empty()) {
                FinishCreating(true);  // No page script shipped: pages open, commands fail plainly.
                return;
              }
              SetUpTarget("", [] { FinishCreating(true); });
            });
      });
    });
  });
}

// --- Commands -----------------------------------------------------------------------------------

void HandleCommand(const EncodableValue* args, std::unique_ptr<Result> result) {
  if (!g->view) {
    result->Success(EncodableValue(Failure("No page is open")));
    return;
  }
  if (g->main_ctx == 0) {
    result->Success(EncodableValue(Failure("The page is not ready yet")));
    return;
  }
  const std::string json = StringArg(args, "json", "{}");
  const int timeout_ms = static_cast<int>(DoubleArg(args, "timeout_ms", 30000));
  const UINT_PTR id = AddPending(std::move(result), timeout_ms);
  const std::string expr =
      "(async () => { const a = globalThis.__casamaPageAgent;"
      " if (!a) return JSON.stringify({ok:false,code:'error',message:'The page is not ready yet'});"
      " try { return JSON.stringify(await a.handle(JSON.parse(" +
      casama_json::Quote(json) +
      "))); } catch (e) { return JSON.stringify({ok:false,code:'error',message:String(e && e.message"
      " || e)}); } })()";
  const std::string params = "{\"expression\":" + casama_json::Quote(expr) +
                             ",\"contextId\":" + std::to_string(g->main_ctx) +
                             ",\"awaitPromise\":true,\"returnByValue\":true}";
  Cdp("", "Runtime.evaluate", params, [id](bool ok, const Json& r) {
    auto reply = g ? TakePending(id) : nullptr;
    if (!reply) return;  // Timed out already.
    if (!ok) {
      reply->Success(EncodableValue(Failure("The page changed before it answered")));
      return;
    }
    if (!r["exceptionDetails"].IsNull()) {
      reply->Success(EncodableValue(Failure(r["exceptionDetails"]["text"].Str("Script error"))));
      return;
    }
    const Json& value = r["result"]["value"];
    reply->Success(EncodableValue(value.kind == Json::Kind::kString ? value.string
                                                                     : Failure("No answer")));
  });
}

void HandleScreenshot(const EncodableValue* args, std::unique_ptr<Result> result) {
  if (!g->view) {
    result->Error("no_page", "No page is open");
    return;
  }
  const int quality = std::min(95, std::max(30, static_cast<int>(DoubleArg(args, "quality", 70))));
  const UINT_PTR id = AddPending(std::move(result), 5000, true);
  Cdp("", "Page.getLayoutMetrics", "{}", [id, quality](bool, const Json& m) {
    const Json& vp = m["cssVisualViewport"];
    const double w = vp["clientWidth"].Num(0), h = vp["clientHeight"].Num(0);
    std::string params = "{\"format\":\"jpeg\",\"quality\":" + std::to_string(quality);
    if (w > 0 && h > 0) {
      // At most 1024 wide, like the other platforms.
      const double scale = std::min(1.0, 1024.0 / w);
      std::ostringstream clip;
      clip << ",\"clip\":{\"x\":" << vp["pageX"].Num(0) << ",\"y\":" << vp["pageY"].Num(0)
           << ",\"width\":" << w << ",\"height\":" << h << ",\"scale\":" << scale << "}";
      params += clip.str();
    }
    params += "}";
    Cdp("", "Page.captureScreenshot", params, [id](bool ok, const Json& r) {
      auto reply = g ? TakePending(id) : nullptr;
      if (!reply) return;
      const std::string data = r["data"].Str();
      if (!ok || data.empty()) {
        reply->Error("failed", "Snapshot failed");
        return;
      }
      reply->Success(EncodableValue(EncodableMap{{EncodableValue("data"), EncodableValue(data)}}));
    });
  });
}

void HandleClearData(const EncodableValue* args, std::unique_ptr<Result> result) {
  const std::string host = StringArg(args, "host");
  if (!g->view) {
    if (host.empty() && !g->env) {
      std::error_code ec;
      std::filesystem::remove_all(g->data_dir, ec);
    }
    result->Success();
    return;
  }
  if (host.empty()) {
    ComPtr<ICoreWebView2_13> view13;
    ComPtr<ICoreWebView2Profile> profile;
    ComPtr<ICoreWebView2Profile2> profile2;
    if (SUCCEEDED(g->view.As(&view13)) && SUCCEEDED(view13->get_Profile(&profile)) &&
        SUCCEEDED(profile.As(&profile2))) {
      std::shared_ptr<Result> shared(std::move(result));
      profile2->ClearBrowsingDataAll(
          Callback<ICoreWebView2ClearBrowsingDataCompletedHandler>([shared](HRESULT) -> HRESULT {
            shared->Success();
            return S_OK;
          }).Get());
      return;
    }
    result->Success();
    return;
  }
  // One site: its cookies (and its subdomains'), then its storage.
  ComPtr<ICoreWebView2_2> view2;
  ComPtr<ICoreWebView2CookieManager> cookies;
  if (SUCCEEDED(g->view.As(&view2))) view2->get_CookieManager(&cookies);
  std::shared_ptr<Result> shared(std::move(result));
  auto clear_storage = [host, shared]() {
    Cdp("", "Storage.clearDataForOrigin",
        "{\"origin\":" + casama_json::Quote("https://" + host) + ",\"storageTypes\":\"all\"}",
        [host, shared](bool, const Json&) {
          Cdp("", "Storage.clearDataForOrigin",
              "{\"origin\":" + casama_json::Quote("http://" + host) + ",\"storageTypes\":\"all\"}",
              [shared](bool, const Json&) { shared->Success(); });
        });
  };
  if (!cookies) {
    clear_storage();
    return;
  }
  ComPtr<ICoreWebView2CookieManager> manager = cookies;
  cookies->GetCookies(
      L"", Callback<ICoreWebView2GetCookiesCompletedHandler>(
               [manager, host, clear_storage](HRESULT, ICoreWebView2CookieList* list) -> HRESULT {
                 UINT count = 0;
                 if (list) list->get_Count(&count);
                 const std::string suffix = "." + host;
                 for (UINT i = 0; i < count; i++) {
                   ComPtr<ICoreWebView2Cookie> cookie;
                   if (FAILED(list->GetValueAtIndex(i, &cookie)) || !cookie) continue;
                   LPWSTR domain_w = nullptr;
                   cookie->get_Domain(&domain_w);
                   std::string domain = TakeString(domain_w);
                   if (!domain.empty() && domain[0] == '.') domain.erase(0, 1);
                   if (domain == host ||
                       (domain.size() > suffix.size() &&
                        domain.compare(domain.size() - suffix.size(), suffix.size(), suffix) == 0)) {
                     manager->DeleteCookie(cookie.Get());
                   }
                 }
                 clear_storage();
                 return S_OK;
               })
               .Get());
}

void HandleCursor(const EncodableValue* args, std::unique_ptr<Result> result) {
  CursorTarget t;
  t.visible = BoolArg(args, "visible", false);
  t.x = DoubleArg(args, "x", 0);
  t.y = DoubleArg(args, "y", 0);
  const std::string act = StringArg(args, "act", "rest");
  t.act = act == "click" ? CursorAct::kClick : act == "typing" ? CursorAct::kTyping : CursorAct::kRest;
  t.step = static_cast<int>(DoubleArg(args, "step", 0));
  t.nudge = static_cast<int>(DoubleArg(args, "nudge", 0));
  t.label = Wide(StringArg(args, "label"));
  const auto color = static_cast<uint32_t>(DoubleArg(args, "color", 0xFF6750A4));
  t.r = ((color >> 16) & 0xFF) / 255.0;
  t.g = ((color >> 8) & 0xFF) / 255.0;
  t.b = (color & 0xFF) / 255.0;
  t.size = DoubleArg(args, "size", 22);
  t.reduce_motion = BoolArg(args, "reduceMotion", false);
  CursorSet(t);
  result->Success(EncodableValue(CursorIsVisible()));
}

void OnMethodCall(const flutter::MethodCall<EncodableValue>& call, std::unique_ptr<Result> result) {
  const std::string& method = call.method_name();
  const EncodableValue* args = call.arguments();

  if (method == "supported") {
    const bool ok = RuntimeSupported();
    result->Success(EncodableValue(EncodableMap{
        {EncodableValue("supported"), EncodableValue(ok)},
        {EncodableValue("reason"), ok ? EncodableValue() : EncodableValue("needs_webview2")},
        {EncodableValue("realTaps"), EncodableValue(false)},
        {EncodableValue("liveOverlay"), EncodableValue(true)},
    }));
    return;
  }

  if (method == "load") {
    const std::string url = StringArg(args, "url");
    if (url.empty()) {
      result->Error("bad_args", "url");
      return;
    }
    std::shared_ptr<Result> shared(std::move(result));
    WhenReady([url, shared](bool ok) {
      if (!ok || !g->view) {
        shared->Error("unsupported", "needs_webview2");
        return;
      }
      g->approved_urls.insert(url);
      g->pending_load = true;
      if (FAILED(g->view->Navigate(Wide(url).c_str()))) {
        g->approved_urls.erase(url);
        shared->Error("bad_args", "url");
        return;
      }
      shared->Success();
    });
    return;
  }

  if (method == "command") {
    HandleCommand(args, std::move(result));
    return;
  }

  if (method == "screenshot") {
    HandleScreenshot(args, std::move(result));
    return;
  }

  if (method == "url") {
    std::string url = "about:blank", title;
    int w = 0, h = 0;
    if (g->view) {
      LPWSTR src = nullptr, t = nullptr;
      g->view->get_Source(&src);
      g->view->get_DocumentTitle(&t);
      const std::string s = TakeString(src);
      if (!s.empty()) url = s;
      title = TakeString(t);
    }
    if (g->controller) {
      RECT b;
      g->controller->get_Bounds(&b);
      const double s = Scale();
      w = static_cast<int>(std::lround((b.right - b.left) / s));
      h = static_cast<int>(std::lround((b.bottom - b.top) / s));
    }
    const bool loading = g->view ? g->loading : false;
    std::shared_ptr<Result> shared(std::move(result));
    auto answer = [shared, url, title, loading, w, h](bool back, bool forward) {
      shared->Success(EncodableValue(EncodableMap{
          {EncodableValue("url"), EncodableValue(url)},
          {EncodableValue("title"), EncodableValue(title)},
          {EncodableValue("loading"), EncodableValue(loading)},
          {EncodableValue("canGoBack"), EncodableValue(back)},
          {EncodableValue("canGoForward"), EncodableValue(forward)},
          {EncodableValue("width"), EncodableValue(w)},
          {EncodableValue("height"), EncodableValue(h)},
      }));
    };
    if (!g->view) {
      answer(false, false);
      return;
    }
    // From the history list itself (see `back` below for why not CanGoBack).
    Cdp("", "Page.getNavigationHistory", "{}", [answer](bool ok, const Json& r) {
      const int at = r["currentIndex"].Int(-1);
      const int count = static_cast<int>(r["entries"].array.size());
      answer(ok && at > 0, ok && at >= 0 && at < count - 1);
    });
    return;
  }

  if (method == "back" || method == "forward") {
    if (!g->view) {
      result->Success();
      return;
    }
    // Chromium's back skips pages that a script left without a user gesture, and every bot click
    // is such a script; the bot's "back" means the page before, so go by the history list.
    const int step = method == "back" ? -1 : 1;
    std::shared_ptr<Result> shared(std::move(result));
    Cdp("", "Page.getNavigationHistory", "{}", [shared, step](bool ok, const Json& r) {
      const int to = r["currentIndex"].Int(-1) + step;
      const Json& entry = r["entries"][static_cast<size_t>(std::max(0, to))];
      if (ok && to >= 0 && !entry.IsNull()) {
        Cdp("", "Page.navigateToHistoryEntry",
            "{\"entryId\":" + std::to_string(entry["id"].Int()) + "}");
      }
      shared->Success();
    });
    return;
  }

  if (method == "reload" || method == "stop") {
    if (g->view) {
      if (method == "reload") g->view->Reload();
      if (method == "stop") g->view->Stop();
    }
    result->Success();
    return;
  }

  if (method == "answerDialog") {
    CloseDialog(BoolArg(args, "accept", false), StringArg(args, "text"));
    result->Success();
    return;
  }

  if (method == "clearData") {
    HandleClearData(args, std::move(result));
    return;
  }

  if (method == "setOverlayBounds") {
    g->restore_on_show = false;
    if (!BoolArg(args, "visible", false)) {
      // A size with it: the area shows the page's picture at that size.
      const int pw = static_cast<int>(DoubleArg(args, "width", 0));
      const int ph = static_cast<int>(DoubleArg(args, "height", 0));
      if (pw > 1 && ph > 1) {
        g->park_w = pw;
        g->park_h = ph;
      }
      HideOverlay();
      result->Success();
      return;
    }
    g->overlay_x = DoubleArg(args, "x", 0);
    g->overlay_y = DoubleArg(args, "y", 0);
    g->overlay_w = DoubleArg(args, "width", 1);
    g->overlay_h = DoubleArg(args, "height", 1);
    g->overlay_visible = true;
    std::shared_ptr<Result> shared(std::move(result));
    WhenReady([shared](bool ok) {
      if (ok && g->overlay_visible) PlaceOverlay();
      shared->Success();
    });
    return;
  }

  if (method == "pageWindow") {
    // Only Wayland needs the page in a window of its own.
    result->Success();
    return;
  }

  if (method == "cursor") {
    HandleCursor(args, std::move(result));
    return;
  }

  if (method == "dispose") {
    DestroyView(BoolArg(args, "wipeData", false), std::move(result));
    return;
  }

  result->NotImplemented();
}

void WindowHidden() {
  if (g->overlay_visible) g->restore_on_show = true;
  HideOverlay();
  InvokeDart("windowHidden");
}

void WindowShown() {
  if (g->restore_on_show && g->view) {
    g->restore_on_show = false;
    PlaceOverlay();
  }
  InvokeDart("windowShown");
}

}  // namespace

void CasamaAppBrowserAttach(flutter::BinaryMessenger* messenger, HWND top_level, HWND flutter_view) {
  CasamaAppBrowserDetach();
  g = new State();
  g->top = top_level;
  g->flutter_view = flutter_view;
  g->data_dir = DataDir();
  g->channel = std::make_unique<flutter::MethodChannel<EncodableValue>>(
      messenger, kChannelName, &flutter::StandardMethodCodec::GetInstance());
  g->channel->SetMethodCallHandler(
      [](const flutter::MethodCall<EncodableValue>& call, std::unique_ptr<Result> result) {
        if (!g) {
          result->NotImplemented();
          return;
        }
        OnMethodCall(call, std::move(result));
      });
}

void CasamaAppBrowserDetach() {
  if (!g) return;
  if (g->channel) g->channel->SetMethodCallHandler(nullptr);
  DestroyView(false);
  for (auto& r : g->wipe_results) r->Success();
  g->wipe_results.clear();
  CursorDestroy();
  if (g->host) DestroyWindow(g->host);
  delete g;
  g = nullptr;
}

void CasamaAppBrowserTopLevelMessage(HWND, UINT message, WPARAM wparam, LPARAM) {
  if (!g) return;
  switch (message) {
    case WM_SIZE:
      if (wparam == SIZE_MINIMIZED) {
        if (!g->minimized) {
          g->minimized = true;
          WindowHidden();
        }
      } else if (g->minimized && (wparam == SIZE_RESTORED || wparam == SIZE_MAXIMIZED)) {
        g->minimized = false;
        WindowShown();
      }
      break;
    case WM_ACTIVATE:
      // Coming back to the window (Alt+Tab, the taskbar), the runner puts the keyboard on
      // Flutter's view. If the person was typing into the page, it goes back there instead, or
      // their next keys would reach Flutter: Space or Enter on the focused Hand Back button would
      // hand the page back to the bot mid-sentence. Posted, so it runs after the runner's SetFocus.
      if (LOWORD(wparam) == WA_INACTIVE) {
        g->refocus_page = g->page_focused && g->overlay_visible;
      } else if (g->refocus_page) {
        g->refocus_page = false;
        if (g->host) PostMessage(g->host, kRefocusMessage, 0, 0);
      }
      break;
    case WM_DPICHANGED:
      // Posted, so it runs after the runner has resized the window for the new scale.
      if (g->host) PostMessage(g->host, kRefitMessage, 0, 0);
      break;
    case WM_SHOWWINDOW:
      if (wparam == FALSE) {
        WindowHidden();
      } else if (!g->minimized) {
        WindowShown();
      }
      break;
  }
}
