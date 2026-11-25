// The bot's cursor over the live Linux web area. See app_browser_cursor.h.

#include "app_browser_cursor.h"

#include <cairo/cairo.h>
#include <pango/pangocairo.h>

#include <algorithm>
#include <cmath>

namespace {

constexpr double kPi = 3.14159265358979323846;

// Microseconds, like g_get_monotonic_time().
constexpr gint64 kRingUs = 400 * 1000;
constexpr gint64 kNudgeUs = 360 * 1000;
constexpr gint64 kFadeUs = 180 * 1000;
constexpr gint64 kFloatPeriodUs = 6 * 1000 * 1000;
constexpr gint64 kFloatRampUs = 600 * 1000;
constexpr gint64 kRestBeforeFloatUs = 1500 * 1000;

struct Cursor {
  GtkWidget* area = nullptr;
  guint tick_id = 0;
  bool shown = false;  // The live web area is on screen.

  CursorTarget target;
  bool has_target = false;  // A step put it somewhere and it hasn't left.

  // The glide from [from] to [to].
  double from_x = 0, from_y = 0, to_x = 0, to_y = 0;
  gint64 glide_start = 0, glide_us = 0;
  bool ring_after_glide = false;

  gint64 ring_start = -1;
  gint64 nudge_start = -1;
  int nudge_dir = 0;

  // The fade: [fade_from] at [fade_start] heading to [fade_to].
  double fade_from = 0, fade_to = 0;
  gint64 fade_start = 0;

