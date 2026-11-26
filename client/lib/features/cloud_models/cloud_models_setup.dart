import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/analytics.dart';
import '../../core/billing.dart';
import '../../core/cloud_account.dart';
import '../../core/link_browser.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import '../../ui/page.dart';
import '../selfhost/server_license.dart' show cloudSession;
import 'cloud_models_api.dart';
import 'cloud_models_state.dart';
import 'cloud_purchase.dart';

/// Where the person reads what a server sends to Casama Cloud.
const whatGoesHomeUrl = 'https://docs.casama.ai/self-hosting/what-goes-home';

/// Opens the turn-on flow (§4.1). Resolves true when Casama Cloud was turned on.
Future<bool> openCloudModelsSetup(BuildContext context) async {
  final on = await Navigator.of(context).push<bool>(
    MaterialPageRoute(builder: (_) => const CloudModelsSetupScreen()),
  );
  return on == true;
}

enum _Step { signingIn, payer, plan, connecting, review, applying, done }

/// Which bots switch on the review screen.
enum BotChoice { all, noKey, pick }

/// Turn on Casama Cloud models (docs/SELFHOST-CLOUD-MODELS-PLAN.md §4.1): sign in to Cloud, pick
/// who pays, a plan when needed, connect this server, then the review screen, which is the only
/// place anything changes, and a done screen with a first reply to try.
class CloudModelsSetupScreen extends ConsumerStatefulWidget {
  const CloudModelsSetupScreen({super.key});

  @override
  ConsumerState<CloudModelsSetupScreen> createState() =>
      _CloudModelsSetupScreenState();
}

