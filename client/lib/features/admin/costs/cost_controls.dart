import 'dart:convert';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/backend.dart' show CostQuery;
import '../../../core/haptics.dart';
import '../../../core/providers.dart';
import '../../../core/share.dart';
import '../../../core/widgets.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../../ui/adaptive_modal.dart';
import '../../../ui/form_sheet.dart';
import '../../../ui/segmented.dart';
import 'cost_format.dart';
import 'cost_view.dart';

String costPeriodLabel(AppLocalizations l10n, CostPeriod p) =>
    p == CostPeriod.custom
    ? l10n.costPeriodCustom
    : l10n.costPeriodDays(p.days);

String _ymd(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// Opens the calendar and narrows the view to the picked days. They are UTC days: the calendar's
/// dates are sent as they read, with no shift to the device's time zone. A year at most.
Future<void> pickCostRange(BuildContext context, WidgetRef ref) async {
  final view = ref.read(costViewProvider);
  final now = DateTime.now().toUtc();
  final today = DateTime(now.year, now.month, now.day);
  DateTime? local(String? day) {
    final d = day == null ? null : costDay(day);
    return d == null ? null : DateTime(d.year, d.month, d.day);
  }

  final from = local(view.from);
  final to = local(view.to);
  final picked = await showDateRangePicker(
    context: context,
    firstDate: DateTime(today.year - 3, today.month, today.day),
    lastDate: today,
    initialDateRange: from != null && to != null && !to.isAfter(today)
        ? DateTimeRange(start: from, end: to)
        : DateTimeRange(
            start: DateUtils.addDaysToDate(today, -(view.query.days - 1)),
            end: today,
          ),
  );
  if (picked == null) return;
  final end = DateUtils.dateOnly(picked.end);
  var start = DateUtils.dateOnly(picked.start);
  final earliest = DateUtils.addDaysToDate(end, -365);
  if (start.isBefore(earliest)) start = earliest;
  ref.read(costViewProvider.notifier).setRange(_ymd(start), _ymd(end));
}

/// 7 days, 30 days, 90 days or a range from the calendar.
class CostPeriodControl extends ConsumerWidget {
  const CostPeriodControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final period = ref.watch(costViewProvider.select((v) => v.period));
    return Semantics(
      container: true,
      label: l10n.costPeriod,
      child: AppSegmentedControl<CostPeriod>(
        key: const Key('costPeriod'),
        values: CostPeriod.values,
        labels: {
          for (final p in CostPeriod.values) p: costPeriodLabel(l10n, p),
        },
        groupValue: period,
        onValueChanged: (p) => p == CostPeriod.custom
            ? pickCostRange(context, ref)
            : ref.read(costViewProvider.notifier).setPeriod(p),
      ),
    );
  }
}

