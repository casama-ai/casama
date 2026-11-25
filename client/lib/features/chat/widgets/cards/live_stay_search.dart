import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/providers.dart';
import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import 'live_kit.dart';
import 'stay_kit.dart';

// The stay search form (docs/STAYS-AND-SHOPPING-PLAN.md §4.4): where, dates, guests, rooms, a
// budget a night and amenities. A bot shows it when the place or the dates are missing; the stay
// cards open it as a sheet for Edit and Pick dates. Search stays sends "stays.search" with the
// fields as `live.stays` takes them.

final staySearchComponent = liveCard(
  'StaySearch',
  const [
    'title',
    'where',
    'checkIn',
    'checkOut',
    'adults',
    'rooms',
    'budget',
    'amenities',
  ],
  (context, p, ctl) => LiveLayout(
    header: LiveHeader(
      icon: LucideIcons.bedDouble,
      iconColor: stayTeal,
      title: p.s('title') ?? context.l10n.cardStaysSearchTitle,
    ),
    body: StaySearchForm(initial: p, act: ctl.act, canSkip: true),
    footer: null,
  ),
);

/// The form in a sheet, filled in from [initial] (`where`, `checkIn`, `checkOut`, `adults`,
/// `rooms`, `budget`, `amenities`, and `currency` for the budget field). Searching closes the
/// sheet and sends "stays.open" through [act]: the same search, but the card the sheet came from
/// stays usable (keepOpenUiEvents), where the form card's own "stays.search" uses it up.
Future<void> showStaySearchSheet(
  BuildContext context, {
  required P initial,
  required CardAct act,
}) => showCardSheet<void>(
  context,
  builder: (sheet) => CardSheet(
    title: sheet.l10n.cardStaysSearchTitle,
    child: StaySearchForm(
      initial: initial,
      act: closingAct(sheet, (event, values, label) => act(event == 'stays.search' ? 'stays.open' : event, values, label))!,
    ),
  ),
);

/// The amenities `live.stays` knows, in the order the form shows them.
const stayAmenityIds = [
  'free_cancellation',
  'breakfast',
  'pool',
  'parking',
  'pets',
  'gym',
  'spa',
  'kitchen',
  'wifi',
  'air_conditioning',
];

String stayAmenityLabel(BuildContext context, String id) {
  final l = context.l10n;
  return switch (id) {
    'free_cancellation' => l.cardStaysFilterFreeCancel,
    'breakfast' => l.cardStaysFilterBreakfast,
    'pool' => l.cardStaysAmenityPool,
    'parking' => l.cardStaysAmenityParking,
    'pets' => l.cardStaysAmenityPets,
    'gym' => l.cardStaysAmenityGym,
    'spa' => l.cardStaysAmenitySpa,
    'kitchen' => l.cardStaysAmenityKitchen,
    'wifi' => l.cardStaysAmenityWifi,
    'air_conditioning' => l.cardStaysAmenityAirCon,
    _ => id,
  };
}

/// The longest stay `live.stays` takes.
const _maxNights = 30;

class StaySearchForm extends ConsumerStatefulWidget {
  const StaySearchForm({
    super.key,
    required this.initial,
    required this.act,
    this.canSkip = false,
  });

  /// What is already known, as the StaySearch card names it.
  final P initial;
  final CardAct act;

  /// Shows "Not now" (the card in a chat; a sheet is closed instead).
  final bool canSkip;

  @override
  ConsumerState<StaySearchForm> createState() => _StaySearchFormState();
}

class _StaySearchFormState extends ConsumerState<StaySearchForm> {
  final _where = TextEditingController();
  final _budget = TextEditingController();
  final _focus = FocusNode();
  Timer? _timer;
  List<Map<String, Object?>> _hits = const [];
  DateTime? _in;
  DateTime? _out;
  int _adults = 2;
  int _rooms = 1;
  final _amenities = <String>{};
  bool _sent = false;

  DateTime get _today => DateUtils.dateOnly(DateTime.now());

  @override
  void initState() {
    super.initState();
    final i = widget.initial;
    _where.text = i.s('where') ?? '';
    final budget = i.n('budget');
    if (budget != null && budget > 0) _budget.text = '${budget.round()}';
    // A day that has passed is dropped; a check-out needs a check-in before it.
    final a = cardDay(i.s('checkIn'));
    if (a != null && !a.isBefore(_today)) {
      _in = a;
      final b = cardDay(i.s('checkOut'));
      if (b != null && b.isAfter(a)) _out = b;
    }
    _adults = (i.i('adults') ?? 2).clamp(1, 9);
    _rooms = (i.i('rooms') ?? 1).clamp(1, 8);
    _amenities.addAll(i.texts('amenities').where(stayAmenityIds.contains));
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
    _where.dispose();
    _budget.dispose();
    super.dispose();
  }

  bool get _valid =>
      _where.text.trim().isNotEmpty && _in != null && _out != null;

  void _typed(String text) {
    _timer?.cancel();
    final q = text.trim();
    if (q.length < 2) {
      setState(() => _hits = const []);
      return;
    }
    // Enables or disables Search as the field fills.
    setState(() {});
    _timer = Timer(const Duration(milliseconds: 300), () async {
      try {
        final hits = await ref.read(backendProvider).searchPlaces(q);
        // Only for what is still in the field.
        if (!mounted || _where.text.trim() != q) return;
        setState(() => _hits = hits.take(5).toList());
      } catch (_) {
        // No lookup: the words go to the search as typed.
      }
    });
  }

