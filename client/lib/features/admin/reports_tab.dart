import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../moderation/report_sheet.dart';
import '../settings/support_screen.dart' show feedbackKindIcon, feedbackKindLabel, supportTopicLabel;
import 'admin_nav.dart';
import 'ui/admin_ui.dart';

final _contentReportsProvider = FutureProvider.autoDispose<List<ContentReport>>(
  (r) => r.watch(backendProvider).adminContentReports(),
);
final _reportedLinksProvider = FutureProvider.autoDispose<List<ReportedCreation>>(
  (r) => r.watch(backendProvider).adminReportedLinks(),
);
final _ticketsProvider = FutureProvider.autoDispose.family<List<SupportTicketRow>, String>(
  (r, status) => r.watch(backendProvider).adminSupportTickets(status: status),
);
final _feedbackProvider = FutureProvider.autoDispose.family<List<FeedbackRow>, String>(
  (r, status) => r.watch(backendProvider).adminFeedback(status: status),
);
final _supportWebProvider = FutureProvider.autoDispose<SupportWebStats>(
  (r) => r.watch(backendProvider).adminSupportWebStats(),
);

/// A reason the server sent as text ('phishing'), in words when the app knows it.
String _reasonText(BuildContext context, String raw) {
  for (final r in ReportReason.values) {
    if (r.value == raw) return reportReasonLabel(context, r);
  }
  final words = raw.replaceAll(RegExp(r'[_\-]+'), ' ').trim();
  return words.isEmpty ? raw : words[0].toUpperCase() + words.substring(1);
}

/// Admin console > Reports (D-301): what people reported inside the app, then public links people
/// reported (D-281). Each report can be dealt with (optionally suspending the workspace) or dismissed.
class ReportsTab extends ConsumerStatefulWidget {
  const ReportsTab({super.key});

  @override
  ConsumerState<ReportsTab> createState() => _ReportsTabState();
}

class _ReportsTabState extends ConsumerState<ReportsTab> {
  var _kind = 'all';

  String _kindLabel(ReportTargetKind k) => switch (k) {
    ReportTargetKind.message => context.l10n.reportKindReply,
    ReportTargetKind.bot => context.l10n.reportKindBot,
    ReportTargetKind.user => context.l10n.reportKindPerson,
    ReportTargetKind.galleryItem => context.l10n.reportKindGallery,
    ReportTargetKind.workspace => context.l10n.reportKindWorkspace,
  };

  Future<void> _refresh() async {
    ref.invalidate(_reportedLinksProvider);
    ref.invalidate(_contentReportsProvider);
    try {
      await ref.read(_contentReportsProvider.future);
    } catch (_) {
      // The page shows the error.
    }
  }

  /// [choice] is 'actioned', 'suspend' or 'dismiss'. Suspending asks first.
  Future<void> _review(ContentReport r, String choice) async {
    final l10n = context.l10n;
    if (choice == 'suspend') {
      final ok = await adminConfirm(
        context,
        title: l10n.adminReportsSuspendTitle(r.targetOrgName ?? ''),
        message: l10n.adminReportsSuspendBody,
        confirmLabel: l10n.adminReportsSuspend,
        destructive: true,
        confirmKey: const Key('confirmReportSuspend'),
      );
      if (!ok || !mounted) return;
    }
    final ok = await runGuarded(context, () async {
      await ref.read(backendProvider).reviewContentReport(r.id, actioned: choice != 'dismiss', suspendWorkspace: choice == 'suspend');
      return true;
    });
    if (ok != true || !mounted) return;
    showSuccess(context, switch (choice) {
      'suspend' => l10n.adminReportsSuspendedDone,
      'dismiss' => l10n.adminReportsDismissedDone,
      _ => l10n.adminReportsActionedDone,
    });
    ref.invalidate(_contentReportsProvider);
  }

  Future<void> _takeDown(ReportedCreation c) async {
    final l10n = context.l10n;
    final down = !c.takenDown;
    if (down) {
      final ok = await adminConfirm(
        context,
        title: l10n.adminReportsTakeDownTitle(c.title),
        message: l10n.adminReportsTakeDownBody,
        confirmLabel: l10n.reportsTakeDown,
        destructive: true,
        confirmKey: const Key('confirmTakeDown'),
      );
      if (!ok || !mounted) return;
    }
    final ok = await runGuarded(context, () async {
      await ref.read(backendProvider).takeDownLink(c.id, down);
      return true;
    });
    if (ok != true || !mounted) return;
    showSuccess(context, down ? l10n.adminReportsTakenDownDone : l10n.adminReportsRestoredDone);
    ref.invalidate(_reportedLinksProvider);
  }

