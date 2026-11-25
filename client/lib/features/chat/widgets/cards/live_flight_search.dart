import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/analytics.dart';
import '../../../../core/providers.dart';
import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../ui/adaptive_modal.dart';
import 'fare_kit.dart';
import 'live_kit.dart';

// The flight search form (docs/FLIGHT-CARDS-PLAN.md §3.5): places with airport lookup, dates or a
// whole month, travellers and cabin. A bot shows it when a trip is missing a place or its dates;
// the other flight cards open it as a sheet to change their search. Search flights sends
// "flights.search" with the fields as `live.fares` takes them.

final flightSearchComponent = liveCard(
  'FlightSearch',
  const [
    'title',
    'from',
    'to',
    'depart',
    'return',
    'trip',
    'adults',
    'kids',
    'infants',
    'cabin',
  ],
  (context, p, ctl) => LiveLayout(
    header: LiveHeader(
      icon: LucideIcons.search,
      iconColor: planeBlue,
      title: p.s('title') ?? context.l10n.cardFlightSearchTitle,
    ),
    body: FlightSearchForm(
      // The card calls children "kids": every component's `children` are its child ids.
      initial: P({
        'from': p.s('from'),
        'to': p.s('to'),
        'depart': p.s('depart'),
        'return': p.s('return'),
        'trip': p.s('trip'),
        'adults': p.i('adults'),
        'children': p.i('kids'),
        'infants': p.i('infants'),
        'cabin': p.s('cabin'),
      }),
      act: ctl.act,
      canSkip: true,
    ),
    footer: null,
  ),
);

/// The form in a sheet, filled in with a card's own search. Sending it closes the sheet and asks
/// with "flights.open", which leaves the card it came from as it was.
Future<void> showFlightSearchSheet(
  BuildContext context, {
  required P initial,
  required FareAct act,
}) => showAdaptiveSheet<void>(
  context: context,
  builder: (sheet) => FareSheet(
    header: FareSheetHeader(title: sheet.l10n.cardFlightSearchTitle),
    child: FlightSearchForm(
      initial: initial,
      event: 'flights.open',
      act: (event, values, label) {
        act(event, values, label);
        Navigator.of(sheet).maybePop();
      },
    ),
  ),
);

const _cabins = ['economy', 'premium', 'business', 'first'];

