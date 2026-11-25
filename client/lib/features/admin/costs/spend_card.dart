import 'dart:math' as math;

// The bot widgets' Canvas model would shadow dart:ui's Canvas this file paints on.
import 'package:casama_sdk/casama_sdk.dart' hide Canvas;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/backend.dart' show CostQuery;
import '../../../core/widgets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../../ui/app_card.dart';
import '../../../ui/motion.dart';
import 'cost_format.dart';
import 'cost_parts.dart';
import 'cost_view.dart';

/// The Overview's small spend card: the last 30 days' spent, charged and margin with the days as
/// a tiny line. A tap opens the Costs tab ([onOpen]). Nothing on a server without the cost routes.
class CostSpendCard extends ConsumerWidget {
  const CostSpendCard({super.key, required this.onOpen});
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The same request the Costs tab starts with, so opening the tab shows at once.
    final costs = ref.watch(adminCostsProvider(const CostQuery())).value;
    // It loads after the screen: it slides in rather than pushing what's around it.
    return ShowHide(child: costs == null ? null : _card(context, costs));
  }

  Widget _card(BuildContext context, AdminCosts costs) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final t = costs.totals;
    final margin = marginShare(t.chargedTrackedUsd, t.spentUsd);
    final daily = [
      for (final d in costs.byDay)
        d.values.fold<double>(0, (n, v) => n + v.toDouble()),
    ];
    final change = CostChange.of(l10n, t.spentUsd, costs.previous?.spentUsd);
    final muted = context.colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpace.md),
      child: Semantics(
        container: true,
        button: true,
        label: l10n.costSpendCardSemantics(
          costUsd(t.spentUsd, locale),
          costUsd(t.chargedUsd, locale),
          costPercent(margin),
        ),
        hint: l10n.costSpendCardHint,
        onTap: onOpen,
        excludeSemantics: true,
        child: AppCard(
          key: const Key('spendCard'),
          onTap: onOpen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.costSpendCardTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    l10n.costSpendCardOpen,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    LucideIcons.chevronRight,
                    size: 16,
                    color: context.colorScheme.primary,
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.sm),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpace.sm,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CostFact(
                          label: l10n.costSpent,
                          value: costUsd(t.spentUsd, locale),
                          valueKey: const Key('spendCard-spent'),
                        ),
                        CostChangeText(
                          change,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: CostFact(
                      label: l10n.costCharged,
                      value: costUsd(t.chargedUsd, locale),
                      valueKey: const Key('spendCard-charged'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CostFact(
                      label: l10n.costMargin,
                      value: costPercent(margin),
                      valueKey: const Key('spendCard-margin'),
                    ),
                  ),
                  if (daily.length > 1)
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 40,
                        child: CustomPaint(
                          painter: _Spark(daily, context.colorScheme.primary),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Spend by day as one line over a soft fill, without axes: the shape of the month at a glance.
class _Spark extends CustomPainter {
  _Spark(this.values, this.color);
  final List<double> values;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final high = values.fold<double>(0, math.max);
    if (values.length < 2 || high <= 0) return;
    final line = Path();
    for (final (i, v) in values.indexed) {
      final x = i * size.width / (values.length - 1);
      final y = size.height - 2 - v / high * (size.height - 4);
      i == 0 ? line.moveTo(x, y) : line.lineTo(x, y);
    }
    final fill = Path.from(line)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.22), color.withValues(alpha: 0)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..strokeWidth = 1.8
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(_Spark old) => old.color != color || old.values != values;
}
