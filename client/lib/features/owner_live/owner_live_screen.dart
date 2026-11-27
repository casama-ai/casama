import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/backend.dart';
import '../../core/date_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/page.dart';
import '../admin/ui/admin_ui.dart';
import '../../l10n/generated/app_localizations.dart';
import 'owner_live_journey.dart';
import 'owner_live_models.dart';

/// The groups the feed filters by, and which kinds are in each.
enum LiveGroup {
  all({}),
  waitlist({'waitlist_joined', 'waitlist_admitted', 'signup_refused'}),
  accounts({'signup', 'first_chat', 'milestone', 'day2_return', 'week1_return', 'account_deleted'}),
  money({'subscription', 'trial_started', 'renewal', 'subscription_ended', 'refund', 'dispute_opened', 'plan_cancel_failed', 'purchase'}),
  app({'app_first_open', 'app_reinstall', 'signin_started', 'device_gone', 'store_review', 'store_crashes'}),
  website({'download_click', 'qr_open', 'start_click', 'invite_open'}),
  growth({
    'partner_interest',
    'creator_open',
    'partner_claimed',
    'gift_open',
    'comp_redeemed',
    'referral_rewarded',
    'newsletter_confirmed',
    'testimonial_submitted',
  }),
  support({'support_ticket', 'feedback'});

  const LiveGroup(this.kinds);
  final Set<String> kinds;

  String label(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      all => l10n.liveGroupAll,
      waitlist => l10n.liveGroupWaitlist,
      accounts => l10n.liveGroupAccounts,
      money => l10n.liveGroupMoney,
      app => l10n.liveGroupApp,
      website => l10n.liveGroupWebsite,
      growth => l10n.liveGroupGrowth,
      support => l10n.liveGroupSupport,
    };
  }
}

/// The name of a kind of alert, for its switch.
String liveKindLabel(BuildContext context, String kind) {
  final l10n = context.l10n;
  return switch (kind) {
    'waitlist_joined' => l10n.liveKindWaitlistJoined,
    'waitlist_admitted' => l10n.liveKindWaitlistAdmitted,
    'signup' => l10n.liveKindSignup,
    'signup_refused' => l10n.liveKindSignupRefused,
    'first_chat' => l10n.liveKindFirstChat,
    'milestone' => l10n.liveKindMilestone,
    'subscription' => l10n.liveKindSubscription,
    'subscription_ended' => l10n.liveKindSubscriptionEnded,
    'purchase' => l10n.liveKindPurchase,
    'support_ticket' => l10n.liveKindSupportTicket,
    'feedback' => l10n.liveKindFeedback,
    'account_deleted' => l10n.liveKindAccountDeleted,
    'download_click' => l10n.liveKindDownloadClick,
    'qr_open' => l10n.liveKindQrOpen,
    'start_click' => l10n.liveKindStartClick,
    'invite_open' => l10n.liveKindInviteOpen,
    'app_first_open' => l10n.liveKindAppFirstOpen,
    'app_reinstall' => l10n.liveKindAppReinstall,
    'signin_started' => l10n.liveKindSigninStarted,
    'trial_started' => l10n.liveKindTrialStarted,
    'renewal' => l10n.liveKindRenewal,
    'refund' => l10n.liveKindRefund,
    'dispute_opened' => l10n.liveKindDisputeOpened,
    'plan_cancel_failed' => l10n.liveKindPlanCancelFailed,
    'store_review' => l10n.liveKindStoreReview,
    'store_crashes' => l10n.liveKindStoreCrashes,
    'day2_return' => l10n.liveKindDay2Return,
    'week1_return' => l10n.liveKindWeek1Return,
    'device_gone' => l10n.liveKindDeviceGone,
    'partner_interest' => l10n.liveKindPartnerInterest,
    'creator_open' => l10n.liveKindCreatorOpen,
    'partner_claimed' => l10n.liveKindPartnerClaimed,
    'gift_open' => l10n.liveKindGiftOpen,
    'comp_redeemed' => l10n.liveKindCompRedeemed,
    'referral_rewarded' => l10n.liveKindReferralRewarded,
    'newsletter_confirmed' => l10n.liveKindNewsletterConfirmed,
    'testimonial_submitted' => l10n.liveKindTestimonialSubmitted,
    'daily_digest' => l10n.liveDailyDigest,
    _ => kind.replaceAll('_', ' '),
  };
}

