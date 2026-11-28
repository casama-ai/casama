import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
// The bot widgets' Canvas model would shadow dart:ui's Canvas this file paints on.
import 'package:casama_sdk/casama_sdk.dart' hide Canvas;
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/haptics.dart';
import '../../core/number_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import 'admin_nav.dart';
import 'costs/cost_view.dart';
import 'ui/admin_ui.dart';

/// The paid services Casama leans on (D-493): how much of each is left, when it resets, and the
/// alerts and plan behind each one. docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §6.

final adminVendorsProvider = FutureProvider.autoDispose<List<AdminVendor>>(
  (ref) => ref.watch(backendProvider).adminVendors(),
);

String vendorStatus(BuildContext context, AdminVendor v) {
  final words = context.l10n;
  if (v.latest == null) return words.vendorNoReading;
  if (v.latest!.error == 'not_configured') return words.vendorNotSetUp;
  return switch (v.latest!.status.value) {
    'ok' => words.vendorOk,
    'low' => words.vendorLow,
    'out' => words.vendorOut,
    _ => words.vendorUnknown,
  };
}

/// The detail shows beside the list once the content pane is this wide.
const double _kPaneMinWidth = 900;

enum _Group { attention, healthy, idle }

_Group _groupOf(AdminVendor v) {
  final r = v.latest;
  if (!v.enabled || r?.error == 'not_configured') return _Group.idle;
  // Nothing measured yet isn't a problem to act on.
  if (r == null) return _Group.healthy;
  if (r.status.value != 'ok' || r.error != null) return _Group.attention;
  return _Group.healthy;
}

int _severity(AdminVendor v) => switch (v.latest?.status.value) {
  'out' => 0,
  'low' => 1,
  'ok' => 3,
  _ => 2,
};

/// Used share of a quota; null when there's no limit or nothing measured.
double? _usedFraction(AdminVendor v) {
  final limit = v.latest?.limitValue ?? v.limitValue;
  final used = v.latest?.used;
  if (used == null || limit == null || limit <= 0) return null;
  return (used / limit).toDouble();
}

AdminTone _tone(AdminVendor v) {
  final r = v.latest;
  if (!v.enabled || r == null || r.error == 'not_configured') return AdminTone.neutral;
  return switch (r.status.value) {
    'out' => AdminTone.negative,
    'low' => AdminTone.warning,
    'ok' => AdminTone.positive,
    _ => AdminTone.neutral,
  };
}

/// The pill's words: the state, with the share used for a quota ("Low · 82%").
String _pillText(BuildContext context, AdminVendor v) {
  final words = context.l10n;
  if (!v.enabled) return words.vendorOff;
  final status = vendorStatus(context, v);
  final f = _usedFraction(v);
  if (v.kind.value != 'balance' && f != null && v.latest?.error != 'not_configured') {
    return words.vendorPillPercent(status, (f * 100).round());
  }
  return status;
}

bool _isMoney(String unit) => const {'usd', r'$', 'dollars', 'dollar'}.contains(unit.trim().toLowerCase());

String _amount(BuildContext context, num n, String unit) {
  final locale = context.l10n.localeName;
  if (_isMoney(unit)) return n.humanizedCurrency(locale, 'USD', decimalDigits: 2);
  final count = n.humanizedCount(locale);
  return unit.trim().isEmpty ? count : '$count $unit';
}

String _usedOf(BuildContext context, AdminVendor v, num used, num limit) {
  if (_isMoney(v.unit)) return '${_amount(context, used, v.unit)} / ${_amount(context, limit, v.unit)}';
  final locale = context.l10n.localeName;
  return context.l10n.vendorUsedOf(used.humanizedCount(locale), limit.humanizedCount(locale), v.unit).trim();
}

/// "2 Jan", or "2 Jan 2028" outside this year.
String _shortDate(BuildContext context, DateTime at) {
  final local = at.toLocal();
  final locale = Localizations.localeOf(context).toLanguageTag();
  return (local.year == DateTime.now().year ? DateFormat.MMMd(locale) : DateFormat.yMMMd(locale)).format(local);
}

/// "in 6 days" for a time ahead; a date once it's more than two weeks away.
String _ahead(BuildContext context, DateTime at) {
  final words = context.l10n;
  final d = at.difference(DateTime.now());
  if (d.isNegative) return relativeTime(at, context);
  if (d.inMinutes < 60) return words.vendorInMinutes(math.max(1, d.inMinutes));
  if (d.inHours < 24) return words.vendorInHours(d.inHours);
  if (d.inDays < 14) return words.vendorInDays(d.inDays);
  return _shortDate(context, at);
}