  /// A page the phishing and malware check held (D-550): visitors see it again.
  Future<void> _approve(ReportedCreation c) async {
    final ok = await runGuarded(context, () async {
      await ref.read(backendProvider).approveHeldLink(c.id);
      return true;
    });
    if (ok != true || !mounted) return;
    showSuccess(context, context.l10n.adminReportsApprovedDone);
    ref.invalidate(_reportedLinksProvider);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncView<List<ContentReport>>(
      value: ref.watch(_contentReportsProvider),
      onRetry: () => ref.invalidate(_contentReportsProvider),
      loading: const SkeletonPage(
        maxWidth: kAdminContentMaxWidth,
        children: [
          SkeletonSectionHeader(),
          SkeletonCard(height: 150),
          SkeletonCard(height: 150),
          SkeletonSectionHeader(),
          SkeletonGroupedCard(count: 2, row: SkeletonRow(trailing: SkeletonTrailing.button)),
        ],
      ),
      data: _content,
    );
  }

  Widget _content(List<ContentReport> items) {
    final l10n = context.l10n;
    final kinds = [for (final k in ReportTargetKind.values) if (items.any((r) => r.targetKind == k)) k];
    // A filter whose last report went away falls back to all.
    final kind = _kind == 'all' || kinds.any((k) => k.name == _kind) ? _kind : 'all';
    final shown = [for (final r in items) if (kind == 'all' || r.targetKind.name == kind) r];
    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(section: AdminSection.reports, onRefresh: _refresh),
        SectionHeader(title: l10n.reportsInApp, count: '${items.length}'),
        if (items.isEmpty)
          AdminEmptyCard(icon: LucideIcons.shieldCheck, message: l10n.reportsNone)
        else ...[
          if (kinds.length > 1)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.sm),
              child: AdminFilterChips<String>(
                values: ['all', for (final k in kinds) k.name],
                labels: {'all': l10n.adminReportsAll, for (final k in kinds) k.name: _kindLabel(k)},
                counts: {'all': items.length, for (final k in kinds) k.name: items.where((r) => r.targetKind == k).length},
                selected: kind,
                onSelected: (v) => setState(() => _kind = v),
              ),
            ),
          if (shown.isEmpty)
            AdminEmptyCard(icon: LucideIcons.searchX, message: l10n.adminReportsNoMatch)
          else
            Column(
              spacing: AppSpace.sm,
              children: [
                for (final r in shown)
                  _ReportCard(
                    key: Key('contentReport-${r.id}'),
                    report: r,
                    kind: _kindLabel(r.targetKind),
                    onReview: (choice) => _review(r, choice),
                  ),
              ],
            ),
        ],
        SectionHeader(title: l10n.reportsPublicLinks),
        switch (ref.watch(_reportedLinksProvider)) {
          AsyncData(:final value) when value.isEmpty => AdminEmptyCard(icon: LucideIcons.shieldCheck, message: l10n.reportsNoLinks),
          AsyncData(:final value) => _links(value),
          AsyncError(:final error) => AdminEmptyCard(icon: LucideIcons.circleAlert, message: errorText(context, error)),
          _ => const SkeletonGroupedCard(count: 2, row: SkeletonRow(trailing: SkeletonTrailing.button)),
        },
      ],
    );
  }

  Widget _links(List<ReportedCreation> list) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final muted = context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant);
    return GroupedCard(
      children: [
        for (final c in list)
          _link(c, l10n, scheme, muted),
      ],
    );
  }

  Widget _link(ReportedCreation c, AppLocalizations l10n, ColorScheme scheme, TextStyle? muted) {
    final held = c.held ?? false;
    // The automatic check's own report says the same as the held reason below; no need for both.
    final showReason = !(held && c.lastReason.startsWith('Automatic check:'));
    return Padding(
            key: Key('reportedLink-${c.id}'),
            padding: const EdgeInsetsDirectional.fromSTEB(AppSpace.md, 12, AppSpace.xs, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  c.takenDown ? LucideIcons.eyeOff : (held ? LucideIcons.shieldAlert : LucideIcons.link),
                  size: 18,
                  color: c.takenDown ? scheme.onSurfaceVariant : (held ? scheme.error : context.appColors.warning),
                ),
                const SizedBox(width: AppSpace.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c.title, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 2),
                      Text(c.orgName, style: muted),
                      if (held && (c.heldReason ?? '').isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          l10n.adminReportsHeldReason(c.heldReason!),
                          key: Key('reportedLinkHeld-${c.id}'),
                          style: muted,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          if (held) AdminStatusPill(l10n.adminReportsHeld, tone: AdminTone.negative, icon: LucideIcons.shieldAlert),
                          AdminStatusPill(l10n.reportsCount(c.reports), tone: c.reports >= 3 ? AdminTone.negative : AdminTone.warning),
                          if (showReason) AdminStatusPill(_reasonText(context, c.lastReason)),
                          if (c.takenDown) AdminStatusPill(l10n.adminReportsTakenDown, tone: AdminTone.neutral, icon: LucideIcons.eyeOff),
                          TimeAgo(c.lastReportedAt, style: muted),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpace.xs),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (held && !c.takenDown) ...[
                      FilledButton.tonal(key: Key('reportedLinkApprove-${c.id}'), onPressed: () => _approve(c), child: Text(l10n.adminReportsApprove)),
                      const SizedBox(height: AppSpace.xs),
                    ],
                    c.takenDown
                        ? TextButton(key: Key('reportedLinkToggle-${c.id}'), onPressed: () => _takeDown(c), child: Text(l10n.reportsRestore))
                        : OutlinedButton(
                            key: Key('reportedLinkToggle-${c.id}'),
                            style: OutlinedButton.styleFrom(foregroundColor: scheme.error),
                            onPressed: () => _takeDown(c),
                            child: Text(l10n.reportsTakeDown),
                          ),
                  ],
                ),
              ],
            ),
          );
  }
}

