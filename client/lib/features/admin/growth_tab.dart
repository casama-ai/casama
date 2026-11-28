import 'dart:math' as math;

import 'package:casama_sdk/casama_sdk.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/date_format.dart';
import '../../core/number_format.dart';
import '../../core/providers.dart';
import '../../core/selfhost_api.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import 'admin_nav.dart';
import 'costs/cost_format.dart' show costDay;
import 'live_users_card.dart';
import 'selfhost_licenses_tab.dart' show editionLabel;
import 'ui/admin_ui.dart';

/// Growth over the last [days] (D-530, docs/ADMIN-GROWTH-PLAN.md). Team accounts are left out.
final adminGrowthProvider = FutureProvider.family<AdminGrowth, int>(
  (ref, days) => ref.watch(backendProvider).adminGrowth(days: days),
);

/// The ranges the section offers, in days.
const kGrowthRanges = [7, 30, 90];

/// The admin console's Growth section: signups, who's active, first steps, coming back, money,
/// why runs failed and reply speed, all from the server's own tables.
class GrowthTab extends ConsumerStatefulWidget {
  const GrowthTab({super.key});

  @override
  ConsumerState<GrowthTab> createState() => _GrowthTabState();
}

class _GrowthTabState extends ConsumerState<GrowthTab> {
  int _days = 30;

  Future<void> _refresh() async {
    ref.invalidate(adminLiveOnlineProvider);
    ref.invalidate(adminLiveGa4Provider);
    ref.invalidate(adminGrowthProvider(_days));
    ref.invalidate(adminSelfhostStatsProvider);
    await ref.read(adminGrowthProvider(_days).future).catchError((_) => _empty);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final range = AdminFilterChips<int>(
      key: const Key('growthRange'),
      values: kGrowthRanges,
      labels: {for (final d in kGrowthRanges) d: l10n.adminGrowthLastDays(d)},
      selected: _days,
      onSelected: (d) => setState(() => _days = d),
    );
    return AsyncView<AdminGrowth>(
      value: ref.watch(adminGrowthProvider(_days)),
      onRetry: () => ref.invalidate(adminGrowthProvider(_days)),
      loading: AdminSectionList(
        children: [
          const AdminSectionHeader(section: AdminSection.growth),
          const LiveUsersCard(),
          range,
          const SizedBox(height: AppSpace.sm),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpace.xl),
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
      data: (g) => AdminSectionList(
        onRefresh: _refresh,
        children: [
          AdminSectionHeader(
            section: AdminSection.growth,
            summary: l10n.adminGrowthTeamLeftOut(g.team),
            onRefresh: _refresh,
          ),
          const LiveUsersCard(),
          range,
          const SizedBox(height: AppSpace.sm),
          _Tiles(growth: g),
          _PeopleCard(growth: g),
          _RunsCard(growth: g),
          _FirstStepsCard(steps: g.firstSteps),
          if (g.conversion case final conv?)
            _ConversionCard(conversion: conv, signedUp: g.firstSteps.signedUp),
          _AcquisitionCard(
            byPlatform: g.byPlatform ?? const [],
            bySource: g.bySource ?? const [],
          ),
          _ComingBackCard(cohorts: g.comingBack),
          _MoneyCard(money: g.money),
          _RevenueCard(revenue: g.money.revenue),
          _FailuresCard(failures: g.failures),
          _SpeedCard(growth: g),
          const SelfhostGrowthSection(),
        ],
      ),
    );
  }
}

final _empty = AdminGrowth(
  days: 0,
  from: '',
  to: '',
  people: 0,
  team: 0,
  newPeople: 0,
  active1d: 0,
  active7d: 0,
  active30d: 0,
  openedApp7d: 0,
  byDay: const [],
  firstSteps: AdminGrowthFirstSteps(
    signedUp: 0,
    madeBot: 0,
    sentMessage: 0,
    firstValue: 0,
    cameBack: 0,
  ),
  comingBack: const [],
  money: AdminGrowthMoney(
    paidSubscribers: 0,
    monthlyUsd: 0,
    lifetimeUsd: 0,
    lifetimeNetUsd: 0,
    newPaid: 0,
    compActive: 0,
    testActive: 0,
    byPlan: const [],
    revenue: AdminGrowthRevenue(
      charges: 0,
      grossUsd: 0,
      netUsd: 0,
      refundedUsd: 0,
      unpricedCharges: 0,
      bySource: const [],
      byDay: const [],
    ),
  ),
  failures: const [],
);

String _percent(BuildContext context, double share) =>
    NumberFormat.percentPattern(context.l10n.localeName).format(share);

class _Tiles extends StatelessWidget {
  const _Tiles({required this.growth});
  final AdminGrowth growth;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final g = growth;
    String n(int v) => v.humanizedCount(locale);
    return AdminStatStrip(
      key: const Key('growthTiles'),
      stats: [
        AdminStat(
          icon: LucideIcons.users,
          label: l10n.adminGrowthPeople,
          value: n(g.people),
          onTap: () => AdminNav.open(context, AdminSection.users),
        ),
        AdminStat(
          icon: LucideIcons.userPlus,
          label: l10n.adminGrowthNew,
          value: n(g.newPeople),
          tone: AdminTone.info,
        ),
        AdminStat(
          icon: LucideIcons.activity,
          label: l10n.adminGrowthActive1d,
          value: n(g.active1d),
        ),
        AdminStat(
          icon: LucideIcons.calendarDays,
          label: l10n.adminGrowthActive7d,
          value: n(g.active7d),
        ),
        AdminStat(
          icon: LucideIcons.calendarRange,
          label: l10n.adminGrowthActive30d,
          value: n(g.active30d),
        ),
        AdminStat(
          icon: LucideIcons.smartphone,
          label: l10n.adminGrowthOpenedApp,
          value: n(g.openedApp7d),
        ),
        AdminStat(
          icon: LucideIcons.creditCard,
          label: l10n.adminGrowthPaid,
          value: n(g.money.paidSubscribers),
          tone: g.money.paidSubscribers > 0 ? AdminTone.positive : null,
        ),
        AdminStat(
          icon: LucideIcons.banknote,
          label: l10n.adminGrowthMonthly,
          value: formatUsd(g.money.monthlyUsd, locale),
        ),
      ],
    );
  }
}

