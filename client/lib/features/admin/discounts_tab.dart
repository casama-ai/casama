import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart'
    show
        AdminDiscount,
        AdminDiscountPlan,
        AdminDiscountPlanIntervalEnum,
        AdminDiscountState,
        AdminDiscountsResponse,
        CreateAdminDiscountRequest,
        CreateAdminDiscountRequestWhoEnum,
        UpdateAdminDiscountRequest;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/date_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';

final adminDiscountsProvider = FutureProvider.autoDispose<AdminDiscountsResponse>(
  (r) => r.watch(backendProvider).adminDiscounts(),
);

String _formatPercent(num? percent) {
  if (percent == null) return 'Flat';
  final d = percent.toDouble();
  final whole = d == d.roundToDouble();
  return whole ? '${d.round()}% off' : '${d.toStringAsFixed(1)}% off';
}

String _formatCycles(int? cycles) {
  if (cycles == null) return 'every renewal';
  if (cycles == 1) return 'first month';
  return '$cycles months';
}

String _planTitle(String code, List<AdminDiscountPlan> plans) {
  for (final p in plans) {
    if (p.code == code) {
      return switch (p.interval) {
        AdminDiscountPlanIntervalEnum.year => '${p.name} (Yearly)',
        AdminDiscountPlanIntervalEnum.week => '${p.name} (Weekly)',
        AdminDiscountPlanIntervalEnum.month => p.name,
      };
    }
  }
  if (code == 'other') return 'Other';
  return code.isEmpty ? code : code[0].toUpperCase() + code.substring(1);
}

(String, AdminTone) _stateBadge(AdminDiscountState state) => switch (state) {
  AdminDiscountState.live => ('Live', AdminTone.positive),
  AdminDiscountState.scheduled => ('Scheduled', AdminTone.info),
  AdminDiscountState.usedUp => ('Used Up', AdminTone.warning),
  AdminDiscountState.ended => ('Ended', AdminTone.neutral),
  AdminDiscountState.off => ('Off', AdminTone.neutral),
};

/// Guardrails matching server DISCOUNT-ADMIN-PLAN §4.1.
List<String> largeDiscountReasons({
  required double? percent,
  required int? cycles,
  required int? maxUses,
  required int? perPerson,
  required DateTime? endsAt,
  required List<AdminDiscountPlan> selectedPlans,
  DateTime? now,
}) {
  final at = now ?? DateTime.now();
  final reasons = <String>[];
  if (percent != null && percent > 50) {
    reasons.add('More than 50% off');
  }
  if (cycles == null) {
    reasons.add('Applies to every renewal');
  } else if (cycles > 1) {
    reasons.add('Covers $cycles billing cycles');
  }
  if (maxUses == null) {
    reasons.add('No usage limit');
  } else if (maxUses > 100) {
    reasons.add('More than 100 uses');
  }
  if (perPerson == null) {
    reasons.add('No per-person limit');
  } else if (perPerson > 1) {
    reasons.add('More than 1 use per person');
  }
  if (endsAt == null) {
    reasons.add('No end date');
  } else if (endsAt.isAfter(at.add(const Duration(days: 183)))) {
    reasons.add('Ends more than 6 months from now');
  }
  if (selectedPlans.any(
    (p) => p.interval == AdminDiscountPlanIntervalEnum.year || p.interval == AdminDiscountPlanIntervalEnum.week,
  )) {
    reasons.add('Includes yearly or weekly plans');
  }
  return reasons;
}

/// Parses the leading dollar amount from a `price_label` like `"$15/mo"` → `15.0`.
double? _parsePriceUsd(String? label) {
  if (label == null) return null;
  final m = RegExp(r'\$(\d+(?:\.\d{1,2})?)').firstMatch(label);
  return m == null ? null : double.tryParse(m.group(1)!);
}

String _fmtUsd(double value) {
  final rounded = (value * 100).round() / 100;
  if (rounded == rounded.roundToDouble()) return '\$${rounded.round()}';
  return '\$${rounded.toStringAsFixed(2)}';
}

