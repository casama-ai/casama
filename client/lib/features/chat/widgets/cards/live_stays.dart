import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'live_kit.dart';
import 'live_stay_details.dart';
import 'live_stay_search.dart';
import 'stay_kit.dart';

// Places to stay for a place and dates (docs/STAYS-AND-SHOPPING-PLAN.md §4.1): real prices from
// trivago or Google, sorted and filtered on the device, as a list or as price pins on the map.
// A row opens in full in a sheet from its own data; up to four can be compared side by side.

final staysComponent = liveCard('Stays', const [
  'place',
  'checkIn',
  'checkOut',
  'nights',
  'guests',
  'currency',
  'search',
  'sort',
  'cheapest',
  'stays',
  'compare',
  'affiliate',
], (context, p, ctl) => _Stays(p: p, act: ctl.act));

enum _Sort { best, cheapest, topRated, closest }

class _Stays extends StatefulWidget {
  const _Stays({required this.p, required this.act});
  final P p;
  final CardAct act;

  @override
  State<_Stays> createState() => _StaysState();
}

class _StaysState extends State<_Stays> {
  late _Sort _sort = switch (widget.p.s('sort')) {
    'cheapest' => _Sort.cheapest,
    'top_rated' => _Sort.topRated,
    'closest' => _Sort.closest,
    _ => _Sort.best,
  };

  /// Filters that are on: a term ("free_cancellation"), "stars4", "rated8", or "has:" and an amenity.
  final _filters = <String>{};
  bool _map = false;
  bool _all = false;

  /// The ids ticked to compare, in the order they were ticked.
  final _picked = <String>[];

  P get p => widget.p;

  bool _passes(P s) {
    for (final f in _filters) {
      final ok = switch (f) {
        'stars4' => (s.i('stars') ?? 0) >= 4,
        'rated8' => ratingShare(s) >= 0.8,
        _ when f.startsWith('has:') =>
          s.texts('amenities').contains(f.substring(4)),
        _ => stayHasTerm(s, f),
      };
      if (!ok) return false;
    }
    return true;
  }

  List<P> _shown(List<P> all) {
    final list = all.where(_passes).toList();
    int byPrice(P a, P b) => (stayNight(a) ?? double.infinity).compareTo(
      stayNight(b) ?? double.infinity,
    );
    switch (_sort) {
      case _Sort.cheapest:
        list.sort(byPrice);
      case _Sort.topRated:
        list.sort((a, b) {
          final r = ratingShare(b).compareTo(ratingShare(a));
          return r != 0 ? r : byPrice(a, b);
        });
      case _Sort.closest:
        list.sort((a, b) {
          final d = (a.n('km') ?? double.infinity).compareTo(
            b.n('km') ?? double.infinity,
          );
          return d != 0 ? d : byPrice(a, b);
        });
      case _Sort.best:
        break;
    }
    return list;
  }

  /// Up to four amenities the results have, the most common first; one every place has filters
  /// nothing, so it's left out.
  List<String> _amenityChips(List<P> all) {
    final count = <String, int>{};
    for (final s in all) {
      for (final a in s.texts('amenities').toSet()) {
        count[a] = (count[a] ?? 0) + 1;
      }
    }
    final names = [
      for (final e in count.entries)
        if (e.value < all.length || all.length == 1) e.key,
    ]..sort((a, b) => count[b]!.compareTo(count[a]!));
    return names.take(4).toList();
  }

  void _toggle(String f, bool on) =>
      setState(() => on ? _filters.add(f) : _filters.remove(f));

  void _pick(String id, bool on) => setState(() {
    if (!on) {
      _picked.remove(id);
    } else if (_picked.length < comparePickLimit && !_picked.contains(id)) {
      _picked.add(id);
    }
  });

  void _open(P stay) =>
      showStayDetailsSheet(context, card: p, stay: stay, act: widget.act);