/// One report: what and why, the reported text in a quote, the reporter's note, who and when, and
/// what to do about it.
class _ReportCard extends StatefulWidget {
  const _ReportCard({super.key, required this.report, required this.kind, required this.onReview});
  final ContentReport report;
  final String kind;
  final ValueChanged<String> onReview;

  @override
  State<_ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<_ReportCard> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final r = widget.report;
    final scheme = context.colorScheme;
    final muted = context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant);
    final snapshot = r.snapshot?.trim() ?? '';
    final note = r.note?.trim() ?? '';
    final tone = r.sameTarget >= 3 ? AdminTone.negative : AdminTone.warning;
    Widget meta(IconData icon, Widget child) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon, size: 14, color: scheme.onSurfaceVariant), const SizedBox(width: 4), Flexible(child: child)],
    );
    return AppCard(
      padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.md, AppSpace.md, AppSpace.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: adminToneColor(context, tone).withValues(alpha: 0.14), borderRadius: BorderRadius.circular(AppRadius.icon)),
                child: Icon(LucideIcons.flag, size: 16, color: adminToneColor(context, tone)),
              ),
              const SizedBox(width: AppSpace.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.kind, style: muted),
                    Text(reportReasonLabel(context, r.reason), style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              if (r.sameTarget > 1) ...[const SizedBox(width: AppSpace.xs), AdminStatusPill(l10n.reportsCount(r.sameTarget), tone: tone)],
            ],
          ),
          if (snapshot.isNotEmpty) ...[
            const SizedBox(height: AppSpace.sm),
            LayoutBuilder(
              builder: (context, constraints) {
                final style = context.textTheme.bodyMedium;
                // Only offer "Show more" when the text runs past three lines.
                final painter = TextPainter(
                  text: TextSpan(text: snapshot, style: style),
                  maxLines: 3,
                  textDirection: Directionality.of(context),
                  textScaler: MediaQuery.textScalerOf(context),
                )..layout(maxWidth: (constraints.maxWidth - 15).clamp(0, double.infinity));
                final long = painter.didExceedMaxLines;
                painter.dispose();
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
                  decoration: BoxDecoration(
                    color: scheme.surfaceContainerHighest.withValues(alpha: 0.5),
                    border: BorderDirectional(start: BorderSide(color: adminToneColor(context, tone), width: 3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot, style: style, maxLines: _expanded ? null : 3, overflow: _expanded ? null : TextOverflow.ellipsis),
                      if (long)
                        GestureDetector(
                          onTap: () => setState(() => _expanded = !_expanded),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              _expanded ? l10n.adminReportsShowLess : l10n.adminReportsShowMore,
                              style: context.textTheme.labelMedium?.copyWith(color: scheme.primary, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
          if (note.isNotEmpty) ...[
            const SizedBox(height: AppSpace.sm),
            meta(LucideIcons.messageSquareText, Text('“$note”', style: context.textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic))),
          ],
          const SizedBox(height: AppSpace.sm),
          Wrap(
            spacing: AppSpace.md,
            runSpacing: 4,
            children: [
              if (r.targetOrgName case final String org) meta(LucideIcons.building2, Text(org, style: muted)),
              if (r.reporterEmail case final String email) meta(LucideIcons.user, Text(email, style: muted)),
              meta(LucideIcons.clock, TimeAgo(r.createdAt, style: muted)),
            ],
          ),
          const SizedBox(height: AppSpace.xs),
          Divider(height: AppSpace.md, color: context.appColors.hairline),
          Wrap(
            spacing: AppSpace.xs,
            runSpacing: AppSpace.xs,
            children: [
              FilledButton.tonalIcon(
                key: Key('reviewActioned-${r.id}'),
                onPressed: () => widget.onReview('actioned'),
                icon: const Icon(LucideIcons.check, size: 16),
                label: Text(l10n.reportMarkActioned),
              ),
              if (r.targetOrgId != null)
                OutlinedButton.icon(
                  key: Key('reviewSuspend-${r.id}'),
                  style: OutlinedButton.styleFrom(foregroundColor: scheme.error),
                  onPressed: () => widget.onReview('suspend'),
                  icon: const Icon(LucideIcons.ban, size: 16),
                  label: Text(l10n.adminReportsSuspend),
                ),
              TextButton.icon(
                key: Key('reviewDismiss-${r.id}'),
                onPressed: () => widget.onReview('dismiss'),
                icon: const Icon(LucideIcons.x, size: 16),
                label: Text(l10n.adminReportsDismiss),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Admin console > Support (D-303): messages people sent from Help & support, and the website
/// helper's day. The messages themselves are in the support inbox; this is the list to keep track.
class SupportTicketsTab extends ConsumerStatefulWidget {
  const SupportTicketsTab({super.key});

  @override
  ConsumerState<SupportTicketsTab> createState() => _SupportTicketsTabState();
}

class _SupportTicketsTabState extends ConsumerState<SupportTicketsTab> {
  var _status = 'open';
  var _query = '';

  Future<void> _refresh() async {
    ref.invalidate(_supportWebProvider);
    for (final s in const ['open', 'closed', 'all']) {
      ref.invalidate(_ticketsProvider(s));
    }
    for (final s in _FeedbackSection.statuses) {
      ref.invalidate(_feedbackProvider(s));
    }
    try {
      await ref.read(_ticketsProvider(_status).future);
    } catch (_) {
      // The page shows the error.
    }
  }

  Future<void> _toggle(SupportTicketRow t) async {
    final l10n = context.l10n;
    final close = t.status == SupportTicketRowStatusEnum.open;
    final ok = await adminConfirm(
      context,
      title: close ? l10n.adminTicketCloseTitle(t.reference) : l10n.adminTicketReopenTitle(t.reference),
      message: close ? l10n.adminTicketCloseBody : l10n.adminTicketReopenBody,
      confirmLabel: close ? l10n.ticketClose : l10n.ticketReopen,
      confirmKey: const Key('confirmTicketToggle'),
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(context, () async {
      await ref.read(backendProvider).setSupportTicketClosed(t.reference, close);
      return true;
    });
    if (done != true || !mounted) return;
    showSuccess(context, close ? l10n.adminTicketClosedDone : l10n.adminTicketReopenedDone);
    for (final s in const ['open', 'closed', 'all']) {
      ref.invalidate(_ticketsProvider(s));
    }
  }

  String _topic(String raw) {
    for (final t in SupportTopic.values) {
      if (t.value == raw) return supportTopicLabel(context, t);
    }
    return raw.isEmpty ? raw : raw[0].toUpperCase() + raw.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncView<List<SupportTicketRow>>(
      value: ref.watch(_ticketsProvider(_status)),
      onRetry: () => ref.invalidate(_ticketsProvider(_status)),
      loading: const SkeletonPage(
        maxWidth: kAdminContentMaxWidth,
        children: [
          SkeletonCard(height: 120),
          SkeletonSectionHeader(),
          SkeletonGroupedCard(count: 5, row: SkeletonRow(trailing: SkeletonTrailing.meta)),
        ],
      ),
      data: _content,
    );
  }

  Widget _content(List<SupportTicketRow> items) {
    final l10n = context.l10n;
    int? count(String s) => s == _status ? items.length : ref.watch(_ticketsProvider(s)).value?.length;
    final q = _query.trim().toLowerCase();
    final shown = [
      for (final t in items)
        if (q.isEmpty ||
            t.reference.toLowerCase().contains(q) ||
            t.subject.toLowerCase().contains(q) ||
            (t.userEmail ?? '').toLowerCase().contains(q))
          t,
    ];
    final counts = <String, int>{
      for (final s in const ['open', 'closed', 'all'])
        if (count(s) case final int n) s: n,
    };
    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(section: AdminSection.support, onRefresh: _refresh),
        if (ref.watch(_supportWebProvider).value case final SupportWebStats w) ...[
          _SupportWebCard(stats: w),
          const SizedBox(height: AppSpace.sm),
        ],
        SectionHeader(title: l10n.tickets),
        AdminListToolbar(
          search: AdminSearchField(key: const Key('ticketSearch'), hint: l10n.adminTicketsSearch, onChanged: (v) => setState(() => _query = v)),
          filters: AdminFilterChips<String>(
            values: const ['open', 'closed', 'all'],
            labels: {'open': l10n.ticketsOpen, 'closed': l10n.ticketsClosed, 'all': l10n.ticketsAll},
            counts: counts,
            selected: _status,
            onSelected: (v) => setState(() => _status = v),
          ),
        ),
        if (items.isEmpty)
          AdminEmptyCard(icon: LucideIcons.inbox, message: l10n.ticketsNone)
        else if (shown.isEmpty)
          AdminEmptyCard(key: const Key('ticketNoMatch'), icon: LucideIcons.searchX, message: l10n.adminTicketsNoMatch)
        else
          _list(shown),
        const _FeedbackSection(),
      ],
    );
  }

  Widget _list(List<SupportTicketRow> items) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    Widget status(SupportTicketRow t) => t.status == SupportTicketRowStatusEnum.open
        ? AdminStatusPill(l10n.ticketsOpen, tone: AdminTone.info)
        : AdminStatusPill(l10n.ticketsClosed, tone: AdminTone.neutral);
    String from(SupportTicketRow t) => t.userEmail ?? l10n.adminTicketsNoEmail;
    return AdminDataList<SupportTicketRow>(
      items: items,
      itemKey: (t) => Key('ticket-${t.reference}'),
      title: (t) => t.subject,
      subtitle: (c, t) => [t.reference, _topic(t.topic), from(t), ?t.orgName].join(' · '),
      badges: (c, t) => [status(t), Padding(padding: const EdgeInsets.only(top: 2), child: TimeAgo(t.createdAt, style: muted))],
      trailing: (c, t) => AdminActionsMenu(
        key: Key('ticketMenu-${t.reference}'),
        actions: [
          AdminMenuAction(
            key: Key('ticketToggle-${t.reference}'),
            label: t.status == SupportTicketRowStatusEnum.open ? l10n.ticketClose : l10n.ticketReopen,
            icon: t.status == SupportTicketRowStatusEnum.open ? LucideIcons.mailCheck : LucideIcons.mailOpen,
            onSelected: () => _toggle(t),
          ),
        ],
      ),
      columns: [
        AdminColumn(
          label: l10n.adminTicketsColMessage,
          flex: 4,
          cell: (c, t) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(t.subject, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text('${t.reference}  ${_topic(t.topic)}', maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
            ],
          ),
        ),
        AdminColumn(
          label: l10n.adminTicketsColFrom,
          flex: 3,
          cell: (c, t) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(from(t), maxLines: 1, overflow: TextOverflow.ellipsis),
              if (t.orgName case final String org) Text(org, maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
            ],
          ),
        ),
        AdminColumn(label: l10n.adminTicketsColStatus, flex: 2, cell: (c, t) => status(t)),
        AdminColumn(label: l10n.adminTicketsColSent, flex: 2, cell: (c, t) => TimeAgo(t.createdAt, style: muted)),
      ],
    );
  }
}

/// Feedback sent from Help & support (D-536): the message itself is here, not in an inbox. New,
/// read and done, with the sender, their workspace, plan and app version.
class _FeedbackSection extends ConsumerStatefulWidget {
  const _FeedbackSection();
  static const statuses = ['new', 'read', 'done', 'all'];

  @override
  ConsumerState<_FeedbackSection> createState() => _FeedbackSectionState();
}

class _FeedbackSectionState extends ConsumerState<_FeedbackSection> {
  var _status = 'new';
  var _query = '';

  String _statusLabel(String s) {
    final l10n = context.l10n;
    return switch (s) {
      'new' => l10n.adminFeedbackNew,
      'read' => l10n.adminFeedbackRead,
      'done' => l10n.adminFeedbackDone,
      _ => l10n.adminFeedbackAll,
    };
  }

  Future<void> _set(FeedbackRow f, FeedbackStatus status) async {
    final done = await runGuarded(context, () async {
      await ref.read(backendProvider).setFeedbackStatus(f.id, status);
      return true;
    });
    if (done != true || !mounted) return;
    for (final s in _FeedbackSection.statuses) {
      ref.invalidate(_feedbackProvider(s));
    }
  }

  Future<void> _open(FeedbackRow f) async {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    if (f.status == FeedbackStatus.new_) unawaited(_set(f, FeedbackStatus.read));
    await showAdaptiveDialog<void>(
      context: context,
      builder: (c) => AlertDialog(
        title: Row(
          children: [
            Icon(feedbackKindIcon(f.kind), size: 20),
            const SizedBox(width: AppSpace.xs),
            Expanded(child: Text(feedbackKindLabel(c, f.kind))),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText(f.message),
              const SizedBox(height: AppSpace.md),
              Text(_meta(f), style: muted),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: f.message));
              if (c.mounted) showMessage(c, l10n.copied);
            },
            child: Text(l10n.adminFeedbackCopy),
          ),
          TextButton(
            key: const Key('feedbackDone'),
            onPressed: () {
              Navigator.pop(c);
              _set(f, FeedbackStatus.done);
            },
            child: Text(l10n.adminFeedbackMarkDone),
          ),
          TextButton(onPressed: () => Navigator.pop(c), child: Text(l10n.close)),
        ],
      ),
    );
  }

  /// Post it to the public ideas board in the owner's words (D-536).
  Future<void> _publish(FeedbackRow f) async {
    final l10n = context.l10n;
    final words = await showAdaptiveDialog<({String title, String description})>(
      context: context,
      builder: (_) => _PublishIdeaDialog(message: f.message),
    );
    if (words == null || !mounted) return;
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).publishFeedback(f.id, title: words.title, description: words.description),
    );
    if (done == null || !mounted) return;
    showSuccess(context, l10n.adminFeedbackPublished);
    for (final s in _FeedbackSection.statuses) {
      ref.invalidate(_feedbackProvider(s));
    }
  }

  String _meta(FeedbackRow f) => [
    f.userEmail ?? context.l10n.adminTicketsNoEmail,
    ?f.orgName,
    ?f.plan,
    ?f.platform,
    ?f.appVersion,
    if (!f.contactOk) context.l10n.adminFeedbackNoContact,
  ].join(' · ');

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final value = ref.watch(_feedbackProvider(_status));
    final items = value.value;
    int? count(String s) => ref.watch(_feedbackProvider(s)).value?.length;
    final q = _query.trim().toLowerCase();
    final shown = [
      for (final f in items ?? const <FeedbackRow>[])
        if (q.isEmpty ||
            f.message.toLowerCase().contains(q) ||
            (f.userEmail ?? '').toLowerCase().contains(q))
          f,
    ];
    return Column(
      key: const Key('adminFeedback'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.adminFeedback),
        AdminListToolbar(
          search: AdminSearchField(key: const Key('feedbackSearch'), hint: l10n.adminFeedbackSearch, onChanged: (v) => setState(() => _query = v)),
          filters: AdminFilterChips<String>(
            values: _FeedbackSection.statuses,
            labels: {for (final s in _FeedbackSection.statuses) s: _statusLabel(s)},
            counts: {
              for (final s in _FeedbackSection.statuses)
                if (count(s) case final int n) s: n,
            },
            selected: _status,
            onSelected: (v) => setState(() => _status = v),
          ),
        ),
        if (value.hasError && items == null)
          AdminEmptyCard(icon: LucideIcons.triangleAlert, message: errorText(context, value.error!))
        else if (items == null)
          const SkeletonGroupedCard(count: 3, row: SkeletonRow(trailing: SkeletonTrailing.meta))
        else if (items.isEmpty)
          AdminEmptyCard(icon: LucideIcons.inbox, message: l10n.adminFeedbackNone)
        else if (shown.isEmpty)
          AdminEmptyCard(icon: LucideIcons.searchX, message: l10n.adminFeedbackNoMatch)
        else
          _list(shown),
      ],
    );
  }

  Widget _list(List<FeedbackRow> items) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    Widget status(FeedbackRow f) => switch (f.status) {
      FeedbackStatus.new_ => AdminStatusPill(l10n.adminFeedbackNew, tone: AdminTone.info),
      FeedbackStatus.read => AdminStatusPill(l10n.adminFeedbackRead, tone: AdminTone.neutral),
      FeedbackStatus.done => AdminStatusPill(l10n.adminFeedbackDone, tone: AdminTone.positive),
    };
    String oneLine(String m) => m.replaceAll(RegExp(r'\s+'), ' ').trim();
    return AdminDataList<FeedbackRow>(
      items: items,
      itemKey: (f) => Key('feedback-${f.id}'),
      leading: (c, f) => Icon(feedbackKindIcon(f.kind), size: 18),
      title: (f) => oneLine(f.message),
      subtitle: (c, f) => [feedbackKindLabel(c, f.kind), _meta(f)].join(' · '),
      badges: (c, f) => [status(f), if (f.ideasPostUrl != null) AdminStatusPill(l10n.adminFeedbackOnBoard, tone: AdminTone.positive), Padding(padding: const EdgeInsets.only(top: 2), child: TimeAgo(f.createdAt, style: muted))],
      onTap: _open,
      trailing: (c, f) => AdminActionsMenu(
        key: Key('feedbackMenu-${f.id}'),
        actions: [
          for (final (s, label, icon) in [
            (FeedbackStatus.new_, l10n.adminFeedbackMarkNew, LucideIcons.circleDot),
            (FeedbackStatus.read, l10n.adminFeedbackMarkRead, LucideIcons.eye),
            (FeedbackStatus.done, l10n.adminFeedbackMarkDone, LucideIcons.check),
          ])
            if (f.status != s)
              AdminMenuAction(
                key: Key('feedbackSet-${s.value}-${f.id}'),
                label: label,
                icon: icon,
                onSelected: () => _set(f, s),
              ),
          if (f.ideasPostUrl case final String url)
            AdminMenuAction(
              key: Key('feedbackOpenIdea-${f.id}'),
              label: l10n.adminFeedbackOpenIdea,
              icon: LucideIcons.externalLink,
              onSelected: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
            )
          else
            AdminMenuAction(
              key: Key('feedbackPublish-${f.id}'),
              label: l10n.adminFeedbackPublish,
              icon: LucideIcons.lightbulb,
              onSelected: () => _publish(f),
            ),
        ],
      ),
      columns: [
        AdminColumn(
          label: l10n.adminFeedbackColMessage,
          flex: 5,
          cell: (c, f) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(oneLine(f.message), maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text([feedbackKindLabel(c, f.kind), ?f.platform, ?f.appVersion].join(' · '), maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
            ],
          ),
        ),
        AdminColumn(
          label: l10n.adminFeedbackColFrom,
          flex: 3,
          cell: (c, f) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(f.userEmail ?? l10n.adminTicketsNoEmail, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text([?f.orgName, ?f.plan, if (!f.contactOk) l10n.adminFeedbackNoContact].join(' · '), maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
            ],
          ),
        ),
        AdminColumn(label: l10n.adminFeedbackColStatus, flex: 2, cell: (c, f) => status(f)),
        AdminColumn(label: l10n.adminFeedbackColSent, flex: 2, cell: (c, f) => TimeAgo(f.createdAt, style: muted)),
      ],
    );
  }
}