/// Live preview line: e.g. "Plus $15 → $7.50 for the first month, then $15".
String? discountPreviewLine({
  required double? percent,
  required int? cycles,
  required List<AdminDiscountPlan> selectedPlans,
}) {
  if (percent == null || percent <= 0 || percent > 100 || selectedPlans.isEmpty) return null;
  AdminDiscountPlan? sample;
  for (final p in selectedPlans) {
    if (_parsePriceUsd(p.priceLabel) != null) {
      sample = p;
      break;
    }
  }
  if (sample == null) return null;
  final price = _parsePriceUsd(sample.priceLabel)!;
  final after = (price * (1 - percent / 100)).clamp(0.0, price);
  final beforeText = _fmtUsd(price);
  final afterText = _fmtUsd(after);
  if (cycles == null) {
    return '${sample.name} $beforeText → $afterText on every renewal';
  }
  if (cycles == 1) {
    final unit = switch (sample.interval) {
      AdminDiscountPlanIntervalEnum.year => 'first year',
      AdminDiscountPlanIntervalEnum.week => 'first week',
      AdminDiscountPlanIntervalEnum.month => 'first month',
    };
    return '${sample.name} $beforeText → $afterText for the $unit, then $beforeText';
  }
  final unit = switch (sample.interval) {
    AdminDiscountPlanIntervalEnum.year => 'years',
    AdminDiscountPlanIntervalEnum.week => 'weeks',
    AdminDiscountPlanIntervalEnum.month => 'months',
  };
  return '${sample.name} $beforeText → $afterText for the first $cycles $unit, then $beforeText';
}

String discountPostLine(AdminDiscount d) {
  final pct = _formatPercent(d.percent).toLowerCase();
  final duration = switch (d.cycles) {
    null => 'every renewal',
    1 => 'your first month',
    final n => 'your first $n months',
  };
  return 'Use ${d.code} at checkout on casama.ai for $pct $duration';
}

DateTime _defaultLaunchEnd([DateTime? now]) {
  final at = now ?? DateTime.now();
  final jan31 = DateTime(2027, 1, 31);
  if (jan31.isAfter(at)) return jan31;
  return DateTime(at.year, at.month, at.day).add(const Duration(days: 60));
}

/// Admin console > Discount Codes (docs/DISCOUNT-ADMIN-PLAN.md): list, make, edit, turn off/on,
/// and delete unused Dodo discount codes.
class DiscountsTab extends ConsumerStatefulWidget {
  const DiscountsTab({super.key});

  @override
  ConsumerState<DiscountsTab> createState() => _DiscountsTabState();
}

class _DiscountsTabState extends ConsumerState<DiscountsTab> {
  var _liveOnly = true;

  Future<void> _refresh() async {
    ref.invalidate(adminDiscountsProvider);
    try {
      await ref.read(adminDiscountsProvider.future);
    } catch (_) {
      // The page shows the error.
    }
  }

