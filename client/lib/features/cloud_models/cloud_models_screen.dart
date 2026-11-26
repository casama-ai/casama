import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart' show WorkspaceMember;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/analytics.dart';
import '../../core/cloud_account.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import '../../ui/page.dart';
import 'cloud_buy_sheet.dart';
import 'cloud_models_api.dart';
import 'cloud_models_setup.dart';
import 'cloud_models_state.dart';

/// Living with Casama Cloud models (docs/SELFHOST-CLOUD-MODELS-PLAN.md §4.2, §4.3, §9): the row at
/// the top of the Models screen, the manage screen with usage, the stop card with its one action,
/// the warning banner, the members' one-time notice, the model chip and the turn-off review.

/// The Casama Cloud row at the top of Settings → Models (§4.1 step 1). Nothing at all in a build
/// without the switch, on Casama Cloud, or on a server that doesn't offer it.
class CloudModelsRow extends ConsumerStatefulWidget {
  const CloudModelsRow({super.key});

  @override
  ConsumerState<CloudModelsRow> createState() => _CloudModelsRowState();
}

class _CloudModelsRowState extends ConsumerState<CloudModelsRow> {
  var _seen = false;

  Future<void> _open(CloudModelsState s) async {
    if (s.connected) {
      await Navigator.of(context).push<void>(
        MaterialPageRoute(builder: (_) => const CloudModelsScreen()),
      );
    } else if (s.canManage) {
      await openCloudModelsSetup(context);
    }
    if (mounted) ref.invalidate(cloudModelsStateProvider);
  }