/// A card with a section heading, an optional line under it, and its body.
class _Card extends StatelessWidget {
  const _Card({required this.title, this.help, required this.child, super.key});
  final String title;
  final String? help;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: title),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (help != null) ...[
                Text(help!, style: muted),
                const SizedBox(height: AppSpace.sm),
              ],
              child,
            ],
          ),
        ),
      ],
    );
  }
}

/// A dot and a name, under a chart.
class _Legend extends StatelessWidget {
  const _Legend(this.items);
  final List<(String, Color)> items;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.labelMedium?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );
    return Wrap(
      spacing: AppSpace.md,
      runSpacing: AppSpace.xxs,
      children: [
        for (final (label, color) in items)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Text(label, style: style),
            ],
          ),
      ],
    );
  }
}

/// One line or one stack of a daily chart.
typedef _Series = ({String label, Color color, List<double> values});

/// Values by UTC day: stacked bars, or lines when [lines] is set. Touching a day lists its values.
class _DailyChart extends StatelessWidget {
  const _DailyChart({
    required this.dates,
    required this.series,
    this.lines = false,
    this.format,
  });
  final List<String> dates;
  final List<_Series> series;
  final bool lines;
  final String Function(double)? format;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final scheme = context.colorScheme;
    final fmt = format ?? (double v) => v.round().humanizedCount(locale);
    final peaks = [
      for (var i = 0; i < dates.length; i++)
        lines
            ? series.fold<double>(
                0,
                (m, s) => math.max(m, i < s.values.length ? s.values[i] : 0),
              )
            : series.fold<double>(
                0,
                (m, s) => m + (i < s.values.length ? s.values[i] : 0),
              ),
    ];
    final peak = peaks.fold<double>(0, math.max);
    final step = _niceStep(peak <= 0 ? 1 : peak / 3);
    final top = peak <= 0 ? 1.0 : (peak / step).ceil() * step;
    final every = (dates.length / 7).ceil().clamp(1, 62);
    final axis = context.textTheme.labelSmall?.copyWith(
      color: scheme.onSurfaceVariant,
      fontFeatures: AppText.tabular,
    );
    final grid = FlGridData(
      drawVerticalLine: false,
      horizontalInterval: step,
      getDrawingHorizontalLine: (_) =>
          FlLine(color: context.appColors.hairline, strokeWidth: 1),
    );
    String dayLabel(int i) =>
        costDay(dates[i])?.formattedWeekdayDate(context) ?? dates[i];
    final titles = FlTitlesData(
      topTitles: const AxisTitles(),
      rightTitles: const AxisTitles(),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: step,
          getTitlesWidget: (v, _) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 6),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerEnd,
              child: Text(fmt(v), maxLines: 1, style: axis),
            ),
          ),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 24,
          interval: 1,
          getTitlesWidget: (v, _) {
            final i = v.round();
            if (i != v ||
                i < 0 ||
                i >= dates.length ||
                (dates.length - 1 - i) % every != 0) {
              return const SizedBox.shrink();
            }
            final day = costDay(dates[i]);
            if (day == null) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                DateFormat.MMMd(locale).format(day),
                maxLines: 1,
                softWrap: false,
                style: axis,
              ),
            );
          },
        ),
      ),
    );
    final tipStyle = context.textTheme.labelMedium!.copyWith(
      color: scheme.onInverseSurface,
      fontFeatures: AppText.tabular,
      height: 1.45,
    );
    List<TextSpan> tipLines(int i) => [
      for (final s in series)
        if (i < s.values.length) ...[
          TextSpan(
            text: '\n● ',
            style: tipStyle.copyWith(color: s.color),
          ),
          TextSpan(text: '${s.label}  ', style: tipStyle),
          TextSpan(
            text: fmt(s.values[i]),
            style: tipStyle.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
    ];
    final Widget chart;
    if (lines) {
      chart = LineChart(
        LineChartData(
          minX: 0,
          maxX: math.max(dates.length - 1, 1).toDouble(),
          minY: 0,
          maxY: top,
          borderData: FlBorderData(show: false),
          gridData: grid,
          titlesData: titles,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => scheme.inverseSurface,
              fitInsideHorizontally: true,
              fitInsideVertically: true,
              getTooltipItems: (spots) => [
                for (final (k, spot) in spots.indexed)
                  k == 0
                      ? LineTooltipItem(
                          dayLabel(spot.x.toInt()),
                          tipStyle.copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.start,
                          children: tipLines(spot.x.toInt()),
                        )
                      : null,
              ],
            ),
          ),
          lineBarsData: [
            for (final s in series)
              LineChartBarData(
                spots: [
                  for (final (i, v) in s.values.indexed)
                    FlSpot(i.toDouble(), v),
                ],
                color: s.color,
                barWidth: 2.5,
                isCurved: false,
                dotData: FlDotData(show: dates.length <= 14),
              ),
          ],
        ),
      );
    } else {
      chart = LayoutBuilder(
        builder: (context, box) {
          final slot = (box.maxWidth - 44) / math.max(dates.length, 1);
          final width = (slot * 0.68).clamp(2.0, 28.0);
          return BarChart(
            BarChartData(
              maxY: top,
              alignment: BarChartAlignment.spaceAround,
              borderData: FlBorderData(show: false),
              gridData: grid,
              titlesData: titles,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (_) => scheme.inverseSurface,
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItem: (group, _, _, _) => BarTooltipItem(
                    '${dayLabel(group.x)}  ${fmt(peaks[group.x])}',
                    tipStyle.copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                    children: tipLines(group.x),
                  ),
                ),
              ),
              barGroups: [
                for (var i = 0; i < dates.length; i++)
                  BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: peaks[i],
                        width: width,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(math.min(4, width / 2)),
                        ),
                        rodStackItems: _stack(i),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          container: true,
          image: true,
          label: l10n.adminGrowthChartSemantics(
            dates.length,
            series.map((s) => s.label).join(', '),
          ),
          child: ExcludeSemantics(child: SizedBox(height: 200, child: chart)),
        ),
        const SizedBox(height: AppSpace.sm),
        _Legend([for (final s in series) (s.label, s.color)]),
      ],
    );
  }

  List<BarChartRodStackItem> _stack(int i) {
    final out = <BarChartRodStackItem>[];
    var from = 0.0;
    for (final s in series) {
      final v = i < s.values.length ? s.values[i] : 0.0;
      if (v <= 0) continue;
      out.add(BarChartRodStackItem(from, from + v, s.color));
      from += v;
    }
    return out;
  }
}

