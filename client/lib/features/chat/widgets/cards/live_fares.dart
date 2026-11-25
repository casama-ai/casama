import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/analytics.dart';
import '../../../../core/backend.dart';
import '../../../../core/providers.dart';
import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import '../../../../ui/adaptive_modal.dart';
import 'fare_kit.dart';
import 'live_fare_details.dart';
import 'live_flight_search.dart';
import 'live_kit.dart';

export 'fare_kit.dart' show fmtFare;

// Flight fares (docs/FLIGHT-SEARCH-PLAN.md §5, docs/FLIGHT-CARDS-PLAN.md §3.1): real prices from
// Kiwi.com or Google Flights, sorted and filtered on the device, a strip of the days around the
// search, each option's flights a tap away, and a Book button that opens the provider's page.

final faresComponent = liveCard('Fares', const [
  'from',
  'to',
  'depart',
  'return',
  'nights',
  'travellers',
  'cabin',
  'currency',
  'sort',
  'roundTrip',
  'outboundOnly',
  'cheapest',
  'fastest',
  'options',
  'airports',
  'strip',
  'typical',
  'searchUrl',
  'affiliate',
  'compare',
], (context, p, ctl) => FaresView(p: p, ctl: ctl, act: ctl.act));

/// The person's active price watches (FLIGHT-SEARCH-PLAN §9); empty when the server is older.
final fareWatchesProvider = FutureProvider<List<Map<String, Object?>>>((ref) async {
  try {
    return await ref.watch(backendProvider).fareWatches();
  } catch (_) {
    return const [];
  }
});

/// A watch's prices over time, oldest first: `history` is a list of [seconds, price].
List<double> watchPoints(Map<String, Object?> watch) => [
  if (watch['history'] case final List h)
    for (final x in h)
      if (x is List && x.length == 2 && x[1] is num) (x[1] as num).toDouble(),
];

enum _Sort { best, cheapest, fastest }

const _dayParts = ['morning', 'afternoon', 'evening', 'night'];
String _partOfDay(int hour) => hour < 5
    ? 'night'
    : hour < 12
    ? 'morning'
    : hour < 18
    ? 'afternoon'
    : 'evening';

/// What a search form or "Open in chat" sends the bot for a card's own trip.
Map<String, Object?> fareTrip(P p) {
  final t = p.map('travellers');
  return {
    'from': p.map('from').s('label'),
    'to': p.map('to').s('label'),
    'depart': p.s('depart') ?? p.s('month'),
    'return': ?p.s('return'),
    'nights': ?p.i('nights'),
    'adults': t.i('adults') ?? 1,
    'children': t.i('children') ?? 0,
    'infants': t.i('infants') ?? 0,
    'cabin': p.s('cabin') ?? 'economy',
  };
}

class FaresView extends ConsumerStatefulWidget {
  const FaresView({super.key, required this.p, this.ctl, this.act});
  final P p;

  /// The card's host. Null when these fares are another card's view, shown in a sheet: there is
  /// then no strip to move along and no watch, and the sheet has the title.
  final LiveCardController? ctl;

  /// Sends the person's choice to the bot (Edit search, Open in chat).
  final FareAct? act;

  @override
  ConsumerState<FaresView> createState() => _FaresState();
}

class _FaresState extends ConsumerState<FaresView> {
  late _Sort _sort = switch (widget.p.s('sort')) {
    'cheapest' => _Sort.cheapest,
    'fastest' => _Sort.fastest,
    _ => _Sort.best,
  };
  bool _direct = false;
  bool _bag = false;
  bool _all = false;
  final _times = <String>{};
  final _airlines = <String>{};

  P get p => widget.p;
  bool get _embedded => widget.ctl == null;

  bool _keep(P o) {
    final out = o.map('out');
    final back = o.map('back');
    if (_direct && ((out.i('stops') ?? 0) != 0 || (!back.isEmpty && (back.i('stops') ?? 0) != 0))) {
      return false;
    }
    if (_times.isNotEmpty) {
      final t = placeTime(out.s('depart'));
      if (t == null || !_times.contains(_partOfDay(t.hour))) return false;
    }
    if (_airlines.isNotEmpty && !o.texts('airlines').any(_airlines.contains)) return false;
    if (_bag && (o.map('bags').i('checked') ?? 0) < 1) return false;
    return true;
  }

