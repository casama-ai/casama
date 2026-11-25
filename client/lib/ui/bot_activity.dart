import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../core/widgets.dart';
import 'motion.dart';
import '../theme/app_colors.dart';
import '../theme/app_tokens.dart';

/// What a bot needs from you (a count) or, with nothing waiting, that it is working (moving dots).
class BotActivity extends StatelessWidget {
  const BotActivity({super.key, required this.count, required this.working});
  final int count;
  final bool working;

  @override
  Widget build(BuildContext context) {
    if (count > 0) return Semantics(label: context.l10n.botWaitingCount(count), child: ExcludeSemantics(child: CountPill(count)));
    if (!working) return const SizedBox.shrink();
    return const _WorkingDots();
  }
}

/// Three dots rising in turn, like someone typing. Redrawn a dozen times a second, not on every
/// frame: a bot can show as working for hours (D-549).
class _WorkingDots extends StatelessWidget {
  const _WorkingDots();

  @override
  Widget build(BuildContext context) {
    final color = context.appColors.working;
    return SizedBox(
      key: const Key('botWorking'),
      width: 22,
      height: 12,
      child: LowRatePhase(
        period: const Duration(milliseconds: 1100),
        builder: (context, phase, _) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < 3; i++)
              Builder(
                builder: (context) {
                  // Each dot peaks a third of the cycle after the one before.
                  final t = ((phase - i / 3) % 1 + 1) % 1;
                  final lift = t < 0.5 ? math.sin(t * 2 * math.pi) : 0.0;
                  return Transform.translate(
                    offset: Offset(0, -3 * lift.clamp(0, 1)),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(color: color.withValues(alpha: 0.5 + 0.5 * lift.clamp(0, 1)), shape: BoxShape.circle),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class CountPill extends StatelessWidget {
  const CountPill(this.count, {super.key});
  final int count;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(color: context.colorScheme.primary, borderRadius: BorderRadius.circular(AppRadius.pill)),
    child: Text(
      count > 99 ? '99+' : '$count',
      style: context.textTheme.labelSmall?.copyWith(color: context.colorScheme.onPrimary, fontWeight: FontWeight.w800, fontFeatures: AppText.tabular),
    ),
  );
}