/// 1, 2 or 5 times a power of ten: round numbers on the axis.
double _niceStep(double raw) {
  if (raw <= 1) return 1;
  final p = math.pow(10, (math.log(raw) / math.ln10).floor()).toDouble();
  final f = raw / p;
  return (f <= 1
          ? 1
          : f <= 2
          ? 2
          : f <= 5
          ? 5
          : 10) *
      p;
}

class _PeopleCard extends StatelessWidget {
  const _PeopleCard({required this.growth});
  final AdminGrowth growth;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final days = growth.byDay;
    return _Card(
      key: const Key('growthPeople'),
      title: l10n.adminGrowthPeopleChart,
      help: l10n.adminGrowthActiveHelp,
      child: days.isEmpty
          ? Text(l10n.adminGrowthNoData)
          : _DailyChart(
              lines: true,
              dates: [for (final d in days) d.date],
              series: [
                (
                  label: l10n.adminGrowthActivePeople,
                  color: adminToneColor(context, AdminTone.info),
                  values: [for (final d in days) d.activePeople.toDouble()],
                ),
                (
                  label: l10n.adminGrowthSignups,
                  color: adminToneColor(context, AdminTone.positive),
                  values: [for (final d in days) d.signups.toDouble()],
                ),
              ],
            ),
    );
  }
}