  List<P> get _options {
    final list = [
      for (final o in p.rows('options'))
        if (_keep(o)) o,
    ];
    switch (_sort) {
      case _Sort.cheapest:
        list.sort((a, b) => (a.n('price') ?? 0).compareTo(b.n('price') ?? 0));
      case _Sort.fastest:
        list.sort((a, b) {
          final m = (a.i('minutes') ?? 0).compareTo(b.i('minutes') ?? 0);
          return m != 0 ? m : (a.n('price') ?? 0).compareTo(b.n('price') ?? 0);
        });
      case _Sort.best:
        break;
    }
    return list;
  }

  String _partLabel(String part) {
    final l = context.l10n;
    return switch (part) {
      'morning' => l.cardFaresMorning,
      'afternoon' => l.cardFaresAfternoon,
      'evening' => l.cardFaresEvening,
      _ => l.cardFaresNight,
    };
  }

  void _details(P o) {
    Analytics.log('fare_details_opened', {'where': _embedded ? 'sheet' : 'card'});
    showAdaptiveSheet<void>(
      context: context,
      builder: (_) => FareDetailsSheet(card: p, option: o),
    );
  }

  /// Another day on the card's own strip: the server answers with that day's fares, no model turn.
  void _pickDay(String date) {
    final ctl = widget.ctl;
    if (ctl == null || ctl.refreshing) return;
    final base = ctl.state.widget.initial['depart'];
    Analytics.log('fare_view_opened', {'card': 'Fares', 'view': 'day'});
    setState(() => _all = false);
    ctl.setView(date == base ? null : date);
  }

  void _edit() {
    final act = widget.act;
    if (act == null) return;
    showFlightSearchSheet(context, initial: P(fareTrip(p)), act: act);
  }

