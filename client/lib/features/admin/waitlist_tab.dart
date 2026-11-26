import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart'
    show
        CreateInviteCampaignRequest,
        InviteCampaign,
        SignupGateModeEnum,
        UpdateInviteCampaignRequest,
        WaitlistEntry,
        WaitlistEntryStatusEnum,
        WaitlistStats,
        WaitlistStatsBySourceInner;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/backend.dart';
import '../../core/date_format.dart';
import '../../core/display_text.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'admin_search.dart';
import 'ui/admin_ui.dart';

/// One page of the list: the search text, the status filter (null for all) and how many rows.
typedef AdminWaitlistQuery = ({String query, String? status, int limit});

final adminWaitlistProvider = FutureProvider.autoDispose.family<AdminWaitlist, AdminWaitlistQuery>(
  (r, q) => r.watch(backendProvider).adminWaitlist(query: q.query, status: q.status, limit: q.limit),
);

final adminInviteCampaignsProvider = FutureProvider.autoDispose<List<InviteCampaign>>(
  (r) => r.watch(backendProvider).adminInviteCampaigns(),
);

/// Where a waitlist entry came from, in words: the raw `source` the website or app sent.
String waitlistSourceLabel(BuildContext context, String? raw) {
  final l10n = context.l10n;
  final s = raw?.trim() ?? '';
  return switch (s) {
    '' => l10n.adminWlSrcUnknown,
    'waitlist' => l10n.adminWlSrcPage,
    'home' => l10n.adminWlSrcHome,
    'download' => l10n.adminWlSrcDownload,
    'invite' => l10n.adminWlSrcInvite,
    'app_ios' => l10n.adminWlSrcIos,
    'app_android' => l10n.adminWlSrcAndroid,
    'app_macos' || 'app_mac' => l10n.adminWlSrcMac,
    'app_windows' => l10n.adminWlSrcWindows,
    'app_linux' => l10n.adminWlSrcLinux,
    'app_web' => l10n.adminWlSrcWeb,
    'app' => l10n.adminWlSrcApp,
    'admin' || 'hand' || 'manual' => l10n.adminWlSrcAdmin,
    _ => _capitalised(s),
  };
}

/// How an entry was let in, in words: the raw `admitted_via` ('auto', 'campaign:CODE', ...).
String? waitlistViaLabel(BuildContext context, String? raw) {
  final l10n = context.l10n;
  final v = raw?.trim() ?? '';
  if (v.isEmpty) return null;
  if (v == 'auto') return l10n.adminWlViaBatch;
  if (v == 'batch' || v == 'admin') return l10n.adminWlViaHand;
  if (v.startsWith('campaign:')) return l10n.adminWlViaCampaign(v.substring('campaign:'.length));
  if (v.startsWith('invite:')) return l10n.adminWlViaInvite;
  if (v.startsWith('one_time:')) return l10n.adminWlViaOneTime;
  return _capitalised(v);
}

/// "some_raw-value" → "Some raw value".
String _capitalised(String raw) {
  final words = raw.replaceAll(RegExp(r'[_\-:]+'), ' ').trim();
  if (words.isEmpty) return raw;
  return words[0].toUpperCase() + words.substring(1);
}

/// Admin console > Waitlist (D-427, WAITLIST-PLAN §11 Phase 2): the numbers that decide an admit,
/// **Admit** the next in line, add addresses by hand, the sign-up gate and its settings, campaign
/// codes, and the people on the list with search, filters and paging. Switching the gate, admitting
/// and removing ask first.
class AdminWaitlistTab extends ConsumerStatefulWidget {
  const AdminWaitlistTab({super.key});

  @override
  ConsumerState<AdminWaitlistTab> createState() => _AdminWaitlistTabState();
}

class _AdminWaitlistTabState extends ConsumerState<AdminWaitlistTab> {
  static const _page = 50;
  final _search = TextEditingController();
  Timer? _debounce;

  /// What's typed (filters the loaded rows at once) and what was sent to the server.
  var _typed = '';
  var _query = '';
  var _status = 'all';
  var _newest = true;
  var _limit = _page;

  /// The last page that loaded, shown while a new search or filter loads.
  AdminWaitlist? _last;

