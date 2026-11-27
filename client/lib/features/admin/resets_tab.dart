import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/date_format.dart';
import '../../core/haptics.dart';
import '../../core/number_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';
import 'workspaces_tab.dart' show adminOrgsProvider;

/// Saved resets (D-443/D-445): the instance settings, the campaigns that hand resets out, and one
/// workspace's history. docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §6.

final _campaigns = FutureProvider.autoDispose<List<LimitResetCampaign>>(
  (ref) async => (await ref.watch(backendProvider).limitResets.adminLimitResetCampaigns()).data!,
);
final _settings = FutureProvider.autoDispose<LimitResetSettings>(
  (ref) async => (await ref.watch(backendProvider).limitResets.adminLimitResetSettings()).data!,
);

/// States a campaign can still change in.
const _activeStates = {'draft', 'scheduled', 'live', 'paused'};

/// The paid tiers a campaign can aim at: each has a monthly code and a yearly one.
const _tiers = ['plus', 'pro', 'max'];
const _allPlanCodes = ['plus', 'plus_yearly', 'pro', 'pro_yearly', 'max', 'max_yearly'];

/// Opens the campaign editor for one workspace (the Workspaces section's row menu uses it) and says
/// so when the reset is given.
Future<void> showGiveWorkspaceReset(BuildContext context, {required String workspaceId, required String workspaceName}) async {
  final words = context.l10n;
  final given = await _openEditor(context, workspace: workspaceId, workspaceName: workspaceName);
  if (given == true && context.mounted) showSuccess(context, words.resetsGivenTo(workspaceName));
}

Future<bool?> _openEditor(BuildContext context, {LimitResetCampaign? campaign, String? workspace, String? workspaceName}) {
  return showAdaptiveSheet<bool>(
    context: context,
    heightFactor: 0.94,
    dialogMaxWidth: 640,
    dialogMaxHeight: 900,
    builder: (_) => _Editor(campaign: campaign, workspace: workspace, workspaceName: workspaceName),
  );
}

String _usd(num value, String locale) => value.humanizedCurrency(locale, 'USD', decimalDigits: 2);

/// "today", "tomorrow", "1 Dec", or "1 Dec 2027" outside this year.
String _day(BuildContext context, DateTime at) {
  final words = context.l10n;
  final local = at.toLocal();
  final now = DateTime.now();
  final days = DateTime(local.year, local.month, local.day).difference(DateTime(now.year, now.month, now.day)).inDays;
  if (days == 0) return words.resetsToday;
  if (days == 1) return words.resetsTomorrow;
  if (days == -1) return words.resetsYesterday;
  final locale = Localizations.localeOf(context).toLanguageTag();
  return (local.year == now.year ? DateFormat.MMMd(locale) : DateFormat.yMMMd(locale)).format(local);
}

String _planName(AppLocalizations words, String code) {
  final tier = code.split('_').first;
  final name = switch (tier) {
    'plus' => words.resetsPlanPlus,
    'pro' => words.resetsPlanPro,
    'max' => words.resetsPlanMax,
    _ => code,
  };
  if (code.endsWith('_yearly')) return '$name (${words.resetsYearly.toLowerCase()})';
  return name;
}

/// "Plus, Pro (yearly)": a tier picked monthly and yearly reads as just its name.
String _plansSummary(AppLocalizations words, List<String> codes) {
  final names = <String>[];
  final seen = <String>{};
  for (final code in codes) {
    if (seen.contains(code)) continue;
    final tier = code.split('_').first;
    if (_tiers.contains(tier) && codes.contains(tier) && codes.contains('${tier}_yearly')) {
      seen.addAll([tier, '${tier}_yearly']);
      names.add(_planName(words, tier));
    } else {
      seen.add(code);
      names.add(_planName(words, code));
    }
  }
  return names.join(', ');
}

(String, AdminTone) _stateLabel(AppLocalizations words, String state) => switch (state) {
  'draft' => (words.resetsStateDraft, AdminTone.neutral),
  'scheduled' => (words.resetsStateScheduled, AdminTone.info),
  'live' => (words.resetsStateLive, AdminTone.positive),
  'paused' => (words.resetsStatePaused, AdminTone.warning),
  'ended' => (words.resetsStateEnded, AdminTone.neutral),
  'cancelled' => (words.resetsStateCancelled, AdminTone.neutral),
  _ => (state, AdminTone.neutral),
};

enum _Filter { active, ended, all }

class ResetsTab extends ConsumerStatefulWidget {
  const ResetsTab({super.key});

  @override
  ConsumerState<ResetsTab> createState() => _ResetsTabState();
}

class _ResetsTabState extends ConsumerState<ResetsTab> {
  var _filter = _Filter.active;

  Future<void> _reload() async {
    ref.invalidate(_campaigns);
    ref.invalidate(_settings);
    try {
      await ref.read(_campaigns.future);
    } catch (_) {
      // The list shows its own error with a retry.
    }
  }

  Future<void> _newCampaign() async {
    final words = context.l10n;
    final saved = await _openEditor(context);
    if (!mounted) return;
    ref.invalidate(_campaigns);
    if (saved == true) showSuccess(context, words.resetsCampaignSaved);
  }

  Future<void> _edit(LimitResetCampaign c) async {
    final words = context.l10n;
    final saved = await _openEditor(context, campaign: c);
    if (!mounted) return;
    ref.invalidate(_campaigns);
    if (saved == true) showSuccess(context, words.resetsCampaignSaved);
  }