IconData liveKindIcon(String kind) => switch (kind) {
  'waitlist_joined' => LucideIcons.listPlus,
  'waitlist_admitted' => LucideIcons.doorOpen,
  'signup' => LucideIcons.userPlus,
  'signup_refused' => LucideIcons.userX,
  'first_chat' => LucideIcons.messageCircle,
  'milestone' => LucideIcons.sparkles,
  'subscription' => LucideIcons.gem,
  'subscription_ended' => LucideIcons.circleMinus,
  'purchase' => LucideIcons.coins,
  'support_ticket' => LucideIcons.lifeBuoy,
  'feedback' => LucideIcons.messageSquareHeart,
  'account_deleted' => LucideIcons.userMinus,
  'download_click' => LucideIcons.download,
  'qr_open' => LucideIcons.qrCode,
  'start_click' => LucideIcons.mousePointerClick,
  'invite_open' => LucideIcons.ticket,
  'app_first_open' => LucideIcons.rocket,
  'app_reinstall' => LucideIcons.rotateCcw,
  'signin_started' => LucideIcons.logIn,
  'trial_started' => LucideIcons.hourglass,
  'renewal' => LucideIcons.repeat,
  'refund' => LucideIcons.undo2,
  'dispute_opened' => LucideIcons.shieldAlert,
  'plan_cancel_failed' => LucideIcons.circleAlert,
  'store_review' => LucideIcons.star,
  'store_crashes' => LucideIcons.bug,
  'day2_return' || 'week1_return' => LucideIcons.calendarCheck,
  'device_gone' => LucideIcons.trash2,
  'partner_interest' => LucideIcons.megaphone,
  'creator_open' => LucideIcons.link,
  'partner_claimed' => LucideIcons.badgeCheck,
  'gift_open' => LucideIcons.gift,
  'comp_redeemed' => LucideIcons.gift,
  'referral_rewarded' => LucideIcons.heartHandshake,
  'newsletter_confirmed' => LucideIcons.mail,
  'testimonial_submitted' => LucideIcons.quote,
  'daily_digest' => LucideIcons.sunrise,
  _ => LucideIcons.activity,
};

/// "now", "5 min", "3 h", else the time or date.
String liveAgo(BuildContext context, DateTime at, DateTime now) {
  final l10n = context.l10n;
  final d = now.difference(at);
  if (d.inSeconds < 45) return l10n.liveNow;
  if (d.inMinutes < 60) return l10n.liveMinutesAgo(d.inMinutes.clamp(1, 59));
  if (d.inHours < 12) return l10n.liveHoursAgo(d.inHours);
  final sameDay = at.year == now.year && at.month == now.month && at.day == now.day;
  return sameDay ? at.formattedTime(context) : at.formattedDate(context);
}

/// Settings → Live activity (D-527, docs/OWNER-ALERTS-PLAN.md): what's happening on Casama Cloud as
/// it happens, for the people who run it, and which kinds of it push to their devices. It sits
/// outside the admin console's lock so it can stay open; addresses are always masked.
class OwnerLiveScreen extends ConsumerStatefulWidget {
  const OwnerLiveScreen({super.key, this.pollEvery = const Duration(seconds: 5), this.journey});

  /// How often the feed asks for new events while the app is in front.
  final Duration pollEvery;

  /// A journey to open at once (a push's `?journey=`, D-537).
  final String? journey;

  @override
  ConsumerState<OwnerLiveScreen> createState() => _OwnerLiveScreenState();
}

