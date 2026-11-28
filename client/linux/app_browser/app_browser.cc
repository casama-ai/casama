// Native WebKitGTK 4.1 in-app browser for Linux (docs/LINUX-BROWSER-PLAN.md §4).
// Built as a separate shared library (`libcasama_app_browser.so`) loaded at runtime via
// `dlopen`, so Casama still starts cleanly on systems where WebKitGTK is not installed.

#include "app_browser_api.h"
#include "app_browser_cursor.h"

#include <cairo/cairo.h>
#include <gdk-pixbuf/gdk-pixbuf.h>
#ifdef GDK_WINDOWING_WAYLAND
#include <gdk/gdkwayland.h>
#endif
#include <glib/gstdio.h>
#include <jsc/jsc.h>
#include <limits.h>
#include <unistd.h>
#include <webkit2/webkit2.h>

#include <algorithm>
#include <cstring>
#include <map>
#include <memory>
#include <set>
#include <string>
#include <vector>

namespace {

constexpr const char* kChannelName = "casama/app_browser";
constexpr const char* kWorldName = "casama";
constexpr const char* kReplyHandlerName = "casamaReply";
constexpr int kMinWebKitMajor = 2;
constexpr int kMinWebKitMinor = 40;

struct PendingCommand {
  FlMethodCall* method_call = nullptr;
  guint timeout_id = 0;
};

struct AppBrowserState {
  GtkWindow* window = nullptr;
  GtkOverlay* overlay = nullptr;
  GtkWidget* offscreen = nullptr;  // X11 parking only (see ParkOffscreen)
  GtkWidget* cursor_area = nullptr;  // The bot's cursor, one layer above the web view
  // Wayland only: the live page in its own window, for when the person types into it. Flutter
  // draws through its own Wayland subsurface there, above anything in the GtkOverlay, so the live
  // overlay can't be seen (LINUX-BROWSER-PLAN §4.2 fallback).
  GtkWidget* page_window = nullptr;
  int park_w = 0, park_h = 0;
  // Pictures being taken; cancelled before the web view moves (a picture in flight while it
  // moved to its own window left that window blank on Wayland).
  std::set<GCancellable*> snapshots;
  FlView* fl_view = nullptr;
  FlMethodChannel* channel = nullptr;

  WebKitWebsiteDataManager* data_manager = nullptr;
  WebKitWebContext* web_context = nullptr;
  WebKitUserContentManager* content_manager = nullptr;
  GtkWidget* web_view = nullptr;

  std::string data_dir;
  std::string cache_dir;

  bool overlay_visible = false;
  GdkRectangle overlay_rect = {0, 0, 1024, 768};
  gulong overlay_pos_sig = 0;
  // The window hid the web area (minimize, hide): show it again where it was on the next map,
  // since Dart doesn't know native moved it and won't send the same rectangle again.
  bool restore_on_map = false;
  gulong window_map_sig = 0;

  // Recent navigation actions (uri -> started by a real click or form), so the main-frame
  // response check can tell Dart whether the person started it. Kept small.
  std::map<std::string, bool> recent_actions;

  std::set<std::string> approved_urls;
  guint64 command_seq = 0;
  std::map<std::string, PendingCommand> pending_commands;