  void _openInChat() {
    final act = widget.act;
    if (act == null) return;
    final trip = fareTrip(p);
    act(
      'flights.open',
      trip,
      context.l10n.cardFaresOpenLabel('${trip['from']} → ${trip['to']}', fareDate(context, p.s('depart'))),
    );
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final from = p.map('from');
    final to = p.map('to');
    final cur = p.s('currency');
    final people = farePeople(p);
    final dates = [
      fareDate(context, p.s('depart')),
      if (p.s('return') != null) fareDate(context, p.s('return')),
    ].join(' – ');
    final nights = p.i('nights');
    final subtitle = [
      if (nights != null) '$dates · ${l.cardFaresNights(nights)}' else dates,
      l.cardFaresTravellers(people),
      fareCabin(context, p.s('cabin')),
    ].join(' · ');
    final all = p.rows('options');
    final options = _options;
    final cheapest = p.n('cheapest');
    final fastest = p.i('fastest');
    final shown = _all ? options : options.take(3).toList();
    final typical = p.map('typical');
    final history = [
      if (typical['history'] case final List h)
        for (final x in h)
          if (x is List && x.length == 2 && x[1] is num) (x[1] as num).toDouble(),
    ];
    final level = switch (typical.s('level')) {
      'low' => (l.cardFaresLevelLow, context.appColors.positive),
      'high' => (l.cardFaresLevelHigh, context.appColors.warning),
      'typical' => (
        l.cardFaresLevelTypical,
        context.colorScheme.onSurfaceVariant,
      ),
      _ => null,
    };
    final airlines = <String>{for (final o in all) ...o.texts('airlines')}.toList()..sort();
    final hasBags = all.any((o) => !o.map('bags').isEmpty);
    final strip = p.rows('strip');
    final ctl = widget.ctl;

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_embedded) ...[
          Row(
            children: [
              Expanded(child: Text(subtitle, style: context.cardLabel)),
              if (cheapest != null) LivePill(text: l.cardFaresFromPrice(fmtFare(context, cheapest, cur)), color: planeBlue),
            ],
          ),
          const SizedBox(height: 10),
        ],
        if (ctl?.ref != null && strip.length > 1) ...[
          _DayStrip(
            days: strip,
            selected: p.s('depart'),
            busy: ctl!.refreshing,
            onPick: _pickDay,
          ),
          const SizedBox(height: 10),
        ],
        if (typical.n('low') != null && typical.n('high') != null) ...[
          Row(
            children: [
              Icon(
                LucideIcons.chartNoAxesColumn,
                size: 14,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  l.cardFaresTypical(
                    fmtFare(context, typical.n('low')!, cur),
                    fmtFare(context, typical.n('high')!, cur),
                  ),
                  style: context.cardLabel,
                ),
              ),
              if (level != null) LivePill(text: level.$1, color: level.$2),
            ],
          ),
          // Google's price history for the route, when it sent one.
          if (history.length > 1) ...[
            const SizedBox(height: 6),
            Sparkline(key: const Key('faresHistory'), points: history, color: planeBlue, height: 44),
          ],
          const SizedBox(height: 10),
        ],
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (final (s, label) in [
              (_Sort.best, l.cardFaresBest),
              (_Sort.cheapest, l.cardFaresCheapest),
              (_Sort.fastest, l.cardFaresFastest),
            ])
              ChoiceChip(
                key: Key('faresSort-${s.name}'),
                label: Text(label),
                selected: _sort == s,
                onSelected: (_) => setState(() => _sort = s),
                visualDensity: VisualDensity.compact,
              ),
            FilterChip(
              key: const Key('faresDirect'),
              label: Text(l.cardFaresDirectOnly),
              selected: _direct,
              onSelected: (v) => setState(() => _direct = v),
              visualDensity: VisualDensity.compact,
            ),
            _MenuChip(
              key: const Key('faresTimes'),
              label: l.cardFaresTime,
              options: [for (final part in _dayParts) (part, _partLabel(part))],
              selected: _times,
              onToggle: (v) => setState(() => _times.contains(v) ? _times.remove(v) : _times.add(v)),
            ),
            if (airlines.length > 1)
              _MenuChip(
                key: const Key('faresAirlines'),
                label: l.cardFaresAirlines,
                options: [for (final a in airlines) (a, a)],
                selected: _airlines,
                onToggle: (v) => setState(() => _airlines.contains(v) ? _airlines.remove(v) : _airlines.add(v)),
              ),
            if (hasBags)
              FilterChip(
                key: const Key('faresBag'),
                label: Text(l.cardFaresBagIncluded),
                selected: _bag,
                onSelected: (v) => setState(() => _bag = v),
                visualDensity: VisualDensity.compact,
              ),
          ],
        ),
        const SizedBox(height: 10),
        if (options.isEmpty)
          LivePanel(
            child: Text(
              _times.isEmpty && _airlines.isEmpty && !_bag ? l.cardFaresNoDirect : l.cardFaresNoMatch,
              style: context.cardLabel,
            ),
          )
        else
          for (final o in shown) ...[
            _FareRow(
              o: o,
              currency: cur,
              cheapest: cheapest != null && o.n('price') == cheapest,
              fastest: fastest != null && o.i('minutes') == fastest,
              onTap: () => _details(o),
            ),
            const SizedBox(height: 8),
          ],
        if (options.length > 3)
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              key: const Key('faresMore'),
              onPressed: () => setState(() => _all = !_all),
              child: Text(
                _all
                    ? l.cardFaresShowFewer
                    : l.cardFaresShowAll(options.length),
              ),
            ),
          ),
        if (p.b('outboundOnly') == true) ...[
          Text(l.cardFaresOutboundOnly, style: context.cardLabel),
          if (p.s('searchUrl') case final u?)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => openCardLink(u),
                icon: const Icon(LucideIcons.externalLink, size: 14),
                label: Text(l.cardFaresSeeAll),
              ),
            ),
        ] else
          Text(l.cardFaresCheck, style: context.cardLabel),
        if (p.map('compare').s('url') case final u? when u.startsWith('https://'))
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              key: const Key('faresCompare'),
              onPressed: () => openCardLink(u),
              icon: const Icon(LucideIcons.externalLink, size: 14),
              label: Text(l.cardFaresCompare(p.map('compare').s('name') ?? 'Aviasales')),
            ),
          ),
        if (p.b('affiliate') == true) ...[
          const SizedBox(height: 4),
          Text(l.cardFaresAffiliate, key: const Key('faresAffiliate'), style: context.cardLabel),
        ],
        // A watch follows the card's own trip, not another day it is showing.
        if (ctl?.ref case final id? when cheapest != null && ctl?.view == null) ...[
          const SizedBox(height: 8),
          _WatchRow(cardId: id, currency: cur, cheapest: cheapest),
        ],
        if (widget.act != null) ...[
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: _embedded
                ? FilledButton.tonalIcon(
                    key: const Key('faresOpenInChat'),
                    onPressed: _openInChat,
                    icon: const Icon(LucideIcons.messageCircle, size: 16),
                    label: Text(l.cardFaresOpenInChat),
                  )
                : TextButton.icon(
                    key: const Key('faresEdit'),
                    onPressed: _edit,
                    icon: const Icon(LucideIcons.pencil, size: 14),
                    label: Text(l.cardFaresEdit),
                  ),
          ),
        ],
      ],
    );
    if (_embedded) return body;
    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.plane,
        iconColor: planeBlue,
        title: '${from.s('label') ?? '—'} → ${to.s('label') ?? '—'}',
        titleMaxLines: 2,
        subtitle: subtitle,
        pill: cheapest == null
            ? null
            : l.cardFaresFromPrice(fmtFare(context, cheapest, cur)),
        pillColor: planeBlue,
      ),
      body: body,
    );
  }
}

