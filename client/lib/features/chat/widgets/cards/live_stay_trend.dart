import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'live_kit.dart';
import 'live_stay_search.dart';
import 'stay_kit.dart';

// Hotel prices by month (docs/STAYS-AND-SHOPPING-PLAN.md §4.3): trivago's forecast for a place,
// one bar a month for a hotel class, with the cheapest month named. The other classes' months are
// on the card, so switching class asks nobody.

final stayTrendComponent = liveCard('StayTrend', const [
  'place',
  'currency',
  'class',
  'classes',
  'months',
  'byClass',
  'cheapest',
], (context, p, ctl) => _StayTrend(p: p, act: ctl.act));

class _StayTrend extends StatefulWidget {
  const _StayTrend({required this.p, required this.act});
  final P p;
  final CardAct act;

  @override
  State<_StayTrend> createState() => _StayTrendState();
}

class _StayTrendState extends State<_StayTrend> {
  late int? _class = widget.p.i('class');

  P get p => widget.p;

  /// The months of the class on show: its own list, or the card's when it's the card's class.
  List<P> get _months {
    final own = p.map('byClass').rows('${_class ?? ''}');
    return [
      for (final m in own.isNotEmpty ? own : p.rows('months'))
        if (m.s('month') != null && m.n('average') != null) m,
    ].take(12).toList();
  }

  String _month(String ym, {bool long = false}) {
    final d = DateTime.tryParse('$ym-01');
    if (d == null) return ym;
    final locale = context.l10n.localeName;
    return long
        ? DateFormat.MMMM(locale).format(d)
        : DateFormat.MMM(locale).format(d);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cur = p.s('currency');
    final place = p.map('place').s('label') ?? '—';
    final classes = [for (final c in p.nums('classes')) c.round()];
    final months = _months;
    P? cheapest;
    var top = 0.0;
    for (final m in months) {
      final avg = m.n('average')!;
      if (cheapest == null || avg < cheapest.n('average')!) cheapest = m;
      final high = m.n('high') ?? avg;
      if (high > top) top = high;
      if (avg > top) top = avg;
    }

    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.bedDouble,
        iconColor: stayTeal,
        title: l.cardStaysTrendTitle(place),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (classes.length > 1) ...[
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final c in classes)
                  ChoiceChip(
                    key: Key('stayTrendClass-$c'),
                    label: Text(l.cardStaysTrendClass(c)),
                    tooltip: l.cardStaysStars(c),
                    selected: _class == c,
                    onSelected: (_) => setState(() => _class = c),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
            const SizedBox(height: 10),
          ],
          if (months.isEmpty)
            LivePanel(child: Text(l.cardStaysNoDeals, style: context.cardLabel))
          else
            LivePanel(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  for (final m in months)
                    _MonthBar(
                      key: Key('stayTrendMonth-${m.s('month')}'),
                      label: _month(m.s('month')!),
                      average: m.n('average')!,
                      low: m.n('low'),
                      high: m.n('high'),
                      top: top,
                      currency: cur,
                      best:
                          cheapest != null &&
                          m.s('month') == cheapest.s('month'),
                    ),
                ],
              ),
            ),
          if (cheapest != null) ...[
            const SizedBox(height: 10),
            Text(
              l.cardStaysTrendCheapest(
                _month(cheapest.s('month')!, long: true),
                cardMoney(context, cheapest.n('average')!.round(), cur),
              ),
              key: const Key('stayTrendCheapest'),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const SizedBox(height: 4),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              Text(l.cardStaysTrendNote, style: context.cardLabel),
              OutlinedButton.icon(
                key: const Key('stayTrendPick'),
                onPressed: () => showStaySearchSheet(
                  context,
                  initial: P({'where': place, 'currency': cur}),
                  act: widget.act,
                ),
                icon: const Icon(LucideIcons.calendarDays, size: 16),
                label: Text(l.cardStaysTrendPick),
                style: OutlinedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// One month: its name, a bar for the average with a thin line from the lowest to the highest
/// price, and the average as a number.
class _MonthBar extends StatelessWidget {
  const _MonthBar({
    super.key,
    required this.label,
    required this.average,
    required this.low,
    required this.high,
    required this.top,
    required this.currency,
    required this.best,
  });
  final String label;
  final double average;
  final double? low;
  final double? high;
  final double top;
  final String? currency;
  final bool best;

  @override
  Widget build(BuildContext context) {
    final color = best ? context.appColors.positive : stayTeal;
    final ink = context.colorScheme.onSurface;
    final price = cardMoneyShort(context, average, currency);
    return Semantics(
      label: '$label: $price',
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(
              width: 38,
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: context.cardLabel?.copyWith(
                  fontWeight: best ? FontWeight.w700 : null,
                  color: best ? ink : null,
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, box) {
                  final scale = top <= 0 ? 0.0 : box.maxWidth / top;
                  final bar = (average * scale).clamp(2.0, box.maxWidth);
                  final a = ((low ?? average) * scale).clamp(0.0, box.maxWidth);
                  final b = ((high ?? average) * scale).clamp(a, box.maxWidth);
                  return SizedBox(
                    height: 14,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: bar,
                          height: 10,
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: best ? 0.9 : 0.55),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        if (low != null && high != null)
                          Positioned(
                            left: a,
                            width: (b - a).clamp(1.0, box.maxWidth),
                            child: Container(
                              height: 2,
                              color: ink.withValues(alpha: 0.55),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 62,
              child: Text(
                price,
                maxLines: 1,
                textAlign: TextAlign.end,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: best ? FontWeight.w800 : FontWeight.w600,
                  fontFeatures: AppText.tabular,
                  color: best ? color : ink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