class _RunsCard extends StatelessWidget {
  const _RunsCard({required this.growth});
  final AdminGrowth growth;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final days = growth.byDay;
    var runs = 0, failed = 0;
    for (final d in days) {
      runs +=
          d.runsChat +
          d.runsRoutine +
          d.runsChannel +
          d.runsVoice +
          d.runsOther;
      failed += d.runsFailed;
    }
    final scheme = context.colorScheme;
    return _Card(
      key: const Key('growthRuns'),
      title: l10n.adminGrowthRunsChart,
      help: runs == 0
          ? null
          : l10n.adminGrowthRunsSummary(
              runs.humanizedCount(locale),
              failed.humanizedCount(locale),
              _percent(context, failed / runs),
            ),
      child: runs == 0
          ? Text(l10n.adminGrowthNoData)
          : _DailyChart(
              dates: [for (final d in days) d.date],
              series: [
                (
                  label: l10n.adminGrowthChat,
                  color: adminToneColor(context, AdminTone.info),
                  values: [for (final d in days) d.runsChat.toDouble()],
                ),
                (
                  label: l10n.adminGrowthRoutines,
                  color: adminToneColor(context, AdminTone.positive),
                  values: [for (final d in days) d.runsRoutine.toDouble()],
                ),
                (
                  label: l10n.adminGrowthChannels,
                  color: adminToneColor(context, AdminTone.warning),
                  values: [for (final d in days) d.runsChannel.toDouble()],
                ),
                (
                  label: l10n.adminGrowthVoice,
                  color: scheme.tertiary,
                  values: [for (final d in days) d.runsVoice.toDouble()],
                ),
                (
                  label: l10n.adminGrowthOther,
                  color: scheme.onSurfaceVariant.withValues(alpha: 0.5),
                  values: [for (final d in days) d.runsOther.toDouble()],
                ),
              ],
            ),
    );
  }
}