  @override
  Widget build(BuildContext context) {
    if (!cloudModelsShown(ref)) return const SizedBox.shrink();
    final s = ref.watch(cloudModelsStateProvider).value ?? CloudModelsState.off;
    if (!s.available) return const SizedBox.shrink();
    if (!_seen) {
      _seen = true;
      Analytics.log('cloud_models_row_seen', {
        'connected': s.connected,
        'admin': s.canManage,
      });
    }
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final payer = s.payerOrStatus?.name ?? '';
    final stop = cloudStopOf(s);
    final subtitle = s.connected
        ? (s.canManage
              ? l10n.shCloudOnPaidBy(payer)
              : l10n.shCloudMemberState(payer))
        : (s.canManage ? l10n.shCloudPitch : l10n.shCloudMemberOff);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpace.md),
      child: AppCard(
        key: const Key('shCloudRow'),
        onTap: s.connected || s.canManage ? () => _open(s) : null,
        borderColor: s.connected ? scheme.primary.withValues(alpha: 0.4) : null,
        child: Row(
          children: [
            ExcludeSemantics(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: scheme.primaryContainer,
                child: Icon(
                  LucideIcons.cloud,
                  color: scheme.onPrimaryContainer,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: AppSpace.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    l10n.shCloudTitle,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  if (stop != null)
                    Text(
                      cloudStopText(context, stop, s),
                      key: const Key('shCloudRowStop'),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: scheme.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
            if (!s.connected && s.canManage)
              FilledButton(
                key: const Key('shCloudTurnOn'),
                onPressed: () => _open(s),
                child: Text(l10n.shCloudTurnOn),
              )
            else if (s.connected)
              ExcludeSemantics(
                child: Icon(
                  LucideIcons.chevronRight,
                  color: scheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Settings → Models → Casama Cloud, once it is on.
class CloudModelsScreen extends ConsumerWidget {
  const CloudModelsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final async = ref.watch(cloudModelsStateProvider);
    return SubPage(
      title: l10n.shCloudScreenTitle,
      body: AsyncView(
        value: async,
        onRetry: () => ref.invalidate(cloudModelsStateProvider),
        data: (s) =>
            PageColumn(children: cloudModelsManageChildren(context, ref, s)),
      ),
    );
  }
}

/// The manage screen's sections, for [s].
List<Widget> cloudModelsManageChildren(
  BuildContext context,
  WidgetRef ref,
  CloudModelsState s,
) {
  final l10n = context.l10n;
  final stop = cloudStopOf(s);
  final warning = cloudWarningOf(s);
  final reindex = s.memoryReindex;
  return [
    if (stop != null) CloudStopCard(state: s, stop: stop),
    if (warning != null && s.canManage)
      CloudWarningCard(state: s, warning: warning),
    if (reindex != null && reindex.running) ...[
      const SizedBox(height: AppSpace.sm),
      CloudMemoryCatchingUp(reindex: reindex),
    ],
    SectionHeader(title: l10n.shCloudUsageTitle),
    CloudUsageCard(state: s),
    SectionHeader(title: l10n.shCloudPaidBy),
    GroupedCard(
      children: [
        GroupedTile(
          key: const Key('shCloudPayer'),
          icon: LucideIcons.building2,
          title: s.payerOrStatus?.name ?? '',
          subtitle: s.status?.planName,
          showChevron: false,
          trailing: s.canManage
              ? TextButton(
                  key: const Key('shCloudChangePayer'),
                  onPressed: () => _reconnect(context, ref),
                  child: Text(l10n.shCloudChangePayer),
                )
              : null,
        ),
        if (s.canManage)
          GroupedTile(
            key: const Key('shCloudChangeBots'),
            icon: LucideIcons.bot,
            title: l10n.shCloudChangeBots,
            onTap: () => _reconnect(context, ref),
          ),
      ],
    ),
    if (s.canManage) ...[
      SectionHeader(title: l10n.shCloudPolicyTitle),
      CloudPolicyCard(state: s),
      SectionHeader(title: l10n.shCloudFallbackSection),
      AppCard(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.md,
          vertical: AppSpace.xs,
        ),
        child: FormSwitch(
          key: const Key('shCloudFallbackSwitch'),
          title: l10n.shCloudFallback,
          subtitle: l10n.shCloudFallbackHelp,
          value: s.fallback.toOwn,
          onChanged: (v) => v
              ? useOwnKey(context, ref, s)
              : _setFallback(context, ref, s, false),
        ),
      ),
      const SizedBox(height: AppSpace.xl),
      OutlinedButton.icon(
        key: const Key('shCloudTurnOff'),
        style: OutlinedButton.styleFrom(
          foregroundColor: context.colorScheme.error,
        ),
        onPressed: () => showCloudTurnOff(context, ref),
        icon: const Icon(LucideIcons.power, size: 18),
        label: Text(l10n.shCloudTurnOff),
      ),
    ],
    const SizedBox(height: AppSpace.lg),
  ];
}

Future<void> _reconnect(BuildContext context, WidgetRef ref) async {
  await openCloudModelsSetup(context);
  if (context.mounted) ref.invalidate(cloudModelsStateProvider);
}

Future<void> _setFallback(
  BuildContext context,
  WidgetRef ref,
  CloudModelsState s,
  bool toOwn,
) async {
  final ok = await runCloudGuarded(
    context,
    () => ref
        .read(cloudModelsApiProvider)
        .update(
          fallback: CloudFallback(toOwn: toOwn, fromOwn: s.fallback.fromOwn),
        ),
  );
  if (ok != null) {
    Analytics.log(
      toOwn ? 'cloud_models_fallback_used' : 'cloud_models_fallback_off',
    );
    ref.invalidate(cloudModelsStateProvider);
  }
}

/// Runs [action]; a refusal shows its own words (`{ code, message }`), never a code, and never
/// opens Cloud's paywall over a self-hosted server.
Future<T?> runCloudGuarded<T>(
  BuildContext context,
  Future<T> Function() action,
) async {
  try {
    return await action();
  } catch (e, st) {
    if (!context.mounted) return null;
    final err = cloudErrorOf(e);
    if (err != null && err.message.isNotEmpty) {
      showFailure(context, err.message);
    } else {
      showError(context, e, st);
    }
    return null;
  }
}

/// "Use my own key" (§9): answers with the workspace's own key while Cloud can't, and says so on
/// each answer. With no own key, the Models screen to add one.
Future<void> useOwnKey(
  BuildContext context,
  WidgetRef ref,
  CloudModelsState s,
) async {
  final l10n = context.l10n;
  final preview = await runCloudGuarded(
    context,
    () => ref.read(cloudModelsApiProvider).preview(),
  );
  if (preview == null || !context.mounted) return;
  if (!preview.hasOwnKey && !s.hasOwnKey) {
    showMessage(context, l10n.shCloudAddKeyFirst);
    return;
  }
  final ok = await showConfirm(
    context: context,
    title: l10n.shCloudUseOwnKeyTitle,
    message: l10n.shCloudUseOwnKeyBody,
    confirmLabel: l10n.shCloudUseOwnKey,
  );
  if (!ok || !context.mounted) return;
  await _setFallback(context, ref, s, true);
}

/// Runs the action a stop offers.
Future<void> runCloudAction(
  BuildContext context,
  WidgetRef ref,
  CloudAction action,
  CloudModelsState s,
) async {
  final l10n = context.l10n;
  final orgId = s.payerOrStatus?.orgId;
  switch (action) {
    case CloudAction.topUp || CloudAction.seePlans || CloudAction.renew:
      if (orgId == null || orgId.isEmpty) return _reconnect(context, ref);
      final bought = await showCloudBuySheet(
        context,
        ref,
        orgId: orgId,
        kind: action == CloudAction.topUp
            ? CloudBuyKind.credits
            : CloudBuyKind.plan,
      );
      if (bought && context.mounted) ref.invalidate(cloudModelsStateProvider);
    case CloudAction.useOwnKey:
      await useOwnKey(context, ref, s);
    case CloudAction.reconnect:
      await _reconnect(context, ref);
    case CloudAction.askAdmin:
      await showAdaptiveSheet<void>(
        context: context,
        dialogMaxWidth: 460,
        builder: (c) => FormSheet(
          key: const Key('shCloudAskAdminSheet'),
          icon: LucideIcons.shieldUser,
          title: l10n.shCloudAskAdmin,
          subtitle: l10n.shCloudAskAdminBody,
          submitLabel: l10n.close,
          showCancel: false,
          onSubmit: () => Navigator.pop(c),
          children: const [],
        ),
      );
  }
}

/// A §9 stop: what happened, in words, with its one action (and a second where §9 lists one).
class CloudStopCard extends ConsumerWidget {
  const CloudStopCard({super.key, required this.state, required this.stop});
  final CloudModelsState state;
  final CloudStop stop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final admin = state.canManage;
    final action = cloudActionFor(stop, admin: admin);
    final second = cloudSecondActionFor(stop, admin: admin);
    final fallbackOn =
        state.fallback.toOwn && stop != CloudStop.memberNotAllowed;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpace.sm),
      child: AppCard(
        key: Key('shCloudStop-${stop.name}'),
        color: scheme.errorContainer.withValues(alpha: 0.5),
        borderColor: scheme.error.withValues(alpha: 0.4),
        child: Semantics(
          liveRegion: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpace.sm,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpace.sm,
                children: [
                  ExcludeSemantics(
                    child: Icon(
                      LucideIcons.cloudOff,
                      color: scheme.error,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      cloudStopText(context, stop, state),
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              if (fallbackOn)
                Text(
                  l10n.shCloudFallbackActive,
                  style: context.textTheme.bodySmall,
                )
              else if (stop != CloudStop.memberNotAllowed)
                Text(
                  l10n.shCloudRoutinesWait,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              Wrap(
                spacing: AppSpace.sm,
                runSpacing: AppSpace.xs,
                children: [
                  FilledButton(
                    key: Key('shCloudAction-${action.name}'),
                    onPressed: () =>
                        runCloudAction(context, ref, action, state),
                    child: Text(cloudActionLabel(l10n, action)),
                  ),
                  if (second != null &&
                      !(second == CloudAction.useOwnKey && fallbackOn))
                    OutlinedButton(
                      key: Key('shCloudAction-${second.name}'),
                      onPressed: () =>
                          runCloudAction(context, ref, second, state),
                      child: Text(cloudActionLabel(l10n, second)),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 80% of the month's included usage or of today's limit (§4.2), with Top up or Use my own key.
class CloudWarningCard extends ConsumerWidget {
  const CloudWarningCard({
    super.key,
    required this.state,
    required this.warning,
  });
  final CloudModelsState state;
  final CloudWarning warning;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final action = warning == CloudWarning.included
        ? CloudAction.topUp
        : CloudAction.useOwnKey;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpace.sm),
      child: AppCard(
        key: Key('shCloudWarning-${warning.name}'),
        borderColor: context.appColors.warning.withValues(alpha: 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpace.sm,
          children: [
            Text(
              cloudWarningText(l10n, warning),
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Wrap(
              spacing: AppSpace.sm,
              children: [
                FilledButton.tonal(
                  key: Key('shCloudAction-${action.name}'),
                  onPressed: () => runCloudAction(context, ref, action, state),
                  child: Text(cloudActionLabel(l10n, action)),
                ),
                if (action == CloudAction.topUp && !state.fallback.toOwn)
                  TextButton(
                    key: const Key('shCloudAction-useOwnKey'),
                    onPressed: () => runCloudAction(
                      context,
                      ref,
                      CloudAction.useOwnKey,
                      state,
                    ),
                    child: Text(l10n.shCloudUseOwnKey),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// "Memory is catching up" while memory is re-indexed (§7.2).
class CloudMemoryCatchingUp extends StatelessWidget {
  const CloudMemoryCatchingUp({super.key, required this.reindex});
  final MemoryReindex reindex;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      key: const Key('shCloudMemoryCatchingUp'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpace.xs,
        children: [
          Row(
            spacing: AppSpace.sm,
            children: [
              ExcludeSemantics(
                child: Icon(
                  LucideIcons.brain,
                  size: 18,
                  color: context.colorScheme.primary,
                ),
              ),
              Expanded(
                child: Text(
                  l10n.shCloudMemoryCatchingUp(reindex.done, reindex.total),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          LinearProgressIndicator(
            value: reindex.share,
            semanticsLabel: l10n.shCloudMemoryCatchingUp(
              reindex.done,
              reindex.total,
            ),
          ),
          Text(
            l10n.shCloudMemoryCatchingUpHelp,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Included usage left this month, today's spend against the cap, credits, the free usage to try,
/// and the person's own daily limit: at the price Cloud charges (§4.2).
class CloudUsageCard extends StatelessWidget {
  const CloudUsageCard({super.key, required this.state});
  final CloudModelsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final loc = l10n.localeName;
    final scheme = context.colorScheme;
    final st = state.status;
    final me = state.me;
    String usd(double v) => formatUsd(v, loc);
    final lines = <Widget>[];
    if (st != null) {
      final limit = st.includedLimit;
      if (limit != null && limit > 0) {
        final left = (limit - (st.includedUsed ?? 0))
            .clamp(0, limit)
            .toDouble();
        lines
          ..add(
            Text(
              l10n.shCloudIncludedLeft(usd(left)),
              key: const Key('shCloudIncludedLeft'),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          )
          ..add(
            LinearProgressIndicator(
              value: st.includedShare ?? 0,
              semanticsLabel: l10n.shCloudIncludedLeft(usd(left)),
            ),
          );
      }
      final cap = st.todayCap;
      lines.add(
        Text(
          cap == null
              ? l10n.shCloudTodayNoCap(usd(st.todaySpend))
              : l10n.shCloudToday(usd(st.todaySpend), usd(cap)),
          key: const Key('shCloudToday'),
        ),
      );
      if (st.creditsUsd > 0) {
        lines.add(
          Text(
            l10n.shCloudCredits(usd(st.creditsUsd)),
            key: const Key('shCloudCredits'),
          ),
        );
      }
      if (st.onTrial) {
        lines.add(
          Text(
            l10n.shCloudTrialLeft(usd(st.trialRemaining)),
            key: const Key('shCloudTrialLeft'),
          ),
        );
      }
    }
    if (me.limitUsd != null) {
      lines.add(
        Text(
          l10n.shCloudYourToday(usd(me.todayUsd), usd(me.limitUsd!)),
          key: const Key('shCloudYourToday'),
        ),
      );
    }
    lines.add(
      Text(
        l10n.shCloudPriceNote,
        style: context.textTheme.bodySmall?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),
    );
    return AppCard(
      key: const Key('shCloudUsage'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpace.xs,
        children: lines,
      ),
    );
  }
}

/// The admin's choices (§4.3): who may use Casama Cloud on this server, and a daily limit per person.
class CloudPolicyCard extends ConsumerStatefulWidget {
  const CloudPolicyCard({super.key, required this.state});
  final CloudModelsState state;

  @override
  ConsumerState<CloudPolicyCard> createState() => _CloudPolicyCardState();
}

/// Daily limits an admin picks from (US dollars a person a day); null is no limit.
const cloudDailyLimits = <double?>[null, 0.5, 1, 2, 5, 10];

class _CloudPolicyCardState extends ConsumerState<CloudPolicyCard> {
  var _busy = false;

  Future<void> _save(CloudPolicy policy) async {
    setState(() => _busy = true);
    final r = await runCloudGuarded(
      context,
      () => ref.read(cloudModelsApiProvider).update(policy: policy),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    if (r != null) {
      ref.invalidate(cloudModelsStateProvider);
      showSuccess(context, context.l10n.shCloudPolicySaved);
    }
  }

  Future<void> _choosePeople(CloudPolicy policy) async {
    var members = const <WorkspaceMember>[];
    try {
      final org = ref.read(currentOrgProvider);
      if (org != null) {
        members = await ref.read(backendProvider).members(org.id);
      }
    } catch (_) {}
    if (!mounted) return;
    final chosen = await showAdaptiveSheet<List<String>>(
      context: context,
      builder: (_) =>
          _PeoplePicker(members: members, chosen: policy.allowed ?? const []),
    );
    if (chosen != null) {
      await _save(
        CloudPolicy(
          allowed: chosen,
          dailyUsdPerMember: policy.dailyUsdPerMember,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final policy = widget.state.policy;
    // Keeps the workspace loaded for the people picker.
    ref.watch(currentOrgProvider);
    String limitLabel(double? v) => v == null
        ? l10n.shCloudNoLimit
        : l10n.shCloudDailyLimitValue(formatUsd(v, l10n.localeName));
    return GroupedCard(
      children: [
        RadioGroup<bool>(
          groupValue: policy.everyone,
          onChanged: (everyone) {
            if (_busy || everyone == null) return;
            if (everyone) {
              unawaited(
                _save(CloudPolicy(dailyUsdPerMember: policy.dailyUsdPerMember)),
              );
            } else {
              unawaited(_choosePeople(policy));
            }
          },
          child: Column(
            children: [
              RadioListTile<bool>(
                key: const Key('shCloudPolicyEveryone'),
                value: true,
                title: Text(l10n.shCloudPolicyEveryone),
              ),
              RadioListTile<bool>(
                key: const Key('shCloudPolicyChosen'),
                value: false,
                title: Text(l10n.shCloudPolicyChosen),
                subtitle: policy.everyone
                    ? null
                    : Text(
                        l10n.shCloudPolicyChosenCount(
                          policy.allowed?.length ?? 0,
                        ),
                      ),
                secondary: policy.everyone
                    ? null
                    : IconButton(
                        tooltip: l10n.shCloudPolicyChosen,
                        icon: const Icon(LucideIcons.pencil, size: 18),
                        onPressed: _busy ? null : () => _choosePeople(policy),
                      ),
              ),
            ],
          ),
        ),
        GroupedTile(
          key: const Key('shCloudDailyLimit'),
          icon: LucideIcons.gauge,
          title: l10n.shCloudDailyLimit,
          showChevron: false,
          trailing: DropdownButton<double?>(
            key: const Key('shCloudDailyLimitPicker'),
            value: cloudDailyLimits.contains(policy.dailyUsdPerMember)
                ? policy.dailyUsdPerMember
                : null,
            underline: const SizedBox.shrink(),
            items: [
              for (final v in cloudDailyLimits)
                DropdownMenuItem(value: v, child: Text(limitLabel(v))),
            ],
            onChanged: _busy
                ? null
                : (v) => _save(
                    CloudPolicy(allowed: policy.allowed, dailyUsdPerMember: v),
                  ),
          ),
        ),
      ],
    );
  }
}

class _PeoplePicker extends StatefulWidget {
  const _PeoplePicker({required this.members, required this.chosen});
  final List<WorkspaceMember> members;
  final List<String> chosen;

  @override
  State<_PeoplePicker> createState() => _PeoplePickerState();
}

class _PeoplePickerState extends State<_PeoplePicker> {
  late final _chosen = {...widget.chosen};

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      key: const Key('shCloudPeoplePicker'),
      icon: LucideIcons.users,
      title: l10n.shCloudPolicyChosen,
      subtitle: l10n.shCloudPolicyChosenCount(_chosen.length),
      submitLabel: l10n.shCloudContinue,
      onSubmit: () => Navigator.pop(context, _chosen.toList()),
      children: [
        for (final m in widget.members)
          CheckboxListTile(
            key: Key('shCloudPerson-${m.userId}'),
            value: _chosen.contains(m.userId),
            title: Text(
              m.name?.isNotEmpty == true ? m.name! : (m.email ?? m.userId),
            ),
            subtitle: m.name?.isNotEmpty == true && m.email != null
                ? Text(m.email!)
                : null,
            onChanged: (v) => setState(
              () =>
                  v == true ? _chosen.add(m.userId) : _chosen.remove(m.userId),
            ),
          ),
      ],
    );
  }
}

/// Turn off (§4.2): a review of the bots that go back to their keys, then what each went back to.
Future<void> showCloudTurnOff(BuildContext context, WidgetRef ref) async {
  final l10n = context.l10n;
  final preview = await runCloudGuarded(
    context,
    () => ref.read(cloudModelsApiProvider).preview(),
  );
  if (preview == null || !context.mounted) return;
  final onCloud = preview.bots.where((b) => b.onCloud).toList();
  final ok = await showAdaptiveSheet<bool>(
    context: context,
    dialogMaxWidth: 480,
    builder: (c) => FormSheet(
      key: const Key('shCloudOffReview'),
      icon: LucideIcons.power,
      destructive: true,
      title: l10n.shCloudOffTitle,
      subtitle: l10n.shCloudOffBody,
      submitLabel: l10n.shCloudTurnOff,
      submitKey: const Key('shCloudOffConfirm'),
      onSubmit: () => Navigator.pop(c, true),
      children: [
        if (onCloud.isEmpty)
          Text(l10n.shCloudOffBotsNone)
        else
          for (final b in onCloud)
            ListTile(
              key: Key('shCloudOffBot-${b.id}'),
              contentPadding: EdgeInsets.zero,
              leading: const Icon(LucideIcons.bot, size: 20),
              title: Text(b.name),
            ),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  final back = await runCloudGuarded(
    context,
    () => ref.read(cloudModelsApiProvider).off(),
  );
  if (back == null || !context.mounted) return;
  Analytics.log('cloud_models_disabled', const {'reason': 'admin'});
  ref.invalidate(cloudModelsStateProvider);
  ref.invalidate(credentialsProvider);
  ref.invalidate(botsProvider);
  final needsKey = back.any((b) => b.toLabel == null);
  await showAdaptiveSheet<void>(
    context: context,
    dialogMaxWidth: 480,
    builder: (c) => FormSheet(
      key: const Key('shCloudOffDone'),
      icon: LucideIcons.circleCheck,
      iconColor: c.appColors.positive,
      title: l10n.shCloudOffDoneTitle,
      submitLabel: needsKey ? l10n.shCloudAddKey : l10n.close,
      showCancel: needsKey,
      onSubmit: () {
        Navigator.pop(c);
        if (needsKey) {
          try {
            GoRouter.of(context).go('/settings/keys');
          } catch (_) {}
        }
      },
      children: [
        for (final b in back)
          ListTile(
            key: Key('shCloudOffResult-${b.id}'),
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              b.toLabel == null ? LucideIcons.keyRound : LucideIcons.check,
              size: 20,
              color: b.toLabel == null
                  ? c.appColors.warning
                  : c.appColors.positive,
            ),
            title: Text(b.name),
            subtitle: Text(
              b.toLabel == null
                  ? l10n.shCloudOffNeedsKey
                  : l10n.shCloudOffBackTo(b.toLabel!),
            ),
          ),
      ],
    ),
  );
  if (context.mounted && Navigator.of(context).canPop()) {
    Navigator.of(context).maybePop();
  }
}

/// The model field of a bot on Casama Cloud: "Casama Cloud", paid by whom, and nothing to pick
/// (§4.2, §4.3).
class CloudModelChip extends ConsumerWidget {
  const CloudModelChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(cloudModelsStateProvider).value;
    final payer = s?.payerOrStatus?.name;
    return InputDecorator(
      key: const Key('shCloudModelChip'),
      decoration: InputDecoration(
        labelText: l10n.model,
        helperText: payer == null || payer.isEmpty
            ? null
            : l10n.shCloudChipPaidBy(payer),
        prefixIcon: const Icon(LucideIcons.cloud, size: 20),
        suffixIcon: const Icon(LucideIcons.lock),
      ),
      child: Text(
        l10n.shCloudTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

/// Whether this person has seen the one-time "Messages to the model now pass through Casama Cloud"
/// notice on this server (§4.3).
final cloudNoticeSeenProvider = FutureProvider<bool>((ref) async {
  final key = _noticeKey(ref.watch(backendProvider).apiUrl);
  try {
    return (await SharedPreferences.getInstance()).getBool(key) ?? false;
  } catch (_) {
    return true;
  }
});

String _noticeKey(String apiUrl) => 'casama.cloudModels.noticeSeen.$apiUrl';

Future<void> markCloudNoticeSeen(WidgetRef ref) async {
  try {
    await (await SharedPreferences.getInstance()).setBool(
      _noticeKey(ref.read(backendProvider).apiUrl),
      true,
    );
  } catch (_) {}
  ref.invalidate(cloudNoticeSeenProvider);
}

/// What the banner over the app says about Casama Cloud, if anything (§4.2, §4.3, §9): a stop with
/// its action, the 80% warning for admins, or the members' one-time notice. Null when there's
/// nothing to say. [sheetContext] is a context under the app's navigator.
Widget? cloudModelsBanner(
  BuildContext context,
  WidgetRef ref,
  BuildContext Function() sheetContext, {
  bool warningHidden = false,
  VoidCallback? hideWarning,
}) {
  if (!cloudModelsShown(ref)) return null;
  final s = ref.watch(cloudModelsStateProvider).value;
  if (s == null || !s.available || !s.connected) return null;
  final l10n = context.l10n;
  final scheme = context.colorScheme;
  final stop = cloudStopOf(s);
  if (stop != null &&
      !(s.fallback.toOwn && stop != CloudStop.memberNotAllowed)) {
    final action = cloudActionFor(stop, admin: s.canManage);
    return CloudBanner(
      key: Key('shCloudBanner-${stop.name}'),
      icon: LucideIcons.cloudOff,
      color: scheme.errorContainer,
      onColor: scheme.onErrorContainer,
      text: cloudStopText(context, stop, s),
      actions: [
        TextButton(
          key: const Key('shCloudBannerAction'),
          onPressed: () => runCloudAction(sheetContext(), ref, action, s),
          child: Text(cloudActionLabel(l10n, action)),
        ),
      ],
    );
  }
  final warning = cloudWarningOf(s);
  if (warning != null && s.canManage && !warningHidden) {
    final action = warning == CloudWarning.included
        ? CloudAction.topUp
        : CloudAction.useOwnKey;
    return CloudBanner(
      key: Key('shCloudBanner-${warning.name}'),
      icon: LucideIcons.gauge,
      color: context.appColors.warning.withValues(alpha: 0.18),
      onColor: scheme.onSurface,
      text: cloudWarningText(l10n, warning),
      actions: [
        TextButton(
          key: const Key('shCloudBannerAction'),
          onPressed: () => runCloudAction(sheetContext(), ref, action, s),
          child: Text(cloudActionLabel(l10n, action)),
        ),
        if (hideWarning != null)
          IconButton(
            key: const Key('shCloudBannerHide'),
            tooltip: l10n.close,
            onPressed: hideWarning,
            icon: const Icon(LucideIcons.x, size: 18),
          ),
      ],
    );
  }
  final seen = ref.watch(cloudNoticeSeenProvider).value ?? true;
  if (!s.canManage && s.me.allowed && !seen) {
    return CloudBanner(
      key: const Key('shCloudMemberNotice'),
      icon: LucideIcons.cloud,
      color: scheme.secondaryContainer,
      onColor: scheme.onSecondaryContainer,
      text: l10n.shCloudMemberNotice(s.payerOrStatus?.name ?? ''),
      actions: [
        TextButton(
          key: const Key('shCloudMemberNoticeOk'),
          onPressed: () => markCloudNoticeSeen(ref),
          child: Text(l10n.shCloudGotIt),
        ),
      ],
    );
  }
  return null;
}

/// A slim banner over the app, like the license banners.
class CloudBanner extends StatelessWidget {
  const CloudBanner({
    super.key,
    required this.icon,
    required this.color,
    required this.onColor,
    required this.text,
    required this.actions,
  });
  final IconData icon;
  final Color color;
  final Color onColor;
  final String text;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.md,
            AppSpace.xxs,
            AppSpace.xs,
            AppSpace.xxs,
          ),
          child: Row(
            children: [
              ExcludeSemantics(child: Icon(icon, size: 18, color: onColor)),
              const SizedBox(width: AppSpace.sm),
              Expanded(
                child: Semantics(
                  liveRegion: true,
                  child: Text(
                    text,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: onColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ...actions,
            ],
          ),
        ),
      ),
    );
  }
}