  AdminWaitlistQuery get _key => (query: _query, status: _status == 'all' ? null : _status, limit: _limit);

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    ref.invalidate(adminInviteCampaignsProvider);
    try {
      ref.invalidate(adminWaitlistProvider(_key));
      await ref.read(adminWaitlistProvider(_key).future);
    } catch (_) {
      // The page shows the error.
    }
  }

  void _onSearch(String v) {
    setState(() => _typed = v);
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted || v.trim() == _query) return;
      setState(() {
        _query = v.trim();
        _limit = _page;
      });
    });
  }

  // --- the gate --------------------------------------------------------------------------------

  Future<void> _setGate(Map<String, Object?> changes) async {
    final done = await runGuarded(context, () => ref.read(backendProvider).adminSetSignupGate(changes));
    if (done == null || !mounted) return;
    showSuccess(context, context.l10n.saved);
    ref.invalidate(adminWaitlistProvider(_key));
  }

  Future<void> _switchGate(bool inviteOnly) async {
    final l10n = context.l10n;
    final ok = await showConfirm(
      context: context,
      icon: inviteOnly ? LucideIcons.lock : LucideIcons.lockOpen,
      title: inviteOnly ? l10n.adminGateCloseTitle : l10n.adminGateOpenTitle,
      message: inviteOnly ? l10n.adminGateCloseBody : l10n.adminGateOpenBody,
      confirmLabel: inviteOnly ? l10n.adminGateCloseConfirm : l10n.adminGateOpenConfirm,
      confirmKey: const Key('confirmSignupGate'),
    );
    if (!ok || !mounted) return;
    await _setGate({'mode': inviteOnly ? 'invite_only' : 'open'});
  }

  Future<void> _editNumber(String title, String field, int current, {int max = 100000}) async {
    final l10n = context.l10n;
    final text = await showTextPrompt(
      context,
      title: title,
      label: title,
      submitLabel: l10n.save,
      initial: '$current',
      keyboardType: TextInputType.number,
      fieldKey: Key('gateField-$field'),
    );
    if (text == null || !mounted) return;
    final value = int.tryParse(text.trim());
    if (value == null || value < 0 || value > max) {
      showWarning(context, l10n.adminGateNumberInvalid);
      return;
    }
    if (value == current) return;
    await _setGate({field: value});
  }

  Future<void> _pickOpensAt(DateTime? current) async {
    final now = DateTime.now();
    final start = current?.toLocal() ?? now.add(const Duration(days: 1));
    final day = await showDatePicker(
      context: context,
      initialDate: start.isBefore(now) ? now : start,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (day == null || !mounted) return;
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(start));
    if (time == null || !mounted) return;
    final at = DateTime(day.year, day.month, day.day, time.hour, time.minute);
    await _setGate({'opens_at': at.toUtc().toIso8601String()});
  }

  // --- letting people in -----------------------------------------------------------------------

  Future<void> _admit() async {
    final l10n = context.l10n;
    final text = await showTextPrompt(
      context,
      title: l10n.adminWaitlistAdmitPrompt,
      label: l10n.adminWaitlistAdmitCount,
      submitLabel: l10n.continueLabel,
      initial: '10',
      icon: LucideIcons.userCheck,
      keyboardType: TextInputType.number,
      fieldKey: const Key('admitCount'),
    );
    if (text == null || !mounted) return;
    final count = int.tryParse(text.trim());
    if (count == null || count < 1 || count > 5000) {
      showWarning(context, l10n.adminGateNumberInvalid);
      return;
    }
    final ok = await showConfirm(
      context: context,
      icon: LucideIcons.userCheck,
      title: l10n.adminWaitlistAdmitTitle(count),
      message: l10n.adminWaitlistAdmitBody,
      confirmLabel: l10n.adminWaitlistAdmit,
      confirmKey: const Key('confirmAdmit'),
    );
    if (!ok || !mounted) return;
    final admitted = await runGuarded(context, () => ref.read(backendProvider).adminAdmitWaitlist(count: count));
    if (admitted == null || !mounted) return;
    showSuccess(context, l10n.adminWaitlistAdmitted(admitted));
    ref.invalidate(adminWaitlistProvider(_key));
  }

  Future<void> _admitOne(WaitlistEntry e) async {
    final l10n = context.l10n;
    // Someone waiting on a member's invite is the member's to let in (D-592): say so, and still
    // allow it (press, a friend of the owner's).
    final invitedBy = e.invitedBy;
    final ok = await showConfirm(
      context: context,
      icon: LucideIcons.userCheck,
      title: l10n.adminWlAdmitOneTitle(e.email),
      message: invitedBy == null
          ? l10n.adminWlAdmitOneBody
          : l10n.adminWlAdmitInvitedBody(
              invitedBy.name.isUsable ? invitedBy.name!.trim() : l10n.adminWlTheMember,
            ),
      confirmLabel: invitedBy == null ? l10n.adminWlAdmitOne : l10n.adminWlAdmitAnyway,
      confirmKey: const Key('confirmAdmitOne'),
    );
    if (!ok || !mounted) return;
    final admitted = await runGuarded(context, () => ref.read(backendProvider).adminAdmitWaitlist(ids: [e.id]));
    if (admitted == null || !mounted) return;
    showSuccess(context, l10n.adminWaitlistAdmitted(admitted));
    ref.invalidate(adminWaitlistProvider(_key));
  }

  Future<void> _add() async {
    final result = await showAdaptiveSheet<(List<String>, bool)>(context: context, builder: (_) => const _AddAddresses());
    if (result == null || !mounted) return;
    final changed = await runGuarded(
      context,
      () => ref.read(backendProvider).adminAddWaitlistEntries(result.$1, notify: result.$2),
    );
    if (changed == null || !mounted) return;
    final l10n = context.l10n;
    final skipped = changed.skipped ?? const [];
    showSuccess(
      context,
      [l10n.adminWaitlistAdded(changed.count), if (skipped.isNotEmpty) l10n.adminWaitlistSkipped(skipped.join(', '))].join(' '),
    );
    ref.invalidate(adminWaitlistProvider(_key));
  }

  Future<void> _remove(WaitlistEntry e) async {
    final l10n = context.l10n;
    final ok = await showConfirm(
      context: context,
      title: l10n.adminWaitlistRemoveTitle(e.email),
      message: l10n.adminWaitlistRemoveBody,
      confirmLabel: l10n.remove,
      destructive: true,
      confirmKey: const Key('confirmWaitlistRemove'),
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(context, () async {
      await ref.read(backendProvider).adminRemoveWaitlistEntry(e.id);
      return true;
    });
    if (done == true) ref.invalidate(adminWaitlistProvider(_key));
  }

  // --- campaign codes --------------------------------------------------------------------------

  Future<void> _newCampaign() async {
    final request = await showAdaptiveSheet<CreateInviteCampaignRequest>(context: context, builder: (_) => const _NewCampaign());
    if (request == null || !mounted) return;
    final made = await runGuarded(context, () => ref.read(backendProvider).adminCreateInviteCampaign(request));
    if (made != null) ref.invalidate(adminInviteCampaignsProvider);
  }

  Future<void> _toggleCampaign(InviteCampaign c) async {
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).adminUpdateInviteCampaign(c.code, UpdateInviteCampaignRequest(disabled: !c.disabled)),
    );
    if (done != null) ref.invalidate(adminInviteCampaignsProvider);
  }

  Future<void> _copy(String text, String done) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
    } catch (_) {
      return;
    }
    if (mounted) showSuccess(context, done);
  }

  // --- the page --------------------------------------------------------------------------------

  String _statusLabel(WaitlistEntryStatusEnum s) {
    final l10n = context.l10n;
    return switch (s) {
      WaitlistEntryStatusEnum.waiting => l10n.adminWaitlistStatusWaiting,
      WaitlistEntryStatusEnum.queued => l10n.adminWaitlistStatusQueued,
      WaitlistEntryStatusEnum.admitted => l10n.adminWaitlistStatusAdmitted,
      WaitlistEntryStatusEnum.joined => l10n.adminWaitlistStatusJoined,
    };
  }

  static AdminTone _statusTone(WaitlistEntryStatusEnum s) => switch (s) {
    WaitlistEntryStatusEnum.waiting => AdminTone.neutral,
    WaitlistEntryStatusEnum.queued => AdminTone.info,
    WaitlistEntryStatusEnum.admitted => AdminTone.primary,
    WaitlistEntryStatusEnum.joined => AdminTone.positive,
  };

  List<WaitlistEntry> _visible(List<WaitlistEntry> items) {
    final q = _typed.trim().toLowerCase();
    final list = [
      for (final e in items)
        if ((_status == 'all' || e.status.value == _status) &&
            (q.isEmpty || e.email.toLowerCase().contains(q) || (e.note ?? '').toLowerCase().contains(q)))
          e,
    ];
    list.sort((a, b) => _newest ? b.createdAt.compareTo(a.createdAt) : a.createdAt.compareTo(b.createdAt));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(adminWaitlistProvider(_key));
    if (value.hasValue) _last = value.value;
    final last = _last;
    // A new search or filter keeps the last page on screen while it loads.
    if (value.isLoading && !value.hasValue && last != null) return _content(last, loading: true);
    return AsyncView<AdminWaitlist>(
      value: value,
      onRetry: () => ref.invalidate(adminWaitlistProvider(_key)),
      loading: const SkeletonPage(
        maxWidth: kAdminContentMaxWidth,
        children: [
          SkeletonCard(height: 72),
          SkeletonCard(height: 72),
          SkeletonSectionHeader(),
          SkeletonGroupedCard(count: 3, row: SkeletonRow(trailing: SkeletonTrailing.toggle)),
          SkeletonSectionHeader(),
          SkeletonGroupedCard(count: 5, row: SkeletonRow(trailing: SkeletonTrailing.none)),
        ],
      ),
      data: (w) => _content(w),
    );
  }

  Widget _content(AdminWaitlist w, {bool loading = false}) {
    final l10n = context.l10n;
    final s = w.stats;
    final gate = w.gate.gate;
    final visible = _visible(w.items);
    final emailsFull = gate.dailyEmailsMax > 0 && s.emailsToday >= gate.dailyEmailsMax;
    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(
          section: AdminSection.waitlist,
          onRefresh: _refresh,
          actions: [
            FilledButton.icon(
              key: const Key('waitlistAdmit'),
              onPressed: _admit,
              icon: const Icon(LucideIcons.userCheck, size: 18),
              label: Text(l10n.adminWaitlistAdmit),
            ),
            OutlinedButton.icon(
              key: const Key('waitlistAdd'),
              onPressed: _add,
              icon: const Icon(LucideIcons.userPlus, size: 18),
              label: Text(l10n.adminWaitlistAdd),
            ),
          ],
        ),
        // The numbers that decide an admit.
        AdminStatStrip(
          stats: [
            AdminStat(
              key: const Key('waitlistWaiting'),
              label: l10n.adminWaitlistWaiting,
              value: '${s.waiting}',
              icon: LucideIcons.hourglass,
              onTap: () => setState(() => _status = 'waiting'),
            ),
            AdminStat(label: l10n.adminWaitlistListedToday, value: '${s.listedToday}', icon: LucideIcons.userPlus),
            AdminStat(
              key: const Key('waitlistAdmittedToday'),
              label: l10n.adminWaitlistAdmittedToday,
              value: '${s.admittedToday}',
              icon: LucideIcons.userCheck,
            ),
            AdminStat(
              key: const Key('waitlistEmailsToday'),
              label: l10n.adminWaitlistEmailsToday,
              value: l10n.adminWaitlistEmailsOf(s.emailsToday, gate.dailyEmailsMax),
              icon: LucideIcons.mail,
              tone: emailsFull ? AdminTone.warning : null,
            ),
          ],
        ),
        _Funnel(stats: s, lastBatch: w.lastBatch, queuedLabel: l10n.adminWaitlistStatusQueued),
        // The gate.
        SectionHeader(title: l10n.adminGate),
        AdminAnchor(
          id: AdminAnchors.gate,
          child: GroupedCard(
          children: [
            GroupedTile(
              key: const Key('signupGateTile'),
              icon: w.gate.closed ? LucideIcons.lock : LucideIcons.lockOpen,
              title: l10n.adminGateInviteOnly,
              subtitle: gate.mode == SignupGateModeEnum.inviteOnly ? l10n.adminWlGateOn : l10n.adminWlGateOff,
              showChevron: false,
              trailing: Switch(
                key: const Key('signupGateSwitch'),
                value: gate.mode == SignupGateModeEnum.inviteOnly,
                onChanged: _switchGate,
              ),
            ),
            GroupedTile(
              key: const Key('gateOpensAt'),
              icon: LucideIcons.calendarClock,
              title: l10n.adminGateOpensAt,
              subtitle: gate.opensAt == null ? l10n.adminWlOpensAtHelp : _opensAtText(gate.opensAt!),
              onTap: () => _pickOpensAt(gate.opensAt),
              trailing: gate.opensAt == null
                  ? Text(l10n.adminGateOpensAtNone, style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant))
                  : TextButton(
                      key: const Key('gateClearOpensAt'),
                      onPressed: () => _setGate({'opens_at': null}),
                      child: Text(l10n.adminWlClear),
                    ),
            ),
            _NumberTile(
              key: const Key('gateInvites'),
              icon: LucideIcons.ticket,
              title: l10n.adminGateInvites,
              help: l10n.adminWlInvitesHelp,
              value: '${gate.invitesPerPerson}',
              onTap: () => _editNumber(l10n.adminGateInvites, 'invites_per_person', gate.invitesPerPerson, max: 100),
            ),
            _NumberTile(
              key: const Key('gateDailyAdmit'),
              icon: LucideIcons.calendarCheck,
              title: l10n.adminGateDailyAdmit,
              help: l10n.adminWlDailyAdmitHelp,
              value: gate.dailyAdmit == 0 ? l10n.adminGateDailyAdmitOff : '${gate.dailyAdmit}',
              onTap: () => _editNumber(l10n.adminGateDailyAdmit, 'daily_admit', gate.dailyAdmit, max: 10000),
            ),
            _NumberTile(
              key: const Key('gateDailyEmails'),
              icon: LucideIcons.mail,
              title: l10n.adminGateDailyEmails,
              help: l10n.adminWlDailyEmailsHelp,
              value: '${gate.dailyEmailsMax}',
              onTap: () => _editNumber(l10n.adminGateDailyEmails, 'daily_emails_max', gate.dailyEmailsMax),
            ),
            // Newer servers only: the hour the daily batch runs.
            if (w.gate.batchHourUtc case final hour?)
              _NumberTile(
                key: const Key('gateBatchHour'),
                icon: LucideIcons.clock,
                title: l10n.adminGateBatchHour,
                help: l10n.adminWlBatchHourHelp,
                value: l10n.adminGateBatchHourValue(hour.toString().padLeft(2, '0')),
                onTap: () => _editNumber(l10n.adminGateBatchHour, 'batch_hour_utc', hour, max: 23),
              ),
          ],
        ),
        ),
        if (s.bySource.isNotEmpty) ...[
          SectionHeader(title: l10n.adminWaitlistBySource),
          _bySource(s.bySource),
        ],
        // Campaign codes.
        SectionHeader(
          title: l10n.adminCampaigns,
          trailing: TextButton.icon(
            key: const Key('campaignNew'),
            onPressed: _newCampaign,
            icon: const Icon(LucideIcons.plus, size: 18),
            label: Text(l10n.adminCampaignNew),
          ),
        ),
        AdminAnchor(
          id: AdminAnchors.campaigns,
          child: switch (ref.watch(adminInviteCampaignsProvider)) {
            AsyncData(:final value) when value.isEmpty => AdminEmptyCard(icon: LucideIcons.ticket, message: l10n.adminCampaignNone),
            AsyncData(:final value) => _campaignGrid(value),
            AsyncError(:final error) => AdminEmptyCard(icon: LucideIcons.circleAlert, message: errorText(context, error)),
            _ => const SkeletonCard(height: 120),
          },
        ),
        // The people.
        SectionHeader(title: l10n.adminWaitlistPeople, count: '${s.waiting + s.queued + s.admitted + s.joined}'),
        AdminAnchor(
          id: AdminAnchors.waitlistPeople,
          child: AdminListToolbar(
          search: AdminSearchField(
            key: const Key('waitlistSearch'),
            controller: _search,
            hint: l10n.adminWaitlistSearch,
            onChanged: _onSearch,
          ),
          filters: AdminFilterChips<String>(
            values: const ['all', 'waiting', 'queued', 'admitted', 'joined'],
            labels: {
              'all': l10n.adminWlFilterAll,
              'waiting': l10n.adminWaitlistStatusWaiting,
              'queued': l10n.adminWaitlistStatusQueued,
              'admitted': l10n.adminWaitlistStatusAdmitted,
              'joined': l10n.adminWaitlistStatusJoined,
            },
            counts: {
              'all': s.waiting + s.queued + s.admitted + s.joined,
              'waiting': s.waiting,
              'queued': s.queued,
              'admitted': s.admitted,
              'joined': s.joined,
            },
            selected: _status,
            onSelected: (v) => setState(() {
              _status = v;
              _limit = _page;
            }),
          ),
          sort: AdminSortMenu<bool>(
            values: const [true, false],
            labels: {true: l10n.adminWlSortNewest, false: l10n.adminWlSortOldest},
            selected: _newest,
            onSelected: (v) => setState(() => _newest = v),
          ),
        ),
        ),
        if (loading) const Padding(padding: EdgeInsets.only(bottom: AppSpace.xs), child: LinearProgressIndicator(minHeight: 2)),
        if (w.items.isEmpty && _typed.trim().isEmpty && _status == 'all')
          AdminEmptyCard(icon: LucideIcons.users, message: l10n.adminWaitlistNone)
        else if (visible.isEmpty)
          AdminEmptyCard(key: const Key('waitlistNoMatch'), icon: LucideIcons.searchX, message: l10n.adminWlNoMatch)
        else
          _entries(visible),
        if (w.items.length >= _limit)
          Padding(
            padding: const EdgeInsets.only(top: AppSpace.md),
            child: Column(
              children: [
                OutlinedButton.icon(
                  key: const Key('waitlistMore'),
                  onPressed: () => setState(() => _limit += _page),
                  icon: const Icon(LucideIcons.chevronsDown, size: 18),
                  label: Text(l10n.adminWlShowMore(_page)),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.adminWlShowing(w.items.length),
                  style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
      ],
    );
  }

  String _opensAtText(DateTime at) {
    final l10n = context.l10n;
    final local = at.toLocal();
    final now = DateTime.now();
    final days = DateTime(local.year, local.month, local.day).difference(DateTime(now.year, now.month, now.day)).inDays;
    final when = l10n.adminWlOpensAtValue(local.formattedDate(context), local.formattedTime(context));
    return days < 0 ? when : '$when, ${l10n.adminWlInDays(days)}';
  }

  Widget _bySource(List<WaitlistStatsBySourceInner> rows) {
    final l10n = context.l10n;
    Widget n(int v) => Text('$v');
    return AdminDataList<WaitlistStatsBySourceInner>(
      items: rows,
      itemKey: (f) => Key('waitlistSource-${f.key}'),
      title: (f) => waitlistSourceLabel(context, f.key),
      subtitle: (c, f) => l10n.adminWaitlistSourceRow(f.listed, f.admitted, f.joined, f.firstChat),
      columns: [
        AdminColumn(
          label: l10n.adminWlColSource,
          flex: 2,
          cell: (c, f) => Text(waitlistSourceLabel(c, f.key), style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        AdminColumn(label: l10n.adminWlColListed, numeric: true, cell: (c, f) => n(f.listed)),
        AdminColumn(label: l10n.adminWaitlistStatusAdmitted, numeric: true, cell: (c, f) => n(f.admitted)),
        AdminColumn(label: l10n.adminWaitlistJoined, numeric: true, cell: (c, f) => n(f.joined)),
        AdminColumn(label: l10n.adminWaitlistFirstChat, numeric: true, cell: (c, f) => n(f.firstChat)),
      ],
    );
  }

  Widget _campaignGrid(List<InviteCampaign> list) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 640 ? 2 : 1;
        final width = (constraints.maxWidth - (columns - 1) * AppSpace.sm) / columns;
        return Wrap(
          spacing: AppSpace.sm,
          runSpacing: AppSpace.sm,
          children: [
            for (final c in list)
              SizedBox(
                width: width,
                child: _CampaignCard(
                  campaign: c,
                  onCopy: () => _copy(c.link, context.l10n.adminCampaignCopied),
                  onToggle: () => _toggleCampaign(c),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _entries(List<WaitlistEntry> items) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    Widget note(WaitlistEntry e) => Text(
      '“${e.note!.trim()}”',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: muted?.copyWith(fontStyle: FontStyle.italic),
    );
    bool hasNote(WaitlistEntry e) => e.note != null && e.note!.trim().isNotEmpty;
    Widget selfHosts() => AdminStatusPill(l10n.adminWaitlistSelfHosts, tone: AdminTone.info, icon: LucideIcons.server);
    // Waiting on a member's invite (D-592): whose, and how many that member can give right now.
    Widget? invited(WaitlistEntry e) {
      final by = e.invitedBy;
      if (by == null || e.status != WaitlistEntryStatusEnum.waiting) return null;
      final who = by.name.isUsable ? l10n.adminWlInvitedBy(by.name!.trim()) : l10n.adminWlInvitedByMember;
      return AdminStatusPill(
        '$who · ${l10n.adminWlInviterLeft(by.invitesLeft)}',
        key: Key('waitlistInvitedBy-${e.id}'),
        tone: AdminTone.warning,
        icon: LucideIcons.ticket,
      );
    }
    return AdminDataList<WaitlistEntry>(
      items: items,
      itemKey: (e) => Key('waitlistEntry-${e.id}'),
      title: (e) => e.email,
      leading: (c, e) => AdminAvatar(e.email, tone: _statusTone(e.status) == AdminTone.neutral ? null : _statusTone(e.status)),
      subtitle: (c, e) => waitlistSourceLabel(c, e.source_),
      badges: (c, e) => [
        AdminStatusPill(_statusLabel(e.status), tone: _statusTone(e.status)),
        if (waitlistViaLabel(c, e.admittedVia) case final via?) AdminStatusPill(via, icon: LucideIcons.keyRound),
        if (e.selfHosting) selfHosts(),
        ?invited(e),
        Padding(padding: const EdgeInsets.only(top: 2), child: TimeAgo(e.createdAt, style: muted)),
        if (hasNote(e)) SizedBox(width: double.infinity, child: note(e)),
      ],
      trailing: (c, e) => _actions(e),
      columns: [
        AdminColumn(
          label: l10n.adminWlColEmail,
          flex: 4,
          cell: (c, e) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(e.email, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
              if (hasNote(e)) note(e),
            ],
          ),
        ),
        AdminColumn(
          label: l10n.adminWlColStatus,
          flex: 3,
          cell: (c, e) => Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              AdminStatusPill(_statusLabel(e.status), tone: _statusTone(e.status)),
              if (e.selfHosting) selfHosts(),
              ?invited(e),
            ],
          ),
        ),
        AdminColumn(
          label: l10n.adminWlColSource,
          flex: 3,
          cell: (c, e) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(waitlistSourceLabel(c, e.source_), maxLines: 1, overflow: TextOverflow.ellipsis),
              if (waitlistViaLabel(c, e.admittedVia) case final via?) Text(via, maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
            ],
          ),
        ),
        AdminColumn(label: l10n.adminWlColJoined, flex: 2, cell: (c, e) => TimeAgo(e.createdAt, style: muted)),
      ],
    );
  }

  Widget _actions(WaitlistEntry e) {
    final l10n = context.l10n;
    final inLine = e.status == WaitlistEntryStatusEnum.waiting || e.status == WaitlistEntryStatusEnum.queued;
    return AdminActionsMenu(
      key: Key('waitlistActions-${e.id}'),
      actions: [
        if (inLine)
          AdminMenuAction(
            key: Key('waitlistAdmitOne-${e.id}'),
            label: l10n.adminWlAdmitOne,
            icon: LucideIcons.userCheck,
            onSelected: () => _admitOne(e),
          ),
        AdminMenuAction(
          key: Key('waitlistCopy-${e.id}'),
          label: l10n.adminWlCopyEmail,
          icon: LucideIcons.copy,
          onSelected: () => _copy(e.email, l10n.copied),
        ),
        AdminMenuAction(
          key: Key('waitlistRemove-${e.id}'),
          label: l10n.remove,
          icon: LucideIcons.trash2,
          destructive: true,
          onSelected: () => _remove(e),
        ),
      ],
    );
  }
}

/// The second row of numbers: what happened after people were let in, and the last daily batch.
class _Funnel extends StatelessWidget {
  const _Funnel({required this.stats, required this.lastBatch, required this.queuedLabel});
  final WaitlistStats stats;
  final WaitlistLastBatch? lastBatch;
  final String queuedLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = stats;
    final admitted = s.admitted;
    final joined = s.joined;
    final rate = admitted == 0 ? null : (joined * 100 / admitted).round();
    final batch = lastBatch;
    return AppCard(
      padding: const EdgeInsets.all(AppSpace.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.adminWlFunnel, style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpace.sm),
          Wrap(
            spacing: AppSpace.lg,
            runSpacing: AppSpace.sm,
            children: [
              _MiniStat(value: '$admitted', label: l10n.adminWaitlistAdmittedTotal),
              _MiniStat(value: '$joined', label: l10n.adminWaitlistJoined),
              _MiniStat(value: '${s.firstChat}', label: l10n.adminWaitlistFirstChat),
              if (s.queued > 0) _MiniStat(value: '${s.queued}', label: queuedLabel),
              if (batch != null)
                _MiniStat(
                  key: const Key('waitlistLastBatch'),
                  value: batch.skippedDetail != null
                      ? l10n.adminWaitlistLastBatchSkipped(batch.skippedDetail!)
                      : batch.count == null
                      ? '—'
                      : l10n.adminWaitlistLastBatchValue(batch.count!),
                  label: l10n.adminWaitlistLastBatch,
                  at: batch.at,
                ),
            ],
          ),
          if (rate != null) ...[
            const SizedBox(height: AppSpace.sm),
            AdminMeter(fraction: rate / 100, tone: AdminTone.primary, height: 6, start: l10n.adminWlSignupRate(rate)),
          ],
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({super.key, required this.value, required this.label, this.at});
  final String value;
  final String label;
  final DateTime? at;

  @override
  Widget build(BuildContext context) {
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 260),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, fontFeatures: AppText.tabular)),
          Text(label, style: muted),
          if (at != null) TimeAgo(at!, style: muted),
        ],
      ),
    );
  }
}

