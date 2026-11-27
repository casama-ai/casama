import 'package:casama_sdk/casama_sdk.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/motion.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'ui/admin_ui.dart';

/// Server capacity (D-250): null when the server has no capacity report (an older server).
final adminCapacityProvider = FutureProvider.autoDispose<ServerCapacity?>(
  (ref) => ref
      .watch(backendProvider)
      .adminCapacity()
      .then<ServerCapacity?>((c) => c, onError: (_) => null),
);

String _gb(num mb) => '${(mb / 1024).toStringAsFixed(1)} GB';

/// How full the server is: computers against their memory budget now, the daily peak over 30 days
/// with the budget line, when it fills up at the current trend, refusals and recent alerts.
class CapacityCard extends ConsumerWidget {
  const CapacityCard({super.key});

  // Its data loads after the screen: it slides in rather than pushing what's around it.
  @override
  Widget build(BuildContext context, WidgetRef ref) => ShowHide(child: _card(context, ref));

  Widget? _card(BuildContext context, WidgetRef ref) {
    final c = ref.watch(adminCapacityProvider).value;
    if (c == null) return null;
    final l10n = context.l10n;
    final colors = context.appColors;
    final scheme = context.colorScheme;
    final latest = c.latest;
    final budget = c.budgetMb;
    final used = latest?.computersMemMb ?? 0;
    final share = budget > 0 ? (used / budget).clamp(0.0, 1.0) : 0.0;
    final tone = share >= 0.9
        ? AdminTone.negative
        : (share >= 0.6 ? AdminTone.warning : AdminTone.positive);
    final barColor = adminToneColor(context, tone);
    final weeks = c.fullInWeeks;
    final forecast = budget <= 0
        ? l10n.adminCapacityNoBudget
        : weeks == null
        ? l10n.adminCapacityNoGrowth
        : weeks == 0
        ? l10n.adminCapacityFullNow
        : l10n.adminCapacityFullIn(weeks.round().clamp(1, 999));
    final muted = context.textTheme.bodySmall?.copyWith(
      color: scheme.onSurfaceVariant,
    );
    return Column(
      key: const Key('capacityCard'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.adminCapacityTitle),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if ((c.alarm?.level ?? 0) > 0) ...[
                _AlarmBanner(alarm: c.alarm!),
                const SizedBox(height: AppSpace.md),
              ],
              if (latest == null)
                FormNote(
                  l10n.adminCapacityNoData,
                  key: const Key('capacityNoData'),
                  icon: LucideIcons.hourglass,
                )
              else ...[
                Row(
                  children: [
                    Icon(LucideIcons.memoryStick, size: 18, color: barColor),
                    const SizedBox(width: AppSpace.xs),
                    Expanded(
                      child: Text(
                        budget > 0
                            ? l10n.adminCapacityComputers(
                                _gb(used),
                                _gb(budget),
                              )
                            : l10n.adminCapacityComputersNoBudget(_gb(used)),
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      '${latest.computersRunning}',
                      style: context.textTheme.titleSmall?.copyWith(
                        fontFeatures: AppText.tabular,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      LucideIcons.monitor,
                      size: 16,
                      color: scheme.onSurfaceVariant,
                    ),
                  ],
                ),
                if (budget > 0) ...[
                  const SizedBox(height: AppSpace.xs),
                  AdminMeter(
                    key: const Key('capacityMeter'),
                    fraction: share,
                    tone: tone,
                  ),
                ],
                const SizedBox(height: AppSpace.sm),
                Wrap(
                  spacing: AppSpace.md,
                  runSpacing: AppSpace.xs,
                  children: [
                    Text(
                      l10n.adminCapacityFree(
                        _gb(latest.memAvailableMb),
                        _gb(latest.memTotalMb),
                      ),
                      style: muted,
                    ),
                    if (latest.diskUsedPct != null)
                      Text(
                        l10n.adminCapacityDisk(latest.diskUsedPct!.round()),
                        style: muted,
                      ),
                    Text(
                      l10n.adminCapacityLoad(
                        latest.load1.toStringAsFixed(1),
                        latest.cpus,
                      ),
                      style: muted,
                    ),
                  ],
                ),
              ],
              if (c.days.length > 1) ...[
                const SizedBox(height: AppSpace.md),
                Text(
                  l10n.adminCapacityPeakChart,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpace.xs),
                SizedBox(
                  height: 140,
                  child: _PeakChart(days: c.days.toList(), budgetMb: budget),
                ),
              ],
              const SizedBox(height: AppSpace.sm),
              Row(
                children: [
                  Icon(
                    LucideIcons.trendingUp,
                    size: 16,
                    color: weeks != null && weeks < 6
                        ? colors.warning
                        : scheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSpace.xs),
                  Expanded(
                    child: Text(
                      forecast,
                      key: const Key('capacityForecast'),
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.xs),
              Text(
                l10n.adminCapacityRefusals(c.refusals30d),
                style: muted?.copyWith(
                  color: c.refusals30d > 0 ? colors.negative : null,
                ),
              ),
              for (final a in c.alerts.take(3)) ...[
                const SizedBox(height: AppSpace.xs),
                Text('${a.day}: ${a.body}', style: muted),
              ],
            ],
          ),
        ),
        const SizedBox(height: AppSpace.lg),
      ],
    );
  }
}

/// How often each alarm level pushes, in minutes; null = once (D-601, matches the server).
const _alarmRepeatMin = {70: null, 80: 30, 90: 15, 95: 5, 100: 5};

/// The capacity alarm (D-601): its level, how often it pushes, and Snooze 1 hour / I'm upgrading.
class _AlarmBanner extends ConsumerStatefulWidget {
  const _AlarmBanner({required this.alarm});
  final CapacityAlarm alarm;

