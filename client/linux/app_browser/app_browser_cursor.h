#ifndef CASAMA_LINUX_APP_BROWSER_CURSOR_H_
#define CASAMA_LINUX_APP_BROWSER_CURSOR_H_

#include <gtk/gtk.h>

#include <string>

// The bot's cursor over the live Linux web area (docs/BOT-CURSOR-PLAN.md,
// docs/LINUX-BROWSER-PLAN.md §4.2). The WebKitWebView is a GtkOverlay child above Flutter's view,
// so a cursor Flutter draws ends up under the page. This one is a transparent GtkDrawingArea one
// layer above the web view that lets every click and key through. It matches lib/ui/bot_cursor.dart:
// the arrow, the click dip and ring, three typing dots (never the letters), the name label, the
// bowed glide and the idle drift, animated on the frame clock.

enum class CursorAct { kRest, kClick, kTyping };

struct CursorTarget {
  bool visible = false;
  double x = 0;  // In the web area's points, from its top left.
  double y = 0;
  CursorAct act = CursorAct::kRest;
  int step = 0;   // Goes up with every step; the same step only changes the act.
  int nudge = 0;  // A scroll: -1 up, 1 down.
  std::string label;
  double r = 0.4, g = 0.3, b = 0.8;  // The bot's colour.
  double size = 22;                  // Arrow size in points (the large surfaces).
  bool reduce_motion = false;
};

// Creates the layer as an overlay child of [overlay] (call after the web view is added, so it sits
// above it). Returns the widget; it starts hidden.
GtkWidget* CursorCreate(GtkOverlay* overlay);

// Puts the layer above the web view again (after the web view was re-added to the overlay).
void CursorRaise(GtkOverlay* overlay);

// Shows or hides the layer with the web area (it is only drawn while the live page is shown).
void CursorSetShown(bool shown);

// A new target from Dart.
void CursorSet(const CursorTarget& target);

// Whether the cursor is on screen right now (for tests and the overlay position callback).
bool CursorIsVisible();

void CursorDestroy();

#endif  // CASAMA_LINUX_APP_BROWSER_CURSOR_H_
