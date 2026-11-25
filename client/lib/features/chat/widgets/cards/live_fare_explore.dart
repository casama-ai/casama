import 'package:latlong2/latlong.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/analytics.dart';
import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import '../bot_ui_map.dart';
import 'fare_kit.dart';
import 'live_fare_calendar.dart';
import 'live_fares.dart';
import 'live_flight_search.dart';
import 'live_kit.dart';

// The cheapest places to fly to (docs/FLIGHT-CARDS-PLAN.md §3.4): anywhere, or in one country, one
// fare a city, on a map and a list. A place opens its month or its fares in a sheet through the
// card's own views: no model turn.

final fareExploreComponent = liveCard('FareExplore', const [
  'from',
  'where',
  'scope',
  'budget',
  'depart',
  'return',
  'nights',
  'travellers',
  'cabin',
  'currency',
  'roundTrip',
  'places',
  'cheapest',
], (context, p, ctl) => _Explore(p: p, ctl: ctl));

class _Explore extends StatefulWidget {
  const _Explore({required this.p, required this.ctl});
  final P p;
  final LiveCardController ctl;

  @override
  State<_Explore> createState() => _ExploreState();
}

class _ExploreState extends State<_Explore> {
  bool _all = false;

  P get p => widget.p;

  void _open(P place) {
    final ctl = widget.ctl;
    final code = place.s('code');
    final city = place.s('city') ?? code ?? '';
    if (code == null) return;
    Analytics.log('fare_view_opened', {'card': 'FareExplore', 'view': 'place'});
    final id = ctl.ref;
    if (id == null) {
      // A card that can't be asked for views: the bot runs the search.
      ctl.act(
        'flights.open',
        {...fareTrip(p), 'to': city},
        context.l10n.cardFaresOpenLabel(
          '${p.map('from').s('label') ?? ''} → $city',
          fareDate(context, p.s('depart')),
        ),
      );
      return;
    }
    showFareView(
      context,
      cardId: id,
      view: code,
      title: '${p.map('from').s('label') ?? ''} → $city',
      // A month search opens the place's calendar, whose days and arrows are views too.
      builder: (context, card, open) => card.s('component') == 'FareCalendar'
          ? FareCalendarView(
              p: card,
              onDay: (date) => open('$code:$date'),
              onMonth: (month) => open('$code:$month'),
            )
          : FaresView(p: card, act: ctl.act),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final from = p.map('from').s('label') ?? '—';
    final where = p.map('where');
    final cur = p.s('currency');
    final places = p.rows('places');
    final cheapest = p.n('cheapest');
    final nights = p.i('nights');
    final budget = p.n('budget');
    final title = where.s('kind') == 'country'
        ? l.cardFareExploreCountry(from, where.s('label') ?? '')
        : switch (p.s('scope')) {
            'abroad' => l.cardFareExploreAbroad(from),
            'domestic' => l.cardFareExploreDomestic(from),
            _ => l.cardFareExploreAnywhere(from),
          };
    final dates = [
      fareDate(context, p.s('depart')),
      if (p.s('return') case final r? when r.length == 10) fareDate(context, r),
    ].join(' – ');
    final subtitle = [
      dates,
      if (nights != null)
        l.cardFareCalReturn(nights)
      else if (p.b('roundTrip') != true)
        l.cardFareCalOneWay,
      if (budget != null) l.cardFareExploreUnder(fmtFare(context, budget, cur)),
    ].join(' · ');
    final pins = [
      for (final x in places.take(12))
        if (x.n('lat') != null && x.n('lng') != null)
          (
            point: LatLng(x.n('lat')!, x.n('lng')!),
            label:
                '${fmtFareShort(context, x.n('price') ?? 0)} ${x.s('city') ?? ''}'
                    .trim(),
          ),
    ];
    final shown = _all ? places : places.take(5).toList();
    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.earth,
        iconColor: planeBlue,
        title: title,
        subtitle: subtitle,
        pill: cheapest == null
            ? null
            : l.cardFaresFromPrice(fmtFare(context, cheapest, cur)),
        pillColor: planeBlue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (pins.isNotEmpty) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.tile),
              child: BotMapCard(
                // No center: it fits every pin.
                spec: MapCardSpec(
                  center: null,
                  zoom: 4,
                  markers: pins,
                  path: const [],
                  height: 180,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          LivePanel(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              children: [
                for (final (i, x) in shown.indexed) ...[
                  if (i > 0)
                    Divider(height: 1, color: context.appColors.hairline),
                  _PlaceRow(
                    place: x,
                    currency: cur,
                    showCountry: where.s('kind') != 'country',
                    onTap: () => _open(x),
                  ),
                ],
              ],
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (places.length > 5)
                TextButton(
                  key: const Key('fareExploreMore'),
                  onPressed: () => setState(() => _all = !_all),
                  child: Text(
                    _all
                        ? l.cardFaresShowFewer
                        : l.cardFaresShowAll(places.length),
                  ),
                ),
              TextButton.icon(
                key: const Key('fareExploreEdit'),
                onPressed: () => showFlightSearchSheet(
                  context,
                  // The form opens on the same search: this country, or anywhere.
                  initial: P({
                    ...fareTrip(p),
                    'to': where.s('kind') == 'country'
                        ? where.s('label')
                        : 'anywhere',
                  }),
                  act: widget.ctl.act,
                ),
                icon: const Icon(LucideIcons.pencil, size: 14),
                label: Text(l.cardFaresEdit),
              ),
            ],
          ),
          Text(l.cardFaresCheck, style: context.cardLabel),
        ],
      ),
    );
  }
}

class _PlaceRow extends StatelessWidget {
  const _PlaceRow({
    required this.place,
    required this.currency,
    required this.showCountry,
    required this.onTap,
  });
  final P place;
  final String? currency;
  final bool showCountry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final stops = place.i('stops') ?? 0;
    final muted = context.colorScheme.onSurfaceVariant;
    final city = place.s('city');
    final country = place.s('country');
    final detail = [
      // A city state's country is its own name: say it once.
      if (showCountry && country != city) ?country,
      fareDate(context, place.s('date')),
      stops == 0 ? l.cardFaresDirect : l.cardFaresStops(stops),
    ].join(' · ');
    return InkWell(
      key: Key('farePlace-${place.s('code')}'),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            SizedBox(
              width: 84,
              child: Text(
                fmtFare(context, place.n('price') ?? 0, currency),
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontFeatures: AppText.tabular,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.s('city') ?? place.s('code') ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    detail,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: muted,
                    ),
                  ),
                ],
              ),
            ),
            Icon(LucideIcons.chevronRight, size: 16, color: muted),
          ],
        ),
      ),
    );
  }
}
