import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/analytics.dart';
import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'fare_kit.dart';
import 'live_fares.dart';
import 'live_flight_search.dart';
import 'live_kit.dart';

// A month of fares by day (docs/FLIGHT-CARDS-PLAN.md §3.3): the cheapest price for each departure
// day, colored by where it sits in the month. A day opens that day's fares in a sheet and the
// arrows move a month, both through the card's own views: no model turn.

final fareCalendarComponent = liveCard(
  'FareCalendar',
  const [
    'from',
    'to',
    'month',
    'nights',
    'travellers',
    'cabin',
    'currency',
    'roundTrip',
    'days',
    'cheapest',
    'months',
  ],
  (context, p, ctl) {
    final l = context.l10n;
    final route =
        '${p.map('from').s('label') ?? '—'} → ${p.map('to').s('label') ?? '—'}';
    final cheapest = p.map('cheapest').n('price');
    final nights = p.i('nights');
    final id = ctl.ref;

    void openDay(String date) {
      Analytics.log('fare_view_opened', {'card': 'FareCalendar', 'view': 'day'});
      if (id == null) {
        // A card that can't be asked for views: the bot runs the search.
        ctl.act(
          'flights.open',
          {
            ...fareTrip(p),
            'depart': date,
            'nights': null,
            'return': ?_plusDays(date, nights),
          }..removeWhere((_, v) => v == null),
          l.cardFaresOpenLabel(route, fareDate(context, date)),
        );
        return;
      }
      showFareView(
        context,
        cardId: id,
        view: date,
        title: '$route · ${fareDate(context, date)}',
        builder: (context, card, _) => FaresView(p: card, act: ctl.act),
      );
    }

    void openMonth(String month) {
      if (id == null || ctl.refreshing) return;
      // Back on the month the card was shown with, it is the card itself again.
      ctl.setView(month == ctl.state.widget.initial['month'] ? null : month);
    }

    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.calendarDays,
        iconColor: planeBlue,
        title: route,
        titleMaxLines: 2,
        subtitle: [
          nights == null ? l.cardFareCalOneWay : l.cardFareCalReturn(nights),
          l.cardFaresTravellers(farePeople(p)),
          fareCabin(context, p.s('cabin')),
        ].join(' · '),
        pill: cheapest == null
            ? null
            : l.cardFaresFromPrice(fmtFare(context, cheapest, p.s('currency'))),
        pillColor: planeBlue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          FareCalendarView(
            p: p,
            busy: ctl.refreshing,
            onDay: openDay,
            onMonth: id == null ? null : openMonth,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              key: const Key('fareCalEdit'),
              onPressed: () => showFlightSearchSheet(
                context,
                initial: P(fareTrip(p)),
                act: ctl.act,
              ),
              icon: const Icon(LucideIcons.pencil, size: 14),
              label: Text(l.cardFaresEdit),
            ),
          ),
        ],
      ),
    );
  },
);

/// The day a return trip of [nights] nights comes back, or null for one way.
String? _plusDays(String date, int? nights) {
  final d = DateTime.tryParse(date);
  if (d == null || nights == null) return null;
  final r = DateTime(d.year, d.month, d.day + nights);
  return '${r.year.toString().padLeft(4, '0')}-${r.month.toString().padLeft(2, '0')}-${r.day.toString().padLeft(2, '0')}';
}

/// The month grid with its arrows, legend and cheapest day. Used by the card, and inside an
/// explore card's sheet for one of its places.
class FareCalendarView extends StatelessWidget {
  const FareCalendarView({
    super.key,
    required this.p,
    required this.onDay,
    this.onMonth,
    this.busy = false,
  });
  final P p;
  final ValueChanged<String> onDay;

  /// Null when the months around this one can't be opened.
  final ValueChanged<String>? onMonth;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final loc = MaterialLocalizations.of(context);
    final month = p.s('month') ?? '';
    final first = DateTime.tryParse('$month-01');
    if (first == null) return const SizedBox.shrink();
    final cur = p.s('currency');
    final byDate = <String, P>{for (final d in p.rows('days')) ?d.s('date'): d};
    final cheapest = p.map('cheapest');
    final months = p.map('months');
    final count = DateUtils.getDaysInMonth(first.year, first.month);
    // DateTime counts Monday as 1; the locale says which day a week starts on (0 is Sunday).
    final lead = (first.weekday % 7 - loc.firstDayOfWeekIndex + 7) % 7;
    final cells = <int?>[
      for (var i = 0; i < lead; i++) null,
      for (var d = 1; d <= count; d++) d,
    ];
    while (cells.length % 7 != 0) {
      cells.add(null);
    }
    final muted = context.colorScheme.onSurfaceVariant;
    String iso(int day) => '$month-${day.toString().padLeft(2, '0')}';