String _sourceLabel(BuildContext context, VendorReading r) => switch (r.source_.value) {
  'api' => context.l10n.vendorSourceApi,
  'own_count' => context.l10n.vendorSourceOwnCount,
  'manual' => context.l10n.vendorSourceManual,
  final other => other,
};

IconData _sourceIcon(VendorReading r) => switch (r.source_.value) {
  'api' => LucideIcons.plug,
  'own_count' => LucideIcons.calculator,
  _ => LucideIcons.pencil,
};

/// What a vendor's meter shows: how full, its two captions, and the big number for the detail.
class _Gauge {
  const _Gauge({this.fraction, this.start, this.end, this.headline});
  final double? fraction;
  final String? start;
  final String? end;
  final String? headline;
}

_Gauge _gauge(BuildContext context, AdminVendor v) {
  final words = context.l10n;
  final r = v.latest;
  final limit = r?.limitValue ?? v.limitValue;
  String? end;
  final resetsAt = r?.resetsAt == null ? null : DateTime.tryParse(r!.resetsAt!);
  if (resetsAt != null) {
    end = words.vendorResetsWhen(_ahead(context, resetsAt));
  } else if (v.expiresAt != null) {
    end = v.expiresAt!.isAfter(DateTime.now())
        ? words.vendorRenewsOn(_shortDate(context, v.expiresAt!))
        : words.vendorExpiredOn(_shortDate(context, v.expiresAt!));
  }
  if (r?.error == 'not_configured') return _Gauge(end: end);
  if (v.kind.value == 'balance') {
    final remaining = r?.remaining;
    final left = remaining == null ? null : words.vendorLeft(_amount(context, remaining, v.unit));
    final below = v.balanceWarnBelow;
    return _Gauge(
      // What's left of the prepaid amount, when there is one.
      fraction: remaining != null && limit != null && limit > 0 ? (remaining / limit).toDouble() : null,
      start: left,
      end: end ?? (below == null ? null : words.vendorWarnBelowCaption(_amount(context, below, v.unit))),
      headline: left,
    );
  }
  final used = r?.used;
  final text = used == null ? null : (limit != null && limit > 0 ? _usedOf(context, v, used, limit) : _amount(context, used, v.unit));
  return _Gauge(fraction: _usedFraction(v), start: text, end: end, headline: text);
}

class VendorsTab extends ConsumerStatefulWidget {
  const VendorsTab({super.key});

  @override
  ConsumerState<VendorsTab> createState() => _VendorsTabState();
}

class _VendorsTabState extends ConsumerState<VendorsTab> {
  String? _selected;
  var _showIdle = false;

  /// While "Check all" runs: how many are done, of how many.
  (int, int)? _progress;

  Future<void> _refresh() async {
    ref.invalidate(adminVendorsProvider);
    try {
      await ref.read(adminVendorsProvider.future);
    } catch (_) {
      // The page shows its own error with a retry.
    }
  }

  Future<void> _checkAll(List<AdminVendor> vendors) async {
    final words = context.l10n;
    final targets = vendors.where((v) => v.enabled && v.latest?.error != 'not_configured').toList();
    if (targets.isEmpty) return;
    final backend = ref.read(backendProvider);
    setState(() => _progress = (0, targets.length));
    var failed = 0;
    for (var i = 0; i < targets.length; i++) {
      try {
        await backend.checkAdminVendor(targets[i].vendor);
      } catch (_) {
        failed++;
      }
      if (!mounted) return;
      setState(() => _progress = (i + 1, targets.length));
    }
    setState(() => _progress = null);
    ref.invalidate(adminVendorsProvider);
    if (failed > 0) {
      showWarning(context, words.vendorCheckAllFailed(failed));
    } else {
      showSuccess(context, words.vendorCheckedAll(targets.length));
    }
  }