/// The owner rewords feedback as an idea anyone can read before it goes on the ideas board.
class _PublishIdeaDialog extends StatefulWidget {
  const _PublishIdeaDialog({required this.message});
  final String message;

  @override
  State<_PublishIdeaDialog> createState() => _PublishIdeaDialogState();
}

class _PublishIdeaDialogState extends State<_PublishIdeaDialog> {
  late final _title = TextEditingController(text: _firstLine(widget.message));
  late final _text = TextEditingController(text: widget.message.trim());

  static String _firstLine(String m) {
    final one = m.replaceAll(RegExp(r'\s+'), ' ').trim();
    return one.length > 100 ? one.substring(0, 100) : one;
  }

  @override
  void initState() {
    super.initState();
    _title.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _title.dispose();
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.adminFeedbackPublish),
      content: SizedBox(
        width: 480,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.adminFeedbackPublishHelp),
              const SizedBox(height: AppSpace.md),
              TextField(
                key: const Key('feedbackPublishTitle'),
                controller: _title,
                maxLength: 100,
                decoration: InputDecoration(labelText: l10n.adminFeedbackPublishTitleLabel),
              ),
              TextField(
                key: const Key('feedbackPublishText'),
                controller: _text,
                minLines: 3,
                maxLines: 8,
                decoration: InputDecoration(labelText: l10n.adminFeedbackPublishTextLabel, alignLabelWithHint: true),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        FilledButton(
          key: const Key('feedbackPublishGo'),
          onPressed: _title.text.trim().length < 3
              ? null
              : () => Navigator.pop(context, (title: _title.text.trim(), description: _text.text.trim())),
          child: Text(l10n.adminFeedbackPublish),
        ),
      ],
    );
  }
}