  Future<void> _act(LimitResetCampaign c, String action) async {
    final words = context.l10n;
    if (action == 'cancel' || action == 'delete') {
      final delete = action == 'delete';
      final ok = await adminConfirm(
        context,
        title: delete ? words.resetsDeleteConfirm : words.resetsCancelConfirm,
        message: delete ? words.resetsDeleteConfirmBody : words.resetsCancelConfirmBody,
        confirmLabel: delete ? words.delete : words.resetsCancelCampaign,
        destructive: true,
        confirmKey: Key('resetsConfirm-$action'),
      );
      if (!ok || !mounted) return;
    }
    await runGuarded(context, () async {
      await ref
          .read(backendProvider)
          .limitResets
          .actionAdminLimitResetCampaign(
            id: c.id,
            actionAdminLimitResetCampaignRequest: ActionAdminLimitResetCampaignRequest(
              action: ActionAdminLimitResetCampaignRequestActionEnum.values.firstWhere((v) => v.value == action),
            ),
          );
    });
    if (mounted) ref.invalidate(_campaigns);
  }

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final settings = ref.watch(_settings);
    final campaigns = ref.watch(_campaigns);
    return AdminSectionList(
      onRefresh: _reload,
      children: [
        AdminSectionHeader(
          section: AdminSection.resets,
          onRefresh: _reload,
          actions: [
            FilledButton.icon(
              key: const Key('resetsNewCampaign'),
              onPressed: _newCampaign,
              icon: const Icon(LucideIcons.plus, size: 18),
              label: Text(words.resetsNewCampaign),
            ),
          ],
        ),
        settings.when(
          loading: () => const SkeletonScope(child: SkeletonCard(height: 190)),
          error: (e, _) => AppCard(child: InlineError(error: e, onRetry: () => ref.invalidate(_settings))),
          data: (s) => _SettingsCard(settings: s),
        ),
        SectionHeader(title: words.resetsCampaigns),
        campaigns.when(
          loading: () => const SkeletonScope(
            child: Column(spacing: AppSpace.sm, children: [SkeletonCard(height: 84), SkeletonCard(height: 168), SkeletonCard(height: 168)]),
          ),
          error: (e, _) => AppCard(child: InlineError(error: e, onRetry: () => ref.invalidate(_campaigns))),
          data: (list) => _campaignList(context, list),
        ),
        SectionHeader(title: words.resetsOneWorkspace),
        const _WorkspaceResets(),
      ],
    );
  }

  Widget _campaignList(BuildContext context, List<LimitResetCampaign> list) {
    final words = context.l10n;
    final locale = words.localeName;
    bool matches(LimitResetCampaign c, _Filter f) => switch (f) {
      _Filter.active => _activeStates.contains(c.state),
      _Filter.ended => !_activeStates.contains(c.state),
      _Filter.all => true,
    };
    final shown = list.where((c) => matches(c, _filter)).toList();
    final given = list.fold<int>(0, (a, c) => a + c.given);
    final used = list.fold<int>(0, (a, c) => a + c.used);
    final refilled = list.fold<num>(0, (a, c) => a + c.refilledUsd);
    final live = list.where((c) => c.state == 'live').length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdminStatStrip(
          stats: [
            AdminStat(label: words.resetsStatLive, value: live.humanizedCount(locale), icon: LucideIcons.radio, tone: live > 0 ? AdminTone.positive : null),
            AdminStat(label: words.resetsStatGiven, value: given.humanizedCount(locale), icon: LucideIcons.gift),
            AdminStat(label: words.resetsStatUsed, value: used.humanizedCount(locale), icon: LucideIcons.zap),
            AdminStat(label: words.resetsStatRefilled, value: _usd(refilled, locale), icon: LucideIcons.coins),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpace.sm),
          child: AdminFilterChips<_Filter>(
            values: _Filter.values,
            labels: {_Filter.active: words.resetsFilterActive, _Filter.ended: words.resetsFilterEnded, _Filter.all: words.resetsFilterAll},
            counts: {for (final f in _Filter.values) f: list.where((c) => matches(c, f)).length},
            selected: _filter,
            onSelected: (f) => setState(() => _filter = f),
          ),
        ),
        if (list.isEmpty)
          AdminEmptyCard(
            icon: LucideIcons.gift,
            message: words.resetsNoCampaigns,
            action: FilledButton.tonalIcon(onPressed: _newCampaign, icon: const Icon(LucideIcons.plus, size: 18), label: Text(words.resetsNewCampaign)),
          )
        else if (shown.isEmpty)
          AdminEmptyCard(icon: LucideIcons.funnelX, message: words.resetsNoMatches)
        else
          for (final c in shown)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.sm),
              child: _CampaignCard(campaign: c, onAction: (a) => _act(c, a), onEdit: () => _edit(c)),
            ),
      ],
    );
  }
}

/// On, how many resets a workspace gets and holds, and whether owners hear about them. The
/// steppers change at once and save a moment after the last tap.
class _SettingsCard extends ConsumerStatefulWidget {
  const _SettingsCard({required this.settings});
  final LimitResetSettings settings;

  @override
  ConsumerState<_SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends ConsumerState<_SettingsCard> {
  bool? _enabled;
  bool? _notify;
  int? _perPeriod;
  int? _maxHeld;
  Timer? _debounce;
  LimitResetsApi? _api;

  LimitResetSettings get _current => LimitResetSettings(
    enabled: _enabled ?? widget.settings.enabled,
    perPeriod: _perPeriod ?? widget.settings.perPeriod,
    maxHeld: _maxHeld ?? widget.settings.maxHeld,
    notifyOwners: _notify ?? widget.settings.notifyOwners,
  );

  @override
  void didUpdateWidget(_SettingsCard old) {
    super.didUpdateWidget(old);
    // The server's answer arrived: show it, unless more taps are waiting to be saved.
    if (old.settings != widget.settings && !(_debounce?.isActive ?? false)) {
      _enabled = _notify = null;
      _perPeriod = _maxHeld = null;
    }
  }

  @override
  void dispose() {
    // Leaving with a change not yet sent: send it anyway.
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
      _api?.setAdminLimitResetSettings(limitResetSettings: _current).ignore();
    }
    super.dispose();
  }

  Future<void> _save() async {
    _debounce?.cancel();
    final next = _current;
    await runGuarded(context, () => ref.read(backendProvider).limitResets.setAdminLimitResetSettings(limitResetSettings: next));
    if (mounted) ref.invalidate(_settings);
  }

