import 'package:casama_sdk/casama_sdk.dart';
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
import 'admin_nav.dart';
import 'ui/admin_ui.dart';

final adminDomainsProvider = FutureProvider.autoDispose<AdminDomains>(
  (r) => r.watch(backendProvider).adminDomains(),
);

/// Days from today to [at] in this device's time (negative once it's past).
int _daysUntil(DateTime at) {
  final l = at.toLocal();
  final now = DateTime.now();
  return DateTime(l.year, l.month, l.day).difference(DateTime(now.year, now.month, now.day)).inDays;
}

/// An order a person has to act on: a first purchase waiting for approval, or one that failed.
bool _needsYou(AdminDomainOrder o) => o.needsApproval || o.status == 'needs_attention' || (o.failure?.isNotEmpty ?? false);

/// Admin console > Domains (SITES-AND-DOMAINS-PLAN §7.16): counts and the registrar balance, the
/// orders that need a person (**Approve** a new workspace's first purchase, **Retry** a failed
/// refund or registration), and every domain with search, filters and **Suspend** / **Unsuspend**.
class AdminDomainsTab extends ConsumerStatefulWidget {
  const AdminDomainsTab({super.key});

  @override
  ConsumerState<AdminDomainsTab> createState() => _AdminDomainsTabState();
}

class _AdminDomainsTabState extends ConsumerState<AdminDomainsTab> {
  var _query = '';
  var _filter = 'all';

  Future<void> _refresh() async {
    ref.invalidate(adminDomainsProvider);
    try {
      await ref.read(adminDomainsProvider.future);
    } catch (_) {
      // The page shows the error.
    }
  }

  Future<void> _order(AdminDomainOrder o, {required bool approve}) async {
    final l10n = context.l10n;
    final backend = ref.read(backendProvider);
    final done = await runGuarded(context, () => approve ? backend.adminApproveDomainOrder(o.id) : backend.adminRetryDomainOrder(o.id));
    if (done == null || !mounted) return;
    showSuccess(context, approve ? l10n.adminDomainsApproved : l10n.adminDomainsRetried);
    ref.invalidate(adminDomainsProvider);
  }

  Future<void> _suspend(AdminDomain d) async {
    final l10n = context.l10n;
    final suspend = !d.suspended;
    final ok = await showConfirm(
      context: context,
      icon: suspend ? LucideIcons.ban : LucideIcons.circleCheck,
      title: suspend ? l10n.adminDomainsSuspendTitle(d.name) : l10n.adminDomainsUnsuspendTitle(d.name),
      message: suspend ? l10n.adminDomainsSuspendBody : l10n.adminDomainsUnsuspendBody,
      confirmLabel: suspend ? l10n.adminDomainsSuspend : l10n.adminDomainsUnsuspend,
      destructive: suspend,
      confirmKey: const Key('confirmDomainSuspend'),
    );
    if (!ok || !mounted) return;
    final backend = ref.read(backendProvider);
    final done = await runGuarded(context, () async {
      suspend ? await backend.adminSuspendDomain(d.id) : await backend.adminUnsuspendDomain(d.id);
      return true;
    });
    if (done != true || !mounted) return;
    showSuccess(context, suspend ? l10n.adminDomSuspendedDone : l10n.adminDomUnsuspendedDone);
    ref.invalidate(adminDomainsProvider);
  }

  // --- labels ----------------------------------------------------------------------------------

  String _orderStatus(AdminDomainOrder o) {
    final l10n = context.l10n;
    if (o.needsApproval) return l10n.adminDomOrderWaitingApproval;
    return switch (o.status) {
      'quote' => l10n.adminDomOrderQuote,
      'checkout' => l10n.adminDomOrderCheckout,
      'paid' => l10n.adminDomOrderPaid,
      'registering' => l10n.adminDomOrderRegistering,
      'registered' => l10n.adminDomOrderRegistered,
      'done' => l10n.adminDomOrderDone,
      'abandoned' => l10n.adminDomOrderAbandoned,
      'refunding' => l10n.adminDomOrderRefunding,
      'refunded' => l10n.adminDomOrderRefunded,
      'needs_attention' => l10n.adminDomOrderNeedsAttention,
      final s => _capitalised(s),
    };
  }

