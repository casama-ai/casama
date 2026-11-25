import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/backend.dart' show CostsNotSupported;
import '../../../core/widgets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../../ui/app_card.dart';
import '../../../ui/form_sheet.dart';
import '../../../ui/page.dart';
import '../admin_nav.dart';
import '../ui/admin_ui.dart';
import 'cost_chart.dart';
import 'cost_colors.dart';
import 'cost_controls.dart';
import 'cost_detail.dart';
import 'cost_format.dart';
import 'cost_skeleton.dart';
import 'cost_table.dart';
import 'cost_tiles.dart';
import 'cost_view.dart';

/// Window width from which a row's detail opens beside the table instead of as a page.
const double kCostPanelMinWidth = 980;
const double _panelWidth = 420;

/// Admin → Costs (docs/COST-BREAKDOWN-PLAN.md §5): what the server paid in a period, the headline
/// first and everything under it explaining that number. Tiles, a daily chart stacked by the
/// grouping, then the table cut by service, key, app, feature, model or workspace. A row opens
/// its detail: a panel beside the table on a wide window, a page on a phone.
class CostsTab extends ConsumerStatefulWidget {
  const CostsTab({super.key});

  @override
  ConsumerState<CostsTab> createState() => _CostsTabState();
}

class _CostsTabState extends ConsumerState<CostsTab> {
  /// The last view that loaded: it stays on screen while the next one is on its way.
  AdminCosts? _last;