  void _step({int? perPeriod, int? maxHeld}) {
    _api = ref.read(backendProvider).limitResets;
    setState(() {
      _perPeriod = perPeriod ?? _perPeriod;
      _maxHeld = maxHeld ?? _maxHeld;
    });
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), _save);
  }

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final s = _current;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    final divider = Divider(height: 1, thickness: 1, color: context.appColors.hairline);
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: AppSpace.xxs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SwitchListTile(
            key: const Key('resetsEnabled'),
            title: Text(words.resetsEnabled, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
            subtitle: s.enabled ? null : Text(words.resetsOffNote, key: const Key('resetsOffNote'), style: muted),
            value: s.enabled,
            onChanged: (v) {
              setState(() => _enabled = v);
              _save();
            },
          ),
          divider,
          _StepperRow(
            keyPrefix: 'resetsPerPeriod',
            label: words.resetsPerPeriod,
            value: s.perPeriod,
            onChanged: (v) => _step(perPeriod: v),
          ),
          _StepperRow(
            keyPrefix: 'resetsMaxHeld',
            label: words.resetsMaxHeld,
            value: s.maxHeld,
            onChanged: (v) => _step(maxHeld: v),
          ),
          divider,
          SwitchListTile(
            key: const Key('resetsNotifyOwners'),
            title: Text(words.resetsNotifyOwners),
            value: s.notifyOwners,
            onChanged: (v) {
              setState(() => _notify = v);
              _save();
            },
          ),
        ],
      ),
    );
  }
}

/// A label with − n + beside it. 1 to 100, as the server allows.
class _StepperRow extends StatelessWidget {
  const _StepperRow({required this.keyPrefix, required this.label, required this.value, required this.onChanged});
  final String keyPrefix;
  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  static const _min = 1;
  static const _max = 100;

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(AppSpace.md, AppSpace.xs, AppSpace.sm, AppSpace.xs),
      child: Row(
        children: [
          Expanded(child: Text(label, style: context.textTheme.bodyLarge)),
          const SizedBox(width: AppSpace.xs),
          IconButton.outlined(
            key: Key('$keyPrefix-minus'),
            tooltip: words.resetsDecrease,
            visualDensity: VisualDensity.compact,
            onPressed: value > _min ? () => onChanged(value - 1) : null,
            icon: const Icon(LucideIcons.minus, size: 16),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$value',
              key: Key('$keyPrefix-value'),
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, fontFeatures: AppText.tabular),
            ),
          ),
          IconButton.outlined(
            key: Key('$keyPrefix-plus'),
            tooltip: words.resetsIncrease,
            visualDensity: VisualDensity.compact,
            onPressed: value < _max ? () => onChanged(value + 1) : null,
            icon: const Icon(LucideIcons.plus, size: 16),
          ),
        ],
      ),
    );
  }
}

class _CampaignCard extends StatelessWidget {
  const _CampaignCard({required this.campaign, required this.onAction, required this.onEdit});
  final LimitResetCampaign campaign;
  final ValueChanged<String> onAction;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final locale = words.localeName;
    final c = campaign;
    final (state, tone) = _stateLabel(words, c.state);
    final budget = c.budgetUsd;
    final audience = c.audience;
    final primary = switch (c.state) {
      'draft' => ('schedule', words.resetsSchedule, LucideIcons.calendarClock),
      'live' => ('pause', words.resetsPause, LucideIcons.pause),
      'paused' => ('resume', words.resetsResume, LucideIcons.play),
      _ => null,
    };
    final editable = _activeStates.contains(c.state);
    final menu = [
      if (editable)
        AdminMenuAction(
          key: const Key('resetsCancelCampaign'),
          label: words.resetsCancelCampaign,
          icon: LucideIcons.ban,
          destructive: true,
          onSelected: () => onAction('cancel'),
        ),
      if (c.state == 'draft')
        AdminMenuAction(
          key: const Key('resetsDeleteCampaign'),
          label: words.delete,
          icon: LucideIcons.trash2,
          destructive: true,
          onSelected: () => onAction('delete'),
        ),
    ];
    final String who;
    if (audience.workspaceIds?.isNotEmpty ?? false) {
      who = words.resetsAudienceWorkspaces(audience.workspaceIds!.length);
    } else if (audience.planCodes?.isNotEmpty ?? false) {
      who = _plansSummary(words, audience.planCodes!);
    } else {
      who = words.resetsAudienceEveryone;
    }
    return AppCard(
      key: Key('resetsCampaign-${c.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(c.name, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: AppSpace.xs),
              AdminStatusPill(state, tone: tone),
            ],
          ),
          if (c.message.trim().isNotEmpty) ...[const SizedBox(height: AppSpace.xs), _Quote(c.message)],
          const SizedBox(height: AppSpace.sm),
          if (budget != null && budget > 0) ...[
            AdminMeter(
              fraction: (c.refilledUsd / budget).toDouble(),
              start: words.resetsBudgetUsed(_usd(c.refilledUsd, locale), _usd(budget, locale)),
            ),
            const SizedBox(height: AppSpace.sm),
          ],
          Wrap(
            spacing: AppSpace.md,
            runSpacing: AppSpace.xxs,
            children: [
              _Fact(icon: LucideIcons.gift, text: words.resetsGivenN(c.given.humanizedCount(locale)), strong: true),
              _Fact(icon: LucideIcons.zap, text: words.resetsUsedN(c.used.humanizedCount(locale)), strong: true),
            ],
          ),
          const SizedBox(height: AppSpace.xxs),
          _Fact(icon: LucideIcons.calendar, text: words.resetsStartsEnds(_day(context, c.startsAt), _day(context, c.expiresAt))),
          _Fact(icon: LucideIcons.users, text: who),
          if (audience.createdBefore != null)
            _Fact(icon: LucideIcons.userPlus, text: words.resetsAudienceJoinedBefore(_day(context, audience.createdBefore!))),
          if (audience.limitedWithinDays != null)
            _Fact(icon: LucideIcons.gauge, text: words.resetsAudienceLimited(audience.limitedWithinDays!)),
          if (editable) ...[
            const SizedBox(height: AppSpace.xs),
            Divider(height: 1, thickness: 1, color: context.appColors.hairline),
            const SizedBox(height: AppSpace.xs),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: AppSpace.xs,
                    runSpacing: AppSpace.xs,
                    children: [
                      if (primary != null)
                        FilledButton.tonalIcon(
                          key: Key('resetsAction-${primary.$1}'),
                          onPressed: () => onAction(primary.$1),
                          icon: Icon(primary.$3, size: 16),
                          label: Text(primary.$2),
                        ),
                      TextButton.icon(
                        key: const Key('resetsEdit'),
                        onPressed: onEdit,
                        icon: const Icon(LucideIcons.pencil, size: 16),
                        label: Text(words.edit),
                      ),
                    ],
                  ),
                ),
                AdminActionsMenu(actions: menu),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// The campaign's message as people will read it: a quote with a bar beside it.