  AdminTone _orderTone(AdminDomainOrder o) {
    if (o.needsApproval) return AdminTone.warning;
    if (o.status == 'needs_attention' || (o.failure?.isNotEmpty ?? false)) return AdminTone.negative;
    return switch (o.status) {
      'done' || 'registered' => AdminTone.positive,
      'refunded' || 'abandoned' => AdminTone.neutral,
      _ => AdminTone.info,
    };
  }

  String _orderKind(String kind) {
    final l10n = context.l10n;
    return switch (kind) {
      'register' => l10n.adminDomKindRegister,
      'renew' => l10n.adminDomKindRenew,
      'restore' => l10n.adminDomKindRestore,
      final k => _capitalised(k),
    };
  }

  (String, AdminTone) _domainStatus(AdminDomain d) {
    final l10n = context.l10n;
    if (d.suspended) return (l10n.adminDomainsSuspended, AdminTone.negative);
    return switch (d.registrarStatus) {
      null => (l10n.adminDomainsConnected, AdminTone.info),
      'active' => (l10n.adminDomStatusActive, AdminTone.positive),
      'expired' => (l10n.adminDomStatusExpired, AdminTone.negative),
      'lapsed' => (l10n.adminDomStatusLapsed, AdminTone.warning),
      'gone' => (l10n.adminDomStatusGone, AdminTone.neutral),
      'moved_out' => (l10n.adminDomStatusMovedOut, AdminTone.neutral),
      'suspended' => (l10n.adminDomainsSuspended, AdminTone.negative),
      final s => (_capitalised(s), AdminTone.neutral),
    };
  }

  (String, AdminTone?) _expiry(AdminDomain d) {
    final l10n = context.l10n;
    final at = d.expiresAt;
    if (at == null) return (l10n.adminDomNoExpiry, null);
    final days = _daysUntil(at);
    if (days < 0) return (l10n.adminDomExpiredOn(at.toLocal().formattedDate(context)), AdminTone.negative);
    if (days <= 60) return (l10n.adminDomExpiresIn(days), days <= 30 ? AdminTone.warning : null);
    return (l10n.domainExpiresOn(at.toLocal().formattedDate(context)), null);
  }

  static bool _live(AdminDomain d) => !d.suspended && (d.registrarStatus == null || d.registrarStatus == 'active');
  static bool _expiringSoon(AdminDomain d) => d.expiresAt != null && _daysUntil(d.expiresAt!) <= 30;

  bool _matches(AdminDomain d, String filter) => switch (filter) {
    'live' => _live(d),
    'suspended' => d.suspended,
    'expiring' => _expiringSoon(d),
    _ => true,
  };

