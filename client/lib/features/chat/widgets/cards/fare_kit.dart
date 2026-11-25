import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/providers.dart';
import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import '../../../../ui/adaptive_modal.dart';
import 'live_kit.dart';

// What the flight cards share (docs/FLIGHT-CARDS-PLAN.md): money and dates, airline tiles, the
// cautions on a fare, one fare flight by flight, and the sheet a card opens another view in.

const planeBlue = Color(0xFF2F7BD3);

/// A card's event to the bot: its name, its values, and the words shown as the person's message.
typedef FareAct = void Function(
  String event,
  Map<String, Object?> values,
  String label,
);

/// A fare in the card's currency, without cents.
String fmtFare(BuildContext context, num v, String? currency) {
  final cur = (currency ?? '').toUpperCase();
  try {
    return NumberFormat.simpleCurrency(
      locale: context.l10n.localeName,
      name: cur.isEmpty ? null : cur,
      decimalDigits: 0,
    ).format(v);
  } catch (_) {
    return '${NumberFormat.decimalPattern(context.l10n.localeName).format(v.round())} $cur';
  }
}

/// A fare short enough for a calendar cell or a map pin: "6.7K", "17.6K".
String fmtFareShort(BuildContext context, num v) {
  if (v < 1000) return v.round().toString();
  return NumberFormat.compact(locale: context.l10n.localeName).format(v);
}

String fareDuration(int m) => m % 60 == 0
    ? '${m ~/ 60}h'
    : '${m ~/ 60}h ${(m % 60).toString().padLeft(2, '0')}m';

/// "Mar 12" for a day, "March 2027" for a month.
String fareDate(BuildContext context, String? iso) {
  if (iso == null) return '';
  final locale = context.l10n.localeName;
  if (iso.length == 7) {
    final d = DateTime.tryParse('$iso-01');
    return d == null ? iso : DateFormat.yMMMM(locale).format(d);
  }
  final d = DateTime.tryParse(iso.length >= 10 ? iso.substring(0, 10) : iso);
  return d == null ? iso : DateFormat.MMMd(locale).format(d);
}

/// "Fri, Mar 12".
String fareWeekday(BuildContext context, String? iso) {
  final d = iso == null || iso.length < 10
      ? null
      : DateTime.tryParse(iso.substring(0, 10));
  return d == null
      ? (iso ?? '')
      : DateFormat.MMMEd(context.l10n.localeName).format(d);
}

String fareCabin(BuildContext context, String? cabin) {
  final l = context.l10n;
  return switch (cabin) {
    'premium' => l.cardFaresPremium,
    'business' => l.cardFaresBusiness,
    'first' => l.cardFaresFirst,
    _ => l.cardFaresEconomy,
  };
}

int farePeople(P card) {
  final t = card.map('travellers');
  return (t.i('adults') ?? 1) + (t.i('children') ?? 0) + (t.i('infants') ?? 0);
}

/// The two-letter codes of the airlines an option flies, in order, without repeats.
List<String> fareCarriers(P option) {
  final codes = <String>[];
  for (final leg in [option.map('out'), option.map('back')]) {
    for (final s in leg.rows('segments')) {
      final c = s.s('code');
      if (c != null && !codes.contains(c)) codes.add(c);
    }
  }
  return codes;
}

/// A small tile with an airline's two-letter code, tinted from the code so each airline keeps
/// its color. Not a logo: airlines' marks are theirs.
class AirlineTile extends StatelessWidget {
  const AirlineTile({super.key, required this.code, this.size = 22});
  final String code;
  final double size;

  @override
  Widget build(BuildContext context) {
    final hue = (code.codeUnits.fold<int>(7, (a, b) => a * 31 + b) % 360)
        .toDouble();
    final dark = Theme.of(context).brightness == Brightness.dark;
    final c = HSLColor.fromAHSL(1, hue, 0.55, dark ? 0.68 : 0.40).toColor();
    return Container(
      width: size * 1.25,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        code,
        style: context.textTheme.labelSmall?.copyWith(
          color: c,
          fontWeight: FontWeight.w800,
          fontSize: size * 0.45,
          letterSpacing: 0.2,
          height: 1,
        ),
      ),
    );
  }
}