  WebKitScriptDialog* active_dialog = nullptr;
  guint dialog_timeout_id = 0;
};

AppBrowserState* g_state = nullptr;


bool IsWebKitVersionSupported() {
  const guint major = webkit_get_major_version();
  const guint minor = webkit_get_minor_version();
  return major > kMinWebKitMajor ||
         (major == kMinWebKitMajor && minor >= kMinWebKitMinor);
}

std::string ExecutableDir() {
  char buf[PATH_MAX];
  ssize_t len = readlink("/proc/self/exe", buf, sizeof(buf) - 1);
  if (len <= 0) return ".";
  buf[len] = '\0';
  gchar* dir = g_path_get_dirname(buf);
  std::string out = dir ? dir : ".";
  g_free(dir);
  return out;
}

std::string ReadPageAgentScript() {
  const std::string base = ExecutableDir();
  const std::string path =
      base + "/data/flutter_assets/assets/app_browser/page_agent.js";
  gchar* contents = nullptr;
  gsize length = 0;
  if (!g_file_get_contents(path.c_str(), &contents, &length, nullptr)) {
    return "";
  }
  std::string out(contents, length);
  g_free(contents);
  return out;
}

std::string EscapeJsString(const std::string& in) {
  std::string out;
  out.reserve(in.size() + 16);
  for (unsigned char c : in) {
    switch (c) {
      case '\\':
        out += "\\\\";
        break;
      case '"':
        out += "\\\"";
        break;
      case '\n':
        out += "\\n";
        break;
      case '\r':
        out += "\\r";
        break;
      case '\t':
        out += "\\t";
        break;
      case '<':
        out += "\\u003c";
        break;
      case '>':
        out += "\\u003e";
        break;
      default:
        if (c < 0x20) {
          char hex[8];
          g_snprintf(hex, sizeof(hex), "\\u%04x", c);
          out += hex;
        } else {
          out.push_back(static_cast<char>(c));
        }
        break;
    }
  }
  return out;
}

void RemoveTree(const std::string& path) {
  if (path.empty()) return;
  if (g_file_test(path.c_str(), G_FILE_TEST_IS_SYMLINK)) {
    g_unlink(path.c_str());
    return;
  }
  if (!g_file_test(path.c_str(), G_FILE_TEST_IS_DIR)) {
    g_unlink(path.c_str());
    return;
  }
  GDir* dir = g_dir_open(path.c_str(), 0, nullptr);
  if (dir) {
    const gchar* name = nullptr;
    while ((name = g_dir_read_name(dir)) != nullptr) {
      RemoveTree(path + "/" + name);
    }
    g_dir_close(dir);
  }
  g_rmdir(path.c_str());
}

void RespondNull(FlMethodCall* call) {
  g_autoptr(FlValue) v = fl_value_new_null();
  fl_method_call_respond_success(call, v, nullptr);
}

void RespondError(FlMethodCall* call, const char* code, const char* message) {
  fl_method_call_respond_error(call, code, message, nullptr, nullptr);
}

void RespondString(FlMethodCall* call, const std::string& s) {
  g_autoptr(FlValue) v = fl_value_new_string(s.c_str());
  fl_method_call_respond_success(call, v, nullptr);
}

void InvokeDart(const char* method, FlValue* args = nullptr) {
  if (!g_state || !g_state->channel) {
    if (args) fl_value_unref(args);
    return;
  }
  fl_method_channel_invoke_method(g_state->channel, method, args, nullptr,
                                  nullptr, nullptr);
  if (args) fl_value_unref(args);
}

void CloseActiveDialog(bool accept, const char* text) {
  if (!g_state) return;
  if (g_state->dialog_timeout_id != 0) {
    g_source_remove(g_state->dialog_timeout_id);
    g_state->dialog_timeout_id = 0;
  }
  if (!g_state->active_dialog) return;
  WebKitScriptDialog* d = g_state->active_dialog;
  g_state->active_dialog = nullptr;
  const WebKitScriptDialogType type = webkit_script_dialog_get_dialog_type(d);
  if (type == WEBKIT_SCRIPT_DIALOG_CONFIRM ||
      type == WEBKIT_SCRIPT_DIALOG_BEFORE_UNLOAD_CONFIRM) {
    webkit_script_dialog_confirm_set_confirmed(d, accept ? TRUE : FALSE);
  } else if (type == WEBKIT_SCRIPT_DIALOG_PROMPT) {
    webkit_script_dialog_prompt_set_text(d, accept ? (text ? text : "") : nullptr);
  }
  webkit_script_dialog_close(d);
  webkit_script_dialog_unref(d);
}

gboolean OnDialogTimeout(gpointer) {
  if (g_state) {
    g_state->dialog_timeout_id = 0;
    CloseActiveDialog(false, nullptr);
  }
  return G_SOURCE_REMOVE;
}

void CompletePendingCommand(const std::string& id, const std::string& json) {
  if (!g_state) return;
  auto it = g_state->pending_commands.find(id);
  if (it == g_state->pending_commands.end()) return;
  PendingCommand pc = it->second;
  g_state->pending_commands.erase(it);
  if (pc.timeout_id != 0) g_source_remove(pc.timeout_id);
  if (pc.method_call) {
    RespondString(pc.method_call, json);
    g_object_unref(pc.method_call);
  }
}

void CancelAllPendingCommands() {
  if (!g_state) return;
  auto pending = std::move(g_state->pending_commands);
  g_state->pending_commands.clear();
  for (auto& kv : pending) {
    if (kv.second.timeout_id != 0) g_source_remove(kv.second.timeout_id);
    if (kv.second.method_call) {
      RespondString(
          kv.second.method_call,
          "{\"ok\":false,\"code\":\"error\",\"message\":\"The browser was closed\"}");
      g_object_unref(kv.second.method_call);
    }
  }
}

struct CommandTimeoutCtx {
  std::string id;
};

gboolean OnCommandTimeout(gpointer user_data) {
  std::unique_ptr<CommandTimeoutCtx> ctx(
      static_cast<CommandTimeoutCtx*>(user_data));
  if (g_state) {
    auto it = g_state->pending_commands.find(ctx->id);
    if (it != g_state->pending_commands.end()) {
      it->second.timeout_id = 0;
    }
    CompletePendingCommand(
        ctx->id,
        "{\"ok\":false,\"code\":\"error\",\"message\":\"The page didn't answer in time\"}");
  }
  return G_SOURCE_REMOVE;
}

// Handles JSON replies posted from our isolated `casama` script world:
// `{"id":"<seq>","json":"<page-agent JSON string>"}` -> simpler format:
// `<seq>\n<page-agent JSON string>` (avoids nested JSON parsing in C).
void OnScriptMessage(WebKitUserContentManager*,
                     WebKitJavascriptResult* js_result,
                     gpointer) {
  if (!g_state || !js_result) return;
  JSCValue* value = webkit_javascript_result_get_js_value(js_result);
  if (!value || !jsc_value_is_string(value)) return;
  gchar* raw = jsc_value_to_string(value);
  if (!raw) return;
  std::string msg(raw);
  g_free(raw);
  const size_t sep = msg.find('\n');
  if (sep == std::string::npos) return;
  const std::string id = msg.substr(0, sep);
  const std::string payload = msg.substr(sep + 1);
  CompletePendingCommand(id, payload);
}

// --- Navigation policy & load events ----------------------------------------

struct NavPolicyCtx {
  WebKitPolicyDecision* decision = nullptr;
};

void OnNavigateReply(GObject* source, GAsyncResult* res, gpointer user_data) {
  std::unique_ptr<NavPolicyCtx> ctx(static_cast<NavPolicyCtx*>(user_data));
  g_autoptr(GError) error = nullptr;
  g_autoptr(FlMethodResponse) response = fl_method_channel_invoke_method_finish(
      FL_METHOD_CHANNEL(source), res, &error);
  bool allow = false;
  if (response && FL_IS_METHOD_SUCCESS_RESPONSE(response)) {
    FlValue* val = fl_method_success_response_get_result(
        FL_METHOD_SUCCESS_RESPONSE(response));
    if (val && fl_value_get_type(val) == FL_VALUE_TYPE_BOOL &&
        fl_value_get_bool(val)) {
      allow = true;
    }
  }
  if (ctx->decision) {
    if (allow) {
      webkit_policy_decision_use(ctx->decision);
    } else {
      webkit_policy_decision_ignore(ctx->decision);
    }
    g_object_unref(ctx->decision);
  }
}

void RememberAction(const std::string& uri, bool user) {
  if (!g_state) return;
  if (g_state->recent_actions.size() > 64) g_state->recent_actions.clear();
  g_state->recent_actions[uri] = user;
}

// WebKitGTK 4.1 can't tell a main-frame navigation action from an iframe's (the frame name is
// always NULL), so the site check runs on the response instead, where
// `is_main_frame_main_resource` can. Iframes (ads, embeds, payment frames) load without asking
// Dart, as on iPhone and Mac. The final address after redirects is what gets checked, and
// `landed` (main-frame commit) stays as the backstop.
gboolean OnDecidePolicy(WebKitWebView* web_view,
                        WebKitPolicyDecision* decision,
                        WebKitPolicyDecisionType type,
                        gpointer) {
  if (!g_state) return FALSE;
  if (type == WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION) {
    auto* nav = WEBKIT_NAVIGATION_POLICY_DECISION(decision);
    WebKitNavigationAction* action =
        webkit_navigation_policy_decision_get_navigation_action(nav);
    WebKitURIRequest* req =
        action ? webkit_navigation_action_get_request(action) : nullptr;
    const char* uri = req ? webkit_uri_request_get_uri(req) : nullptr;
    webkit_policy_decision_ignore(decision);
    if (uri && *uri) {
      // A new window opens in place, as a navigation of the main frame.
      const WebKitNavigationType nav_type =
          webkit_navigation_action_get_navigation_type(action);
      RememberAction(uri, nav_type == WEBKIT_NAVIGATION_TYPE_LINK_CLICKED ||
                              webkit_navigation_action_is_user_gesture(action));
      webkit_web_view_load_uri(web_view, uri);
    }
    return TRUE;
  }
  if (type == WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION) {
    auto* nav = WEBKIT_NAVIGATION_POLICY_DECISION(decision);
    WebKitNavigationAction* action =
        webkit_navigation_policy_decision_get_navigation_action(nav);
    WebKitURIRequest* req =
        action ? webkit_navigation_action_get_request(action) : nullptr;
    const char* uri_c = req ? webkit_uri_request_get_uri(req) : nullptr;
    if (uri_c && *uri_c) {
      const WebKitNavigationType nav_type =
          webkit_navigation_action_get_navigation_type(action);
      RememberAction(uri_c, nav_type == WEBKIT_NAVIGATION_TYPE_LINK_CLICKED ||
                                nav_type == WEBKIT_NAVIGATION_TYPE_FORM_SUBMITTED ||
                                nav_type == WEBKIT_NAVIGATION_TYPE_FORM_RESUBMITTED);
    }
    webkit_policy_decision_use(decision);
    return TRUE;
  }
  if (type != WEBKIT_POLICY_DECISION_TYPE_RESPONSE) return FALSE;

  auto* resp = WEBKIT_RESPONSE_POLICY_DECISION(decision);
  // Never save files on the person's computer: what WebKit can't show isn't loaded at all
  // (the page script's `download` command fetches files itself, within its cap).
  if (!webkit_response_policy_decision_is_mime_type_supported(resp)) {
    webkit_policy_decision_ignore(decision);
    return TRUE;
  }
  if (!webkit_response_policy_decision_is_main_frame_main_resource(resp)) {
    webkit_policy_decision_use(decision);
    return TRUE;
  }
  WebKitURIRequest* req = webkit_response_policy_decision_get_request(resp);
  const char* uri_c = req ? webkit_uri_request_get_uri(req) : nullptr;
  if (!uri_c || !*uri_c) {
    webkit_policy_decision_use(decision);
    return TRUE;
  }
  std::string uri(uri_c);
  if (uri == "about:blank") {
    webkit_policy_decision_use(decision);
    return TRUE;
  }
  auto approved = g_state->approved_urls.find(uri);
  if (approved != g_state->approved_urls.end()) {
    g_state->approved_urls.erase(approved);
    g_state->recent_actions.erase(uri);
    webkit_policy_decision_use(decision);
    return TRUE;
  }
  bool user_initiated = false;
  bool is_redirect = true;
  auto action = g_state->recent_actions.find(uri);
  if (action != g_state->recent_actions.end()) {
    user_initiated = action->second;
    is_redirect = false;
    g_state->recent_actions.erase(action);
  }

  FlValue* args = fl_value_new_map();
  fl_value_set_string_take(args, "url", fl_value_new_string(uri.c_str()));
  fl_value_set_string_take(args, "redirect", fl_value_new_bool(is_redirect));
  fl_value_set_string_take(args, "user", fl_value_new_bool(user_initiated));

  auto* ctx = new NavPolicyCtx();
  ctx->decision = WEBKIT_POLICY_DECISION(g_object_ref(decision));
  fl_method_channel_invoke_method(g_state->channel, "navigate", args, nullptr,
                                  OnNavigateReply, ctx);
  fl_value_unref(args);
  return TRUE;
}

// A download can still start without a response decision (an <a download> click): stop it.
void OnDownloadStarted(WebKitWebContext*, WebKitDownload* download, gpointer) {
  webkit_download_cancel(download);
}

void OnLandedReply(GObject* source, GAsyncResult* res, gpointer) {
  g_autoptr(GError) error = nullptr;
  g_autoptr(FlMethodResponse) response = fl_method_channel_invoke_method_finish(
      FL_METHOD_CHANNEL(source), res, &error);
  bool allow = false;
  if (response && FL_IS_METHOD_SUCCESS_RESPONSE(response)) {
    FlValue* val = fl_method_success_response_get_result(
        FL_METHOD_SUCCESS_RESPONSE(response));
    if (val && fl_value_get_type(val) == FL_VALUE_TYPE_BOOL &&
        fl_value_get_bool(val)) {
      allow = true;
    }
  }
  if (!allow && g_state && g_state->web_view) {
    WebKitWebView* w = WEBKIT_WEB_VIEW(g_state->web_view);
    webkit_web_view_stop_loading(w);
    webkit_web_view_load_uri(w, "about:blank");
  }
}

// The address or title changed without a page load (a site that changes its address in place, or
// a #fragment): Dart's address bar and the bots' page facts follow it.
void OnAddressChanged(WebKitWebView* web_view, GParamSpec*, gpointer) {
  if (!g_state || !g_state->channel) return;
  const char* uri = webkit_web_view_get_uri(web_view);
  if (!uri || !*uri || std::strcmp(uri, "about:blank") == 0) return;
  const char* title = webkit_web_view_get_title(web_view);
  FlValue* args = fl_value_new_map();
  fl_value_set_string_take(args, "url", fl_value_new_string(uri));
  fl_value_set_string_take(args, "title", fl_value_new_string(title ? title : ""));
  InvokeDart("urlChanged", args);
}

void OnLoadChanged(WebKitWebView* web_view,
                   WebKitLoadEvent event,
                   gpointer) {
  if (!g_state || !g_state->channel) return;
  const char* uri = webkit_web_view_get_uri(web_view);
  const char* safe_uri = uri ? uri : "";
  if (event == WEBKIT_LOAD_STARTED) {
    FlValue* args = fl_value_new_map();
    fl_value_set_string_take(args, "url", fl_value_new_string(safe_uri));
    InvokeDart("pageStarted", args);
  } else if (event == WEBKIT_LOAD_COMMITTED) {
    if (*safe_uri && std::strcmp(safe_uri, "about:blank") != 0) {
      FlValue* args = fl_value_new_map();
      fl_value_set_string_take(args, "url", fl_value_new_string(safe_uri));
      fl_method_channel_invoke_method(g_state->channel, "landed", args, nullptr,
                                      OnLandedReply, nullptr);
      fl_value_unref(args);
    }
  } else if (event == WEBKIT_LOAD_FINISHED) {
    const char* title = webkit_web_view_get_title(web_view);
    // The page's own window (Wayland) is named after the page it shows now.
    if (g_state->page_window) {
      gtk_window_set_title(GTK_WINDOW(g_state->page_window),
                           title && *title ? title : (*safe_uri ? safe_uri : "Casama"));
    }
    FlValue* args = fl_value_new_map();
    fl_value_set_string_take(args, "url", fl_value_new_string(safe_uri));
    fl_value_set_string_take(args, "title",
                             fl_value_new_string(title ? title : ""));
    InvokeDart("pageFinished", args);
  }
}

void OnWebProcessTerminated(WebKitWebView*,
                            WebKitWebProcessTerminationReason,
                            gpointer) {
  FlValue* args = fl_value_new_map();
  fl_value_set_string_take(args, "reason", fl_value_new_string("killed"));
  InvokeDart("gone", args);
}

gboolean OnScriptDialog(WebKitWebView*,
                        WebKitScriptDialog* dialog,
                        gpointer) {
  if (!g_state || !dialog) return FALSE;
  CloseActiveDialog(false, nullptr);
  const WebKitScriptDialogType type =
      webkit_script_dialog_get_dialog_type(dialog);
  const char* kind = "alert";
  if (type == WEBKIT_SCRIPT_DIALOG_CONFIRM ||
      type == WEBKIT_SCRIPT_DIALOG_BEFORE_UNLOAD_CONFIRM) {
    kind = "confirm";
  } else if (type == WEBKIT_SCRIPT_DIALOG_PROMPT) {
    kind = "prompt";
  }
  const char* message = webkit_script_dialog_get_message(dialog);
  g_state->active_dialog = webkit_script_dialog_ref(dialog);
  g_state->dialog_timeout_id = g_timeout_add_seconds(60, OnDialogTimeout, nullptr);

  FlValue* args = fl_value_new_map();
  fl_value_set_string_take(args, "kind", fl_value_new_string(kind));
  fl_value_set_string_take(args, "message",
                           fl_value_new_string(message ? message : ""));
  InvokeDart("dialog", args);
  return TRUE;
}

gboolean OnUserInput(GtkWidget*, GdkEvent*, gpointer) {
  InvokeDart("userTouched");
  return FALSE;
}

// --- Overlay placement & offscreen parking (§4.2, §4.3) ---------------------

// Where the web view waits while no Flutter screen shows it, still rendering (snapshots, page
// timers) but never seen or clicked:
// - Wayland: an overlay child far outside the window. A GtkOffscreenWindow can't be used there:
//   WebKit inside one aborts the process ("GDK is not able to create a GL context").
// - X11: a GtkOffscreenWindow. Off-window overlay children aren't painted on X11, so a snapshot
//   of one never completes.
constexpr GdkRectangle kParkedRect = {-32000, -32000, 1024, 768};

// The parked page's size: the size of the area that shows its picture (so the picture and the
// cursor drawn over it match the page 1:1), else 1024x768.
GdkRectangle ParkedRect() {
  GdkRectangle r = kParkedRect;
  if (g_state && g_state->park_w > 1 && g_state->park_h > 1) {
    r.width = g_state->park_w;
    r.height = g_state->park_h;
  }
  return r;
}

bool IsWayland() {
#ifdef GDK_WINDOWING_WAYLAND
  return GDK_IS_WAYLAND_DISPLAY(gdk_display_get_default());
#else
  return false;
#endif
}

gboolean OnOverlayChildPosition(GtkOverlay*,
                                GtkWidget* widget,
                                GdkRectangle* allocation,
                                gpointer user_data) {
  auto* s = static_cast<AppBrowserState*>(user_data);
  if (!s || (widget != s->web_view && widget != s->cursor_area)) return FALSE;
  *allocation = s->overlay_visible ? s->overlay_rect : ParkedRect();
  return TRUE;
}

void CancelSnapshots() {
  if (!g_state) return;
  for (GCancellable* c : g_state->snapshots) g_cancellable_cancel(c);
}

void AddToOverlay() {
  GtkWidget* parent = gtk_widget_get_parent(g_state->web_view);
  if (parent == GTK_WIDGET(g_state->overlay)) return;
  CancelSnapshots();
  g_object_ref(g_state->web_view);
  if (parent) gtk_container_remove(GTK_CONTAINER(parent), g_state->web_view);
  gtk_overlay_add_overlay(g_state->overlay, g_state->web_view);
  g_object_unref(g_state->web_view);
}

void HoldInPageWindow();

void ParkOffscreen() {
  if (!g_state || !g_state->web_view || !g_state->overlay) return;
  CursorSetShown(false);
  if (!IsWayland()) {
    if (!g_state->offscreen) {
      g_state->offscreen = gtk_offscreen_window_new();
      gtk_window_set_default_size(GTK_WINDOW(g_state->offscreen), ParkedRect().width,
                                  ParkedRect().height);
    }
    GtkWidget* parent = gtk_widget_get_parent(g_state->web_view);
    if (parent != g_state->offscreen) {
      CancelSnapshots();
      g_object_ref(g_state->web_view);
      if (parent) gtk_container_remove(GTK_CONTAINER(parent), g_state->web_view);
      gtk_container_add(GTK_CONTAINER(g_state->offscreen), g_state->web_view);
      g_object_unref(g_state->web_view);
    }
    gtk_widget_set_size_request(g_state->web_view, ParkedRect().width, ParkedRect().height);
    gtk_window_resize(GTK_WINDOW(g_state->offscreen), ParkedRect().width, ParkedRect().height);
    gtk_widget_show_all(g_state->offscreen);
    return;
  }
  // Wayland: the page lives in its own window from the start, hidden but realized, sized like
  // the area that shows its picture. It never moves between windows: moving a web view to a new
  // toplevel there could leave it blank once it had moved a few times.
  HoldInPageWindow();
}

void PlaceInOverlay(const GdkRectangle& rect) {
  if (!g_state || !g_state->web_view || !g_state->overlay) return;
  g_state->overlay_rect = rect;
  g_state->overlay_visible = true;
  AddToOverlay();
  CursorRaise(g_state->overlay);
  CursorSetShown(true);
  gtk_widget_set_size_request(g_state->web_view, rect.width, rect.height);
  gtk_widget_show(g_state->web_view);
  gtk_widget_queue_resize(GTK_WIDGET(g_state->overlay));
}

void HideOverlay() {
  if (!g_state) return;
  g_state->overlay_visible = false;
  CursorSetShown(false);
  if (g_state->web_view) {
    ParkOffscreen();
  }
  if (g_state->fl_view) {
    gtk_widget_grab_focus(GTK_WIDGET(g_state->fl_view));
  }
}

// --- The page in its own window (Wayland) -------------------------------------

gboolean OnPageWindowDelete(GtkWidget*, GdkEvent*, gpointer) {
  // Closing it hides it; the page stays in it (and keeps its state). Dart hears of it.
  if (g_state && g_state->page_window) gtk_widget_hide(g_state->page_window);
  InvokeDart("pageWindowClosed");
  return TRUE;
}

bool PageWindowShown() {
  return g_state && g_state->page_window && gtk_widget_get_visible(g_state->page_window);
}

void HoldInPageWindow() {
  if (!g_state || !g_state->web_view) return;
  if (!g_state->page_window) {
    g_state->page_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_transient_for(GTK_WINDOW(g_state->page_window), g_state->window);
    gtk_window_set_default_size(GTK_WINDOW(g_state->page_window), ParkedRect().width,
                                ParkedRect().height);
    g_signal_connect(g_state->page_window, "delete-event", G_CALLBACK(OnPageWindowDelete),
                     nullptr);
  }
  GtkWidget* parent = gtk_widget_get_parent(g_state->web_view);
  if (parent != g_state->page_window) {
    CancelSnapshots();
    g_object_ref(g_state->web_view);
    if (parent) gtk_container_remove(GTK_CONTAINER(parent), g_state->web_view);
    gtk_container_add(GTK_CONTAINER(g_state->page_window), g_state->web_view);
    g_object_unref(g_state->web_view);
  }
  gtk_widget_set_size_request(g_state->web_view, -1, -1);
  // A hidden toplevel keeps its first size until it is shown again (GTK lays it out only then),
  // so the page may not match the area showing its picture: `url` reports the page's size and
  // the app fits the picture and the cursor to it.
  if (!PageWindowShown()) {
    gtk_window_resize(GTK_WINDOW(g_state->page_window), ParkedRect().width, ParkedRect().height);
  }
  gtk_widget_show(g_state->web_view);
  gtk_widget_realize(g_state->page_window);
  if (!PageWindowShown()) {
    // Lay the hidden window out at the area's size ourselves, so after Hand Back the page goes
    // back to the panel's size instead of keeping the page window's.
    GtkAllocation a = {0, 0, ParkedRect().width, ParkedRect().height};
    gtk_widget_size_allocate(g_state->page_window, &a);
  }

}

void OpenPageWindow(const char* title) {
  if (!g_state || !g_state->web_view) return;
  CursorSetShown(false);
  g_state->overlay_visible = false;
  HoldInPageWindow();
  gtk_window_set_title(GTK_WINDOW(g_state->page_window), title && *title ? title : "Casama");
  gtk_widget_set_size_request(g_state->web_view, -1, -1);
  gtk_window_resize(GTK_WINDOW(g_state->page_window), 1024, 768);
  gtk_widget_show_all(g_state->page_window);
  gtk_window_present(GTK_WINDOW(g_state->page_window));
  gtk_widget_grab_focus(g_state->web_view);
}

void ClosePageWindow() {
  if (!g_state || !g_state->page_window) return;
  gtk_widget_hide(g_state->page_window);
  HoldInPageWindow();
}

// --- WebKit lifecycle -------------------------------------------------------

WebKitWebView* EnsureWebView() {
  if (!g_state || !IsWebKitVersionSupported()) return nullptr;
  if (g_state->web_view) return WEBKIT_WEB_VIEW(g_state->web_view);

  g_mkdir_with_parents(g_state->data_dir.c_str(), 0700);
  g_mkdir_with_parents(g_state->cache_dir.c_str(), 0700);

  g_state->data_manager = webkit_website_data_manager_new(
      "base-data-directory", g_state->data_dir.c_str(),
      "base-cache-directory", g_state->cache_dir.c_str(),
      nullptr);
  g_state->web_context =
      webkit_web_context_new_with_website_data_manager(g_state->data_manager);
  g_signal_connect(g_state->web_context, "download-started",
                   G_CALLBACK(OnDownloadStarted), nullptr);

  // Enable WebKit's process sandbox when bwrap is present, unless explicitly
  // disabled via CASAMA_WEBKIT_SANDBOX=0 (for snap/spike testing, §4.1).
  const char* sandbox_env = g_getenv("CASAMA_WEBKIT_SANDBOX");
  if (!sandbox_env || std::strcmp(sandbox_env, "0") != 0) {
    gchar* bwrap = g_find_program_in_path("bwrap");
    if (bwrap) {
      webkit_web_context_set_sandbox_enabled(g_state->web_context, TRUE);
      g_free(bwrap);
    }
  }

  g_state->content_manager = webkit_user_content_manager_new();
  webkit_user_content_manager_register_script_message_handler_in_world(
      g_state->content_manager, kReplyHandlerName, kWorldName);
  g_signal_connect(g_state->content_manager,
                   "script-message-received::casamaReply",
                   G_CALLBACK(OnScriptMessage), nullptr);

  const std::string script_body = ReadPageAgentScript();
  if (!script_body.empty()) {
    gchar* uuid = g_uuid_string_random();
    std::string full_source =
        std::string("globalThis.__casamaPageAgentConfig={secret:\"") +
        (uuid ? uuid : "") + "\"};\n" + script_body;
    g_free(uuid);
    WebKitUserScript* user_script = webkit_user_script_new_for_world(
        full_source.c_str(), WEBKIT_USER_CONTENT_INJECT_ALL_FRAMES,
        WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_START, kWorldName, nullptr,
        nullptr);
    webkit_user_content_manager_add_script(g_state->content_manager,
                                           user_script);
    webkit_user_script_unref(user_script);
  }

  g_state->web_view = GTK_WIDGET(g_object_new(
      WEBKIT_TYPE_WEB_VIEW,
      "web-context", g_state->web_context,
      "user-content-manager", g_state->content_manager,
      nullptr));

  WebKitWebView* web = WEBKIT_WEB_VIEW(g_state->web_view);
  WebKitSettings* settings = webkit_web_view_get_settings(web);
  webkit_settings_set_javascript_can_open_windows_automatically(settings,
                                                                FALSE);
  webkit_settings_set_media_playback_requires_user_gesture(settings, TRUE);
#ifndef NDEBUG
  webkit_settings_set_enable_developer_extras(settings, TRUE);
#endif

  g_signal_connect(web, "decide-policy", G_CALLBACK(OnDecidePolicy), nullptr);
  g_signal_connect(web, "load-changed", G_CALLBACK(OnLoadChanged), nullptr);
  g_signal_connect(web, "notify::uri", G_CALLBACK(OnAddressChanged), nullptr);
  g_signal_connect(web, "notify::title", G_CALLBACK(OnAddressChanged), nullptr);
  g_signal_connect(web, "web-process-terminated",
                   G_CALLBACK(OnWebProcessTerminated), nullptr);
  g_signal_connect(web, "script-dialog", G_CALLBACK(OnScriptDialog), nullptr);

  gtk_widget_add_events(g_state->web_view,
                        GDK_BUTTON_PRESS_MASK | GDK_KEY_PRESS_MASK |
                            GDK_SCROLL_MASK | GDK_TOUCH_MASK);
  g_signal_connect(g_state->web_view, "button-press-event",
                   G_CALLBACK(OnUserInput), nullptr);
  g_signal_connect(g_state->web_view, "key-press-event",
                   G_CALLBACK(OnUserInput), nullptr);
  g_signal_connect(g_state->web_view, "scroll-event",
                   G_CALLBACK(OnUserInput), nullptr);
  g_signal_connect(g_state->web_view, "touch-event",
                   G_CALLBACK(OnUserInput), nullptr);

  if (g_state->overlay_visible) {
    PlaceInOverlay(g_state->overlay_rect);
  } else {
    ParkOffscreen();
  }
  return web;
}

void DestroyWebViewAndContext(bool wipe_data) {
  if (!g_state) return;
  CloseActiveDialog(false, nullptr);
  CancelAllPendingCommands();
  g_state->overlay_visible = false;
  g_state->restore_on_map = false;
  CursorSet(CursorTarget{});
  CursorSetShown(false);
  g_state->approved_urls.clear();
  g_state->recent_actions.clear();

  if (g_state->web_view) {
    GtkWidget* parent = gtk_widget_get_parent(g_state->web_view);
    if (parent) {
      gtk_container_remove(GTK_CONTAINER(parent), g_state->web_view);
    } else {
      gtk_widget_destroy(g_state->web_view);
    }
    g_state->web_view = nullptr;
  }
  if (g_state->offscreen) {
    gtk_widget_destroy(g_state->offscreen);
    g_state->offscreen = nullptr;
  }
  if (g_state->page_window) {
    gtk_widget_destroy(g_state->page_window);
    g_state->page_window = nullptr;
  }
  g_clear_object(&g_state->content_manager);
  g_clear_object(&g_state->web_context);
  g_clear_object(&g_state->data_manager);

  if (wipe_data) {
    RemoveTree(g_state->data_dir);
    RemoveTree(g_state->cache_dir);
  }
}

// --- Screenshot -------------------------------------------------------------

struct SnapshotCtx {
  FlMethodCall* call = nullptr;
  int quality = 70;
  GCancellable* cancellable = nullptr;
  guint timeout_id = 0;
  ~SnapshotCtx() {
    if (timeout_id != 0) g_source_remove(timeout_id);
    if (g_state && cancellable) g_state->snapshots.erase(cancellable);
    g_clear_object(&cancellable);
  }
};

// A snapshot that never completes (a view WebKit doesn't paint) must not leave Dart waiting
// forever: the chat card would stop refreshing.
gboolean OnSnapshotTimeout(gpointer user_data) {
  auto* ctx = static_cast<SnapshotCtx*>(user_data);
  ctx->timeout_id = 0;
  g_cancellable_cancel(ctx->cancellable);
  return G_SOURCE_REMOVE;
}

void OnSnapshotReady(GObject* source, GAsyncResult* res, gpointer user_data) {
  std::unique_ptr<SnapshotCtx> ctx(static_cast<SnapshotCtx*>(user_data));
  g_autoptr(GError) error = nullptr;
  cairo_surface_t* surface = webkit_web_view_get_snapshot_finish(
      WEBKIT_WEB_VIEW(source), res, &error);
  if (!surface) {
    RespondError(ctx->call, "failed",
                 error ? error->message : "Snapshot failed");
    g_object_unref(ctx->call);
    return;
  }
  const int w = cairo_image_surface_get_width(surface);
  const int h = cairo_image_surface_get_height(surface);
  // JPEG has no alpha, and newer gdk-pixbuf (glycin) loaders refuse to encode RGBA, so
  // paint the snapshot onto an opaque white RGB24 surface, scaled to at most 1024 wide.
  GdkPixbuf* pixbuf = nullptr;
  if (w > 0 && h > 0) {
    const int out_w = std::min(w, 1024);
    const int out_h = std::max(1, (h * out_w) / w);
    cairo_surface_t* flat =
        cairo_image_surface_create(CAIRO_FORMAT_RGB24, out_w, out_h);
    cairo_t* cr = cairo_create(flat);
    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);
    cairo_scale(cr, static_cast<double>(out_w) / w,
                static_cast<double>(out_h) / h);
    cairo_set_source_surface(cr, surface, 0, 0);
    cairo_pattern_set_filter(cairo_get_source(cr), CAIRO_FILTER_GOOD);
    cairo_paint(cr);
    cairo_destroy(cr);
    cairo_surface_flush(flat);
    pixbuf = gdk_pixbuf_get_from_surface(flat, 0, 0, out_w, out_h);
    cairo_surface_destroy(flat);
  }
  cairo_surface_destroy(surface);
  if (!pixbuf) {
    RespondError(ctx->call, "failed", "Could not read snapshot pixels");
    g_object_unref(ctx->call);
    return;
  }
  gchar* buf = nullptr;
  gsize len = 0;
  char q_str[8];
  g_snprintf(q_str, sizeof(q_str), "%d", std::min(95, std::max(30, ctx->quality)));
  g_autoptr(GError) save_err = nullptr;
  const gboolean saved = gdk_pixbuf_save_to_buffer(
      pixbuf, &buf, &len, "jpeg", &save_err, "quality", q_str, nullptr);
  g_object_unref(pixbuf);
  if (!saved || !buf) {
    RespondError(ctx->call, "failed",
                 save_err ? save_err->message : "JPEG encode failed");
    g_object_unref(ctx->call);
    return;
  }
  gchar* b64 = g_base64_encode(reinterpret_cast<const guchar*>(buf), len);
  g_free(buf);
  g_autoptr(FlValue) out = fl_value_new_map();
  fl_value_set_string_take(out, "data", fl_value_new_string(b64 ? b64 : ""));
  g_free(b64);
  fl_method_call_respond_success(ctx->call, out, nullptr);
  g_object_unref(ctx->call);
}