  // The idle drift: it ramps in [kRestBeforeFloatUs] after the cursor stops.
  gint64 settled_at = -1;  // When it last arrived somewhere; -1 while moving.
  double float_from = 0, float_to = 0;
  gint64 float_ramp_start = 0;
};

Cursor* g_cursor = nullptr;

void SyncShown();

gint64 Now() { return g_get_monotonic_time(); }

double Clamp01(double v) { return std::min(1.0, std::max(0.0, v)); }

double EaseInOutCubic(double t) {
  return t < 0.5 ? 4 * t * t * t : 1 - std::pow(-2 * t + 2, 3) / 2;
}

double EaseOutCubic(double t) { return 1 - std::pow(1 - t, 3); }

double Progress(gint64 start, gint64 duration, gint64 now) {
  if (start < 0 || duration <= 0) return 1;
  return Clamp01(static_cast<double>(now - start) / duration);
}

double Fade(gint64 now) {
  const double t = Progress(g_cursor->fade_start, kFadeUs, now);
  return g_cursor->fade_from + (g_cursor->fade_to - g_cursor->fade_from) * t;
}

void FadeTo(double to, gint64 now) {
  if (g_cursor->target.reduce_motion) {
    g_cursor->fade_from = g_cursor->fade_to = to;
    return;
  }
  g_cursor->fade_from = Fade(now);
  g_cursor->fade_to = to;
  g_cursor->fade_start = now;
}

double FloatAmount(gint64 now) {
  if (g_cursor->target.reduce_motion) return 0;
  const double t = Progress(g_cursor->float_ramp_start, kFloatRampUs, now);
  return g_cursor->float_from + (g_cursor->float_to - g_cursor->float_from) * t;
}

void FloatTo(double to, gint64 now) {
  g_cursor->float_from = FloatAmount(now);
  g_cursor->float_to = to;
  g_cursor->float_ramp_start = now;
}

// Where the tip is now along the bowed glide.
void TipNow(gint64 now, double* x, double* y) {
  const double t = EaseInOutCubic(Progress(g_cursor->glide_start, g_cursor->glide_us, now));
  const double dx = g_cursor->to_x - g_cursor->from_x, dy = g_cursor->to_y - g_cursor->from_y;
  if (dx * dx + dy * dy < 1) {
    *x = g_cursor->to_x;
    *y = g_cursor->to_y;
    return;
  }
  const double mx = g_cursor->from_x + dx / 2 + dy * 0.12;
  const double my = g_cursor->from_y + dy / 2 - dx * 0.12;
  const double ax = g_cursor->from_x + (mx - g_cursor->from_x) * t;
  const double ay = g_cursor->from_y + (my - g_cursor->from_y) * t;
  const double bx = mx + (g_cursor->to_x - mx) * t;
  const double by = my + (g_cursor->to_y - my) * t;
  *x = ax + (bx - ax) * t;
  *y = ay + (by - ay) * t;
}

void ArrowPath(cairo_t* cr, double s, double ox, double oy) {
  static const double kShape[][2] = {{0, 0},       {0, 0.82},    {0.23, 0.62}, {0.40, 0.98},
                                     {0.53, 0.92}, {0.36, 0.57}, {0.66, 0.57}};
  cairo_new_path(cr);
  cairo_move_to(cr, ox + kShape[0][0] * s, oy + kShape[0][1] * s);
  for (int i = 1; i < 7; i++) cairo_line_to(cr, ox + kShape[i][0] * s, oy + kShape[i][1] * s);
  cairo_close_path(cr);
}

void RoundedRect(cairo_t* cr, double x, double y, double w, double h, double r) {
  cairo_new_sub_path(cr);
  cairo_arc(cr, x + w - r, y + r, r, -kPi / 2, 0);
  cairo_arc(cr, x + w - r, y + h - r, r, 0, kPi / 2);
  cairo_arc(cr, x + r, y + h - r, r, kPi / 2, kPi);
  cairo_arc(cr, x + r, y + r, r, kPi, 3 * kPi / 2);
  cairo_close_path(cr);
}

void DrawLabel(cairo_t* cr, double x, double y, const CursorTarget& t, double alpha) {
  PangoLayout* layout = pango_cairo_create_layout(cr);
  PangoFontDescription* font = pango_font_description_from_string("Sans Semi-Bold 11px");
  pango_layout_set_font_description(layout, font);
  pango_font_description_free(font);
  pango_layout_set_text(layout, t.label.c_str(), -1);
  pango_layout_set_width(layout, 120 * PANGO_SCALE);
  pango_layout_set_ellipsize(layout, PANGO_ELLIPSIZE_END);
  pango_layout_set_single_paragraph_mode(layout, TRUE);
  int tw = 0, th = 0;
  pango_layout_get_pixel_size(layout, &tw, &th);
  const double w = tw + 12, h = th + 4;
  // Shadow, fill, white border.
  RoundedRect(cr, x, y + 1, w, h, 7);
  cairo_set_source_rgba(cr, 0, 0, 0, 0.25 * alpha);
  cairo_fill(cr);
  RoundedRect(cr, x, y, w, h, 7);
  cairo_set_source_rgba(cr, t.r, t.g, t.b, alpha);
  cairo_fill_preserve(cr);
  cairo_set_line_width(cr, 1);
  cairo_set_source_rgba(cr, 1, 1, 1, alpha);
  cairo_stroke(cr);
  // White text on dark colours, black on light ones (Flutter's estimateBrightnessForColor).
  const double lum = 0.299 * t.r + 0.587 * t.g + 0.114 * t.b;
  const double on = lum < 0.6 ? 1 : 0;
  cairo_set_source_rgba(cr, on, on, on, alpha);
  cairo_move_to(cr, x + 6, y + 2);
  pango_cairo_show_layout(cr, layout);
  g_object_unref(layout);
}

gboolean OnDraw(GtkWidget* widget, cairo_t* cr, gpointer) {
  if (!g_cursor || !g_cursor->shown) return FALSE;
  const gint64 now = Now();
  const double fade = Fade(now);
  if (fade <= 0) return FALSE;
  const CursorTarget& t = g_cursor->target;
  const double s = t.size;
  const double w = gtk_widget_get_allocated_width(widget);
  const double h = gtk_widget_get_allocated_height(widget);

  double px = 0, py = 0;
  TipNow(now, &px, &py);
  // In a part of the page out of view: wait at that edge, half faded.
  const bool inside = px >= -0.5 && py >= -0.5 && px <= w + 0.5 && py <= h + 0.5;
  if (!inside) {
    px = std::min(std::max(px, 0.0), w);
    py = std::min(std::max(py, 0.0), h);
  }
  const double turn = static_cast<double>(now % kFloatPeriodUs) / kFloatPeriodUs * 2 * kPi;
  const double amount = FloatAmount(now);
  px += std::sin(turn) * 2.6 * amount;
  py += std::sin(turn * 2) * 1.6 * amount;
  const double nudge = Progress(g_cursor->nudge_start, kNudgeUs, now);
  if (nudge < 1 && !t.reduce_motion) py += g_cursor->nudge_dir * 8 * std::sin(kPi * nudge);

  const double alpha = fade * (inside ? 1 : 0.45);
  const double ring = Progress(g_cursor->ring_start, kRingUs, now);

  if (ring < 1) {
    const double spread = EaseOutCubic(ring);
    cairo_new_path(cr);
    cairo_arc(cr, px, py, 2 + s * 1.05 * spread, 0, 2 * kPi);
    cairo_set_line_width(cr, std::max(1.2, s * 0.1) * (1 - spread * 0.5));
    cairo_set_source_rgba(cr, t.r, t.g, t.b, 0.85 * (1 - spread) * alpha);
    cairo_stroke(cr);
  }
  const double dip = ring < 1 ? 1 - 0.1 * std::sin(kPi * Clamp01(ring / 0.35)) : 1.0;
  const double as = s * dip;
  // A soft shadow: the arrow a little lower, twice, wider then tighter.
  for (int i = 0; i < 2; i++) {
    ArrowPath(cr, as, px, py + s * 0.06);
    cairo_set_line_width(cr, i == 0 ? s * 0.24 : s * 0.12);
    cairo_set_line_join(cr, CAIRO_LINE_JOIN_ROUND);
    cairo_set_source_rgba(cr, 0, 0, 0, 0.12 * alpha);
    cairo_stroke_preserve(cr);
    cairo_fill(cr);
  }
  ArrowPath(cr, as, px, py);
  cairo_set_source_rgba(cr, t.r, t.g, t.b, alpha);
  cairo_fill_preserve(cr);
  cairo_set_line_join(cr, CAIRO_LINE_JOIN_ROUND);
  cairo_set_line_width(cr, std::max(1.0, s * 0.085));
  cairo_set_source_rgba(cr, 1, 1, 1, alpha);
  cairo_stroke(cr);

  if (t.act == CursorAct::kTyping) {
    const double phase =
        t.reduce_motion ? 0.5 : std::fmod(static_cast<double>(now % kFloatPeriodUs) / kFloatPeriodUs * 5, 1);
    const double r = std::max(1.1, s * 0.085);
    for (int i = 0; i < 3; i++) {
      double beat = std::fmod(phase - i / 3.0, 1);
      if (beat < 0) beat += 1;
      const double up = Clamp01(std::sin(kPi * beat));
      const double dx = px + s * (0.82 + i * 0.3), dy = py + s * 0.5;
      cairo_new_path(cr);
      cairo_arc(cr, dx, dy, r + 0.8, 0, 2 * kPi);
      cairo_set_source_rgba(cr, 1, 1, 1, alpha);
      cairo_fill(cr);
      cairo_arc(cr, dx, dy, r, 0, 2 * kPi);
      cairo_set_source_rgba(cr, t.r, t.g, t.b, (0.45 + 0.55 * up) * alpha);
      cairo_fill(cr);
    }
  }
  if (!t.label.empty()) DrawLabel(cr, px + s * 0.78, py + s * 1.02, t, alpha);
  return FALSE;
}

gboolean OnTick(GtkWidget* widget, GdkFrameClock*, gpointer) {
  if (!g_cursor) return G_SOURCE_REMOVE;
  const gint64 now = Now();
  // Arrived and resting: start the drift.
  if (g_cursor->settled_at < 0 && Progress(g_cursor->glide_start, g_cursor->glide_us, now) >= 1) {
    g_cursor->settled_at = now;
    if (g_cursor->ring_after_glide) {
      g_cursor->ring_after_glide = false;
      g_cursor->ring_start = now;
    }
  }
  if (g_cursor->settled_at >= 0 && g_cursor->float_to == 0 && g_cursor->has_target &&
      now - g_cursor->settled_at >= kRestBeforeFloatUs) {
    FloatTo(1, now);
  }
  gtk_widget_queue_draw(widget);
  // Keep ticking while there is anything on screen; stop once faded out.
  if (!g_cursor->has_target && Fade(now) <= 0) {
    g_cursor->fade_from = g_cursor->fade_to = 0;
    SyncShown();
    g_cursor->tick_id = 0;
    return G_SOURCE_REMOVE;
  }
  return G_SOURCE_CONTINUE;
}

// Input never stops here: an empty input shape on the layer's own window and on the window
// GtkOverlay made for it, so every click, scroll and key reaches the page below. (The overlay's
// pass-through flag alone didn't let clicks reach the web view on X11.)
void ClearInputShape(GtkWidget* widget) {
  GdkWindow* win = gtk_widget_get_window(widget);
  cairo_region_t* empty = cairo_region_create();
  for (int i = 0; win && i < 2; i++) {
    gdk_window_input_shape_combine_region(win, empty, 0, 0);
    gdk_window_set_pass_through(win, TRUE);
    GdkWindow* parent = gdk_window_get_parent(win);
    // Stop at the overlay's own window: that one carries the page and Flutter.
    if (!parent || parent == gtk_widget_get_window(gtk_widget_get_parent(widget))) break;
    win = parent;
  }
  cairo_region_destroy(empty);
}

void OnRealizeOrMap(GtkWidget* widget, gpointer) { ClearInputShape(widget); }

// Shown only while there is a cursor to draw over a live page.
void SyncShown() {
  if (!g_cursor || !g_cursor->area) return;
  const bool want = g_cursor->shown && (g_cursor->has_target || g_cursor->fade_to > 0 ||
                                        g_cursor->fade_from > 0);
  if (want) {
    gtk_widget_show(g_cursor->area);
    ClearInputShape(g_cursor->area);
  } else {
    gtk_widget_hide(g_cursor->area);
  }
}

void EnsureTicking() {
  if (!g_cursor || !g_cursor->area || g_cursor->tick_id != 0) return;
  g_cursor->tick_id = gtk_widget_add_tick_callback(g_cursor->area, OnTick, nullptr, nullptr);
}

}  // namespace