    return Opacity(
      opacity: busy ? 0.55 : 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _MonthArrow(
                key: const Key('fareCalPrev'),
                icon: LucideIcons.chevronLeft,
                month: months.s('prev'),
                onTap: busy ? null : onMonth,
              ),
              Expanded(
                child: Text(
                  fareDate(context, month),
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              _MonthArrow(
                key: const Key('fareCalNext'),
                icon: LucideIcons.chevronRight,
                month: months.s('next'),
                onTap: busy ? null : onMonth,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              for (var i = 0; i < 7; i++)
                Expanded(
                  child: Center(
                    child: Text(
                      loc.narrowWeekdays[(loc.firstDayOfWeekIndex + i) % 7],
                      style: context.textTheme.labelSmall?.copyWith(
                        color: muted,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          for (var row = 0; row < cells.length; row += 7)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  for (final day in cells.sublist(row, row + 7))
                    Expanded(
                      child: day == null
                          ? const SizedBox(height: 44)
                          : _DayCell(
                              date: iso(day),
                              day: day,
                              price: byDate[iso(day)]?.n('price'),
                              level: byDate[iso(day)]?.s('level'),
                              cheapest: cheapest.s('date') == iso(day),
                              currency: cur,
                              onTap: busy ? null : onDay,
                            ),
                    ),
                ],
              ),
            ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 12,
            runSpacing: 4,
            children: [
              _Legend(
                color: context.appColors.positive,
                text: l.cardFareCalLow,
              ),
              _Legend(color: muted, text: l.cardFareCalUsual),
              _Legend(
                color: context.appColors.warning,
                text: l.cardFareCalHigh,
              ),
            ],
          ),
          if (cheapest.s('date') case final date?
              when cheapest.n('price') != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    l.cardFareCalCheapest(
                      fareWeekday(context, date),
                      fmtFare(context, cheapest.n('price')!, cur),
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                FilledButton.tonal(
                  key: const Key('fareCalSeeFares'),
                  onPressed: busy ? null : () => onDay(date),
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                  ),
                  child: Text(l.cardFareCalSeeFares),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _MonthArrow extends StatelessWidget {
  const _MonthArrow({
    super.key,
    required this.icon,
    required this.month,
    required this.onTap,
  });
  final IconData icon;
  final String? month;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    final m = month;
    // No month that way (the past, or more than a year out): the arrow keeps its place.
    if (m == null || onTap == null) {
      return const SizedBox(width: 40, height: 40);
    }
    return IconButton(
      onPressed: () => onTap!(m),
      icon: Icon(icon, size: 18),
      tooltip: fareDate(context, m),
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.date,
    required this.day,
    required this.price,
    required this.level,
    required this.cheapest,
    required this.currency,
    required this.onTap,
  });
  final String date;
  final int day;
  final double? price;
  final String? level;
  final bool cheapest;
  final String? currency;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final scheme = context.colorScheme;
    final has = price != null;
    final tint = switch (level) {
      'low' => context.appColors.positive,
      'high' => context.appColors.warning,
      _ => scheme.onSurfaceVariant,
    };
    final words = has
        ? l.cardFareCalDay(
            fareWeekday(context, date),
            fmtFare(context, price!, currency),
          )
        : l.cardFareCalNoPrice(fareWeekday(context, date));
    return Semantics(
      button: has,
      label: words,
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Material(
          color: has
              ? tint.withValues(alpha: level == 'mid' ? 0.06 : 0.14)
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
            side: cheapest
                ? const BorderSide(color: planeBlue, width: 1.5)
                : BorderSide.none,
          ),
          child: InkWell(
            key: Key('fareCalDay-$date'),
            borderRadius: BorderRadius.circular(9),
            onTap: has && onTap != null ? () => onTap!(date) : null,
            child: SizedBox(
              height: 44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$day',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: has ? scheme.onSurface : scheme.outline,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      has ? fmtFareShort(context, price!) : '–',
                      style: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontFeatures: AppText.tabular,
                        color: has
                            ? (level == 'mid' ? scheme.onSurface : tint)
                            : scheme.outline,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.color, required this.text});
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 9,
        height: 9,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      const SizedBox(width: 5),
      Text(text, style: context.cardLabel),
    ],
  );
}
