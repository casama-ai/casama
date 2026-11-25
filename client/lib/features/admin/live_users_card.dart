import 'dart:async';
import 'dart:math' as math;

import 'package:casama_sdk/casama_sdk.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/haptics.dart';
import '../../core/number_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/motion.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';
import 'users_tab.dart' show adminUsersJumpProvider;

/// Signed-in people online right now from our own presence table (D-534). Pass `true` to also
/// include team and owner accounts in `people` (customer counts stay unchanged).
final adminLiveOnlineProvider = FutureProvider.family<AdminLiveOnline, bool>(
  (ref, includeTeam) =>
      ref.watch(backendProvider).adminLiveOnline(includeTeam: includeTeam),
);

/// Google Analytics 4 realtime report over the last 30 minutes (D-534).
final adminLiveGa4Provider = FutureProvider<AdminLiveGa4>(
  (ref) => ref.watch(backendProvider).adminLiveGa4(),
);

/// Refreshes both live providers while the Growth section is on screen and the app is in front.
const kAdminLiveRefresh = Duration(seconds: 30);

/// The Live card at the top of the admin console's Growth section (D-534, docs/LIVE-USERS-PLAN.md):
/// our own "Online now" (last 90 s, signed-in customers with a who's-online list) side by side with
/// Google Analytics 4's realtime report (last 30 min, 5-min snapshot, countries, 30-min sparkline).
class LiveUsersCard extends ConsumerStatefulWidget {
  const LiveUsersCard({super.key, this.autoRefresh = true});

  /// Refreshes every 30 s while mounted and in the foreground.
  final bool autoRefresh;

  /// Tests can turn off the pulsing live dot so `pumpAndSettle` completes immediately.
  @visibleForTesting
  static bool disablePulseForTesting = false;

  static bool get _inWidgetTest =>
      WidgetsBinding.instance.runtimeType.toString().contains('Test');

  @override
  ConsumerState<LiveUsersCard> createState() => _LiveUsersCardState();
}

