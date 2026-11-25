import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/link_browser.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';

/// The partner platform's dashboard: applications, the brand kit and payouts are run there.
const kToltDashboardUrl = 'https://app.tolt.com';

final adminPartnersProvider = FutureProvider.autoDispose<AdminPartners>(
  (r) => r.watch(backendProvider).adminPartners(),
);

/// Commissions, newest first; for one partner when [partnerId] is set.
final adminPartnerCommissionsProvider = FutureProvider.autoDispose.family<List<AdminPartnerCommission>, String?>(
  (r, partnerId) => r.watch(backendProvider).adminPartnerCommissions(partnerId: partnerId, limit: 100),
);

String _usd(BuildContext context, num v) => formatUsd(v, context.l10n.localeName);

String _percent(num rate) {
  final p = rate * 100;
  return '${p == p.roundToDouble() ? p.toInt() : p.toStringAsFixed(1)}%';
}

(String, AdminTone) partnerStatusLabel(BuildContext context, AdminPartnerStatusEnum s) {
  final l10n = context.l10n;
  return switch (s) {
    AdminPartnerStatusEnum.applied => (l10n.adminPartnersStatusApplied, AdminTone.warning),
    AdminPartnerStatusEnum.active => (l10n.adminPartnersStatusActive, AdminTone.positive),
    AdminPartnerStatusEnum.paused => (l10n.adminPartnersStatusPaused, AdminTone.neutral),
    AdminPartnerStatusEnum.banned => (l10n.adminPartnersStatusBanned, AdminTone.negative),
    AdminPartnerStatusEnum.left => (l10n.adminPartnersStatusLeft, AdminTone.neutral),
  };
}

(String, AdminTone) _codeStatusLabel(BuildContext context, AdminPartnerCodeStatusEnum s) {
  final l10n = context.l10n;
  return switch (s) {
    AdminPartnerCodeStatusEnum.active => (l10n.adminPartnersStatusActive, AdminTone.positive),
    AdminPartnerCodeStatusEnum.paused => (l10n.adminPartnersStatusPaused, AdminTone.neutral),
    AdminPartnerCodeStatusEnum.retired => (l10n.adminPartnersCodeRetired, AdminTone.neutral),
  };
}

(String, AdminTone) _commissionStatus(BuildContext context, AdminPartnerCommissionStatusEnum s) {
  final l10n = context.l10n;
  return switch (s) {
    AdminPartnerCommissionStatusEnum.pending => (l10n.adminPartnersComPending, AdminTone.info),
    AdminPartnerCommissionStatusEnum.payable => (l10n.adminPartnersComPayable, AdminTone.positive),
    AdminPartnerCommissionStatusEnum.paid => (l10n.adminPartnersComPaid, AdminTone.neutral),
    AdminPartnerCommissionStatusEnum.heldForReview => (l10n.adminPartnersComHeld, AdminTone.warning),
    AdminPartnerCommissionStatusEnum.void_ => (l10n.adminPartnersComVoid, AdminTone.negative),
  };
}

/// Admin console > Partners (Casama Partners, D-543, CREATOR-PROGRAM-PLAN §7.8): what is owed,
/// every creator with their codes and numbers, their commissions, and a sync with the partner
/// platform. Approving, pausing, codes and rates are set here; payouts are run on the platform.
class PartnersTab extends ConsumerStatefulWidget {
  const PartnersTab({super.key});

  @override
  ConsumerState<PartnersTab> createState() => _PartnersTabState();
}

class _PartnersTabState extends ConsumerState<PartnersTab> {
  var _syncing = false;

  Future<void> _refresh() async {
    ref.invalidate(adminPartnersProvider);
    ref.invalidate(adminPartnerCommissionsProvider);
    try {
      await ref.read(adminPartnersProvider.future);
    } catch (_) {
      // The page shows the error.
    }
  }