  Future<void> _copy(String text, {String message = 'Copied to clipboard'}) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
    } catch (_) {
      return;
    }
    if (mounted) showSuccess(context, message);
  }

  Future<void> _newDiscount(List<AdminDiscountPlan> plans) async {
    final request = await showAdaptiveSheet<CreateAdminDiscountRequest>(
      context: context,
      builder: (_) => _NewDiscountSheet(plans: plans),
    );
    if (request == null || !mounted) return;
    final made = await runGuarded(context, () => ref.read(backendProvider).adminCreateDiscount(request));
    if (made == null || !mounted) return;
    ref.invalidate(adminDiscountsProvider);
    await showAdaptiveSheet<void>(
      context: context,
      builder: (_) => _MadeDiscountSheet(discount: made),
    );
  }

  Future<void> _edit(AdminDiscount d, List<AdminDiscountPlan> plans) async {
    final request = await showAdaptiveSheet<UpdateAdminDiscountRequest>(
      context: context,
      builder: (_) => _EditDiscountSheet(discount: d, plans: plans),
    );
    if (request == null || !mounted) return;
    final done = await runGuarded(context, () => ref.read(backendProvider).adminUpdateDiscount(d.id, request));
    if (done == null || !mounted) return;
    showSuccess(context, 'Updated ${d.code}');
    ref.invalidate(adminDiscountsProvider);
  }

  Future<void> _toggle(AdminDiscount d) async {
    final turningOn = d.state == AdminDiscountState.off;
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).adminUpdateDiscount(d.id, UpdateAdminDiscountRequest(off: !turningOn)),
    );
    if (done == null || !mounted) return;
    showSuccess(context, turningOn ? 'Turned ${d.code} on' : 'Turned ${d.code} off');
    ref.invalidate(adminDiscountsProvider);
  }

  Future<void> _delete(AdminDiscount d) async {
    final ok = await showConfirm(
      context: context,
      title: 'Delete ${d.code}?',
      message: 'This removes the code from Dodo and cannot be undone.',
      confirmLabel: 'Delete',
      destructive: true,
      confirmKey: const Key('discountDeleteConfirm'),
    );
    if (!ok || !mounted) return;
    final okDel = await runGuarded(context, () async {
      await ref.read(backendProvider).adminDeleteDiscount(d.id);
      return true;
    });
    if (okDel == null || !mounted) return;
    showSuccess(context, 'Deleted ${d.code}');
    ref.invalidate(adminDiscountsProvider);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncView<AdminDiscountsResponse>(
      value: ref.watch(adminDiscountsProvider),
      onRetry: () => ref.invalidate(adminDiscountsProvider),
      loading: const SkeletonPage(
        maxWidth: kAdminContentMaxWidth,
        children: [
          SkeletonCard(height: 72),
          SkeletonSectionHeader(),
          SkeletonCard(height: 140),
          SkeletonCard(height: 140),
        ],
      ),
      data: _content,
    );
  }

  Widget _content(AdminDiscountsResponse data) {
    final all = data.discounts;
    final liveCount = all.where((d) => d.state == AdminDiscountState.live).length;
    final totalUses = all.fold<int>(0, (n, d) => n + d.used);
    final visible = _liveOnly
        ? all.where((d) => d.state == AdminDiscountState.live || d.state == AdminDiscountState.scheduled).toList()
        : all;

    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(
          section: AdminSection.discounts,
          actions: [
            FilledButton.icon(
              key: const Key('discountNew'),
              onPressed: data.plans.isNotEmpty ? () => _newDiscount(data.plans) : null,
              icon: const Icon(LucideIcons.plus, size: 16),
              label: const Text('New Discount Code'),
            ),
          ],
          onRefresh: _refresh,
        ),
        AdminStatStrip(
          maxColumns: 3,
          stats: [
            AdminStat(
              key: const Key('discountStatLive'),
              label: 'Live codes',
              value: '$liveCount',
              icon: LucideIcons.percent,
            ),
            AdminStat(
              key: const Key('discountStatUses'),
              label: 'Total uses',
              value: '$totalUses',
              icon: LucideIcons.ticketCheck,
            ),
            AdminStat(
              key: const Key('discountStatAll'),
              label: 'All codes',
              value: '${all.length}',
              icon: LucideIcons.tag,
            ),
          ],
        ),
        SectionHeader(title: 'Codes', count: '${visible.length}'),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpace.sm),
          child: AdminFilterChips<bool>(
            values: const [true, false],
            labels: const {true: 'Live', false: 'All'},
            selected: _liveOnly,
            onSelected: (v) => setState(() => _liveOnly = v),
          ),
        ),
        if (visible.isEmpty)
          AdminEmptyCard(
            key: const Key('discountNone'),
            icon: LucideIcons.percent,
            message: _liveOnly ? 'No live discount codes right now.' : 'No discount codes yet. Make one to get started.',
          )
        else
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 640 ? 2 : 1;
              final width = (constraints.maxWidth - (columns - 1) * AppSpace.sm) / columns;
              return Wrap(
                spacing: AppSpace.sm,
                runSpacing: AppSpace.sm,
                children: [
                  for (final d in visible)
                    SizedBox(
                      width: width,
                      child: _DiscountCard(
                        discount: d,
                        plans: data.plans,
                        onCopy: () => _copy(d.code, message: 'Copied ${d.code}'),
                        onEdit: () => _edit(d, data.plans),
                        onToggle: () => _toggle(d),
                        onDelete: d.used == 0 ? () => _delete(d) : null,
                      ),
                    ),
                ],
              );
            },
          ),
      ],
    );
  }
}

class _DiscountCard extends StatelessWidget {
  const _DiscountCard({
    required this.discount,
    required this.plans,
    required this.onCopy,
    required this.onEdit,
    required this.onToggle,
    this.onDelete,
  });

  final AdminDiscount discount;
  final List<AdminDiscountPlan> plans;
  final VoidCallback onCopy;
  final VoidCallback onEdit;
  final VoidCallback onToggle;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final d = discount;
    final (status, tone) = _stateBadge(d.state);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    final planNames = d.plans.isEmpty ? 'All plans' : d.plans.map((c) => _planTitle(c, plans)).join(', ');
    final summary = '${_formatPercent(d.percent)} · ${_formatCycles(d.cycles)} · $planNames';
    final endText = d.endsAt == null ? 'No end date' : 'Ends ${d.endsAt!.toLocal().formattedDate(context)}';
    final usesText = d.maxUses == null ? '${d.used} used' : '${d.used} of ${d.maxUses} used';
    final isOff = d.state == AdminDiscountState.off;
    final canToggle = d.state == AdminDiscountState.live || d.state == AdminDiscountState.scheduled || isOff;