// --- Clear Data -------------------------------------------------------------

struct ClearDataCtx {
  FlMethodCall* call = nullptr;
  std::string host;
};

void OnClearDataDone(GObject*, GAsyncResult*, gpointer user_data) {
  std::unique_ptr<ClearDataCtx> ctx(static_cast<ClearDataCtx*>(user_data));
  RespondNull(ctx->call);
  g_object_unref(ctx->call);
}

void OnFetchWebsiteData(GObject* source, GAsyncResult* res, gpointer user_data) {
  std::unique_ptr<ClearDataCtx> ctx(static_cast<ClearDataCtx*>(user_data));
  auto* dm = WEBKIT_WEBSITE_DATA_MANAGER(source);
  GList* list = webkit_website_data_manager_fetch_finish(dm, res, nullptr);
  GList* matching = nullptr;
  const std::string suffix = "." + ctx->host;
  for (GList* it = list; it != nullptr; it = it->next) {
    auto* data = static_cast<WebKitWebsiteData*>(it->data);
    const char* name_c = webkit_website_data_get_name(data);
    if (!name_c) continue;
    std::string name(name_c);
    if (name == ctx->host ||
        (name.size() > suffix.size() &&
         name.compare(name.size() - suffix.size(), suffix.size(), suffix) == 0)) {
      matching = g_list_prepend(matching, webkit_website_data_ref(data));
    }
  }
  g_list_free_full(list, reinterpret_cast<GDestroyNotify>(webkit_website_data_unref));
  if (!matching) {
    RespondNull(ctx->call);
    g_object_unref(ctx->call);
    return;
  }
  webkit_website_data_manager_remove(dm, WEBKIT_WEBSITE_DATA_ALL, matching,
                                     nullptr, OnClearDataDone, ctx.release());
  g_list_free_full(matching,
                   reinterpret_cast<GDestroyNotify>(webkit_website_data_unref));
}

