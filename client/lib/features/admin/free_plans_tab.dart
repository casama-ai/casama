import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart'
    show
        Comp,
        CompCode,
        CompFromEnum,
        CompSettings,
        CreateCompCodeRequest,
        CreatedCompCode,
        GrantCompRequest,
        UpdateCompCodeRequest,
        UpdateCompRequest;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/date_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';

final adminCompSettingsProvider = FutureProvider.autoDispose<CompSettings>(
  (r) => r.watch(backendProvider).adminCompSettings(),
);

final adminCompCodesProvider = FutureProvider.autoDispose<List<CompCode>>(
  (r) => r.watch(backendProvider).adminCompCodes(),
);

/// Free plans, running ones only when the argument is true.
final adminCompsProvider = FutureProvider.autoDispose.family<List<Comp>, bool>(
  (r, running) => r.watch(backendProvider).adminComps(running: running, limit: 200),
);

/// "plus" → "Plus": plan codes are lowercase words.
String compPlanName(String code) => code.isEmpty ? code : code[0].toUpperCase() + code.substring(1);

(String, AdminTone) compCodeStatus(BuildContext context, CompCode c, {DateTime? now}) {
  final l10n = context.l10n;
  final at = now ?? DateTime.now();
  if (c.disabled) return (l10n.adminFreeStatusOff, AdminTone.neutral);
  if (c.redeemBy != null && c.redeemBy!.isBefore(at)) return (l10n.adminFreeStatusExpired, AdminTone.neutral);
  if (c.redeemedCount >= c.maxRedemptions) return (l10n.adminFreeStatusUsedUp, AdminTone.warning);
  return (l10n.adminFreeStatusLive, AdminTone.positive);
}

/// Admin console > Free Plans (D-461, docs/COMP-PLANS-PLAN.md): make gift codes and see who has a
/// free plan, give one by email, extend or end it. The server checks every cap and rule; this only
/// asks and shows.
class FreePlansTab extends ConsumerStatefulWidget {
  const FreePlansTab({super.key});

  @override
  ConsumerState<FreePlansTab> createState() => _FreePlansTabState();
}

class _FreePlansTabState extends ConsumerState<FreePlansTab> {
  var _running = true;

  Future<void> _refresh() async {
    ref.invalidate(adminCompSettingsProvider);
    ref.invalidate(adminCompCodesProvider);
    ref.invalidate(adminCompsProvider);
    try {
      await ref.read(adminCompSettingsProvider.future);
    } catch (_) {
      // The page shows the error.
    }
  }

  Future<void> _newCode(CompSettings s) async {
    final request = await showAdaptiveSheet<CreateCompCodeRequest>(
      context: context,
      builder: (_) => _NewCodeSheet(settings: s),
    );
    if (request == null || !mounted) return;
    final made = await runGuarded(context, () => ref.read(backendProvider).adminCreateCompCode(request));
    if (made == null || !mounted) return;
    ref.invalidate(adminCompCodesProvider);
    await showAdaptiveSheet<void>(context: context, builder: (_) => _MadeCodeSheet(made: made));
  }