String _iso(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

class FlightSearchForm extends ConsumerStatefulWidget {
  const FlightSearchForm({
    super.key,
    required this.initial,
    required this.act,
    this.canSkip = false,
    this.event = 'flights.search',
  });

  /// What is already known, as `live.fares` names it: from, to, depart (a day or a month),
  /// return, nights, adults, children, infants, cabin; and trip ("return" or "oneway").
  final P initial;
  final FareAct act;

  /// Shows "Not now" (the card in a chat; a sheet is closed instead).
  final bool canSkip;

  /// The event Search flights sends: the form's own "flights.search" uses the card up;
  /// "flights.open", from another card's sheet, leaves that card as it was.
  final String event;

  @override
  ConsumerState<FlightSearchForm> createState() => _FormState();
}

class _FormState extends ConsumerState<FlightSearchForm> {
  final _from = TextEditingController();
  final _to = TextEditingController();

  /// What is sent when it isn't the field's own words: an airport's code, or "anywhere".
  String? _fromValue;
  String? _toValue;
  String _trip = 'return';
  bool _month = false;
  DateTime? _depart;
  DateTime? _return;
  String? _monthValue;
  int _nights = 7;
  int _adults = 1;
  int _children = 0;
  int _infants = 0;
  String _cabin = 'economy';
  bool _sent = false;
  bool _started = false;

  DateTime get _today => DateUtils.dateOnly(DateTime.now());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    final i = widget.initial;
    _from.text = i.s('from') ?? '';
    final to = i.s('to') ?? '';
    if (to.toLowerCase() == 'anywhere') {
      _to.text = context.l10n.cardFlightSearchAnywhere;
      _toValue = 'anywhere';
    } else {
      _to.text = to;
    }
    final depart = i.s('depart');
    final ret = i.s('return');
    if (depart != null && depart.length == 7) {
      _month = true;
      _monthValue = depart;
    } else if (depart != null) {
      final d = DateTime.tryParse(depart);
      if (d != null && !d.isBefore(_today)) _depart = DateUtils.dateOnly(d);
    }
    if (ret != null && ret.length == 10) {
      final r = DateTime.tryParse(ret);
      if (r != null && _depart != null && !r.isBefore(_depart!)) {
        _return = DateUtils.dateOnly(r);
      }
    }
    final back = ret != null || i.i('nights') != null;
    _trip = switch (i.s('trip')) {
      'oneway' => 'oneway',
      'return' => 'return',
      _ => back || depart == null ? 'return' : 'oneway',
    };
    _nights = (i.i('nights') ?? 7).clamp(1, 60);
    _adults = (i.i('adults') ?? 1).clamp(1, 9);
    _children = (i.i('children') ?? 0).clamp(0, 8);
    _infants = (i.i('infants') ?? 0).clamp(0, _adults.clamp(0, 4));
    if (_cabins.contains(i.s('cabin'))) _cabin = i.s('cabin')!;
  }

  @override
  void dispose() {
    _from.dispose();
    _to.dispose();
    super.dispose();
  }

  bool get _valid {
    if (_from.text.trim().isEmpty || _to.text.trim().isEmpty) return false;
    if (_month) return _monthValue != null;
    return _depart != null && (_trip == 'oneway' || _return != null);
  }

  String _datesText() {
    final l = context.l10n;
    final f = DateFormat.MMMd(l.localeName);
    if (_month) {
      return _monthValue == null ? '' : fareDate(context, _monthValue);
    }
    if (_depart == null) return '';
    if (_trip == 'return' && _return != null) {
      return '${f.format(_depart!)} – ${f.format(_return!)}';
    }
    return f.format(_depart!);
  }

  Future<void> _pickDates() async {
    final last = _today.add(const Duration(days: 360));
    if (_trip == 'return') {
      final r = await showDateRangePicker(
        context: context,
        firstDate: _today,
        lastDate: last,
        initialDateRange: _depart != null && _return != null
            ? DateTimeRange(start: _depart!, end: _return!)
            : null,
      );
      if (r == null || !mounted) return;
      setState(() {
        _depart = DateUtils.dateOnly(r.start);
        _return = DateUtils.dateOnly(r.end);
      });
    } else {
      final d = await showDatePicker(
        context: context,
        firstDate: _today,
        lastDate: last,
        initialDate: _depart ?? _today,
      );
      if (d == null || !mounted) return;
      setState(() => _depart = DateUtils.dateOnly(d));
    }
  }

  void _swap() {
    final text = _from.text;
    final value = _fromValue;
    setState(() {
      _from.text = _toValue == 'anywhere' ? '' : _to.text;
      _fromValue = _toValue == 'anywhere' ? null : _toValue;
      _to.text = text;
      _toValue = value;
    });
  }

  void _search() {
    if (!_valid || _sent) return;
    final l = context.l10n;
    final values = <String, Object?>{
      'from': _fromValue ?? _from.text.trim(),
      'to': _toValue ?? _to.text.trim(),
      'depart': _month ? _monthValue : _iso(_depart!),
      if (!_month && _trip == 'return') 'return': _iso(_return!),
      if (_month && _trip == 'return') 'nights': _nights,
      'adults': _adults,
      'children': _children,
      'infants': _infants,
      'cabin': _cabin,
    };
    Analytics.log('flight_search_sent', {
      'trip': _trip,
      'whole_month': _month,
      'anywhere': _toValue == 'anywhere',
    });
    setState(() => _sent = true);
    widget.act(
      widget.event,
      values,
      l.cardFlightSearchLabel(
        '${_from.text.trim()} → ${_to.text.trim()}',
        _datesText(),
      ),
    );
  }

  void _skip() {
    if (_sent) return;
    setState(() => _sent = true);
    widget.act('flights.skip', const {}, context.l10n.cardFlightSearchNotNow);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final dates = _datesText();
    final months = [
      for (var i = 0; i < 12; i++) DateTime(_today.year, _today.month + i),
    ];
    final form = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SegmentedButton<String>(
            key: const Key('flightSearchTrip'),
            showSelectedIcon: false,
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            segments: [
              ButtonSegment(
                value: 'return',
                label: Text(l.cardFlightSearchReturn),
              ),
              ButtonSegment(
                value: 'oneway',
                label: Text(l.cardFlightSearchOneWay),
              ),
            ],
            selected: {_trip},
            onSelectionChanged: (s) => setState(() => _trip = s.first),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _PlaceField(
                    fieldKey: const Key('flightSearchFrom'),
                    controller: _from,
                    label: l.cardFlightSearchFrom,
                    onTyped: () => setState(() => _fromValue = null),
                    onPicked: (v) => setState(() => _fromValue = v),
                  ),
                  const SizedBox(height: 8),
                  _PlaceField(
                    fieldKey: const Key('flightSearchTo'),
                    controller: _to,
                    label: l.cardFlightSearchTo,
                    onTyped: () => setState(() => _toValue = null),
                    onPicked: (v) => setState(() => _toValue = v),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: IconButton(
                key: const Key('flightSearchSwap'),
                onPressed: _swap,
                icon: const Icon(LucideIcons.arrowUpDown, size: 18),
                tooltip: l.cardFlightSearchSwap,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: ActionChip(
              key: const Key('flightSearchAnywhere'),
              avatar: const Icon(LucideIcons.earth, size: 14),
              label: Text(l.cardFlightSearchAnywhere),
              visualDensity: VisualDensity.compact,
              onPressed: () => setState(() {
                _to.text = l.cardFlightSearchAnywhere;
                _toValue = 'anywhere';
              }),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (!_month)
              OutlinedButton.icon(
                key: const Key('flightSearchDates'),
                onPressed: _pickDates,
                icon: const Icon(LucideIcons.calendarDays, size: 16),
                label: Text(
                  dates.isNotEmpty
                      ? dates
                      : _trip == 'return'
                      ? l.cardFlightSearchPickDates
                      : l.cardFlightSearchPickDate,
                ),
              ),
            FilterChip(
              key: const Key('flightSearchWholeMonth'),
              label: Text(l.cardFlightSearchWholeMonth),
              selected: _month,
              onSelected: (v) => setState(() {
                _month = v;
                _monthValue ??= _depart == null
                    ? null
                    : _iso(_depart!).substring(0, 7);
              }),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
        if (_month) ...[
          const SizedBox(height: 6),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final m in months)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      key: Key('flightSearchMonth-${_iso(m).substring(0, 7)}'),
                      label: Text(DateFormat.yMMM(l.localeName).format(m)),
                      selected: _monthValue == _iso(m).substring(0, 7),
                      onSelected: (_) =>
                          setState(() => _monthValue = _iso(m).substring(0, 7)),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
              ],
            ),
          ),
          if (_trip == 'return')
            _Stepper(
              name: 'Nights',
              label: l.cardFlightSearchNights,
              value: _nights,
              min: 1,
              max: 60,
              onChanged: (v) => setState(() => _nights = v),
            ),
        ],
        const SizedBox(height: 4),
        _Stepper(
          name: 'Adults',
          label: l.cardFlightSearchAdults,
          value: _adults,
          min: 1,
          max: 9,
          onChanged: (v) => setState(() {
            _adults = v;
            // An infant sits on an adult's lap.
            if (_infants > v) _infants = v;
          }),
        ),
        _Stepper(
          name: 'Children',
          label: l.cardFlightSearchChildren,
          value: _children,
          min: 0,
          max: 8,
          onChanged: (v) => setState(() => _children = v),
        ),
        _Stepper(
          name: 'Infants',
          label: l.cardFlightSearchInfants,
          value: _infants,
          min: 0,
          max: _adults.clamp(0, 4),
          onChanged: (v) => setState(() => _infants = v),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (final c in _cabins)
              ChoiceChip(
                key: Key('flightSearchCabin-$c'),
                label: Text(fareCabin(context, c)),
                selected: _cabin == c,
                onSelected: (_) => setState(() => _cabin = c),
                visualDensity: VisualDensity.compact,
              ),
          ],
        ),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Sent once: the fields stay as they were sent, and can't be sent again.
        IgnorePointer(
          ignoring: _sent,
          child: Opacity(opacity: _sent ? 0.6 : 1, child: form),
        ),
        const SizedBox(height: 12),
        // The two buttons side by side, or one under the other on a narrow card.
        Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          runSpacing: 4,
          children: [
            if (widget.canSkip && !_sent)
              TextButton(
                key: const Key('flightSearchSkip'),
                onPressed: _skip,
                child: Text(l.cardFlightSearchNotNow),
              ),
            FilledButton.icon(
              key: const Key('flightSearchGo'),
              onPressed: _valid && !_sent ? _search : null,
              icon: const Icon(LucideIcons.search, size: 16),
              label: Text(
                _sent ? l.cardFlightSearchSent : l.cardFlightSearchTitle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// A place field that looks airports up as the person types (the server's own list).
class _PlaceField extends ConsumerStatefulWidget {
  const _PlaceField({
    required this.fieldKey,
    required this.controller,
    required this.label,
    required this.onTyped,
    required this.onPicked,
  });
  final Key fieldKey;
  final TextEditingController controller;
  final String label;

  /// The words changed: what was picked before no longer stands.
  final VoidCallback onTyped;

  /// A choice was tapped: the value to send (a city's name, or one airport's code).
  final ValueChanged<String> onPicked;

  @override
  ConsumerState<_PlaceField> createState() => _PlaceFieldState();
}

class _PlaceFieldState extends ConsumerState<_PlaceField> {
  final _focus = FocusNode();
  Timer? _timer;
  List<Map<String, Object?>> _hits = const [];

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocus);
  }

  void _onFocus() {
    // Leaving the field puts the choices away; a tap on one lands first.
    if (!_focus.hasFocus && mounted) setState(() => _hits = const []);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _focus
      ..removeListener(_onFocus)
      ..dispose();
    super.dispose();
  }

  void _typed(String text) {
    widget.onTyped();
    _timer?.cancel();
    final q = text.trim();
    if (q.length < 2) {
      setState(() => _hits = const []);
      return;
    }
    _timer = Timer(const Duration(milliseconds: 250), () async {
      try {
        final hits = await ref.read(backendProvider).searchAirports(q);
        // Only for what is still in the field.
        if (!mounted || widget.controller.text.trim() != q) return;
        setState(() => _hits = hits.take(5).toList());
      } catch (_) {
        // An older server has no lookup: the words go to the search as typed.
      }
    });
  }

  void _pick(Map<String, Object?> hit) {
    final label = '${hit['label'] ?? ''}';
    final codes = [
      if (hit['codes'] case final List c)
        for (final x in c)
          if (x is String) x,
    ];
    widget.controller.text = label;
    widget.onPicked(
      hit['kind'] == 'airport' && codes.isNotEmpty ? codes.first : label,
    );
    setState(() => _hits = const []);
    _focus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final muted = context.colorScheme.onSurfaceVariant;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          key: widget.fieldKey,
          controller: widget.controller,
          focusNode: _focus,
          onChanged: _typed,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: context.l10n.cardFlightSearchPlaceHint,
            isDense: true,
            border: const OutlineInputBorder(),
          ),
        ),
        for (final hit in _hits)
          InkWell(
            key: Key('flightSearchHit-${(hit['codes'] as List?)?.join('+')}'),
            onTap: () => _pick(hit),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    hit['kind'] == 'city'
                        ? LucideIcons.mapPin
                        : LucideIcons.plane,
                    size: 14,
                    color: muted,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      [
                        '${hit['label'] ?? ''}',
                        if (hit['name'] case final String name) name,
                      ].join(' · '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    [
                      if (hit['kind'] == 'city')
                        (hit['codes'] as List?)?.join(', ') ?? '',
                      '${hit['country'] ?? ''}',
                    ].where((x) => x.isNotEmpty).join(' · '),
                    style: context.textTheme.labelSmall?.copyWith(color: muted),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({
    required this.name,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  /// For the buttons' keys: "Adults" gives flightSearchAdultsPlus.
  final String name;
  final String label;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: Text(label, style: context.textTheme.bodyMedium)),
      IconButton(
        key: Key('flightSearch${name}Minus'),
        onPressed: value > min ? () => onChanged(value - 1) : null,
        tooltip: context.l10n.cardStaysFewer(label),
        icon: const Icon(LucideIcons.minus, size: 16),
        visualDensity: VisualDensity.compact,
      ),
      SizedBox(
        width: 24,
        child: Text(
          '$value',
          key: Key('flightSearch${name}Value'),
          textAlign: TextAlign.center,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      IconButton(
        key: Key('flightSearch${name}Plus'),
        onPressed: value < max ? () => onChanged(value + 1) : null,
        tooltip: context.l10n.cardStaysMore(label),
        icon: const Icon(LucideIcons.plus, size: 16),
        visualDensity: VisualDensity.compact,
      ),
    ],
  );
}
