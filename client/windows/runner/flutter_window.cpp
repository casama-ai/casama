#include "flutter_window.h"

#include <optional>

#include "flutter/generated_plugin_registrant.h"

#ifdef CASAMA_APP_BROWSER
#include "app_browser.h"
#endif

namespace {

// Turns Flutter's accessibility tree on for the life of the app, so UI Automation clients that
// aren't screen readers (Inspect, test tools, voice control) see the app's buttons and text
// instead of one empty "FLUTTERVIEW" pane.
//
// The Windows embedder creates its accessibility bridge, and passes semantics on to it, only once
// the view window has answered a WM_GETOBJECT for OBJID_CLIENT or UiaRootObjectId
// (FlutterWindow::OnGetObject in the engine). Until then every semantics update from Dart is
// dropped, and the framework never sends its whole tree again. Asking once here, right after the
// view exists and before Dart has drawn anything, makes the bridge exist from the first frame.
// The bridge is still empty at this point, so the engine hands back no COM object to release.
void EnableAccessibilityTree(HWND view) {
  if (view != nullptr) {
    ::SendMessage(view, WM_GETOBJECT, 0, static_cast<LPARAM>(OBJID_CLIENT));
  }
}

}  // namespace

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
  SetChildContent(flutter_controller_->view()->GetNativeWindow());
  EnableAccessibilityTree(flutter_controller_->view()->GetNativeWindow());
#ifdef CASAMA_APP_BROWSER
  // The in-app browser (docs/WINDOWS-BROWSER-PLAN.md): a WebView2 child window over the view.
  CasamaAppBrowserAttach(flutter_controller_->engine()->messenger(), GetHandle(),
                         flutter_controller_->view()->GetNativeWindow());
#endif

  flutter_controller_->engine()->SetNextFrameCallback([&]() {
    this->Show();
  });

  // Flutter can complete the first frame before the "show window" callback is
  // registered. The following call ensures a frame is pending to ensure the
  // window is shown. It is a no-op if the first frame hasn't completed yet.
  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::OnDestroy() {
#ifdef CASAMA_APP_BROWSER
  CasamaAppBrowserDetach();
#endif
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
#ifdef CASAMA_APP_BROWSER
  // Minimize, hide and show park or bring back the page (it isn't part of Flutter's view).
  CasamaAppBrowserTopLevelMessage(hwnd, message, wparam, lparam);
#endif
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