GtkWidget* CursorCreate(GtkOverlay* overlay) {
  if (!g_cursor) g_cursor = new Cursor();
  if (g_cursor->area) return g_cursor->area;
  GtkWidget* area = gtk_drawing_area_new();
  gtk_widget_set_app_paintable(area, TRUE);
  gtk_widget_set_can_focus(area, FALSE);
  gtk_widget_set_name(area, "casama-bot-cursor");
  g_signal_connect(area, "draw", G_CALLBACK(OnDraw), nullptr);
  g_signal_connect(area, "realize", G_CALLBACK(OnRealizeOrMap), nullptr);
  g_signal_connect(area, "map", G_CALLBACK(OnRealizeOrMap), nullptr);
  gtk_overlay_add_overlay(overlay, area);
  // Clicks, scrolls and keys go straight through to the page under it.
  gtk_overlay_set_overlay_pass_through(overlay, area, TRUE);
  g_cursor->area = area;
  return area;
}

void CursorRaise(GtkOverlay* overlay) {
  if (!g_cursor || !g_cursor->area) return;
  gtk_overlay_reorder_overlay(overlay, g_cursor->area, -1);
}

void CursorSetShown(bool shown) {
  if (!g_cursor || !g_cursor->area) return;
  g_cursor->shown = shown;
  SyncShown();
  if (shown) EnsureTicking();
}