  Future<void> _toggle(CompCode c) async {
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).adminUpdateCompCode(c.id, UpdateCompCodeRequest(disabled: !c.disabled)),
    );
    if (done != null) ref.invalidate(adminCompCodesProvider);
  }

  Future<void> _give(CompSettings s) async {
    final request = await showAdaptiveSheet<GrantCompRequest>(
      context: context,
      builder: (_) => _GiveSheet(settings: s),
    );
    if (request == null || !mounted) return;
    final made = await runGuarded(context, () => ref.read(backendProvider).adminGrantComp(request));
    if (made == null || !mounted) return;
    showSuccess(context, context.l10n.adminFreeGiven(compPlanName(made.planCode), made.endsAt.toLocal().formattedDate(context)));
    ref.invalidate(adminCompsProvider);
  }

  Future<void> _extend(Comp c, CompSettings s) async {
    final months = await showAdaptiveSheet<int>(
      context: context,
      builder: (_) => _ExtendSheet(maxMonths: s.maxMonths),
    );
    if (months == null || !mounted) return;
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).adminUpdateComp(c.id, UpdateCompRequest(extendMonths: months)),
    );
    if (done == null || !mounted) return;
    showSuccess(context, context.l10n.adminFreeExtended);
    ref.invalidate(adminCompsProvider);
  }

  Future<void> _end(Comp c) async {
    final l10n = context.l10n;
    final ok = await showConfirm(
      context: context,
      title: l10n.adminFreeEndTitle,
      message: l10n.adminFreeEndBody,
      confirmLabel: l10n.adminFreeEndNow,
      destructive: true,
      confirmKey: const Key('freeEndConfirm'),
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(
      context,
      () => ref.read(backendProvider).adminUpdateComp(c.id, UpdateCompRequest(revoke: true)),
    );
    if (done == null || !mounted) return;
    showSuccess(context, l10n.adminFreeEndedDone);
    ref.invalidate(adminCompsProvider);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncView<CompSettings>(
      value: ref.watch(adminCompSettingsProvider),
      onRetry: () => ref.invalidate(adminCompSettingsProvider),
      loading: const SkeletonPage(
        maxWidth: kAdminContentMaxWidth,
        children: [
          SkeletonCard(height: 72),
          SkeletonSectionHeader(),
          SkeletonCard(height: 120),
          SkeletonSectionHeader(),
          SkeletonGroupedCard(count: 3, row: SkeletonRow(trailing: SkeletonTrailing.none)),
        ],
      ),
      data: _content,
    );
  }

  Widget _content(CompSettings s) {
    final l10n = context.l10n;
    final codes = ref.watch(adminCompCodesProvider);
    final running = ref.watch(adminCompsProvider(true));
    final list = ref.watch(adminCompsProvider(_running));
    final live = codes.value?.where((c) => compCodeStatus(context, c).$2 == AdminTone.positive).length;
    final redeemed = codes.value?.fold<int>(0, (n, c) => n + c.redeemedCount);
    return AdminSectionList(
      onRefresh: _refresh,
      children: [
        AdminSectionHeader(
          section: AdminSection.freePlans,
          actions: [
            OutlinedButton.icon(
              key: const Key('freeGive'),
              onPressed: s.enabled && s.grantPlans.isNotEmpty ? () => _give(s) : null,
              icon: const Icon(LucideIcons.userPlus, size: 16),
              label: Text(l10n.adminFreeGive),
            ),
            FilledButton.icon(
              key: const Key('freeNewCode'),
              onPressed: s.enabled && s.codePlans.isNotEmpty ? () => _newCode(s) : null,
              icon: const Icon(LucideIcons.gift, size: 16),
              label: Text(l10n.adminFreeNewCode),
            ),
          ],
          onRefresh: _refresh,
        ),
        if (!s.enabled) AdminEmptyCard(key: const Key('freeOff'), icon: LucideIcons.gift, message: l10n.adminFreeOff),
        AdminStatStrip(
          maxColumns: 3,
          stats: [
            AdminStat(
              key: const Key('freeStatRunning'),
              label: l10n.adminFreeStatRunning,
              value: running.value == null ? '…' : l10n.adminFreeStatRunningValue(running.value!.length, s.maxActive),
              icon: LucideIcons.sparkles,
            ),
            AdminStat(
              key: const Key('freeStatLive'),
              label: l10n.adminFreeStatCodesLive,
              value: live == null ? '…' : '$live',
              icon: LucideIcons.ticket,
            ),
            AdminStat(
              key: const Key('freeStatRedeemed'),
              label: l10n.adminFreeStatRedeemed,
              value: redeemed == null ? '…' : '$redeemed',
              icon: LucideIcons.circleCheck,
            ),
          ],
        ),
        SectionHeader(title: l10n.adminFreeCodes, count: codes.value == null ? null : '${codes.value!.length}'),
        switch (codes) {
          AsyncData(:final value) when value.isEmpty => AdminEmptyCard(icon: LucideIcons.gift, message: l10n.adminFreeCodesNone),
          AsyncData(:final value) => _codeGrid(value),
          AsyncError(:final error) => AdminEmptyCard(icon: LucideIcons.circleAlert, message: errorText(context, error)),
          _ => const SkeletonCard(height: 120),
        },
        SectionHeader(title: l10n.adminFreeWho),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpace.sm),
          child: AdminFilterChips<bool>(
            values: const [true, false],
            labels: {true: l10n.adminFreeFilterRunning, false: l10n.adminFreeFilterAll},
            selected: _running,
            onSelected: (v) => setState(() => _running = v),
          ),
        ),
        switch (list) {
          AsyncData(:final value) when value.isEmpty => AdminEmptyCard(
            key: const Key('freeNone'),
            icon: LucideIcons.sparkles,
            message: _running ? l10n.adminFreeNoneRunning : l10n.adminFreeNone,
          ),
          AsyncData(:final value) => _comps(value, s),
          AsyncError(:final error) => AdminEmptyCard(icon: LucideIcons.circleAlert, message: errorText(context, error)),
          _ => const SkeletonGroupedCard(count: 3, row: SkeletonRow(trailing: SkeletonTrailing.none)),
        },
      ],
    );
  }

  Widget _codeGrid(List<CompCode> list) {
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
                child: _CodeCard(code: c, onToggle: () => _toggle(c)),
              ),
          ],
        );
      },
    );
  }

  String _reason(String? r) {
    final l10n = context.l10n;
    return switch (r) {
      'expired' => l10n.adminFreeReasonExpired,
      'revoked' => l10n.adminFreeReasonRevoked,
      'replaced_by_purchase' => l10n.adminFreeReasonReplaced,
      _ => r ?? '',
    };
  }

  Widget _comps(List<Comp> items, CompSettings s) {
    final l10n = context.l10n;
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    String who(Comp c) => (c.email?.trim().isNotEmpty ?? false) ? c.email! : (c.orgName ?? c.orgId);
    String plan(Comp c) => l10n.adminFreePlanMonths(compPlanName(c.planCode), c.months);
    String ends(Comp c) => c.endedAt != null
        ? l10n.adminFreeEndedOn(c.endedAt!.toLocal().formattedDate(context))
        : l10n.adminFreeEnds(c.endsAt.toLocal().formattedDate(context));
    Widget from(Comp c) => AdminStatusPill(
      c.from == CompFromEnum.code ? l10n.adminFreeFromCode : l10n.adminFreeFromGrant,
      icon: c.from == CompFromEnum.code ? LucideIcons.ticket : LucideIcons.userPlus,
    );
    Widget state(Comp c) => c.endedAt == null
        ? AdminStatusPill(l10n.adminFreeFilterRunning, tone: AdminTone.positive)
        : AdminStatusPill(_reason(c.endReason), tone: AdminTone.neutral);
    return AdminDataList<Comp>(
      items: items,
      itemKey: (c) => Key('freeComp-${c.id}'),
      title: who,
      leading: (ctx, c) => AdminAvatar(who(c)),
      subtitle: (ctx, c) => [plan(c), if (c.orgName != null && c.email != null) c.orgName!].join(' · '),
      badges: (ctx, c) => [
        state(c),
        from(c),
        Padding(padding: const EdgeInsets.only(top: 2), child: Text(ends(c), style: muted)),
        if (c.note?.trim().isNotEmpty ?? false)
          SizedBox(
            width: double.infinity,
            child: Text('“${c.note!.trim()}”', maxLines: 2, overflow: TextOverflow.ellipsis, style: muted?.copyWith(fontStyle: FontStyle.italic)),
          ),
      ],
      trailing: (ctx, c) => c.endedAt != null
          ? const SizedBox(width: 40)
          : AdminActionsMenu(
              key: Key('freeActions-${c.id}'),
              actions: [
                AdminMenuAction(
                  key: Key('freeExtend-${c.id}'),
                  label: l10n.adminFreeExtend,
                  icon: LucideIcons.calendarPlus,
                  onSelected: () => _extend(c, s),
                ),
                AdminMenuAction(
                  key: Key('freeEnd-${c.id}'),
                  label: l10n.adminFreeEndNow,
                  icon: LucideIcons.circleStop,
                  destructive: true,
                  onSelected: () => _end(c),
                ),
              ],
            ),
      columns: [
        AdminColumn(
          label: l10n.adminFreeColWho,
          flex: 4,
          cell: (ctx, c) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(who(c), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
              if (c.orgName != null && c.email != null) Text(c.orgName!, maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
              if (c.note?.trim().isNotEmpty ?? false)
                Text('“${c.note!.trim()}”', maxLines: 1, overflow: TextOverflow.ellipsis, style: muted?.copyWith(fontStyle: FontStyle.italic)),
            ],
          ),
        ),
        AdminColumn(
          label: l10n.adminFreeColPlan,
          flex: 3,
          cell: (ctx, c) => Wrap(spacing: 6, runSpacing: 4, children: [Text(plan(c)), from(c)]),
        ),
        AdminColumn(
          label: l10n.adminFreeColEnds,
          flex: 3,
          cell: (ctx, c) => Wrap(spacing: 6, runSpacing: 4, children: [state(c), Text(ends(c), style: muted)]),
        ),
      ],
    );
  }
}