  Future<void> _sync() async {
    setState(() => _syncing = true);
    final r = await runGuarded(context, () => ref.read(backendProvider).adminSyncPartners());
    if (!mounted) return;
    setState(() => _syncing = false);
    if (r == null) return;
    showSuccess(context, context.l10n.adminPartnersSynced(r.partners, r.pushed, r.paid));
    unawaited(_refresh());
  }

  Future<void> _add() async {
    final made = await showAdaptiveSheet<AdminPartner>(context: context, builder: (_) => const _AddPartnerSheet());
    if (made == null || !mounted) return;
    ref.invalidate(adminPartnersProvider);
    unawaited(openPartnerDetail(context, made.id));
  }

  @override
  Widget build(BuildContext context) {
    return AsyncView<AdminPartners>(
      value: ref.watch(adminPartnersProvider),
      onRetry: () => ref.invalidate(adminPartnersProvider),
      loading: const SkeletonPage(
        maxWidth: kAdminContentMaxWidth,
        children: [
          SkeletonCard(height: 72),
          SkeletonSectionHeader(),
          SkeletonGroupedCard(count: 4, row: SkeletonRow(trailing: SkeletonTrailing.none)),
        ],
      ),
      data: _content,
    );
  }

  Widget _content(AdminPartners a) {
    final l10n = context.l10n;
    final t = a.totals;
    final actions = [
      OutlinedButton.icon(
        key: const Key('adminPartnersTolt'),
        onPressed: () => unawaited(openWebLink(Uri.parse(kToltDashboardUrl))),
        icon: const Icon(LucideIcons.externalLink, size: 16),
        label: Text(l10n.adminPartnersOpenTolt),
      ),
      OutlinedButton.icon(
        key: const Key('adminPartnersSync'),
        onPressed: _syncing || !a.enabled ? null : _sync,
        icon: _syncing
            ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
            : const Icon(LucideIcons.refreshCcw, size: 16),
        label: Text(l10n.adminPartnersSyncNow),
      ),
      FilledButton.icon(
        key: const Key('adminPartnersAdd'),
        onPressed: a.enabled ? _add : null,
        icon: const Icon(LucideIcons.plus, size: 16),
        label: Text(l10n.adminPartnersAdd),
      ),
    ];
    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(
          section: AdminSection.partners,
          summary: a.enabled ? l10n.adminPartnersSummary(_percent(a.rate), a.holdDays) : null,
          actions: actions,
          onRefresh: _refresh,
        ),
        if (!a.enabled)
          AdminEmptyCard(
            key: const Key('adminPartnersOff'),
            icon: LucideIcons.handshake,
            message: l10n.adminPartnersOff,
          )
        else ...[
          AdminStatStrip(
            maxColumns: 5,
            stats: [
              AdminStat(
                key: const Key('adminPartnersPending'),
                label: l10n.adminPartnersComPending,
                value: _usd(context, t.pendingUsd),
                icon: LucideIcons.hourglass,
              ),
              AdminStat(
                label: l10n.adminPartnersComPayable,
                value: _usd(context, t.payableUsd),
                icon: LucideIcons.wallet,
              ),
              AdminStat(
                label: l10n.adminPartnersComPaid,
                value: _usd(context, t.paidUsd),
                icon: LucideIcons.badgeCheck,
              ),
              AdminStat(
                key: const Key('adminPartnersUnread'),
                label: l10n.adminPartnersUnread,
                value: '${t.unreadCharges}',
                icon: LucideIcons.circleHelp,
                tone: t.unreadCharges > 0 ? AdminTone.warning : null,
              ),
              AdminStat(
                label: l10n.adminPartnersSyncFailed,
                value: '${t.syncFailed}',
                icon: LucideIcons.cloudAlert,
                tone: t.syncFailed > 0 ? AdminTone.negative : null,
              ),
            ],
          ),
          SectionHeader(title: l10n.adminPartnersList, count: '${a.partners.length}'),
          if (a.partners.isEmpty)
            AdminEmptyCard(icon: LucideIcons.handshake, message: l10n.adminPartnersNone)
          else
            _partnerList(a),
          SectionHeader(title: l10n.adminPartnersCommissions),
          const PartnerCommissionList(partnerId: null),
        ],
      ],
    );
  }

  Widget _partnerList(AdminPartners a) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    String codes(AdminPartner p) => p.codes.isEmpty ? l10n.adminPartnersNoCodes : p.codes.map((c) => c.code).join(', ');
    Widget status(AdminPartner p) {
      final (text, tone) = partnerStatusLabel(context, p.status);
      return AdminStatusPill(text, tone: tone);
    }

    String money(AdminPartner p) =>
        l10n.adminPartnersMoney(_usd(context, p.pendingUsd), _usd(context, p.payableUsd), _usd(context, p.paidUsd));
    return AdminDataList<AdminPartner>(
      items: a.partners,
      itemKey: (p) => Key('adminPartner-${p.id}'),
      title: (p) => p.displayName,
      leading: (c, p) => AdminAvatar(p.displayName),
      subtitle: (c, p) => '${codes(p)} · ${l10n.adminPartnersReferredPaying(p.referred, p.paying)}',
      badges: (c, p) => [status(p), Text(money(p), style: muted)],
      onTap: (p) => unawaited(openPartnerDetail(context, p.id)),
      columns: [
        AdminColumn(
          label: l10n.adminPartnersColPartner,
          flex: 4,
          cell: (c, p) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                p.displayName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(codes(p), style: muted, maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        AdminColumn(label: l10n.adminPartnersColStatus, flex: 2, cell: (c, p) => status(p)),
        AdminColumn(
          label: l10n.adminPartnersColReferred,
          flex: 2,
          numeric: true,
          cell: (c, p) => Text('${p.referred}'),
        ),
        AdminColumn(label: l10n.adminPartnersColPaying, flex: 2, numeric: true, cell: (c, p) => Text('${p.paying}')),
        AdminColumn(
          label: l10n.adminPartnersColOwed,
          flex: 3,
          numeric: true,
          cell: (c, p) => Text(_usd(context, p.pendingUsd + p.payableUsd)),
        ),
        AdminColumn(
          label: l10n.adminPartnersComPaid,
          flex: 2,
          numeric: true,
          cell: (c, p) => Text(_usd(context, p.paidUsd)),
        ),
      ],
    );
  }
}