    return AppCard(
      key: Key('discountCard-${d.id}'),
      padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.md, AppSpace.sm, AppSpace.xs),
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
                    SelectableText(
                      d.code,
                      style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 0.6),
                    ),
                    const SizedBox(height: 2),
                    Text(summary, style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              AdminStatusPill(status, tone: tone),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          AdminMeter(
            fraction: d.maxUses != null && d.maxUses! > 0 ? (d.used / d.maxUses!).clamp(0.0, 1.0) : null,
            tone: isOff ? AdminTone.neutral : null,
            start: usesText,
            end: endText,
          ),
          if ((d.channel?.isNotEmpty ?? false) || (d.note?.isNotEmpty ?? false) || !d.madeInCasama || d.madeBy != null) ...[
            const SizedBox(height: AppSpace.xs),
            Wrap(
              spacing: AppSpace.xs,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (!d.madeInCasama) const AdminStatusPill('Made in Dodo', tone: AdminTone.neutral),
                if (d.channel?.isNotEmpty ?? false) Text(d.channel!, style: muted),
                if (d.note?.isNotEmpty ?? false) Text('“${d.note!}”', style: muted?.copyWith(fontStyle: FontStyle.italic)),
                if (d.madeBy != null) Text('by ${d.madeBy!}', style: muted),
              ],
            ),
          ],
          const SizedBox(height: AppSpace.xs),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: AppSpace.xs,
            children: [
              TextButton.icon(
                key: Key('discountCopy-${d.id}'),
                onPressed: onCopy,
                icon: const Icon(LucideIcons.copy, size: 14),
                label: const Text('Copy'),
              ),
              TextButton(
                key: Key('discountEdit-${d.id}'),
                onPressed: onEdit,
                child: const Text('Edit'),
              ),
              if (canToggle)
                TextButton(
                  key: Key('discountToggle-${d.id}'),
                  onPressed: onToggle,
                  child: Text(isOff ? 'Turn On' : 'Turn Off'),
                ),
              if (onDelete != null)
                TextButton(
                  key: Key('discountDelete-${d.id}'),
                  onPressed: onDelete,
                  style: TextButton.styleFrom(foregroundColor: context.colorScheme.error),
                  child: const Text('Delete'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _CyclesMode { firstMonth, multipleMonths, everyRenewal }

class _NewDiscountSheet extends StatefulWidget {
  const _NewDiscountSheet({required this.plans});
  final List<AdminDiscountPlan> plans;

  @override
  State<_NewDiscountSheet> createState() => _NewDiscountSheetState();
}

class _NewDiscountSheetState extends State<_NewDiscountSheet> {
  final _code = TextEditingController();
  final _channel = TextEditingController();
  final _note = TextEditingController();
  final _percent = TextEditingController(text: '50');
  final _cyclesCount = TextEditingController(text: '3');
  final _maxUses = TextEditingController(text: '100');
  final _perPerson = TextEditingController(text: '1');

  _CyclesMode _cyclesMode = _CyclesMode.firstMonth;
  CreateAdminDiscountRequestWhoEnum _who = CreateAdminDiscountRequestWhoEnum.any;
  late final Set<String> _selectedPlans = {
    for (final p in widget.plans)
      if (p.interval == AdminDiscountPlanIntervalEnum.month && (p.code == 'plus' || p.code == 'pro' || p.code == 'max'))
        p.code,
  };
  DateTime? _startsAt;
  late DateTime? _endsAt = _defaultLaunchEnd();

  @override
  void initState() {
    super.initState();
    if (_selectedPlans.isEmpty) {
      for (final p in widget.plans) {
        if (p.interval == AdminDiscountPlanIntervalEnum.month) _selectedPlans.add(p.code);
      }
    }
    if (_selectedPlans.isEmpty && widget.plans.isNotEmpty) {
      _selectedPlans.add(widget.plans.first.code);
    }
  }

  @override
  void dispose() {
    _code.dispose();
    _channel.dispose();
    _note.dispose();
    _percent.dispose();
    _cyclesCount.dispose();
    _maxUses.dispose();
    _perPerson.dispose();
    super.dispose();
  }

  double? get _parsedPercent => double.tryParse(_percent.text.trim());
  int? get _parsedCycles => switch (_cyclesMode) {
    _CyclesMode.firstMonth => 1,
    _CyclesMode.multipleMonths => int.tryParse(_cyclesCount.text.trim()),
    _CyclesMode.everyRenewal => null,
  };
  int? get _parsedMaxUses => _maxUses.text.trim().isEmpty ? null : int.tryParse(_maxUses.text.trim());
  int? get _parsedPerPerson => _perPerson.text.trim().isEmpty ? null : int.tryParse(_perPerson.text.trim());
  List<AdminDiscountPlan> get _chosenPlans => widget.plans.where((p) => _selectedPlans.contains(p.code)).toList();

  bool get _isForeverFree => (_parsedPercent ?? 0) >= 100 && _cyclesMode == _CyclesMode.everyRenewal;

  List<String> get _largeReasons => largeDiscountReasons(
    percent: _parsedPercent,
    cycles: _parsedCycles,
    maxUses: _parsedMaxUses,
    perPerson: _parsedPerPerson,
    endsAt: _endsAt,
    selectedPlans: _chosenPlans,
  );

  Future<void> _pickEnd() async {
    final now = DateTime.now();
    final day = await showDatePicker(
      context: context,
      initialDate: _endsAt ?? _defaultLaunchEnd(now),
      firstDate: now,
      lastDate: now.add(const Duration(days: 1095)),
    );
    if (day != null && mounted) setState(() => _endsAt = day);
  }

  Future<void> _pickStart() async {
    final now = DateTime.now();
    final day = await showDatePicker(
      context: context,
      initialDate: _startsAt ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 730)),
    );
    if (day != null && mounted) setState(() => _startsAt = day);
  }

  void _submit() {
    final code = _code.text.trim().toUpperCase();
    if (!RegExp(r'^[A-Z0-9-]{3,16}$').hasMatch(code)) {
      showWarning(context, 'Code must be 3–16 letters, digits, or hyphens.');
      return;
    }
    final percent = _parsedPercent;
    if (percent == null || percent < 1 || percent > 100) {
      showWarning(context, 'Percent off must be between 1 and 100.');
      return;
    }
    if (_isForeverFree) {
      showWarning(context, "100% off for every renewal isn't allowed. Use a gift code in Free Plans instead.");
      return;
    }
    if (_cyclesMode == _CyclesMode.multipleMonths) {
      final c = _parsedCycles;
      if (c == null || c < 1 || c > 36) {
        showWarning(context, 'Cycles must be between 1 and 36.');
        return;
      }
    }
    if (_selectedPlans.isEmpty) {
      showWarning(context, 'Pick at least one plan.');
      return;
    }
    if (_maxUses.text.trim().isNotEmpty && (_parsedMaxUses == null || _parsedMaxUses! < 1 || _parsedMaxUses! > 100000)) {
      showWarning(context, 'Uses must be between 1 and 100,000, or left blank.');
      return;
    }
    if (_perPerson.text.trim().isNotEmpty && (_parsedPerPerson == null || _parsedPerPerson! < 1 || _parsedPerPerson! > 100)) {
      showWarning(context, 'Per person must be between 1 and 100, or left blank.');
      return;
    }

    final reasons = _largeReasons;
    final channel = _channel.text.trim();
    final note = _note.text.trim();
    Navigator.pop(
      context,
      CreateAdminDiscountRequest(
        code: code,
        percent: percent,
        plans: _selectedPlans.toList(),
        cycles: _parsedCycles,
        maxUses: _parsedMaxUses,
        perPerson: _parsedPerPerson,
        startsAt: _startsAt?.toUtc(),
        endsAt: _endsAt?.add(const Duration(days: 1)).subtract(const Duration(seconds: 1)).toUtc(),
        who: _who,
        channel: channel.isEmpty ? null : channel,
        note: note.isEmpty ? null : note,
        confirmLarge: reasons.isNotEmpty,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reasons = _largeReasons;
    final preview = discountPreviewLine(percent: _parsedPercent, cycles: _parsedCycles, selectedPlans: _chosenPlans);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);

    return FormSheet(
      icon: LucideIcons.percent,
      title: 'New Discount Code',
      submitLabel: reasons.isNotEmpty ? 'Make Large Discount' : 'Make Code',
      submitKey: const Key('discountCreateSubmit'),
      onSubmit: _isForeverFree ? null : _submit,
      children: [
        TextField(
          key: const Key('discountCode'),
          controller: _code,
          autofocus: true,
          autocorrect: false,
          textCapitalization: TextCapitalization.characters,
          maxLength: 16,
          decoration: const InputDecoration(
            labelText: 'Code',
            hintText: 'CASAMA-MAYA',
            helperText: '3–16 letters, digits, or hyphens',
          ),
          onChanged: (_) => setState(() {}),
        ),
        Row(
          spacing: AppSpace.sm,
          children: [
            Expanded(
              child: TextField(
                key: const Key('discountChannel'),
                controller: _channel,
                maxLength: 120,
                decoration: const InputDecoration(labelText: 'Channel', hintText: "Maya's newsletter", counterText: ''),
              ),
            ),
            Expanded(
              child: TextField(
                key: const Key('discountNote'),
                controller: _note,
                maxLength: 200,
                decoration: const InputDecoration(labelText: 'Note', hintText: 'Optional', counterText: ''),
              ),
            ),
          ],
        ),
        Row(
          spacing: AppSpace.sm,
          children: [
            Expanded(
              child: TextField(
                key: const Key('discountPercent'),
                controller: _percent,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Percent off', suffixText: '%'),
                onChanged: (_) => setState(() {}),
              ),
            ),
            Expanded(
              flex: 2,
              child: DropdownButtonFormField<_CyclesMode>(
                key: const Key('discountCyclesMode'),
                isExpanded: true,
                initialValue: _cyclesMode,
                decoration: const InputDecoration(labelText: 'For'),
                items: const [
                  DropdownMenuItem(value: _CyclesMode.firstMonth, child: Text('First month (1 cycle)')),
                  DropdownMenuItem(value: _CyclesMode.multipleMonths, child: Text('Multiple months')),
                  DropdownMenuItem(value: _CyclesMode.everyRenewal, child: Text('Every renewal')),
                ],
                onChanged: (v) {
                  if (v != null) setState(() => _cyclesMode = v);
                },
              ),
            ),
          ],
        ),
        if (_cyclesMode == _CyclesMode.multipleMonths)
          TextField(
            key: const Key('discountCyclesCount'),
            controller: _cyclesCount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Number of months', helperText: '1 to 36'),
            onChanged: (_) => setState(() {}),
          ),
        if (preview != null)
          AppCard(
            key: const Key('discountPreviewLine'),
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.xs),
            child: Text(preview, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plans', style: context.textTheme.labelLarge),
            const SizedBox(height: 4),
            Wrap(
              spacing: AppSpace.xs,
              runSpacing: AppSpace.xs,
              children: [
                for (final p in widget.plans)
                  FilterChip(
                    key: Key('discountPlan-${p.code}'),
                    label: Text(_planTitle(p.code, widget.plans)),
                    selected: _selectedPlans.contains(p.code),
                    onSelected: (on) => setState(() {
                      if (on) {
                        _selectedPlans.add(p.code);
                      } else {
                        _selectedPlans.remove(p.code);
                      }
                    }),
                  ),
              ],
            ),
          ],
        ),
        Row(
          spacing: AppSpace.sm,
          children: [
            Expanded(
              child: TextField(
                key: const Key('discountMaxUses'),
                controller: _maxUses,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Uses', hintText: 'Unlimited'),
                onChanged: (_) => setState(() {}),
              ),
            ),
            Expanded(
              child: TextField(
                key: const Key('discountPerPerson'),
                controller: _perPerson,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Per person', hintText: 'Unlimited'),
                onChanged: (_) => setState(() {}),
              ),
            ),
          ],
        ),
        DropdownButtonFormField<CreateAdminDiscountRequestWhoEnum>(
          key: const Key('discountWho'),
          isExpanded: true,
          initialValue: _who,
          decoration: const InputDecoration(labelText: 'Who can use it'),
          items: const [
            DropdownMenuItem(value: CreateAdminDiscountRequestWhoEnum.any, child: Text('Anyone')),
            DropdownMenuItem(
              value: CreateAdminDiscountRequestWhoEnum.firstTime,
              child: Text('First-time customers only'),
            ),
          ],
          onChanged: (v) {
            if (v != null) setState(() => _who = v);
          },
        ),
        GroupedCard(
          children: [
            GroupedTile(
              key: const Key('discountStarts'),
              icon: LucideIcons.calendar,
              title: 'Starts',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_startsAt == null ? 'Now' : _startsAt!.formattedDate(context)),
                  if (_startsAt != null)
                    IconButton(
                      icon: const Icon(LucideIcons.x, size: 16),
                      onPressed: () => setState(() => _startsAt = null),
                    ),
                ],
              ),
              onTap: _pickStart,
            ),
            GroupedTile(
              key: const Key('discountEnds'),
              icon: LucideIcons.calendarX,
              title: 'Ends',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_endsAt == null ? 'No end date' : _endsAt!.formattedDate(context)),
                  if (_endsAt != null)
                    IconButton(
                      key: const Key('discountClearEnd'),
                      icon: const Icon(LucideIcons.x, size: 16),
                      onPressed: () => setState(() => _endsAt = null),
                    ),
                ],
              ),
              onTap: _pickEnd,
            ),
          ],
        ),
        if (_isForeverFree)
          _WarningBanner(
            bannerKey: const Key('discountForeverFreeError'),
            color: context.colorScheme.error,
            title: "100% off for every renewal isn't allowed",
            lines: const ['Use a gift code in Free Plans instead so it ends automatically.'],
          )
        else if (reasons.isNotEmpty)
          _WarningBanner(
            bannerKey: const Key('discountLargeWarning'),
            color: context.appColors.warning,
            title: 'Beyond the launch deal',
            lines: reasons,
          ),
        Text(
          "Works at web checkout only (casama.ai, app.casama.ai, desktop). Don't mention codes inside the App Store or Google Play apps.",
          style: muted,
        ),
      ],
    );
  }
}

