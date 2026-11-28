import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart' show BuildContext;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/backend.dart' show CostQuery;
import '../../../core/providers.dart';
import '../../../l10n/generated/app_localizations.dart';

/// The periods the Costs tab offers. [custom] is a range of UTC days picked on a calendar.
enum CostPeriod {
  week(7),
  month(30),
  quarter(90),
  custom(0);

  const CostPeriod(this.days);
  final int days;
}

/// Which cost the tab shows (REAL-COSTS-PLAN): [paid] is money that actually leaves the account
/// (free plans and own-server shares are \$0, included credit is taken off); [estimated] is the
/// same usage at list prices.
enum CostBasis { paid, estimated }

/// The admin's choice of [CostBasis], remembered on this device. Paid until they pick otherwise.
class CostBasisNotifier extends Notifier<CostBasis> {
  static const _key = 'admin.costs.basis';
  bool _picked = false;

  @override
  CostBasis build() {
    SharedPreferences.getInstance()
        .then((p) {
          if (_picked || p.getString(_key) != CostBasis.estimated.name) return;
          _apply(CostBasis.estimated);
        })
        .catchError((_) {});
    return CostBasis.paid;
  }

  void set(CostBasis basis) {
    _picked = true;
    if (basis == state) return;
    _apply(basis);
    SharedPreferences.getInstance()
        .then((p) => p.setString(_key, basis.name))
        .catchError((_) => false);
  }

  /// Fixed bills are real money: Paid shows them, Estimated starts without them, as before.
  void _apply(CostBasis basis) {
    state = basis;
    ref
        .read(costViewProvider.notifier)
        .setIncludeFixed(basis == CostBasis.paid);
  }
}

final costBasisProvider = NotifierProvider<CostBasisNotifier, CostBasis>(
  CostBasisNotifier.new,
);

/// The basis the Costs tab shows now, for widgets that only draw what they are given: a flip
/// rebuilds them anyway, since the report they are handed changes with it.
CostBasis costBasisOf(BuildContext context) =>
    ProviderScope.containerOf(context, listen: false).read(costBasisProvider);

/// The name of the headline figure: "Paid" or "Estimated".
String costSpendLabel(AppLocalizations l10n, CostBasis basis) =>
    basis == CostBasis.paid ? l10n.costPaid : l10n.costEstimatedTitle;

/// The table's columns, for sorting.
enum CostColumn { name, spent, share, change, calls, charged, failed, tokens }

/// One value the view is narrowed to: its id for the request and its name for the chip.
class CostFilter {
  const CostFilter(this.id, this.label);
  final String id;
  final String label;
}

/// Everything the Costs tab remembers: period, grouping, filters, sort and the open row. Kept in
/// a provider, so leaving the tab (or regrouping) never loses the place.
class CostView {
  const CostView({
    this.period = CostPeriod.month,
    this.from,
    this.to,
    this.group = CostGroup.service,
    this.filters = const {},
    this.includeFixed = true,
    this.sort = CostColumn.spent,
    this.ascending = false,
    this.selectedId,
  });

  final CostPeriod period;

  /// The custom range's first and last UTC day (YYYY-MM-DD).
  final String? from;
  final String? to;
  final CostGroup group;
  final Map<CostGroup, CostFilter> filters;
  final bool includeFixed;
  final CostColumn sort;
  final bool ascending;

  /// The row whose detail is open beside the table; null when none is.
  final String? selectedId;

  /// The period alone, as a query: what the key list and the "not recorded" list ask with.
  CostQuery get periodQuery =>
      period == CostPeriod.custom && from != null && to != null
      ? CostQuery(from: from, to: to, days: _span(from!, to!))
      : CostQuery(days: period == CostPeriod.custom ? 30 : period.days);

  CostQuery get query => CostQuery(
    group: group,
    days: periodQuery.days,
    from: periodQuery.from,
    to: periodQuery.to,
    filters: {for (final e in filters.entries) e.key: e.value.id},
    includeFixed: includeFixed,
  );

