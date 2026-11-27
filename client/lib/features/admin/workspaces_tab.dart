import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/billing.dart';
import '../../core/display_text.dart';
import '../../core/haptics.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'resets_tab.dart' show showGiveWorkspaceReset;
import 'ui/admin_ui.dart';

final adminOrgsProvider = FutureProvider.autoDispose<List<AdminOrg>>((r) => r.watch(backendProvider).adminOrgs());

enum _WsFilter { all, quotas, nearCap, suspended }

enum _WsSort { cost, members, bots, name }

enum _WsAction { quotas, reset, suspend }

/// How much of its monthly spend cap a workspace used in the last 30 days; null without a cap.
double? _capFraction(AdminOrg o) {
  final cap = o.limits['monthly_usd'];
  if (cap == null || cap <= 0) return null;
  return o.cost30dUsd / cap;
}

bool _suspended(AdminOrg o) => o.suspendedAt != null;

bool _nearCap(AdminOrg o) => (_capFraction(o) ?? 0) >= 0.8;

/// "Max 10 bots · $50/mo", or null when the workspace has no quotas.
String? _quotaNote(BuildContext context, AdminOrg o) {
  final l10n = context.l10n;
  final bots = o.limits['max_bots'];
  final usd = o.limits['monthly_usd'];
  final parts = [
    if (bots != null) l10n.adminWsQuotaBots(bots.toInt()),
    if (usd != null) l10n.adminWsQuotaUsd(formatUsd(usd, l10n.localeName)),
  ];
  return parts.isEmpty ? null : parts.join(' · ');
}

/// Active, Suspended (with its reason), Near its cap, or Over it.
Widget _statusPill(BuildContext context, AdminOrg o) {
  final l10n = context.l10n;
  if (_suspended(o)) {
    return AdminStatusPill(l10n.workspaceSuspended(o.suspendedReason.orPlaceholder()), tone: AdminTone.negative, icon: LucideIcons.ban);
  }
  final f = _capFraction(o);
  if (f != null && f >= 1) return AdminStatusPill(l10n.adminWsOverCap, tone: AdminTone.negative, icon: LucideIcons.circleAlert);
  if (f != null && f >= 0.8) {
    return AdminStatusPill(
      l10n.adminWsNearCap(formatUsd(o.limits['monthly_usd']!, l10n.localeName)),
      tone: AdminTone.warning,
      icon: LucideIcons.triangleAlert,
    );
  }
  return AdminStatusPill(l10n.adminWsActive, tone: AdminTone.positive);
}

class WorkspacesTab extends ConsumerStatefulWidget {
  const WorkspacesTab({super.key});

  @override
  ConsumerState<WorkspacesTab> createState() => _OrgsState();
}

class _OrgsState extends ConsumerState<WorkspacesTab> {
  String _query = '';
  _WsFilter _filter = _WsFilter.all;
  _WsSort _sort = _WsSort.cost;

  Future<void> _refresh() async {
    ref.invalidate(adminOrgsProvider);
    await ref.read(adminOrgsProvider.future).catchError((_) => <AdminOrg>[]);
  }

  Future<void> _edit(AdminOrg o) async {
    final limits = await showAdaptiveSheet<Map<String, num>>(
      context: context,
      builder: (_) => _QuotaForm(org: o),
    );
    if (limits == null || !mounted) return;
    final saved = await runGuarded(context, () => ref.read(backendProvider).setOrgLimits(o.id, limits));
    if (!mounted) return;
    if (saved != null) showSuccess(context, context.l10n.adminWsQuotasSaved);
    ref.invalidate(adminOrgsProvider);
  }

