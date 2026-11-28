import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../ui/bot_cursor.dart';
import 'app_browser_controller.dart';

// The glow around the in-app browser's page while a bot drives it (docs/APP-BROWSER-GLOW-PLAN.md):
// a frame in the brand color with a band of light travelling round it, amber and still while the
// bot waits for the person, nothing once the person has the page.

/// How the frame around the page looks (plan §2).
enum AppBrowserGlow {
  /// No frame: no bot, the person took over, the run is away, or the person browses by hand.
  off,

  /// The bot is driving the page: brand color, a travelling band, a soft breathing halo.
  driving,

  /// The bot asks the person something or handed the page over: steady amber.
  waiting,
}

/// The look for session [s] (plan §4.1).
AppBrowserGlow appBrowserGlowFor(AppBrowserSession s) {
  if (s.person || s.run == null) return AppBrowserGlow.off;
  return switch (s.phase) {
    AppBrowserPhase.working => AppBrowserGlow.driving,
    AppBrowserPhase.asking ||
    AppBrowserPhase.yourTurn => AppBrowserGlow.waiting,
    _ => AppBrowserGlow.off,
  };
}

/// The brand color made vivid for the glow: the dark theme's primary is a pale pastel that barely
/// shows against a white page, so the glow keeps the hue and raises saturation and lightness to a
/// fixed, bright level in both themes.
Color appBrowserGlowVivid(Color primary) {
  final hsl = HSLColor.fromColor(primary);
  return hsl.withSaturation(0.9).withLightness(0.62).toColor();
}

/// The bands' highlight: the glow's hue turned toward pink and lightened, so the moving light
/// reads as a different color from the frame it runs along.
Color _bandLight(Color color) {
  final hsl = HSLColor.fromColor(color);
  return hsl
      .withHue((hsl.hue + 35) % 360)
      .withSaturation(1)
      .withLightness(0.78)
      .toColor();
}

/// Whether the glow may move (the travelling band, breathing and step pulse), and the bot's cursor
/// drift over the page. Tests turn it off so `pumpAndSettle` settles; Reduce Motion turns it off
/// too (plan §4.5).
final appBrowserGlowMotionProvider = Provider<bool>((ref) => true);

/// The frame around [child] (the page area). The page is inset by [margin] while a frame shows and
/// the frame is painted in that margin, so nothing needs to draw above the page's native view. On
/// iOS and Android a faint wash also reaches a few points onto the page's edge (plan §4.4). Not on
/// Linux, where the GTK overlay covers Flutter, and not on macOS, where anything Flutter paints over
/// the page takes the mouse from it, `IgnorePointer` or not. Takes no touches.
class AppBrowserDriveGlow extends ConsumerStatefulWidget {
  const AppBrowserDriveGlow({super.key, required this.child});

  final Widget child;

  /// How far the page moves in while a frame shows.
  static const margin = 8.0;

  @override
  ConsumerState<AppBrowserDriveGlow> createState() =>
      _AppBrowserDriveGlowState();
}