  void _open(BuildContext context, AdminVendor v, {required bool pane}) {
    final nav = AdminNav.maybeOf(context);
    void seeSpend() => ref.read(costViewProvider.notifier).showService(v.vendor, v.label);
    if (pane) {
      setState(() => _selected = v.vendor);
      return;
    }
    showAdaptiveSheet<void>(
      context: context,
      heightFactor: 0.92,
      dialogMaxWidth: 620,
      dialogMaxHeight: 900,
      builder: (sheet) => VendorDetail(
        vendor: v,
        onClose: () => Navigator.of(sheet).pop(),
        // The Costs section, narrowed to this service and cut by key.
        onSeeSpend: nav == null
            ? null
            : () {
                seeSpend();
                Navigator.of(sheet).pop();
                nav.onOpen(AdminSection.costs);
              },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AsyncView<List<AdminVendor>>(
      value: ref.watch(adminVendorsProvider),
      onRetry: () => ref.invalidate(adminVendorsProvider),
      loading: const _VendorsSkeleton(),
      data: (vendors) => LayoutBuilder(
        builder: (context, constraints) {
          final pane = constraints.maxWidth >= _kPaneMinWidth;
          final list = _list(context, vendors, pane: pane);
          if (!pane) return list;
          final selected = vendors.where((v) => v.vendor == _selected).firstOrNull;
          final nav = AdminNav.maybeOf(context);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: list),
              VerticalDivider(width: 1, thickness: 1, color: context.appColors.hairline),
              SizedBox(
                width: math.min(480, constraints.maxWidth * 0.45),
                child: selected == null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpace.xl),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(LucideIcons.gauge, size: 32, color: context.colorScheme.onSurfaceVariant),
                              const SizedBox(height: AppSpace.sm),
                              Text(
                                context.l10n.vendorPickOne,
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
                              ),
                            ],
                          ),
                        ),
                      )
                    : VendorDetail(
                        key: ValueKey(selected.vendor),
                        vendor: selected,
                        onClose: () => setState(() => _selected = null),
                        onSeeSpend: nav == null
                            ? null
                            : () {
                                ref.read(costViewProvider.notifier).showService(selected.vendor, selected.label);
                                nav.onOpen(AdminSection.costs);
                              },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _list(BuildContext context, List<AdminVendor> vendors, {required bool pane}) {
    final words = context.l10n;
    final groups = {for (final g in _Group.values) g: <AdminVendor>[]};
    for (final v in vendors) {
      groups[_groupOf(v)]!.add(v);
    }
    groups[_Group.attention]!.sort((a, b) {
      final s = _severity(a).compareTo(_severity(b));
      if (s != 0) return s;
      return (_usedFraction(b) ?? 0).compareTo(_usedFraction(a) ?? 0);
    });
    groups[_Group.healthy]!.sort((a, b) => (_usedFraction(b) ?? -1).compareTo(_usedFraction(a) ?? -1));
    groups[_Group.idle]!.sort((a, b) => a.label.compareTo(b.label));
    final attention = groups[_Group.attention]!;
    final healthy = groups[_Group.healthy]!;
    final idle = groups[_Group.idle]!;
    final summary = [
      if (attention.isNotEmpty) words.vendorSummaryAttention(attention.length),
      if (healthy.isNotEmpty) words.vendorSummaryOk(healthy.length),
      if (idle.isNotEmpty) words.vendorSummaryIdle(idle.length),
    ].join(' · ');
    final progress = _progress;
    Widget card(AdminVendor v) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.sm),
      child: _VendorCard(vendor: v, selected: pane && v.vendor == _selected, onTap: () => _open(context, v, pane: pane)),
    );
    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(
          section: AdminSection.vendors,
          summary: summary.isEmpty ? null : summary,
          onRefresh: _refresh,
          actions: [
            FilledButton.tonalIcon(
              key: const Key('vendorCheckAll'),
              onPressed: progress != null || vendors.isEmpty ? null : () => _checkAll(vendors),
              icon: progress == null
                  ? const Icon(LucideIcons.refreshCcwDot, size: 18)
                  : const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
              label: Text(progress == null ? words.vendorCheckAll : words.vendorCheckingProgress(progress.$1, progress.$2)),
            ),
          ],
        ),
        if (progress != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpace.sm),
            child: LinearProgressIndicator(minHeight: 3, value: progress.$2 == 0 ? null : progress.$1 / progress.$2),
          ),
        if (vendors.isEmpty) AdminEmptyCard(icon: LucideIcons.gauge, message: words.vendorNoVendors),
        if (attention.isNotEmpty) ...[
          SectionHeader(title: words.vendorGroupAttention, count: '${attention.length}', padding: const EdgeInsets.fromLTRB(AppSpace.xxs, AppSpace.xs, AppSpace.xxs, AppSpace.xs)),
          for (final v in attention) card(v),
        ],
        if (healthy.isNotEmpty) ...[
          SectionHeader(title: words.vendorGroupHealthy, count: '${healthy.length}'),
          for (final v in healthy) card(v),
        ],
        if (idle.isNotEmpty) ...[
          SectionHeader(title: words.vendorGroupIdle, count: '${idle.length}'),
          if (_showIdle) for (final v in idle) card(v),
          AppCard(
            key: const Key('vendorShowIdle'),
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.sm),
            onTap: () => setState(() => _showIdle = !_showIdle),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _showIdle ? words.vendorShowLess : words.vendorShowMore(idle.length),
                    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.primary),
                  ),
                ),
                Icon(_showIdle ? LucideIcons.chevronUp : LucideIcons.chevronDown, size: 18, color: context.colorScheme.primary),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _VendorsSkeleton extends StatelessWidget {
  const _VendorsSkeleton();

  @override
  Widget build(BuildContext context) {
    return SkeletonScope(
      child: AdminSectionList(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: AppSpace.xs, bottom: AppSpace.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SkeletonBone(width: 140, height: 22), SizedBox(height: 8), SkeletonBone(width: 220)],
            ),
          ),
          for (var i = 0; i < 4; i++)
            const Padding(
              padding: EdgeInsets.only(bottom: AppSpace.sm),
              child: SkeletonCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [SkeletonBone(width: 120, height: 16), Spacer(), SkeletonBone(width: 64, height: 22, radius: 11)]),
                    SizedBox(height: 14),
                    SkeletonBone(height: 8, radius: 4),
                    SizedBox(height: 10),
                    SkeletonBone(width: 180, height: 10),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _VendorCard extends StatelessWidget {
  const _VendorCard({required this.vendor, required this.selected, required this.onTap});
  final AdminVendor vendor;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final v = vendor;
    final r = v.latest;
    final tone = _tone(v);
    final gauge = _gauge(context, v);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    final notSetUp = r?.error == 'not_configured';
    final failed = r?.error != null && !notSetUp ? r!.error : null;
    return AppCard(
      key: Key('vendorCard-${v.vendor}'),
      onTap: onTap,
      borderColor: selected ? context.colorScheme.primary : null,
      borderWidth: selected ? 1.5 : 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(v.label, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: AppSpace.xs),
              AdminStatusPill(_pillText(context, v), tone: tone, key: Key('vendorPill-${v.vendor}')),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          if (!v.enabled || notSetUp)
            Text(!v.enabled ? words.vendorOffHint : words.vendorNotSetUpHint, style: muted)
          else if (gauge.fraction != null)
            AdminMeter(key: Key('vendorMeter-${v.vendor}'), fraction: gauge.fraction, tone: tone == AdminTone.neutral ? null : tone, warnAt: v.warnAt.toDouble(), start: gauge.start, end: gauge.end)
          else if (gauge.start != null || gauge.end != null)
            Row(
              children: [
                if (gauge.start != null)
                  Expanded(child: Text(gauge.start!, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontFeatures: AppText.tabular)))
                else
                  const Spacer(),
                if (gauge.end != null) ...[const SizedBox(width: AppSpace.xs), Text(gauge.end!, style: muted)],
              ],
            )
          else
            Text(words.vendorNoReading, style: muted),
          if (failed != null) ...[
            const SizedBox(height: AppSpace.xs),
            Text(words.vendorReadingError(failed), maxLines: 2, overflow: TextOverflow.ellipsis, style: muted?.copyWith(color: context.appColors.negative)),
          ],
          if (r != null && !notSetUp) ...[
            const SizedBox(height: AppSpace.xs),
            _ReadingFooter(reading: r),
          ],
        ],
      ),
    );
  }
}

