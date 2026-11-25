import 'package:casama_sdk/casama_sdk.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/widgets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import 'cost_format.dart';

/// The round mark that carries a row's colour.
class CostDot extends StatelessWidget {
  const CostDot(this.color, {super.key, this.size = 10});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

/// A bar as long as [fraction] of its track. Anything above zero keeps a sliver, so a small row
/// next to a giant one still reads as "something".
class CostBar extends StatelessWidget {
  const CostBar({
    super.key,
    required this.fraction,
    required this.color,
    this.height = 5,
  });
  final double fraction;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    final f = fraction.isFinite ? fraction.clamp(0.0, 1.0) : 0.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(
              color: context.colorScheme.onSurface.withValues(
                alpha: context.isDark ? 0.09 : 0.06,
              ),
            ),
            if (f > 0)
              FractionallySizedBox(
                alignment: AlignmentDirectional.centerStart,
                widthFactor: f < 0.012 ? 0.012 : f,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(height),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// How a number moved: an arrow and a signed amount, in words for a screen reader. Never colour
/// alone, so it reads the same without it.
class CostChangeText extends StatelessWidget {
  const CostChangeText(this.change, {super.key, this.style, this.suffix});
  final CostChange change;
  final TextStyle? style;

  /// Words after the amount ("vs the 30 days before").
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    final muted = context.colorScheme.onSurfaceVariant;
    final s = (style ?? context.textTheme.bodySmall)?.copyWith(
      fontFeatures: AppText.tabular,
    );
    final size = (s?.fontSize ?? 12) * 0.95;
    return Semantics(
      label: change.spoken,
      excludeSemantics: true,
      child: Text.rich(
        TextSpan(
          children: [
            if (change.icon != null)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 2),
                  child: Icon(
                    change.icon,
                    size: MediaQuery.textScalerOf(context).scale(size),
                    color: s?.color ?? muted,
                  ),
                ),
              ),
            TextSpan(text: change.text),
            if (suffix != null)
              TextSpan(
                text: ' $suffix',
                style: TextStyle(color: muted, fontWeight: FontWeight.w400),
              ),
          ],
        ),
        style: s,
      ),
    );
  }
}

/// Where a row's number comes from, as a small label: Metered, Counted, Fixed or Estimated. An
/// estimate is outlined, so a lower bound isn't read as a bill.
class CostSourceBadge extends StatelessWidget {
  const CostSourceBadge(this.source, {super.key});
  final CostSource source;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final l10n = context.l10n;
    final soft = source == CostSource.estimated;
    final tint = soft ? context.appColors.warning : scheme.onSurfaceVariant;
    return Tooltip(
      message: costSourceHelp(l10n, source),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: soft
              ? Colors.transparent
              : scheme.onSurface.withValues(
                  alpha: context.isDark ? 0.09 : 0.06,
                ),
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: soft ? Border.all(color: tint.withValues(alpha: 0.7)) : null,
        ),
        child: Text(
          costSourceLabel(l10n, source),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.labelSmall?.copyWith(
            color: tint,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      ),
    );
  }
}

/// A label over a number, for the facts at the top of a detail.
class CostFact extends StatelessWidget {
  const CostFact({
    super.key,
    required this.label,
    required this.value,
    this.note,
    this.valueKey,
  });
  final String label;
  final String value;

  /// A word under the number, such as "estimated".
  final String? note;
  final Key? valueKey;

  @override
  Widget build(BuildContext context) {
    final muted = context.colorScheme.onSurfaceVariant;
    return Semantics(
      label: [label, value, ?note].join(', '),
      excludeSemantics: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelMedium?.copyWith(color: muted),
          ),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              value,
              key: valueKey,
              maxLines: 1,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontFeatures: AppText.tabular,
              ),
            ),
          ),
          if (note != null)
            Text(
              note!,
              style: context.textTheme.labelSmall?.copyWith(color: muted),
            ),
        ],
      ),
    );
  }
}