  void _compare(List<P> all) {
    final l = context.l10n;
    final cur = p.s('currency');
    final stays = [
      for (final id in _picked) ...all.where((s) => s.s('id') == id).take(1),
    ];
    if (stays.length < 2) return;
    String money(double? v) => v == null ? '' : cardMoney(context, v, cur);
    String yesNo(bool v) => v ? l.cardStaysYes : l.cardStaysNo;
    showCompareSheet(
      context,
      names: [for (final s in stays) s.s('name') ?? '—'],
      rows: [
        (l.cardStaysRowNight, [for (final s in stays) money(stayNight(s))]),
        (l.cardStaysRowTotal, [for (final s in stays) money(stayTotal(s))]),
        (
          l.cardStaysRowRating,
          [for (final s in stays) stayRatingText(context, s) ?? ''],
        ),
        (
          l.cardStaysRowStars,
          [
            for (final s in stays)
              s.i('stars') == null ? '' : l.cardStaysStars(s.i('stars')!),
          ],
        ),
        (
          l.cardStaysRowDistance,
          [for (final s in stays) stayDistance(context, s) ?? ''],
        ),
        (
          l.cardStaysFilterFreeCancel,
          [for (final s in stays) yesNo(stayHasTerm(s, 'free_cancellation'))],
        ),
        (
          l.cardStaysFilterBreakfast,
          [for (final s in stays) yesNo(stayHasTerm(s, 'breakfast'))],
        ),
        (
          l.cardStaysAmenities,
          [for (final s in stays) s.texts('amenities').take(8).join(', ')],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cur = p.s('currency');
    final all = p.rows('stays');
    final list = _shown(all);
    final shown = _all ? list : list.take(3).toList();
    final cheapest =
        p.n('cheapest') ??
        all
            .map(stayNight)
            .whereType<double>()
            .fold<double?>(null, (a, b) => a == null || b < a ? b : a);
    final nights =
        p.i('nights') ?? nightsBetween(p.s('checkIn'), p.s('checkOut'));
    // A tick for a row that has gone (a refresh) doesn't count.
    final ids = {for (final s in all) ?s.s('id')};
    _picked.removeWhere((id) => !ids.contains(id));

    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.bedDouble,
        iconColor: stayTeal,
        title: p.map('place').s('label') ?? '—',
        subtitle: staysDatesLine(context, p),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: cheapest == null
                    ? const SizedBox.shrink()
                    : Text(
                        l.cardStaysFromNight(cardMoney(context, cheapest, cur)),
                        key: const Key('staysFrom'),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: stayTeal,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
              TextButton.icon(
                key: const Key('staysEdit'),
                onPressed: () => showStaySearchSheet(
                  context,
                  initial: staySearchInitial(p),
                  act: widget.act,
                ),
                icon: const Icon(LucideIcons.pencil, size: 14),
                label: Text(l.cardStaysEdit),
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final (s, key, label) in [
                (_Sort.best, 'best', l.cardStaysSortBest),
                (_Sort.cheapest, 'cheapest', l.cardStaysSortCheapest),
                (_Sort.topRated, 'top_rated', l.cardStaysSortTopRated),
                (_Sort.closest, 'closest', l.cardStaysSortClosest),
              ])
                ChoiceChip(
                  key: Key('staysSort-$key'),
                  label: Text(label),
                  selected: _sort == s,
                  onSelected: (_) => setState(() => _sort = s),
                  visualDensity: VisualDensity.compact,
                ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final (f, label) in [
                ('free_cancellation', l.cardStaysFilterFreeCancel),
                ('breakfast', l.cardStaysFilterBreakfast),
                ('pay_at_property', l.cardStaysFilterPayAtHotel),
                ('stars4', l.cardStaysFilterStars),
                ('rated8', l.cardStaysFilterRated),
                for (final a in _amenityChips(all)) ('has:$a', a),
              ])
                FilterChip(
                  key: Key('staysFilter-$f'),
                  label: Text(label),
                  selected: _filters.contains(f),
                  onSelected: (v) => _toggle(f, v),
                  visualDensity: VisualDensity.compact,
                ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: SegmentedButton<bool>(
              key: const Key('staysView'),
              showSelectedIcon: false,
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              segments: [
                ButtonSegment(
                  value: false,
                  icon: const Icon(LucideIcons.list, size: 14),
                  label: Text(l.cardStaysList, key: const Key('staysViewList')),
                ),
                ButtonSegment(
                  value: true,
                  icon: const Icon(LucideIcons.map, size: 14),
                  label: Text(l.cardStaysMap, key: const Key('staysViewMap')),
                ),
              ],
              selected: {_map},
              onSelectionChanged: (s) => setState(() => _map = s.first),
            ),
          ),
          const SizedBox(height: 10),
          if (list.isEmpty)
            LivePanel(child: Text(l.cardStaysNone, style: context.cardLabel))
          else if (_map)
            _StaysMap(stays: list, currency: cur, onOpen: _open)
          else ...[
            for (final s in shown) ...[
              _StayRow(
                stay: s,
                currency: cur,
                nights: nights,
                picked: _picked.contains(s.s('id')),
                canPick: _picked.length < comparePickLimit,
                onPick: (v) => _pick(s.s('id') ?? '', v),
                onOpen: () => _open(s),
              ),
              const SizedBox(height: 8),
            ],
            if (list.length > 3)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  key: const Key('staysMore'),
                  onPressed: () => setState(() => _all = !_all),
                  child: Text(
                    _all
                        ? l.cardStaysShowFewer
                        : l.cardStaysShowAll(list.length),
                  ),
                ),
              ),
            CompareBar(
              buttonKey: const Key('staysCompare'),
              count: _picked.length,
              onCompare: () => _compare(all),
            ),
          ],
          const SizedBox(height: 6),
          Text(l.cardStaysCheck, style: context.cardLabel),
          CardAffiliateFooter(card: p),
        ],
      ),
    );
  }
}