/// Where a reading came from and how long ago.
class _ReadingFooter extends StatelessWidget {
  const _ReadingFooter({required this.reading});
  final VendorReading reading;

  @override
  Widget build(BuildContext context) {
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    final checked = DateTime.tryParse(reading.checkedAt);
    return Wrap(
      spacing: AppSpace.md,
      runSpacing: 2,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_sourceIcon(reading), size: 13, color: muted?.color),
            const SizedBox(width: 4),
            Text(_sourceLabel(context, reading), style: muted),
          ],
        ),
        if (checked != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.clock, size: 13, color: muted?.color),
              const SizedBox(width: 4),
              TimeAgo(checked, style: muted, label: context.l10n.vendorCheckedAgo),
            ],
          ),
      ],
    );
  }
}

/// One service: its status and history, what can be done, its alerts and its plan, with Save
/// pinned at the bottom. Shown beside the list on wide windows and as a tall sheet on phones.
class VendorDetail extends ConsumerStatefulWidget {
  const VendorDetail({super.key, required this.vendor, this.onSeeSpend, this.onClose});
  final AdminVendor vendor;

  /// Opens this service's spend in the Costs section; null where there is no section to go to.
  final VoidCallback? onSeeSpend;

  /// Closes the sheet or the side pane.
  final VoidCallback? onClose;

  @override
  ConsumerState<VendorDetail> createState() => _VendorDetailState();
}