class _CodeCard extends StatelessWidget {
  const _CodeCard({required this.code, required this.onToggle});
  final CompCode code;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = code;
    final (status, tone) = compCodeStatus(context, c);
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    return AppCard(
      key: Key('freeCode-${c.id}'),
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
                        l10n.adminFreePlanMonths(compPlanName(c.planCode), c.months),
                        style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        [
                          'G-${c.hint}',
                          if (c.note?.trim().isNotEmpty ?? false) c.note!.trim(),
                        ].join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: muted,
                      ),
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
              fraction: c.maxRedemptions > 0 ? c.redeemedCount / c.maxRedemptions : null,
              tone: c.disabled ? AdminTone.neutral : null,
              start: l10n.adminFreeUsed(c.redeemedCount, c.maxRedemptions),
              end: c.redeemBy == null ? l10n.adminFreeNoRedeemBy : l10n.adminFreeRedeemBy(c.redeemBy!.toLocal().formattedDate(context)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              key: Key('freeCodeToggle-${c.id}'),
              onPressed: onToggle,
              child: Text(c.disabled ? l10n.adminFreeTurnOn : l10n.adminFreeTurnOff),
            ),
          ),
        ],
      ),
    );
  }
}

/// Months 1 to [max], as a dropdown.
class _MonthsField extends StatelessWidget {
  const _MonthsField({required this.value, required this.max, required this.onChanged, this.fieldKey});
  final int value;
  final int max;
  final ValueChanged<int> onChanged;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      key: fieldKey,
      initialValue: value,
      decoration: InputDecoration(labelText: context.l10n.adminFreeMonths),
      items: [
        for (var m = 1; m <= max; m++) DropdownMenuItem(value: m, child: Text(context.l10n.adminFreeMonthCount(m))),
      ],
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}