/// Opens one partner: status, rate, linked account, notes, codes and commissions.
Future<void> openPartnerDetail(BuildContext context, String id) => showAdaptiveSheet<void>(
  context: context,
  heightFactor: 0.9,
  dialogMaxWidth: 720,
  contentPadsBottom: true,
  builder: (_) => PartnerDetail(partnerId: id),
);

/// Commissions with hold, release and void.
class PartnerCommissionList extends ConsumerWidget {
  const PartnerCommissionList({super.key, required this.partnerId});
  final String? partnerId;

  Future<void> _act(
    BuildContext context,
    WidgetRef ref,
    AdminPartnerCommission c,
    UpdateAdminPartnerCommissionRequestActionEnum action,
  ) async {
    final l10n = context.l10n;
    String? note;
    if (action != UpdateAdminPartnerCommissionRequestActionEnum.release) {
      note = await showTextPrompt(
        context,
        title: action == UpdateAdminPartnerCommissionRequestActionEnum.hold
            ? l10n.adminPartnersHold
            : l10n.adminPartnersVoid,
        label: l10n.adminPartnersNote,
        submitLabel: action == UpdateAdminPartnerCommissionRequestActionEnum.hold
            ? l10n.adminPartnersHold
            : l10n.adminPartnersVoid,
        fieldKey: const Key('adminPartnerCommissionNote'),
      );
      if (note == null || !context.mounted) return;
    }
    final done = await runGuarded(
      context,
      () => ref
          .read(backendProvider)
          .adminUpdatePartnerCommission(c.id, action, note: note == null || note.trim().isEmpty ? null : note.trim()),
    );
    if (done == null || !context.mounted) return;
    ref.invalidate(adminPartnerCommissionsProvider);
    ref.invalidate(adminPartnersProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    final value = ref.watch(adminPartnerCommissionsProvider(partnerId));
    return value.when(
      loading: () => const SkeletonGroupedCard(count: 2, row: SkeletonRow(trailing: SkeletonTrailing.meta)),
      error: (e, _) => AdminEmptyCard(icon: LucideIcons.circleAlert, message: errorText(context, e)),
      data: (items) {
        if (items.isEmpty) return AdminEmptyCard(icon: LucideIcons.receipt, message: l10n.adminPartnersNoCommissions);
        Widget status(AdminPartnerCommission c) {
          final (text, tone) = _commissionStatus(context, c.status);
          return AdminStatusPill(text, tone: tone);
        }

        return AdminDataList<AdminPartnerCommission>(
          items: items,
          itemKey: (c) => Key('adminPartnerCommission-${c.id}'),
          title: (c) => '${_usd(context, c.amountUsd)} · ${c.partnerName}',
          subtitle: (_, x) => l10n.adminPartnersCommissionOf(_percent(x.rate), _usd(context, x.baseUsd)),
          badges: (c, x) => [
            status(x),
            TimeAgo(x.createdAt, style: muted),
            if (x.syncError?.isNotEmpty ?? false)
              Text(x.syncError!, style: muted?.copyWith(color: context.colorScheme.error)),
          ],
          trailing: (c, x) => AdminActionsMenu(
            key: Key('adminPartnerCommissionMenu-${x.id}'),
            actions: [
              if (x.status == AdminPartnerCommissionStatusEnum.pending ||
                  x.status == AdminPartnerCommissionStatusEnum.payable)
                AdminMenuAction(
                  key: Key('adminPartnerCommissionHold-${x.id}'),
                  label: l10n.adminPartnersHold,
                  icon: LucideIcons.pause,
                  onSelected: () => _act(context, ref, x, UpdateAdminPartnerCommissionRequestActionEnum.hold),
                ),
              if (x.status == AdminPartnerCommissionStatusEnum.heldForReview)
                AdminMenuAction(
                  key: Key('adminPartnerCommissionRelease-${x.id}'),
                  label: l10n.adminPartnersRelease,
                  icon: LucideIcons.play,
                  onSelected: () => _act(context, ref, x, UpdateAdminPartnerCommissionRequestActionEnum.release),
                ),
              if (x.status != AdminPartnerCommissionStatusEnum.void_ &&
                  x.status != AdminPartnerCommissionStatusEnum.paid)
                AdminMenuAction(
                  key: Key('adminPartnerCommissionVoid-${x.id}'),
                  label: l10n.adminPartnersVoid,
                  icon: LucideIcons.ban,
                  destructive: true,
                  onSelected: () => _act(context, ref, x, UpdateAdminPartnerCommissionRequestActionEnum.void_),
                ),
            ],
          ),
          columns: [
            AdminColumn(
              label: l10n.adminPartnersColPartner,
              flex: 3,
              cell: (c, x) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    x.partnerName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TimeAgo(x.createdAt, style: muted),
                ],
              ),
            ),
            AdminColumn(
              label: l10n.adminPartnersColAmount,
              flex: 2,
              numeric: true,
              cell: (c, x) => Text(_usd(context, x.amountUsd)),
            ),
            AdminColumn(
              label: l10n.adminPartnersColBase,
              flex: 3,
              numeric: true,
              cell: (c, x) => Text(
                l10n.adminPartnersCommissionOf(_percent(x.rate), _usd(context, x.baseUsd)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AdminColumn(label: l10n.adminPartnersColStatus, flex: 2, cell: (c, x) => status(x)),
          ],
        );
      },
    );
  }
}

/// One partner, in a tall sheet.
class PartnerDetail extends ConsumerStatefulWidget {
  const PartnerDetail({super.key, required this.partnerId});
  final String partnerId;

  @override
  ConsumerState<PartnerDetail> createState() => _PartnerDetailState();
}

class _PartnerDetailState extends ConsumerState<PartnerDetail> {
  Future<void> _update(UpdateAdminPartnerRequest request) async {
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).adminUpdatePartner(widget.partnerId, request),
    );
    if (done == null || !mounted) return;
    showSuccess(context, context.l10n.adminPartnersSaved);
    ref.invalidate(adminPartnersProvider);
  }