class _VendorDetailState extends ConsumerState<VendorDetail> {
  late AdminVendor vendor = widget.vendor;
  late final limit = TextEditingController(text: vendor.limitValue?.toString() ?? '');
  late final balanceWarning = TextEditingController(text: vendor.balanceWarnBelow?.toString() ?? '');
  // A renewal: what one costs and how long it lasts, so its bill can be spread over its months.
  late final renewalUsd = TextEditingController(text: vendor.renewalUsd?.toString() ?? '');
  late final renewalMonths = TextEditingController(text: vendor.renewalMonths?.toString() ?? '');
  // How its usage is paid for (REAL-COSTS-PLAN): a free plan costs $0 and stops at its cap; a
  // metered one is paid as recorded, less any monthly credit the plan includes.
  late bool freePlan = vendor.billing == VendorBilling.free;
  late final includedUsd = TextEditingController(text: vendor.includedUsd?.toString() ?? '');
  late double warnAt = vendor.warnAt.toDouble();
  late DateTime? periodStart = vendor.periodStart;
  late DateTime? expiresAt = vendor.expiresAt;
  late bool enabled = vendor.enabled;
  late VendorSettingsPeriodEnum? period = vendor.period == null
      ? null
      : VendorSettingsPeriodEnum.values.firstWhere((v) => v.value == vendor.period!.value);
  bool busy = false;
  var errors = <String, String>{};

  @override
  void didUpdateWidget(VendorDetail old) {
    super.didUpdateWidget(old);
    // A refreshed list: show its readings; what's typed in the form stays.
    if (old.vendor != widget.vendor) vendor = widget.vendor;
  }

  @override
  void dispose() {
    limit.dispose();
    balanceWarning.dispose();
    renewalUsd.dispose();
    renewalMonths.dispose();
    includedUsd.dispose();
    super.dispose();
  }

  Future<bool> act(Future<AdminVendor> Function() action) async {
    setState(() => busy = true);
    final result = await runGuarded(context, () async {
      final result = await action();
      ref.invalidate(adminVendorsProvider);
      return result;
    });
    if (mounted) {
      setState(() {
        busy = false;
        if (result != null) vendor = result;
      });
    }
    return result != null;
  }