class _Quote extends StatelessWidget {
  const _Quote(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: AppSpace.sm),
      decoration: BoxDecoration(
        border: BorderDirectional(start: BorderSide(color: context.colorScheme.primary.withValues(alpha: 0.5), width: 3)),
      ),
      child: Text(
        '“$text”',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant, fontStyle: FontStyle.italic, height: 1.35),
      ),
    );
  }
}

/// A small icon and a line of text.
class _Fact extends StatelessWidget {
  const _Fact({required this.icon, required this.text, this.strong = false});
  final IconData icon;
  final String text;
  final bool strong;

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: context.textTheme.bodySmall?.copyWith(
                color: strong ? context.colorScheme.onSurface : color,
                fontWeight: strong ? FontWeight.w600 : null,
                fontFeatures: AppText.tabular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A full-height form for a campaign, or for one workspace's reset. Live and paused campaigns can
/// change only their message, expiry, budget and reminder.
class _Editor extends ConsumerStatefulWidget {
  const _Editor({this.campaign, this.workspace, this.workspaceName});
  final LimitResetCampaign? campaign;
  final String? workspace;
  final String? workspaceName;

  @override
  ConsumerState<_Editor> createState() => _EditorState();
}

class _EditorState extends ConsumerState<_Editor> {
  late final TextEditingController _name;
  late final TextEditingController _message;
  late final TextEditingController _days;
  late final TextEditingController _cap;
  late final TextEditingController _budget;
  late Set<String> _plans;
  late List<String> _workspaces;
  DateTime? _before;
  late DateTime _start;
  late DateTime _expiry;
  late int _percent;
  late bool _daily, _computer, _arrival, _reminder;
  var _busy = false;
  var _errors = <String, String>{};
  Timer? _estimateTimer;
  String? _estimate;
  var _estimating = false;
  var _estimateRun = 0;
  var _seeded = false;

  bool get _locked => const {'live', 'paused'}.contains(widget.campaign?.state);
  bool get _single => widget.workspace != null;

  @override
  void initState() {
    super.initState();
    final c = widget.campaign;
    _name = TextEditingController(text: c?.name ?? '');
    _message = TextEditingController(text: c?.message ?? '');
    _days = TextEditingController(text: '${c?.audience.limitedWithinDays ?? ''}');
    _cap = TextEditingController(text: '${c?.maxPerUseUsd ?? ''}');
    _budget = TextEditingController(text: '${c?.budgetUsd ?? ''}');
    _plans = {...?(c == null ? _allPlanCodes : c.audience.planCodes)};
    _workspaces = [...?c?.audience.workspaceIds];
    _before = c?.audience.createdBefore?.toLocal();
    final now = DateTime.now();
    _start = (c?.startsAt ?? now).toLocal();
    _expiry = (c?.expiresAt ?? now.add(const Duration(days: 14))).toLocal();
    _percent = c?.refillPercent ?? 100;
    _daily = c?.resetDaily ?? true;
    _computer = c?.resetComputer ?? false;
    _arrival = c?.notifyArrival ?? true;
    _reminder = c?.notifyReminder ?? true;
    for (final field in [_days, _cap, _budget]) {
      field.addListener(_scheduleEstimate);
    }
    _scheduleEstimate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Something new starts with a friendly message (and, for one workspace, a name) in the app's
    // language.
    if (_seeded || widget.campaign != null) return;
    _seeded = true;
    _message.text = context.l10n.resetsDefaultMessage;
    if (widget.workspaceName != null) _name.text = context.l10n.resetsGiveName(widget.workspaceName!);
  }

  @override
  void dispose() {
    _estimateTimer?.cancel();
    for (final c in [_name, _message, _days, _cap, _budget]) {
      c.dispose();
    }
    super.dispose();
  }

  void _update(VoidCallback change) {
    setState(change);
    _scheduleEstimate();
  }

  void _scheduleEstimate() {
    _estimateTimer?.cancel();
    _estimateTimer = Timer(const Duration(milliseconds: 800), _runEstimate);
  }

  /// What's wrong with the form, by field. [forEstimate] skips the words, which don't change reach.
  Map<String, String> _problems(AppLocalizations words, {bool forEstimate = false}) {
    final problems = <String, String>{};
    if (!forEstimate) {
      for (final (key, field) in [('name', _name), ('message', _message)]) {
        final text = field.text.trim();
        if (text.isEmpty) {
          problems[key] = words.resetsRequired;
        } else if (text.length > 120) {
          problems[key] = words.resetsTooLong;
        }
      }
    }
    final days = _days.text.trim();
    if (days.isNotEmpty) {
      final n = int.tryParse(days);
      if (n == null || n < 1 || n > 365) problems['days'] = words.resetsDaysInvalid;
    }
    for (final (key, field) in [('cap', _cap), ('budget', _budget)]) {
      final text = field.text.trim();
      if (text.isEmpty) continue;
      final n = num.tryParse(text);
      if (n == null || !n.isFinite || n < 0 || n > 1000000) problems[key] = words.resetsMoneyInvalid;
    }
    if (!_expiry.isAfter(_start)) problems['expiry'] = words.resetsExpiryBeforeStart;
    return problems;
  }

  LimitResetCampaignInput _input({bool placeholders = false}) {
    String text(TextEditingController c) => c.text.trim().isEmpty && placeholders ? '-' : c.text.trim();
    final plans = [..._allPlanCodes.where(_plans.contains), ..._plans.where((p) => !_allPlanCodes.contains(p))];
    return LimitResetCampaignInput(
      name: text(_name),
      message: text(_message),
      audience: LimitResetAudience(
        planCodes: _single ? [] : plans,
        workspaceIds: _single ? [widget.workspace!] : _workspaces,
        createdBefore: _before?.toUtc(),
        limitedWithinDays: int.tryParse(_days.text.trim()),
      ),
      startsAt: _start.toUtc(),
      expiresAt: _expiry.toUtc(),
      refillPercent: _percent,
      maxPerUseUsd: num.tryParse(_cap.text.trim()),
      budgetUsd: num.tryParse(_budget.text.trim()),
      resetDaily: _daily,
      resetComputer: _computer,
      notifyArrival: _arrival,
      notifyReminder: _reminder,
    );
  }

  Future<void> _runEstimate() async {
    if (!mounted) return;
    final words = context.l10n;
    final locale = words.localeName;
    if (_problems(words, forEstimate: true).isNotEmpty) {
      setState(() {
        _estimate = null;
        _estimating = false;
      });
      return;
    }
    final run = ++_estimateRun;
    setState(() => _estimating = true);
    try {
      final preview = (await ref.read(backendProvider).limitResets.previewAdminLimitResetCampaign(limitResetCampaignInput: _input(placeholders: true))).data!;
      if (!mounted || run != _estimateRun) return;
      setState(() {
        _estimate = words.resetsEstimate(preview.workspaces, _usd(preview.creditsUsd, locale), _usd(preview.costUsd, locale));
        _estimating = false;
      });
    } catch (_) {
      if (!mounted || run != _estimateRun) return;
      setState(() {
        _estimate = null;
        _estimating = false;
      });
    }
  }

  Future<void> _submit() async {
    final words = context.l10n;
    final problems = _problems(words);
    setState(() => _errors = problems);
    if (problems.isNotEmpty) return;
    setState(() => _busy = true);
    await runGuarded(context, () async {
      final input = _input();
      final api = ref.read(backendProvider).limitResets;
      final preview = (await api.previewAdminLimitResetCampaign(limitResetCampaignInput: input)).data!;
      if (!mounted) return;
      setState(() => _busy = false);
      final confirmed = await adminConfirm(
        context,
        title: words.resetsPreviewSave,
        message: words.resetsPreviewMessage(preview.workspaces, _usd(preview.creditsUsd, words.localeName), _usd(preview.costUsd, words.localeName)),
        confirmLabel: words.save,
        confirmKey: const Key('resetsConfirmSave'),
      );
      if (!confirmed || !mounted) return;
      setState(() => _busy = true);
      if (widget.campaign != null) {
        await api.updateAdminLimitResetCampaign(id: widget.campaign!.id, limitResetCampaignInput: input);
      } else if (_single) {
        await api.giveAdminWorkspaceLimitReset(id: widget.workspace!, limitResetCampaignInput: input);
      } else {
        await api.createAdminLimitResetCampaign(limitResetCampaignInput: input);
      }
      if (mounted) Navigator.pop(context, true);
    });
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final locked = _locked;
    final title = _single ? words.resetsGive : (widget.campaign == null ? words.resetsNewCampaign : words.resetsEditCampaign);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(AppSpace.xl, AppSpace.xs, AppSpace.xs, AppSpace.xs),
          child: Row(
            children: [
              Expanded(
                child: Text(title, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.3)),
              ),
              IconButton(
                tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                onPressed: _busy ? null : () => Navigator.pop(context),
                icon: const Icon(LucideIcons.x, size: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            key: const Key('resetsEditorList'),
            padding: const EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.xs, AppSpace.xl, AppSpace.lg),
            children: [
              if (locked) ...[FormNote(words.resetsLockedNote, icon: LucideIcons.lock), const SizedBox(height: AppSpace.md)],
              _EditorSection(
                title: words.resetsSectionBasics,
                children: [
                  TextField(
                    key: const Key('resetsName'),
                    controller: _name,
                    enabled: !locked,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(labelText: words.resetsName, errorText: _errors['name']),
                  ),
                  TextField(
                    key: const Key('resetsMessage'),
                    controller: _message,
                    minLines: 2,
                    maxLines: 3,
                    maxLength: 120,
                    textCapitalization: TextCapitalization.sentences,
                    // One line on the server: a new line becomes a space.
                    inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[\r\n]'), replacementString: ' ')],
                    decoration: InputDecoration(labelText: words.resetsMessage, errorText: _errors['message']),
                  ),
                  _MessagePreview(controller: _message),
                ],
              ),
              _EditorSection(
                title: words.resetsSectionAudience,
                children: _single
                    ? [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Chip(
                            key: const Key('resetsSingleWorkspace'),
                            avatar: AdminAvatar(widget.workspaceName ?? widget.workspace!, size: 22),
                            label: Text(words.resetsOnlyWorkspace(widget.workspaceName ?? widget.workspace!)),
                          ),
                        ),
                      ]
                    : [
                        _PlanPicker(selected: _plans, enabled: !locked, onChanged: (p) => _update(() => _plans = p)),
                        _Label(words.resetsWorkspacesLabel, hint: words.resetsWorkspacesHint),
                        _WorkspacePicker(selected: _workspaces, enabled: !locked, onChanged: (ids) => _update(() => _workspaces = ids)),
                        _DateField(
                          fieldKey: const Key('resetsBefore'),
                          label: words.resetsJoinedBefore,
                          value: _before,
                          enabled: !locked,
                          onChanged: (d) => _update(() => _before = d),
                        ),
                        TextField(
                          key: const Key('resetsDays'),
                          controller: _days,
                          enabled: !locked,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(labelText: words.resetsLimitedDaysLabel, helperText: words.resetsOptional, errorText: _errors['days']),
                        ),
                      ],
              ),
              _EditorSection(
                title: words.resetsSectionTiming,
                children: [
                  _DateTimeField(
                    fieldKey: const Key('resetsStart'),
                    label: words.resetsStartsLabel,
                    value: _start,
                    enabled: !locked,
                    onChanged: (d) => _update(() => _start = d),
                  ),
                  _DateTimeField(
                    fieldKey: const Key('resetsExpiry'),
                    label: words.resetsEndsLabel,
                    value: _expiry,
                    error: _errors['expiry'],
                    onChanged: (d) => _update(() => _expiry = d),
                  ),
                ],
              ),
              _EditorSection(
                title: words.resetsSectionRefill,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(words.resetsPercentValue(_percent), style: context.textTheme.bodyLarge),
                      Slider(
                        key: const Key('resetsPercent'),
                        min: 10,
                        max: 100,
                        divisions: 9,
                        value: _percent.clamp(10, 100).toDouble(),
                        label: '$_percent%',
                        onChanged: locked
                            ? null
                            : (v) {
                                final next = v.round();
                                if (next != _percent) Haptic.snap();
                                _update(() => _percent = next);
                              },
                      ),
                    ],
                  ),
                  _MoneyField(fieldKey: const Key('resetsCap'), controller: _cap, label: words.resetsCapLabel, enabled: !locked, error: _errors['cap']),
                  _MoneyField(fieldKey: const Key('resetsBudget'), controller: _budget, label: words.resetsBudgetLabel, error: _errors['budget']),
                ],
              ),
              _EditorSection(
                title: words.resetsSectionWhat,
                children: [
                  FormSwitch(title: words.resetsDaily, value: _daily, onChanged: locked ? null : (v) => _update(() => _daily = v)),
                  FormSwitch(title: words.resetsComputer, value: _computer, onChanged: locked ? null : (v) => _update(() => _computer = v)),
                ],
              ),
              _EditorSection(
                title: words.resetsSectionNotify,
                children: [
                  FormSwitch(title: words.resetsArrival, value: _arrival, onChanged: locked ? null : (v) => _update(() => _arrival = v)),
                  FormSwitch(title: words.resetsReminder, value: _reminder, onChanged: (v) => _update(() => _reminder = v)),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.appColors.hairline),
        Padding(
          padding: const EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.sm, AppSpace.xl, AppSpace.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(LucideIcons.radar, size: 16, color: context.colorScheme.onSurfaceVariant),
                  const SizedBox(width: AppSpace.xs),
                  Expanded(
                    child: Text(
                      _estimate ?? (_estimating ? words.resetsEstimating : words.resetsEstimateNeedsFields),
                      key: const Key('resetsEstimate'),
                      style: _estimate == null ? muted : context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, fontFeatures: AppText.tabular),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.sm),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                spacing: AppSpace.xs,
                overflowAlignment: OverflowBarAlignment.end,
                children: [
                  TextButton(onPressed: _busy ? null : () => Navigator.pop(context), child: Text(words.cancel)),
                  FilledButton(
                    key: const Key('resetsSave'),
                    onPressed: _busy ? null : _submit,
                    child: _busy
                        ? SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2.2, color: context.colorScheme.onPrimary))
                        : Text(words.resetsPreviewSave),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EditorSection extends StatelessWidget {
  const _EditorSection({required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpace.sm,
        children: [
          Semantics(
            header: true,
            child: Text(title, style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, color: context.colorScheme.primary)),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text, {this.hint});
  final String text;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
        if (hint != null) Text(hint!, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
      ],
    );
  }
}

/// The message as a bubble, the way it shows up in the app.
class _MessagePreview extends StatelessWidget {
  const _MessagePreview({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final text = value.text.trim();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.resetsPreviewLabel, style: context.textTheme.labelMedium?.copyWith(color: scheme.onSurfaceVariant)),
            const SizedBox(height: AppSpace.xxs),
            Container(
              key: const Key('resetsMessagePreview'),
              padding: const EdgeInsets.all(AppSpace.sm),
              decoration: BoxDecoration(
                color: scheme.primary.withValues(alpha: context.isDark ? 0.16 : 0.08),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.tile),
                  topRight: Radius.circular(AppRadius.tile),
                  bottomRight: Radius.circular(AppRadius.tile),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(LucideIcons.gift, size: 18, color: scheme.primary),
                  const SizedBox(width: AppSpace.xs),
                  Expanded(
                    child: Text(
                      text.isEmpty ? '…' : text,
                      style: context.textTheme.bodyMedium?.copyWith(height: 1.35),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Plus, Pro and Max, each with a monthly and a yearly tick, plus any other code a campaign holds.
class _PlanPicker extends StatelessWidget {
  const _PlanPicker({required this.selected, required this.onChanged, this.enabled = true});
  final Set<String> selected;
  final ValueChanged<Set<String>> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    void toggle(String code, bool on) => onChanged(on ? {...selected, code} : ({...selected}..remove(code)));
    Widget chip(String code, String label) => FilterChip(
      key: Key('resetsPlan-$code'),
      label: Text(label),
      selected: selected.contains(code),
      onSelected: enabled ? (on) => toggle(code, on) : null,
    );
    final others = selected.where((c) => !_allPlanCodes.contains(c)).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpace.xs,
      children: [
        _Label(words.resetsPlansLabel, hint: words.resetsPlansHint),
        for (final tier in _tiers)
          Row(
            children: [
              SizedBox(width: 56, child: Text(_planName(words, tier), style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600))),
              Expanded(
                child: Wrap(
                  spacing: AppSpace.xs,
                  runSpacing: AppSpace.xxs,
                  children: [chip(tier, words.resetsMonthly), chip('${tier}_yearly', words.resetsYearly)],
                ),
              ),
            ],
          ),
        if (others.isNotEmpty) Wrap(spacing: AppSpace.xs, runSpacing: AppSpace.xxs, children: [for (final c in others) chip(c, _planName(words, c))]),
      ],
    );
  }
}

/// Finds workspaces by name and shows the picked ones as chips; [single] keeps one at a time.
class _WorkspacePicker extends ConsumerStatefulWidget {
  const _WorkspacePicker({required this.selected, required this.onChanged, this.single = false, this.enabled = true});
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;
  final bool single;
  final bool enabled;

  @override
  ConsumerState<_WorkspacePicker> createState() => _WorkspacePickerState();
}

class _WorkspacePickerState extends ConsumerState<_WorkspacePicker> {
  final _search = TextEditingController();
  var _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _pick(String id) {
    widget.onChanged(widget.single ? [id] : [...widget.selected, id]);
    _search.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final orgs = ref.watch(adminOrgsProvider);
    final names = {for (final o in orgs.value ?? const <AdminOrg>[]) o.id: o.name};
    final q = _query.trim().toLowerCase();
    final matches = q.isEmpty
        ? const <AdminOrg>[]
        : (orgs.value ?? const <AdminOrg>[])
              .where((o) => !widget.selected.contains(o.id) && (o.name.toLowerCase().contains(q) || o.id.startsWith(q)))
              .take(6)
              .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpace.xs,
      children: [
        if (widget.selected.isNotEmpty)
          Wrap(
            spacing: AppSpace.xs,
            runSpacing: AppSpace.xs,
            children: [
              for (final id in widget.selected)
                InputChip(
                  key: Key('resetsWorkspaceChip-$id'),
                  avatar: AdminAvatar(names[id] ?? id, size: 22),
                  label: Text(names[id] ?? '${id.substring(0, id.length.clamp(0, 8))}…'),
                  onDeleted: widget.enabled ? () => widget.onChanged([...widget.selected]..remove(id)) : null,
                ),
            ],
          ),
        if (widget.enabled && !(widget.single && widget.selected.isNotEmpty))
          AdminSearchField(
            key: const Key('resetsWorkspaceSearch'),
            controller: _search,
            hint: words.resetsSearchWorkspaces,
            onChanged: (v) => setState(() => _query = v),
          ),
        if (q.isNotEmpty)
          if (orgs.isLoading && !orgs.hasValue)
            const LinearProgressIndicator(minHeight: 2)
          else if (orgs.hasError && !orgs.hasValue)
            InlineError(error: orgs.error!, onRetry: () => ref.invalidate(adminOrgsProvider))
          else if (matches.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.xs),
              child: Text(words.resetsNoWorkspaceMatch, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
            )
          else
            GroupedCard(
              dividerIndent: 56,
              children: [
                for (final o in matches)
                  InkWell(
                    key: Key('resetsWorkspaceOption-${o.id}'),
                    onTap: () => _pick(o.id),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: 10),
                      child: Row(
                        children: [
                          AdminAvatar(o.name),
                          const SizedBox(width: AppSpace.sm),
                          Expanded(
                            child: Text(o.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                          ),
                          if (o.planCode != null) ...[const SizedBox(width: AppSpace.xs), AdminStatusPill(_planName(words, o.planCode!))],
                        ],
                      ),
                    ),
                  ),
              ],
            ),
      ],
    );
  }
}

/// A tappable field that opens the date picker, with a clear button.
class _DateField extends StatelessWidget {
  const _DateField({required this.label, required this.value, required this.onChanged, this.enabled = true, this.fieldKey});
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;
  final bool enabled;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final v = value;
    return InkWell(
      key: fieldKey,
      borderRadius: BorderRadius.circular(AppRadius.row),
      onTap: !enabled
          ? null
          : () async {
              final now = DateTime.now();
              final picked = await showDatePicker(context: context, initialDate: v ?? now, firstDate: DateTime(2020), lastDate: DateTime(2100));
              if (picked != null) onChanged(DateTime(picked.year, picked.month, picked.day));
            },
      child: InputDecorator(
        isEmpty: false,
        decoration: InputDecoration(
          labelText: label,
          helperText: words.resetsOptional,
          enabled: enabled,
          prefixIcon: const Icon(LucideIcons.calendar, size: 18),
          suffixIcon: v == null || !enabled
              ? null
              : IconButton(tooltip: words.vendorClearDate, onPressed: () => onChanged(null), icon: const Icon(LucideIcons.x, size: 16)),
        ),
        child: Text(v == null ? words.vendorDateNotSet : v.formattedDate(context)),
      ),
    );
  }
}

/// A date and a time, picked one after the other.
class _DateTimeField extends StatelessWidget {
  const _DateTimeField({required this.label, required this.value, required this.onChanged, this.enabled = true, this.error, this.fieldKey});
  final String label;
  final DateTime value;
  final ValueChanged<DateTime> onChanged;
  final bool enabled;
  final String? error;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: fieldKey,
      borderRadius: BorderRadius.circular(AppRadius.row),
      onTap: !enabled
          ? null
          : () async {
              final date = await showDatePicker(context: context, initialDate: value, firstDate: DateTime(2020), lastDate: DateTime(2100));
              if (date == null || !context.mounted) return;
              final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(value));
              final t = time ?? TimeOfDay.fromDateTime(value);
              onChanged(DateTime(date.year, date.month, date.day, t.hour, t.minute));
            },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          enabled: enabled,
          errorText: error,
          prefixIcon: const Icon(LucideIcons.calendarClock, size: 18),
        ),
        child: Text('${value.formattedWeekdayDate(context)}, ${value.formattedTime(context)}'),
      ),
    );
  }
}