class _OwnerLiveScreenState extends ConsumerState<OwnerLiveScreen> {
  static const _page = 50;
  var _tab = 0;
  var _group = LiveGroup.all;
  List<LiveEvent> _items = [];
  Map<String, int> _today = {};
  Object? _error;
  var _loading = true;
  var _loadingOlder = false;
  var _hasOlder = false;

  /// Ids that arrived since the page opened, drawn highlighted for a moment.
  final _fresh = <int>{};
  LiveAlertSettings? _alerts;
  Object? _alertsError;
  Timer? _timer;
  late final AppLifecycleListener _lifecycle;
  var _inFront = true;
  var _now = DateTime.now();

  /// One row per person (their newest step), or every event (D-537). Remembered on this device.
  var _byPerson = true;
  static const _byPersonKey = 'casama.live_by_person';
  final _search = TextEditingController();
  var _query = '';

  Backend get _backend => ref.read(backendProvider);
  List<String>? get _kinds => _group == LiveGroup.all ? null : _group.kinds.toList();

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(
      onStateChange: (s) {
        _inFront = s == AppLifecycleState.resumed;
        if (_inFront) _poll();
      },
    );
    _inFront = SchedulerBinding.instance.lifecycleState == null || SchedulerBinding.instance.lifecycleState == AppLifecycleState.resumed;
    _reload();
    _loadAlerts();
    _timer = Timer.periodic(widget.pollEvery, (_) => _poll());
    unawaited(() async {
      try {
        final v = (await SharedPreferences.getInstance()).getBool(_byPersonKey);
        if (v != null && mounted) setState(() => _byPerson = v);
      } catch (_) {}
    }());
    final journey = widget.journey;
    if (journey != null && journey.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) unawaited(showLiveJourney(context, journeyId: journey));
      });
    }
  }

  void _setByPerson(bool v) {
    setState(() => _byPerson = v);
    unawaited(() async {
      try {
        await (await SharedPreferences.getInstance()).setBool(_byPersonKey, v);
      } catch (_) {}
    }());
  }

  bool _matches(LiveEvent e) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return true;
    final j = e.journey;
    return [e.label, e.title, e.body, j?.country, j?.source, j?.campaign, j?.platform, j?.clickPlatform, e.fact('country')]
        .whereType<String>()
        .any((t) => t.toLowerCase().contains(q));
  }

  /// What the list shows: every event, or each person's newest with how many steps they took.
  List<({LiveEvent event, int steps})> get _rows {
    final shown = _items.where(_matches);
    if (!_byPerson) return [for (final e in shown) (event: e, steps: 1)];
    final order = <String>[];
    final newest = <String, LiveEvent>{};
    final count = <String, int>{};
    for (final e in shown) {
      final key = e.journeyId ?? 'e${e.id}';
      if (!newest.containsKey(key)) {
        order.add(key);
        newest[key] = e;
      }
      count[key] = (count[key] ?? 0) + 1;
    }
    return [for (final k in order) (event: newest[k]!, steps: count[k]!)];
  }

  @override
  void dispose() {
    _search.dispose();
    _timer?.cancel();
    _lifecycle.dispose();
    super.dispose();
  }

  Future<void> _reload() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final a = await _backend.ownerActivity(kinds: _kinds, limit: _page);
      if (!mounted) return;
      setState(() {
        _items = a.items;
        _today = a.today;
        _hasOlder = a.items.length >= _page;
        _fresh.clear();
        _loading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e;
          _loading = false;
        });
      }
    }
  }

  var _polling = false;
  Future<void> _poll() async {
    if (!mounted || !_inFront || _loading || _polling) return;
    _polling = true;
    try {
      final after = _items.isEmpty ? null : _items.first.id;
      final a = await _backend.ownerActivity(after: after, kinds: _kinds, limit: _page);
      if (!mounted) return;
      setState(() {
        _now = DateTime.now();
        _today = a.today;
        _error = null;
        if (a.items.isNotEmpty) {
          final known = {for (final e in _items) e.id};
          final added = [for (final e in a.items) if (!known.contains(e.id)) e];
          _fresh.addAll(added.map((e) => e.id));
          _items = [...added, ..._items];
        }
      });
    } catch (_) {
      // Next tick tries again; the page keeps what it has.
    } finally {
      _polling = false;
    }
  }

  Future<void> _older() async {
    if (_items.isEmpty || _loadingOlder) return;
    setState(() => _loadingOlder = true);
    try {
      final a = await _backend.ownerActivity(before: _items.last.id, kinds: _kinds, limit: _page);
      if (!mounted) return;
      setState(() {
        _items = [..._items, ...a.items];
        _hasOlder = a.items.length >= _page;
      });
    } catch (e) {
      if (mounted) showToast(context, errorText(context, e), kind: ToastKind.error);
    } finally {
      if (mounted) setState(() => _loadingOlder = false);
    }
  }

  Future<void> _loadAlerts() async {
    try {
      final s = await _backend.ownerAlertSettings();
      if (mounted) setState(() => _alerts = s);
    } catch (e) {
      if (mounted) setState(() => _alertsError = e);
    }
  }

  Future<void> _change({bool? paused, Map<String, bool>? kinds}) async {
    final before = _alerts;
    if (before == null) return;
    setState(() => _alerts = before.copyWith(paused: paused, kinds: kinds));
    try {
      final s = await _backend.setOwnerAlertSettings(paused: paused, kinds: kinds);
      if (mounted) setState(() => _alerts = s);
    } catch (e) {
      if (!mounted) return;
      setState(() => _alerts = before);
      showToast(context, errorText(context, e), kind: ToastKind.error);
    }
  }

  Future<void> _test() async {
    final l10n = context.l10n;
    try {
      await _backend.testOwnerAlert();
      if (mounted) showToast(context, l10n.liveTestSent, kind: ToastKind.success);
    } catch (e) {
      if (mounted) showToast(context, errorText(context, e), kind: ToastKind.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SubPage(
      title: l10n.liveActivity,
      backFallback: '/settings',
      actions: [
        IconButton(
          key: const Key('liveRefresh'),
          tooltip: l10n.liveRefresh,
          icon: const Icon(LucideIcons.refreshCw),
          onPressed: _reload,
        ),
      ],
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpace.md),
          child: SegmentedButton<int>(
            key: const Key('liveTabs'),
            showSelectedIcon: false,
            segments: [
              ButtonSegment(value: 0, label: Text(l10n.liveTabActivity), icon: const Icon(LucideIcons.activity, size: 16)),
              ButtonSegment(value: 1, label: Text(l10n.liveTabAlerts), icon: const Icon(LucideIcons.bellRing, size: 16)),
            ],
            selected: {_tab},
            onSelectionChanged: (s) => setState(() => _tab = s.first),
          ),
        ),
        if (_tab == 0) ..._activity(context) else ..._alertSettings(context),
      ],
    );
  }

  List<Widget> _activity(BuildContext context) {
    final l10n = context.l10n;
    int count(Set<String> kinds) => kinds.fold(0, (n, k) => n + (_today[k] ?? 0));
    return [
      _LiveStatus(paused: _alerts?.paused ?? false, onTap: () => setState(() => _tab = 1)),
      // Today's funnel (D-537): each step with its share of the one before.
      AdminStatStrip(
        maxColumns: 5,
        stats: [
          for (final (i, step) in _funnel.indexed)
            AdminStat(
              key: Key('liveFunnel-${step.kind}'),
              label: i == 0 || (_today[_funnel[i - 1].kind] ?? 0) == 0
                  ? step.label(l10n)
                  : l10n.liveFunnelRate(step.label(l10n), ((_today[step.kind] ?? 0) * 100 / _today[_funnel[i - 1].kind]!).round()),
              value: '${_today[step.kind] ?? 0}',
              icon: liveKindIcon(step.kind),
            ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: AppSpace.sm),
        child: AdminFilterChips<LiveGroup>(
          values: LiveGroup.values,
          labels: {for (final g in LiveGroup.values) g: g.label(context)},
          counts: {for (final g in LiveGroup.values) if (g != LiveGroup.all) g: count(g.kinds)},
          selected: _group,
          onSelected: (g) {
            setState(() => _group = g);
            _reload();
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: AppSpace.sm),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                key: const Key('liveSearch'),
                controller: _search,
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(LucideIcons.search, size: 18),
                  hintText: l10n.liveSearch,
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(LucideIcons.x, size: 16),
                          onPressed: () => setState(() {
                            _search.clear();
                            _query = '';
                          }),
                        ),
                ),
              ),
            ),
            const SizedBox(width: AppSpace.sm),
            FilterChip(
              key: const Key('liveByPerson'),
              label: Text(l10n.liveByPerson),
              selected: _byPerson,
              onSelected: _setByPerson,
            ),
          ],
        ),
      ),
      if (_loading && _items.isEmpty)
        const Padding(padding: EdgeInsets.all(AppSpace.xl), child: Center(child: CircularProgressIndicator()))
      else if (_error != null && _items.isEmpty)
        AdminEmptyCard(
          icon: LucideIcons.circleAlert,
          message: errorText(context, _error!),
          action: OutlinedButton(onPressed: _reload, child: Text(l10n.liveRetry)),
        )
      else if (_items.isEmpty)
        AdminEmptyCard(icon: LucideIcons.radio, message: l10n.liveEmpty)
      else if (_rows.isEmpty)
        AdminEmptyCard(icon: LucideIcons.searchX, message: l10n.liveNoMatches)
      else ...[
        GroupedCard(
          dividerIndent: 60,
          children: [
            for (final r in _rows)
              _LiveRow(
                key: ValueKey('live-${r.event.id}'),
                event: r.event,
                steps: r.steps,
                fresh: _fresh.contains(r.event.id),
                now: _now,
                onTap: () => showLiveJourney(context, event: r.event),
              ),
          ],
        ),
        if (_hasOlder)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpace.md),
            child: Center(
              child: TextButton(
                key: const Key('liveOlder'),
                onPressed: _loadingOlder ? null : _older,
                child: Text(l10n.liveOlder),
              ),
            ),
          ),
      ],
      const SizedBox(height: AppSpace.xl),
    ];
  }

  List<Widget> _alertSettings(BuildContext context) {
    final l10n = context.l10n;
    final s = _alerts;
    if (s == null) {
      return [
        if (_alertsError != null)
          AdminEmptyCard(icon: LucideIcons.circleAlert, message: errorText(context, _alertsError!))
        else
          const Padding(padding: EdgeInsets.all(AppSpace.xl), child: Center(child: CircularProgressIndicator())),
      ];
    }
    Widget toggle(String kind) => GroupedTile(
      key: Key('liveKind-$kind'),
      icon: liveKindIcon(kind),
      title: liveKindLabel(context, kind),
      trailing: Switch.adaptive(
        key: Key('liveSwitch-$kind'),
        value: s.isOn(kind),
        onChanged: s.paused ? null : (v) => _change(kinds: {kind: v}),
      ),
    );
    final known = {for (final k in s.kinds) k.kind};
    return [
      Padding(
        padding: const EdgeInsets.only(bottom: AppSpace.sm),
        child: Text(l10n.liveAlertsHelp, style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant)),
      ),
      GroupedCard(
        children: [
          GroupedTile(
            key: const Key('livePauseAll'),
            icon: LucideIcons.bellOff,
            iconColor: context.appColors.warning,
            title: l10n.livePauseAll,
            subtitle: l10n.livePauseAllHelp,
            trailing: Switch.adaptive(key: const Key('livePauseSwitch'), value: s.paused, onChanged: (v) => _change(paused: v)),
          ),
          if (known.contains('daily_digest'))
            GroupedTile(
              key: const Key('liveKind-daily_digest'),
              icon: liveKindIcon('daily_digest'),
              title: l10n.liveDailyDigest,
              subtitle: l10n.liveDailyDigestHelp,
              trailing: Switch.adaptive(
                key: const Key('liveSwitch-daily_digest'),
                value: s.isOn('daily_digest'),
                onChanged: s.paused ? null : (v) => _change(kinds: {'daily_digest': v}),
              ),
            ),
          GroupedTile(
            key: const Key('liveTest'),
            icon: LucideIcons.send,
            title: l10n.liveSendTest,
            subtitle: l10n.liveSendTestHelp,
            onTap: _test,
            showChevron: false,
          ),
        ],
      ),
      for (final g in LiveGroup.values.where((g) => g != LiveGroup.all)) ...[
        SectionHeader(title: g.label(context)),
        GroupedCard(children: [for (final k in g.kinds) if (known.contains(k)) toggle(k)]),
      ],
      Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpace.md),
        child: Text(l10n.liveAlertsFooter, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
      ),
    ];
  }
}