  Future<void> _save() async {
    final words = context.l10n;
    final problems = <String, String>{};
    final limitText = limit.text.trim();
    final n = limitText.isEmpty ? null : num.tryParse(limitText);
    if (limitText.isNotEmpty && (n == null || !n.isFinite || n <= 0)) problems['limit'] = words.vendorLimitInvalid;
    if (!warnAt.isFinite || warnAt <= 0 || warnAt > 1) problems['warn'] = words.vendorWarnAtInvalid;
    final balance = vendor.kind.value == 'balance';
    final bwText = balanceWarning.text.trim();
    final bw = !balance ? vendor.balanceWarnBelow : (bwText.isEmpty ? null : num.tryParse(bwText));
    if (balance && bwText.isNotEmpty && (bw == null || !bw.isFinite || bw < 0)) problems['balance'] = words.vendorAmountInvalid;
    // A prepaid balance has no bill to spread; every other kind can carry one (a paid plan).
    final renewal = !balance;
    final ruText = renewalUsd.text.trim();
    final rmText = renewalMonths.text.trim();
    final ru = !renewal || ruText.isEmpty ? null : num.tryParse(ruText);
    final rm = !renewal || rmText.isEmpty ? null : int.tryParse(rmText);
    if (renewal && ruText.isNotEmpty && (ru == null || !ru.isFinite || ru < 0)) problems['renewalUsd'] = words.vendorAmountInvalid;
    if (renewal && rmText.isNotEmpty && (rm == null || rm < 1 || rm > 120)) problems['renewalMonths'] = words.vendorMonthsInvalid;
    final incText = includedUsd.text.trim();
    final inc = freePlan || incText.isEmpty ? null : num.tryParse(incText);
    if (!freePlan && incText.isNotEmpty && (inc == null || !inc.isFinite || inc < 0)) problems['includedUsd'] = words.vendorAmountInvalid;
    setState(() => errors = problems);
    if (problems.isNotEmpty) return;
    final saved = await act(
      () => ref
          .read(backendProvider)
          .setAdminVendor(
            vendor.vendor,
            VendorSettings(
              limitValue: n,
              warnAt: warnAt,
              enabled: enabled,
              balanceWarnBelow: bw,
              period: period,
              periodStart: periodStart?.toUtc(),
              expiresAt: expiresAt?.toUtc(),
              renewalUsd: ru,
              renewalMonths: rm,
              billing: freePlan ? VendorBilling.free : VendorBilling.metered,
              includedUsd: inc,
            ),
          ),
    );
    if (saved && mounted) showSuccess(context, words.vendorSaved);
  }

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final v = vendor;
    final tone = _tone(v);
    final gauge = _gauge(context, v);
    final r = v.latest;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    final billing = v.billingUrl == null ? null : Uri.tryParse(v.billingUrl!);
    final notSetUp = r?.error == 'not_configured';
    final failed = r?.error != null && !notSetUp ? r!.error : null;
    final compact = MediaQuery.sizeOf(context).width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(AppSpace.lg, AppSpace.sm, AppSpace.xs, AppSpace.xs),
          child: Row(
            children: [
              Expanded(
                child: Semantics(
                  header: true,
                  child: Text(v.label, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.3)),
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              AdminStatusPill(_pillText(context, v), tone: tone),
              if (widget.onClose != null)
                IconButton(
                  tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                  onPressed: widget.onClose,
                  icon: const Icon(LucideIcons.x, size: 20),
                ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            key: const Key('vendorDetailScroll'),
            padding: const EdgeInsets.fromLTRB(AppSpace.lg, AppSpace.xs, AppSpace.lg, AppSpace.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _DetailSection(
                  title: words.vendorSectionStatus,
                  child: AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          gauge.headline ?? vendorStatus(context, v),
                          style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, fontFeatures: AppText.tabular),
                        ),
                        const SizedBox(height: AppSpace.sm),
                        if (gauge.fraction != null)
                          AdminMeter(
                            fraction: gauge.fraction,
                            tone: tone == AdminTone.neutral ? null : tone,
                            warnAt: v.warnAt.toDouble(),
                            height: 12,
                            start: v.kind.value == 'balance' ? null : '${(gauge.fraction! * 100).round()}%',
                            end: gauge.end,
                          )
                        else if (gauge.end != null)
                          Text(gauge.end!, style: muted),
                        if (failed != null) ...[
                          const SizedBox(height: AppSpace.xs),
                          Text(words.vendorReadingError(failed), style: muted?.copyWith(color: context.appColors.negative)),
                        ],
                        if (notSetUp) ...[const SizedBox(height: AppSpace.xs), Text(words.vendorNotSetUpHint, style: muted)],
                        if (r != null && !notSetUp) ...[const SizedBox(height: AppSpace.sm), _ReadingFooter(reading: r)],
                        if (v.impact != null) ...[
                          const SizedBox(height: AppSpace.sm),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(LucideIcons.info, size: 16, color: context.colorScheme.onSurfaceVariant),
                              const SizedBox(width: AppSpace.xs),
                              Expanded(child: Text(v.impact!, style: context.textTheme.bodyMedium?.copyWith(height: 1.35))),
                            ],
                          ),
                        ],
                        if (v.history.length >= 2) ...[
                          const SizedBox(height: AppSpace.md),
                          _HistorySparkline(
                            v.history,
                            color: tone == AdminTone.neutral ? context.colorScheme.primary : adminToneColor(context, tone),
                            format: (n) => _amount(context, n, v.unit),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                _DetailSection(
                  title: words.vendorSectionActions,
                  child: Wrap(
                    spacing: AppSpace.xs,
                    runSpacing: AppSpace.xs,
                    children: [
                      FilledButton.tonalIcon(
                        key: const Key('vendorCheckNow'),
                        onPressed: busy
                            ? null
                            : () async {
                                final ok = await act(() => ref.read(backendProvider).checkAdminVendor(vendor.vendor));
                                if (ok && context.mounted) showSuccess(context, words.vendorCheckDone);
                              },
                        icon: const Icon(LucideIcons.refreshCw, size: 16),
                        label: Text(words.vendorCheckNow),
                      ),
                      if (billing != null && billing.scheme == 'https')
                        OutlinedButton.icon(
                          key: const Key('vendorBilling'),
                          onPressed: () => launchUrl(billing, mode: LaunchMode.externalApplication),
                          icon: const Icon(LucideIcons.externalLink, size: 16),
                          label: Text(words.vendorBilling),
                        ),
                      if (widget.onSeeSpend != null)
                        TextButton.icon(
                          key: const Key('vendorSeeSpend'),
                          onPressed: widget.onSeeSpend,
                          icon: const Icon(LucideIcons.chartColumn, size: 16),
                          label: Text(words.vendorSeeSpend),
                        ),
                    ],
                  ),
                ),
                _DetailSection(
                  title: words.vendorSectionAlerts,
                  child: AppCard(
                    padding: const EdgeInsets.symmetric(vertical: AppSpace.xxs),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SwitchListTile(
                          key: const Key('vendorEnabled'),
                          title: Text(words.vendorEnabled),
                          value: enabled,
                          onChanged: busy ? null : (on) => setState(() => enabled = on),
                        ),
                        Divider(height: 1, thickness: 1, color: context.appColors.hairline),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.sm, AppSpace.md, AppSpace.xs),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(words.vendorWarnAtValue((warnAt * 100).round()), style: context.textTheme.bodyLarge),
                              Text(words.vendorWarnAtHelp, style: muted),
                              Slider(
                                key: const Key('vendorWarnAt'),
                                min: 0.5,
                                max: 1,
                                divisions: 10,
                                value: warnAt.clamp(0.5, 1.0),
                                label: '${(warnAt * 100).round()}%',
                                onChanged: busy
                                    ? null
                                    : (x) {
                                        final next = (x * 100).round() / 100;
                                        if (next != warnAt) Haptic.snap();
                                        setState(() => warnAt = next);
                                      },
                              ),
                              if (errors['warn'] != null) Text(errors['warn']!, style: muted?.copyWith(color: context.colorScheme.error)),
                            ],
                          ),
                        ),
                        if (v.kind.value == 'balance')
                          Padding(
                            padding: const EdgeInsets.fromLTRB(AppSpace.md, 0, AppSpace.md, AppSpace.md),
                            child: TextField(
                              key: const Key('vendorBalanceWarning'),
                              controller: balanceWarning,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(labelText: words.vendorBalanceWarning, prefixText: r'$ ', errorText: errors['balance']),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                _DetailSection(
                  title: words.vendorSectionPlan,
                  child: AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: AppSpace.md,
                      children: [
                        DropdownButtonFormField<VendorSettingsPeriodEnum?>(
                          key: const Key('vendorPeriod'),
                          initialValue: period,
                          isExpanded: true,
                          decoration: InputDecoration(labelText: words.vendorPeriod),
                          items: [
                            DropdownMenuItem(value: null, child: Text(words.vendorPeriodNone)),
                            for (final p in VendorSettingsPeriodEnum.values)
                              DropdownMenuItem(
                                value: p,
                                child: Text(switch (p.value) {
                                  'day' => words.vendorPeriodDay,
                                  'month' => words.vendorPeriodMonth,
                                  'billing_period' => words.vendorPeriodBilling,
                                  'prepaid' => words.vendorPeriodPrepaid,
                                  final other => other,
                                }),
                              ),
                          ],
                          onChanged: busy ? null : (p) => setState(() => period = p),
                        ),
                        TextField(
                          key: const Key('vendorLimit'),
                          controller: limit,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: words.vendorLimit,
                            suffixText: _isMoney(v.unit) ? null : v.unit,
                            prefixText: _isMoney(v.unit) ? r'$ ' : null,
                            errorText: errors['limit'],
                          ),
                        ),
                        _VendorDateField(
                          fieldKey: const Key('vendorPeriodStart'),
                          label: words.vendorPeriodStart,
                          value: periodStart,
                          onChanged: busy ? null : (d) => setState(() => periodStart = d),
                        ),
                        _VendorDateField(
                          fieldKey: const Key('vendorExpiry'),
                          label: words.vendorExpiry,
                          value: expiresAt,
                          onChanged: busy ? null : (d) => setState(() => expiresAt = d),
                        ),
                        SwitchListTile(
                          key: const Key('vendorFreePlan'),
                          contentPadding: EdgeInsets.zero,
                          title: Text(words.vendorBillingFree),
                          subtitle: Text(words.vendorBillingFreeHelp, style: muted),
                          value: freePlan,
                          onChanged: busy ? null : (on) => setState(() => freePlan = on),
                        ),
                        if (!freePlan)
                          TextField(
                            key: const Key('vendorIncludedUsd'),
                            controller: includedUsd,
                            decoration: InputDecoration(
                              labelText: words.vendorIncludedUsd,
                              helperText: words.vendorIncludedUsdHelp,
                              helperMaxLines: 3,
                              prefixText: r'$ ',
                              errorText: errors['includedUsd'],
                            ),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),
                        if (v.kind.value != 'balance') ...[
                          TextField(
                            key: const Key('vendorRenewalUsd'),
                            controller: renewalUsd,
                            decoration: InputDecoration(labelText: words.vendorRenewalUsd, prefixText: r'$ ', errorText: errors['renewalUsd']),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),
                          TextField(
                            key: const Key('vendorRenewalMonths'),
                            controller: renewalMonths,
                            decoration: InputDecoration(labelText: words.vendorRenewalMonths, errorText: errors['renewalMonths']),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                _DetailSection(
                  title: words.vendorHistory,
                  child: v.history.isEmpty
                      ? Text(words.vendorHistoryEmpty, style: muted)
                      : GroupedCard(
                          dividerIndent: AppSpace.md,
                          children: [for (final reading in v.history.take(30)) _HistoryRow(vendor: v, reading: reading)],
                        ),
                ),
              ],
            ),
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.appColors.hairline),
        Padding(
          padding: EdgeInsets.fromLTRB(AppSpace.lg, AppSpace.sm, AppSpace.lg, AppSpace.sm + MediaQuery.paddingOf(context).bottom),
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: SizedBox(
              width: compact ? double.infinity : null,
              height: 46,
              child: FilledButton(
                key: const Key('vendorSave'),
                onPressed: busy ? null : _save,
                child: busy
                    ? SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2.2, color: context.colorScheme.onPrimary))
                    : Text(words.vendorSave),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: title, padding: const EdgeInsets.fromLTRB(AppSpace.xxs, AppSpace.md, AppSpace.xxs, AppSpace.xs)),
        child,
      ],
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.vendor, required this.reading});
  final AdminVendor vendor;
  final VendorReading reading;

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final r = reading;
    final limit = r.limitValue;
    final String value;
    if (vendor.kind.value == 'balance' && r.remaining != null) {
      value = words.vendorLeft(_amount(context, r.remaining!, vendor.unit));
    } else if (r.used != null && limit != null && limit > 0) {
      value = _usedOf(context, vendor, r.used!, limit);
    } else if (r.used != null) {
      value = _amount(context, r.used!, vendor.unit);
    } else {
      value = '–';
    }
    final checked = DateTime.tryParse(r.checkedAt);
    final (status, tone) = switch (r.status.value) {
      'ok' => (words.vendorOk, AdminTone.positive),
      'low' => (words.vendorLow, AdminTone.warning),
      'out' => (words.vendorOut, AdminTone.negative),
      _ => (r.error == 'not_configured' ? words.vendorNotSetUp : words.vendorUnknown, AdminTone.neutral),
    };
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontFeatures: AppText.tabular)),
                if (checked != null) TimeAgo(checked, style: muted),
              ],
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          AdminStatusPill(status, tone: tone),
        ],
      ),
    );
  }
}