class _MoneyField extends StatelessWidget {
  const _MoneyField({required this.controller, required this.label, this.enabled = true, this.error, this.fieldKey});
  final TextEditingController controller;
  final String label;
  final bool enabled;
  final String? error;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: fieldKey,
      controller: controller,
      enabled: enabled,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: label, prefixText: r'$ ', helperText: context.l10n.resetsOptional, errorText: error),
    );
  }
}

/// One workspace's saved resets: pick it, read its history, give it one, take one back.
class _WorkspaceResets extends ConsumerStatefulWidget {
  const _WorkspaceResets();

  @override
  ConsumerState<_WorkspaceResets> createState() => _WorkspaceResetsState();
}

class _WorkspaceResetsState extends ConsumerState<_WorkspaceResets> {
  String? _workspace;
  List<LimitResetEvent>? _events;
  var _loading = false;

  Future<void> _load() async {
    setState(() => _loading = true);
    final workspace = _workspace;
    final data = await runGuarded(context, () async {
      return (await ref.read(backendProvider).limitResets.adminLimitResetEvents(orgId: workspace, limit: 1000)).data!;
    });
    if (!mounted || workspace != _workspace) return;
    setState(() {
      _events = data ?? _events;
      _loading = false;
    });
  }

  Future<void> _copy() async {
    final words = context.l10n;
    final ok = await runGuarded(context, () async {
      final csv = (await ref.read(backendProvider).limitResets.exportAdminLimitResetEvents(orgId: _workspace)).data!;
      await Clipboard.setData(ClipboardData(text: csv));
      return true;
    });
    if (ok == true && mounted) showSuccess(context, words.copied);
  }

