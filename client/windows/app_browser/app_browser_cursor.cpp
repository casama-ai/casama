// The bot's cursor over the live Windows web area. See app_browser_cursor.h.

#include "app_browser_cursor.h"

#include <objidl.h>
#include <gdiplus.h>

#include <algorithm>
#include <cmath>

namespace {

constexpr double kPi = 3.14159265358979323846;
constexpr wchar_t kClassName[] = L"CasamaBotCursor";
constexpr UINT_PTR kTickTimer = 1;

// Microseconds.
constexpr long long kRingUs = 400 * 1000;
constexpr long long kNudgeUs = 360 * 1000;
constexpr long long kFadeUs = 180 * 1000;
constexpr long long kFloatPeriodUs = 6 * 1000 * 1000;
constexpr long long kFloatRampUs = 600 * 1000;
constexpr long long kRestBeforeFloatUs = 1500 * 1000;

struct Cursor {
  HWND host = nullptr;
  HWND window = nullptr;
  ULONG_PTR gdiplus_token = 0;
  bool ticking = false;
  bool shown = false;
  double scale = 1;

  CursorTarget target;
  bool has_target = false;

  double from_x = 0, from_y = 0, to_x = 0, to_y = 0;
  long long glide_start = 0, glide_us = 0;
  bool ring_after_glide = false;

  long long ring_start = -1;
  long long nudge_start = -1;
  int nudge_dir = 0;

  double fade_from = 0, fade_to = 0;
  long long fade_start = 0;