/// A day on the calendar, kept as midnight UTC (how the server stores these dates), with a clear
/// button.
class _VendorDateField extends StatelessWidget {
  const _VendorDateField({required this.label, required this.value, required this.onChanged, this.fieldKey});
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final utc = value?.toUtc();
    final day = utc == null ? null : DateTime(utc.year, utc.month, utc.day);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final change = onChanged;
    return InkWell(
      key: fieldKey,
      borderRadius: BorderRadius.circular(AppRadius.row),
      onTap: change == null
          ? null
          : () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: day ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2100),
              );
              if (picked != null) change(DateTime.utc(picked.year, picked.month, picked.day));
            },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(LucideIcons.calendar, size: 18),
          suffixIcon: day == null || change == null
              ? null
              : IconButton(
                  key: fieldKey == null ? null : Key('${(fieldKey! as ValueKey<String>).value}-clear'),
                  tooltip: words.vendorClearDate,
                  onPressed: () => change(null),
                  icon: const Icon(LucideIcons.x, size: 16),
                ),
        ),
        child: Text(
          day == null ? words.vendorDateNotSet : DateFormat.yMMMd(locale).format(day),
          style: day == null ? context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.onSurfaceVariant) : null,
        ),
      ),
    );
  }
}

/// The readings over time: a soft filled line, the newest point marked, the high and low beside it.
class _HistorySparkline extends StatelessWidget {
  const _HistorySparkline(this.history, {required this.color, required this.format});
  final List<VendorReading> history;
  final Color color;
  final String Function(num) format;