class AirlineTiles extends StatelessWidget {
  const AirlineTiles({super.key, required this.codes});
  final List<String> codes;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (final c in codes.take(3))
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: AirlineTile(code: c),
        ),
    ],
  );
}

/// A caution's short name, for a pill on a fare.
String fareFlagLabel(BuildContext context, String flag) {
  final l = context.l10n;
  return switch (flag) {
    'separate_tickets' => l.cardFaresFlagSeparate,
    'overnight' => l.cardFaresFlagOvernight,
    'airport_change' => l.cardFaresFlagAirport,
    'short_layover' => l.cardFaresFlagShort,
    'long_layover' => l.cardFaresFlagLong,
    _ => flag,
  };
}

/// A caution in a sentence, for a fare shown in full.
String fareFlagNote(BuildContext context, String flag) {
  final l = context.l10n;
  return switch (flag) {
    'separate_tickets' => l.cardFaresNoteSeparate,
    'overnight' => l.cardFaresNoteOvernight,
    'airport_change' => l.cardFaresNoteAirport,
    'short_layover' => l.cardFaresNoteShort,
    'long_layover' => l.cardFaresNoteLong,
    _ => flag,
  };
}

/// The cautions on a fare as small pills: never color alone, each has its words.
class FareFlags extends StatelessWidget {
  const FareFlags({super.key, required this.flags});
  final List<String> flags;
  @override
  Widget build(BuildContext context) {
    if (flags.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: [
        for (final f in flags)
          LivePill(
            text: fareFlagLabel(context, f),
            color: context.appColors.warning,
            icon: LucideIcons.triangleAlert,
          ),
      ],
    );
  }
}

/// "Tokyo (NRT)" from the card's airport names, or just the code.
String fareAirport(P airports, String? code) {
  if (code == null) return '';
  final city = airports.map(code).s('city');
  return city == null ? code : '$city ($code)';
}

/// One fare, flight by flight: each direction's flights with the waits between them, bags and
/// what to look at twice. A card from before flights were listed shows its times only.
class FareOptionDetails extends StatelessWidget {
  const FareOptionDetails({
    super.key,
    required this.option,
    required this.airports,
  });
  final P option;
  final P airports;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final back = option.map('back');
    final bags = option.map('bags');
    final flags = option.texts('flags');
    final emissions = option.map('emissions');
    final muted = context.colorScheme.onSurfaceVariant;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _LegDetails(
          leg: option.map('out'),
          airports: airports,
          title: back.isEmpty ? null : l.cardFaresOutbound,
        ),
        if (!back.isEmpty) ...[
          const SizedBox(height: 14),
          _LegDetails(leg: back, airports: airports, title: l.cardFaresReturn),
        ],
        if (!bags.isEmpty) ...[
          const SizedBox(height: 12),
          _Note(
            icon: LucideIcons.briefcase,
            text: l.cardFaresBags(bags.i('cabin') ?? 0, bags.i('checked') ?? 0),
            color: muted,
          ),
        ],
        if (emissions.i('kg') case final kg?) ...[
          const SizedBox(height: 6),
          _Note(
            icon: LucideIcons.leaf,
            text: l.cardFaresEmissions(kg),
            color: muted,
          ),
        ],
        for (final f in flags) ...[
          const SizedBox(height: 6),
          _Note(
            icon: LucideIcons.triangleAlert,
            text: fareFlagNote(context, f),
            color: context.appColors.warning,
          ),
        ],
      ],
    );
  }
}

class _Note extends StatelessWidget {
  const _Note({required this.icon, required this.text, required this.color});
  final IconData icon;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Icon(icon, size: 14, color: color),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          text,
          style: context.textTheme.labelMedium?.copyWith(
            color: color,
            height: 1.35,
          ),
        ),
      ),
    ],
  );
}

