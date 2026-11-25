import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';
import 'workspaces_tab.dart' show AdminPeopleSkeleton;

final _adminAbuseProvider = FutureProvider.autoDispose<List<AbuseEvent>>((r) => r.watch(backendProvider).adminAbuseEvents());

enum _AbuseFilter { all, mining, ports, floods, signups, suspensions }

_AbuseFilter? _group(String kind) => switch (kind) {
  'mining_pool' => _AbuseFilter.mining,
  'blocked_port' => _AbuseFilter.ports,
  'egress_flood' => _AbuseFilter.floods,
  'signup_blocked' => _AbuseFilter.signups,
  'suspended' || 'unsuspended' => _AbuseFilter.suspensions,
  _ => null,
};

/// Recent abuse signals and actions (D-094).
class AbuseTab extends ConsumerStatefulWidget {
  const AbuseTab({super.key});

  @override
  ConsumerState<AbuseTab> createState() => _AbuseTabState();
}

class _AbuseTabState extends ConsumerState<AbuseTab> {
  _AbuseFilter _filter = _AbuseFilter.all;

  Future<void> _refresh() async {
    ref.invalidate(_adminAbuseProvider);
    await ref.read(_adminAbuseProvider.future).catchError((_) => <AbuseEvent>[]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AsyncView<List<AbuseEvent>>(
      value: ref.watch(_adminAbuseProvider),
      onRetry: () => ref.invalidate(_adminAbuseProvider),
      loading: const AdminPeopleSkeleton(stats: 0),
      data: (items) {
        final header = AdminSectionHeader(section: AdminSection.abuse, onRefresh: _refresh);
        if (items.isEmpty) {
          return AdminSectionList(
            onRefresh: _refresh,
            children: [
              header,
              AdminEmptyCard(icon: LucideIcons.shieldCheck, message: l10n.adminNoAbuse),
            ],
          );
        }
        final counts = {
          for (final f in _AbuseFilter.values) f: f == _AbuseFilter.all ? items.length : items.where((e) => _group(e.kind) == f).length,
        };
        final visible = _filter == _AbuseFilter.all ? items : [for (final e in items) if (_group(e.kind) == _filter) e];
        return AdminSectionList(
          onRefresh: _refresh,
          children: [
            header,
            AdminListToolbar(
              filters: AdminFilterChips<_AbuseFilter>(
                values: _AbuseFilter.values,
                labels: {
                  _AbuseFilter.all: l10n.adminPeopleAll,
                  _AbuseFilter.mining: l10n.adminAbuseMining,
                  _AbuseFilter.ports: l10n.adminAbuseBlockedPorts,
                  _AbuseFilter.floods: l10n.adminAbuseFloods,
                  _AbuseFilter.signups: l10n.adminAbuseSignups,
                  _AbuseFilter.suspensions: l10n.adminAbuseSuspensions,
                },
                counts: counts,
                selected: _filter,
                onSelected: (f) => setState(() => _filter = f),
              ),
            ),
            if (visible.isEmpty)
              AdminEmptyCard(icon: LucideIcons.searchX, message: l10n.adminAbuseNoMatch)
            else
              GroupedCard(
                key: const Key('adminAbuseList'),
                dividerIndent: 60,
                children: [for (final e in visible) _AbuseRow(event: e)],
              ),
          ],
        );
      },
    );
  }
}

class _AbuseRow extends StatelessWidget {
  const _AbuseRow({required this.event});
  final AbuseEvent event;

  static String label(BuildContext context, String kind) {
    final l10n = context.l10n;
    return switch (kind) {
      'mining_pool' => l10n.abuseKind_mining_pool,
      'blocked_port' => l10n.abuseKind_blocked_port,
      'egress_flood' => l10n.abuseKind_egress_flood,
      'signup_blocked' => l10n.abuseKind_signup_blocked,
      'suspended' => l10n.abuseKind_suspended,
      'unsuspended' => l10n.abuseKind_unsuspended,
      _ => kind,
    };
  }

  static IconData icon(String kind) => switch (kind) {
    'mining_pool' => LucideIcons.pickaxe,
    'blocked_port' => LucideIcons.mailX,
    'egress_flood' => LucideIcons.waves,
    'signup_blocked' => LucideIcons.userX,
    'suspended' => LucideIcons.ban,
    'unsuspended' => LucideIcons.circlePlay,
    _ => LucideIcons.shieldAlert,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final e = event;
    // Lifting a suspension is good news; everything else here was blocked or stopped.
    final tone = e.kind == 'unsuspended' ? AdminTone.positive : AdminTone.negative;
    final color = adminToneColor(context, tone);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant, height: 1.3);
    final at = DateTime.tryParse(e.createdAt);
    final target = e.detail['target'];
    final reason = e.detail['reason'];
    Widget line(IconData i, String text, {bool mono = false}) => Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(top: 1), child: Icon(i, size: 13, color: context.colorScheme.onSurfaceVariant)),
          const SizedBox(width: 6),
          Expanded(child: Text(text, style: mono ? muted?.copyWith(fontFamily: 'monospace') : muted)),
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(AppSpace.md, 12, AppSpace.md, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(AppRadius.icon)),
            child: Icon(icon(e.kind), size: 16, color: color),
          ),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(label(context, e.kind), style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600))),
                    const SizedBox(width: AppSpace.xs),
                    if (at != null)
                      TimeAgo(at, style: muted)
                    else
                      Text(e.createdAt, style: muted),
                  ],
                ),
                line(LucideIcons.boxes, e.orgName ?? l10n.adminAbuseNoWorkspace),
                if (target is String && target.isNotEmpty) line(LucideIcons.crosshair, target, mono: true),
                if (reason is String && reason.isNotEmpty) line(LucideIcons.messageSquareText, reason),
                if (e.action == 'workspace_suspended' && e.kind != 'suspended')
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: AdminStatusPill(l10n.abuseKind_suspended, tone: AdminTone.negative, icon: LucideIcons.ban),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