/// The places that have a spot on the map, each as a pin with its price a night.
class _StaysMap extends StatelessWidget {
  const _StaysMap({
    required this.stays,
    required this.currency,
    required this.onOpen,
  });
  final List<P> stays;
  final String? currency;
  final ValueChanged<P> onOpen;

  @override
  Widget build(BuildContext context) {
    final placed = <P>[];
    final pins = <CardPin>[];
    for (final s in stays) {
      final night = stayNight(s);
      final pin = cardPin(
        s.n('lat'),
        s.n('lng'),
        night == null ? s.s('name') : cardMoney(context, night, currency),
      );
      if (pin == null) continue;
      placed.add(s);
      pins.add(pin);
    }
    if (pins.isEmpty) {
      return LivePanel(
        child: Text(context.l10n.cardStaysNoMap, style: context.cardLabel),
      );
    }
    return CardPinMap(
      key: const Key('staysMap'),
      pins: pins,
      height: 280,
      onTap: (i) => onOpen(placed[i]),
    );
  }
}

class _StayRow extends StatelessWidget {
  const _StayRow({
    required this.stay,
    required this.currency,
    required this.nights,
    required this.picked,
    required this.canPick,
    required this.onPick,
    required this.onOpen,
  });
  final P stay;
  final String? currency;
  final int? nights;
  final bool picked;
  final bool canPick;
  final ValueChanged<bool> onPick;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final id = stay.s('id') ?? '';
    final deals = stay.rows('deals');
    final bestIndex = cheapestDealIndex(deals);
    final best = bestIndex == null ? null : deals[bestIndex];
    final night = best?.n('night') ?? stay.n('night');
    final total = best?.n('stay') ?? stay.n('stay');
    final stars = stay.i('stars') ?? 0;
    final rating = stayRatingText(context, stay);
    final distance = stayDistance(context, stay);
    final terms = [
      for (final t in best?.texts('terms') ?? const <String>[])
        ?termLabel(context, t),
    ];
    final url = best?.s('url');
    return Material(
      color: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.tile),
        side: BorderSide(
          color: picked
              ? context.colorScheme.primary
              : context.appColors.hairline,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: Key('staysRow-$id'),
        onTap: onOpen,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 4, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardImage(
                    url: stay.s('imageUrl'),
                    width: 64,
                    height: 64,
                    radius: AppRadius.icon,
                    fallback: const SizedBox(
                      width: 64,
                      height: 64,
                      child: CardPhotoPlaceholder(icon: LucideIcons.bedDouble),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          stay.s('name') ?? '—',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        if (stars > 0) StarRow(stars: stars),
                        if (rating != null)
                          Text(
                            rating,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.cardLabel,
                          ),
                        if (distance != null)
                          Text(
                            distance,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.cardLabel,
                          ),
                      ],
                    ),
                  ),
                  PickTick(
                    key: Key('staysPick-$id'),
                    picked: picked,
                    enabled: canPick,
                    onChanged: onPick,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Side by side, or the button under the price on a narrow card.
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: 8,
                runSpacing: 6,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (night != null)
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: cardMoney(context, night, currency),
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                        fontFeatures: AppText.tabular,
                                        color: context.colorScheme.onSurface,
                                      ),
                                ),
                                TextSpan(text: ' ${l.cardStaysANight}'),
                              ],
                            ),
                            style: context.cardLabel,
                          ),
                        if (total != null && nights != null)
                          Text(
                            l.cardStaysTotalNights(
                              cardMoney(context, total, currency),
                              nights!,
                            ),
                            style: context.cardLabel,
                          ),
                        if (best != null)
                          Text(
                            [?best.s('site'), ...terms].join(' · '),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.cardLabel,
                          ),
                        if (deals.length > 1)
                          Text(
                            l.cardStaysMoreSites(deals.length - 1),
                            style: context.cardLabel,
                          ),
                      ],
                    ),
                  ),
                  if (url != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FilledButton.tonalIcon(
                        key: Key('staysDeal-$id'),
                        onPressed: () => openCardLink(url),
                        icon: const Icon(LucideIcons.externalLink, size: 14),
                        label: Text(l.cardStaysViewDeal),
                        style: FilledButton.styleFrom(
                          visualDensity: VisualDensity.compact,
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
