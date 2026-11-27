import 'package:casama_sdk/casama_sdk.dart'
    show AdminAgentLogEntry, AdminAgentRequest, AdminAgentRequestStatusEnum;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/admin_security.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import '../../ui/page.dart';
import 'admin_security_gate.dart';
import 'ui/admin_ui.dart';

/// Agent admin access (D-598, docs/AGENT-ADMIN-ACCESS-PLAN.md): agents read the admin console with
/// their own key and ask the owner before any change. Recent requests and what agents did.
final adminAgentRequestsProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(backendProvider).adminAgentRequests(),
);

/// A grant still running: approved and not yet past its end.
bool agentGrantLive(AdminAgentRequest r, [DateTime? now]) =>
    r.status == AdminAgentRequestStatusEnum.approved &&
    (r.validUntil?.isAfter(now ?? DateTime.now()) ?? false);

/// Whole minutes left on a live grant, at least 1.
int agentMinutesLeft(AdminAgentRequest r, [DateTime? now]) {
  final left = r.validUntil!.difference(now ?? DateTime.now());
  return (left.inSeconds / 60).ceil().clamp(1, 30);
}

/// A fresh check that isn't the PIN, unless one was just made: approving an agent takes the
/// owner's own Face ID, passkey or sign-in, like changing the PIN.
Future<bool> confirmAgentApproval(BuildContext context, WidgetRef ref) async {
  final me = ref.read(backendProvider).userId;
  if (AdminSecurity.recentlyVerified(me) &&
      AdminSecurity.lastVerifiedMethod != 'pin') {
    return true;
  }
  return showAdminConfirmation(
    context,
    allowPin: false,
    title: context.l10n.adminAgentConfirm,
  );
}

/// Admin → Security's Agents section: a live grant with Stop, requests waiting for an answer, and
/// what agents did lately. Hidden until an agent has asked or done something.
List<Widget> adminAgentSection(BuildContext context, WidgetRef ref) {
  final l10n = context.l10n;
  final data = ref.watch(adminAgentRequestsProvider).value;
  if (data == null || (data.items.isEmpty && data.log.isEmpty)) return const [];
  final now = DateTime.now();
  final live = data.items.where((r) => agentGrantLive(r, now)).toList();
  final waiting = data.items
      .where(
        (r) =>
            r.status == AdminAgentRequestStatusEnum.pending &&
            r.expiresAt.isAfter(now),
      )
      .toList();

  Future<void> stop(AdminAgentRequest r) async {
    final ended = await runGuarded(
      context,
      () => ref.read(backendProvider).endAdminAgentRequest(r.id),
    );
    ref.invalidate(adminAgentRequestsProvider);
    if (ended != null && context.mounted) {
      showSuccess(context, l10n.adminAgentStopped);
    }
  }

  return [
    SectionHeader(title: l10n.adminAgentTitle),
    GroupedCard(
      children: [
        for (final r in live)
          GroupedTile(
            key: ValueKey('adminAgentLive-${r.id}'),
            icon: LucideIcons.bot,
            title: r.keyName,
            subtitle:
                '${l10n.adminAgentLive(agentMinutesLeft(r, now))} · '
                '${l10n.adminAgentChanges(r.changes)}\n${r.reason}',
            trailing: TextButton(
              key: ValueKey('adminAgentStop-${r.id}'),
              style: TextButton.styleFrom(
                foregroundColor: context.colorScheme.error,
              ),
              onPressed: () => stop(r),
              child: Text(l10n.adminAgentStop),
            ),
          ),
        for (final r in waiting)
          GroupedTile(
            key: ValueKey('adminAgentWaiting-${r.id}'),
            icon: LucideIcons.bellRing,
            title: r.keyName,
            subtitle: '${l10n.adminAgentWaiting} · ${r.reason}',
            trailing: TextButton(
              onPressed: () async {
                await context.push('/admin/approve/${r.id}');
                ref.invalidate(adminAgentRequestsProvider);
              },
              child: Text(l10n.adminAgentReview),
            ),
          ),
        if (live.isEmpty && waiting.isEmpty)
          GroupedTile(
            icon: LucideIcons.bot,
            title: l10n.adminAgentTitle,
            subtitle: l10n.adminAgentHelp,
          ),
      ],
    ),
    if (data.log.isNotEmpty) ...[
      const SizedBox(height: AppSpace.md),
      SectionHeader(title: l10n.adminAgentLogTitle),
      GroupedCard(
        children: [
          for (final (i, e) in data.log.take(20).indexed)
            _LogRow(key: ValueKey('adminAgentLog-$i'), entry: e),
        ],
      ),
    ],
    const SizedBox(height: AppSpace.lg),
  ];
}

class _LogRow extends StatelessWidget {
  const _LogRow({super.key, required this.entry});
  final AdminAgentLogEntry entry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );
    final what = [
      l10n.adminAgentAction(entry.action),
      if (entry.method != null && entry.path != null)
        '${entry.method} ${entry.path!.replaceFirst('/v1/admin/', '')}',
      if (entry.status != null && entry.status! >= 400) '${entry.status}',
    ].join(' · ');
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.md,
        vertical: AppSpace.xs,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(what, style: context.textTheme.bodyMedium),
                if (entry.keyName != null) Text(entry.keyName!, style: muted),
              ],
            ),
          ),
          TimeAgo(entry.at, style: muted, label: (when) => when),
        ],
      ),
    );
  }
}