  Future<void> _resetAction(LimitResetEvent e) async {
    final words = context.l10n;
    final revoke = e.action == 'given';
    final ok = await adminConfirm(
      context,
      title: revoke ? words.resetsRevokeConfirm : words.resetsUndoConfirm,
      message: revoke ? words.resetsRevokeConfirmBody : words.resetsUndoConfirmBody,
      confirmLabel: revoke ? words.resetsRevoke : words.resetsUndo,
      destructive: true,
      confirmKey: const Key('resetsConfirmReset'),
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(context, () async {
      await ref
          .read(backendProvider)
          .limitResets
          .actionAdminWorkspaceLimitReset(
            id: e.resetId!,
            actionAdminWorkspaceLimitResetRequest: ActionAdminWorkspaceLimitResetRequest(
              action: revoke ? ActionAdminWorkspaceLimitResetRequestActionEnum.revoke : ActionAdminWorkspaceLimitResetRequestActionEnum.undo,
            ),
          );
      return true;
    });
    if (!mounted) return;
    if (done == true) showSuccess(context, revoke ? words.resetsEventRevoked : words.resetsEventUndone);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final names = {for (final o in ref.watch(adminOrgsProvider).value ?? const <AdminOrg>[]) o.id: o.name};
    final events = _events;
    final workspace = _workspace;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _WorkspacePicker(
            single: true,
            selected: workspace == null ? const [] : [workspace],
            onChanged: (ids) {
              setState(() {
                _workspace = ids.isEmpty ? null : ids.first;
                _events = null;
              });
              if (_workspace != null) _load();
            },
          ),
          if (workspace == null && events == null) ...[
            const SizedBox(height: AppSpace.xs),
            Text(words.resetsPickWorkspace, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
          ],
          const SizedBox(height: AppSpace.sm),
          Wrap(
            spacing: AppSpace.xs,
            runSpacing: AppSpace.xs,
            children: [
              if (workspace != null)
                FilledButton.tonalIcon(
                  key: const Key('resetsGiveOne'),
                  onPressed: () async {
                    await showGiveWorkspaceReset(context, workspaceId: workspace, workspaceName: names[workspace] ?? workspace);
                    if (mounted) await _load();
                  },
                  icon: const Icon(LucideIcons.gift, size: 16),
                  label: Text(words.resetsGive),
                ),
              if (workspace == null)
                OutlinedButton.icon(
                  key: const Key('resetsLoadHistory'),
                  onPressed: _loading ? null : _load,
                  icon: const Icon(LucideIcons.history, size: 16),
                  label: Text(words.resetsAllHistory),
                ),
              TextButton.icon(
                key: const Key('resetsCopyCsv'),
                onPressed: events == null || events.isEmpty ? null : _copy,
                icon: const Icon(LucideIcons.copy, size: 16),
                label: Text(words.resetsCopyCsv),
              ),
            ],
          ),
          if (_loading) const Padding(padding: EdgeInsets.only(top: AppSpace.sm), child: LinearProgressIndicator(minHeight: 2)),
          if (events != null) ...[
            const SizedBox(height: AppSpace.sm),
            if (events.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpace.md),
                child: Text(words.resetsNoEvents, textAlign: TextAlign.center, style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant)),
              )
            else
              for (final e in events)
                _EventRow(
                  event: e,
                  workspaceName: workspace != null ? null : (e.orgId == null ? null : names[e.orgId] ?? '${e.orgId!.substring(0, e.orgId!.length.clamp(0, 8))}…'),
                  onAction: e.resetId != null && const {'given', 'used'}.contains(e.action) ? () => _resetAction(e) : null,
                ),
          ],
        ],
      ),
    );
  }
}