  Future<void> _toggleSuspend(AdminOrg o) async {
    final l10n = context.l10n;
    final backend = ref.read(backendProvider);
    AdminOrg? done;
    if (_suspended(o)) {
      final ok = await adminConfirm(
        context,
        title: l10n.adminWsUnsuspendQuestion(o.name),
        message: l10n.adminWsUnsuspendHelp,
        confirmLabel: l10n.unsuspendWorkspace,
        confirmKey: const Key('confirmUnsuspend'),
      );
      if (!ok || !mounted) return;
      done = await runGuarded(context, () => backend.unsuspendOrg(o.id));
      if (done != null && mounted) showSuccess(context, l10n.adminWsLiftedDone(o.name));
    } else {
      final reason = TextEditingController();
      final ok = await showAdaptiveSheet<bool>(
        context: context,
        builder: (c) => FormSheet(
          icon: LucideIcons.ban,
          title: '${l10n.suspendWorkspace}: ${o.name}',
          subtitle: l10n.suspendWorkspaceHelp,
          submitLabel: l10n.suspendWorkspace,
          submitKey: const Key('confirmSuspend'),
          destructive: true,
          onSubmit: () => Navigator.pop(c, true),
          children: [
            TextField(
              key: const Key('suspendReason'),
              controller: reason,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: l10n.suspendReason),
            ),
          ],
        ),
      );
      // Not disposed here: the sheet's field still uses it while the sheet animates away.
      final text = reason.text.trim().isEmpty ? l10n.suspendedByInstanceOwner : reason.text.trim();
      if (ok != true || !mounted) return;
      done = await runGuarded(context, () => backend.suspendOrg(o.id, text));
      if (done != null && mounted) showSuccess(context, l10n.adminWsSuspendedDone(o.name));
    }
    if (!mounted) return;
    ref.invalidate(adminOrgsProvider);
  }

  Future<void> _giveReset(AdminOrg o) => showGiveWorkspaceReset(context, workspaceId: o.id, workspaceName: o.name);

  Future<void> _run(_WsAction action, AdminOrg o) => switch (action) {
    _WsAction.quotas => _edit(o),
    _WsAction.reset => _giveReset(o),
    _WsAction.suspend => _toggleSuspend(o),
  };

  Future<void> _open(AdminOrg o, bool billing) async {
    final action = await showAdaptiveSheet<_WsAction>(
      context: context,
      builder: (_) => _WorkspaceSheet(org: o, billing: billing),
    );
    if (action == null || !mounted) return;
    await _run(action, o);
  }

  List<AdminOrg> _visible(List<AdminOrg> orgs) {
    final q = _query.trim().toLowerCase();
    final list = [
      for (final o in orgs)
        if ((q.isEmpty || o.name.toLowerCase().contains(q)) && _matches(o, _filter)) o,
    ];
    int byName(AdminOrg a, AdminOrg b) => a.name.toLowerCase().compareTo(b.name.toLowerCase());
    list.sort((a, b) {
      final c = switch (_sort) {
        _WsSort.cost => b.cost30dUsd.compareTo(a.cost30dUsd),
        _WsSort.members => b.members.compareTo(a.members),
        _WsSort.bots => b.bots.compareTo(a.bots),
        _WsSort.name => 0,
      };
      return c != 0 ? c : byName(a, b);
    });
    return list;
  }

  static bool _matches(AdminOrg o, _WsFilter f) => switch (f) {
    _WsFilter.all => true,
    _WsFilter.quotas => o.limits.isNotEmpty,
    _WsFilter.nearCap => _nearCap(o),
    _WsFilter.suspended => _suspended(o),
  };

  List<AdminMenuAction> _actions(AdminOrg o, bool billing) {
    final l10n = context.l10n;
    return [
      AdminMenuAction(key: Key('editQuotas-${o.id}'), label: l10n.editQuotas, icon: LucideIcons.slidersHorizontal, onSelected: () => _edit(o)),
      if (billing)
        AdminMenuAction(key: Key('giveReset-${o.id}'), label: l10n.adminWsGiveReset, icon: LucideIcons.rotateCcw, onSelected: () => _giveReset(o)),
      if (_suspended(o))
        AdminMenuAction(key: Key('suspend-${o.id}'), label: l10n.unsuspendWorkspace, icon: LucideIcons.circlePlay, onSelected: () => _toggleSuspend(o))
      else
        AdminMenuAction(
          key: Key('suspend-${o.id}'),
          label: l10n.suspendWorkspace,
          icon: LucideIcons.ban,
          destructive: true,
          onSelected: () => _toggleSuspend(o),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final billing = ref.watch(billingProvider).value?.enabled ?? false;
    return AsyncView<List<AdminOrg>>(
      value: ref.watch(adminOrgsProvider),
      onRetry: () => ref.invalidate(adminOrgsProvider),
      loading: const AdminPeopleSkeleton(),
      data: (orgs) {
        final header = AdminSectionHeader(section: AdminSection.workspaces, onRefresh: _refresh);
        if (orgs.isEmpty) {
          return AdminSectionList(
            onRefresh: _refresh,
            children: [
              header,
              AdminEmptyCard(icon: LucideIcons.boxes, message: l10n.adminNoWorkspaces),
            ],
          );
        }
        final suspended = orgs.where(_suspended).length;
        final counts = {for (final f in _WsFilter.values) f: orgs.where((o) => _matches(o, f)).length};
        final visible = _visible(orgs);
        final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
        return AdminSectionList(
          onRefresh: _refresh,
          children: [
            header,
            AdminStatStrip(
              stats: [
                AdminStat(label: l10n.adminWorkspaces, value: '${orgs.length}', icon: LucideIcons.boxes),
                AdminStat(
                  label: l10n.adminWsCost30d,
                  value: formatUsd(orgs.fold<num>(0, (s, o) => s + o.cost30dUsd), l10n.localeName),
                  icon: LucideIcons.circleDollarSign,
                ),
                AdminStat(label: l10n.adminWsWithQuotas, value: '${counts[_WsFilter.quotas]}', icon: LucideIcons.slidersHorizontal),
                AdminStat(
                  label: l10n.adminWsSuspended,
                  value: '$suspended',
                  icon: LucideIcons.ban,
                  tone: suspended > 0 ? AdminTone.negative : null,
                ),
              ],
            ),
            AdminListToolbar(
              search: AdminSearchField(key: const Key('adminWsSearch'), hint: l10n.adminWsSearch, onChanged: (v) => setState(() => _query = v)),
              filters: AdminFilterChips<_WsFilter>(
                values: _WsFilter.values,
                labels: {
                  _WsFilter.all: l10n.adminPeopleAll,
                  _WsFilter.quotas: l10n.adminWsFilterQuotas,
                  _WsFilter.nearCap: l10n.adminWsFilterNearCap,
                  _WsFilter.suspended: l10n.adminWsSuspended,
                },
                counts: counts,
                selected: _filter,
                onSelected: (f) => setState(() => _filter = f),
              ),
              sort: AdminSortMenu<_WsSort>(
                values: _WsSort.values,
                labels: {
                  _WsSort.cost: l10n.adminWsSortCost,
                  _WsSort.members: l10n.adminWsSortMembers,
                  _WsSort.bots: l10n.adminWsSortBots,
                  _WsSort.name: l10n.adminWsSortName,
                },
                selected: _sort,
                onSelected: (s) => setState(() => _sort = s),
              ),
            ),
            if (visible.isEmpty)
              AdminEmptyCard(icon: LucideIcons.searchX, message: l10n.adminWsNoMatch)
            else
              AdminDataList<AdminOrg>(
                items: visible,
                itemKey: (o) => Key('adminOrg-${o.id}'),
                onTap: (o) => _open(o, billing),
                title: (o) => o.name,
                leading: (context, o) => AdminAvatar(o.name, tone: _suspended(o) ? AdminTone.negative : null),
                subtitle: (context, o) => [
                  l10n.membersCount(o.members),
                  l10n.botsCount(o.bots),
                  formatUsd(o.cost30dUsd, l10n.localeName),
                ].join(' · '),
                badges: (context, o) => [
                  _statusPill(context, o),
                  if (_quotaNote(context, o) case final String note)
                    Padding(padding: const EdgeInsets.only(top: 3), child: Text(note, style: muted)),
                ],
                trailing: (context, o) => AdminActionsMenu(actions: _actions(o, billing)),
                columns: [
                  AdminColumn(
                    label: l10n.adminWsColWorkspace,
                    flex: 3,
                    cell: (context, o) => Row(
                      children: [
                        AdminAvatar(o.name, tone: _suspended(o) ? AdminTone.negative : null),
                        const SizedBox(width: AppSpace.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                o.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              if (_quotaNote(context, o) case final String note)
                                Text(note, maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AdminColumn(label: l10n.adminWsSortMembers, numeric: true, cell: (context, o) => Text('${o.members}')),
                  AdminColumn(label: l10n.adminWsSortBots, numeric: true, cell: (context, o) => Text('${o.bots}')),
                  AdminColumn(
                    label: l10n.adminWsColCost,
                    numeric: true,
                    cell: (context, o) => Text(formatUsd(o.cost30dUsd, l10n.localeName), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                  AdminColumn(label: l10n.adminPeopleStatus, flex: 2, cell: _statusPill),
                ],
              ),
          ],
        );
      },
    );
  }
}

/// Everything about one workspace, with the same actions as its row's menu.
class _WorkspaceSheet extends StatelessWidget {
  const _WorkspaceSheet({required this.org, required this.billing});
  final AdminOrg org;
  final bool billing;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final o = org;
    final suspended = _suspended(o);
    final f = _capFraction(o);
    return AdminDetailSheet(
      key: const Key('adminWorkspaceSheet'),
      leading: AdminAvatar(o.name, size: 44, tone: suspended ? AdminTone.negative : null),
      title: o.name,
      pill: _statusPill(context, o),
      rows: [
        AdminIdRow(id: o.id),
        if (o.planCode case final String plan) AdminKeyValue(label: l10n.adminWsPlan, value: Text(plan)),
        AdminKeyValue(label: l10n.adminWsSortMembers, value: Text('${o.members}')),
        AdminKeyValue(label: l10n.adminWsSortBots, value: Text('${o.bots}')),
        AdminKeyValue(label: l10n.adminWsCost30d, value: Text(formatUsd(o.cost30dUsd, l10n.localeName))),
        AdminKeyValue(label: l10n.adminWsLimits, value: Text(_quotaNote(context, o) ?? l10n.adminWsNoLimits)),
        if (f != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: AdminMeter(
              fraction: f,
              start: formatUsd(o.cost30dUsd, l10n.localeName),
              end: formatUsd(o.limits['monthly_usd']!, l10n.localeName),
            ),
          ),
        AdminKeyValue(
          label: l10n.adminWsSuspension,
          value: Text(suspended ? o.suspendedReason.orPlaceholder() : l10n.adminWsNotSuspended),
        ),
      ],
      actions: [
        OutlinedButton.icon(
          key: const Key('sheetEditQuotas'),
          onPressed: () => Navigator.pop(context, _WsAction.quotas),
          icon: const Icon(LucideIcons.slidersHorizontal, size: 18),
          label: Text(l10n.editQuotas),
        ),
        if (billing)
          OutlinedButton.icon(
            key: const Key('sheetGiveReset'),
            onPressed: () => Navigator.pop(context, _WsAction.reset),
            icon: const Icon(LucideIcons.rotateCcw, size: 18),
            label: Text(l10n.adminWsGiveReset),
          ),
        if (suspended)
          OutlinedButton.icon(
            key: const Key('sheetSuspend'),
            onPressed: () => Navigator.pop(context, _WsAction.suspend),
            icon: const Icon(LucideIcons.circlePlay, size: 18),
            label: Text(l10n.unsuspendWorkspace),
          )
        else
          OutlinedButton.icon(
            key: const Key('sheetSuspend'),
            style: OutlinedButton.styleFrom(foregroundColor: context.colorScheme.error),
            onPressed: () => Navigator.pop(context, _WsAction.suspend),
            icon: const Icon(LucideIcons.ban, size: 18),
            label: Text(l10n.suspendWorkspace),
          ),
      ],
    );
  }
}

/// A record's detail sheet in the console (a workspace, a person): who it is, its facts, and
/// what can be done with it. Used by Workspaces and Users.
class AdminDetailSheet extends StatelessWidget {
  const AdminDetailSheet({super.key, required this.leading, required this.title, this.pill, required this.rows, this.actions = const []});
  final Widget leading;
  final String title;
  final Widget? pill;
  final List<Widget> rows;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.xs, AppSpace.xl, AppSpace.lg + MediaQuery.paddingOf(context).bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              leading,
              const SizedBox(width: AppSpace.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      title,
                      style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.3, height: 1.2),
                    ),
                    if (pill != null) ...[const SizedBox(height: 6), pill!],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.md),
          AppCard(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.xs),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: rows),
          ),
          if (actions.isNotEmpty) ...[
            const SizedBox(height: AppSpace.md),
            Wrap(spacing: AppSpace.xs, runSpacing: AppSpace.xs, children: actions),
          ],
        ],
      ),
    );
  }
}