class _FirstStepsCard extends StatelessWidget {
  const _FirstStepsCard({required this.steps});
  final AdminGrowthFirstSteps steps;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final total = steps.signedUp;
    final rows = [
      (l10n.adminGrowthStepSignedUp, steps.signedUp),
      if (steps.openedApp != null) ('Opened app', steps.openedApp!),
      (l10n.adminGrowthStepMadeBot, steps.madeBot),
      (l10n.adminGrowthStepSentMessage, steps.sentMessage),
      (l10n.adminGrowthStepFirstValue, steps.firstValue),
      if (steps.returnedDay2 != null) ('Typed day 2+', steps.returnedDay2!),
      if (steps.habitWeek != null) ('Typed 3+ days/wk', steps.habitWeek!),
      if (steps.connectedApp != null) ('Connected an app', steps.connectedApp!),
      if (steps.usedRoutine != null) ('Used a routine', steps.usedRoutine!),
      (l10n.adminGrowthStepCameBack, steps.cameBack),
    ];
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
      fontFeatures: AppText.tabular,
    );
    return _Card(
      key: const Key('growthFirstSteps'),
      title: l10n.adminGrowthFirstSteps,
      help: l10n.adminGrowthFirstStepsHelp,
      child: total == 0
          ? Text(l10n.adminGrowthNoSignups)
          : Column(
              children: [
                for (final (i, (label, count)) in rows.indexed) ...[
                  if (i > 0) const SizedBox(height: AppSpace.sm),
                  Row(
                    children: [
                      Expanded(
                        child: Text(label, style: context.textTheme.bodyMedium),
                      ),
                      Text(
                        count.humanizedCount(locale),
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFeatures: AppText.tabular,
                        ),
                      ),
                      SizedBox(
                        width: 56,
                        child: Text(
                          _percent(context, count / total),
                          textAlign: TextAlign.end,
                          style: muted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  AdminMeter(
                    fraction: count / total,
                    tone: AdminTone.info,
                    warnAt: 2,
                  ),
                ],
              ],
            ),
    );
  }
}

class _ConversionCard extends StatelessWidget {
  const _ConversionCard({required this.conversion, required this.signedUp});
  final AdminGrowthConversion conversion;
  final int signedUp;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    final base = math.max(
      1,
      math.max(signedUp, math.max(conversion.hitLimit, conversion.sawPaywall)),
    );
    final rows = [
      ('Hit a limit', conversion.hitLimit),
      ('Saw paywall', conversion.sawPaywall),
      ('Selected a plan', conversion.selectedPlan),
      ('Started checkout', conversion.startedCheckout),
      ('Started trial', conversion.startedTrial),
      ('Paid', conversion.paid),
    ];
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
      fontFeatures: AppText.tabular,
    );
    return _Card(
      key: const Key('growthConversion'),
      title: 'Conversion funnel',
      help: 'Unique non-team users in range who reached each monetization step.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final (i, (label, count)) in rows.indexed) ...[
            if (i > 0) const SizedBox(height: AppSpace.sm),
            Row(
              children: [
                Expanded(
                  child: Text(label, style: context.textTheme.bodyMedium),
                ),
                Text(
                  count.humanizedCount(locale),
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFeatures: AppText.tabular,
                  ),
                ),
                SizedBox(
                  width: 56,
                  child: Text(
                    _percent(context, count / base),
                    textAlign: TextAlign.end,
                    style: muted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            AdminMeter(
              fraction: count / base,
              tone: i >= 4 ? AdminTone.positive : AdminTone.info,
              warnAt: 2,
            ),
          ],
          if (conversion.bySource.isNotEmpty) ...[
            const SizedBox(height: AppSpace.md),
            Text(
              'By paywall source',
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpace.xs),
            for (final s in conversion.bySource)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(s.source_, style: context.textTheme.bodySmall),
                    ),
                    Text(
                      '${s.views.humanizedCount(locale)} views · ${s.checkouts.humanizedCount(locale)} checkouts',
                      style: muted,
                    ),
                  ],
                ),
              ),
          ],
          if (conversion.connectionFailures.isNotEmpty) ...[
            const SizedBox(height: AppSpace.md),
            Text(
              'Connection failures',
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpace.xs),
            for (final f in conversion.connectionFailures)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        f.detail,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(width: AppSpace.sm),
                    Text(f.count.humanizedCount(locale), style: muted),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _ComingBackCard extends StatelessWidget {
  const _ComingBackCard({required this.cohorts});
  final List<AdminGrowthCohort> cohorts;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final scheme = context.colorScheme;
    final head = context.textTheme.labelSmall?.copyWith(
      color: scheme.onSurfaceVariant,
      fontWeight: FontWeight.w600,
    );
    final body = context.textTheme.bodySmall?.copyWith(
      fontFeatures: AppText.tabular,
    );
    final weeks = cohorts.isEmpty
        ? 5
        : cohorts.map((c) => c.weeks.length).reduce(math.max);
    Widget cell(AdminGrowthCohortWeek w) {
      if (w.eligible == 0) {
        return Text(
          '–',
          textAlign: TextAlign.center,
          style: body?.copyWith(color: scheme.onSurfaceVariant),
        );
      }
      final share = w.active / w.eligible;
      return Tooltip(
        message: l10n.adminGrowthWeekCell(w.active, w.eligible),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: adminToneColor(
              context,
              AdminTone.info,
            ).withValues(alpha: 0.08 + 0.5 * share),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _percent(context, share),
            textAlign: TextAlign.center,
            style: body?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      );
    }

    return _Card(
      key: const Key('growthComingBack'),
      title: l10n.adminGrowthComingBack,
      help: l10n.adminGrowthComingBackHelp,
      child: cohorts.isEmpty
          ? Text(l10n.adminGrowthNoCohorts)
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(l10n.adminGrowthSignupWeek, style: head),
                    ),
                    for (var n = 0; n < weeks; n++)
                      Expanded(
                        flex: 2,
                        child: Text(
                          l10n.adminGrowthWeekN(n + 1),
                          textAlign: TextAlign.center,
                          style: head,
                        ),
                      ),
                  ],
                ),
                for (final c in cohorts.reversed) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              costDay(c.week) == null
                                  ? c.week
                                  : DateFormat.MMMd(locale)
                                        .format(costDay(c.week)!),
                              style: body?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              l10n.adminGrowthPeopleCount(c.size),
                              style: body?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      for (var n = 0; n < weeks; n++)
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: cell(
                              n < c.weeks.length
                                  ? c.weeks[n]
                                  : AdminGrowthCohortWeek(
                                      eligible: 0,
                                      active: 0,
                                    ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
    );
  }
}