  @override
  Widget build(BuildContext context) {
    final values = history.reversed.map((r) => r.used ?? r.remaining).whereType<num>().toList();
    if (values.length < 2) return const SizedBox.shrink();
    final low = values.reduce(math.min);
    final high = values.reduce(math.max);
    final caption = context.textTheme.labelSmall?.copyWith(color: context.colorScheme.onSurfaceVariant, fontFeatures: AppText.tabular);
    return SizedBox(
      height: 72,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              key: const Key('vendorSparkline'),
              painter: _SparkPainter(values, color, context.colorScheme.surface),
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Text(format(high), style: caption), Text(format(low), style: caption)],
          ),
        ],
      ),
    );
  }
}

class _SparkPainter extends CustomPainter {
  _SparkPainter(this.values, this.color, this.surface);
  final List<num> values;
  final Color color;
  final Color surface;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;
    final low = values.reduce(math.min);
    final high = values.reduce(math.max);
    final range = high == low ? 1 : high - low;
    const pad = 6.0;
    Offset at(int i) => Offset(
      pad + i * (size.width - pad * 2) / (values.length - 1),
      size.height - pad - (values[i] - low) / range * (size.height - pad * 2),
    );
    final line = Path();
    for (var i = 0; i < values.length; i++) {
      final p = at(i);
      if (i == 0) {
        line.moveTo(p.dx, p.dy);
      } else {
        line.lineTo(p.dx, p.dy);
      }
    }
    final fill = Path.from(line)
      ..lineTo(at(values.length - 1).dx, size.height)
      ..lineTo(at(0).dx, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.22), color.withValues(alpha: 0)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..strokeWidth = 2
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
    final last = at(values.length - 1);
    canvas.drawCircle(last, 5, Paint()..color = surface);
    canvas.drawCircle(last, 3.5, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_SparkPainter old) => old.values != values || old.color != color || old.surface != surface;
}