  CostView _with({
    CostPeriod? period,
    String? Function()? from,
    String? Function()? to,
    CostGroup? group,
    Map<CostGroup, CostFilter>? filters,
    bool? includeFixed,
    CostColumn? sort,
    bool? ascending,
    String? Function()? selectedId,
  }) => CostView(
    period: period ?? this.period,
    from: from == null ? this.from : from(),
    to: to == null ? this.to : to(),
    group: group ?? this.group,
    filters: filters ?? this.filters,
    includeFixed: includeFixed ?? this.includeFixed,
    sort: sort ?? this.sort,
    ascending: ascending ?? this.ascending,
    selectedId: selectedId == null ? this.selectedId : selectedId(),
  );
}

int _span(String from, String to) {
  final a = DateTime.tryParse('${from}T00:00:00Z');
  final b = DateTime.tryParse('${to}T00:00:00Z');
  if (a == null || b == null) return 30;
  return (b.difference(a).inDays + 1).clamp(1, 366);
}

/// The groupings a row of [group] can be split by: every other one, most useful first.
List<CostGroup> costSplits(CostGroup group) => switch (group) {
  CostGroup.service => const [
    CostGroup.key,
    CostGroup.feature,
    CostGroup.model,
    CostGroup.workspace,
  ],
  CostGroup.key => const [
    CostGroup.feature,
    CostGroup.model,
    CostGroup.workspace,
  ],
  // The server splits an app by workspace only; its tools are listed apart in its detail.
  CostGroup.app => const [CostGroup.workspace],
  CostGroup.feature => const [
    CostGroup.service,
    CostGroup.model,
    CostGroup.workspace,
    CostGroup.key,
  ],
  CostGroup.model => const [
    CostGroup.workspace,
    CostGroup.feature,
    CostGroup.key,
  ],
  CostGroup.workspace => const [
    CostGroup.service,
    CostGroup.feature,
    CostGroup.model,
    CostGroup.app,
  ],
};

class CostViewNotifier extends Notifier<CostView> {
  @override
  CostView build() => const CostView();

  void setPeriod(CostPeriod period) {
    if (period == CostPeriod.custom) return;
    state = state._with(period: period, from: () => null, to: () => null);
  }

  /// A custom range of UTC days, first and last included.
  void setRange(String from, String to) => state = state._with(
    period: CostPeriod.custom,
    from: () => from,
    to: () => to,
  );

  /// Regrouping keeps the period, filters and sort; only the open row closes, since it belongs
  /// to the old grouping. A sort on a column the new grouping lacks falls back to spent.
  void setGroup(CostGroup group) {
    if (group == state.group) return;
    final appOnly =
        state.sort == CostColumn.failed || state.sort == CostColumn.tokens;
    final lost = group == CostGroup.app
        ? state.sort == CostColumn.charged || state.sort == CostColumn.share
        : appOnly;
    state = state._with(
      group: group,
      selectedId: () => null,
      sort: lost ? CostColumn.spent : null,
      ascending: lost ? false : null,
    );
  }

  void removeFilter(CostGroup group) => state = state._with(
    filters: {...state.filters}..remove(group),
    selectedId: () => null,
  );

  void clearFilters() =>
      state = state._with(filters: const {}, selectedId: () => null);

  void setIncludeFixed(bool value) => state = state._with(includeFixed: value);

  /// A second tap on the sorted column turns it around; names start A to Z, numbers biggest first.
  void sortBy(CostColumn column) => state = state.sort == column
      ? state._with(ascending: !state.ascending)
      : state._with(sort: column, ascending: column == CostColumn.name);

  /// Sorts by [column] its usual way round (the phone's sort choice): names A to Z, numbers
  /// biggest first.
  void setSort(CostColumn column) =>
      state = state._with(sort: column, ascending: column == CostColumn.name);

  void select(String? id) => state = state._with(selectedId: () => id);

  /// A row of the current grouping becomes a filter and the table regroups by [split]: what
  /// "Split by" in a row's detail does when it is carried into the table.
  void drillInto(CostFilter row, CostGroup split) {
    final from = state.group;
    state = state._with(
      filters: {...state.filters, from: row}..remove(split),
      selectedId: () => null,
    );
    setGroup(split);
  }

  /// One service's spend, by key: where a Vendors row lands.
  void showService(String id, String label) => state = CostView(
    period: state.period,
    from: state.from,
    to: state.to,
    includeFixed: state.includeFixed,
    group: CostGroup.key,
    filters: {CostGroup.service: CostFilter(id, label)},
  );
}

final costViewProvider = NotifierProvider<CostViewNotifier, CostView>(
  CostViewNotifier.new,
);