  long long settled_at = -1;
  double float_from = 0, float_to = 0;
  long long float_ramp_start = 0;
};

Cursor* g_cursor = nullptr;

long long Now() {
  static LARGE_INTEGER freq = [] {
    LARGE_INTEGER f;
    QueryPerformanceFrequency(&f);
    return f;
  }();
  LARGE_INTEGER c;
  QueryPerformanceCounter(&c);
  return static_cast<long long>(c.QuadPart * 1000000.0 / freq.QuadPart);
}

double Clamp01(double v) { return std::min(1.0, std::max(0.0, v)); }
double EaseInOutCubic(double t) { return t < 0.5 ? 4 * t * t * t : 1 - std::pow(-2 * t + 2, 3) / 2; }
double EaseOutCubic(double t) { return 1 - std::pow(1 - t, 3); }

double Progress(long long start, long long duration, long long now) {
  if (start < 0 || duration <= 0) return 1;
  return Clamp01(static_cast<double>(now - start) / duration);
}

double Fade(long long now) {
  const double t = Progress(g_cursor->fade_start, kFadeUs, now);
  return g_cursor->fade_from + (g_cursor->fade_to - g_cursor->fade_from) * t;
}

void FadeTo(double to, long long now) {
  if (g_cursor->target.reduce_motion) {
    g_cursor->fade_from = g_cursor->fade_to = to;
    return;
  }
  g_cursor->fade_from = Fade(now);
  g_cursor->fade_to = to;
  g_cursor->fade_start = now;
}

double FloatAmount(long long now) {
  if (g_cursor->target.reduce_motion) return 0;
  const double t = Progress(g_cursor->float_ramp_start, kFloatRampUs, now);
  return g_cursor->float_from + (g_cursor->float_to - g_cursor->float_from) * t;
}

void FloatTo(double to, long long now) {
  g_cursor->float_from = FloatAmount(now);
  g_cursor->float_to = to;
  g_cursor->float_ramp_start = now;
}

void TipNow(long long now, double* x, double* y) {
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

Gdiplus::Color Rgba(double r, double g, double b, double a) {
  auto c = [](double v) { return static_cast<BYTE>(std::lround(Clamp01(v) * 255)); };
  return Gdiplus::Color(c(a), c(r), c(g), c(b));
}

void ArrowPath(Gdiplus::GraphicsPath& path, double s, double ox, double oy) {
  static const double kShape[][2] = {{0, 0},       {0, 0.82},    {0.23, 0.62}, {0.40, 0.98},
                                     {0.53, 0.92}, {0.36, 0.57}, {0.66, 0.57}};
  Gdiplus::PointF pts[7];
  for (int i = 0; i < 7; i++) {
    pts[i] = Gdiplus::PointF(static_cast<Gdiplus::REAL>(ox + kShape[i][0] * s),
                             static_cast<Gdiplus::REAL>(oy + kShape[i][1] * s));
  }
  path.Reset();
  path.AddPolygon(pts, 7);
}

void RoundedRect(Gdiplus::GraphicsPath& path, double x, double y, double w, double h, double r) {
  const auto R = [](double v) { return static_cast<Gdiplus::REAL>(v); };
  const double d = r * 2;
  path.Reset();
  path.AddArc(R(x + w - d), R(y), R(d), R(d), 270, 90);
  path.AddArc(R(x + w - d), R(y + h - d), R(d), R(d), 0, 90);
  path.AddArc(R(x), R(y + h - d), R(d), R(d), 90, 90);
  path.AddArc(R(x), R(y), R(d), R(d), 180, 90);
  path.CloseFigure();
}

// All drawing is in logical points; the Graphics is scaled to physical pixels.
void DrawLabel(Gdiplus::Graphics& g, double x, double y, const CursorTarget& t, double alpha) {
  Gdiplus::FontFamily family(L"Segoe UI");
  Gdiplus::Font font(&family, 11, Gdiplus::FontStyleBold, Gdiplus::UnitPixel);
  Gdiplus::StringFormat format;
  format.SetTrimming(Gdiplus::StringTrimmingEllipsisCharacter);
  format.SetFormatFlags(Gdiplus::StringFormatFlagsNoWrap);
  Gdiplus::RectF bounds;
  g.MeasureString(t.label.c_str(), -1, &font, Gdiplus::RectF(0, 0, 120, 40), &format, &bounds);
  const double tw = std::min<double>(bounds.Width, 120), th = bounds.Height;
  const double w = tw + 12, h = th + 4;
  Gdiplus::GraphicsPath path;
  RoundedRect(path, x, y + 1, w, h, 7);
  Gdiplus::SolidBrush shadow(Rgba(0, 0, 0, 0.25 * alpha));
  g.FillPath(&shadow, &path);
  RoundedRect(path, x, y, w, h, 7);
  Gdiplus::SolidBrush fill(Rgba(t.r, t.g, t.b, alpha));
  g.FillPath(&fill, &path);
  Gdiplus::Pen border(Rgba(1, 1, 1, alpha), 1);
  g.DrawPath(&border, &path);
  const double lum = 0.299 * t.r + 0.587 * t.g + 0.114 * t.b;
  const double on = lum < 0.6 ? 1 : 0;
  Gdiplus::SolidBrush text(Rgba(on, on, on, alpha));
  g.DrawString(t.label.c_str(), -1, &font,
               Gdiplus::RectF(static_cast<Gdiplus::REAL>(x + 6), static_cast<Gdiplus::REAL>(y + 2),
                              static_cast<Gdiplus::REAL>(tw), static_cast<Gdiplus::REAL>(th)),
               &format, &text);
}

void Paint(Gdiplus::Graphics& g, double w, double h, long long now) {
  const double fade = Fade(now);
  if (fade <= 0) return;
  const CursorTarget& t = g_cursor->target;
  const double s = t.size;
  double px = 0, py = 0;
  TipNow(now, &px, &py);
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
  const auto R = [](double v) { return static_cast<Gdiplus::REAL>(v); };

  if (ring < 1) {
    const double spread = EaseOutCubic(ring);
    const double rad = 2 + s * 1.05 * spread;
    Gdiplus::Pen pen(Rgba(t.r, t.g, t.b, 0.85 * (1 - spread) * alpha),
                     R(std::max(1.2, s * 0.1) * (1 - spread * 0.5)));
    g.DrawEllipse(&pen, R(px - rad), R(py - rad), R(rad * 2), R(rad * 2));
  }
  const double dip = ring < 1 ? 1 - 0.1 * std::sin(kPi * Clamp01(ring / 0.35)) : 1.0;
  const double as = s * dip;
  Gdiplus::GraphicsPath path;
  for (int i = 0; i < 2; i++) {
    ArrowPath(path, as, px, py + s * 0.06);
    Gdiplus::Pen pen(Rgba(0, 0, 0, 0.12 * alpha), R(i == 0 ? s * 0.24 : s * 0.12));
    pen.SetLineJoin(Gdiplus::LineJoinRound);
    g.DrawPath(&pen, &path);
    Gdiplus::SolidBrush brush(Rgba(0, 0, 0, 0.12 * alpha));
    g.FillPath(&brush, &path);
  }
  ArrowPath(path, as, px, py);
  Gdiplus::SolidBrush fill(Rgba(t.r, t.g, t.b, alpha));
  g.FillPath(&fill, &path);
  Gdiplus::Pen outline(Rgba(1, 1, 1, alpha), R(std::max(1.0, s * 0.085)));
  outline.SetLineJoin(Gdiplus::LineJoinRound);
  g.DrawPath(&outline, &path);

  if (t.act == CursorAct::kTyping) {
    const double phase =
        t.reduce_motion ? 0.5 : std::fmod(static_cast<double>(now % kFloatPeriodUs) / kFloatPeriodUs * 5, 1);
    const double r = std::max(1.1, s * 0.085);
    for (int i = 0; i < 3; i++) {
      double beat = std::fmod(phase - i / 3.0, 1);
      if (beat < 0) beat += 1;
      const double up = Clamp01(std::sin(kPi * beat));
      const double dx = px + s * (0.82 + i * 0.3), dy = py + s * 0.5;
      Gdiplus::SolidBrush white(Rgba(1, 1, 1, alpha));
      g.FillEllipse(&white, R(dx - r - 0.8), R(dy - r - 0.8), R((r + 0.8) * 2), R((r + 0.8) * 2));
      Gdiplus::SolidBrush dot(Rgba(t.r, t.g, t.b, (0.45 + 0.55 * up) * alpha));
      g.FillEllipse(&dot, R(dx - r), R(dy - r), R(r * 2), R(r * 2));
    }
  }
  if (!t.label.empty()) DrawLabel(g, px + s * 0.78, py + s * 1.02, t, alpha);
}

// Draws one frame into a 32-bit premultiplied bitmap and hands it to the layered window.
void Render() {
  if (!g_cursor || !g_cursor->window) return;
  RECT rc;
  GetClientRect(g_cursor->host, &rc);
  const int pw = std::max<LONG>(1, rc.right - rc.left), ph = std::max<LONG>(1, rc.bottom - rc.top);
  HDC screen = GetDC(nullptr);
  HDC mem = CreateCompatibleDC(screen);
  BITMAPINFO bmi = {};
  bmi.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
  bmi.bmiHeader.biWidth = pw;
  bmi.bmiHeader.biHeight = -ph;
  bmi.bmiHeader.biPlanes = 1;
  bmi.bmiHeader.biBitCount = 32;
  bmi.bmiHeader.biCompression = BI_RGB;
  void* bits = nullptr;
  HBITMAP bmp = CreateDIBSection(mem, &bmi, DIB_RGB_COLORS, &bits, nullptr, 0);
  if (bmp) {
    HGDIOBJ old = SelectObject(mem, bmp);
    {
      Gdiplus::Bitmap canvas(pw, ph, pw * 4, PixelFormat32bppPARGB, static_cast<BYTE*>(bits));
      Gdiplus::Graphics g(&canvas);
      g.SetSmoothingMode(Gdiplus::SmoothingModeAntiAlias);
      g.SetTextRenderingHint(Gdiplus::TextRenderingHintAntiAliasGridFit);
      g.Clear(Gdiplus::Color(0, 0, 0, 0));
      const double sc = g_cursor->scale > 0 ? g_cursor->scale : 1;
      g.ScaleTransform(static_cast<Gdiplus::REAL>(sc), static_cast<Gdiplus::REAL>(sc));
      Paint(g, pw / sc, ph / sc, Now());
    }
    POINT src = {0, 0};
    SIZE size = {pw, ph};
    BLENDFUNCTION blend = {AC_SRC_OVER, 0, 255, AC_SRC_ALPHA};
    UpdateLayeredWindow(g_cursor->window, screen, nullptr, &size, mem, &src, 0, &blend, ULW_ALPHA);
    SelectObject(mem, old);
    DeleteObject(bmp);
  }
  DeleteDC(mem);
  ReleaseDC(nullptr, screen);
}

void SyncShown() {
  if (!g_cursor || !g_cursor->window) return;
  const bool want = g_cursor->shown &&
                    (g_cursor->has_target || g_cursor->fade_to > 0 || g_cursor->fade_from > 0);
  if (want) {
    SetWindowPos(g_cursor->window, HWND_TOP, 0, 0, 0, 0,
                 SWP_NOMOVE | SWP_NOSIZE | SWP_NOACTIVATE | SWP_SHOWWINDOW);
  } else {
    ShowWindow(g_cursor->window, SW_HIDE);
  }
}

void Tick() {
  if (!g_cursor) return;
  const long long now = Now();
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
  if (g_cursor->shown) Render();
  if (!g_cursor->has_target && Fade(now) <= 0) {
    g_cursor->fade_from = g_cursor->fade_to = 0;
    SyncShown();
    KillTimer(g_cursor->window, kTickTimer);
    g_cursor->ticking = false;
  }
}

void EnsureTicking() {
  if (!g_cursor || !g_cursor->window || g_cursor->ticking) return;
  g_cursor->ticking = true;
  SetTimer(g_cursor->window, kTickTimer, 16, nullptr);
}

LRESULT CALLBACK CursorProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
  switch (msg) {
    case WM_TIMER:
      if (wp == kTickTimer) Tick();
      return 0;
    case WM_NCHITTEST:
      return HTTRANSPARENT;  // Every click goes to the page below.
    case WM_MOUSEACTIVATE:
      return MA_NOACTIVATE;
  }
  return DefWindowProcW(hwnd, msg, wp, lp);
}

}  // namespace

