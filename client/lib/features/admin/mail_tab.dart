import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

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

final _adminMailProvider = FutureProvider.autoDispose<List<AdminMailAddress>>(
  (r) => r.watch(backendProvider).adminMailAddresses(),
);

/// Mails every workspace sent today and the day's ceiling (BOT-EMAIL-NEXT-PLAN §4).
final _adminMailSendingProvider = FutureProvider.autoDispose<({int sent, int? ceiling})>(
  (r) => r.watch(backendProvider).adminMailSending(),
);

final _adminMailReservedProvider = FutureProvider.autoDispose<List<String>>(
  (r) => r.watch(backendProvider).adminMailReservedNames(),
);

/// Admin console > Mail (BOT-EMAIL-PLAN Phase 3): today's sending against the daily ceiling, every
/// hosted address with its recent sending health, pause/lift (lifting clears an automatic pause),
/// and the instance's reserved names.
class AdminMailTab extends ConsumerStatefulWidget {
  const AdminMailTab({super.key});

  @override
  ConsumerState<AdminMailTab> createState() => _AdminMailTabState();
}

class _AdminMailTabState extends ConsumerState<AdminMailTab> {
  var _query = '';
  var _filter = 'all';

  Future<void> _refresh() async {
    ref.invalidate(_adminMailSendingProvider);
    ref.invalidate(_adminMailReservedProvider);
    ref.invalidate(_adminMailProvider);
    try {
      await ref.read(_adminMailProvider.future);
    } catch (_) {
      // The page shows the error.
    }
  }