/// One campaign code: its state, how much of it is used, its dates, and its actions.
class _CampaignCard extends StatelessWidget {
  const _CampaignCard({required this.campaign, required this.onCopy, required this.onToggle});
  final InviteCampaign campaign;
  final VoidCallback onCopy;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = campaign;
    final now = DateTime.now();
    final (status, tone) = c.disabled
        ? (l10n.adminCampaignOff, AdminTone.neutral)
        : c.expiresAt != null && c.expiresAt!.isBefore(now)
        ? (l10n.adminWlCampaignEnded, AdminTone.neutral)
        : c.startsAt != null && c.startsAt!.isAfter(now)
        ? (l10n.adminWlCampaignScheduled, AdminTone.info)
        : c.maxUses > 0 && c.used >= c.maxUses
        ? (l10n.adminWlCampaignUsedUp, AdminTone.warning)
        : (l10n.adminWlCampaignLive, AdminTone.positive);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    Widget dated(IconData icon, String text) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: context.colorScheme.onSurfaceVariant),
        const SizedBox(width: 4),
        Flexible(child: Text(text, style: muted)),
      ],
    );
    return AppCard(
      key: Key('campaign-${c.code}'),
      onTap: onCopy,
      padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.md, AppSpace.xs, AppSpace.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpace.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.code,
                        style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 0.4),
                      ),
                      Text(c.label, maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpace.xs),
                AdminStatusPill(status, tone: tone),
              ],
            ),
          ),
          const SizedBox(height: AppSpace.sm),
          Padding(
            padding: const EdgeInsets.only(right: AppSpace.sm),
            child: AdminMeter(
              fraction: c.maxUses > 0 ? c.used / c.maxUses : null,
              tone: c.disabled ? AdminTone.neutral : null,
              start: l10n.adminCampaignUsed(c.used, c.maxUses),
              end: c.perDay == null ? null : l10n.adminCampaignPerDayShort(c.perDay!),
            ),
          ),
          const SizedBox(height: AppSpace.xs),
          Wrap(
            spacing: AppSpace.md,
            runSpacing: 4,
            children: [
              if (c.startsAt != null) dated(LucideIcons.calendarPlus, l10n.adminWlCampaignStarts(c.startsAt!.toLocal().formattedDate(context))),
              dated(
                LucideIcons.calendarX,
                c.expiresAt == null ? l10n.adminWlCampaignNoEnd : l10n.adminWlCampaignEnds(c.expiresAt!.toLocal().formattedDate(context)),
              ),
            ],
          ),
          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            overflowAlignment: OverflowBarAlignment.end,
            children: [
              TextButton.icon(
                key: Key('campaignCopy-${c.code}'),
                onPressed: onCopy,
                icon: const Icon(LucideIcons.link, size: 16),
                label: Text(l10n.adminWlCampaignCopy),
              ),
              TextButton(
                key: Key('campaignToggle-${c.code}'),
                onPressed: onToggle,
                child: Text(c.disabled ? l10n.adminCampaignTurnOn : l10n.adminCampaignTurnOff),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NumberTile extends StatelessWidget {
  const _NumberTile({super.key, required this.icon, required this.title, required this.value, required this.onTap, this.help});
  final IconData icon;
  final String title;
  final String? help;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GroupedTile(
      icon: icon,
      title: title,
      subtitle: help,
      onTap: onTap,
      showChevron: true,
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 140),
        child: Text(
          value,
          textAlign: TextAlign.end,
          style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, fontFeatures: AppText.tabular),
        ),
      ),
    );
  }
}