void CursorCreate(HWND host) {
  if (!g_cursor) g_cursor = new Cursor();
  if (g_cursor->window) return;
  g_cursor->host = host;
  Gdiplus::GdiplusStartupInput input;
  Gdiplus::GdiplusStartup(&g_cursor->gdiplus_token, &input, nullptr);
  WNDCLASSW wc = {};
  wc.lpfnWndProc = CursorProc;
  wc.hInstance = GetModuleHandleW(nullptr);
  wc.lpszClassName = kClassName;
  wc.hCursor = nullptr;
  RegisterClassW(&wc);  // Fails harmlessly when already registered.
  RECT rc;
  GetClientRect(host, &rc);
  // A layered child window (Windows 8+, declared in runner.exe.manifest): per-pixel alpha, and
  // WS_EX_TRANSPARENT so hit-testing passes through to the page.
  g_cursor->window = CreateWindowExW(WS_EX_LAYERED | WS_EX_TRANSPARENT | WS_EX_NOACTIVATE, kClassName,
                                     L"", WS_CHILD, 0, 0, rc.right - rc.left, rc.bottom - rc.top,
                                     host, nullptr, wc.hInstance, nullptr);
}

void CursorFit(double scale) {
  if (!g_cursor || !g_cursor->window) return;
  g_cursor->scale = scale;
  RECT rc;
  GetClientRect(g_cursor->host, &rc);
  SetWindowPos(g_cursor->window, HWND_TOP, 0, 0, rc.right - rc.left, rc.bottom - rc.top,
               SWP_NOACTIVATE);
  if (g_cursor->shown) Render();
}

void CursorSetShown(bool shown) {
  if (!g_cursor || !g_cursor->window) return;
  g_cursor->shown = shown;
  SyncShown();
  if (shown) EnsureTicking();
}

void CursorSet(const CursorTarget& t) {
  if (!g_cursor) g_cursor = new Cursor();
  const long long now = Now();
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
    EnsureTicking();
    return;
  }
  g_cursor->nudge_dir = t.nudge;
  const bool appearing = !was || Fade(now) <= 0;
  const bool moved = !was || old.x != t.x || old.y != t.y;
  FloatTo(0, now);
  if (appearing || t.reduce_motion || !moved) {
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

bool CursorIsVisible() { return g_cursor && g_cursor->shown && g_cursor->has_target; }

void CursorDestroy() {
  if (!g_cursor) return;
  if (g_cursor->window) {
    KillTimer(g_cursor->window, kTickTimer);
    DestroyWindow(g_cursor->window);
  }
  if (g_cursor->gdiplus_token) Gdiplus::GdiplusShutdown(g_cursor->gdiplus_token);
  delete g_cursor;
  g_cursor = nullptr;
}