/// An id that can be selected and copied, for detail sheets.
class AdminIdRow extends StatelessWidget {
  const AdminIdRow({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AdminKeyValue(
      label: l10n.adminPeopleId,
      value: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SelectableText(
              id,
              maxLines: 1,
              style: context.textTheme.bodySmall?.copyWith(fontFamily: 'monospace', color: context.colorScheme.onSurfaceVariant),
            ),
          ),
          IconButton(
            key: const Key('adminCopyId'),
            tooltip: l10n.adminPeopleCopyId,
            visualDensity: VisualDensity.compact,
            iconSize: 16,
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: id));
              if (context.mounted) showSuccess(context, l10n.copied);
            },
            icon: const Icon(LucideIcons.copy),
          ),
        ],
      ),
    );
  }
}

/// A section of records before it loads: the stat strip, the toolbar and the rows, a table on a
/// wide pane and two-line rows on a phone. Used by Workspaces, Users and Abuse.
class AdminPeopleSkeleton extends StatelessWidget {
  const AdminPeopleSkeleton({super.key, this.stats = 4, this.rows = 6});
  final int stats;
  final int rows;

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      maxWidth: kAdminContentMaxWidth,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: AppSpace.xs, bottom: AppSpace.md),
          child: Align(alignment: AlignmentDirectional.centerStart, child: SkeletonBone(width: 220, height: 14)),
        ),
        if (stats > 0)
          LayoutBuilder(
            builder: (context, c) {
              final columns = c.maxWidth >= 560 ? stats : 2;
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpace.md),
                child: Wrap(
                  spacing: AppSpace.sm,
                  runSpacing: AppSpace.sm,
                  children: [
                    for (var i = 0; i < stats; i++)
                      SizedBox(
                        width: (c.maxWidth - AppSpace.sm * (columns - 1)) / columns,
                        child: const SkeletonCard(
                          padding: EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.sm),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [SkeletonBone(width: 70, height: 10), SizedBox(height: 8), SkeletonBone(width: 44, height: 18)],
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        const Padding(padding: EdgeInsets.only(bottom: AppSpace.sm), child: SkeletonBone(height: 40, radius: AppRadius.tile)),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpace.sm),
          child: Wrap(
            spacing: AppSpace.xs,
            children: [for (final w in const [40.0, 64.0, 72.0, 80.0]) SkeletonBone(width: w, height: 30, radius: 15)],
          ),
        ),
        SkeletonGroupedCard(
          rows: [
            for (var i = 0; i < rows; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 12),
                child: Row(
                  children: [
                    const SkeletonBone(width: 32, height: 32, radius: 8),
                    const SizedBox(width: AppSpace.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FractionallySizedBox(widthFactor: const [0.5, 0.36, 0.6, 0.42, 0.54, 0.3][i % 6], child: const SkeletonBone(height: 12)),
                          const SizedBox(height: 8),
                          const SkeletonBone(width: 72, height: 18, radius: 9),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpace.sm),
                    const SkeletonBone(width: 20, height: 20, radius: 5),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _QuotaForm extends StatefulWidget {
  const _QuotaForm({required this.org});
  final AdminOrg org;

  @override
  State<_QuotaForm> createState() => _QuotaFormState();
}

class _QuotaFormState extends State<_QuotaForm> {
  final _form = GlobalKey<FormState>();
  late final _bots = TextEditingController(text: _initial('max_bots'));
  late final _usd = TextEditingController(text: _initial('monthly_usd'));
  late bool _noBots = widget.org.limits['max_bots'] == null;
  late bool _noUsd = widget.org.limits['monthly_usd'] == null;

  String _initial(String key) {
    final v = widget.org.limits[key];
    if (v == null) return '';
    return v == v.roundToDouble() ? '${v.toInt()}' : '$v';
  }

  @override
  void dispose() {
    _bots.dispose();
    _usd.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_form.currentState?.validate() ?? false)) return;
    Navigator.pop(context, <String, num>{
      if (!_noBots) 'max_bots': num.parse(_bots.text.trim()),
      if (!_noUsd) 'monthly_usd': num.parse(_usd.text.trim()),
    });
  }

  String? _validate(String? v, {required bool whole}) {
    final l10n = context.l10n;
    final n = num.tryParse((v ?? '').trim());
    if (n == null || n <= 0) return l10n.adminQuotaPositive;
    if (whole && n != n.roundToDouble()) return l10n.adminQuotaWhole;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final o = widget.org;
    return Form(
      key: _form,
      child: FormSheet(
        icon: LucideIcons.slidersHorizontal,
        title: l10n.quotasFor(o.name),
        subtitle: l10n.adminQuotasHelp,
        submitLabel: l10n.save,
        submitKey: const Key('saveQuota'),
        onSubmit: _submit,
        children: [
          _LimitBlock(
            switchKey: const Key('noLimit-maxBots'),
            label: l10n.maxBots,
            icon: LucideIcons.bot,
            noLimit: _noBots,
            onNoLimit: (v) => setState(() {
              _noBots = v;
              if (v) _bots.clear();
            }),
            field: TextFormField(
              key: const Key('maxBots'),
              controller: _bots,
              enabled: !_noBots,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (v) => _noBots ? null : _validate(v, whole: true),
              decoration: InputDecoration(
                labelText: l10n.maxBots,
                hintText: _noBots ? l10n.adminQuotaNoLimit : null,
                helperText: l10n.adminQuotaNowBots(o.bots),
              ),
            ),
          ),
          _LimitBlock(
            switchKey: const Key('noLimit-monthlyUsd'),
            label: l10n.monthlyUsd,
            icon: LucideIcons.circleDollarSign,
            noLimit: _noUsd,
            onNoLimit: (v) => setState(() {
              _noUsd = v;
              if (v) _usd.clear();
            }),
            field: TextFormField(
              key: const Key('monthlyUsd'),
              controller: _usd,
              enabled: !_noUsd,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
              validator: (v) => _noUsd ? null : _validate(v, whole: false),
              decoration: InputDecoration(
                labelText: l10n.monthlyUsd,
                prefixText: r'$ ',
                hintText: _noUsd ? l10n.adminQuotaNoLimit : null,
                helperText: l10n.adminQuotaNowUsd(formatUsd(o.cost30dUsd, l10n.localeName)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// One quota: its name with a "No limit" switch, and the field under it.
class _LimitBlock extends StatelessWidget {
  const _LimitBlock({
    required this.switchKey,
    required this.label,
    required this.icon,
    required this.noLimit,
    required this.onNoLimit,
    required this.field,
  });
  final Key switchKey;
  final String label;
  final IconData icon;
  final bool noLimit;
  final ValueChanged<bool> onNoLimit;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: scheme.onSurfaceVariant),
            const SizedBox(width: AppSpace.xs),
            Expanded(child: Text(label, style: context.textTheme.titleSmall)),
            Text(context.l10n.adminQuotaNoLimit, style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
            const SizedBox(width: AppSpace.xxs),
            Switch(key: switchKey, value: noLimit, onChanged: hapticOnChanged(onNoLimit)),
          ],
        ),
        const SizedBox(height: AppSpace.xxs),
        field,
      ],
    );
  }
}