// --- Evaluate page-agent command --------------------------------------------

void OnEvalDone(GObject* source, GAsyncResult* res, gpointer user_data) {
  std::unique_ptr<std::string> id(static_cast<std::string*>(user_data));
  g_autoptr(GError) error = nullptr;
  JSCValue* val = webkit_web_view_evaluate_javascript_finish(
      WEBKIT_WEB_VIEW(source), res, &error);
  if (val) g_object_unref(val);
  if (error) {
    const std::string escaped = EscapeJsString(error->message ? error->message : "Script error");
    CompletePendingCommand(
        *id, "{\"ok\":false,\"code\":\"error\",\"message\":\"" + escaped + "\"}");
  }
}

void HandleCommand(FlMethodCall* call, FlValue* args) {
  if (!g_state || !g_state->web_view) {
    RespondString(call, "{\"ok\":false,\"code\":\"error\",\"message\":\"No page is open\"}");
    return;
  }
  FlValue* json_v = args ? fl_value_lookup_string(args, "json") : nullptr;
  const char* json_c =
      (json_v && fl_value_get_type(json_v) == FL_VALUE_TYPE_STRING)
          ? fl_value_get_string(json_v)
          : "{}";
  FlValue* timeout_v = args ? fl_value_lookup_string(args, "timeout_ms") : nullptr;
  int timeout_ms = 30000;
  if (timeout_v && fl_value_get_type(timeout_v) == FL_VALUE_TYPE_INT) {
    timeout_ms = std::max(1000, static_cast<int>(fl_value_get_int(timeout_v)));
  }

  const std::string call_id = "k" + std::to_string(++g_state->command_seq);
  PendingCommand pc;
  pc.method_call = FL_METHOD_CALL(g_object_ref(call));
  auto* tctx = new CommandTimeoutCtx{call_id};
  pc.timeout_id = g_timeout_add(static_cast<guint>(timeout_ms), OnCommandTimeout, tctx);
  g_state->pending_commands[call_id] = pc;

  const std::string escaped_json = EscapeJsString(json_c);
  const std::string script =
      "void (async () => {"
      "  const post = (s) => window.webkit.messageHandlers.casamaReply.postMessage('" +
      call_id + "\\n' + s);"
      "  try {"
      "    const a = globalThis.__casamaPageAgent;"
      "    if (!a) { post(JSON.stringify({ok:false,code:'error',message:'The page is not ready yet'})); return; }"
      "    const r = await a.handle(JSON.parse(\"" + escaped_json + "\"));"
      "    post(JSON.stringify(r));"
      "  } catch (e) {"
      "    post(JSON.stringify({ok:false,code:'error',message:String(e && e.message || e)}));"
      "  }"
      "})();";

  webkit_web_view_evaluate_javascript(
      WEBKIT_WEB_VIEW(g_state->web_view), script.c_str(),
      static_cast<gssize>(script.size()), kWorldName, nullptr, nullptr,
      OnEvalDone, new std::string(call_id));
}

