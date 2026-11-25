import 'dart:math' as math;

import 'package:casama_sdk/casama_sdk.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/date_format.dart';
import '../../../core/widgets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import 'cost_format.dart';
import 'cost_parts.dart';

/// One stack of the chart: its id, name, colour and what it came to over the period.
typedef CostSeries = ({String id, String label, Color color, double total});

/// [costs]' stacks with their colours and period totals, in the order the server ranked them.
List<CostSeries> costSeries(
  BuildContext context,
  AdminCosts costs,
  Color Function(String id) colorOf,
) => [
  for (final (i, s) in costs.series.indexed)
    (
      id: s.id,
      label: costRowLabel(context.l10n, s.id, s.label),
      color: colorOf(s.id),
      total: costs.byDay.fold<double>(
        0,
        (n, d) => n + (i < d.values.length ? d.values[i].toDouble() : 0),
      ),
    ),
];

/// Spend by UTC day, each bar stacked by the view's grouping (the biggest groups, then "Other").
/// Hovering or touching a bar lists that day's amounts.
class CostChart extends StatelessWidget {
  const CostChart({
    super.key,
    required this.costs,
    required this.series,
    this.height = 220,
  });
  final AdminCosts costs;
  final List<CostSeries> series;
  final double height;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final scheme = context.colorScheme;
    final days = costs.byDay;
    final totals = [
      for (final d in days)
        d.values.fold<double>(0, (n, v) => n + v.toDouble()),
    ];
    final peak = totals.fold<double>(0, math.max);
    final step = _niceStep(peak / 3);
    final top = peak <= 0 ? 1.0 : (peak / step).ceil() * step;
    final every = (days.length / 8).ceil().clamp(1, 62);
    final axis = context.textTheme.labelSmall?.copyWith(
      color: scheme.onSurfaceVariant,
      fontFeatures: AppText.tabular,
    );
    final peakAt = peak <= 0 ? -1 : totals.indexOf(peak);
    final peakDay = peakAt < 0 ? null : costDay(days[peakAt].date);
    return Semantics(
      container: true,
      image: true,
      label: peakDay == null
          ? l10n.costChartSemanticsEmpty(days.length)
          : l10n.costChartSemantics(
              days.length,
              costUsd(totals.fold<double>(0, (n, v) => n + v), locale),
              peakDay.formattedWeekdayDate(context),
              costUsd(peak, locale),
            ),
      child: ExcludeSemantics(
        child: SizedBox(
          height: height,
          child: LayoutBuilder(
            builder: (context, box) {
              final slot = (box.maxWidth - 56) / math.max(days.length, 1);
              final width = (slot * 0.68).clamp(2.0, 30.0);
              return BarChart(
                BarChartData(
                  maxY: top,
                  alignment: BarChartAlignment.spaceAround,
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(
                    drawVerticalLine: false,
                    horizontalInterval: peak <= 0 ? 1 : step,
                    getDrawingHorizontalLine: (_) => FlLine(
                      color: context.appColors.hairline,
                      strokeWidth: 1,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 52,
                        interval: peak <= 0 ? 1 : step,
                        getTitlesWidget: (v, meta) => Padding(
                          padding: const EdgeInsetsDirectional.only(end: 6),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              _axisUsd(v, step, locale),
                              maxLines: 1,
                              style: axis,
                            ),
                          ),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 24,
                        getTitlesWidget: (v, _) {
                          final i = v.toInt();
                          // Every few days from the newest one back, so the last bar is always named.
                          if (i < 0 ||
                              i >= days.length ||
                              (days.length - 1 - i) % every != 0) {
                            return const SizedBox.shrink();
                          }
                          final day = costDay(days[i].date);
                          if (day == null) return const SizedBox.shrink();
                          final first = day.day == 1 || i - every < 0;
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              first
                                  ? DateFormat.MMMd(locale).format(day)
                                  : day.formattedDayOfMonth(context),
                              maxLines: 1,
                              softWrap: false,
                              style: axis,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => scheme.inverseSurface,
                      tooltipPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      tooltipMargin: 8,
                      maxContentWidth: 260,
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      getTooltipItem: (group, _, _, _) {
                        final i = group.x;
                        if (i < 0 || i >= days.length) return null;
                        final day = costDay(days[i].date);
                        final base = context.textTheme.labelMedium!.copyWith(
                          color: scheme.onInverseSurface,
                          fontFeatures: AppText.tabular,
                          height: 1.45,
                        );
                        final parts = [
                          for (final (s, x) in series.indexed)
                            if (s < days[i].values.length &&
                                days[i].values[s] > 0)
                              (x, days[i].values[s]),
                        ];
                        return BarTooltipItem(
                          '${day?.formattedWeekdayDate(context) ?? days[i].date}  ${costUsd(totals[i], locale)}',
                          base.copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.start,
                          children: [
                            for (final (x, value) in parts) ...[
                              TextSpan(
                                text: '\n● ',
                                style: base.copyWith(
                                  color: _onInverse(x.color, scheme),
                                ),
                              ),
                              TextSpan(
                                text: '${_short(x.label)}  ',
                                style: base.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: costUsd(value, locale),
                                style: base.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                  barGroups: [
                    for (final (i, d) in days.indexed)
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: totals[i],
                            width: width,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(math.min(4, width / 2)),
                            ),
                            rodStackItems: _stack(d.values),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<BarChartRodStackItem> _stack(List<num> values) {
    final out = <BarChartRodStackItem>[];
    var from = 0.0;
    for (final (i, s) in series.indexed) {
      final v = i < values.length ? values[i].toDouble() : 0.0;
      if (v <= 0) continue;
      out.add(BarChartRodStackItem(from, from + v, s.color));
      from += v;
    }
    return out;
  }
}

/// The tooltip sits on the inverse surface: a colour made for the card is pulled toward the
/// tooltip's text colour until it stands out there too.
Color _onInverse(Color c, ColorScheme scheme) =>
    Color.lerp(c, scheme.onInverseSurface, 0.25)!;

String _short(String s) => s.length <= 26 ? s : '${s.substring(0, 25)}…';

/// A round step near [raw]: 1, 2, 2.5 or 5 times a power of ten.
double _niceStep(double raw) {
  if (raw <= 0 || !raw.isFinite) return 1;
  final power = math.pow(10, (math.log(raw) / math.ln10).floor()).toDouble();
  final unit = raw / power;
  final nice = unit <= 1
      ? 1.0
      : unit <= 2
      ? 2.0
      : unit <= 2.5
      ? 2.5
      : unit <= 5
      ? 5.0
      : 10.0;
  return nice * power;
}

/// Axis labels: whole dollars when the steps are whole, cents otherwise, and more decimals only
/// when the steps are smaller than a cent.
String _axisUsd(double v, double step, String locale) {
  var digits = 0;
  if (step % 1 != 0) {
    digits = 2;
    while (digits < 6 &&
        ((step * math.pow(10, digits)).roundToDouble() -
                    step * math.pow(10, digits))
                .abs() >
            1e-6) {
      digits++;
    }
  }
  return NumberFormat.simpleCurrency(
    locale: locale,
    name: 'USD',
    decimalDigits: v == 0 ? 0 : digits,
  ).format(v);
}

/// The chart's key: each stack's colour, name and total. Whole entries wrap to the next line; a
/// long name is cut with an ellipsis instead of breaking in two.
class CostLegend extends StatelessWidget {
  const CostLegend({super.key, required this.series});
  final List<CostSeries> series;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    final text = context.textTheme;
    final muted = context.colorScheme.onSurfaceVariant;
    // A stack with nothing in it is left out of the key, unless the whole period is empty.
    final spent = series.where((s) => s.total > 0).toList();
    final shown = spent.isEmpty ? series : spent;
    return Wrap(
      spacing: AppSpace.md,
      runSpacing: 6,
      children: [
        for (final s in shown)
          Semantics(
            container: true,
            label: '${s.label}, ${costUsd(s.total, locale)}',
            excludeSemantics: true,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CostDot(s.color, size: 9),
                const SizedBox(width: 6),
                // The name gives way (with an ellipsis) before the entry outgrows the
                // card; the amount is never the part that is cut.
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 170),
                    child: Text(
                      s.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: text.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  costUsd(s.total, locale),
                  maxLines: 1,
                  style: text.bodySmall?.copyWith(
                    color: muted,
                    fontFeatures: AppText.tabular,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