class _WarningBanner extends StatelessWidget {
  const _WarningBanner({
    required this.bannerKey,
    required this.color,
    required this.title,
    required this.lines,
  });

  final Key bannerKey;
  final Color color;
  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: bannerKey,
      padding: const EdgeInsets.all(AppSpace.sm),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.triangleAlert, size: 16, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Text(title, style: context.textTheme.labelLarge?.copyWith(color: color)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          for (final line in lines)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text('• $line', style: context.textTheme.bodySmall),
            ),
        ],
      ),
    );
  }
}

class _MadeDiscountSheet extends StatelessWidget {
  const _MadeDiscountSheet({required this.discount});
  final AdminDiscount discount;

  Future<void> _copy(BuildContext context, String text, String label) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
    } catch (_) {
      return;
    }
    if (context.mounted) showSuccess(context, label);
  }

  @override
  Widget build(BuildContext context) {
    final postLine = discountPostLine(discount);
    return FormSheet(
      icon: LucideIcons.circleCheck,
      title: 'Discount Code Ready',
      subtitle: 'Live in Dodo now for web checkout.',
      submitLabel: 'Done',
      submitKey: const Key('discountMadeDone'),
      showCancel: false,
      onSubmit: () => Navigator.pop(context),
      children: [
        AppCard(
          padding: const EdgeInsets.all(AppSpace.md),
          child: Column(
            children: [
              SelectableText(
                discount.code,
                key: const Key('discountMadeCode'),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 1.2),
              ),
              const SizedBox(height: 6),
              Text(
                postLine,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: AppSpace.sm,
          runSpacing: AppSpace.xs,
          children: [
            OutlinedButton.icon(
              key: const Key('discountMadeCopyCode'),
              onPressed: () => _copy(context, discount.code, 'Copied code'),
              icon: const Icon(LucideIcons.copy, size: 16),
              label: const Text('Copy Code'),
            ),
            OutlinedButton.icon(
              key: const Key('discountMadeCopyPost'),
              onPressed: () => _copy(context, postLine, 'Copied post line'),
              icon: const Icon(LucideIcons.messageSquare, size: 16),
              label: const Text('Copy Post Line'),
            ),
          ],
        ),
      ],
    );
  }
}

class _EditDiscountSheet extends StatefulWidget {
  const _EditDiscountSheet({required this.discount, required this.plans});
  final AdminDiscount discount;
  final List<AdminDiscountPlan> plans;

  @override
  State<_EditDiscountSheet> createState() => _EditDiscountSheetState();
}

class _EditDiscountSheetState extends State<_EditDiscountSheet> {
  late final _maxUses = TextEditingController(text: widget.discount.maxUses?.toString() ?? '');
  late final _perPerson = TextEditingController(text: widget.discount.perPerson?.toString() ?? '');
  late final _channel = TextEditingController(text: widget.discount.channel ?? '');
  late final _note = TextEditingController(text: widget.discount.note ?? '');
  late final Set<String> _selectedPlans = {
    for (final c in widget.discount.plans)
      if (widget.plans.any((p) => p.code == c)) c,
  };
  late DateTime? _endsAt = widget.discount.endsAt?.toLocal();

  @override
  void dispose() {
    _maxUses.dispose();
    _perPerson.dispose();
    _channel.dispose();
    _note.dispose();
    super.dispose();
  }

  int? get _parsedMaxUses => _maxUses.text.trim().isEmpty ? null : int.tryParse(_maxUses.text.trim());
  int? get _parsedPerPerson => _perPerson.text.trim().isEmpty ? null : int.tryParse(_perPerson.text.trim());
  List<AdminDiscountPlan> get _chosenPlans => widget.plans.where((p) => _selectedPlans.contains(p.code)).toList();

  List<String> get _largeReasons => largeDiscountReasons(
    percent: widget.discount.percent?.toDouble(),
    cycles: widget.discount.cycles,
    maxUses: _parsedMaxUses,
    perPerson: _parsedPerPerson,
    endsAt: _endsAt,
    selectedPlans: _chosenPlans,
  );

  Future<void> _pickEnd() async {
    final now = DateTime.now();
    final day = await showDatePicker(
      context: context,
      initialDate: _endsAt ?? _defaultLaunchEnd(now),
      firstDate: now,
      lastDate: now.add(const Duration(days: 1095)),
    );
    if (day != null && mounted) setState(() => _endsAt = day);
  }

  void _submit() {
    if (_maxUses.text.trim().isNotEmpty && (_parsedMaxUses == null || _parsedMaxUses! < 1 || _parsedMaxUses! > 100000)) {
      showWarning(context, 'Uses must be between 1 and 100,000, or left blank.');
      return;
    }
    if (_perPerson.text.trim().isNotEmpty && (_parsedPerPerson == null || _parsedPerPerson! < 1 || _parsedPerPerson! > 100)) {
      showWarning(context, 'Per person must be between 1 and 100, or left blank.');
      return;
    }
    if (_selectedPlans.isEmpty && widget.plans.isNotEmpty) {
      showWarning(context, 'Pick at least one plan.');
      return;
    }
    final reasons = _largeReasons;
    Navigator.pop(
      context,
      UpdateAdminDiscountRequest(
        maxUses: _parsedMaxUses,
        perPerson: _parsedPerPerson,
        endsAt: _endsAt == null
            ? null
            : DateTime(_endsAt!.year, _endsAt!.month, _endsAt!.day, 23, 59, 59).toUtc(),
        plans: _selectedPlans.isNotEmpty ? _selectedPlans.toList() : null,
        channel: _channel.text.trim(),
        note: _note.text.trim(),
        confirmLarge: reasons.isNotEmpty,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.discount;
    final reasons = _largeReasons;
    return FormSheet(
      icon: LucideIcons.pencil,
      title: 'Edit ${d.code}',
      subtitle: '${_formatPercent(d.percent)} · ${_formatCycles(d.cycles)} (make a new code to change the deal)',
      submitLabel: reasons.isNotEmpty ? 'Save Large Discount' : 'Save',
      submitKey: const Key('discountEditSubmit'),
      onSubmit: _submit,
      children: [
        Row(
          spacing: AppSpace.sm,
          children: [
            Expanded(
              child: TextField(
                key: const Key('discountEditMaxUses'),
                controller: _maxUses,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Uses', hintText: 'Unlimited'),
                onChanged: (_) => setState(() {}),
              ),
            ),
            Expanded(
              child: TextField(
                key: const Key('discountEditPerPerson'),
                controller: _perPerson,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Per person', hintText: 'Unlimited'),
                onChanged: (_) => setState(() {}),
              ),
            ),
          ],
        ),
        TextField(
          key: const Key('discountEditChannel'),
          controller: _channel,
          maxLength: 120,
          decoration: const InputDecoration(labelText: 'Channel', counterText: ''),
        ),
        TextField(
          key: const Key('discountEditNote'),
          controller: _note,
          maxLength: 200,
          decoration: const InputDecoration(labelText: 'Note', counterText: ''),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plans', style: context.textTheme.labelLarge),
            const SizedBox(height: 4),
            Wrap(
              spacing: AppSpace.xs,
              runSpacing: AppSpace.xs,
              children: [
                for (final p in widget.plans)
                  FilterChip(
                    label: Text(_planTitle(p.code, widget.plans)),
                    selected: _selectedPlans.contains(p.code),
                    onSelected: (on) => setState(() {
                      if (on) {
                        _selectedPlans.add(p.code);
                      } else {
                        _selectedPlans.remove(p.code);
                      }
                    }),
                  ),
              ],
            ),
          ],
        ),
        GroupedCard(
          children: [
            GroupedTile(
              icon: LucideIcons.calendarX,
              title: 'Ends',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_endsAt == null ? 'No end date' : _endsAt!.formattedDate(context)),
                  if (_endsAt != null)
                    IconButton(
                      icon: const Icon(LucideIcons.x, size: 16),
                      onPressed: () => setState(() => _endsAt = null),
                    ),
                ],
              ),
              onTap: _pickEnd,
            ),
          ],
        ),
        if (reasons.isNotEmpty)
          _WarningBanner(
            bannerKey: const Key('discountEditLargeWarning'),
            color: context.appColors.warning,
            title: 'Beyond the launch deal',
            lines: reasons,
          ),
      ],
    );
  }
}