/// The screen an agent's request push opens (`/admin/approve/<id>`): who asks, why and for how
/// long, with Approve (Face ID, a passkey or sign-in, never the PIN) and Deny.
class AdminAgentApproveScreen extends ConsumerStatefulWidget {
  const AdminAgentApproveScreen({super.key, required this.id});
  final String id;

  @override
  ConsumerState<AdminAgentApproveScreen> createState() =>
      _AdminAgentApproveScreenState();
}

class _AdminAgentApproveScreenState
    extends ConsumerState<AdminAgentApproveScreen> {
  late Future<AdminAgentRequest> _request = _load();
  bool _busy = false;

  Future<AdminAgentRequest> _load() =>
      ref.read(backendProvider).adminAgentRequest(widget.id);

  Future<void> _answer(bool approve) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      if (approve && !await confirmAgentApproval(context, ref)) return;
      if (!mounted) return;
      final backend = ref.read(backendProvider);
      final done = await runGuarded(
        context,
        () => approve
            ? backend.approveAdminAgentRequest(widget.id)
            : backend.denyAdminAgentRequest(widget.id),
      );
      if (done != null && mounted) {
        setState(() {
          _request = Future.value(done);
        });
        ref.invalidate(adminAgentRequestsProvider);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _stop() async {
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).endAdminAgentRequest(widget.id),
    );
    if (done != null && mounted) {
      setState(() {
        _request = Future.value(done);
      });
      ref.invalidate(adminAgentRequestsProvider);
      showSuccess(context, context.l10n.adminAgentStopped);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FutureBuilder<AdminAgentRequest>(
      future: _request,
      builder: (context, snap) => SubPage(
        title: l10n.adminAgentTitle,
        // Opened from a push, often with nothing behind it to go back to.
        backFallback: '/settings/admin?tab=security',
        children: [
          if (snap.hasError)
            FormNote(
              errorText(context, snap.error!),
              icon: LucideIcons.triangleAlert,
            ),
          if (snap.data == null && !snap.hasError) const SkeletonList(count: 1),
          if (snap.data case final r?) _card(context, r),
        ],
      ),
    );
  }

  Widget _card(BuildContext context, AdminAgentRequest r) {
    final l10n = context.l10n;
    final now = DateTime.now();
    final pending =
        r.status == AdminAgentRequestStatusEnum.pending &&
        r.expiresAt.isAfter(now);
    final live = agentGrantLive(r, now);
    final (String? status, AdminTone tone) = switch (r.status) {
      _ when live => (
        l10n.adminAgentLive(agentMinutesLeft(r, now)),
        AdminTone.positive,
      ),
      AdminAgentRequestStatusEnum.pending when !pending => (
        l10n.adminAgentExpired,
        AdminTone.neutral,
      ),
      AdminAgentRequestStatusEnum.pending => (null, AdminTone.neutral),
      AdminAgentRequestStatusEnum.denied => (
        l10n.adminAgentDenied,
        AdminTone.neutral,
      ),
      AdminAgentRequestStatusEnum.expired => (
        l10n.adminAgentExpired,
        AdminTone.neutral,
      ),
      _ => (l10n.adminAgentEnded, AdminTone.neutral),
    };
    final muted = TextStyle(color: context.colorScheme.onSurfaceVariant);
    return AppCard(
      key: const Key('adminAgentRequest'),
      padding: const EdgeInsets.all(AppSpace.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpace.md,
        children: [
          Text(
            l10n.adminAgentRequestTitle(r.keyName),
            style: context.textTheme.titleMedium,
          ),
          Text(r.reason, key: const Key('adminAgentReason')),
          Text(l10n.adminAgentFor(r.minutes), style: muted),
          if (status != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: AdminStatusPill(
                status,
                key: const Key('adminAgentStatus'),
                tone: tone,
              ),
            ),
          if (r.changes > 0)
            Text(l10n.adminAgentChanges(r.changes), style: muted),
          if (pending) Text(l10n.adminAgentApproveHelp, style: muted),
          if (pending)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: AppSpace.sm,
              children: [
                TextButton(
                  key: const Key('adminAgentDeny'),
                  onPressed: _busy ? null : () => _answer(false),
                  child: Text(l10n.adminAgentDeny),
                ),
                FilledButton(
                  key: const Key('adminAgentApprove'),
                  onPressed: _busy ? null : () => _answer(true),
                  child: Text(l10n.adminAgentApprove),
                ),
              ],
            ),
          if (live)
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                key: const Key('adminAgentStop'),
                style: TextButton.styleFrom(
                  foregroundColor: context.colorScheme.error,
                ),
                onPressed: _stop,
                child: Text(l10n.adminAgentStop),
              ),
            ),
        ],
      ),
    );
  }
}