  Future<void> _status(AdminPartner p, UpdateAdminPartnerRequestStatusEnum status) async {
    final l10n = context.l10n;
    if (status == UpdateAdminPartnerRequestStatusEnum.banned) {
      final ok = await adminConfirm(
        context,
        title: l10n.adminPartnersBanTitle(p.displayName),
        message: l10n.adminPartnersBanBody,
        confirmLabel: l10n.adminPartnersBan,
        destructive: true,
        confirmKey: const Key('adminPartnerBanConfirm'),
      );
      if (!ok || !mounted) return;
    }
    await _update(UpdateAdminPartnerRequest(status: status));
  }

  Future<void> _rate(AdminPartner p, num defaultRate) async {
    final l10n = context.l10n;
    final raw = await showTextPrompt(
      context,
      title: l10n.adminPartnersRate,
      label: l10n.adminPartnersRatePercent,
      subtitle: l10n.adminPartnersRateHelp(_percent(defaultRate)),
      initial: p.rate == null ? '' : (p.rate! * 100).toString().replaceFirst(RegExp(r'\.0$'), ''),
      submitLabel: l10n.adminPartnersSave,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      fieldKey: const Key('adminPartnerRateField'),
    );
    if (raw == null || !mounted) return;
    final percent = num.tryParse(raw.trim().replaceAll('%', ''));
    if (percent == null || percent <= 0 || percent > 100) {
      showMessage(context, l10n.adminPartnersRateInvalid);
      return;
    }
    await _update(UpdateAdminPartnerRequest(rate: percent / 100));
  }