  @override
  ConsumerState<_AlarmBanner> createState() => _AlarmBannerState();
}

class _AlarmBannerState extends ConsumerState<_AlarmBanner> {
  bool _busy = false;

  String _time(String iso) =>
      TimeOfDay.fromDateTime(DateTime.parse(iso).toLocal()).format(context);

  Future<void> _snooze(int minutes) async {
    setState(() => _busy = true);
    final a = await runGuarded(
      context,
      () => ref.read(backendProvider).snoozeCapacityAlarm(minutes),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    final until = a?.snoozedUntil;
    if (until != null) {
      showSuccess(context, context.l10n.adminCapacitySnoozedDone(_time(until)));
    }
    ref.invalidate(adminCapacityProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final level = widget.alarm.level;
    final tone = level >= 90 ? AdminTone.negative : AdminTone.warning;
    final color = adminToneColor(context, tone);
    final title = switch (level) {
      >= 100 => l10n.adminCapacityAlarmFull,
      >= 95 => l10n.adminCapacityAlarm95,
      >= 90 => l10n.adminCapacityAlarm90,
      >= 80 => l10n.adminCapacityAlarm80,
      _ => l10n.adminCapacityAlarm70,
    };
    final every = _alarmRepeatMin[level];
    final until = widget.alarm.snoozedUntil;
    final snoozed = until != null && DateTime.parse(until).isAfter(DateTime.now());
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );
    return Container(
      key: const Key('capacityAlarm'),
      padding: const EdgeInsets.all(AppSpace.sm),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: AppRadius.rowAll,
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(LucideIcons.siren, size: 18, color: color),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            snoozed
                ? l10n.adminCapacityAlarmSnoozed(_time(until))
                : every == null
                ? l10n.adminCapacityAlarmOnce
                : l10n.adminCapacityAlarmRepeats(every),
            key: const Key('capacityAlarmNote'),
            style: muted,
          ),
          if (every != null) ...[
            const SizedBox(height: AppSpace.sm),
            Wrap(
              spacing: AppSpace.sm,
              runSpacing: AppSpace.xs,
              children: [
                OutlinedButton.icon(
                  key: const Key('capacitySnoozeHour'),
                  onPressed: _busy ? null : () => _snooze(60),
                  icon: const Icon(LucideIcons.bellOff, size: 16),
                  label: Text(l10n.adminCapacitySnoozeHour),
                ),
                FilledButton.tonalIcon(
                  key: const Key('capacityUpgrading'),
                  onPressed: _busy ? null : () => _snooze(120),
                  icon: const Icon(LucideIcons.serverCog, size: 16),
                  label: Text(l10n.adminCapacityUpgrading),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _PeakChart extends StatelessWidget {
  const _PeakChart({required this.days, required this.budgetMb});
  final List<ServerCapacityDaysInner> days;
  final int budgetMb;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final peak = days.fold<int>(
      0,
      (m, d) => d.peakComputersMemMb > m ? d.peakComputersMemMb : m,
    );
    final top = (budgetMb > peak ? budgetMb : peak) * 1.1;
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: top <= 0 ? 1024 : top.toDouble(),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) =>
              FlLine(color: context.appColors.hairline, strokeWidth: 1),
        ),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          bottomTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 52,
              getTitlesWidget: (v, meta) => v == meta.max
                  ? const SizedBox.shrink()
                  : Text(
                      _gb(v),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                        fontFeatures: AppText.tabular,
                      ),
                    ),
            ),
          ),
        ),
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            if (budgetMb > 0)
              HorizontalLine(
                y: budgetMb.toDouble(),
                color: context.appColors.negative,
                strokeWidth: 1.5,
                dashArray: [6, 4],
              ),
          ],
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => scheme.inverseSurface,
            getTooltipItems: (spots) => [
              for (final s in spots)
                LineTooltipItem(
                  '${days[s.x.toInt()].day}\n${_gb(s.y)}',
                  context.textTheme.labelMedium!.copyWith(
                    color: scheme.onInverseSurface,
                  ),
                ),
            ],
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: false,
            color: scheme.primary,
            barWidth: 2,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: scheme.primary.withValues(alpha: 0.12),
            ),
            spots: [
              for (final (i, d) in days.indexed)
                FlSpot(i.toDouble(), d.peakComputersMemMb.toDouble()),
            ],
          ),
        ],
      ),
    );
  }
}