// --- MethodChannel dispatch -------------------------------------------------

double GetDoubleArg(FlValue* map, const char* key, double fallback) {
  if (!map || fl_value_get_type(map) != FL_VALUE_TYPE_MAP) return fallback;
  FlValue* v = fl_value_lookup_string(map, key);
  if (!v) return fallback;
  if (fl_value_get_type(v) == FL_VALUE_TYPE_FLOAT) return fl_value_get_float(v);
  if (fl_value_get_type(v) == FL_VALUE_TYPE_INT) {
    return static_cast<double>(fl_value_get_int(v));
  }
  return fallback;
}

bool GetBoolArg(FlValue* map, const char* key, bool fallback) {
  if (!map || fl_value_get_type(map) != FL_VALUE_TYPE_MAP) return fallback;
  FlValue* v = fl_value_lookup_string(map, key);
  if (!v || fl_value_get_type(v) != FL_VALUE_TYPE_BOOL) return fallback;
  return fl_value_get_bool(v);
}

const char* GetStringArg(FlValue* map, const char* key) {
  if (!map || fl_value_get_type(map) != FL_VALUE_TYPE_MAP) return nullptr;
  FlValue* v = fl_value_lookup_string(map, key);
  if (!v || fl_value_get_type(v) != FL_VALUE_TYPE_STRING) return nullptr;
  return fl_value_get_string(v);
}

