#ifndef CASAMA_LINUX_APP_BROWSER_API_H_
#define CASAMA_LINUX_APP_BROWSER_API_H_

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>

#ifdef __cplusplus
extern "C" {
#endif

// Attaches the WebKitGTK 4.1 in-app browser library (docs/LINUX-BROWSER-PLAN.md §4.1)
// to the main GTK window and Flutter overlay, and registers the `casama/app_browser`
// method channel. Returns TRUE if WebKitGTK 4.1 (>= 2.40) initialized cleanly; FALSE
// otherwise so the runner can register a `needs_webkitgtk` fallback.
gboolean casama_app_browser_attach(GtkWindow* window,
                                   GtkOverlay* overlay,
                                   FlView* view,
                                   FlBinaryMessenger* messenger);

// Tells Dart that the main window was hidden or closed.
void casama_app_browser_window_hidden(void);

// Destroys the web view, WebKit context, and channel cleanly on shutdown.
void casama_app_browser_detach(void);

#ifdef __cplusplus
}
#endif

#endif  // CASAMA_LINUX_APP_BROWSER_API_H_
