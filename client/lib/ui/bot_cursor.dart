import 'dart:async';
import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

/// What the bot's cursor is doing at its spot (docs/BOT-CURSOR-PLAN.md §3).
enum BotCursorAct {
  /// Just there.
  rest,

  /// About to press: it dips and one ring spreads from its tip.
  click,

  /// Text is going in: three small dots beside it. Never the letters.
  typing,
}

/// Where the cursor should be, and why.
@immutable
class BotCursorTarget {
  const BotCursorTarget({
    required this.at,
    required this.of,
    required this.act,
    required this.step,
    this.nudge = 0,
  });

  /// The spot, in the pixels of the picture it was measured on.
  final Offset at;

  /// The size [at] is measured against. [Size.zero] when [at] is already in the layer's own points
  /// (the phone browser, where the page and the layer are the same size).
  final Size of;
  final BotCursorAct act;

  /// Goes up with every step, so a second click on the same spot still rings.
  final int step;

  /// A scroll: -1 up, 1 down, 0 none.
  final int nudge;
}

/// Places a target's spot in a layer of size [box]. The answer may be outside the box (a part of
/// the picture the surface crops away).
typedef BotCursorFit = Offset Function(Offset at, Size of, Size box);

/// How each surface fits its picture, so the cursor lands on the same pixel.
abstract final class BotCursorFits {
  /// The picture is stretched over the whole layer (the live view's canvas).
  static Offset fill(Offset at, Size of, Size box) => of.isEmpty
      ? at
      : Offset(at.dx / of.width * box.width, at.dy / of.height * box.height);

  /// The spot is already in the layer's own points (the phone browser).
  static Offset points(Offset at, Size of, Size box) => at;

  /// `BoxFit.cover` with [alignment]: the picture fills the layer and its overflow is cut off.
  static BotCursorFit cover([Alignment alignment = Alignment.center]) =>
      (at, of, box) => _fitted(at, of, box, alignment, cover: true);

  /// `BoxFit.contain` with [alignment]: the whole picture, with bars beside it.
  static BotCursorFit contain([Alignment alignment = Alignment.center]) =>
      (at, of, box) => _fitted(at, of, box, alignment, cover: false);

  /// An `Image` with no fit, centred: the whole picture, made smaller to fit but never larger.
  static Offset scaleDown(Offset at, Size of, Size box) =>
      _fitted(at, of, box, Alignment.center, cover: false, grow: false);

  static Offset _fitted(
    Offset at,
    Size of,
    Size box,
    Alignment alignment, {
    required bool cover,
    bool grow = true,
  }) {
    if (of.isEmpty || box.isEmpty) return at;
    final sx = box.width / of.width, sy = box.height / of.height;
    var scale = cover ? math.max(sx, sy) : math.min(sx, sy);
    if (!grow && scale > 1) scale = 1;
    final drawn = of * scale;
    // Where the drawn picture's top left sits in the box, as Flutter's Alignment places it.
    final left = (box.width - drawn.width) * (alignment.x + 1) / 2;
    final top = (box.height - drawn.height) * (alignment.y + 1) / 2;
    return Offset(left + at.dx * scale, top + at.dy * scale);
  }
}

/// The cursor of one screen: told where each step is about to act, it tells the layers drawing
/// it. It only ever goes where a real step happens (plan §2).
class BotCursorController extends ChangeNotifier {
  /// With no screen step for this long the cursor fades out (the screen card's own clock).
  static const idleLeave = Duration(seconds: 20);

  BotCursorTarget? _target;
  String? _typingCall;
  int _step = 0;
  Timer? _idle;
  bool _disposed = false;

  /// Null while there is no cursor to show.
  BotCursorTarget? get target => _target;

  void _set(BotCursorTarget? t) {
    if (_disposed) return;
    _target = t;
    _idle?.cancel();
    _idle = t == null ? null : Timer(idleLeave, leave);
    notifyListeners();
  }

  /// A step is about to act at [at], measured against a picture of size [of].
  void pointTo(
    Offset at, {
    required Size of,
    BotCursorAct act = BotCursorAct.click,
    String? callId,
  }) {
    if (!at.dx.isFinite || !at.dy.isFinite) return;
    _typingCall = act == BotCursorAct.typing ? callId : null;
    _set(BotCursorTarget(at: at, of: of, act: act, step: ++_step));
  }