/// The website helper's day: on or off, messages and spend against the budget, paused addresses,
/// and the questions it couldn't answer.
class _SupportWebCard extends StatelessWidget {
  const _SupportWebCard({required this.stats});
  final SupportWebStats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final w = stats;
    final scheme = context.colorScheme;
    final muted = context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant);
    String usd(num v) => formatUsd(v, l10n.localeName);
    final budget = w.dailyBudgetUsd;
    return AppCard(
      key: const Key('supportWebCard'),
      padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.md, AppSpace.md, AppSpace.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.lifeBuoy, size: 16, color: scheme.onSurfaceVariant),
              const SizedBox(width: AppSpace.xs),
              Expanded(child: Text(l10n.supportWebTitle, style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700))),
              AdminStatusPill(w.on_ ? l10n.supportWebOn : l10n.supportWebOff, tone: w.on_ ? AdminTone.positive : AdminTone.neutral),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          AdminStatStrip(
            maxColumns: 3,
            stats: [
              AdminStat(label: l10n.adminSupportWebMessages, value: '${w.messagesToday}'),
              AdminStat(label: l10n.adminSupportWebSpent, value: usd(w.usdToday)),
              AdminStat(
                label: l10n.adminSupportWebPausedStat,
                value: '${w.pausedAddresses}',
                tone: w.pausedAddresses > 0 ? AdminTone.warning : null,
              ),
            ],
          ),
          if (budget > 0)
            AdminMeter(fraction: w.usdToday / budget, start: l10n.adminSupportWebBudget(usd(w.usdToday), usd(budget))),
          if (w.gaps.isNotEmpty)
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                key: const Key('supportWebGaps'),
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.only(bottom: AppSpace.sm),
                title: Text(l10n.supportWebGaps(w.gaps.length), style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                children: [
                  for (final g in w.gaps)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(LucideIcons.messageCircleQuestion, size: 15, color: scheme.onSurfaceVariant),
                          ),
                          const SizedBox(width: AppSpace.xs),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(g.question, style: context.textTheme.bodyMedium),
                                Wrap(
                                  spacing: AppSpace.sm,
                                  children: [
                                    if (g.page case final String page) Text(page, style: muted),
                                    TimeAgo(g.createdAt, style: muted),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
          else
            const SizedBox(height: AppSpace.sm),
        ],
      ),
    );
  }
}