  // --- the page --------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AsyncView<AdminDomains>(
      value: ref.watch(adminDomainsProvider),
      onRetry: () => ref.invalidate(adminDomainsProvider),
      loading: const SkeletonPage(
        maxWidth: kAdminContentMaxWidth,
        children: [
          SkeletonCard(height: 72),
          SkeletonSectionHeader(),
          SkeletonCard(height: 120),
          SkeletonSectionHeader(),
          SkeletonGroupedCard(count: 5, row: SkeletonRow(trailing: SkeletonTrailing.none)),
        ],
      ),
      data: _content,
    );
  }

  Widget _content(AdminDomains a) {
    final l10n = context.l10n;
    String usd(num v) => formatUsd(v, l10n.localeName);
    final needsYou = [for (final o in a.orders) if (_needsYou(o)) o]
      // Approvals first: a new workspace is waiting on them.
      ..sort((x, y) => (y.needsApproval ? 1 : 0) - (x.needsApproval ? 1 : 0));
    final others = [for (final o in a.orders) if (!_needsYou(o)) o];
    final q = _query.trim().toLowerCase();
    final shown = [
      for (final d in a.domains)
        if (_matches(d, _filter) && (q.isEmpty || d.name.toLowerCase().contains(q) || (d.orgName ?? '').toLowerCase().contains(q))) d,
    ];
    const filters = ['all', 'live', 'suspended', 'expiring'];
    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(section: AdminSection.domains, onRefresh: _refresh),
        AdminStatStrip(
          maxColumns: 5,
          stats: [
            AdminStat(
              key: const Key('adminDomainsRegistered'),
              label: l10n.adminDomainsRegistered,
              value: '${a.counts.registered}',
              icon: LucideIcons.badgeCheck,
            ),
            AdminStat(label: l10n.adminDomainsConnected, value: '${a.counts.connected}', icon: LucideIcons.link),
            AdminStat(label: l10n.adminDomainsLiveHosts, value: '${a.counts.liveHosts}', icon: LucideIcons.globe),
            AdminStat(
              label: l10n.adminDomainsSuspended,
              value: '${a.counts.suspended}',
              icon: LucideIcons.ban,
              tone: a.counts.suspended > 0 ? AdminTone.negative : null,
              onTap: a.counts.suspended > 0 ? () => setState(() => _filter = 'suspended') : null,
            ),
            AdminStat(
              key: const Key('adminDomainsBalance'),
              label: l10n.adminDomainsBalance,
              value: a.balanceUsd == null ? l10n.adminDomainsBalanceUnknown : usd(a.balanceUsd!),
              icon: LucideIcons.wallet,
            ),
          ],
        ),
        // Orders.
        SectionHeader(title: l10n.adminDomNeedsYou, count: needsYou.isEmpty ? null : '${needsYou.length}'),
        if (needsYou.isEmpty)
          AdminEmptyCard(icon: LucideIcons.circleCheck, message: l10n.adminDomainsNoOrders)
        else
          Column(
            key: const Key('adminDomainsNeedsYou'),
            spacing: AppSpace.sm,
            children: [for (final o in needsYou) _orderCard(o, usd)],
          ),
        if (others.isNotEmpty) ...[
          SectionHeader(title: l10n.adminDomInProgress, count: '${others.length}'),
          Column(spacing: AppSpace.sm, children: [for (final o in others) _orderCard(o, usd)]),
        ],
        // Domains.
        SectionHeader(title: l10n.adminDomainsList, count: '${a.domains.length}'),
        if (a.domains.isEmpty)
          AdminEmptyCard(icon: LucideIcons.globe, message: l10n.adminDomainsNone)
        else ...[
          AdminListToolbar(
            search: AdminSearchField(key: const Key('adminDomainsSearch'), hint: l10n.adminDomSearch, onChanged: (v) => setState(() => _query = v)),
            filters: AdminFilterChips<String>(
              values: filters,
              labels: {
                'all': l10n.adminDomFilterAll,
                'live': l10n.adminDomFilterLive,
                'suspended': l10n.adminDomainsSuspended,
                'expiring': l10n.adminDomFilterExpiring,
              },
              counts: {for (final f in filters) f: a.domains.where((d) => _matches(d, f)).length},
              selected: _filter,
              onSelected: (v) => setState(() => _filter = v),
            ),
          ),
          if (shown.isEmpty)
            AdminEmptyCard(key: const Key('adminDomainsNoMatch'), icon: LucideIcons.searchX, message: l10n.adminDomNoMatch)
          else
            _domainList(shown),
        ],
      ],
    );
  }

  Widget _orderCard(AdminDomainOrder o, String Function(num) usd) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final muted = context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant);
    final failure = o.failure?.trim() ?? '';
    final button = o.needsApproval
        ? FilledButton.icon(
            key: Key('adminDomainApprove-${o.id}'),
            onPressed: () => _order(o, approve: true),
            icon: const Icon(LucideIcons.check, size: 18),
            label: Text(l10n.adminDomainsApprove),
          )
        : OutlinedButton.icon(
            key: Key('adminDomainRetry-${o.id}'),
            onPressed: () => _order(o, approve: false),
            icon: const Icon(LucideIcons.rotateCw, size: 16),
            label: Text(l10n.adminDomainsRetry),
          );
    final meta = Wrap(
      spacing: AppSpace.md,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _IconText(icon: LucideIcons.building2, text: o.orgName ?? l10n.adminDomainsNoWorkspace),
        _IconText(icon: LucideIcons.tag, text: _orderKind(o.kind)),
        if (o.attempts > 0) _IconText(icon: LucideIcons.repeat, text: l10n.adminDomainsAttempts(o.attempts)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.clock, size: 14, color: scheme.onSurfaceVariant),
            const SizedBox(width: 4),
            TimeAgo(o.createdAt, style: muted),
          ],
        ),
      ],
    );
    return AppCard(
      key: Key('adminDomainOrder-${o.id}'),
      padding: const EdgeInsets.all(AppSpace.md),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 560;
          final head = Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: AppSpace.xs,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(o.name, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                    Text(usd(o.priceUsd), style: context.textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant, fontFeatures: AppText.tabular)),
                  ],
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              AdminStatusPill(_orderStatus(o), tone: _orderTone(o)),
            ],
          );
          final body = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              head,
              const SizedBox(height: 6),
              meta,
              if (failure.isNotEmpty) ...[
                const SizedBox(height: AppSpace.xs),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 2), child: Icon(LucideIcons.circleAlert, size: 15, color: scheme.error)),
                    const SizedBox(width: 6),
                    Expanded(child: Text(failure, style: context.textTheme.bodySmall?.copyWith(color: scheme.error))),
                  ],
                ),
              ],
            ],
          );
          if (wide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Expanded(child: body), const SizedBox(width: AppSpace.md), button],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [body, const SizedBox(height: AppSpace.sm), Align(alignment: AlignmentDirectional.centerEnd, child: button)],
          );
        },
      ),
    );
  }

  Widget _domainList(List<AdminDomain> items) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    String kind(AdminDomain d) => d.kind == 'registered' ? l10n.adminDomainsRegistered : l10n.adminDomainsConnected;
    Widget expiry(AdminDomain d) {
      final (text, tone) = _expiry(d);
      final style = tone == null ? muted : muted?.copyWith(color: adminToneColor(context, tone), fontWeight: FontWeight.w600);
      final at = d.expiresAt;
      final label = Text(text, style: style, maxLines: 1, overflow: TextOverflow.ellipsis);
      return at == null ? label : Tooltip(message: at.toLocal().formattedDate(context), child: label);
    }

    Widget status(AdminDomain d) {
      final (text, tone) = _domainStatus(d);
      return AdminStatusPill(text, tone: tone);
    }

    return AdminDataList<AdminDomain>(
      items: items,
      itemKey: (d) => Key('adminDomain-${d.id}'),
      title: (d) => d.name,
      leading: (c, d) => AdminAvatar(d.name, tone: d.suspended ? AdminTone.negative : null),
      subtitle: (c, d) => d.orgName ?? l10n.adminDomainsNoWorkspace,
      badges: (c, d) => [status(d), AdminStatusPill(kind(d)), Padding(padding: const EdgeInsets.only(top: 2), child: expiry(d))],
      trailing: (c, d) => AdminActionsMenu(
        key: Key('adminDomainMenu-${d.id}'),
        actions: [
          AdminMenuAction(
            key: Key('adminDomainSuspend-${d.id}'),
            label: d.suspended ? l10n.adminDomainsUnsuspend : l10n.adminDomainsSuspend,
            icon: d.suspended ? LucideIcons.circleCheck : LucideIcons.ban,
            destructive: !d.suspended,
            onSelected: () => _suspend(d),
          ),
        ],
      ),
      columns: [
        AdminColumn(
          label: l10n.adminDomColDomain,
          flex: 4,
          cell: (c, d) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(d.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(kind(d), style: muted),
            ],
          ),
        ),
        AdminColumn(
          label: l10n.adminDomColWorkspace,
          flex: 3,
          cell: (c, d) => Text(d.orgName ?? l10n.adminDomainsNoWorkspace, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        AdminColumn(label: l10n.adminDomColStatus, flex: 2, cell: (c, d) => status(d)),
        AdminColumn(label: l10n.adminDomColExpires, flex: 3, cell: (c, d) => expiry(d)),
      ],
    );
  }
}

/// "some_raw-value" → "Some raw value".
String _capitalised(String raw) {
  final words = raw.replaceAll(RegExp(r'[_\-]+'), ' ').trim();
  if (words.isEmpty) return raw;
  return words[0].toUpperCase() + words.substring(1);
}

class _IconText extends StatelessWidget {
  const _IconText({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Flexible(child: Text(text, style: context.textTheme.bodySmall?.copyWith(color: color))),
      ],
    );
  }
}