class _AppBrowserDriveGlowState extends ConsumerState<AppBrowserDriveGlow>
    with TickerProviderStateMixin {
  /// 0 → 1 as the frame comes in; also drives the inset.
  late final AnimationController _show = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
    reverseDuration: const Duration(milliseconds: 300),
  )..addStatusListener(_onShowStatus);

  /// One lap of the travelling band. Repeats only while the frame shows and may move.
  late final AnimationController _lap = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );

  /// The short brightening on each bot step, in time with the cursor's click ring.
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
    value: 1,
  );

  /// 1 while driving, 0 while waiting; eases between the two.
  late final AnimationController _drive = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
  );

  AppBrowserGlow _look = AppBrowserGlow.off;
  bool _moves = true;
  int? _lastStep;
  late final BotCursorController _cursor;

  @override
  void initState() {
    super.initState();
    _cursor = ref.read(appBrowserProvider.notifier).cursor;
    _cursor.addListener(_onCursor);
    _drive.addListener(_retint);
  }

  @override
  void dispose() {
    _cursor.removeListener(_onCursor);
    _show.dispose();
    _lap.dispose();
    _pulse.dispose();
    _drive.dispose();
    super.dispose();
  }

  void _onShowStatus(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) _lap.stop();
  }

  void _onCursor() {
    final step = _cursor.target?.step;
    if (step == null || step == _lastStep) return;
    _lastStep = step;
    if (_moves && _look == AppBrowserGlow.driving) _pulse.forward(from: 0);
  }

  void _retint() {
    if (mounted) setState(() {});
  }

  /// Moves the animations to [look].
  void _apply(AppBrowserGlow look, bool moves) {
    final changed = look != _look || moves != _moves;
    _look = look;
    _moves = moves;
    if (!changed) return;
    switch (look) {
      case AppBrowserGlow.off:
        _show.reverse();
      case AppBrowserGlow.driving:
        _show.forward();
        moves ? _drive.forward() : _drive.value = 1;
        if (moves) {
          if (!_lap.isAnimating) _lap.repeat();
        } else {
          _lap.stop();
          _pulse.value = 1;
        }
      case AppBrowserGlow.waiting:
        _show.forward();
        moves ? _drive.reverse() : _drive.value = 0;
        // No band while waiting, but the frame keeps breathing slowly, so it never looks frozen.
        if (moves) {
          if (!_lap.isAnimating) _lap.repeat();
        } else {
          _lap.stop();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final look = appBrowserGlowFor(ref.watch(appBrowserProvider));
    final moves =
        ref.watch(appBrowserGlowMotionProvider) &&
        !MediaQuery.disableAnimationsOf(context);
    // The animations follow the look after this frame: a controller can't notify during build.
    if (look != _look || moves != _moves) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _apply(look, moves);
      });
    }
    final dark = Theme.of(context).brightness == Brightness.dark;
    final color = Color.lerp(
      context.appColors.waiting,
      appBrowserGlowVivid(context.colorScheme.primary),
      _drive.value,
    )!;
    // Not macOS: there a layer Flutter paints over the page takes every click and scroll from it,
    // so the person couldn't scroll the page or take over by clicking it.
    final drawsOverPage =
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android;
    final semantics = look == AppBrowserGlow.off
        ? null
        : context.l10n.appBrowserWorking(
            ref.watch(appBrowserProvider.select((s) => s.run?.botName ?? '')),
          );

    return AnimatedBuilder(
      animation: _show,
      builder: (context, child) {
        final shown = Curves.easeOutCubic.transform(_show.value);
        final inset = AppBrowserDriveGlow.margin * shown;
        return Stack(
          fit: StackFit.expand,
          children: [
            if (_show.value > 0)
              Positioned.fill(
                child: IgnorePointer(
                  child: RepaintBoundary(
                    child: CustomPaint(
                      key: const Key('appBrowserGlow'),
                      painter: _GlowPainter(
                        repaint: Listenable.merge([_lap, _pulse]),
                        lap: _lap,
                        pulse: _pulse,
                        shown: shown,
                        drive: _drive.value,
                        inset: inset,
                        color: color,
                        dark: dark,
                        moves: _moves,
                      ),
                    ),
                  ),
                ),
              ),
            Padding(padding: EdgeInsets.all(inset), child: child),
            if (_show.value > 0 && drawsOverPage)
              Positioned.fill(
                child: IgnorePointer(
                  child: RepaintBoundary(
                    child: CustomPaint(
                      key: const Key('appBrowserGlowWash'),
                      painter: _WashPainter(
                        repaint: Listenable.merge([_lap, _pulse]),
                        lap: _lap,
                        moves: _moves,
                        pulse: _pulse,
                        shown: shown,
                        inset: inset,
                        color: color,
                        dark: dark,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
      child: Semantics(
        container: true,
        label: semantics,
        child: RepaintBoundary(child: widget.child),
      ),
    );
  }
}

const _radius = 10.0;

RRect _frame(Size size, double inset) => RRect.fromRectAndRadius(
  (Offset.zero & size).deflate(math.max(inset - 1, 0)),
  const Radius.circular(_radius),
);

/// The frame in the margin: a blurred outer halo and a 2.5 px stroke with a travelling band of light.
class _GlowPainter extends CustomPainter {
  _GlowPainter({
    required Listenable repaint,
    required this.lap,
    required this.pulse,
    required this.shown,
    required this.drive,
    required this.inset,
    required this.color,
    required this.dark,
    required this.moves,
  }) : super(repaint: repaint);

  final Animation<double> lap;
  final Animation<double> pulse;
  final double shown;
  final double drive;
  final double inset;
  final Color color;
  final bool dark;
  final bool moves;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty || shown <= 0) return;
    final frame = _frame(size, inset);
    final rect = Offset.zero & size;
    final t = lap.value;
    // Breathing: a pulse every 1.5 s while driving, a slower one every 3 s while waiting; with
    // motion off the frame holds halfway.
    final fast = 0.5 - 0.5 * math.cos(t * 4 * math.pi);
    final slow = 0.5 - 0.5 * math.cos(t * 2 * math.pi);
    final breath = moves ? fast * drive + slow * (1 - drive) : 0.5;
    final kick = moves ? (1 - Curves.easeOut.transform(pulse.value)) : 0.0;
    final haloAlpha =
        ((dark ? 0.45 : 0.35) + (dark ? 0.5 : 0.4) * breath + 0.35 * kick) *
        shown;

    // The halo swells and settles with the breath (a wave of light out into the margin).
    canvas.drawRRect(
      frame,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3 + 9 * breath + 4 * kick
        ..color = color.withValues(alpha: haloAlpha.clamp(0, 1))
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4 + 5 * breath),
    );

    // The stroke: an even line in [color], with two bright bands chasing round while driving.
    final band = drive * shown;
    // While driving the rest of the frame dims a little, so the bands stand out against it.
    final base = color.withValues(
      alpha: ((0.9 - 0.4 * drive + 0.1 * breath + 0.2 * kick) * shown).clamp(
        0,
        1,
      ),
    );
    final Paint stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    if (band <= 0.01) {
      stroke.color = base;
    } else {
      final light = _bandLight(color);
      final bright = Color.lerp(base, light.withValues(alpha: shown), band)!;
      final turn = GradientRotation(t * 2 * math.pi);
      stroke.shader = SweepGradient(
        colors: [base, base, bright, base, base, bright, base, base],
        stops: const [0, 0.1, 0.25, 0.4, 0.6, 0.75, 0.9, 1],
        transform: turn,
      ).createShader(rect);
      // The bands' own glow, so they read as light rather than a line.
      final glow = light.withValues(alpha: band);
      const clear = Colors.transparent;
      canvas.drawRRect(
        frame,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7)
          ..shader = SweepGradient(
            colors: [clear, clear, glow, clear, clear, glow, clear, clear],
            stops: const [0, 0.13, 0.25, 0.37, 0.63, 0.75, 0.87, 1],
            transform: turn,
          ).createShader(rect),
      );
    }
    canvas.drawRRect(frame, stroke);
  }

  @override
  bool shouldRepaint(_GlowPainter old) =>
      old.shown != shown ||
      old.drive != drive ||
      old.inset != inset ||
      old.color != color ||
      old.dark != dark ||
      old.moves != moves;
}

/// A faint wash a few points onto the page's edge (only where Flutter draws above the page).
class _WashPainter extends CustomPainter {
  _WashPainter({
    required Listenable repaint,
    required this.lap,
    required this.moves,
    required this.pulse,
    required this.shown,
    required this.inset,
    required this.color,
    required this.dark,
  }) : super(repaint: repaint);

  final Animation<double> lap;
  final bool moves;
  final Animation<double> pulse;
  final double shown;
  final double inset;
  final Color color;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty || shown <= 0) return;
    final breath = moves ? 0.5 - 0.5 * math.cos(lap.value * 4 * math.pi) : 0.5;
    final page = RRect.fromRectAndRadius(
      (Offset.zero & size).deflate(inset),
      const Radius.circular(_radius - 1),
    );
    final kick = 1 - Curves.easeOut.transform(pulse.value);
    canvas
      ..save()
      ..clipRRect(page);
    canvas.drawRRect(
      page,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..color = color.withValues(
          alpha: ((dark ? 0.16 : 0.1) + 0.14 * breath + 0.15 * kick) * shown,
        )
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_WashPainter old) =>
      old.shown != shown ||
      old.inset != inset ||
      old.color != color ||
      old.dark != dark ||
      old.moves != moves;
}
