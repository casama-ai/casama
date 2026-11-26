import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/billing.dart';
import '../../core/cloud_account.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../selfhost/server_license.dart' show cloudSession;
import 'cloud_purchase.dart';

/// What the buy sheet sells: a plan (See plans, Renew) or credits (Top up).
enum CloudBuyKind { plan, credits }

/// The money buttons of §9 (Top up, See plans, Renew) for the Cloud workspace [orgId], bought the
/// right way for this app (§7.4). Resolves true when the purchase landed on Cloud.
Future<bool> showCloudBuySheet(
  BuildContext context,
  WidgetRef ref, {
  required String orgId,
  required CloudBuyKind kind,
}) async {
  final session = await cloudSession(
    context,
    ref,
    body: context.l10n.shCloudSignInBody,
  );
  if (session == null || !context.mounted) return false;
  final bought = await showAdaptiveSheet<bool>(
    context: context,
    builder: (_) => CloudBuySheet(orgId: orgId, kind: kind),
  );
  return bought == true;
}

class CloudBuySheet extends ConsumerStatefulWidget {
  const CloudBuySheet({super.key, required this.orgId, required this.kind});
  final String orgId;
  final CloudBuyKind kind;

  @override
  ConsumerState<CloudBuySheet> createState() => _CloudBuySheetState();
}