class _LiveUsersCardState extends ConsumerState<LiveUsersCard>
    with WidgetsBindingObserver {
  Timer? _timer;
  bool _foreground = true;
  bool _expanded = false;
  bool _includeTeam = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _foreground = _isForeground(WidgetsBinding.instance.lifecycleState);
    _syncTimer();
  }

  @override
  void didUpdateWidget(LiveUsersCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.autoRefresh != widget.autoRefresh) _syncTimer();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final front = _isForeground(state);
    if (front == _foreground) return;
    _foreground = front;
    _syncTimer();
    if (front) _refreshNow();
  }

  static bool _isForeground(AppLifecycleState? state) =>
      state == null || state == AppLifecycleState.resumed;

  void _syncTimer() {
    _timer?.cancel();
    _timer = null;
    if (!widget.autoRefresh || !_foreground) return;
    _timer = Timer.periodic(kAdminLiveRefresh, (_) {
      if (mounted && _foreground) _refreshNow();
    });
  }

  void _refreshNow() {
    ref.invalidate(adminLiveOnlineProvider);
    ref.invalidate(adminLiveGa4Provider);
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final onlineAsync = ref.watch(adminLiveOnlineProvider(_includeTeam));
    final ga4Async = ref.watch(adminLiveGa4Provider);
    final online = onlineAsync.asData?.value;
    final ga4 = ga4Async.asData?.value;
    final refreshing = onlineAsync.isRefreshing || ga4Async.isRefreshing;
    final scheme = context.colorScheme;
    final hairline = context.appColors.hairline;
    final liveColor = adminToneColor(context, AdminTone.positive);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.md),
      child: AppCard(
        key: const Key('growthLiveCard'),
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header strip: pulsing emerald dot, Live title, refresh cadence + instant refresh.
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpace.md,
                AppSpace.sm,
                AppSpace.xs,
                AppSpace.sm,
              ),
              child: Row(
                children: [
                  _LiveDot(
                    color: liveColor,
                    active:
                        (online?.onlineNow ?? 0) > 0 ||
                        (ga4?.activeUsers ?? 0) > 0,
                  ),
                  const SizedBox(width: AppSpace.xs),
                  Text(
                    l10n.adminLiveTitle,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(width: AppSpace.xs),
                  Expanded(
                    child: Text(
                      l10n.adminLiveAutoRefresh,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  IconButton(
                    key: const Key('liveRefreshButton'),
                    tooltip: l10n.adminLiveRefresh,
                    visualDensity: VisualDensity.compact,
                    onPressed: refreshing
                        ? null
                        : () {
                            HapticsHelper.light();
                            _refreshNow();
                          },
                    icon: refreshing
                        ? SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: scheme.onSurfaceVariant,
                            ),
                          )
                        : Icon(
                            LucideIcons.refreshCw,
                            size: 16,
                            color: scheme.onSurfaceVariant,
                          ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: hairline),

            // Dual hero metrics: Ours ("Online now") beside GA4 ("Last 30 min").
            Padding(
              padding: const EdgeInsets.all(AppSpace.md),
              child: LayoutBuilder(
                builder: (context, box) {
                  final left = _OnlineNowPanel(async: onlineAsync);
                  final right = _Ga4Panel(async: ga4Async);
                  if (box.maxWidth >= 560) {
                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: left),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpace.md,
                            ),
                            child: VerticalDivider(
                              width: 1,
                              thickness: 1,
                              color: hairline,
                            ),
                          ),
                          Expanded(child: right),
                        ],
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      left,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpace.md,
                        ),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: hairline,
                        ),
                      ),
                      right,
                    ],
                  );
                },
              ),
            ),

            // 30-minute GA4 sparkline when configured and available.
            if (ga4 != null &&
                ga4.configured &&
                ga4.error == null &&
                ga4.byMinute.isNotEmpty) ...[
              Divider(height: 1, thickness: 1, color: hairline),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpace.md,
                  AppSpace.sm,
                  AppSpace.md,
                  AppSpace.md,
                ),
                child: _Ga4Sparkline(minutes: ga4.byMinute),
              ),
            ],

            // Expandable "Who's online" roster (up to 50 signed-in users, with optional team toggle).
            if (online != null &&
                (online.people.isNotEmpty || online.teamOnline > 0)) ...[
              Divider(height: 1, thickness: 1, color: hairline),
              _WhosOnlineSection(
                online: online,
                expanded: _expanded,
                includeTeam: _includeTeam,
                onToggle: () {
                  HapticsHelper.selection();
                  setState(() => _expanded = !_expanded);
                },
                onToggleIncludeTeam: () {
                  HapticsHelper.selection();
                  setState(() {
                    _includeTeam = !_includeTeam;
                    if (_includeTeam) _expanded = true;
                  });
                },
                onOpenPerson: AdminNav.maybeOf(context) == null
                    ? null
                    : (person) {
                        HapticsHelper.selection();
                        final query = (person.email?.trim().isNotEmpty == true)
                            ? person.email!.trim()
                            : person.userId;
                        ref.read(adminUsersJumpProvider.notifier).set(query);
                        AdminNav.open(context, AdminSection.users);
                      },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LiveDot extends StatelessWidget {
  const _LiveDot({required this.color, required this.active});
  final Color color;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final dot = SizedBox(
      width: 16,
      height: 16,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: color.withValues(alpha: active ? 0.22 : 0.12),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
    if (!active ||
        LiveUsersCard.disablePulseForTesting ||
        LiveUsersCard._inWidgetTest ||
        MediaQuery.disableAnimationsOf(context)) {
      return dot;
    }
    return Pulse(
      from: 0.88,
      to: 1.12,
      fadeFrom: 0.65,
      duration: const Duration(milliseconds: 1200),
      child: dot,
    );
  }
}

class _OnlineNowPanel extends StatelessWidget {
  const _OnlineNowPanel({required this.async});
  final AsyncValue<AdminLiveOnline> async;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final scheme = context.colorScheme;
    final data = async.asData?.value;

    return Column(
      key: const Key('liveOnlinePanel'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              LucideIcons.radio,
              size: 15,
              color: adminToneColor(context, AdminTone.positive),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                l10n.adminLiveOnlineNow,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: AppSpace.xs),
            _MetaTag(l10n.adminLiveWindow(data?.windowSeconds ?? 90)),
          ],
        ),
        const SizedBox(height: AppSpace.xs),
        if (data == null && async.isLoading)
          const _HeroSkeleton()
        else if (data == null)
          Text(
            l10n.adminLiveUnavailable,
            style: context.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          )
        else ...[
          Text(
            data.onlineNow.humanizedCount(locale),
            key: const Key('liveOnlineCount'),
            style: context.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              fontFeatures: AppText.tabular,
              height: 1.05,
              color: data.onlineNow > 0
                  ? adminToneColor(context, AdminTone.positive)
                  : scheme.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _activityLine(context, data),
            style: context.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
          if (data.teamOnline > 0) ...[
            const SizedBox(height: 2),
            Text(
              l10n.adminLiveTeamOnline(data.teamOnline),
              style: context.textTheme.labelSmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ],
          if (data.byPlatform.isNotEmpty) ...[
            const SizedBox(height: AppSpace.sm),
            _PlatformPills(platforms: data.byPlatform),
          ],
        ],
      ],
    );
  }

  String _activityLine(BuildContext context, AdminLiveOnline data) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    if (data.onlineNow == 0) return l10n.adminLiveNobodyOnline;
    final browsing = math.max(0, data.onlineNow - data.inChat);
    if (data.inChat > 0 && browsing > 0) {
      return l10n.adminLiveInChatAndBrowsing(
        data.inChat.humanizedCount(locale),
        browsing.humanizedCount(locale),
      );
    }
    if (data.inChat > 0) return l10n.adminLiveInChatOnly(data.inChat);
    return l10n.adminLiveBrowsingOnly(browsing);
  }
}