void CursorSet(const CursorTarget& t) {
  if (!g_cursor) g_cursor = new Cursor();
  const gint64 now = Now();
  const bool was = g_cursor->has_target;
  const CursorTarget old = g_cursor->target;
  if (!t.visible) {
    g_cursor->has_target = false;
    g_cursor->target.reduce_motion = t.reduce_motion;
    FadeTo(0, now);
    FloatTo(0, now);
    EnsureTicking();
    return;
  }
  g_cursor->target = t;
  g_cursor->has_target = true;
  if (was && old.step == t.step) {
    // Only what it is doing changed (the typing dots went).
    EnsureTicking();
    return;
  }
  g_cursor->nudge_dir = t.nudge;
  const bool appearing = !was || Fade(now) <= 0;
  const bool moved = !was || old.x != t.x || old.y != t.y;
  FloatTo(0, now);
  if (appearing || t.reduce_motion || !moved) {
    // The first time in a reply it fades in at the spot instead of flying in from a corner.
    g_cursor->from_x = g_cursor->to_x = t.x;
    g_cursor->from_y = g_cursor->to_y = t.y;
    g_cursor->glide_start = now;
    g_cursor->glide_us = 0;
    g_cursor->ring_after_glide = false;
    g_cursor->ring_start = t.act == CursorAct::kClick ? now : -1;
    g_cursor->settled_at = now;
  } else {
    double hx = 0, hy = 0;
    TipNow(now, &hx, &hy);
    g_cursor->from_x = hx;
    g_cursor->from_y = hy;
    g_cursor->to_x = t.x;
    g_cursor->to_y = t.y;
    // The phone browser measures in points (no picture size), so like Flutter: 475 ms.
    g_cursor->glide_start = now;
    g_cursor->glide_us = 475 * 1000;
    g_cursor->ring_after_glide = t.act == CursorAct::kClick;
    g_cursor->ring_start = -1;
    g_cursor->settled_at = -1;
  }
  g_cursor->nudge_start = (t.nudge != 0 && !t.reduce_motion) ? now : -1;
  FadeTo(1, now);
  SyncShown();
  EnsureTicking();
}

bool CursorIsVisible() {
  return g_cursor && g_cursor->shown && g_cursor->has_target;
}

void CursorDestroy() {
  if (!g_cursor) return;
  if (g_cursor->area) {
    if (g_cursor->tick_id) gtk_widget_remove_tick_callback(g_cursor->area, g_cursor->tick_id);
    GtkWidget* parent = gtk_widget_get_parent(g_cursor->area);
    if (parent) gtk_container_remove(GTK_CONTAINER(parent), g_cursor->area);
  }
  delete g_cursor;
  g_cursor = nullptr;
}