class _CloudBuySheetState extends ConsumerState<CloudBuySheet> {
  CloudCatalog? _catalog;
  CloudBilling? _before;
  List<PurchaseChannel> _channels = const [PurchaseChannel.web];
  var _busy = true;
  var _waiting = false;
  var _timedOut = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final api = ref.read(cloudApiProvider);
    final purchaser = ref.read(cloudPurchaserProvider);
    try {
      final r = await Future.wait([
        api.plans(),
        api.billing(widget.orgId),
        purchaser.channels(),
      ]);
      if (!mounted) return;
      setState(() {
        _catalog = r[0] as CloudCatalog;
        _before = r[1] as CloudBilling;
        _channels = r[2] as List<PurchaseChannel>;
        _busy = false;
      });
    } catch (e, st) {
      if (!mounted) return;
      final err = cloudErrorOf(e);
      if (err != null && err.message.isNotEmpty) {
        showFailure(context, err.message);
      } else {
        showError(context, e, st);
      }
      Navigator.of(context).maybePop(false);
    }
  }

  bool _arrived(CloudBilling b) => switch (widget.kind) {
    CloudBuyKind.plan => b.covers && b.paid,
    CloudBuyKind.credits => b.creditsUsd > (_before?.creditsUsd ?? 0),
  };

  Future<void> _result(CloudBuyResult r) async {
    if (!mounted) return;
    final l10n = context.l10n;
    switch (r) {
      case CloudBuyResult.bought:
        Navigator.of(context).pop(true);
      case CloudBuyResult.pending:
        showMessage(context, l10n.shCloudPurchasePending);
      case CloudBuyResult.failed:
        showFailure(context, l10n.shCloudPurchaseFailed);
      case CloudBuyResult.cancelled:
        break;
      case CloudBuyResult.timedOut:
        setState(() => _timedOut = true);
    }
  }

  Future<void> _buy({
    required Map<String, String> storeProductIds,
    required bool web,
    String? planCode,
    String? packCode,
  }) async {
    final store = ref.read(storeProvider);
    final purchaser = ref.read(cloudPurchaserProvider);
    final way = cloudBuyWay(
      channels: _channels,
      storeSource: store.source,
      storeProductIds: storeProductIds,
      web: web,
    );
    setState(() {
      _busy = true;
      _timedOut = false;
    });
    try {
      final r = switch (way) {
        CloudBuyWay.store => await purchaser.buyInStore(
          orgId: widget.orgId,
          productId: storeProductIds[store.source]!,
          consumable: packCode != null,
        ),
        CloudBuyWay.web => await purchaser.buyOnWeb(
          orgId: widget.orgId,
          planCode: planCode,
          packCode: packCode,
          arrived: _arrived,
          opened: () {
            if (mounted) setState(() => _waiting = true);
          },
        ),
        CloudBuyWay.none => CloudBuyResult.failed,
      };
      await _result(r);
    } catch (e, st) {
      if (mounted) showError(context, e, st);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _checkAgain() async {
    setState(() => _busy = true);
    try {
      final b = await ref.read(cloudApiProvider).billing(widget.orgId);
      if (!mounted) return;
      if (_arrived(b)) {
        Navigator.of(context).pop(true);
      } else {
        setState(() => _timedOut = true);
      }
    } catch (e, st) {
      if (mounted) showError(context, e, st);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final store = ref.read(storeProvider);
    final catalog = _catalog;
    final title = widget.kind == CloudBuyKind.plan
        ? l10n.shCloudPlanTitle
        : l10n.shCloudTopUp;
    final rows = <Widget>[
      if (catalog != null && widget.kind == CloudBuyKind.plan)
        for (final p in catalog.plans)
          if (cloudBuyWay(
                channels: _channels,
                storeSource: store.source,
                storeProductIds: p.storeProductIds,
                web: p.web,
              ) !=
              CloudBuyWay.none)
            GroupedTile(
              key: Key('shCloudBuyPlan-${p.code}-${p.interval}'),
              icon: p.popular ? LucideIcons.star : LucideIcons.gem,
              iconColor: p.popular ? context.appColors.warning : null,
              title: p.name,
              subtitle: switch (p.interval) {
                'week' => l10n.shCloudIntervalWeek,
                'year' => l10n.shCloudIntervalYear,
                _ => l10n.shCloudIntervalMonth,
              },
              trailing: p.priceLabel == null
                  ? null
                  : Text(
                      p.priceLabel!,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
              onTap: _busy
                  ? null
                  : () => _buy(
                      storeProductIds: p.storeProductIds,
                      web: p.web,
                      planCode: p.code,
                    ),
            ),
      if (catalog != null && widget.kind == CloudBuyKind.credits)
        for (final p in catalog.packs)
          if (cloudBuyWay(
                channels: _channels,
                storeSource: store.source,
                storeProductIds: p.storeProductIds,
                web: p.web,
              ) !=
              CloudBuyWay.none)
            GroupedTile(
              key: Key('shCloudBuyPack-${p.code}'),
              icon: LucideIcons.coins,
              title: p.name,
              subtitle: formatUsd(p.creditsUsd, l10n.localeName),
              trailing: p.priceLabel == null
                  ? null
                  : Text(
                      p.priceLabel!,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
              onTap: _busy
                  ? null
                  : () => _buy(
                      storeProductIds: p.storeProductIds,
                      web: p.web,
                      packCode: p.code,
                    ),
            ),
    ];
    return SingleChildScrollView(
      key: const Key('shCloudBuySheet'),
      padding: EdgeInsets.fromLTRB(
        AppSpace.xl,
        AppSpace.xs,
        AppSpace.xl,
        AppSpace.lg + MediaQuery.paddingOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpace.md,
        children: [
          Semantics(
            header: true,
            child: Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (catalog == null)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(AppSpace.lg),
                child: CircularProgressIndicator(),
              ),
            )
          else if (_waiting)
            AppCard(
              key: const Key('shCloudWaitingOnWeb'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AppSpace.sm,
                children: [
                  if (!_timedOut) ...[
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
          else if (rows.isEmpty)
            AppCard(
              key: const Key('shCloudNoWayToBuy'),
              child: Text(l10n.shCloudNoWayToBuy),
            )
          else
            GroupedCard(children: rows),
          if (catalog != null &&
              widget.kind == CloudBuyKind.plan &&
              store.source != null &&
              _channels.any((c) => c != PurchaseChannel.web))
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                key: const Key('shCloudRestore'),
                onPressed: _busy
                    ? null
                    : () async {
                        setState(() => _busy = true);
                        final ok = await ref
                            .read(cloudPurchaserProvider)
                            .restore(widget.orgId)
                            .catchError((_) => false);
                        if (!context.mounted) return;
                        setState(() => _busy = false);
                        if (ok) Navigator.of(context).pop(true);
                      },
                child: Text(l10n.restorePurchases),
              ),
            ),
        ],
      ),
    );
  }
}
