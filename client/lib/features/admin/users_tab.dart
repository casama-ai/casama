import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../ui/adaptive_modal.dart';
import 'admin_nav.dart';
import 'growth_tab.dart' show adminGrowthProvider;
import 'live_users_card.dart' show adminLiveOnlineProvider;
import 'ui/admin_ui.dart';
import 'workspaces_tab.dart' show AdminDetailSheet, AdminIdRow, AdminPeopleSkeleton;

final adminUsersProvider = FutureProvider<List<AdminUser>>((r) => r.watch(backendProvider).adminUsers());

/// One-shot search query handed off when another section (such as Growth's Who's online list)
/// jumps straight to a person in Users.
class AdminUsersJump extends Notifier<String?> {
  @override
  String? build() => null;

  void set(String? query) => state = query;

  String? take() {
    final v = state;
    if (v != null) state = null;
    return v;
  }
}

final adminUsersJumpProvider = NotifierProvider<AdminUsersJump, String?>(AdminUsersJump.new);

enum _UserFilter { all, active, resting, removalSoon, kept }

enum _UserSort { lastActive, email, workspaces }

String _email(AdminUser u) => (u.email == null || u.email!.isEmpty) ? u.id : u.email!;

DateTime? _seen(AdminUser u) => u.lastActiveAt ?? u.lastSignInAt;

bool _kept(AdminUser u) => u.keep == true;

bool _resting(AdminUser u) =>
    u.inactivityState == AdminUserInactivityStateEnum.resting || u.inactivityState == AdminUserInactivityStateEnum.filesSoon;

bool _removalSoon(AdminUser u) =>
    u.inactivityState == AdminUserInactivityStateEnum.removalSoon || u.inactivityState == AdminUserInactivityStateEnum.removing;

bool _active(AdminUser u) => u.inactivityState == null || u.inactivityState == AdminUserInactivityStateEnum.active;

bool _matches(AdminUser u, _UserFilter f) => switch (f) {
  _UserFilter.all => true,
  _UserFilter.active => _active(u) && !_kept(u),
  _UserFilter.resting => _resting(u) && !_kept(u),
  _UserFilter.removalSoon => _removalSoon(u) && !_kept(u),
  _UserFilter.kept => _kept(u),
};

/// Where the account is in the inactive-account steps (docs/INACTIVE-ACCOUNTS-PLAN.md); a kept
/// account is never rested or removed, so Kept wins.
Widget _statusPill(BuildContext context, AdminUser u) {
  final l10n = context.l10n;
  if (_kept(u)) return AdminStatusPill(l10n.inactivityKept, tone: AdminTone.info, icon: LucideIcons.shieldCheck);
  return switch (u.inactivityState) {
    AdminUserInactivityStateEnum.resting => AdminStatusPill(l10n.inactivityStateResting, tone: AdminTone.neutral, icon: LucideIcons.moon),
    AdminUserInactivityStateEnum.filesSoon => AdminStatusPill(l10n.inactivityStateFilesSoon, tone: AdminTone.warning, icon: LucideIcons.fileX),
    AdminUserInactivityStateEnum.removalSoon => AdminStatusPill(l10n.inactivityStateRemovalSoon, tone: AdminTone.negative, icon: LucideIcons.triangleAlert),
    AdminUserInactivityStateEnum.removing => AdminStatusPill(l10n.inactivityStateRemoving, tone: AdminTone.negative, icon: LucideIcons.trash2),
    _ => AdminStatusPill(l10n.adminUsersActive, tone: AdminTone.positive),
  };
}

/// Left out of Growth's numbers (D-530).
Widget _teamPill(BuildContext context) =>
    AdminStatusPill(context.l10n.adminUsersTeam, tone: AdminTone.neutral, icon: LucideIcons.badgeCheck);

class UsersTab extends ConsumerStatefulWidget {
  const UsersTab({super.key});