/// One view's numbers as the server sent them. A view that was just open stays for a few minutes,
/// so going back to a grouping or a period shows at once. No automatic retries: the tab has its
/// own Try again.
final _adminCostsRawProvider = FutureProvider.autoDispose
    .family<AdminCosts, CostQuery>((ref, query) {
      final link = ref.keepAlive();
      final timer = Timer(const Duration(minutes: 5), link.close);
      ref.onDispose(timer.cancel);
      return ref.watch(backendProvider).adminCosts(query);
    }, retry: (_, _) => null);

/// One view's numbers in the chosen [CostBasis]. Flipping the basis never asks the server again.
/// Numbers already loaded come back at once, with no async gap: the Overview's spend card is there
/// on the first frame, so the console's list doesn't jump when it slides in late.
final adminCostsProvider = FutureProvider.autoDispose
    .family<AdminCosts, CostQuery>((ref, query) {
      final raw = ref.watch(_adminCostsRawProvider(query));
      final paid = ref.watch(costBasisProvider) == CostBasis.paid;
      AdminCosts shown(AdminCosts c) => paid ? costsAsPaid(c) : c;
      if (raw.hasValue && !raw.hasError) return shown(raw.requireValue);
      return ref.watch(_adminCostsRawProvider(query).future).then(shown);
    }, retry: (_, _) => null);

/// Asks the server again for one view, or for every view when [query] is null.
void refreshCosts(WidgetRef ref, [CostQuery? query]) {
  if (query == null) {
    ref.invalidate(_adminCostsRawProvider);
    ref.invalidate(adminCostsProvider);
  } else {
    ref.invalidate(_adminCostsRawProvider(query));
    ref.invalidate(adminCostsProvider(query));
  }
}

/// What the same usage costs at list prices, kept for a report shown as paid: the margin is
/// always worked out at list prices, so free plans never look like a 100% margin.
final _listSpent = Expando<num>('listSpent');

/// [t]'s usage at list prices, whichever basis it is shown in: what the margin is set against.
/// Fixed bills are left out ([includeFixed] says they are in [t]), since no charge covers them.
num listSpentUsd(AdminCostTotals t, {required bool includeFixed}) =>
    (_listSpent[t] ?? t.spentUsd) - (includeFixed ? t.fixedUsd : 0);

/// [r]'s spend at list prices, whichever basis it is shown in.
num listRowSpentUsd(AdminCostRow r) => _listSpent[r] ?? r.spentUsd;

AdminCostRow _paidRow(AdminCostRow r) {
  final out = r.copyWith(
    spentUsd: r.paidUsd ?? r.spentUsd,
    previousSpentUsd: r.previousSpentUsd == null
        ? null
        : (r.previousPaidUsd ?? r.previousSpentUsd),
  );
  _listSpent[out] = r.spentUsd;
  return out;
}

/// [costs] with every spend figure swapped for what was actually paid. An older server that sends
/// no paid figures is shown unchanged.
AdminCosts costsAsPaid(AdminCosts costs) {
  if (costs.totals.paidUsd == null) return costs;
  AdminCostTotals totals(AdminCostTotals t) {
    final out = t.copyWith(spentUsd: t.paidUsd ?? t.spentUsd);
    _listSpent[out] = t.spentUsd;
    return out;
  }

  return costs.copyWith(
    totals: totals(costs.totals),
    previous: costs.previous == null ? null : totals(costs.previous!),
    rows: [
      for (final r in costs.rows) _paidRow(r),
    ],
    byDay: [
      for (final d in costs.byDay)
        d.copyWith(values: d.paidValues ?? d.values),
    ],
  );
}

/// The server's own paid keys for a period (only the period of the query matters).
final adminCostKeysProvider = FutureProvider.autoDispose
    .family<List<AdminCostKey>, CostQuery>(
      (ref, query) => ref.watch(backendProvider).adminCostKeys(query),
      retry: (_, _) => null,
    );

/// [base] narrowed to one row of [rowGroup] and cut by [split]: what a row's detail asks for.
CostQuery costFiltered(
  CostQuery base,
  CostGroup rowGroup,
  String rowId,
  CostGroup split,
) => base.copyWith(
  group: split,
  filters: {...base.filters, rowGroup: rowId}..remove(split),
);