/// Addresses typed or pasted by hand, and whether they get the "You're in" email.
class _AddAddresses extends StatefulWidget {
  const _AddAddresses();

  @override
  State<_AddAddresses> createState() => _AddAddressesState();
}

class _AddAddressesState extends State<_AddAddresses> {
  final _emails = TextEditingController();
  var _notify = false;

  @override
  void dispose() {
    _emails.dispose();
    super.dispose();
  }

  List<String> get _list => _emails.text.split(RegExp(r'[\s,;]+')).map((e) => e.trim()).where((e) => e.isNotEmpty).toSet().toList();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.userPlus,
      title: l10n.adminWaitlistAdd,
      subtitle: l10n.adminWaitlistAddHelp,
      submitLabel: l10n.adminWaitlistAdd,
      submitKey: const Key('waitlistAddSubmit'),
      onSubmit: () {
        final list = _list;
        if (list.isEmpty) return;
        Navigator.pop(context, (list, _notify));
      },
      children: [
        TextField(
          key: const Key('waitlistAddEmails'),
          controller: _emails,
          autofocus: true,
          autocorrect: false,
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLines: 8,
          decoration: InputDecoration(
            labelText: l10n.adminWaitlistAddLabel,
            hintText: 'ana@example.com\nben@example.com',
            alignLabelWithHint: true,
          ),
        ),
        FormSwitch(
          key: const Key('waitlistAddNotify'),
          icon: LucideIcons.mail,
          title: l10n.adminWaitlistAddNotify,
          value: _notify,
          onChanged: (v) => setState(() => _notify = v),
        ),
      ],
    );
  }
}