class _Ga4Panel extends StatelessWidget {
  const _Ga4Panel({required this.async});
  final AsyncValue<AdminLiveGa4> async;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final scheme = context.colorScheme;
    final data = async.asData?.value;

    return Column(
      key: const Key('liveGa4Panel'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              LucideIcons.chartLine,
              size: 15,
              color: adminToneColor(context, AdminTone.info),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                l10n.adminLiveGa4Title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: AppSpace.xs),
            _MetaTag(l10n.adminLiveGa4Badge),
          ],
        ),
        const SizedBox(height: AppSpace.xs),
        if (data == null && async.isLoading)
          const _HeroSkeleton()
        else if (data == null)
          Text(
            l10n.adminLiveUnavailable,
            style: context.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          )
        else if (!data.configured)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  LucideIcons.info,
                  size: 15,
                  color: scheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    l10n.adminLiveGa4Unconfigured,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          )
        else if (data.error != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              AdminStatusPill(
                l10n.adminLiveGa4Error,
                tone: AdminTone.warning,
                icon: LucideIcons.triangleAlert,
              ),
              const SizedBox(height: 6),
              Text(
                data.error!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          )
        else ...[
          Wrap(
            spacing: AppSpace.sm,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                data.activeUsers.humanizedCount(locale),
                key: const Key('liveGa4Count'),
                style: context.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontFeatures: AppText.tabular,
                  height: 1.05,
                ),
              ),
              AdminStatusPill(
                l10n.adminLiveGa4Last5m(
                  data.activeUsers5m.humanizedCount(locale),
                ),
                tone: data.activeUsers5m > 0
                    ? AdminTone.info
                    : AdminTone.neutral,
              ),
            ],
          ),
          if (data.byPlatform.isNotEmpty) ...[
            const SizedBox(height: AppSpace.sm),
            _PlatformPills(platforms: data.byPlatform),
          ],
          if (data.byCountry.isNotEmpty) ...[
            const SizedBox(height: AppSpace.xs),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    LucideIcons.globe,
                    size: 13,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    data.byCountry
                        .take(5)
                        .map(
                          (c) =>
                              '${c.country} ${c.users.humanizedCount(locale)}',
                        )
                        .join(' · '),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontFeatures: AppText.tabular,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ],
    );
  }
}

class _HeroSkeleton extends StatelessWidget {
  const _HeroSkeleton();

  @override
  Widget build(BuildContext context) {
    final fill = context.colorScheme.surfaceContainerHighest;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 72,
          height: 34,
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 148,
          height: 14,
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }
}

