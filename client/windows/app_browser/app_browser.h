// The in-app browser on Windows (docs/WINDOWS-BROWSER-PLAN.md): WebView2 in a child window laid
// over the Flutter view, driven over the `casama/app_browser` channel
// (client/lib/features/app_browser/PROTOCOL.md). Compiled into the runner only with the build
// switch (scripts/app-browser-switch.sh, client/windows/app-browser.on or CASAMA_APP_BROWSER=1).
#ifndef CASAMA_WINDOWS_APP_BROWSER_H_
#define CASAMA_WINDOWS_APP_BROWSER_H_

#include <windows.h>

namespace flutter {
class BinaryMessenger;
}

// Registers the channel. [top_level] is the app's window, [flutter_view] the Flutter view inside
// it. Without a WebView2 runtime (or an old one) the channel still answers `supported` with
// `needs_webview2`.
void CasamaAppBrowserAttach(flutter::BinaryMessenger* messenger, HWND top_level, HWND flutter_view);

// Closes the page and frees everything (the app is closing).
void CasamaAppBrowserDetach();

// Every message the app's window gets (minimize, hide, show), before Flutter handles it.
void CasamaAppBrowserTopLevelMessage(HWND hwnd, UINT message, WPARAM wparam, LPARAM lparam);

#endif  // CASAMA_WINDOWS_APP_BROWSER_H_