class _LiveStatus extends StatelessWidget {
  const _LiveStatus({required this.paused, required this.onTap});
  final bool paused;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = paused ? context.appColors.warning : context.appColors.positive;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.sm),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: AppSpace.xs),
          Expanded(
            child: Text(
              paused ? l10n.liveStatusPaused : l10n.liveStatusOn,
              style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
            ),
          ),
          if (paused) TextButton(onPressed: onTap, child: Text(l10n.liveTabAlerts)),
        ],
      ),
    );
  }
}

class _LiveRow extends StatelessWidget {
  const _LiveRow({super.key, required this.event, required this.fresh, required this.now, this.steps = 1, this.onTap});
  final LiveEvent event;
  final bool fresh;
  final DateTime now;

  /// How many events of this person the row stands for (grouped by person).
  final int steps;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final journey = event.journey;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      color: fresh ? scheme.primary.withValues(alpha: context.isDark ? 0.14 : 0.07) : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: scheme.primary.withValues(alpha: context.isDark ? 0.2 : 0.12),
                    borderRadius: BorderRadius.circular(AppRadius.icon),
                  ),
                  alignment: Alignment.center,
                  child: Icon(liveKindIcon(event.kind), size: 18, color: scheme.primary),
                ),
                const SizedBox(width: AppSpace.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(event.title, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                      if (event.body.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Text(event.body, style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant, height: 1.3)),
                        ),
                      const SizedBox(height: AppSpace.xxs),
                      Wrap(
                        spacing: AppSpace.xs,
                        runSpacing: AppSpace.xxs,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          if (journey != null) LiveJourneyDots(steps: journey.steps),
                          if (steps > 1) Text(context.l10n.liveSteps(steps), style: context.textTheme.labelSmall?.copyWith(color: scheme.primary)),
                          LiveMetaChips(event: event),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpace.xs),
                Tooltip(
                  message: event.createdAt.formattedExact(context),
                  child: Text(
                    liveAgo(context, event.createdAt, now),
                    style: context.textTheme.labelMedium?.copyWith(color: scheme.onSurfaceVariant, fontFeatures: AppText.tabular),
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

/// Today's funnel, in order: clicked, opened the app, made an account, first chat, paid.
typedef _FunnelStep = ({String kind, String Function(AppLocalizations) label});
final List<_FunnelStep> _funnel = [
  (kind: 'download_click', label: (l) => l.liveFunnelClicks),
  (kind: 'app_first_open', label: (l) => l.liveFunnelOpens),
  (kind: 'signup', label: (l) => l.liveFunnelSignups),
  (kind: 'first_chat', label: (l) => l.liveFunnelChats),
  (kind: 'subscription', label: (l) => l.liveFunnelPaying),
];