class _EventRow extends StatelessWidget {
  const _EventRow({required this.event, this.workspaceName, this.onAction});
  final LimitResetEvent event;
  final String? workspaceName;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final words = context.l10n;
    final (label, icon, tone) = switch (event.action) {
      'given' => (words.resetsEventGiven, LucideIcons.gift, AdminTone.positive),
      'used' => (words.resetsEventUsed, LucideIcons.zap, AdminTone.info),
      'revoked' => (words.resetsEventRevoked, LucideIcons.undo2, AdminTone.negative),
      'undone' => (words.resetsEventUndone, LucideIcons.rotateCcw, AdminTone.warning),
      'expired' => (words.resetsEventExpired, LucideIcons.hourglass, AdminTone.neutral),
      'created' => (words.resetsEventCreated, LucideIcons.plus, AdminTone.primary),
      'edited' => (words.resetsEventEdited, LucideIcons.pencil, AdminTone.neutral),
      'started' || 'live' => (words.resetsEventStarted, LucideIcons.play, AdminTone.positive),
      'ended' => (words.resetsEventEnded, LucideIcons.flag, AdminTone.neutral),
      'schedule' => (words.resetsEventScheduled, LucideIcons.calendarClock, AdminTone.info),
      'pause' => (words.resetsEventPaused, LucideIcons.pause, AdminTone.warning),
      'resume' => (words.resetsEventResumed, LucideIcons.play, AdminTone.positive),
      'cancel' => (words.resetsEventCancelled, LucideIcons.ban, AdminTone.negative),
      'delete' => (words.resetsEventDeleted, LucideIcons.trash2, AdminTone.negative),
      'settings' => (words.resetsEventSettings, LucideIcons.settings2, AdminTone.neutral),
      final other => (other.isEmpty ? other : other[0].toUpperCase() + other.substring(1).replaceAll('_', ' '), LucideIcons.dot, AdminTone.neutral),
    };
    final color = adminToneColor(context, tone);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    return Padding(
      key: Key('resetsEvent-${event.id}'),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.14), shape: BoxShape.circle),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (workspaceName != null) ...[Text(workspaceName!, style: muted), Text('·', style: muted)],
                    TimeAgo(event.createdAt, style: muted),
                  ],
                ),
              ],
            ),
          ),
          if (onAction != null)
            TextButton(
              key: Key('resetsEventAction-${event.id}'),
              onPressed: onAction,
              child: Text(event.action == 'given' ? words.resetsRevoke : words.resetsUndo),
            ),
        ],
      ),
    );
  }
}