class _PlanField extends StatelessWidget {
  const _PlanField({required this.value, required this.plans, required this.onChanged, this.fieldKey});
  final String value;
  final List<String> plans;
  final ValueChanged<String> onChanged;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      key: fieldKey,
      initialValue: value,
      decoration: InputDecoration(labelText: context.l10n.adminFreePlan),
      items: [for (final p in plans) DropdownMenuItem(value: p, child: Text(compPlanName(p)))],
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}

String _firstPlan(List<String> plans) => plans.contains('plus') ? 'plus' : plans.first;

class _NewCodeSheet extends StatefulWidget {
  const _NewCodeSheet({required this.settings});
  final CompSettings settings;

  @override
  State<_NewCodeSheet> createState() => _NewCodeSheetState();
}

class _NewCodeSheetState extends State<_NewCodeSheet> {
  late var _plan = _firstPlan(widget.settings.codePlans);
  late var _months = widget.settings.maxMonths >= 3 ? 3 : 1;
  final _uses = TextEditingController(text: '1');
  final _note = TextEditingController();
  // A lost code shouldn't stay live forever: 30 days unless another day is picked.
  DateTime? _by = DateUtils.dateOnly(DateTime.now()).add(const Duration(days: 30));

  @override
  void dispose() {
    _uses.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    final now = DateTime.now();
    final day = await showDatePicker(
      context: context,
      initialDate: _by ?? now.add(const Duration(days: 30)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 730)),
    );
    if (day == null || !mounted) return;
    setState(() => _by = day);
  }

  void _submit() {
    final uses = int.tryParse(_uses.text.trim());
    if (uses == null || uses < 1 || uses > 10000) {
      showWarning(context, context.l10n.adminFreeInvalid);
      return;
    }
    final note = _note.text.trim();
    Navigator.pop(
      context,
      CreateCompCodeRequest(
        planCode: _plan,
        months: _months,
        maxRedemptions: uses,
        // To the end of the chosen day, in this device's time.
        redeemBy: _by?.add(const Duration(days: 1)).subtract(const Duration(seconds: 1)).toUtc(),
        note: note.isEmpty ? null : note,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.gift,
      title: l10n.adminFreeNewCode,
      submitLabel: l10n.adminFreeCreate,
      submitKey: const Key('freeCodeCreate'),
      onSubmit: _submit,
      children: [
        Row(
          spacing: AppSpace.sm,
          children: [
            Expanded(
              child: _PlanField(
                fieldKey: const Key('freeCodePlan'),
                value: _plan,
                plans: widget.settings.codePlans,
                onChanged: (v) => setState(() => _plan = v),
              ),
            ),
            Expanded(
              child: _MonthsField(
                fieldKey: const Key('freeCodeMonths'),
                value: _months,
                max: widget.settings.maxMonths,
                onChanged: (v) => setState(() => _months = v),
              ),
            ),
          ],
        ),
        TextField(
          key: const Key('freeCodeUses'),
          controller: _uses,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: l10n.adminFreeUses, helperText: l10n.adminFreeUsesHelp, helperMaxLines: 3),
        ),
        TextField(
          key: const Key('freeCodeNote'),
          controller: _note,
          maxLength: 200,
          decoration: InputDecoration(labelText: l10n.adminFreeNote, hintText: l10n.adminFreeNoteHint),
        ),
        GroupedCard(
          children: [
            GroupedTile(
              key: const Key('freeCodeBy'),
              icon: LucideIcons.calendarX,
              title: l10n.adminFreeRedeemByLabel,
              trailing: Text(_by == null ? l10n.adminFreeAnyTime : _by!.formattedDate(context)),
              onTap: _pick,
            ),
          ],
        ),
      ],
    );
  }
}