  Future<void> _setStatus(AdminMailAddress a, String status) async {
    final l10n = context.l10n;
    final lifting = status == 'active';
    final ok = await showConfirm(
      context: context,
      icon: lifting ? LucideIcons.play : LucideIcons.pause,
      title: lifting ? l10n.adminMailLiftTitle(a.address) : l10n.adminMailPauseTitle(a.address),
      message: a.autoPaused && lifting ? l10n.adminMailLiftBody : null,
      confirmLabel: lifting ? l10n.adminMailLift : l10n.adminMailPause,
      destructive: !lifting,
      confirmKey: const Key('confirmMailStatus'),
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(context, () => ref.read(backendProvider).setMailAddressStatus(a.id, status));
    if (done == null || !mounted) return;
    showSuccess(context, lifting ? l10n.adminMailLiftedDone : l10n.adminMailPausedDone);
    ref.invalidate(_adminMailProvider);
  }

  Future<void> _reserved(List<String> current) async {
    final l10n = context.l10n;
    // Not disposed: the pop animation still builds with it (as in links_screen.dart).
    final c = TextEditingController(text: current.join('\n'));
    final saved = await showAdaptiveSheet<bool>(
      context: context,
      builder: (s) => FormSheet(
        icon: LucideIcons.shieldAlert,
        title: l10n.adminMailReserved,
        subtitle: l10n.adminMailReservedHelp,
        submitLabel: l10n.save,
        submitKey: const Key('saveMailReserved'),
        onSubmit: () async {
          final names = c.text.split(RegExp(r'[\s,]+')).where((n) => n.isNotEmpty).toList();
          final done = await runGuarded(s, () => ref.read(backendProvider).setMailReservedNames(names));
          if (done != null && s.mounted) Navigator.pop(s, true);
        },
        children: [
          TextField(
            key: const Key('mailReservedNames'),
            controller: c,
            minLines: 3,
            maxLines: 8,
            autocorrect: false,
            decoration: InputDecoration(labelText: l10n.adminMailReserved, alignLabelWithHint: true),
          ),
        ],
      ),
    );
    if (saved != true || !mounted) return;
    showSuccess(context, l10n.saved);
    ref.invalidate(_adminMailReservedProvider);
  }

  bool _matches(AdminMailAddress a, String filter) => switch (filter) {
    'active' => a.status == AdminMailAddressStatusEnum.active,
    'paused' => a.status == AdminMailAddressStatusEnum.paused,
    'retired' => a.status == AdminMailAddressStatusEnum.retired,
    _ => true,
  };

  @override
  Widget build(BuildContext context) {
    return AsyncView<List<AdminMailAddress>>(
      value: ref.watch(_adminMailProvider),
      onRetry: _refresh,
      loading: const SkeletonPage(
        maxWidth: kAdminContentMaxWidth,
        children: [
          SkeletonCard(height: 72),
          SkeletonCard(height: 88),
          SkeletonCard(height: 72),
          SkeletonSectionHeader(),
          SkeletonGroupedCard(count: 5, row: SkeletonRow(trailing: SkeletonTrailing.none)),
        ],
      ),
      data: _content,
    );
  }

  Widget _content(List<AdminMailAddress> items) {
    final l10n = context.l10n;
    final reserved = ref.watch(_adminMailReservedProvider).value ?? const <String>[];
    final sending = ref.watch(_adminMailSendingProvider).value;
    final q = _query.trim().toLowerCase();
    final shown = [
      for (final a in items)
        if (_matches(a, _filter) &&
            (q.isEmpty ||
                a.address.toLowerCase().contains(q) ||
                a.botName.toLowerCase().contains(q) ||
                a.orgName.toLowerCase().contains(q)))
          a,
    ];
    final paused = items.where((a) => a.status == AdminMailAddressStatusEnum.paused).length;
    final autoPaused = items.where((a) => a.autoPaused).length;
    const filters = ['all', 'active', 'paused', 'retired'];
    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(section: AdminSection.mail, onRefresh: _refresh),
        AdminStatStrip(
          stats: [
            AdminStat(label: l10n.adminMailAddressesStat, value: '${items.length}', icon: LucideIcons.mail),
            AdminStat(
              label: l10n.adminMailPausedStat,
              value: '$paused',
              icon: LucideIcons.pause,
              tone: autoPaused > 0 ? AdminTone.negative : (paused > 0 ? AdminTone.warning : null),
              onTap: paused > 0 ? () => setState(() => _filter = 'paused') : null,
            ),
            AdminStat(label: l10n.adminMailReserved, value: '${reserved.length}', icon: LucideIcons.shieldAlert),
          ],
        ),
        if (sending != null) _SendingCard(sent: sending.sent, ceiling: sending.ceiling),
        const SizedBox(height: AppSpace.sm),
        AdminAnchor(id: AdminAnchors.reservedNames, child: _ReservedCard(names: reserved, onEdit: () => _reserved(reserved))),
        SectionHeader(title: l10n.adminMailAddressesStat, count: '${items.length}'),
        if (items.isEmpty)
          AdminEmptyCard(key: const Key('adminMailEmpty'), icon: LucideIcons.mailbox, message: l10n.adminMailNone)
        else ...[
          AdminListToolbar(
            search: AdminSearchField(key: const Key('adminMailSearch'), hint: l10n.adminMailSearch, onChanged: (v) => setState(() => _query = v)),
            filters: AdminFilterChips<String>(
              values: filters,
              labels: {
                'all': l10n.adminMailFilterAll,
                'active': l10n.adminMailStatusActive,
                'paused': l10n.adminMailStatusPaused,
                'retired': l10n.adminMailStatusRetired,
              },
              counts: {for (final f in filters) f: items.where((a) => _matches(a, f)).length},
              selected: _filter,
              onSelected: (v) => setState(() => _filter = v),
            ),
          ),
          if (shown.isEmpty)
            AdminEmptyCard(key: const Key('adminMailNoMatch'), icon: LucideIcons.searchX, message: l10n.adminMailNoMatch)
          else
            _list(shown),
        ],
      ],
    );
  }

  (String, AdminTone) _status(AdminMailAddress a) {
    final l10n = context.l10n;
    return switch (a.status) {
      AdminMailAddressStatusEnum.active => (l10n.adminMailStatusActive, AdminTone.positive),
      AdminMailAddressStatusEnum.paused => (l10n.adminMailStatusPaused, AdminTone.warning),
      AdminMailAddressStatusEnum.retired => (l10n.adminMailStatusRetired, AdminTone.neutral),
    };
  }

  Widget _list(List<AdminMailAddress> items) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    List<Widget> pills(AdminMailAddress a) {
      final (text, tone) = _status(a);
      return [
        if (!a.autoPaused) AdminStatusPill(text, tone: tone),
        if (a.autoPaused) AdminStatusPill(l10n.adminMailAutoPaused, tone: AdminTone.negative, icon: LucideIcons.octagonPause),
      ];
    }

    Widget health(AdminMailAddress a) {
      final bad = a.bounced30d > 0 || a.complained30d > 0;
      return Text(
        l10n.adminMailHealth(a.sent30d, a.bounced30d, a.complained30d),
        style: bad && a.complained30d > 0 ? muted?.copyWith(color: context.appColors.negative) : muted,
      );
    }

    return AdminDataList<AdminMailAddress>(
      items: items,
      itemKey: (a) => Key('adminMail-${a.id}'),
      title: (a) => a.address,
      leading: (c, a) => AdminAvatar(a.botName, tone: a.autoPaused ? AdminTone.negative : null),
      subtitle: (c, a) => l10n.adminMailBotIn(a.botName, a.orgName),
      badges: (c, a) => [...pills(a), SizedBox(width: double.infinity, child: health(a))],
      trailing: (c, a) => a.status == AdminMailAddressStatusEnum.retired
          ? const SizedBox(width: 40)
          : AdminActionsMenu(
              key: Key('adminMailMenu-${a.id}'),
              actions: [
                if (a.status == AdminMailAddressStatusEnum.active)
                  AdminMenuAction(
                    key: Key('adminMailStatus-${a.id}'),
                    label: l10n.adminMailPause,
                    icon: LucideIcons.pause,
                    destructive: true,
                    onSelected: () => _setStatus(a, 'paused'),
                  )
                else
                  AdminMenuAction(
                    key: Key('adminMailStatus-${a.id}'),
                    label: l10n.adminMailLift,
                    icon: LucideIcons.play,
                    onSelected: () => _setStatus(a, 'active'),
                  ),
              ],
            ),
      columns: [
        AdminColumn(
          label: l10n.adminMailColAddress,
          flex: 4,
          cell: (c, a) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(a.address, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(l10n.adminMailBotIn(a.botName, a.orgName), maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
            ],
          ),
        ),
        AdminColumn(
          label: l10n.adminMailColStatus,
          flex: 3,
          cell: (c, a) => Wrap(spacing: 4, runSpacing: 4, children: pills(a)),
        ),
        AdminColumn(label: l10n.adminMailColHealth, flex: 4, cell: (c, a) => health(a)),
      ],
    );
  }
}