/// A new campaign code: code, label, total, an optional number a day, start and end.
class _NewCampaign extends StatefulWidget {
  const _NewCampaign();

  @override
  State<_NewCampaign> createState() => _NewCampaignState();
}

class _NewCampaignState extends State<_NewCampaign> {
  final _code = TextEditingController();
  final _label = TextEditingController();
  final _total = TextEditingController(text: '100');
  final _perDay = TextEditingController();
  DateTime? _starts;
  DateTime? _ends;
  String? _codeError;

  /// The server's rule (§7.2): letters, digits and hyphens; 9 or more characters or a hyphen, so it
  /// never looks like a 6-character personal code or an 8-character workspace code.
  static bool _validCode(String c) => RegExp(r'^[A-Za-z0-9-]{4,32}$').hasMatch(c) && (c.length >= 9 || c.contains('-'));

  @override
  void dispose() {
    _code.dispose();
    _label.dispose();
    _total.dispose();
    _perDay.dispose();
    super.dispose();
  }

  Future<void> _pick(bool start) async {
    final now = DateTime.now();
    final current = start ? _starts : _ends;
    final day = await showDatePicker(
      context: context,
      initialDate: current ?? now,
      firstDate: now.subtract(const Duration(days: 1)),
      lastDate: now.add(const Duration(days: 730)),
    );
    if (day == null || !mounted) return;
    setState(() => start ? _starts = day : _ends = day);
  }