/// The new code, shown this once, with ways to copy it.
class _MadeCodeSheet extends StatelessWidget {
  const _MadeCodeSheet({required this.made});
  final CreatedCompCode made;

  Future<void> _copy(BuildContext context, String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
    } catch (_) {
      return;
    }
    if (context.mounted) showSuccess(context, context.l10n.adminFreeCopied);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final plan = compPlanName(made.planCode);
    final message = l10n.adminFreeMessage(l10n.adminFreeMonthCount(made.months), plan, made.link);
    return FormSheet(
      icon: LucideIcons.gift,
      title: l10n.adminFreeMadeTitle,
      subtitle: l10n.adminFreeMadeBody,
      submitLabel: l10n.adminFreeDone,
      submitKey: const Key('freeMadeDone'),
      showCancel: false,
      onSubmit: () => Navigator.pop(context),
      children: [
        AppCard(
          padding: const EdgeInsets.all(AppSpace.md),
          child: Column(
            children: [
              SelectableText(
                made.code,
                key: const Key('freeMadeCode'),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 1.2),
              ),
              const SizedBox(height: 4),
              SelectableText(
                made.link,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.adminFreePlanMonths(plan, made.months),
                style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: AppSpace.sm,
          runSpacing: AppSpace.xs,
          children: [
            OutlinedButton.icon(
              key: const Key('freeMadeCopyCode'),
              onPressed: () => _copy(context, made.code),
              icon: const Icon(LucideIcons.copy, size: 16),
              label: Text(l10n.adminFreeCopyCode),
            ),
            OutlinedButton.icon(
              key: const Key('freeMadeCopyLink'),
              onPressed: () => _copy(context, made.link),
              icon: const Icon(LucideIcons.link, size: 16),
              label: Text(l10n.adminFreeCopyLink),
            ),
            OutlinedButton.icon(
              key: const Key('freeMadeCopyMessage'),
              onPressed: () => _copy(context, message),
              icon: const Icon(LucideIcons.messageSquare, size: 16),
              label: Text(l10n.adminFreeCopyMessage),
            ),
          ],
        ),
      ],
    );
  }
}

class _GiveSheet extends StatefulWidget {
  const _GiveSheet({required this.settings});
  final CompSettings settings;