void OnMethodCall(FlMethodChannel*, FlMethodCall* call, gpointer) {
  const char* method = fl_method_call_get_name(call);
  FlValue* args = fl_method_call_get_args(call);

  if (std::strcmp(method, "supported") == 0) {
    const bool ok = IsWebKitVersionSupported();
    g_autoptr(FlValue) out = fl_value_new_map();
    fl_value_set_string_take(out, "supported", fl_value_new_bool(ok));
    fl_value_set_string_take(
        out, "reason",
        ok ? fl_value_new_null() : fl_value_new_string("needs_webkitgtk"));
    fl_value_set_string_take(out, "realTaps", fl_value_new_bool(FALSE));
    fl_value_set_string_take(out, "liveOverlay", fl_value_new_bool(!IsWayland()));
    fl_method_call_respond_success(call, out, nullptr);
    return;
  }

  if (std::strcmp(method, "load") == 0) {
    const char* url = GetStringArg(args, "url");
    if (!url || !*url) {
      RespondError(call, "bad_args", "url");
      return;
    }
    WebKitWebView* web = EnsureWebView();
    if (!web) {
      RespondError(call, "unsupported", "needs_webkitgtk");
      return;
    }
    g_state->approved_urls.insert(url);
    webkit_web_view_load_uri(web, url);
    RespondNull(call);
    return;
  }

  if (std::strcmp(method, "command") == 0) {
    HandleCommand(call, args);
    return;
  }

  if (std::strcmp(method, "screenshot") == 0) {
    if (!g_state || !g_state->web_view) {
      RespondError(call, "no_page", "No page is open");
      return;
    }
    auto* ctx = new SnapshotCtx();
    ctx->call = FL_METHOD_CALL(g_object_ref(call));
    ctx->quality = static_cast<int>(GetDoubleArg(args, "quality", 70));
    ctx->cancellable = g_cancellable_new();
    g_state->snapshots.insert(ctx->cancellable);
    ctx->timeout_id = g_timeout_add_seconds(5, OnSnapshotTimeout, ctx);
    webkit_web_view_get_snapshot(WEBKIT_WEB_VIEW(g_state->web_view),
                                 WEBKIT_SNAPSHOT_REGION_VISIBLE,
                                 WEBKIT_SNAPSHOT_OPTIONS_NONE, ctx->cancellable,
                                 OnSnapshotReady, ctx);
    return;
  }

  if (std::strcmp(method, "url") == 0) {
    WebKitWebView* web =
        (g_state && g_state->web_view) ? WEBKIT_WEB_VIEW(g_state->web_view) : nullptr;
    const char* uri = web ? webkit_web_view_get_uri(web) : nullptr;
    const char* title = web ? webkit_web_view_get_title(web) : nullptr;
    g_autoptr(FlValue) out = fl_value_new_map();
    fl_value_set_string_take(
        out, "url", fl_value_new_string(uri && *uri ? uri : "about:blank"));
    fl_value_set_string_take(out, "title",
                             fl_value_new_string(title ? title : ""));
    fl_value_set_string_take(
        out, "loading",
        fl_value_new_bool(web ? webkit_web_view_is_loading(web) : FALSE));
    fl_value_set_string_take(
        out, "canGoBack",
        fl_value_new_bool(web ? webkit_web_view_can_go_back(web) : FALSE));
    fl_value_set_string_take(
        out, "canGoForward",
        fl_value_new_bool(web ? webkit_web_view_can_go_forward(web) : FALSE));
    // The page's size in points, for fitting its picture and the cursor drawn over it.
    fl_value_set_string_take(
        out, "width",
        fl_value_new_int(web ? gtk_widget_get_allocated_width(GTK_WIDGET(web)) : 0));
    fl_value_set_string_take(
        out, "height",
        fl_value_new_int(web ? gtk_widget_get_allocated_height(GTK_WIDGET(web)) : 0));
    fl_method_call_respond_success(call, out, nullptr);
    return;
  }

  if (std::strcmp(method, "back") == 0) {
    if (g_state && g_state->web_view) {
      webkit_web_view_go_back(WEBKIT_WEB_VIEW(g_state->web_view));
    }
    RespondNull(call);
    return;
  }

  if (std::strcmp(method, "forward") == 0) {
    if (g_state && g_state->web_view) {
      webkit_web_view_go_forward(WEBKIT_WEB_VIEW(g_state->web_view));
    }
    RespondNull(call);
    return;
  }

  if (std::strcmp(method, "reload") == 0) {
    if (g_state && g_state->web_view) {
      webkit_web_view_reload(WEBKIT_WEB_VIEW(g_state->web_view));
    }
    RespondNull(call);
    return;
  }

  if (std::strcmp(method, "stop") == 0) {
    if (g_state && g_state->web_view) {
      webkit_web_view_stop_loading(WEBKIT_WEB_VIEW(g_state->web_view));
    }
    RespondNull(call);
    return;
  }

  if (std::strcmp(method, "answerDialog") == 0) {
    CloseActiveDialog(GetBoolArg(args, "accept", false),
                      GetStringArg(args, "text"));
    RespondNull(call);
    return;
  }

  if (std::strcmp(method, "clearData") == 0) {
    if (!g_state) {
      RespondNull(call);
      return;
    }
    const char* host = GetStringArg(args, "host");
    if (!g_state->data_manager) {
      if (!host || !*host) {
        RemoveTree(g_state->data_dir);
        RemoveTree(g_state->cache_dir);
      }
      RespondNull(call);
      return;
    }
    auto* ctx = new ClearDataCtx();
    ctx->call = FL_METHOD_CALL(g_object_ref(call));
    if (host && *host) {
      ctx->host = host;
      webkit_website_data_manager_fetch(g_state->data_manager,
                                        WEBKIT_WEBSITE_DATA_ALL, nullptr,
                                        OnFetchWebsiteData, ctx);
    } else {
      webkit_website_data_manager_clear(g_state->data_manager,
                                        WEBKIT_WEBSITE_DATA_ALL, 0, nullptr,
                                        OnClearDataDone, ctx);
    }
    return;
  }

  if (std::strcmp(method, "setOverlayBounds") == 0) {
    const bool visible = GetBoolArg(args, "visible", false);
    if (g_state) g_state->restore_on_map = false;
    if (!visible) {
      // A size with it: the area shows the page's picture at that size (Wayland, popups).
      const int pw = static_cast<int>(GetDoubleArg(args, "width", 0));
      const int ph = static_cast<int>(GetDoubleArg(args, "height", 0));
      if (g_state && pw > 1 && ph > 1) {
        g_state->park_w = pw;
        g_state->park_h = ph;
      }
      HideOverlay();
      RespondNull(call);
      return;
    }
    WebKitWebView* web = EnsureWebView();
    if (!web) {
      RespondNull(call);
      return;
    }
    GdkRectangle r;
    r.x = static_cast<int>(GetDoubleArg(args, "x", 0));
    r.y = static_cast<int>(GetDoubleArg(args, "y", 0));
    r.width = std::max(1, static_cast<int>(GetDoubleArg(args, "width", 1)));
    r.height = std::max(1, static_cast<int>(GetDoubleArg(args, "height", 1)));
    PlaceInOverlay(r);
    RespondNull(call);
    return;
  }

  if (std::strcmp(method, "pageWindow") == 0) {
    if (GetBoolArg(args, "open", false)) {
      if (!EnsureWebView()) {
        RespondError(call, "unsupported", "needs_webkitgtk");
        return;
      }
      OpenPageWindow(GetStringArg(args, "title"));
    } else {
      ClosePageWindow();
    }
    RespondNull(call);
    return;
  }

  if (std::strcmp(method, "cursor") == 0) {
    CursorTarget t;
    t.visible = GetBoolArg(args, "visible", false);
    t.x = GetDoubleArg(args, "x", 0);
    t.y = GetDoubleArg(args, "y", 0);
    const char* act = GetStringArg(args, "act");
    t.act = act && std::strcmp(act, "click") == 0    ? CursorAct::kClick
            : act && std::strcmp(act, "typing") == 0 ? CursorAct::kTyping
                                                       : CursorAct::kRest;
    t.step = static_cast<int>(GetDoubleArg(args, "step", 0));
    t.nudge = static_cast<int>(GetDoubleArg(args, "nudge", 0));
    const char* label = GetStringArg(args, "label");
    t.label = label ? label : "";
    const auto color = static_cast<guint32>(GetDoubleArg(args, "color", 0xFF6750A4));
    t.r = ((color >> 16) & 0xFF) / 255.0;
    t.g = ((color >> 8) & 0xFF) / 255.0;
    t.b = (color & 0xFF) / 255.0;
    t.size = GetDoubleArg(args, "size", 22);
    t.reduce_motion = GetBoolArg(args, "reduceMotion", false);
    CursorSet(t);
    g_autoptr(FlValue) out = fl_value_new_bool(CursorIsVisible());
    fl_method_call_respond_success(call, out, nullptr);
    return;
  }

  if (std::strcmp(method, "dispose") == 0) {
    const bool wipe_data = GetBoolArg(args, "wipeData", false);
    DestroyWebViewAndContext(wipe_data);
    RespondNull(call);
    return;
  }

  fl_method_call_respond_not_implemented(call, nullptr);
}