  Future<void> _linkAccount() async {
    final l10n = context.l10n;
    final email = await showTextPrompt(
      context,
      title: l10n.adminPartnersLinkAccount,
      label: l10n.adminPartnersAccountEmail,
      subtitle: l10n.adminPartnersLinkAccountHelp,
      submitLabel: l10n.adminPartnersLink,
      keyboardType: TextInputType.emailAddress,
      fieldKey: const Key('adminPartnerEmailField'),
    );
    if (email == null || email.trim().isEmpty || !mounted) return;
    await _update(UpdateAdminPartnerRequest(userEmail: email.trim()));
  }

  Future<void> _notes(AdminPartner p) async {
    final l10n = context.l10n;
    final notes = await showTextPrompt(
      context,
      title: l10n.adminPartnersNotes,
      label: l10n.adminPartnersNotes,
      initial: p.notes ?? '',
      submitLabel: l10n.adminPartnersSave,
      fieldKey: const Key('adminPartnerNotesField'),
    );
    if (notes == null || !mounted) return;
    await _update(UpdateAdminPartnerRequest(notes: notes.trim()));
  }

  Future<void> _addCode() async {
    final made = await showAdaptiveSheet<AdminPartnerCode>(
      context: context,
      builder: (_) => _AddCodeSheet(partnerId: widget.partnerId),
    );
    if (made == null || !mounted) return;
    showSuccess(context, context.l10n.adminPartnersCodeAdded(made.code));
    ref.invalidate(adminPartnersProvider);
  }