  /// Text is going in where the cursor already is. Nothing when there is no cursor.
  void typing({String? callId}) {
    final t = _target;
    if (t == null) return;
    _typingCall = callId;
    _set(
      BotCursorTarget(
        at: t.at,
        of: t.of,
        act: BotCursorAct.typing,
        step: ++_step,
      ),
    );
  }

  /// The page is being scrolled. Nothing when there is no cursor.
  void scroll({required bool down}) {
    final t = _target;
    if (t == null) return;
    _typingCall = null;
    _set(
      BotCursorTarget(
        at: t.at,
        of: t.of,
        act: BotCursorAct.rest,
        step: ++_step,
        nudge: down ? 1 : -1,
      ),
    );
  }

  /// A step ended: the typing dots go. With [callId], only if that step is the one typing.
  void settle([String? callId]) {
    final t = _target;
    if (t == null || t.act != BotCursorAct.typing) return;
    if (callId != null && _typingCall != null && callId != _typingCall) return;
    _typingCall = null;
    // The same step: nothing moves or rings, the dots just go. The idle clock keeps running.
    _target = BotCursorTarget(
      at: t.at,
      of: t.of,
      act: BotCursorAct.rest,
      step: t.step,
    );
    if (!_disposed) notifyListeners();
  }

  /// The bot stopped driving this screen: the cursor fades out.
  void leave() {
    _typingCall = null;
    if (_target != null) _set(null);
  }

  @override
  void dispose() {
    _disposed = true;
    _idle?.cancel();
    super.dispose();
  }
}

/// Small on the card and the call's tile, large on the full views and the phone browser.
enum BotCursorSize {
  small(14),
  large(22);

  const BotCursorSize(this.points);
  final double points;
}

/// The bot's cursor, drawn over a picture of its screen or over the phone browser's page. Put it
/// in a [Stack] above the picture, the same size as it. It is decoration: nothing here takes a
/// touch or is read by a screen reader, and with Reduce Motion on it neither glides nor floats.
class BotCursor extends StatefulWidget {
  const BotCursor({
    super.key,
    required this.controller,
    required this.fit,
    this.size = BotCursorSize.small,
    this.color,
    this.label,
    this.visible = true,
  });

  final BotCursorController controller;
  final BotCursorFit fit;
  final BotCursorSize size;

  /// The bot's colour; the theme's primary when null.
  final Color? color;

  /// The bot's name beside the arrow, on the big surfaces only.
  final String? label;

  /// False hides it without losing its place (the person has the screen, the card is stale).
  final bool visible;

  @override
  State<BotCursor> createState() => _BotCursorState();
}

class _BotCursorState extends State<BotCursor> with TickerProviderStateMixin {
  /// Rests this long before it starts to drift.
  static const _restBeforeFloat = Duration(milliseconds: 1500);

