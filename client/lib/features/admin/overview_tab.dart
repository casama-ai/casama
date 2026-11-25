import 'vendors_tab.dart';
import 'admin_attention.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/display_text.dart';
import '../../core/number_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/motion.dart';
import '../../ui/app_card.dart';
import 'capacity_card.dart';
import 'inactivity_card.dart';
import 'live_users_card.dart' show adminLiveOnlineProvider;
import 'costs/spend_card.dart';
import 'admin_nav.dart';
import 'admin_search.dart';
import 'ui/admin_ui.dart';

final adminOverviewProvider = FutureProvider<AdminOverview?>((ref) async {
  final signedIn = ref.watch(signedInProvider).value ?? false;
  if (!signedIn) return null;
  return ref.watch(backendProvider).adminOverview();
});

final adminUpdatesProvider = FutureProvider<UpdateNotice>((r) => r.watch(backendProvider).adminUpdates());

class OverviewTab extends ConsumerWidget {
  const OverviewTab({super.key, this.sectionList});

  /// On a phone the overview is the console's home: the sections are listed under it.
  final Widget? sectionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final updates = ref.watch(adminUpdatesProvider);
    final liveOnline = ref.watch(adminLiveOnlineProvider(false)).asData?.value;
    return AsyncView(
      value: ref.watch(adminOverviewProvider),
      onRetry: () => ref.invalidate(adminOverviewProvider),
      loading: const _OverviewSkeleton(),
      data: (o) {
        if (o == null) return EmptyState(icon: LucideIcons.lock, message: l10n.notInstanceOwner);
        final u = updates.value;
        void open(AdminSection s) => AdminNav.open(context, s);
        return AdminSectionList(
          onRefresh: () async {
            ref.invalidate(adminOverviewProvider);
            ref.invalidate(adminLiveOnlineProvider);
            ref.invalidate(adminUpdatesProvider);
            ref.invalidate(adminVendorsProvider);
            ref.invalidate(adminAttentionCountsProvider);
            await ref.read(adminOverviewProvider.future);
          },
          children: [
            AdminSectionHeader(section: AdminSection.overview, summary: l10n.casamaVersion(o.version)),
            // The update check answers after the overview: the notice slides in above the rest.
            ShowHide(
              child: u == null || !u.updateAvailable
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(bottom: AppSpace.md),
                      child: AppCard(
                        key: const Key('updateNotice'),
                        borderColor: context.colorScheme.primary.withValues(alpha: 0.45),
                        child: Row(
                          children: [
                            Icon(LucideIcons.arrowDownToLine, color: context.colorScheme.primary),
                            const SizedBox(width: AppSpace.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.updateAvailable(u.latest.orPlaceholder(), u.current), style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                                  if (u.url.isUsable) SelectableText(u.url!, style: context.textTheme.bodySmall),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            _Attention(overview: o),
            AdminStatStrip(
              stats: [
                AdminStat(
                  key: const Key('overviewOnlineNow'),
                  icon: LucideIcons.radio,
                  label: l10n.adminLiveOnlineNow,
                  value: liveOnline == null ? '–' : liveOnline.onlineNow.humanizedCount(locale),
                  tone: (liveOnline?.onlineNow ?? 0) > 0 ? AdminTone.positive : null,
                  onTap: () => open(AdminSection.growth),
                ),
                AdminStat(icon: LucideIcons.user, label: l10n.adminUsers, value: o.users.humanizedCount(locale), onTap: () => open(AdminSection.users)),
                AdminStat(icon: LucideIcons.boxes, label: l10n.adminWorkspaces, value: o.orgs.humanizedCount(locale), onTap: () => open(AdminSection.workspaces)),
                AdminStat(icon: LucideIcons.bot, label: l10n.bots, value: o.bots.humanizedCount(locale)),
                AdminStat(icon: LucideIcons.banknote, label: l10n.cost24h, value: formatUsd(o.cost24hUsd, locale), onTap: () => open(AdminSection.costs)),
                AdminStat(icon: LucideIcons.circlePlay, label: l10n.runs24h, value: o.runs24h.humanizedCount(locale), tone: AdminTone.info),
                AdminStat(
                  icon: LucideIcons.circleAlert,
                  label: l10n.failedRuns24h,
                  value: o.failedRuns24h.humanizedCount(locale),
                  tone: o.failedRuns24h > 0 ? AdminTone.negative : AdminTone.positive,
                ),
                AdminStat(icon: LucideIcons.monitor, label: l10n.computersRunning, value: o.computersRunning.humanizedCount(locale)),
                AdminStat(icon: LucideIcons.monitorSmartphone, label: l10n.devicesOnline, value: o.devicesOnline.humanizedCount(locale)),
              ],
            ),
            if (sectionList != null) ...[sectionList!, const SizedBox(height: AppSpace.md)],
            // Spent, charged and margin at a glance; the Costs section has the rest.
            CostSpendCard(onOpen: () => open(AdminSection.costs)),
            const AdminAnchor(id: AdminAnchors.capacity, child: CapacityCard()),
            const AdminAnchor(id: AdminAnchors.inactivity, child: InactivityCard()),
          ],
        );
      },
    );
  }
}

/// One row of "Needs attention".
class _Item {
  const _Item({required this.key, required this.icon, required this.title, required this.tone, this.section});
  final String key;
  final IconData icon;
  final String title;
  final AdminTone tone;
  final AdminSection? section;
}

/// What's waiting, at the top of the overview, each row opening its section. Nothing waiting:
/// one calm line instead.
class _Attention extends ConsumerWidget {
  const _Attention({required this.overview});
  final AdminOverview overview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final badges = ref.watch(adminBadgesProvider);
    int count(AdminSection s) => badges[s]!.count;
    final items = [
      if (badges[AdminSection.vendors] != null)
        _Item(key: 'vendors', icon: LucideIcons.gauge, title: l10n.adminAttentionVendors(badges[AdminSection.vendors]!.count), tone: badges[AdminSection.vendors]!.tone, section: AdminSection.vendors),
      if (overview.failedRuns24h > 0)
        _Item(key: 'runs', icon: LucideIcons.circleAlert, title: l10n.adminAttentionFailedRuns(overview.failedRuns24h.toInt()), tone: AdminTone.negative),
      if (badges[AdminSection.support] != null)
        _Item(key: 'support', icon: LucideIcons.lifeBuoy, title: l10n.adminAttentionTickets(count(AdminSection.support)), tone: badges[AdminSection.support]!.tone, section: AdminSection.support),
      if (badges[AdminSection.reports] != null)
        _Item(key: 'reports', icon: LucideIcons.flag, title: l10n.adminAttentionReports(count(AdminSection.reports)), tone: badges[AdminSection.reports]!.tone, section: AdminSection.reports),
      if (badges[AdminSection.abuse] != null)
        _Item(key: 'abuse', icon: LucideIcons.shieldAlert, title: l10n.adminAttentionAbuse(count(AdminSection.abuse)), tone: badges[AdminSection.abuse]!.tone, section: AdminSection.abuse),
      if (badges[AdminSection.waitlist] != null)
        _Item(key: 'waitlist', icon: LucideIcons.listOrdered, title: l10n.adminAttentionWaitlist(count(AdminSection.waitlist)), tone: badges[AdminSection.waitlist]!.tone, section: AdminSection.waitlist),
      if (badges[AdminSection.domains] != null)
        _Item(key: 'domains', icon: LucideIcons.globe, title: l10n.adminAttentionDomains(count(AdminSection.domains)), tone: badges[AdminSection.domains]!.tone, section: AdminSection.domains),
    ];
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSpace.md),
        child: AppCard(
          key: const Key('adminAllClear'),
          child: Row(
            children: [
              Icon(LucideIcons.circleCheck, color: context.appColors.positive),
              const SizedBox(width: AppSpace.sm),
              Expanded(child: Text(l10n.adminAllClear, style: context.textTheme.bodyMedium)),
            ],
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.adminNeedsAttention, count: '${items.length}', padding: const EdgeInsets.fromLTRB(AppSpace.xxs, 0, AppSpace.xxs, AppSpace.xs)),
        GroupedCard(
          children: [
            for (final i in items)
              GroupedTile(
                key: Key('adminAttention-${i.key}'),
                icon: i.icon,
                iconColor: adminToneColor(context, i.tone),
                title: i.title,
                onTap: i.section == null ? null : () => AdminNav.open(context, i.section!),
              ),
          ],
        ),
        const SizedBox(height: AppSpace.md),
      ],
    );
  }
}

/// The overview before it loads: the header line and the grid of stat tiles in the same columns.
class _OverviewSkeleton extends StatelessWidget {
  const _OverviewSkeleton();

  @override
  Widget build(BuildContext context) {
    final text = context.textTheme;
    final stat = SkeletonCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SkeletonText(style: text.bodySmall, widthFactor: 0.6),
          const SizedBox(height: 4),
          SkeletonText(style: text.titleLarge?.copyWith(fontWeight: FontWeight.w800, height: 1.1), widthFactor: 0.4),
        ],
      ),
    );
    return SkeletonPage(
      children: [
        SkeletonText(style: text.bodyMedium, widthFactor: 0.35),
        const SizedBox(height: AppSpace.md),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 560 ? 4 : (constraints.maxWidth >= 380 ? 3 : 2);
            const count = 8;
            return Column(
              spacing: AppSpace.sm,
              children: [
                for (var r = 0; r < count; r += columns)
                  Row(
                    spacing: AppSpace.sm,
                    children: [
                      for (var c = r; c < r + columns; c++) Expanded(child: c < count ? stat : const SizedBox()),
                    ],
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
