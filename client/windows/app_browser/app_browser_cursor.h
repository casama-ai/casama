#ifndef CASAMA_WINDOWS_APP_BROWSER_CURSOR_H_
#define CASAMA_WINDOWS_APP_BROWSER_CURSOR_H_

#include <windows.h>

#include <string>

// The bot's cursor over the live Windows web area (docs/BOT-CURSOR-PLAN.md,
// docs/WINDOWS-BROWSER-PLAN.md §4.2). The WebView2 page is a child window above Flutter's view, so
// a cursor Flutter draws ends up under the page. This one is a transparent layered child window
// above the page that lets every click and key through. It matches lib/ui/bot_cursor.dart and the
// Linux cursor (client/linux/app_browser/app_browser_cursor.cc): the arrow, the click dip and ring,
// three typing dots (never the letters), the name label, the bowed glide and the idle drift.

enum class CursorAct { kRest, kClick, kTyping };

struct CursorTarget {
  bool visible = false;
  double x = 0;  // In the web area's logical points, from its top left.
  double y = 0;
  CursorAct act = CursorAct::kRest;
  int step = 0;   // Goes up with every step; the same step only changes the act.
  int nudge = 0;  // A scroll: -1 up, 1 down.
  std::wstring label;
  double r = 0.4, g = 0.3, b = 0.8;  // The bot's colour.
  double size = 22;                  // Arrow size in points.
  bool reduce_motion = false;
};

// Creates the layer as a child of [host] (the web area's window), above the page. Starts hidden.
void CursorCreate(HWND host);

// Puts the layer above the page again and sizes it to the host (after the host moved or resized).
// [scale] is physical pixels per logical point.
void CursorFit(double scale);

// Shows or hides the layer with the web area (it is only drawn while the live page is shown).
void CursorSetShown(bool shown);

// A new target from Dart.
void CursorSet(const CursorTarget& target);

// Whether the cursor is on screen right now.
bool CursorIsVisible();

void CursorDestroy();

#endif  // CASAMA_WINDOWS_APP_BROWSER_CURSOR_H_