class _CloudModelsSetupScreenState
    extends ConsumerState<CloudModelsSetupScreen> {
  var _step = _Step.signingIn;
  var _busy = false;
  String? _email;
  List<CloudWorkspace> _workspaces = const [];
  CloudWorkspace? _payer;
  CloudBilling? _billing;
  CloudCatalog? _catalog;
  List<PurchaseChannel> _channels = const [PurchaseChannel.web];

  /// The plan step says why it is shown again (the free usage to try is used up).
  String? _planNote;
  var _waitingOnWeb = false;
  var _webTimedOut = false;
  var _trial = false;
  CloudModelsState? _connected;
  CloudPreview? _preview;
  var _choice = BotChoice.noKey;
  final _picked = <String>{};
  var _workspaceDefault = true;
  var _embedding = false;
  var _fallback = false;
  int _switched = 0;
  PreviewBot? _hiBot;
  final _gift = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _signIn());
  }

  @override
  void dispose() {
    _gift.dispose();
    super.dispose();
  }

  CloudApi get _cloud => ref.read(cloudApiProvider);

  /// Runs [action]; a refusal shows its words, never a code. A Cloud session that ended sends the
  /// person back to sign in.
  Future<T?> _guard<T>(Future<T> Function() action) async {
    setState(() => _busy = true);
    try {
      return await action();
    } catch (e, st) {
      if (!mounted) return null;
      final err = cloudErrorOf(e);
      if (err != null && (err.status == 401 || err.code == 'unauthorized')) {
        await ref.read(cloudAccountProvider.notifier).signOut();
        if (mounted) showFailure(context, context.l10n.shCloudSignInAgain);
        if (mounted) unawaited(_signIn());
      } else if (err != null && err.message.isNotEmpty) {
        showFailure(context, err.message);
      } else {
        showError(context, e, st);
      }
      return null;
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _signIn() async {
    setState(() => _step = _Step.signingIn);
    final session = await cloudSession(
      context,
      ref,
      body: context.l10n.shCloudSignInBody,
    );
    if (!mounted) return;
    if (session == null) {
      Navigator.of(context).maybePop(false);
      return;
    }
    Analytics.log('cloud_models_signin');
    _email = session.email;
    await _loadWorkspaces();
  }

  Future<void> _otherAccount() async {
    await ref.read(cloudAccountProvider.notifier).signOut();
    if (mounted) await _signIn();
  }

  Future<void> _loadWorkspaces() async {
    final all = await _guard(_cloud.workspaces);
    if (!mounted || all == null) return;
    final payable = all.where((w) => w.canPay).toList();
    // The one already paying for this server, when reconnecting.
    final current = ref
        .read(cloudModelsStateProvider)
        .value
        ?.payerOrStatus
        ?.orgId;
    setState(() {
      _workspaces = payable;
      _payer =
          payable.where((w) => w.id == current).firstOrNull ??
          (payable.length == 1 ? payable.first : _payer);
      _step = _Step.payer;
    });
  }

  Future<void> _createWorkspace() async {
    final name = _defaultWorkspaceName();
    final w = await _guard(() => _cloud.createWorkspace(name));
    if (!mounted || w == null) return;
    setState(() {
      _workspaces = [..._workspaces, w];
      _payer = w;
    });
  }

  String _defaultWorkspaceName() {
    final l10n = context.l10n;
    final local = (_email ?? '').split('@').first;
    final who = local.isEmpty
        ? 'Casama'
        : '${local[0].toUpperCase()}${local.substring(1)}';
    return l10n.shCloudWorkspaceNamed(who);
  }

  /// Step 4: skipped when the workspace's plan already covers Cloud models.
  Future<void> _toPlan() async {
    final payer = _payer;
    if (payer == null) return;
    final purchaser = ref.read(cloudPurchaserProvider);
    final loaded = await _guard(() async {
      final billing = await _cloud.billing(payer.id);
      final catalog = billing.covers ? null : await _cloud.plans();
      final channels = await purchaser.channels();
      return (billing, catalog, channels);
    });
    if (!mounted || loaded == null) return;
    final (billing, catalog, channels) = loaded;
    setState(() {
      _billing = billing;
      _catalog = catalog;
      _channels = channels;
    });
    if (billing.covers) {
      _trial = false;
      await _connect();
    } else {
      setState(() => _step = _Step.plan);
    }
  }

  Future<void> _tryFirst() async {
    _trial = true;
    Analytics.log('cloud_models_trial_started');
    await _connect();
  }

  /// A plan or pack landed: carry on.
  Future<void> _afterPurchase(CloudBuyResult r) async {
    if (!mounted) return;
    final l10n = context.l10n;
    switch (r) {
      case CloudBuyResult.bought:
        final billing = await _guard(() => _cloud.billing(_payer!.id));
        if (!mounted) return;
        setState(() {
          _billing = billing ?? _billing;
          _waitingOnWeb = false;
          _trial = false;
        });
        await _connect();
      case CloudBuyResult.pending:
        showMessage(context, l10n.shCloudPurchasePending);
      case CloudBuyResult.failed:
        showFailure(context, l10n.shCloudPurchaseFailed);
      case CloudBuyResult.cancelled:
        break;
      case CloudBuyResult.timedOut:
        setState(() => _webTimedOut = true);
    }
  }

  Future<void> _buy(CloudPlan plan) async {
    final payer = _payer!;
    final purchaser = ref.read(cloudPurchaserProvider);
    final store = ref.read(storeProvider);
    final way = cloudBuyWay(
      channels: _channels,
      storeSource: store.source,
      storeProductIds: plan.storeProductIds,
      web: plan.web,
    );
    switch (way) {
      case CloudBuyWay.store:
        final r = await _guard(
          () => purchaser.buyInStore(
            orgId: payer.id,
            productId: plan.storeProductIds[store.source]!,
          ),
        );
        if (r != null) await _afterPurchase(r);
      case CloudBuyWay.web:
        setState(() => _webTimedOut = false);
        final r = await _guard(
          () => purchaser.buyOnWeb(
            orgId: payer.id,
            planCode: plan.code,
            arrived: (b) => b.covers,
            opened: () {
              if (mounted) setState(() => _waitingOnWeb = true);
            },
          ),
        );
        if (r != null) await _afterPurchase(r);
      case CloudBuyWay.none:
        showMessage(context, context.l10n.shCloudNoWayToBuy);
    }
  }

  Future<void> _checkAgain() async {
    setState(() => _webTimedOut = false);
    final billing = await _guard(() => _cloud.billing(_payer!.id));
    if (!mounted || billing == null) return;
    if (billing.covers) {
      await _afterPurchase(CloudBuyResult.bought);
    } else {
      setState(() => _webTimedOut = true);
    }
  }

  Future<void> _restore() async {
    final ok = await _guard(
      () => ref.read(cloudPurchaserProvider).restore(_payer!.id),
    );
    if (ok == true) await _afterPurchase(CloudBuyResult.bought);
  }

  Future<void> _redeem() async {
    final code = _gift.text.trim();
    if (code.isEmpty) return;
    final ok = await _guard(() async {
      await _cloud.redeemGiftCode(_payer!.id, code);
      return true;
    });
    if (ok == true) await _afterPurchase(CloudBuyResult.bought);
  }

  /// Steps 5 and 6 of §13: a one-time code from Cloud, handed to this server, which redeems it.
  /// No Cloud session ever reaches the server. Nothing about the bots changes yet.
  Future<void> _connect() async {
    final payer = _payer!;
    setState(() => _step = _Step.connecting);
    final backend = ref.read(backendProvider);
    final state = await _guard(() async {
      final status = await backend.selfhost.status();
      final code = await _cloud.connectCode(
        orgId: payer.id,
        instanceId: status.instanceId ?? '',
        instanceName: ref.read(currentOrgProvider)?.name,
      );
      return ref.read(cloudModelsApiProvider).connect(code.code);
    });
    if (!mounted) return;
    if (state == null) {
      setState(
        () => _step = _billing?.covers == true ? _Step.payer : _Step.plan,
      );
      return;
    }
    // Tried the free usage, but it's used up on this account: plans it is.
    if (state.status != null &&
        !state.status!.modelsAllowed &&
        !(_billing?.covers ?? false)) {
      final catalog = _catalog ?? await _guard(_cloud.plans);
      if (!mounted) return;
      setState(() {
        _catalog = catalog;
        _connected = state;
        _planNote = context.l10n.shCloudTrialUsed;
        _trial = false;
        _step = _Step.plan;
      });
      return;
    }
    final preview = await _guard(ref.read(cloudModelsApiProvider).preview);
    if (!mounted) return;
    if (preview == null) {
      setState(() => _step = _Step.payer);
      return;
    }
    setState(() {
      _connected = state;
      _trial = _trial || (state.status?.onTrial ?? false);
      _preview = preview;
      _picked
        ..clear()
        ..addAll(preview.bots.where((b) => b.suggested).map((b) => b.id));
      // With no own keys at all, every bot switches; otherwise only those without a working key.
      _choice = preview.hasOwnKey ? BotChoice.noKey : BotChoice.all;
      _embedding = !preview.ownEmbedding;
      _step = _Step.review;
    });
  }

  List<String> _botsToSwitch() {
    final bots = _preview?.bots ?? const <PreviewBot>[];
    return switch (_choice) {
      BotChoice.all => [for (final b in bots) b.id],
      BotChoice.noKey => [
        for (final b in bots)
          if (!b.fromWorking || b.onCloud) b.id,
      ],
      BotChoice.pick => [
        for (final b in bots)
          if (_picked.contains(b.id)) b.id,
      ],
    };
  }

  Future<void> _apply() async {
    final bots = _botsToSwitch();
    final state = _connected;
    setState(() => _step = _Step.applying);
    final applied = await _guard(
      () => ref
          .read(cloudModelsApiProvider)
          .apply(
            CloudApply(
              bots: bots,
              workspaceDefault: _workspaceDefault,
              embedding: _embedding,
              fallback: CloudFallback(
                toOwn: _fallback && (_preview?.hasOwnKey ?? false),
                fromOwn: state?.fallback.fromOwn ?? false,
              ),
              policy: state?.policy ?? const CloudPolicy(),
            ),
          ),
    );
    if (!mounted) return;
    if (applied == null) {
      setState(() => _step = _Step.review);
      return;
    }
    Analytics.log('cloud_models_enabled', {
      'bots': bots.length,
      'trial': _trial,
    });
    ref.invalidate(cloudModelsStateProvider);
    ref.invalidate(credentialsProvider);
    ref.invalidate(botsProvider);
    final previewBots = _preview?.bots ?? const <PreviewBot>[];
    setState(() {
      _switched = bots.length;
      _hiBot = previewBots.where((b) => bots.contains(b.id)).firstOrNull;
      _step = _Step.done;
    });
  }

  void _sayHi(PreviewBot bot) {
    Navigator.of(context).pop(true);
    try {
      GoRouter.of(context).go('/bots/${bot.id}/chat');
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final body = switch (_step) {
      _Step.signingIn || _Step.connecting || _Step.applying => [
        _Working(
          text: _step == _Step.connecting
              ? l10n.shCloudConnecting
              : l10n.shCloudLoading,
        ),
      ],
      _Step.payer => _payerStep(context),
      _Step.plan => _planStep(context),
      _Step.review => _reviewStep(context),
      _Step.done => _doneStep(context),
    };
    return SubPage(title: l10n.shCloudScreenTitle, children: body);
  }

  Widget _signedInLine(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Expanded(
          child: FormNote(
            l10n.shCloudSignedInAs(_email ?? ''),
            icon: LucideIcons.cloud,
          ),
        ),
        TextButton(
          key: const Key('shCloudOtherAccount'),
          onPressed: _busy ? null : _otherAccount,
          child: Text(l10n.shCloudOtherAccount),
        ),
      ],
    );
  }

  List<Widget> _payerStep(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    return [
      _Heading(
        icon: LucideIcons.building2,
        title: l10n.shCloudPayerTitle,
        body: l10n.shCloudPayerBody,
      ),
      _signedInLine(context),
      const SizedBox(height: AppSpace.sm),
      if (_workspaces.isEmpty)
        AppCard(
          key: const Key('shCloudNoWorkspace'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpace.sm,
            children: [
              Text(l10n.shCloudPayerNone, style: context.textTheme.bodyMedium),
              FilledButton.icon(
                key: const Key('shCloudCreateWorkspace'),
                onPressed: _busy ? null : _createWorkspace,
                icon: const Icon(LucideIcons.plus, size: 18),
                label: Text(l10n.shCloudCreateWorkspace),
              ),
            ],
          ),
        )
      else
        RadioGroup<String>(
          groupValue: _payer?.id,
          onChanged: (id) => setState(
            () => _payer = _workspaces.firstWhere((w) => w.id == id),
          ),
          child: GroupedCard(
            children: [
              for (final w in _workspaces)
                RadioListTile<String>(
                  key: Key('shCloudPayer-${w.id}'),
                  value: w.id,
                  title: Text(
                    w.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    w.planCode == 'free'
                        ? l10n.shCloudNoPlan
                        : _planName(w.planCode),
                    style: TextStyle(color: scheme.onSurfaceVariant),
                  ),
                ),
            ],
          ),
        ),
      const SizedBox(height: AppSpace.lg),
      FilledButton(
        key: const Key('shCloudPayerContinue'),
        onPressed: _busy || _payer == null ? null : _toPlan,
        child: Text(l10n.shCloudContinue),
      ),
    ];
  }

  List<Widget> _planStep(BuildContext context) {
    final l10n = context.l10n;
    final catalog = _catalog ?? const CloudCatalog();
    final store = ref.read(storeProvider);
    final purchaser = ref.read(cloudPurchaserProvider);
    final storeWay =
        _channels.any((c) => c != PurchaseChannel.web) && store.source != null;
    final buyable = [
      for (final p in catalog.plans)
        if (cloudBuyWay(
              channels: _channels,
              storeSource: store.source,
              storeProductIds: p.storeProductIds,
              web: p.web,
            ) !=
            CloudBuyWay.none)
          p,
    ];
    final trialOffered =
        _planNote == null && !(_connected?.status?.paid ?? false);
    return [
      _Heading(
        icon: LucideIcons.gem,
        title: l10n.shCloudPlanTitle,
        body: l10n.shCloudPlanBody,
      ),
      if (_planNote case final note?) ...[
        AppCard(
          key: const Key('shCloudTrialUsed'),
          borderColor: context.appColors.warning.withValues(alpha: 0.5),
          child: Text(note),
        ),
        const SizedBox(height: AppSpace.sm),
      ],
      if (_waitingOnWeb)
        AppCard(
          key: const Key('shCloudWaitingOnWeb'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpace.sm,
            children: [
              if (!_webTimedOut) ...[
                const LinearProgressIndicator(),
                Text(l10n.shCloudWaitingForPlan),
              ] else ...[
                Text(l10n.shCloudWaitingTimedOut),
                OutlinedButton(
                  key: const Key('shCloudCheckAgain'),
                  onPressed: _busy ? null : _checkAgain,
                  child: Text(l10n.shCloudCheckAgain),
                ),
              ],
            ],
          ),
        )
      else if (buyable.isEmpty)
        AppCard(
          key: const Key('shCloudNoWayToBuy'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpace.sm,
            children: [
              Text(l10n.shCloudNoWayToBuy),
              OutlinedButton(
                key: const Key('shCloudCheckAgain'),
                onPressed: _busy ? null : _checkAgain,
                child: Text(l10n.shCloudCheckAgain),
              ),
            ],
          ),
        )
      else
        GroupedCard(
          children: [
            for (final p in buyable)
              GroupedTile(
                key: Key('shCloudPlan-${p.code}-${p.interval}'),
                icon: p.popular ? LucideIcons.star : LucideIcons.gem,
                iconColor: p.popular ? context.appColors.warning : null,
                title: p.name,
                subtitle: _intervalLabel(context, p.interval),
                trailing: p.priceLabel == null
                    ? null
                    : Text(
                        p.priceLabel!,
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFeatures: AppText.tabular,
                        ),
                      ),
                onTap: _busy ? null : () => _buy(p),
              ),
          ],
        ),
      if (storeWay && !_waitingOnWeb)
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            key: const Key('shCloudRestore'),
            onPressed: _busy ? null : _restore,
            child: Text(l10n.restorePurchases),
          ),
        ),
      // Gift codes only where store rules allow them (giftCodesAllowed).
      if (purchaser.giftCodes && !_waitingOnWeb) ...[
        const SizedBox(height: AppSpace.xs),
        Row(
          spacing: AppSpace.sm,
          children: [
            Expanded(
              child: TextField(
                key: const Key('shCloudGiftCode'),
                controller: _gift,
                decoration: InputDecoration(
                  labelText: l10n.shCloudGiftCodeLabel,
                  hintText: l10n.shCloudGiftCode,
                ),
                onChanged: (_) => setState(() {}),
              ),
            ),
            OutlinedButton(
              key: const Key('shCloudRedeem'),
              onPressed: _busy || _gift.text.trim().isEmpty ? null : _redeem,
              child: Text(l10n.shCloudRedeem),
            ),
          ],
        ),
      ],
      // The free usage to try: never called a free trial, and never on the store's paywall (§7.4.1).
      if (trialOffered && !_waitingOnWeb) ...[
        const SizedBox(height: AppSpace.lg),
        AppCard(
          key: const Key('shCloudTryFirstCard'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpace.sm,
            children: [
              Text(
                l10n.shCloudTryFirstBody(
                  formatUsd(cloudTrialUsd, l10n.localeName),
                ),
                style: context.textTheme.bodyMedium,
              ),
              OutlinedButton.icon(
                key: const Key('shCloudTryFirst'),
                onPressed: _busy ? null : _tryFirst,
                icon: const Icon(LucideIcons.sparkles, size: 18),
                label: Text(l10n.shCloudTryFirst),
              ),
            ],
          ),
        ),
      ],
    ];
  }

  List<Widget> _reviewStep(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final preview = _preview ?? const CloudPreview();
    final status = _connected?.status;
    final payerName = _payer?.name ?? _connected?.payerOrStatus?.name ?? '';
    final planName = status?.planName.isNotEmpty == true
        ? status!.planName
        : (_billing?.planName ?? '');
    final toModel = status?.jobs['chat'];
    final toLabel = l10n.shCloudToCloud(
      toModel == null ? l10n.shCloudCloudModel : _modelName(toModel),
    );
    final switching = _botsToSwitch().toSet();
    final seatsPlan = status?.seatsPlan;
    final seatsUsed = status?.seatsUsed;
    final canApply = switching.isNotEmpty || _workspaceDefault || _embedding;
    return [
      _Heading(icon: LucideIcons.listChecks, title: l10n.shCloudReviewTitle),
      // Who pays.
      SectionHeader(title: l10n.shCloudReviewPays),
      AppCard(
        key: const Key('shCloudReviewPays'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpace.xs,
          children: [
            Text(
              _trial
                  ? l10n.shCloudReviewTrialLine(payerName, _email ?? '')
                  : l10n.shCloudReviewPaysLine(
                      planName,
                      payerName,
                      _email ?? '',
                    ),
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (!_trial && (_billing?.covers ?? false) && planName.isNotEmpty)
              Text(
                l10n.shCloudCovered(planName),
                style: TextStyle(color: scheme.onSurfaceVariant),
              ),
            if (seatsPlan != null && seatsUsed != null && seatsUsed > seatsPlan)
              Text(
                l10n.shCloudSeatsNote(seatsUsed, planName, seatsPlan),
                key: const Key('shCloudSeatsNote'),
                style: TextStyle(color: scheme.onSurfaceVariant),
              ),
          ],
        ),
      ),
      // Which bots switch, each from → to.
      SectionHeader(title: l10n.shCloudReviewBots),
      if (preview.bots.isEmpty)
        AppCard(child: Text(l10n.shCloudReviewNoBots))
      else ...[
        RadioGroup<BotChoice>(
          groupValue: _choice,
          onChanged: (c) => setState(() => _choice = c ?? _choice),
          child: GroupedCard(
            children: [
              if (preview.hasOwnKey)
                RadioListTile(
                  key: const Key('shCloudChoiceNoKey'),
                  value: BotChoice.noKey,
                  title: Text(l10n.shCloudReviewNoKey),
                ),
              RadioListTile(
                key: const Key('shCloudChoiceAll'),
                value: BotChoice.all,
                title: Text(l10n.shCloudReviewAll),
              ),
              RadioListTile(
                key: const Key('shCloudChoicePick'),
                value: BotChoice.pick,
                title: Text(l10n.shCloudReviewPick),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpace.sm),
        GroupedCard(
          children: [
            for (final b in preview.bots)
              CheckboxListTile(
                key: Key('shCloudBot-${b.id}'),
                value: switching.contains(b.id),
                onChanged: _choice != BotChoice.pick
                    ? null
                    : (v) => setState(() {
                        if (v == true) {
                          _picked.add(b.id);
                        } else {
                          _picked.remove(b.id);
                        }
                      }),
                title: Text(
                  b.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.shCloudFromTo(_fromLabel(context, b), toLabel)),
                    if (b.stepDown && switching.contains(b.id))
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          l10n.shCloudStepDown(_fromLabel(context, b)),
                          key: Key('shCloudStepDown-${b.id}'),
                          style: TextStyle(
                            color: context.appColors.warning,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ],
      const SizedBox(height: AppSpace.xs),
      FormSwitch(
        title: l10n.shCloudReviewDefault,
        value: _workspaceDefault,
        onChanged: (v) => setState(() => _workspaceDefault = v),
      ),
      // Memory, images and voice (§7.3).
      SectionHeader(title: l10n.shCloudReviewJobs),
      GroupedCard(
        children: [
          _JobRow(
            key: const Key('shCloudJobMemory'),
            icon: LucideIcons.brain,
            title: l10n.shCloudJobMemory,
            cloud: _embedding,
          ),
          _JobRow(
            key: const Key('shCloudJobImages'),
            icon: LucideIcons.image,
            title: l10n.shCloudJobImages,
            cloud: !preview.ownImage,
          ),
          _JobRow(
            key: const Key('shCloudJobTts'),
            icon: LucideIcons.volume2,
            title: l10n.shCloudJobTts,
            cloud: !preview.ownTts,
          ),
          _JobRow(
            key: const Key('shCloudJobStt'),
            icon: LucideIcons.mic,
            title: l10n.shCloudJobStt,
            cloud: !preview.ownStt,
          ),
        ],
      ),
      if (preview.ownEmbedding) ...[
        const SizedBox(height: AppSpace.xs),
        FormSwitch(
          key: const Key('shCloudMemoryOptIn'),
          title: l10n.shCloudJobMemoryOptIn,
          subtitle: l10n.shCloudJobMemoryOptInHelp,
          value: _embedding,
          onChanged: (v) => setState(() => _embedding = v),
        ),
      ],
      const SizedBox(height: AppSpace.xs),
      FormNote(l10n.shCloudJobLiveNote, icon: LucideIcons.phone),
      // What goes to Cloud.
      SectionHeader(title: l10n.shCloudWhatGoes),
      AppCard(
        key: const Key('shCloudPrivacy'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpace.xs,
          children: [
            Text(l10n.shCloudReviewPrivacy),
            InkWell(
              onTap: () => openWebLink(Uri.parse(whatGoesHomeUrl)),
              child: Text(
                l10n.shCloudWhatGoesLink,
                style: TextStyle(
                  color: scheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      // Fallback: only when an own key exists; off by default.
      if (preview.hasOwnKey) ...[
        const SizedBox(height: AppSpace.sm),
        FormSwitch(
          key: const Key('shCloudFallback'),
          title: l10n.shCloudFallback,
          subtitle: l10n.shCloudFallbackHelp,
          value: _fallback,
          onChanged: (v) => setState(() => _fallback = v),
        ),
      ],
      const SizedBox(height: AppSpace.lg),
      if (!canApply) FormNote(l10n.shCloudPickOne),
      FilledButton.icon(
        key: const Key('shCloudApply'),
        onPressed: _busy || !canApply ? null : _apply,
        icon: const Icon(LucideIcons.cloud, size: 18),
        label: Text(l10n.shCloudApply),
      ),
    ];
  }

  List<Widget> _doneStep(BuildContext context) {
    final l10n = context.l10n;
    final bot = _hiBot;
    return [
      const SizedBox(height: AppSpace.lg),
      Icon(
        LucideIcons.circleCheck,
        size: 48,
        color: context.appColors.positive,
        semanticLabel: l10n.shCloudDoneTitle,
      ),
      const SizedBox(height: AppSpace.md),
      Text(
        l10n.shCloudDoneTitle,
        key: const Key('shCloudDoneTitle'),
        textAlign: TextAlign.center,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: AppSpace.sm),
      Text(
        l10n.shCloudDoneBody(_switched),
        textAlign: TextAlign.center,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
      const SizedBox(height: AppSpace.xl),
      if (bot != null)
        FilledButton.icon(
          key: const Key('shCloudSayHi'),
          onPressed: () => _sayHi(bot),
          icon: const Icon(LucideIcons.messageCircle, size: 18),
          label: Text(l10n.shCloudSayHi(bot.name)),
        ),
      const SizedBox(height: AppSpace.sm),
      OutlinedButton(
        key: const Key('shCloudDone'),
        onPressed: () => Navigator.of(context).pop(true),
        child: Text(l10n.shCloudDone),
      ),
    ];
  }

  String _planName(String code) =>
      code.isEmpty ? code : '${code[0].toUpperCase()}${code.substring(1)}';
}

/// "Claude Opus 5.5 (your Anthropic key)", or "No working key".
String _fromLabel(BuildContext context, PreviewBot b) {
  final label = b.fromLabel;
  if (label != null && label.isNotEmpty) return label;
  final model = b.fromModel;
  if (model != null && model.isNotEmpty && b.fromWorking) {
    return _modelName(model);
  }
  return context.l10n.shCloudNoKeyYet;
}

/// A model id as people read it: the part after the provider, as given.
String _modelName(String id) =>
    id.contains('/') ? id.substring(id.lastIndexOf('/') + 1) : id;

String _intervalLabel(BuildContext context, String interval) {
  final l10n = context.l10n;
  return switch (interval) {
    'week' => l10n.shCloudIntervalWeek,
    'year' => l10n.shCloudIntervalYear,
    _ => l10n.shCloudIntervalMonth,
  };
}

class _Heading extends StatelessWidget {
  const _Heading({required this.icon, required this.title, this.body});
  final IconData icon;
  final String title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpace.sm, bottom: AppSpace.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpace.xs,
        children: [
          Row(
            spacing: AppSpace.sm,
            children: [
              ExcludeSemantics(
                child: Icon(icon, size: 22, color: context.colorScheme.primary),
              ),
              Expanded(
                child: Semantics(
                  header: true,
                  child: Text(
                    title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (body != null)
            Text(
              body!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}

class _Working extends StatelessWidget {
  const _Working({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpace.xxl),
      child: Semantics(
        liveRegion: true,
        label: text,
        child: Column(
          spacing: AppSpace.md,
          children: [
            const CircularProgressIndicator(),
            ExcludeSemantics(child: Text(text, textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}

class _JobRow extends StatelessWidget {
  const _JobRow({
    super.key,
    required this.icon,
    required this.title,
    required this.cloud,
  });
  final IconData icon;
  final String title;
  final bool cloud;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GroupedTile(
      icon: icon,
      title: title,
      showChevron: false,
      trailing: Text(
        cloud ? l10n.shCloudTitle : l10n.shCloudJobOwnKey,
        style: context.textTheme.bodyMedium?.copyWith(
          color: cloud
              ? context.colorScheme.primary
              : context.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