class _MoneyCard extends StatelessWidget {
  const _MoneyCard({required this.money});
  final AdminGrowthMoney money;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final m = money;
    return _Card(
      key: const Key('growthMoney'),
      title: l10n.adminGrowthMoney,
      help: l10n.adminGrowthMoneyHelp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdminKeyValue(
            label: l10n.adminGrowthPaid,
            value: Text(m.paidSubscribers.humanizedCount(locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthMonthly,
            value: Text(formatUsd(m.monthlyUsd, locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthLifetime,
            value: Text(formatUsd(m.lifetimeUsd, locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthLifetimeKept,
            value: Text(formatUsd(m.lifetimeNetUsd, locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthNewPaid,
            value: Text(m.newPaid.humanizedCount(locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthComp,
            value: Text(m.compActive.humanizedCount(locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthTest,
            value: Text(m.testActive.humanizedCount(locale)),
          ),
          const Divider(height: AppSpace.lg),
          if (m.byPlan.isEmpty)
            Text(
              l10n.adminGrowthNoPaid,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            )
          else
            for (final p in m.byPlan)
              AdminKeyValue(
                label: p.planCode,
                value: Text(
                  p.monthlyUsd == null
                      ? l10n.adminGrowthPlanCount(p.subscribers)
                      : '${l10n.adminGrowthPlanCount(p.subscribers)} · ${formatUsd(p.monthlyUsd!, locale)}',
                ),
              ),
        ],
      ),
    );
  }
}

/// Real charges in the range on every platform (D-552): totals, each platform, and by day.
class _RevenueCard extends StatelessWidget {
  const _RevenueCard({required this.revenue});
  final AdminGrowthRevenue revenue;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final r = revenue;
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );
    final dodo = adminToneColor(context, AdminTone.info);
    final apple = adminToneColor(context, AdminTone.primary);
    final play = adminToneColor(context, AdminTone.positive);
    String name(String source) => switch (source) {
      'dodo' => l10n.adminGrowthSourceDodo,
      'app_store' => l10n.adminGrowthSourceAppStore,
      'google_play' => l10n.adminGrowthSourceGooglePlay,
      _ => source,
    };
    return _Card(
      key: const Key('growthRevenue'),
      title: l10n.adminGrowthRevenue,
      help: l10n.adminGrowthRevenueHelp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdminKeyValue(
            label: l10n.adminGrowthCharged,
            value: Text(formatUsd(r.grossUsd, locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthKept,
            value: Text(formatUsd(r.netUsd, locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthRefunded,
            value: Text(formatUsd(r.refundedUsd, locale)),
          ),
          AdminKeyValue(
            label: l10n.adminGrowthCharges,
            value: Text(r.charges.humanizedCount(locale)),
          ),
          const Divider(height: AppSpace.lg),
          for (final s in r.bySource)
            AdminKeyValue(
              label: name(s.source_),
              value: Text(
                '${formatUsd(s.grossUsd, locale)} · ${l10n.adminGrowthChargeCount(s.charges)}',
              ),
            ),
          if (r.unpricedCharges > 0) ...[
            const SizedBox(height: AppSpace.xs),
            Text(l10n.adminGrowthUnpriced(r.unpricedCharges), style: muted),
          ],
          const SizedBox(height: AppSpace.md),
          if (r.charges == 0)
            Text(l10n.adminGrowthNoCharges, style: muted)
          else
            _DailyChart(
              dates: [for (final d in r.byDay) d.date],
              format: (v) => formatUsd(v, locale),
              series: [
                (
                  label: l10n.adminGrowthSourceDodo,
                  color: dodo,
                  values: [for (final d in r.byDay) d.dodoUsd.toDouble()],
                ),
                (
                  label: l10n.adminGrowthSourceAppStore,
                  color: apple,
                  values: [for (final d in r.byDay) d.appStoreUsd.toDouble()],
                ),
                (
                  label: l10n.adminGrowthSourceGooglePlay,
                  color: play,
                  values: [for (final d in r.byDay) d.googlePlayUsd.toDouble()],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _FailuresCard extends StatelessWidget {
  const _FailuresCard({required this.failures});
  final List<AdminGrowthFailure> failures;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );
    return _Card(
      key: const Key('growthFailures'),
      title: l10n.adminGrowthFailures,
      child: failures.isEmpty
          ? Text(l10n.adminGrowthNoFailures)
          : Column(
              children: [
                for (final (i, f) in failures.indexed) ...[
                  if (i > 0) const Divider(height: AppSpace.md),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              f.code,
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (f.message != null && f.message!.isNotEmpty)
                              Text(
                                f.message!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: muted,
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpace.sm),
                      AdminStatusPill(
                        f.runs.humanizedCount(locale),
                        tone: AdminTone.negative,
                      ),
                    ],
                  ),
                ],
              ],
            ),
    );
  }
}

class _AcquisitionCard extends StatelessWidget {
  const _AcquisitionCard({required this.byPlatform, required this.bySource});
  final List<AdminGrowthPlatform> byPlatform;
  final List<AdminGrowthSource> bySource;

  @override
  Widget build(BuildContext context) {
    if (byPlatform.isEmpty && bySource.isEmpty) return const SizedBox.shrink();
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final head = context.textTheme.labelSmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w600,
    );
    Widget list(String label, List<(String, int)> rows) {
      if (rows.isEmpty) return const SizedBox.shrink();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: head),
          const SizedBox(height: 6),
          for (final (name, count) in rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    count.humanizedCount(locale),
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontFeatures: AppText.tabular,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    }

    return _Card(
      key: const Key('growthAcquisition'),
      title: l10n.adminGrowthWhereFrom,
      help: l10n.adminGrowthWhereFromHelp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (byPlatform.isNotEmpty)
            Expanded(
              child: list(l10n.adminGrowthByPlatform, [
                for (final p in byPlatform) (p.platform, p.signups),
              ]),
            ),
          if (byPlatform.isNotEmpty && bySource.isNotEmpty)
            const SizedBox(width: AppSpace.lg),
          if (bySource.isNotEmpty)
            Expanded(
              child: list(l10n.adminGrowthBySource, [
                for (final s in bySource) (s.source_, s.signups),
              ]),
            ),
        ],
      ),
    );
  }
}

class _SpeedCard extends StatelessWidget {
  const _SpeedCard({required this.growth});
  final AdminGrowth growth;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final days = growth.byDay;
    final any = days.any((d) => d.ttftP50Ms != null);
    String seconds(double ms) => l10n.adminGrowthSeconds(
      NumberFormat('0.0', l10n.localeName).format(ms / 1000),
    );
    return _Card(
      key: const Key('growthSpeed'),
      title: l10n.adminGrowthReplySpeed,
      help: l10n.adminGrowthReplySpeedHelp,
      child: !any
          ? Text(l10n.adminGrowthNoData)
          : _DailyChart(
              lines: true,
              format: seconds,
              dates: [for (final d in days) d.date],
              series: [
                (
                  label: l10n.adminGrowthTypical,
                  color: adminToneColor(context, AdminTone.positive),
                  values: [for (final d in days) (d.ttftP50Ms ?? 0).toDouble()],
                ),
                (
                  label: l10n.adminGrowthSlowest,
                  color: adminToneColor(context, AdminTone.warning),
                  values: [for (final d in days) (d.ttftP90Ms ?? 0).toDouble()],
                ),
              ],
            ),
    );
  }
}

/// Self-hosted servers from their daily license check-ins (docs/SELF-HOSTING-PLAN.md §6.5).
final adminSelfhostStatsProvider = FutureProvider.autoDispose<SelfhostServerStats>((ref) => ref.watch(backendProvider).selfhost.adminStats());

/// Growth's "Self-host" section: servers active each day for 30 days, how many are active now,
/// new installs, lapsed licenses, members and bots, and the split by edition and engine version.
/// Hidden where Casama Cloud doesn't issue licenses (the stats call fails there).
class SelfhostGrowthSection extends ConsumerWidget {
  const SelfhostGrowthSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(adminSelfhostStatsProvider).value;
    if (stats == null) return const SizedBox.shrink();
    final l10n = context.l10n;
    final locale = l10n.localeName;
    String n(int v) => v.humanizedCount(locale);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    Widget row(String label, String value, {Key? key}) => Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: muted?.copyWith(fontFeatures: AppText.tabular)),
        ],
      ),
    );
    return Column(
      key: const Key('growthSelfhost'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpace.sm,
      children: [
        SectionHeader(title: l10n.adminGrowthSelfhost),
        AdminStatStrip(
          key: const Key('growthSelfhostTiles'),
          stats: [
            AdminStat(icon: LucideIcons.server, label: l10n.adminGrowthSelfhostActive, value: n(stats.active24h), onTap: () => AdminNav.open(context, AdminSection.selfhost)),
            AdminStat(icon: LucideIcons.download, label: l10n.adminGrowthSelfhostNew, value: n(stats.newInstallsTotal), tone: AdminTone.info),
            AdminStat(
              icon: LucideIcons.clockAlert,
              label: l10n.adminGrowthSelfhostLapsed,
              value: n(stats.lapsed),
              tone: stats.lapsed > 0 ? AdminTone.warning : null,
            ),
            AdminStat(icon: LucideIcons.users, label: l10n.adminSelfhostMembers, value: n(stats.members)),
            AdminStat(icon: LucideIcons.bot, label: l10n.adminSelfhostBots, value: n(stats.bots)),
          ],
        ),
        _Card(
          key: const Key('growthSelfhostDaily'),
          title: l10n.adminGrowthSelfhostDaily,
          help: l10n.adminGrowthSelfhostDailyHelp,
          child: stats.dailyActive.isEmpty
              ? Text(l10n.adminGrowthNoData)
              : _DailyChart(
                  lines: true,
                  dates: [for (final d in stats.dailyActive) d.day],
                  series: [
                    (
                      label: l10n.adminGrowthSelfhostServers,
                      color: adminToneColor(context, AdminTone.info),
                      values: [for (final d in stats.dailyActive) d.count.toDouble()],
                    ),
                    (
                      label: l10n.adminGrowthSelfhostNewInstalls,
                      color: adminToneColor(context, AdminTone.positive),
                      values: [
                        for (final d in stats.dailyActive)
                          (stats.newInstalls.where((x) => x.day == d.day).firstOrNull?.count ?? 0).toDouble(),
                      ],
                    ),
                  ],
                ),
        ),
        _Card(
          key: const Key('growthSelfhostEditions'),
          title: l10n.adminGrowthSelfhostByEdition,
          child: stats.byEdition.isEmpty
              ? Text(l10n.adminGrowthNoData)
              : Column(
                  children: [
                    for (final e in stats.byEdition)
                      row(editionLabel(context, e.edition), l10n.adminGrowthSelfhostActiveOf(e.active, e.total), key: Key('growthSelfhostEdition-${e.edition}')),
                  ],
                ),
        ),
        _Card(
          key: const Key('growthSelfhostVersions'),
          title: l10n.adminGrowthSelfhostByVersion,
          child: stats.byEngineVersion.isEmpty
              ? Text(l10n.adminGrowthNoData)
              : Column(
                  children: [
                    for (final v in stats.byEngineVersion)
                      row(v.version, l10n.adminGrowthSelfhostServersCount(v.servers), key: Key('growthSelfhostVersion-${v.version}')),
                  ],
                ),
        ),
      ],
    );
  }
}