class _LegDetails extends StatelessWidget {
  const _LegDetails({required this.leg, required this.airports, this.title});
  final P leg;
  final P airports;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final segs = leg.rows('segments');
    final waits = leg.rows('layovers');
    final stops = leg.i('stops') ?? 0;
    final first = leg.s('depart');
    final muted = context.colorScheme.onSurfaceVariant;
    final head = [
      ?title,
      fareWeekday(context, first),
      fareDuration(leg.i('minutes') ?? 0),
      stops == 0 ? l.cardFaresDirect : l.cardFaresStops(stops),
    ].join(' · ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          head,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        if (segs.isEmpty)
          Text(
            '${leg.s('from') ?? ''} ${_clock(context, first)} → ${leg.s('to') ?? ''} ${_clock(context, leg.s('arrive'))}',
            style: context.textTheme.bodyMedium?.copyWith(
              fontFeatures: AppText.tabular,
            ),
          )
        else
          for (final (i, s) in segs.indexed) ...[
            _Segment(s: s, airports: airports, day: first),
            if (i < waits.length)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: _Wait(w: waits[i], airports: airports, color: muted),
              ),
          ],
      ],
    );
  }
}

String _clock(BuildContext context, String? iso) {
  final t = placeTime(iso);
  return t == null ? '—' : clockOf(context, t);
}

/// "+1" when a time is on a later day than the direction's first flight.
String _plusDays(String? iso, String? first) {
  final a = placeTime(iso);
  final b = placeTime(first);
  if (a == null || b == null) return '';
  final n = DateUtils.dateOnly(a).difference(DateUtils.dateOnly(b)).inDays;
  return n > 0 ? ' +$n' : '';
}

class _Segment extends StatelessWidget {
  const _Segment({required this.s, required this.airports, required this.day});
  final P s;
  final P airports;
  final String? day;

  @override
  Widget build(BuildContext context) {
    final muted = context.colorScheme.onSurfaceVariant;
    final line = context.appColors.hairline;
    final time = context.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w700,
      fontFeatures: AppText.tabular,
    );
    final small = context.textTheme.labelMedium?.copyWith(
      color: muted,
      height: 1.3,
    );
    final code = s.s('code');
    final flight = [
      s.s('airline'),
      s.s('flight'),
      if ((s.i('minutes') ?? 0) > 0) fareDuration(s.i('minutes')!),
      s.s('cabin'),
      s.s('aircraft'),
      s.s('legroom'),
    ].whereType<String>().where((x) => x.isNotEmpty).join(' · ');
    Widget stop(String? at, String? iso) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 74,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: _clock(context, iso)),
                TextSpan(
                  text: _plusDays(iso, day),
                  style: TextStyle(color: context.appColors.warning),
                ),
              ],
            ),
            style: time,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 10),
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: planeBlue, width: 2),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fareAirport(airports, at),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (airports.map(at ?? '').s('name') case final name?)
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: small,
                ),
            ],
          ),
        ),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        stop(s.s('from'), s.s('depart')),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 74),
            Padding(
              padding: const EdgeInsets.only(left: 3.5, right: 13.5),
              child: Container(width: 2, height: 34, color: line),
            ),
            if (code != null) ...[
              AirlineTile(code: code, size: 18),
              const SizedBox(width: 6),
            ],
            Expanded(
              child: Text(
                flight,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: small,
              ),
            ),
          ],
        ),
        stop(s.s('to'), s.s('arrive')),
      ],
    );
  }
}