  void _submit() {
    final code = _code.text.trim().toUpperCase();
    final total = int.tryParse(_total.text.trim());
    final perDay = _perDay.text.trim().isEmpty ? null : int.tryParse(_perDay.text.trim());
    if (!_validCode(code)) {
      setState(() => _codeError = context.l10n.adminCampaignCodeHelp);
      return;
    }
    if (_label.text.trim().isEmpty || total == null || total < 0 || (_perDay.text.trim().isNotEmpty && (perDay == null || perDay < 1))) {
      showWarning(context, context.l10n.adminGateNumberInvalid);
      return;
    }
    Navigator.pop(
      context,
      CreateInviteCampaignRequest(
        code: code,
        label: _label.text.trim(),
        maxUses: total,
        perDay: perDay,
        // Whole days in this device's time: from the start of the first, to the end of the last.
        startsAt: _starts?.toUtc(),
        expiresAt: _ends?.add(const Duration(days: 1)).subtract(const Duration(seconds: 1)).toUtc(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String day(DateTime? d) => d == null ? l10n.adminCampaignAnyTime : d.formattedDate(context);
    return FormSheet(
      icon: LucideIcons.ticket,
      title: l10n.adminCampaignNew,
      submitLabel: l10n.adminCampaignCreate,
      submitKey: const Key('campaignCreate'),
      onSubmit: _submit,
      children: [
        TextField(
          key: const Key('campaignCode'),
          controller: _code,
          autofocus: true,
          autocorrect: false,
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            labelText: l10n.adminCampaignCode,
            hintText: 'SHOWHN-DEC8',
            helperText: _codeError == null ? l10n.adminCampaignCodeHelp : null,
            helperMaxLines: 3,
            errorText: _codeError,
            errorMaxLines: 3,
          ),
          onChanged: (_) {
            if (_codeError != null) setState(() => _codeError = null);
          },
        ),
        TextField(
          key: const Key('campaignLabel'),
          controller: _label,
          decoration: InputDecoration(labelText: l10n.adminCampaignLabel),
        ),
        Row(
          spacing: AppSpace.sm,
          children: [
            Expanded(
              child: TextField(
                key: const Key('campaignTotal'),
                controller: _total,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: l10n.adminCampaignTotal),
              ),
            ),
            Expanded(
              child: TextField(
                key: const Key('campaignPerDay'),
                controller: _perDay,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: l10n.adminCampaignPerDay),
              ),
            ),
          ],
        ),
        GroupedCard(
          children: [
            GroupedTile(
              key: const Key('campaignStarts'),
              icon: LucideIcons.calendarPlus,
              title: l10n.adminCampaignStarts,
              trailing: Text(day(_starts)),
              onTap: () => _pick(true),
            ),
            GroupedTile(
              key: const Key('campaignEnds'),
              icon: LucideIcons.calendarX,
              title: l10n.adminCampaignEnds,
              trailing: Text(day(_ends)),
              onTap: () => _pick(false),
            ),
          ],
        ),
      ],
    );
  }
}
