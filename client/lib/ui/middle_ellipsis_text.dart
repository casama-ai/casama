import 'package:material_ui/material_ui.dart';

/// One line of text that, when it doesn't fit, keeps its start and its end and drops the middle
/// ("UT 117 Win…earch A"), so names that differ only at the end stay apart. The sidebar cut both
/// "UT 117 Win Research A" and "…B" to "UT 117 Win Researc…" (the customer's build 117 round,
/// W-N11). Hovering shows the whole text when it was shortened.
class MiddleEllipsisText extends StatelessWidget {
  const MiddleEllipsisText(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  static const _ellipsis = '…';

  /// [text] shortened in the middle to fit [maxWidth], or [text] itself when it fits.
  static String fit(
    String text,
    TextStyle? style,
    double maxWidth,
    TextScaler scaler,
    TextDirection direction,
  ) {
    bool fits(String s) {
      final p = TextPainter(
        text: TextSpan(text: s, style: style),
        maxLines: 1,
        textDirection: direction,
        textScaler: scaler,
      )..layout();
      final ok = p.width <= maxWidth;
      p.dispose();
      return ok;
    }

    if (fits(text)) return text;
    final chars = text.characters.toList();
    // The most characters kept (split between start and end, the end a little shorter) that fit.
    var lo = 0, hi = chars.length - 1;
    String build(int keep) {
      final tail = keep ~/ 2;
      final head = keep - tail;
      return '${chars.take(head).join().trimRight()}$_ellipsis${chars.skip(chars.length - tail).join().trimLeft()}';
    }

    while (lo < hi) {
      final mid = (lo + hi + 1) ~/ 2;
      if (fits(build(mid))) {
        lo = mid;
      } else {
        hi = mid - 1;
      }
    }
    return build(lo);
  }

  @override
  Widget build(BuildContext context) {
    final merged = DefaultTextStyle.of(context).style.merge(style);
    return LayoutBuilder(
      builder: (context, constraints) {
        final shown = constraints.maxWidth.isFinite
            ? fit(
                text,
                merged,
                constraints.maxWidth,
                MediaQuery.textScalerOf(context),
                Directionality.of(context),
              )
            : text;
        final line = Text(
          shown,
          style: style,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.clip,
          semanticsLabel: text,
        );
        if (shown == text) return line;
        return Tooltip(
          message: text,
          waitDuration: const Duration(milliseconds: 400),
          child: line,
        );
      },
    );
  }
}