/// Today's sending across every workspace, against the day's ceiling.
class _SendingCard extends StatelessWidget {
  const _SendingCard({required this.sent, required this.ceiling});
  final int sent;
  final int? ceiling;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final max = ceiling;
    final fraction = max == null || max <= 0 ? null : sent / max;
    return AppCard(
      key: const Key('mailSentToday'),
      padding: const EdgeInsets.all(AppSpace.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.send, size: 16, color: context.colorScheme.onSurfaceVariant),
              const SizedBox(width: AppSpace.xs),
              Expanded(child: Text(l10n.adminMailSendingTitle, style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700))),
              if (max == null) AdminStatusPill(l10n.adminMailNoCeiling),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          AdminMeter(
            fraction: fraction,
            start: max == null ? l10n.adminMailSentTodayNoCeiling(sent) : l10n.adminMailSentToday(sent, max),
            end: fraction == null ? null : l10n.adminMailPercentUsed((fraction * 100).round()),
          ),
        ],
      ),
    );
  }
}

/// The instance's reserved names as chips, with an edit sheet behind a tap.
class _ReservedCard extends StatelessWidget {
  const _ReservedCard({required this.names, required this.onEdit});
  final List<String> names;
  final VoidCallback onEdit;

  static const _shown = 12;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final muted = context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant);
    return AppCard(
      key: const Key('mailReserved'),
      onTap: onEdit,
      padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.sm, AppSpace.xs, AppSpace.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.shieldAlert, size: 16, color: scheme.onSurfaceVariant),
              const SizedBox(width: AppSpace.xs),
              Expanded(child: Text(l10n.adminMailReserved, style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700))),
              TextButton.icon(onPressed: onEdit, icon: const Icon(LucideIcons.pencil, size: 16), label: Text(l10n.edit)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppSpace.sm),
            child: names.isEmpty
                ? Text(l10n.adminMailReservedNone, style: muted)
                : Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final n in names.take(_shown))
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: scheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(AppRadius.pill)),
                          child: Text(n, style: context.textTheme.labelMedium),
                        ),
                      if (names.length > _shown)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(l10n.adminMailReservedMore(names.length - _shown), style: muted),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