class _Wait extends StatelessWidget {
  const _Wait({required this.w, required this.airports, required this.color});
  final P w;
  final P airports;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final change = w.s('changeTo');
    final words = [
      l.cardFaresLayover(
        fareDuration(w.i('minutes') ?? 0),
        fareAirport(airports, w.s('at')),
      ),
      if (w.b('overnight') == true) l.cardFaresFlagOvernight,
      if (change != null) l.cardFaresLeaveFrom(fareAirport(airports, change)),
    ].join(' · ');
    final warn = w.b('overnight') == true || change != null;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: (warn ? context.appColors.warning : color).withValues(
          alpha: 0.08,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            LucideIcons.hourglass,
            size: 13,
            color: warn ? context.appColors.warning : color,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              words,
              style: context.textTheme.labelMedium?.copyWith(
                color: warn ? context.appColors.warning : color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A sheet's top line: a title, an optional subtitle and a way back or out.
class FareSheetHeader extends StatelessWidget {
  const FareSheetHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
  });
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      if (onBack != null)
        IconButton(
          key: const Key('fareSheetBack'),
          onPressed: onBack,
          icon: const Icon(LucideIcons.chevronLeft, size: 20),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.cardLabel,
              ),
          ],
        ),
      ),
      IconButton(
        key: const Key('fareSheetClose'),
        onPressed: () => Navigator.of(context).maybePop(),
        icon: const Icon(LucideIcons.x, size: 20),
        tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      ),
    ],
  );
}

/// The frame every flight sheet uses: padded, scrolls when it's taller than the screen.
class FareSheet extends StatelessWidget {
  const FareSheet({super.key, required this.header, required this.child});
  final Widget header;
  final Widget child;
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header,
          const SizedBox(height: 8),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(right: 8),
              child: child,
            ),
          ),
        ],
      ),
    ),
  );
}

/// Builds what a fetched view shows: its card, and what a tap inside it may open next.
typedef FareViewBuilder = Widget Function(
  BuildContext context,
  P card,
  void Function(String view) open,
);

/// Opens another view of a fares card in a sheet (docs/FLIGHT-CARDS-PLAN.md §5): the card's id and
/// a short value go to the server, which answers with that view's card. No model turn.
Future<void> showFareView(
  BuildContext context, {
  required String cardId,
  required String view,
  required String title,
  required FareViewBuilder builder,
}) => showAdaptiveSheet<void>(
  context: context,
  builder: (_) => _FareViewSheet(
    cardId: cardId,
    view: view,
    title: title,
    builder: builder,
  ),
);

class _FareViewSheet extends ConsumerStatefulWidget {
  const _FareViewSheet({
    required this.cardId,
    required this.view,
    required this.title,
    required this.builder,
  });
  final String cardId;
  final String view;
  final String title;
  final FareViewBuilder builder;

  @override
  ConsumerState<_FareViewSheet> createState() => _FareViewSheetState();
}

class _FareViewSheetState extends ConsumerState<_FareViewSheet> {
  /// The views opened so far; the last one is on screen.
  late final _views = <String>[widget.view];
  final _cards = <String, P>{};
  String? _error;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _load(widget.view);
  }

  Future<void> _load(String view) async {
    if (_cards.containsKey(view)) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final r = await ref
          .read(backendProvider)
          .refreshLiveCard(widget.cardId, view: view);
      if (!mounted) return;
      final card = r['card'];
      final error = r['error'] as String?;
      setState(() {
        _loading = false;
        // A stale answer is the card the sheet was opened from, not the view asked for.
        if (error != null || card is! Map) {
          _error = context.l10n.cardFaresViewFailed;
        } else {
          _cards[view] = P(Map<Object?, Object?>.from(card));
        }
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = context.l10n.cardFaresViewFailed;
      });
    }
  }

  void _open(String view) {
    setState(() => _views.add(view));
    _load(view);
  }

  void _back() {
    if (_views.length < 2) return;
    setState(() {
      _views.removeLast();
      _error = null;
      _loading = false;
    });
    _load(_views.last);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final view = _views.last;
    final card = _cards[view];
    final src = card?.map('live').map('source').s('name');
    return FareSheet(
      header: FareSheetHeader(
        title: widget.title,
        subtitle: src,
        onBack: _views.length > 1 ? _back : null,
      ),
      child: card != null
          ? widget.builder(context, card, _open)
          : _error != null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_error!, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    key: const Key('fareSheetRetry'),
                    onPressed: _loading ? null : () => _load(view),
                    child: Text(l.cardFaresTryAgain),
                  ),
                ],
              ),
            )
          : const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
    );
  }
}