class _MetaTag extends StatelessWidget {
  const _MetaTag(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: scheme.onSurfaceVariant,
          fontFeatures: AppText.tabular,
        ),
      ),
    );
  }
}

class _PlatformPills extends StatelessWidget {
  const _PlatformPills({required this.platforms});
  final List<AdminLivePlatform> platforms;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    final scheme = context.colorScheme;
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final p in platforms)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _platformIcon(p.platform),
                  size: 13,
                  color: scheme.onSurfaceVariant,
                ),
                const SizedBox(width: 5),
                Text(
                  _platformLabel(p.platform),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  p.users.humanizedCount(locale),
                  style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFeatures: AppText.tabular,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

IconData _platformIcon(String platform) => switch (platform.toLowerCase()) {
  'ios' || 'android' => LucideIcons.smartphone,
  'web' => LucideIcons.globe,
  'macos' || 'windows' || 'linux' => LucideIcons.laptop,
  _ => LucideIcons.monitor,
};

String _platformLabel(String platform) => switch (platform.toLowerCase()) {
  'ios' => 'iOS',
  'android' => 'Android',
  'web' => 'Web',
  'macos' => 'macOS',
  'windows' => 'Windows',
  'linux' => 'Linux',
  'unknown' => 'Other',
  final s => s.isEmpty ? 'Other' : '${s[0].toUpperCase()}${s.substring(1)}',
};

class _Ga4Sparkline extends StatelessWidget {
  const _Ga4Sparkline({required this.minutes});
  final List<int> minutes;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final scheme = context.colorScheme;
    final accent = adminToneColor(context, AdminTone.info);
    final peak = minutes.fold<int>(0, math.max);
    final maxY = math.max(peak, 1).toDouble();
    final muted = context.textTheme.labelSmall?.copyWith(
      color: scheme.onSurfaceVariant,
      fontFeatures: AppText.tabular,
    );
    final tipStyle = context.textTheme.labelMedium!.copyWith(
      color: scheme.onInverseSurface,
      fontFeatures: AppText.tabular,
    );

    return Column(
      key: const Key('liveGa4Sparkline'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text(l10n.adminLiveSparklineTitle, style: muted)),
            if (peak > 0)
              Text(
                l10n.adminLiveSparklinePeak(peak.humanizedCount(locale)),
                style: muted,
              ),
          ],
        ),
        const SizedBox(height: AppSpace.xs),
        SizedBox(
          height: 64,
          child: LayoutBuilder(
            builder: (context, box) {
              final slot = box.maxWidth / math.max(minutes.length, 1);
              final barWidth = (slot * 0.62).clamp(3.0, 14.0);
              return BarChart(
                BarChartData(
                  minY: 0,
                  maxY: maxY,
                  alignment: BarChartAlignment.spaceBetween,
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(
                    topTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                    leftTitles: AxisTitles(),
                    bottomTitles: AxisTitles(),
                  ),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => scheme.inverseSurface,
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      getTooltipItem: (group, _, _, _) {
                        final ago = minutes.length - 1 - group.x;
                        final when = ago == 0
                            ? l10n.adminLiveSparklineJustNow
                            : l10n.adminLiveSparklineMinAgo(ago);
                        return BarTooltipItem(
                          l10n.adminLiveSparklineTip(
                            minutes[group.x].humanizedCount(locale),
                            when,
                          ),
                          tipStyle.copyWith(fontWeight: FontWeight.w600),
                        );
                      },
                    ),
                  ),
                  barGroups: [
                    for (var i = 0; i < minutes.length; i++)
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: minutes[i] == 0
                                ? 0.04 * maxY
                                : minutes[i].toDouble(),
                            width: barWidth,
                            color: minutes[i] == 0
                                ? scheme.surfaceContainerHighest
                                : (i >= minutes.length - 5
                                      ? accent
                                      : accent.withValues(alpha: 0.45)),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(math.min(3, barWidth / 2)),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.adminLiveSparkline30m, style: muted),
            Text(l10n.adminLiveSparkline15m, style: muted),
            Text(
              l10n.adminLiveSparklineNow,
              style: muted?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}

class _WhosOnlineSection extends StatelessWidget {
  const _WhosOnlineSection({
    required this.online,
    required this.expanded,
    required this.includeTeam,
    required this.onToggle,
    required this.onToggleIncludeTeam,
    this.onOpenPerson,
  });

  final AdminLiveOnline online;
  final bool expanded;
  final bool includeTeam;
  final VoidCallback onToggle;
  final VoidCallback onToggleIncludeTeam;
  final ValueChanged<AdminLivePerson>? onOpenPerson;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final hairline = context.appColors.hairline;
    final preview = online.people.take(4).toList();
    final total = includeTeam
        ? online.onlineNow + online.teamOnline
        : online.onlineNow;

    final toggleHeader = InkWell(
      key: const Key('liveOnlineToggle'),
      onTap: online.people.isEmpty ? null : onToggle,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(AppSpace.md, 10, AppSpace.md, 10),
        child: Row(
          children: [
            if (preview.isNotEmpty)
              SizedBox(
                width: 24 + math.max(0, preview.length - 1) * 16,
                height: 24,
                child: Stack(
                  children: [
                    for (var i = 0; i < preview.length; i++)
                      Positioned(
                        left: i * 16.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.icon),
                            border: Border.all(
                              color: scheme.surface,
                              width: 1.5,
                            ),
                          ),
                          child: AdminAvatar(
                            _personLabel(preview[i]),
                            size: 22,
                            tone: preview[i].team == true
                                ? AdminTone.neutral
                                : AdminTone.positive,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            else
              Icon(LucideIcons.users, size: 16, color: scheme.onSurfaceVariant),
            const SizedBox(width: AppSpace.sm),
            Flexible(
              child: Text(
                l10n.adminLiveWhosOnline,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: AppSpace.xs),
            _MetaTag(
              total > online.people.length
                  ? l10n.adminLiveShowingFirst(online.people.length, total)
                  : '${online.people.length}',
            ),
            if (online.people.isNotEmpty) ...[
              const SizedBox(width: AppSpace.xs),
              Icon(
                expanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
                size: 18,
                color: scheme.onSurfaceVariant,
              ),
            ],
          ],
        ),
      ),
    );
    final teamToggle = online.teamOnline > 0
        ? AdminChip(
            key: const Key('liveIncludeTeamToggle'),
            label: l10n.adminLiveIncludeTeam,
            count: online.teamOnline,
            icon: LucideIcons.badgeCheck,
            selected: includeTeam,
            onTap: onToggleIncludeTeam,
          )
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, box) {
            if (teamToggle == null) return toggleHeader;
            if (box.maxWidth >= 460) {
              return Row(
                children: [
                  Expanded(child: toggleHeader),
                  Padding(
                    padding: const EdgeInsets.only(right: AppSpace.sm),
                    child: teamToggle,
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                toggleHeader,
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpace.md,
                    0,
                    AppSpace.md,
                    10,
                  ),
                  child: teamToggle,
                ),
              ],
            );
          },
        ),
        if (expanded && online.people.isNotEmpty) ...[
          Divider(height: 1, thickness: 1, color: hairline),
          Column(
            key: const Key('liveOnlineList'),
            children: [
              for (var i = 0; i < online.people.length; i++) ...[
                if (i > 0)
                  Divider(height: 1, thickness: 1, indent: 56, color: hairline),
                _OnlinePersonRow(
                  person: online.people[i],
                  now: online.fetchedAt,
                  onTap: onOpenPerson == null
                      ? null
                      : () => onOpenPerson!(online.people[i]),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}

class _OnlinePersonRow extends StatelessWidget {
  const _OnlinePersonRow({required this.person, required this.now, this.onTap});
  final AdminLivePerson person;
  final DateTime now;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final name = person.displayName?.trim();
    final email = person.email?.trim();
    final primary = (name != null && name.isNotEmpty)
        ? name
        : ((email != null && email.isNotEmpty) ? email : person.userId);
    final secondary =
        (name != null && name.isNotEmpty && email != null && email.isNotEmpty)
        ? email
        : null;
    final liveColor = adminToneColor(context, AdminTone.positive);
    final durationText = _presenceDuration(context, person, now);
    final isTeam = person.team == true;

    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.md,
        vertical: 10,
      ),
      child: LayoutBuilder(
        builder: (context, box) {
          final avatar = Stack(
            clipBehavior: Clip.none,
            children: [
              AdminAvatar(
                primary,
                size: 32,
                tone: isTeam
                    ? AdminTone.neutral
                    : (person.inChat ? AdminTone.positive : AdminTone.info),
              ),
              Positioned(
                right: -1,
                bottom: -1,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: liveColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: scheme.surface, width: 1.5),
                  ),
                ),
              ),
            ],
          );
          final identity = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                primary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (secondary != null)
                Text(
                  secondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
            ],
          );
          final teamPill = isTeam
              ? AdminStatusPill(
                  l10n.adminUsersTeam,
                  tone: AdminTone.neutral,
                  icon: LucideIcons.badgeCheck,
                )
              : null;
          final statusPill = AdminStatusPill(
            person.inChat
                ? l10n.adminLiveStatusInChat
                : l10n.adminLiveStatusInApp,
            tone: person.inChat ? AdminTone.positive : AdminTone.neutral,
            icon: person.inChat
                ? LucideIcons.messageSquare
                : LucideIcons.appWindow,
          );
          final platformTag = _MetaTag(
            person.devices > 1
                ? '${_platformLabel(person.platform)} ×${person.devices}'
                : _platformLabel(person.platform),
          );
          final duration = Text(
            durationText,
            style: context.textTheme.labelSmall?.copyWith(
              color: scheme.onSurfaceVariant,
              fontFeatures: AppText.tabular,
            ),
          );
          final chevron = onTap == null
              ? null
              : Icon(
                  LucideIcons.chevronRight,
                  size: 16,
                  color: scheme.onSurfaceVariant,
                );
          if (box.maxWidth >= 540) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avatar,
                const SizedBox(width: AppSpace.sm),
                Expanded(child: identity),
                const SizedBox(width: AppSpace.sm),
                if (teamPill != null) ...[teamPill, const SizedBox(width: 6)],
                statusPill,
                const SizedBox(width: 6),
                platformTag,
                const SizedBox(width: AppSpace.sm),
                duration,
                if (chevron != null) ...[const SizedBox(width: 4), chevron],
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  avatar,
                  const SizedBox(width: AppSpace.sm),
                  Expanded(child: identity),
                  const SizedBox(width: AppSpace.xs),
                  duration,
                  if (chevron != null) ...[const SizedBox(width: 4), chevron],
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 44, top: 6),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [?teamPill, statusPill, platformTag],
                ),
              ),
            ],
          );
        },
      ),
    );
    if (onTap == null) return content;
    return InkWell(
      key: Key('livePerson-${person.userId}'),
      onTap: onTap,
      child: content,
    );
  }
}

String _personLabel(AdminLivePerson p) {
  final n = p.displayName?.trim();
  if (n != null && n.isNotEmpty) return n;
  final e = p.email?.trim();
  if (e != null && e.isNotEmpty) return e;
  return p.userId;
}

String _presenceDuration(
  BuildContext context,
  AdminLivePerson person,
  DateTime now,
) {
  final l10n = context.l10n;
  final since = person.onlineSince;
  if (since != null) {
    final diff = now.difference(since);
    if (diff.inSeconds < 60) {
      return l10n.adminLiveOnlineFor(l10n.adminLiveJustNow);
    }
    return l10n.adminLiveOnlineFor(_shortDuration(diff));
  }
  final seen = now.difference(person.lastSeenAt);
  if (seen.inSeconds < 10) return l10n.adminLiveJustNow;
  return l10n.adminLiveSeenAgo(_shortDuration(seen));
}

String _shortDuration(Duration d) {
  final secs = math.max(0, d.inSeconds);
  if (secs < 60) return '${secs}s';
  final mins = d.inMinutes;
  if (mins < 60) return '${mins}m';
  final hours = d.inHours;
  final remMins = mins % 60;
  return remMins == 0 ? '${hours}h' : '${hours}h ${remMins}m';
}