  void _refresh() {
    ref.invalidate(adminCostsProvider);
    ref.invalidate(adminCostKeysProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final view = ref.watch(costViewProvider);
    final query = view.query;
    final async = ref.watch(adminCostsProvider(query));
    if (async.value != null) _last = async.value;
    final costs = async.value ?? _last;
    final error = async.hasError && !async.isLoading ? async.error : null;

    if (error is CostsNotSupported) {
      return EmptyState(
        key: const Key('costsOlderServer'),
        icon: LucideIcons.serverCog,
        title: l10n.costOlderServerTitle,
        message: l10n.costOlderServer,
        action: FilledButton.tonalIcon(
          onPressed: _refresh,
          icon: const Icon(LucideIcons.rotateCw, size: 18),
          label: Text(l10n.costCheckAgain),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, box) {
        final canPanel = box.maxWidth >= kCostPanelMinWidth;
        // Rows of the grouping on screen; while another grouping loads they can't be opened.
        final current = costs != null && costs.group == view.group;
        final selected = canPanel && current && view.selectedId != null
            ? costs.rows.where((r) => r.id == view.selectedId).firstOrNull
            : null;
        final mainWidth = box.maxWidth - (selected != null ? _panelWidth : 0);
        final wide = mainWidth >= 720;
        final side = pageSide(mainWidth, maxWidth: kWidePageMaxWidth);

        if (costs == null) {
          return error != null
              ? EmptyState(
                  key: const Key('costsError'),
                  icon: LucideIcons.cloudOff,
                  title: l10n.somethingWentWrong,
                  message: errorText(context, error),
                  isError: true,
                  action: FilledButton.tonalIcon(
                    key: const Key('costsRetry'),
                    onPressed: _refresh,
                    icon: const Icon(LucideIcons.rotateCw, size: 18),
                    label: Text(l10n.retry),
                  ),
                )
              : CostsSkeleton(wide: wide, side: side);
        }

        final book = ref.watch(costColorBookProvider);
        book.register(costs.group, costs.series.map((s) => s.id));
        Color colorOf(String id) => costColor(context, book, costs.group, id);
        final notifier = ref.read(costViewProvider.notifier);

        void open(AdminCostRow r) {
          if (!current) return;
          if (canPanel) {
            return notifier.select(view.selectedId == r.id ? null : r.id);
          }
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => CostDetailPage(
                row: r,
                group: costs.group,
                base: query,
                onDrill: (split) =>
                    notifier.drillInto(CostFilter(r.id, r.label), split),
              ),
            ),
          );
        }

        final main = _CostsBody(
          costs: costs,
          view: view,
          services: ref
              .watch(
                adminCostsProvider(
                  query.copyWith(group: CostGroup.service, filters: const {}),
                ),
              )
              .value,
          loading: async.isLoading,
          error: error,
          wide: wide,
          table: mainWidth >= 540,
          across: mainWidth >= 540 ? 4 : 2,
          side: side,
          colorOf: colorOf,
          onOpen: open,
          onRefresh: _refresh,
        );
        if (selected == null) return main;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: main),
            Container(
              key: const Key('costPanel'),
              width: _panelWidth,
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerLow.withValues(
                  alpha: context.isDark ? 0.5 : 0.6,
                ),
                border: BorderDirectional(
                  start: BorderSide(color: context.appColors.hairline),
                ),
              ),
              // Its own traversal group: Tab moves through the panel after the table, not into it.
              child: FocusTraversalGroup(
                child: CostDetail(
                  key: ValueKey('${costs.group.value}:${selected.id}'),
                  row: selected,
                  group: costs.group,
                  base: query,
                  onClose: () => notifier.select(null),
                  onDrill: (split) => notifier.drillInto(
                    CostFilter(selected.id, selected.label),
                    split,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CostsBody extends ConsumerWidget {
  const _CostsBody({
    required this.costs,
    required this.view,
    required this.services,
    required this.loading,
    required this.error,
    required this.wide,
    required this.table,
    required this.across,
    required this.side,
    required this.colorOf,
    required this.onOpen,
    required this.onRefresh,
  });

  final AdminCosts costs;
  final CostView view;
  final AdminCosts? services;

  /// Another view is on its way; [costs] is the one before it.
  final bool loading;

  /// The view asked for failed; [costs] is the last one that worked.
  final Object? error;

  /// Room for the controls in the page itself and for every column.
  final bool wide;

  /// Room for a table at all: a short one with fewer columns when not [wide], else two-line rows.
  final bool table;
  final int across;
  final double side;
  final Color Function(String id) colorOf;
  final ValueChanged<AdminCostRow> onOpen;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final text = context.textTheme;
    final muted = context.colorScheme.onSurfaceVariant;
    final t = costs.totals;
    final days =
        (costDay(costs.to)
                ?.difference(costDay(costs.from) ?? DateTime.utc(0))
                .inDays ??
            view.query.days - 1) +
        1;
    final spanDays = days > 0 && days <= 366 ? days : view.query.days;
    final rows = sortCostRows(costs.rows, view.sort, view.ascending, l10n);
    final quiet =
        t.spentUsd <= 0 &&
        t.chargedUsd <= 0 &&
        costs.rows.every(
          (r) => r.spentUsd <= 0 && r.calls == 0 && (r.tokenUsdEst ?? 0) <= 0,
        );
    final series = costSeries(context, costs, colorOf);
    final updated = costAgo(context, costs.updatedAt);
    final range = costRange(context, costs.from, costs.to);
    final periodTitle = view.period == CostPeriod.custom
        ? l10n.costPeriodCustom
        : l10n.costLastDays(view.period.days);
    final label = text.labelLarge?.copyWith(
      color: muted,
      fontWeight: FontWeight.w600,
    );
    final notifier = ref.read(costViewProvider.notifier);

    Widget pad(Widget child, {bool bleed = false}) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: bleed ? side - AppSpace.gutter : side,
      ),
      child: child,
    );
    // What is on screen belongs to the view before: dimmed until the new one lands.
    Widget stale(Widget child) => AnimatedOpacity(
      duration: AppMotion.of(context, AppMotion.fast),
      opacity: loading ? 0.55 : 1,
      child: child,
    );

    final emptyText = view.filters.isNotEmpty
        ? l10n.costEmptyFiltered
        : view.period == CostPeriod.custom
        ? l10n.costEmptyRange
        : l10n.costEmptyDays(view.period.days);

    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
        await ref
            .read(adminCostsProvider(view.query).future)
            .then<void>((_) {}, onError: (_) {});
      },
      child: ListView(
        key: const Key('costsList'),
        padding: EdgeInsets.only(
          top: AppSpace.xs,
          bottom: AppSpace.xxl + MediaQuery.paddingOf(context).bottom,
        ),
        children: [
          pad(
            wide
                ? AdminSectionHeader(
                    section: AdminSection.costs,
                    summary: [
                      range,
                      if (updated != null) l10n.costUpdated(updated),
                    ].join(' · '),
                    onRefresh: onRefresh,
                    actions: [
                      if (view.period == CostPeriod.custom)
                        TextButton.icon(
                          key: const Key('costPickRange'),
                          onPressed: () => pickCostRange(context, ref),
                          icon: const Icon(LucideIcons.calendarRange, size: 18),
                          label: Text(l10n.costChangeDates),
                        ),
                      const SizedBox(width: 380, child: CostPeriodControl()),
                    ],
                  )
                // Side by side while both fit; with large text the button drops under
                // the period instead of squeezing it.
                : Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: AppSpace.sm,
                    runSpacing: AppSpace.xs,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Semantics(
                            header: true,
                            child: Text(
                              periodTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Text(
                            range,
                            key: const Key('costRange'),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: text.bodyMedium?.copyWith(color: muted),
                          ),
                        ],
                      ),
                      CostOptionsButton(from: costs.from, to: costs.to),
                    ],
                  ),
          ),
          // Always there, so the page doesn't shift when a load starts or ends.
          pad(
            SizedBox(
              height: AppSpace.sm,
              child: Center(
                child: loading
                    ? LinearProgressIndicator(
                        key: const Key('costsLoading'),
                        minHeight: 3,
                        borderRadius: BorderRadius.circular(3),
                      )
                    : null,
              ),
            ),
          ),
          if (error != null)
            pad(
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpace.sm),
                child: AppCard(
                  key: const Key('costsStaleError'),
                  borderColor: context.colorScheme.error.withValues(alpha: 0.5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpace.md,
                    vertical: AppSpace.xs,
                  ),
                  child: InlineError(error: error!, onRetry: onRefresh),
                ),
              ),
            ),
          pad(
            stale(
              CostTiles(
                costs: costs,
                days: spanDays,
                across: across,
                services: services,
                filtered: view.filters.isNotEmpty,
              ),
            ),
          ),
          pad(SectionHeader(title: l10n.costDailySpend)),
          pad(
            stale(
              AppCard(
                child: quiet
                    ? _Quiet(
                        text: emptyText,
                        onClear: view.filters.isEmpty
                            ? null
                            : notifier.clearFilters,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.costStackedBy(
                              costGroupLabel(l10n, costs.group),
                            ),
                            style: text.bodySmall?.copyWith(color: muted),
                          ),
                          const SizedBox(height: AppSpace.sm),
                          CostChart(
                            costs: costs,
                            series: series,
                            height: wide ? 230 : 190,
                          ),
                          const SizedBox(height: AppSpace.sm),
                          CostLegend(series: series),
                          const SizedBox(height: AppSpace.xs),
                          Text(
                            l10n.costDaysUtc,
                            key: const Key('costUtcNote'),
                            style: text.labelSmall?.copyWith(color: muted),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          const SizedBox(height: AppSpace.lg),
          if (wide) ...[
            pad(
              Row(
                children: [
                  SizedBox(
                    width: 76,
                    child: Text(l10n.costGroupBy, style: label),
                  ),
                  const Expanded(child: CostGroupControl(wide: true)),
                ],
              ),
            ),
            const SizedBox(height: AppSpace.xs),
            pad(
              Row(
                children: [
                  SizedBox(
                    width: 76,
                    child: Text(l10n.costFilters, style: label),
                  ),
                  const Expanded(flex: 3, child: CostFilterChips()),
                  const SizedBox(width: AppSpace.sm),
                  const Flexible(flex: 2, child: CostFixedSwitch()),
                  const SizedBox(width: AppSpace.sm),
                  CostExportButton(
                    query: view.query,
                    from: costs.from,
                    to: costs.to,
                  ),
                ],
              ),
            ),
          ] else ...[
            pad(const CostGroupControl(wide: false), bleed: true),
            if (view.filters.isNotEmpty)
              pad(
                const Padding(
                  padding: EdgeInsets.only(top: AppSpace.xs),
                  child: CostFilterChips(emptyHint: false),
                ),
              ),
          ],
          const SizedBox(height: AppSpace.sm),
          // A quiet period already says so where the chart would be.
          if (rows.isEmpty && quiet)
            const SizedBox.shrink()
          else if (rows.isEmpty)
            pad(
              AppCard(
                child: _Quiet(
                  text: l10n.costEmptyGroup,
                  onClear: view.filters.isEmpty ? null : notifier.clearFilters,
                ),
              ),
            )
          else
            pad(
              stale(
                table
                    ? CostTable(
                        compact: !wide,
                        rows: rows,
                        group: costs.group,
                        total: t.spentUsd,
                        sort: view.sort,
                        ascending: view.ascending,
                        selectedId: costs.group == view.group
                            ? view.selectedId
                            : null,
                        colorOf: colorOf,
                        onOpen: onOpen,
                        onSort: notifier.sortBy,
                      )
                    : CostList(
                        rows: rows,
                        group: costs.group,
                        total: t.spentUsd,
                        colorOf: colorOf,
                        onOpen: onOpen,
                      ),
              ),
            ),
          const SizedBox(height: AppSpace.md),
          if (costs.group == CostGroup.app)
            pad(
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpace.xs),
                child: FormNote(l10n.costAppsNote),
              ),
            ),
          if (!costs.includeFixed && t.fixedUsd > 0)
            pad(
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpace.xs),
                child: FormNote(
                  l10n.costFixedLeftOut(costUsd(t.fixedUsd, locale)),
                  icon: LucideIcons.receipt,
                ),
              ),
            ),
          if (t.ownUsd > 0)
            pad(
              FormNote(
                l10n.costOwnKeys(costUsd(t.ownUsd, locale)),
                icon: LucideIcons.keyRound,
              ),
            ),
        ],
      ),
    );
  }
}

/// Nothing to draw: the period (or the filtered view) is empty, said in words where the chart or
/// the table would be.
class _Quiet extends StatelessWidget {
  const _Quiet({required this.text, this.onClear});
  final String text;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final muted = context.colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
      child: Column(
        children: [
          Icon(
            LucideIcons.chartColumnStacked,
            size: 28,
            color: muted.withValues(alpha: 0.7),
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            text,
            key: const Key('costsEmpty'),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(color: muted),
          ),
          if (onClear != null) ...[
            const SizedBox(height: AppSpace.xs),
            TextButton(
              key: const Key('costClearFilters'),
              onPressed: onClear,
              child: Text(context.l10n.clearFilters),
            ),
          ],
        ],
      ),
    );
  }
}