  @override
  ConsumerState<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends ConsumerState<UsersTab> {
  final _searchController = TextEditingController();
  String _query = '';
  _UserFilter _filter = _UserFilter.all;
  _UserSort _sort = _UserSort.lastActive;

  @override
  void initState() {
    super.initState();
    final jump = ref.read(adminUsersJumpProvider);
    if (jump != null && jump.isNotEmpty) {
      _searchController.text = jump;
      _query = jump;
      Future.microtask(() {
        if (mounted) ref.read(adminUsersJumpProvider.notifier).set(null);
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    ref.invalidate(adminUsersProvider);
    await ref.read(adminUsersProvider.future).catchError((_) => <AdminUser>[]);
  }

  Future<void> _setKeep(AdminUser u, bool keep) async {
    final l10n = context.l10n;
    final email = _email(u);
    final ok = await adminConfirm(
      context,
      title: keep ? l10n.adminUsersKeepQuestion(email) : l10n.adminUsersStopKeepingQuestion(email),
      message: keep ? l10n.keepAccountHelp : l10n.adminUsersStopKeepingHelp,
      confirmLabel: keep ? l10n.keepAccount : l10n.adminUsersStopKeeping,
      confirmKey: const Key('confirmKeepUser'),
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(context, () => ref.read(backendProvider).setUserKeep(u.id, keep));
    if (!mounted) return;
    if (done != null) showSuccess(context, keep ? l10n.adminUsersKeptDone(email) : l10n.adminUsersUnkeptDone(email));
    ref.invalidate(adminUsersProvider);
  }

  /// Team accounts are left out of Growth (D-530); an owner always is, so it has no switch.
  Future<void> _setTeam(AdminUser u, bool team) async {
    final l10n = context.l10n;
    final done = await runGuarded(context, () => ref.read(backendProvider).setUserTeam(u.id, team));
    if (!mounted) return;
    if (done != null) showSuccess(context, team ? l10n.adminUsersTeamDone(_email(u)) : l10n.adminUsersCustomerDone(_email(u)));
    ref.invalidate(adminUsersProvider);
    ref.invalidate(adminGrowthProvider);
    ref.invalidate(adminLiveOnlineProvider);
  }

  List<AdminMenuAction> _actions(AdminUser u) {
    final l10n = context.l10n;
    // An older server sends no keep flag: nothing to change.
    if (u.keep == null) return const [];
    return [
      if (u.team != null && u.owner != true)
        u.team!
            ? AdminMenuAction(key: Key('teamUser-${u.id}'), label: l10n.adminUsersCountAsCustomer, icon: LucideIcons.userCheck, onSelected: () => _setTeam(u, false))
            : AdminMenuAction(key: Key('teamUser-${u.id}'), label: l10n.adminUsersCountAsTeam, icon: LucideIcons.badgeCheck, onSelected: () => _setTeam(u, true)),
      if (u.keep!)
        AdminMenuAction(key: Key('keepUser-${u.id}'), label: l10n.adminUsersStopKeeping, icon: LucideIcons.shieldOff, onSelected: () => _setKeep(u, false))
      else
        AdminMenuAction(key: Key('keepUser-${u.id}'), label: l10n.keepAccount, icon: LucideIcons.shieldCheck, onSelected: () => _setKeep(u, true)),
    ];
  }

  Future<void> _open(AdminUser u) async {
    final keep = await showAdaptiveSheet<bool>(context: context, builder: (_) => _UserSheet(user: u));
    if (keep == null || !mounted) return;
    await _setKeep(u, keep);
  }

  List<AdminUser> _visible(List<AdminUser> users) {
    final q = _query.trim().toLowerCase();
    final list = [
      for (final u in users)
        if ((q.isEmpty || (u.email ?? '').toLowerCase().contains(q) || u.id.toLowerCase().contains(q)) && _matches(u, _filter)) u,
    ];
    int byEmail(AdminUser a, AdminUser b) => _email(a).toLowerCase().compareTo(_email(b).toLowerCase());
    list.sort((a, b) {
      final c = switch (_sort) {
        // Most recent first; never seen goes last.
        _UserSort.lastActive => (_seen(b) ?? DateTime(0)).compareTo(_seen(a) ?? DateTime(0)),
        _UserSort.workspaces => b.orgs.compareTo(a.orgs),
        _UserSort.email => 0,
      };
      return c != 0 ? c : byEmail(a, b);
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AsyncView<List<AdminUser>>(
      value: ref.watch(adminUsersProvider),
      onRetry: () => ref.invalidate(adminUsersProvider),
      loading: const AdminPeopleSkeleton(),
      data: (users) {
        final header = AdminSectionHeader(section: AdminSection.users, onRefresh: _refresh);
        if (users.isEmpty) {
          return AdminSectionList(
            onRefresh: _refresh,
            children: [
              header,
              AdminEmptyCard(icon: LucideIcons.users, message: l10n.adminUsersNone),
            ],
          );
        }
        final weekAgo = DateTime.now().subtract(const Duration(days: 7));
        final active7d = users.where((u) => u.lastActiveAt?.isAfter(weekAgo) ?? false).length;
        final counts = {for (final f in _UserFilter.values) f: users.where((u) => _matches(u, f)).length};
        final visible = _visible(users);
        final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
        Widget lastSeen(BuildContext context, AdminUser u, {TextStyle? style}) {
          final at = _seen(u);
          if (at == null) return Text(l10n.adminUsersNever, style: style);
          return TimeAgo(at, style: style);
        }

        return AdminSectionList(
          onRefresh: _refresh,
          children: [
            header,
            AdminStatStrip(
              stats: [
                AdminStat(label: l10n.adminUsers, value: '${users.length}', icon: LucideIcons.users),
                AdminStat(label: l10n.adminUsersActive7d, value: '$active7d', icon: LucideIcons.activity),
                AdminStat(label: l10n.inactivityStateResting, value: '${users.where(_resting).length}', icon: LucideIcons.moon),
                AdminStat(label: l10n.inactivityKept, value: '${counts[_UserFilter.kept]}', icon: LucideIcons.shieldCheck),
              ],
            ),
            AdminListToolbar(
              search: AdminSearchField(
                key: const Key('adminUsersSearch'),
                controller: _searchController,
                hint: l10n.adminUsersSearch,
                onChanged: (v) => setState(() => _query = v),
              ),
              filters: AdminFilterChips<_UserFilter>(
                values: _UserFilter.values,
                labels: {
                  _UserFilter.all: l10n.adminPeopleAll,
                  _UserFilter.active: l10n.adminUsersActive,
                  _UserFilter.resting: l10n.inactivityStateResting,
                  _UserFilter.removalSoon: l10n.inactivityStateRemovalSoon,
                  _UserFilter.kept: l10n.inactivityKept,
                },
                counts: counts,
                selected: _filter,
                onSelected: (f) => setState(() => _filter = f),
              ),
              sort: AdminSortMenu<_UserSort>(
                values: _UserSort.values,
                labels: {
                  _UserSort.lastActive: l10n.adminUsersSortLastActive,
                  _UserSort.email: l10n.adminUsersSortEmail,
                  _UserSort.workspaces: l10n.adminWorkspaces,
                },
                selected: _sort,
                onSelected: (s) => setState(() => _sort = s),
              ),
            ),
            if (visible.isEmpty)
              AdminEmptyCard(icon: LucideIcons.searchX, message: l10n.adminUsersNoMatch)
            else
              AdminDataList<AdminUser>(
                key: const Key('adminUsersList'),
                items: visible,
                itemKey: (u) => Key('adminUser-${u.id}'),
                onTap: _open,
                title: _email,
                leading: (context, u) => AdminAvatar(_email(u)),
                subtitle: (context, u) {
                  final at = _seen(u);
                  return [
                    l10n.workspacesCount(u.orgs),
                    if (at != null)
                      u.lastActiveAt != null ? l10n.lastActive(relativeTime(at, context)) : l10n.lastSignIn(relativeTime(at, context)),
                  ].join(' · ');
                },
                badges: (context, u) => [_statusPill(context, u), if (u.team == true) _teamPill(context)],
                trailing: (context, u) => AdminActionsMenu(actions: _actions(u)),
                columns: [
                  AdminColumn(
                    label: l10n.adminUsersSortEmail,
                    flex: 4,
                    cell: (context, u) => Row(
                      children: [
                        AdminAvatar(_email(u)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _email(u),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AdminColumn(label: l10n.adminWorkspaces, flex: 2, numeric: true, cell: (context, u) => Text('${u.orgs}')),
                  AdminColumn(label: l10n.adminUsersSortLastActive, flex: 2, cell: (context, u) => lastSeen(context, u, style: muted)),
                  AdminColumn(
                    label: l10n.adminPeopleStatus,
                    flex: 2,
                    cell: (context, u) => Wrap(spacing: 6, runSpacing: 4, children: [_statusPill(context, u), if (u.team == true) _teamPill(context)]),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}

/// One account: who it is, when it was here, and keeping it. Pops true/false to keep or stop.
class _UserSheet extends StatelessWidget {
  const _UserSheet({required this.user});
  final AdminUser user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final u = user;
    Widget when(DateTime? at) => at == null ? Text(l10n.adminUsersNever) : TimeAgo(at);
    return AdminDetailSheet(
      key: const Key('adminUserSheet'),
      leading: AdminAvatar(_email(u), size: 44),
      title: _email(u),
      pill: _statusPill(context, u),
      rows: [
        AdminIdRow(id: u.id),
        AdminKeyValue(label: l10n.adminWorkspaces, value: Text('${u.orgs}')),
        AdminKeyValue(label: l10n.adminUsersJoined, value: TimeAgo(u.createdAt)),
        AdminKeyValue(label: l10n.adminUsersSortLastActive, value: when(u.lastActiveAt)),
        AdminKeyValue(label: l10n.adminUsersLastSignIn, value: when(u.lastSignInAt)),
        if (u.keep != null) AdminKeyValue(label: l10n.inactivityKept, value: Text(u.keep! ? l10n.adminPeopleYes : l10n.adminPeopleNo)),
        if (u.team != null) AdminKeyValue(label: l10n.adminUsersTeam, value: Text(u.team! ? l10n.adminPeopleYes : l10n.adminPeopleNo)),
      ],
      actions: [
        if (u.keep != null)
          OutlinedButton.icon(
            key: const Key('sheetKeepUser'),
            onPressed: () => Navigator.pop(context, !u.keep!),
            icon: Icon(u.keep! ? LucideIcons.shieldOff : LucideIcons.shieldCheck, size: 18),
            label: Text(u.keep! ? l10n.adminUsersStopKeeping : l10n.keepAccount),
          ),
      ],
    );
  }
}