  void _pick(Map<String, Object?> hit) {
    final name = '${hit['name'] ?? ''}'.trim();
    if (name.isEmpty) return;
    setState(() {
      _where.text = name;
      _hits = const [];
    });
    _focus.unfocus();
  }

  Future<void> _pickDates() async {
    final r = await showDateRangePicker(
      context: context,
      firstDate: _today,
      lastDate: _today.add(const Duration(days: 500)),
      initialDateRange: _in != null && _out != null
          ? DateTimeRange(start: _in!, end: _out!)
          : null,
    );
    if (r == null || !mounted) return;
    final start = DateUtils.dateOnly(r.start);
    var end = DateUtils.dateOnly(r.end);
    // One day picked is one night; a stay is 30 nights at most.
    if (!end.isAfter(start)) end = DateUtils.addDaysToDate(start, 1);
    final last = DateUtils.addDaysToDate(start, _maxNights);
    if (end.isAfter(last)) end = last;
    setState(() {
      _in = start;
      _out = end;
    });
  }

  String _datesText() {
    if (_in == null || _out == null) return '';
    final a = isoDay(_in!), b = isoDay(_out!);
    final nights = nightsBetween(a, b);
    return [
      cardDayRange(context, a, b),
      if (nights != null) context.l10n.cardStaysNights(nights),
    ].join(' · ');
  }

  void _search() {
    if (!_valid || _sent) return;
    final l = context.l10n;
    final where = _where.text.trim();
    final a = isoDay(_in!), b = isoDay(_out!);
    final budget = int.tryParse(_budget.text.trim());
    setState(() => _sent = true);
    widget.act('stays.search', {
      'where': where,
      'check_in': a,
      'check_out': b,
      'adults': _adults,
      'rooms': _rooms,
      if (budget != null && budget > 0) 'budget': budget,
      if (_amenities.isNotEmpty)
        'amenities': [
          for (final id in stayAmenityIds)
            if (_amenities.contains(id)) id,
        ],
    }, l.cardStaysSearchLabel(where, cardDayRange(context, a, b)));
  }

  void _skip() {
    if (_sent) return;
    setState(() => _sent = true);
    widget.act('stays.cancel', const {}, context.l10n.cardStaysSearchNotNow);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final muted = context.colorScheme.onSurfaceVariant;
    final dates = _datesText();
    final form = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          key: const Key('staySearchWhere'),
          controller: _where,
          focusNode: _focus,
          onChanged: _typed,
          textInputAction: TextInputAction.done,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: l.cardStaysSearchWhere,
            hintText: l.cardStaysSearchWhereHint,
            isDense: true,
            border: const OutlineInputBorder(),
          ),
        ),
        for (final (i, hit) in _hits.indexed)
          InkWell(
            key: Key('staySearchHit-$i'),
            onTap: () => _pick(hit),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Row(
                children: [
                  Icon(LucideIcons.mapPin, size: 14, color: muted),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      <String>{
                        for (final k in const [
                          'name',
                          'region',
                          'country_name',
                        ])
                          if (hit[k] case final String v when v.isNotEmpty) v,
                      }.join(', '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton.icon(
            key: const Key('staySearchDates'),
            onPressed: _pickDates,
            icon: const Icon(LucideIcons.calendarDays, size: 16),
            label: Text(
              dates.isEmpty ? l.cardStaysSearchDates : dates,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 4),
        CardStepper(
          name: 'staySearchAdults',
          label: l.cardStaysSearchAdults,
          value: _adults,
          min: 1,
          max: 9,
          onChanged: (v) => setState(() => _adults = v),
        ),
        CardStepper(
          name: 'staySearchRooms',
          label: l.cardStaysSearchRooms,
          value: _rooms,
          min: 1,
          max: 8,
          onChanged: (v) => setState(() => _rooms = v),
        ),
        const SizedBox(height: 6),
        TextField(
          key: const Key('staySearchBudget'),
          controller: _budget,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(9),
          ],
          decoration: InputDecoration(
            labelText: l.cardStaysSearchBudget,
            suffixText: widget.initial.s('currency'),
            isDense: true,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (final id in stayAmenityIds)
              FilterChip(
                key: Key('staySearchAmenity-$id'),
                label: Text(stayAmenityLabel(context, id)),
                selected: _amenities.contains(id),
                onSelected: (v) => setState(
                  () => v ? _amenities.add(id) : _amenities.remove(id),
                ),
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
        Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          runSpacing: 4,
          children: [
            if (widget.canSkip && !_sent)
              TextButton(
                key: const Key('staySearchSkip'),
                onPressed: _skip,
                child: Text(l.cardStaysSearchNotNow),
              ),
            FilledButton.icon(
              key: const Key('staySearchGo'),
              onPressed: _valid && !_sent ? _search : null,
              icon: const Icon(LucideIcons.search, size: 16),
              label: Text(_sent ? l.cardStaysSearchSent : l.cardStaysSearchGo),
            ),
          ],
        ),
      ],
    );
  }
}