gboolean OnWindowMapped(GtkWidget*, GdkEvent*, gpointer) {
  if (g_state && g_state->restore_on_map && g_state->web_view) {
    g_state->restore_on_map = false;
    PlaceInOverlay(g_state->overlay_rect);
  }
  // Pairs with windowHidden (sent on unmap): Dart keeps the browser's socket off until the window
  // is back, and the app's lifecycle may not change on the way (a window manager that unmaps and
  // maps the window while it starts, or reopening from the tray with no focus change).
  if (g_state) InvokeDart("windowShown");
  return FALSE;
}

}  // namespace

extern "C" {

gboolean casama_app_browser_attach(GtkWindow* window,
                                   GtkOverlay* overlay,
                                   FlView* view,
                                   FlBinaryMessenger* messenger) {
  if (!IsWebKitVersionSupported()) {
    return FALSE;
  }
  casama_app_browser_detach();

  g_state = new AppBrowserState();
  g_state->window = window;
  g_state->overlay = overlay;
  g_state->fl_view = view;
  g_state->data_dir = std::string(g_get_user_data_dir()) + "/casama/app-browser";
  g_state->cache_dir = std::string(g_get_user_cache_dir()) + "/casama/app-browser";

  g_state->overlay_pos_sig = g_signal_connect(
      overlay, "get-child-position", G_CALLBACK(OnOverlayChildPosition), g_state);
  g_state->cursor_area = CursorCreate(overlay);
  gtk_widget_add_events(GTK_WIDGET(window), GDK_STRUCTURE_MASK);
  g_state->window_map_sig = g_signal_connect(
      window, "map-event", G_CALLBACK(OnWindowMapped), nullptr);

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_state->channel =
      fl_method_channel_new(messenger, kChannelName, FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(g_state->channel, OnMethodCall,
                                            nullptr, nullptr);
  return TRUE;
}

void casama_app_browser_window_hidden(void) {
  if (!g_state) return;
  if (g_state->overlay_visible) g_state->restore_on_map = true;
  HideOverlay();
  InvokeDart("windowHidden");
}

void casama_app_browser_detach(void) {
  if (!g_state) return;
  if (g_state->overlay && g_state->overlay_pos_sig != 0) {
    g_signal_handler_disconnect(g_state->overlay, g_state->overlay_pos_sig);
    g_state->overlay_pos_sig = 0;
  }
  if (g_state->window && g_state->window_map_sig != 0) {
    g_signal_handler_disconnect(g_state->window, g_state->window_map_sig);
    g_state->window_map_sig = 0;
  }
  DestroyWebViewAndContext(false);
  CursorDestroy();
  g_state->cursor_area = nullptr;
  if (g_state->channel) {
    fl_method_channel_set_method_call_handler(g_state->channel, nullptr,
                                              nullptr, nullptr);
    g_clear_object(&g_state->channel);
  }
  delete g_state;
  g_state = nullptr;
}

}  // extern "C"