/// Service, Key, Apps & MCP, Feature, Model, Workspace: one sliding control on a wide window,
/// chips that wrap onto a second line on a phone (nothing scrolls sideways).
class CostGroupControl extends ConsumerWidget {
  const CostGroupControl({super.key, required this.wide});
  final bool wide;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final group = ref.watch(costViewProvider.select((v) => v.group));
    void pick(CostGroup g) => ref.read(costViewProvider.notifier).setGroup(g);
    if (wide) {
      return Semantics(
        container: true,
        label: l10n.costGroupBy,
        child: AppSegmentedControl<CostGroup>(
          key: const Key('costGroup'),
          values: CostGroup.values,
          labels: {
            for (final g in CostGroup.values) g: costGroupLabel(l10n, g),
          },
          groupValue: group,
          onValueChanged: pick,
        ),
      );
    }
    return Semantics(
      container: true,
      label: l10n.costGroupBy,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.gutter),
        child: Wrap(
          key: const Key('costGroupChips'),
          spacing: AppSpace.xs,
          runSpacing: AppSpace.xs,
          children: [
            for (final g in CostGroup.values)
              ChoiceChip(
                key: Key('costGroup-${g.value}'),
                avatar: Icon(
                  costGroupIcon(g),
                  size: 16,
                  color: g == group
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurfaceVariant,
                ),
                label: Text(costGroupLabel(l10n, g)),
                selected: g == group,
                showCheckmark: false,
                onSelected: (_) {
                  HapticsHelper.selection();
                  pick(g);
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// What the view is narrowed to, one chip each, with a button that removes it.
class CostFilterChips extends ConsumerWidget {
  const CostFilterChips({super.key, this.emptyHint = true});

  /// Says how to add a filter when there is none (the wide layout has room for it).
  final bool emptyHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final filters = ref.watch(costViewProvider.select((v) => v.filters));
    if (filters.isEmpty) {
      return emptyHint
          ? Text(
              l10n.costNoFilters,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            )
          : const SizedBox.shrink();
    }
    return Wrap(
      spacing: AppSpace.xs,
      runSpacing: AppSpace.xxs,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final e in filters.entries)
          InputChip(
            key: Key('costFilter-${e.key.value}'),
            avatar: Icon(costGroupIcon(e.key), size: 16),
            label: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 220),
              child: Text(
                l10n.costFilterChip(
                  costGroupLabel(l10n, e.key),
                  costRowLabel(l10n, e.value.id, e.value.label),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            visualDensity: VisualDensity.compact,
            deleteIcon: const Icon(LucideIcons.x, size: 16),
            deleteButtonTooltipMessage: l10n.costRemoveFilter(
              costRowLabel(l10n, e.value.id, e.value.label),
            ),
            onDeleted: () =>
                ref.read(costViewProvider.notifier).removeFilter(e.key),
          ),
      ],
    );
  }
}

/// Tests take the file here instead of the platform's share sheet.
@visibleForTesting
Future<void> Function(String name, String csv)? debugCostShare;

/// Fetches the view as CSV and hands it to the share sheet (Save to Files, AirDrop, a mail).
class CostExportButton extends ConsumerStatefulWidget {
  const CostExportButton({
    super.key,
    required this.query,
    this.from,
    this.to,
    this.expand = false,
  });
  final CostQuery query;

  /// The period's days as the server gave them, for the file's name.
  final String? from;
  final String? to;
  final bool expand;

  @override
  ConsumerState<CostExportButton> createState() => _CostExportButtonState();
}

class _CostExportButtonState extends ConsumerState<CostExportButton> {
  var _busy = false;

  Future<void> _export() async {
    setState(() => _busy = true);
    final origin = shareOrigin(context);
    final csv = await runGuarded(
      context,
      () => ref.read(backendProvider).adminCostsCsv(widget.query),
    );
    if (mounted) setState(() => _busy = false);
    if (csv == null) return;
    final days = widget.from != null && widget.to != null
        ? '${widget.from}_${widget.to}'
        : '${widget.query.days}d';
    final name =
        'casama-costs-${widget.query.group.value}-$days${widget.query.filters.isEmpty ? '' : '-filtered'}.csv';
    if (debugCostShare case final share?) return share(name, csv);
    await shareFiles(
      [XFile.fromData(utf8.encode(csv), name: name, mimeType: 'text/csv')],
      names: [name],
      origin: origin,
    );
  }

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton.icon(
      key: const Key('costExport'),
      onPressed: _busy ? null : _export,
      icon: _busy
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(LucideIcons.sheet, size: 18),
      label: Text(context.l10n.exportCsv),
    );
    return widget.expand
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}

/// "Include fixed bills": adds subscriptions and renewals, spread over their periods, to spent.
class CostFixedSwitch extends ConsumerWidget {
  const CostFixedSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final on = ref.watch(costViewProvider.select((v) => v.includeFixed));
    void set(bool v) {
      HapticsHelper.selection();
      ref.read(costViewProvider.notifier).setIncludeFixed(v);
    }

    return MergeSemantics(
      child: Tooltip(
        message: l10n.costIncludeFixedHelp,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.row),
          onTap: () => set(!on),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: AppSpace.xs),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    l10n.costIncludeFixed,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(width: AppSpace.xxs),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    key: const Key('costIncludeFixed'),
                    value: on,
                    onChanged: set,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The phone's one button for the period and the filters, and the sheet behind it.
class CostOptionsButton extends ConsumerWidget {
  const CostOptionsButton({super.key, this.from, this.to});
  final String? from;
  final String? to;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final count = ref.watch(
      costViewProvider.select(
        (v) => v.filters.length + (v.includeFixed ? 1 : 0),
      ),
    );
    return Badge(
      isLabelVisible: count > 0,
      label: Text('$count'),
      child: FilledButton.tonalIcon(
        key: const Key('costOptions'),
        onPressed: () => showAdaptiveSheet<void>(
          context: context,
          builder: (_) => _CostOptionsSheet(from: from, to: to),
        ),
        icon: const Icon(LucideIcons.slidersHorizontal, size: 18),
        label: Text(l10n.costOptions),
      ),
    );
  }
}

class _CostOptionsSheet extends ConsumerWidget {
  const _CostOptionsSheet({this.from, this.to});
  final String? from;
  final String? to;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final view = ref.watch(costViewProvider);
    final label = context.textTheme.labelLarge?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w600,
    );
    return FormSheet(
      icon: LucideIcons.slidersHorizontal,
      title: l10n.costOptions,
      submitLabel: l10n.costDone,
      submitKey: const Key('costOptionsDone'),
      showCancel: false,
      onSubmit: () => Navigator.pop(context),
      children: [
        Text(l10n.costPeriod, style: label),
        const CostPeriodControl(),
        if (view.period == CostPeriod.custom &&
            view.from != null &&
            view.to != null)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton.icon(
              key: const Key('costPickRange'),
              onPressed: () => pickCostRange(context, ref),
              icon: const Icon(LucideIcons.calendarRange, size: 18),
              label: Text(costRange(context, view.from!, view.to!)),
            ),
          ),
        FormNote(l10n.costDaysUtc, icon: LucideIcons.globe),
        Text(l10n.costSort, style: label),
        AppSegmentedControl<CostColumn>(
          key: const Key('costSort'),
          values: const [
            CostColumn.spent,
            CostColumn.change,
            CostColumn.calls,
            CostColumn.name,
          ],
          labels: {
            CostColumn.spent: l10n.costSpent,
            CostColumn.change: l10n.costColChange,
            CostColumn.calls: l10n.costColCalls,
            CostColumn.name: l10n.costSortName,
          },
          groupValue: view.sort,
          onValueChanged: ref.read(costViewProvider.notifier).setSort,
        ),
        Text(l10n.costFilters, style: label),
        const CostFilterChips(),
        FormSwitch(
          title: l10n.costIncludeFixed,
          subtitle: l10n.costIncludeFixedHelp,
          value: view.includeFixed,
          onChanged: ref.read(costViewProvider.notifier).setIncludeFixed,
        ),
        CostExportButton(query: view.query, from: from, to: to, expand: true),
      ],
    );
  }
}