/// The days around the search with each one's cheapest fare; the searched day is marked.
class _DayStrip extends StatelessWidget {
  const _DayStrip({required this.days, required this.selected, required this.busy, required this.onPick});
  final List<P> days;
  final String? selected;
  final bool busy;
  final ValueChanged<String> onPick;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final locale = context.l10n.localeName;
    final low = days.map((d) => d.n('price') ?? double.infinity).reduce((a, b) => a < b ? a : b);
    return Opacity(
      opacity: busy ? 0.55 : 1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final d in days)
              if (d.s('date') case final date?)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Builder(
                    builder: (context) {
                      final on = date == selected;
                      final day = DateTime.tryParse(date);
                      final price = d.n('price');
                      return Material(
                        color: on ? planeBlue.withValues(alpha: 0.12) : scheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: on ? planeBlue : context.appColors.hairline, width: on ? 1.5 : 1),
                        ),
                        child: InkWell(
                          key: Key('faresDay-$date'),
                          borderRadius: BorderRadius.circular(12),
                          onTap: on || busy ? null : () => onPick(date),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  day == null ? date : DateFormat('E d', locale).format(day),
                                  style: context.textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  price == null ? '—' : fmtFareShort(context, price),
                                  style: context.textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontFeatures: AppText.tabular,
                                    color: price == low ? context.appColors.positive : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

/// A chip that opens a list to tick: times of day, airlines. Shows how many are ticked.
class _MenuChip extends StatelessWidget {
  const _MenuChip({super.key, required this.label, required this.options, required this.selected, required this.onToggle});
  final String label;
  final List<(String, String)> options;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
    tooltip: label,
    onSelected: onToggle,
    itemBuilder: (_) => [
      for (final (value, text) in options)
        CheckedPopupMenuItem(value: value, checked: selected.contains(value), child: Text(text)),
    ],
    // The chip is the menu's button: it doesn't take taps itself.
    child: IgnorePointer(
      child: FilterChip(
        label: Text(selected.isEmpty ? label : '$label · ${selected.length}'),
        selected: selected.isNotEmpty,
        onSelected: (_) {},
        visualDensity: VisualDensity.compact,
      ),
    ),
  );
}

/// "Watch price", or "Watching · ends Apr 2" with Stop (FLIGHT-SEARCH-PLAN §9).
class _WatchRow extends ConsumerStatefulWidget {
  const _WatchRow({required this.cardId, required this.currency, required this.cheapest});
  final String cardId;
  final String? currency;
  final num cheapest;

  @override
  ConsumerState<_WatchRow> createState() => _WatchRowState();
}

class _WatchRowState extends ConsumerState<_WatchRow> {
  bool _busy = false;

  Future<void> _start() async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.maybeOf(context);
    final below = await showDialog<double?>(
      context: context,
      builder: (_) => _WatchDialog(currency: widget.currency, cheapest: widget.cheapest),
    );
    if (below == null || !mounted) return;
    setState(() => _busy = true);
    try {
      await ref.read(backendProvider).watchFares(widget.cardId, below: below > 0 ? below : null);
      ref.invalidate(fareWatchesProvider);
      messenger?.showSnackBar(SnackBar(content: Text(l.cardFaresWatchStarted)));
      Analytics.log('fare_watch_started', {'target': below > 0});
    } on FareWatchFull {
      messenger?.showSnackBar(SnackBar(content: Text(l.cardFaresWatchFull)));
    } catch (_) {
      messenger?.showSnackBar(SnackBar(content: Text(l.cardFaresWatchFailed)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _stop() async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.maybeOf(context);
    setState(() => _busy = true);
    try {
      await ref.read(backendProvider).unwatchFares(widget.cardId);
      ref.invalidate(fareWatchesProvider);
      messenger?.showSnackBar(SnackBar(content: Text(l.cardFaresWatchStopped)));
      Analytics.log('fare_watch_stopped', {'where': 'card'});
    } catch (_) {
      messenger?.showSnackBar(SnackBar(content: Text(l.cardFaresWatchFailed)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final watches = ref.watch(fareWatchesProvider).value ?? const [];
    final w = watches.where((x) => x['card_id'] == widget.cardId).firstOrNull;
    if (w == null) {
      return Align(
        alignment: Alignment.centerLeft,
        child: OutlinedButton.icon(
          key: const Key('faresWatch'),
          onPressed: _busy ? null : _start,
          icon: const Icon(LucideIcons.bellPlus, size: 16),
          label: Text(l.cardFaresWatch),
        ),
      );
    }
    final ends = DateTime.tryParse('${w['ends_at']}');
    final date = ends == null ? '' : DateFormat.MMMd(l.localeName).format(ends.toLocal());
    final below = w['below'];
    final points = watchPoints(w);
    final first = w['first_price'];
    final last = w['last_price'];
    return LivePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(LucideIcons.bellRing, size: 16, color: planeBlue),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  below is num
                      ? l.cardFaresWatchingBelow(fmtFare(context, below, widget.currency), date)
                      : l.cardFaresWatching(date),
                  style: context.cardLabel,
                ),
              ),
              TextButton(
                key: const Key('faresWatchStop'),
                onPressed: _busy ? null : _stop,
                child: Text(l.cardFaresWatchStop),
              ),
            ],
          ),
          // How the fare has moved since the watch began (docs/FLIGHT-CARDS-PLAN.md §3.6).
          if (points.length > 1 && first is num && last is num && first > 0)
            Row(
              children: [
                ChangePill(pct: (last - first) / first * 100, goodWhenUp: false),
                const SizedBox(width: 8),
                Expanded(child: Text(l.cardFaresSinceStart, style: context.cardLabel)),
                SizedBox(
                  width: 72,
                  height: 26,
                  child: Sparkline(points: points, color: planeBlue, height: 26),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// Asks for an optional target price; answers 0 for "any big drop", null when cancelled.
class _WatchDialog extends StatefulWidget {
  const _WatchDialog({required this.currency, required this.cheapest});
  final String? currency;
  final num cheapest;

  @override
  State<_WatchDialog> createState() => _WatchDialogState();
}

class _WatchDialogState extends State<_WatchDialog> {
  final _target = TextEditingController();

  @override
  void dispose() {
    _target.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return AlertDialog(
      title: Text(l.cardFaresWatchTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l.cardFaresWatchBody),
          const SizedBox(height: 16),
          TextField(
            key: const Key('faresWatchTarget'),
            controller: _target,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: l.cardFaresWatchTarget,
              helperText: l.cardFaresWatchAnyDrop,
              suffixText: widget.currency,
              hintText: (widget.cheapest * 0.9).round().toString(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        FilledButton(
          key: const Key('faresWatchStart'),
          onPressed: () {
            final v = double.tryParse(_target.text.replaceAll(RegExp(r'[^0-9.]'), ''));
            Navigator.of(context).pop(v ?? 0);
          },
          child: Text(l.cardFaresWatchStart),
        ),
      ],
    );
  }
}

class _FareRow extends StatelessWidget {
  const _FareRow({
    required this.o,
    required this.currency,
    required this.cheapest,
    required this.fastest,
    required this.onTap,
  });
  final P o;
  final String? currency;
  final bool cheapest;
  final bool fastest;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final airlines = o.texts('airlines');
    final carriers = fareCarriers(o);
    final link = o.s('link');
    final flags = o.texts('flags');
    return InkWell(
      key: Key('faresRow-${o.s('id')}'),
      borderRadius: BorderRadius.circular(AppRadius.tile),
      onTap: onTap,
      child: LivePanel(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            fmtFare(context, o.n('price') ?? 0, currency),
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontFeatures: AppText.tabular,
                            ),
                          ),
                          if (cheapest)
                            LivePill(
                              text: l.cardFaresCheapest,
                              color: context.appColors.positive,
                            ),
                          if (fastest)
                            LivePill(text: l.cardFaresFastest, color: planeBlue),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          if (carriers.isNotEmpty) AirlineTiles(codes: carriers),
                          Expanded(
                            child: Text(
                              airlines.isEmpty ? '—' : airlines.join(' + '),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.cardLabel,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (link != null) ...[
                  const SizedBox(width: 8),
                  FilledButton.tonalIcon(
                    key: Key('faresBook-${o.s('id')}'),
                    onPressed: () => openCardLink(link),
                    icon: const Icon(LucideIcons.externalLink, size: 14),
                    label: Text(l.cardFaresBook),
                    style: FilledButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            _Leg(leg: o.map('out')),
            if (!o.map('back').isEmpty) ...[
              const SizedBox(height: 6),
              _Leg(leg: o.map('back'), back: true),
            ],
            if (flags.isNotEmpty) ...[
              const SizedBox(height: 8),
              FareFlags(flags: flags),
            ],
            const SizedBox(height: 6),
            Row(
              children: [
                if (!o.map('bags').isEmpty) ...[
                  Icon(
                    LucideIcons.briefcase,
                    size: 13,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      l.cardFaresBags(
                        o.map('bags').i('cabin') ?? 0,
                        o.map('bags').i('checked') ?? 0,
                      ),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ] else
                  const Spacer(),
                Text(
                  l.cardFaresDetails,
                  style: context.textTheme.labelSmall?.copyWith(color: planeBlue, fontWeight: FontWeight.w600),
                ),
                const Icon(LucideIcons.chevronRight, size: 14, color: planeBlue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Leg extends StatelessWidget {
  const _Leg({required this.leg, this.back = false});
  final P leg;
  final bool back;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final dep = placeTime(leg.s('depart'));
    final arr = placeTime(leg.s('arrive'));
    final nextDay =
        dep != null &&
        arr != null &&
        DateUtils.dateOnly(arr).isAfter(DateUtils.dateOnly(dep));
    final stops = leg.i('stops') ?? 0;
    final via = leg.texts('via');
    final minutes = leg.i('minutes') ?? 0;
    final muted = context.colorScheme.onSurfaceVariant;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(
            back ? LucideIcons.planeLanding : LucideIcons.planeTakeoff,
            size: 14,
            color: muted,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: dep == null ? '—' : clockOf(context, dep)),
                    const TextSpan(text: ' → '),
                    TextSpan(text: arr == null ? '—' : clockOf(context, arr)),
                    if (nextDay)
                      TextSpan(
                        text: ' +1',
                        style: TextStyle(
                          color: context.appColors.warning,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                  ],
                ),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFeatures: AppText.tabular,
                ),
              ),
              Text(
                [
                  '${leg.s('from') ?? ''}–${leg.s('to') ?? ''}',
                  if (stops == 0)
                    l.cardFaresDirect
                  else
                    '${l.cardFaresStops(stops)}${via.isEmpty ? '' : ' (${via.join(', ')})'}',
                  fareDuration(minutes),
                ].join(' · '),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelMedium?.copyWith(color: muted),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// The same "Watch price" row for a stays or product card (docs/STAYS-AND-SHOPPING-PLAN.md §6.1):
/// watches are one list on the server, whatever the card.
Widget priceWatchRow({required String cardId, required String? currency, required num price}) =>
    _WatchRow(cardId: cardId, currency: currency, cheapest: price);