  @override
  State<_GiveSheet> createState() => _GiveSheetState();
}

class _GiveSheetState extends State<_GiveSheet> {
  late var _plan = _firstPlan(widget.settings.grantPlans);
  late var _months = widget.settings.maxMonths >= 3 ? 3 : 1;
  final _email = TextEditingController();
  final _note = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _note.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _email.text.trim();
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      showWarning(context, context.l10n.adminFreeInvalid);
      return;
    }
    final note = _note.text.trim();
    Navigator.pop(context, GrantCompRequest(email: email, planCode: _plan, months: _months, note: note.isEmpty ? null : note));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.userPlus,
      title: l10n.adminFreeGive,
      subtitle: l10n.adminFreeGiveHelp,
      submitLabel: l10n.adminFreeGiveButton,
      submitKey: const Key('freeGiveSubmit'),
      onSubmit: _submit,
      children: [
        TextField(
          key: const Key('freeGiveEmail'),
          controller: _email,
          autofocus: true,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: l10n.adminFreeEmail),
        ),
        Row(
          spacing: AppSpace.sm,
          children: [
            Expanded(
              child: _PlanField(
                fieldKey: const Key('freeGivePlan'),
                value: _plan,
                plans: widget.settings.grantPlans,
                onChanged: (v) => setState(() => _plan = v),
              ),
            ),
            Expanded(
              child: _MonthsField(
                fieldKey: const Key('freeGiveMonths'),
                value: _months,
                max: widget.settings.maxMonths,
                onChanged: (v) => setState(() => _months = v),
              ),
            ),
          ],
        ),
        TextField(
          key: const Key('freeGiveNote'),
          controller: _note,
          maxLength: 200,
          decoration: InputDecoration(labelText: l10n.adminFreeNote, hintText: l10n.adminFreeNoteHint),
        ),
      ],
    );
  }
}

class _ExtendSheet extends StatefulWidget {
  const _ExtendSheet({required this.maxMonths});
  final int maxMonths;

  @override
  State<_ExtendSheet> createState() => _ExtendSheetState();
}

class _ExtendSheetState extends State<_ExtendSheet> {
  var _months = 1;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.calendarPlus,
      title: l10n.adminFreeExtend,
      submitLabel: l10n.adminFreeExtendButton,
      submitKey: const Key('freeExtendSubmit'),
      onSubmit: () => Navigator.pop(context, _months),
      children: [
        _MonthsField(
          fieldKey: const Key('freeExtendMonths'),
          value: _months,
          max: widget.maxMonths,
          onChanged: (v) => setState(() => _months = v),
        ),
      ],
    );
  }
}