  late final AnimationController _glide = AnimationController(
    vsync: this,
    value: 1,
  );
  late final AnimationController _ring = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
    value: 1,
  );
  late final AnimationController _nudge = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 360),
    value: 1,
  );
  late final AnimationController _fade = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 180),
  );
  late final AnimationController _float = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  );
  late final AnimationController _floatAmount = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );
  late final Listenable _all = Listenable.merge([
    _glide,
    _ring,
    _nudge,
    _fade,
    _float,
    _floatAmount,
  ]);

  BotCursorTarget? _shown;
  Offset _from = Offset.zero;
  Offset _to = Offset.zero;
  Size _of = Size.zero;
  int _nudgeDir = 0;
  bool _ringAfterGlide = false;
  Timer? _rest;
  bool _reduce = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_changed);
    _glide.addStatusListener((s) {
      if (s != AnimationStatus.completed) return;
      if (_ringAfterGlide) {
        _ringAfterGlide = false;
        _ring.forward(from: 0);
      }
      _restSoon();
    });
    final t = widget.controller.target;
    if (t != null) {
      // Already somewhere when this layer appeared: be there, without a show.
      _shown = t;
      _from = _to = t.at;
      _of = t.of;
      _fade.value = widget.visible ? 1 : 0;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduce = MediaQuery.disableAnimationsOf(context);
    _syncFloat();
  }

  @override
  void didUpdateWidget(BotCursor old) {
    super.didUpdateWidget(old);
    if (old.controller != widget.controller) {
      old.controller.removeListener(_changed);
      widget.controller.addListener(_changed);
      _changed();
    }
    if (old.visible != widget.visible) _syncFade();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_changed);
    _rest?.cancel();
    for (final c in [_glide, _ring, _nudge, _fade, _float, _floatAmount]) {
      c.dispose();
    }
    super.dispose();
  }

  /// Where the arrow's tip is right now, in picture pixels, along the bowed path.
  Offset get _now {
    final t = Curves.easeInOutCubic.transform(_glide.value);
    final d = _to - _from;
    if (d.distanceSquared < 1) return _to;
    // A quadratic curve through a point pushed off the straight line, so it reads as a hand
    // moving and not a slide.
    final mid = _from + d / 2 + Offset(d.dy, -d.dx) * 0.12;
    final a = Offset.lerp(_from, mid, t)!, b = Offset.lerp(mid, _to, t)!;
    return Offset.lerp(a, b, t)!;
  }

  void _changed() {
    final t = widget.controller.target;
    final was = _shown;
    if (t == null) {
      _shown = null;
      _rest?.cancel();
      _syncFade();
      return;
    }
    _shown = t;
    final sameStep = was != null && was.step == t.step;
    if (sameStep) {
      // Only what it is doing changed (the typing dots went).
      if (mounted) setState(() {});
      return;
    }
    _nudgeDir = t.nudge;
    final appearing = was == null || _fade.value == 0;
    final moved = was == null || was.at != t.at || was.of != t.of;
    _stopFloat();
    if (appearing || _reduce || !moved) {
      // The first time in a reply it fades in at the spot instead of flying in from a corner.
      _from = _to = t.at;
      _of = t.of;
      _ringAfterGlide = false;
      _glide.value = 1;
      if (t.act == BotCursorAct.click) _ring.forward(from: 0);
      _restSoon();
    } else {
      final here = _of == t.of ? _now : t.at;
      _from = here;
      _to = t.at;
      _of = t.of;
      // 300 to 650 ms, by how far it has to go across the picture.
      final far = t.of.isEmpty
          ? 0.5
          : ((_to - _from).distance / t.of.longestSide).clamp(0.0, 1.0);
      _glide.duration = Duration(milliseconds: (300 + 350 * far).round());
      _ringAfterGlide = t.act == BotCursorAct.click;
      _glide.forward(from: 0);
    }
    if (t.nudge != 0 && !_reduce) _nudge.forward(from: 0);
    _syncFade();
    if (mounted) setState(() {});
  }

  void _syncFade() {
    final show = _shown != null && widget.visible;
    if (_reduce) {
      _fade.value = show ? 1 : 0;
    } else if (show) {
      _fade.forward();
    } else {
      _fade.reverse();
    }
    _syncFloat();
  }

  void _restSoon() {
    _rest?.cancel();
    if (_reduce || _shown == null) return;
    _rest = Timer(_restBeforeFloat, () {
      if (!mounted || _shown == null) return;
      _floatAmount.forward();
    });
  }

  void _stopFloat() {
    _rest?.cancel();
    if (_floatAmount.value > 0) _floatAmount.reverse();
  }

  /// The drift and the typing dots run only while there is a cursor on screen to move.
  void _syncFloat() {
    final run = !_reduce && _shown != null && widget.visible;
    if (run && !_float.isAnimating) {
      _float.repeat();
    } else if (!run && _float.isAnimating) {
      _float.stop();
    }
    if (_reduce) _floatAmount.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.primary;
    return IgnorePointer(
      child: ExcludeSemantics(
        child: LayoutBuilder(
          builder: (context, area) {
            final box = area.biggest;
            if (!box.isFinite || box.isEmpty) return const SizedBox.shrink();
            return RepaintBoundary(
              child: AnimatedBuilder(
                animation: _all,
                builder: (context, _) {
                  if (_fade.value == 0) return const SizedBox.expand();
                  final s = widget.size.points;
                  var p = widget.fit(_now, _of, box);
                  // In a part the surface crops away: wait at that edge, half faded.
                  final inside = (Offset.zero & box).inflate(0.5).contains(p);
                  if (!inside) {
                    p = Offset(
                      p.dx.clamp(0.0, box.width),
                      p.dy.clamp(0.0, box.height),
                    );
                  }
                  final turn = _float.value * 2 * math.pi;
                  final drift =
                      Offset(math.sin(turn) * 2.6, math.sin(turn * 2) * 1.6) *
                      _floatAmount.value;
                  final scroll = Offset(
                    0,
                    _nudgeDir * 8 * math.sin(math.pi * _nudge.value),
                  );
                  final ring = _ring.value;
                  // The dip: down to 90% in the ring's first third, then back.
                  final dip = ring < 1
                      ? 1 -
                            0.1 *
                                math.sin(
                                  math.pi * (ring / 0.35).clamp(0.0, 1.0),
                                )
                      : 1.0;
                  final typing = _shown?.act == BotCursorAct.typing;
                  final tip = p + drift + scroll;
                  return Opacity(
                    opacity: _fade.value * (inside ? 1 : 0.45),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: tip.dx,
                          top: tip.dy,
                          child: CustomPaint(
                            key: const Key('botCursor'),
                            painter: _CursorPainter(
                              color: color,
                              size: s,
                              dip: dip,
                              ring: ring,
                              dots: typing
                                  ? (_reduce ? 0.5 : _float.value * 5 % 1)
                                  : null,
                            ),
                          ),
                        ),
                        if (widget.label != null && widget.label!.isNotEmpty)
                          Positioned(
                            left: tip.dx + s * 0.78,
                            top: tip.dy + s * 1.02,
                            child: _NameTag(name: widget.label!, color: color),
                          ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

/// The arrow (tip at the origin), its click ring and its typing dots.
class _CursorPainter extends CustomPainter {
  _CursorPainter({
    required this.color,
    required this.size,
    required this.dip,
    required this.ring,
    required this.dots,
  });
  final Color color;
  final double size;
  final double dip;

  /// 0 to 1 while a click's ring spreads; 1 when there is none.
  final double ring;

  /// The typing dots' phase, 0 to 1; null when not typing.
  final double? dots;

  // A classic arrow in a 1×1 box, tip at 0,0.
  static const _shape = [
    Offset(0, 0),
    Offset(0, 0.82),
    Offset(0.23, 0.62),
    Offset(0.40, 0.98),
    Offset(0.53, 0.92),
    Offset(0.36, 0.57),
    Offset(0.66, 0.57),
  ];

  @override
  void paint(Canvas canvas, Size _) {
    if (ring < 1) {
      final spread = Curves.easeOutCubic.transform(ring);
      canvas.drawCircle(
        Offset.zero,
        2 + (size * 1.05) * spread,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = math.max(1.2, size * 0.1) * (1 - spread * 0.5)
          ..color = color.withValues(alpha: 0.85 * (1 - spread)),
      );
    }
    final s = size * dip;
    final path = Path()..moveTo(_shape.first.dx * s, _shape.first.dy * s);
    for (final o in _shape.skip(1)) {
      path.lineTo(o.dx * s, o.dy * s);
    }
    path.close();
    canvas.drawPath(
      path.shift(Offset(0, size * 0.06)),
      Paint()
        ..color = Colors.black.withValues(alpha: 0.35)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, size * 0.12),
    );
    canvas.drawPath(path, Paint()..color = color);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = math.max(1.0, size * 0.085)
        ..color = Colors.white,
    );
    final phase = dots;
    if (phase != null) {
      final r = math.max(1.1, size * 0.085);
      for (var i = 0; i < 3; i++) {
        // Each dot swells a third of a beat after the one before it.
        final beat = (phase - i / 3) % 1;
        final up = math.sin(math.pi * beat).clamp(0.0, 1.0);
        final at = Offset(size * (0.82 + i * 0.3), size * 0.5);
        canvas.drawCircle(at, r + 0.8, Paint()..color = Colors.white);
        canvas.drawCircle(
          at,
          r,
          Paint()..color = color.withValues(alpha: 0.45 + 0.55 * up),
        );
      }
    }
  }

  @override
  bool shouldRepaint(_CursorPainter old) =>
      old.color != color ||
      old.size != size ||
      old.dip != dip ||
      old.ring != ring ||
      old.dots != dots;
}

class _NameTag extends StatelessWidget {
  const _NameTag({required this.name, required this.color});
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final onColor =
        ThemeData.estimateBrightnessForColor(color) == Brightness.dark
        ? Colors.white
        : Colors.black;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 120),
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              color: onColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