  Future<void> _codeStatus(AdminPartnerCode c, UpdateAdminPartnerCodeRequestStatusEnum status) async {
    final l10n = context.l10n;
    if (status == UpdateAdminPartnerCodeRequestStatusEnum.retired) {
      final ok = await adminConfirm(
        context,
        title: l10n.adminPartnersRetireTitle(c.code),
        message: l10n.adminPartnersRetireBody,
        confirmLabel: l10n.adminPartnersRetire,
        destructive: true,
        confirmKey: const Key('adminPartnerRetireConfirm'),
      );
      if (!ok || !mounted) return;
    }
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).adminUpdatePartnerCode(c.code, UpdateAdminPartnerCodeRequest(status: status)),
    );
    if (done == null || !mounted) return;
    ref.invalidate(adminPartnersProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final all = ref.watch(adminPartnersProvider);
    final a = all.value;
    final p = a?.partners.where((x) => x.id == widget.partnerId).firstOrNull;
    if (a == null || p == null) {
      return all.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(child: Text(l10n.adminPartnersNotFound));
    }
    final scheme = context.colorScheme;
    final (statusText, statusTone) = partnerStatusLabel(context, p.status);
    final muted = context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant);
    final statusButtons = <Widget>[
      if (p.status == AdminPartnerStatusEnum.applied ||
          p.status == AdminPartnerStatusEnum.paused ||
          p.status == AdminPartnerStatusEnum.left)
        FilledButton.icon(
          key: const Key('adminPartnerApprove'),
          onPressed: () => _status(p, UpdateAdminPartnerRequestStatusEnum.active),
          icon: const Icon(LucideIcons.check, size: 16),
          label: Text(
            p.status == AdminPartnerStatusEnum.applied ? l10n.adminPartnersApprove : l10n.adminPartnersResume,
          ),
        ),
      if (p.status == AdminPartnerStatusEnum.active)
        OutlinedButton.icon(
          key: const Key('adminPartnerPause'),
          onPressed: () => _status(p, UpdateAdminPartnerRequestStatusEnum.paused),
          icon: const Icon(LucideIcons.pause, size: 16),
          label: Text(l10n.adminPartnersPause),
        ),
      if (p.status != AdminPartnerStatusEnum.banned)
        OutlinedButton.icon(
          key: const Key('adminPartnerBan'),
          style: OutlinedButton.styleFrom(foregroundColor: scheme.error),
          onPressed: () => _status(p, UpdateAdminPartnerRequestStatusEnum.banned),
          icon: const Icon(LucideIcons.ban, size: 16),
          label: Text(l10n.adminPartnersBan),
        ),
    ];
    return ListView(
      key: const Key('adminPartnerDetail'),
      padding: EdgeInsets.fromLTRB(
        AppSpace.lg,
        AppSpace.xs,
        AppSpace.lg,
        AppSpace.xl + MediaQuery.paddingOf(context).bottom,
      ),
      children: [
        Row(
          children: [
            AdminAvatar(p.displayName, size: 40),
            const SizedBox(width: AppSpace.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.displayName, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                  if (p.channelUrl?.isNotEmpty ?? false)
                    Text(p.channelUrl!, style: muted, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            AdminStatusPill(statusText, tone: statusTone),
          ],
        ),
        const SizedBox(height: AppSpace.md),
        Wrap(spacing: AppSpace.xs, runSpacing: AppSpace.xs, children: statusButtons),
        const SizedBox(height: AppSpace.md),
        AppCard(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.xs),
          child: Column(
            children: [
              AdminKeyValue(label: l10n.adminPartnersColReferred, value: Text('${p.referred}')),
              AdminKeyValue(label: l10n.adminPartnersColPaying, value: Text('${p.paying}')),
              AdminKeyValue(label: l10n.adminPartnersComPending, value: Text(_usd(context, p.pendingUsd))),
              AdminKeyValue(label: l10n.adminPartnersComPayable, value: Text(_usd(context, p.payableUsd))),
              AdminKeyValue(label: l10n.adminPartnersComPaid, value: Text(_usd(context, p.paidUsd))),
              if (p.email?.isNotEmpty ?? false)
                AdminKeyValue(label: l10n.adminPartnersEmail, value: Text(adminMaskEmail(p.email))),
              if (p.country?.isNotEmpty ?? false)
                AdminKeyValue(label: l10n.adminPartnersCountry, value: Text(p.country!)),
            ],
          ),
        ),
        SectionHeader(title: l10n.adminPartnersSettings),
        GroupedCard(
          children: [
            GroupedTile(
              key: const Key('adminPartnerRate'),
              icon: LucideIcons.percent,
              title: l10n.adminPartnersRate,
              subtitle: p.rate == null ? l10n.adminPartnersRateDefault(_percent(a.rate)) : _percent(p.rate!),
              onTap: () => _rate(p, a.rate),
            ),
            GroupedTile(
              key: const Key('adminPartnerAccount'),
              icon: LucideIcons.userRound,
              title: l10n.adminPartnersLinkAccount,
              subtitle: p.userId == null ? l10n.adminPartnersNoAccount : l10n.adminPartnersAccountLinked,
              onTap: _linkAccount,
            ),
            GroupedTile(
              key: const Key('adminPartnerNotes'),
              icon: LucideIcons.notebookPen,
              title: l10n.adminPartnersNotes,
              subtitle: (p.notes?.isNotEmpty ?? false) ? p.notes : l10n.adminPartnersNoNotes,
              onTap: () => _notes(p),
            ),
          ],
        ),
        SectionHeader(
          title: l10n.adminPartnersCodes,
          trailing: TextButton.icon(
            key: const Key('adminPartnerAddCode'),
            onPressed: _addCode,
            icon: const Icon(LucideIcons.plus, size: 16),
            label: Text(l10n.adminPartnersAddCode),
          ),
        ),
        if (p.codes.isEmpty)
          AdminEmptyCard(icon: LucideIcons.ticket, message: l10n.adminPartnersNoCodes)
        else
          GroupedCard(
            children: [
              for (final c in p.codes)
                GroupedTile(
                  key: Key('adminPartnerCode-${c.code}'),
                  icon: LucideIcons.ticket,
                  title: c.code,
                  subtitle: [
                    _codeStatusLabel(context, c.status).$1,
                    if (c.dodoDiscountCode?.isNotEmpty ?? false) 'Dodo ${c.dodoDiscountCode}',
                    if (c.appleOfferCode?.isNotEmpty ?? false) 'Apple ${c.appleOfferCode}',
                    if (c.playPromoCode?.isNotEmpty ?? false) 'Play ${c.playPromoCode}',
                    if (c.waitlist) l10n.adminPartnersWaitlistPass,
                  ].join(' · '),
                  trailing: AdminActionsMenu(
                    key: Key('adminPartnerCodeMenu-${c.code}'),
                    actions: [
                      if (c.status == AdminPartnerCodeStatusEnum.active)
                        AdminMenuAction(
                          key: Key('adminPartnerCodePause-${c.code}'),
                          label: l10n.adminPartnersPause,
                          icon: LucideIcons.pause,
                          onSelected: () => _codeStatus(c, UpdateAdminPartnerCodeRequestStatusEnum.paused),
                        ),
                      if (c.status == AdminPartnerCodeStatusEnum.paused)
                        AdminMenuAction(
                          key: Key('adminPartnerCodeResume-${c.code}'),
                          label: l10n.adminPartnersResume,
                          icon: LucideIcons.play,
                          onSelected: () => _codeStatus(c, UpdateAdminPartnerCodeRequestStatusEnum.active),
                        ),
                      if (c.status != AdminPartnerCodeStatusEnum.retired)
                        AdminMenuAction(
                          key: Key('adminPartnerCodeRetire-${c.code}'),
                          label: l10n.adminPartnersRetire,
                          icon: LucideIcons.archive,
                          destructive: true,
                          onSelected: () => _codeStatus(c, UpdateAdminPartnerCodeRequestStatusEnum.retired),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        SectionHeader(title: l10n.adminPartnersCommissions),
        PartnerCommissionList(partnerId: p.id),
      ],
    );
  }
}

/// Adds a partner by hand (an invited creator, or one approved on the platform before a sync).
class _AddPartnerSheet extends ConsumerStatefulWidget {
  const _AddPartnerSheet();

  @override
  ConsumerState<_AddPartnerSheet> createState() => _AddPartnerSheetState();
}

class _AddPartnerSheetState extends ConsumerState<_AddPartnerSheet> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _channel = TextEditingController();
  var _busy = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _channel.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _name.text.trim();
    if (name.isEmpty) return;
    String? opt(TextEditingController c) => c.text.trim().isEmpty ? null : c.text.trim();
    setState(() => _busy = true);
    final made = await runGuarded(
      context,
      () => ref
          .read(backendProvider)
          .adminCreatePartner(
            CreateAdminPartnerRequest(displayName: name, email: opt(_email), channelUrl: opt(_channel)),
          ),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    if (made != null) Navigator.pop(context, made);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.handshake,
      title: l10n.adminPartnersAdd,
      submitLabel: l10n.adminPartnersAdd,
      submitKey: const Key('adminPartnerAddSubmit'),
      busy: _busy,
      onSubmit: _submit,
      children: [
        TextField(
          key: const Key('adminPartnerAddName'),
          controller: _name,
          autofocus: true,
          decoration: InputDecoration(labelText: l10n.adminPartnersName),
        ),
        TextField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: l10n.adminPartnersEmailOptional),
        ),
        TextField(
          controller: _channel,
          keyboardType: TextInputType.url,
          decoration: InputDecoration(labelText: l10n.adminPartnersChannelOptional),
        ),
      ],
    );
  }
}

/// Gives a partner a code, with the matching store codes made by hand (CREATOR-PROGRAM-PLAN §7.3).
class _AddCodeSheet extends ConsumerStatefulWidget {
  const _AddCodeSheet({required this.partnerId});
  final String partnerId;

  @override
  ConsumerState<_AddCodeSheet> createState() => _AddCodeSheetState();
}

class _AddCodeSheetState extends ConsumerState<_AddCodeSheet> {
  final _code = TextEditingController();
  final _dodo = TextEditingController();
  final _apple = TextEditingController();
  final _play = TextEditingController();
  final _uses = TextEditingController();
  var _busy = false;

  @override
  void dispose() {
    for (final c in [_code, _dodo, _apple, _play, _uses]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    final code = _code.text.trim().toUpperCase();
    if (code.isEmpty) return;
    String? opt(TextEditingController c) => c.text.trim().isEmpty ? null : c.text.trim();
    setState(() => _busy = true);
    final made = await runGuarded(
      context,
      () => ref
          .read(backendProvider)
          .adminCreatePartnerCode(
            widget.partnerId,
            CreateAdminPartnerCodeRequest(
              code: code,
              dodoDiscountCode: opt(_dodo),
              appleOfferCode: opt(_apple),
              playPromoCode: opt(_play),
              waitlistUses: int.tryParse(_uses.text.trim()),
            ),
          ),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    if (made != null) Navigator.pop(context, made);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.ticket,
      title: l10n.adminPartnersAddCode,
      subtitle: l10n.adminPartnersAddCodeHelp,
      submitLabel: l10n.adminPartnersAddCode,
      submitKey: const Key('adminPartnerCodeSubmit'),
      busy: _busy,
      onSubmit: _submit,
      children: [
        TextField(
          key: const Key('adminPartnerCodeField'),
          controller: _code,
          autofocus: true,
          textCapitalization: TextCapitalization.characters,
          autocorrect: false,
          decoration: InputDecoration(labelText: l10n.adminPartnersCode),
        ),
        TextField(
          controller: _dodo,
          autocorrect: false,
          decoration: InputDecoration(labelText: l10n.adminPartnersDodoCode),
        ),
        TextField(
          controller: _apple,
          autocorrect: false,
          decoration: InputDecoration(labelText: l10n.adminPartnersAppleCode),
        ),
        TextField(
          controller: _play,
          autocorrect: false,
          decoration: InputDecoration(labelText: l10n.adminPartnersPlayCode),
        ),
        TextField(
          controller: _uses,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: l10n.adminPartnersWaitlistUses),
        ),
      ],
    );
  }
}
