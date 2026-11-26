import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/analytics.dart';
import '../../core/billing.dart';
import '../../core/cloud_account.dart';
import '../billing/billing_screen.dart'
    show openUrlProvider, platformProvider, storefrontProvider;

/// Paying for Casama Cloud models in the right place (docs/SELFHOST-CLOUD-MODELS-PLAN.md §7.4,
/// §7.4.1). Every purchase belongs to the Casama Cloud workspace that pays, never to the
/// self-hosted workspace the app has open:
/// - store builds buy through the store, with RevenueCat logged in as the Cloud workspace's id for
///   the purchase or restore and logged out to an anonymous customer right after; Cloud verifies it;
/// - web checkout only where [purchaseChannels] includes the web, and then the app watches Cloud's
///   billing and carries on by itself when the plan lands.

/// Whether this is the web app; tests override it.
final cloudIsWebProvider = Provider<bool>((ref) => kIsWeb);

/// How a plan or pack can be bought in this app.
enum CloudBuyWay { store, web, none }

/// The way to buy an item with [storeProductIds] (and sold on the web when [web]) here.
CloudBuyWay cloudBuyWay({
  required List<PurchaseChannel> channels,
  required String? storeSource,
  required Map<String, String> storeProductIds,
  required bool web,
}) {
  final inStore =
      channels.contains(PurchaseChannel.appStore) ||
      channels.contains(PurchaseChannel.googlePlay);
  if (inStore && storeSource != null && storeProductIds[storeSource] != null) {
    return CloudBuyWay.store;
  }
  // A store build never falls back to the web unless its rules allow a web link (US storefront).
  if (channels.contains(PurchaseChannel.web) && web) return CloudBuyWay.web;
  return CloudBuyWay.none;
}

/// What became of a Cloud purchase.
enum CloudBuyResult { bought, pending, cancelled, failed, timedOut }

class CloudPurchaser {
  CloudPurchaser(this.ref);
  final Ref ref;

  /// How long a web checkout is watched before the app says it hasn't arrived yet.
  static Duration watchFor = const Duration(minutes: 15);
  static Duration watchEvery = const Duration(seconds: 5);

  /// The purchase channels for this app right now.
  Future<List<PurchaseChannel>> channels() async {
    String? storefront;
    try {
      storefront = await ref.read(storefrontProvider.future);
    } catch (_) {}
    return purchaseChannels(
      platform: ref.read(platformProvider),
      isWeb: ref.read(cloudIsWebProvider),
      storefront: storefront,
    );
  }

  bool get giftCodes => giftCodesAllowed(
    platform: ref.read(platformProvider),
    isWeb: ref.read(cloudIsWebProvider),
  );

  StorePurchases get _store => ref.read(storeProvider);

  Future<void> _release() async {
    if (_store case final StoreCustomerRelease store) await store.release();
  }

  /// Buys [productId] in the store for the Cloud workspace [orgId], has Cloud verify it, then logs
  /// the store out to anonymous whatever happened.
  Future<CloudBuyResult> buyInStore({
    required String orgId,
    required String productId,
    bool consumable = false,
  }) async {
    final store = _store;
    final source = store.source;
    if (source == null) return CloudBuyResult.failed;
    StreamSubscription<StorePurchase>? sub;
    try {
      final products = await store.products({productId});
      final product = products.where((p) => p.id == productId).firstOrNull;
      if (product == null) return CloudBuyResult.failed;
      final done = Completer<StorePurchase>();
      sub = store.purchases.listen((p) {
        if (p.orgId == orgId && p.productId == productId && !done.isCompleted) {
          done.complete(p);
        }
      });
      unawaited(
        Analytics.capture(
          'purchase_started',
          properties: {
            'store': source,
            'kind': consumable ? 'credit_pack' : 'subscription',
            'product_id': productId,
            'for': 'cloud_models',
          },
        ),
      );
      await store.buy(product, orgId: orgId, consumable: consumable);
      final p = await done.future.timeout(const Duration(minutes: 10));
      switch (p.status) {
        case PurchaseStatus.canceled:
          await store.complete(p).catchError((_) {});
          return CloudBuyResult.cancelled;
        case PurchaseStatus.pending:
          return CloudBuyResult.pending;
        case PurchaseStatus.error:
          await store.complete(p).catchError((_) {});
          return CloudBuyResult.failed;
        case PurchaseStatus.purchased || PurchaseStatus.restored:
          await ref
              .read(cloudApiProvider)
              .verifyPurchase(
                orgId,
                source: source,
                productId: productId,
                transactionId: p.transactionId,
                purchaseToken: p.purchaseToken,
              );
          await store.complete(p);
          unawaited(
            Analytics.capture(
              'cloud_models_purchased',
              properties: {'store': source, 'product_id': productId},
            ),
          );
          return CloudBuyResult.bought;
      }
    } on TimeoutException {
      return CloudBuyResult.timedOut;
    } finally {
      // Log out first: nothing after this purchase may be attributed to the Cloud workspace.
      await _release();
      unawaited(sub?.cancel());
    }
  }

  /// Restore Purchases for the Cloud workspace [orgId]: each active subscription is verified with
  /// Cloud, which finds it under the workspace it was bought for. True when one counted.
  Future<bool> restore(String orgId) async {
    final store = _store;
    final source = store.source;
    if (source == null) return false;
    final restored = <StorePurchase>[];
    final sub = store.purchases.listen((p) {
      if (p.orgId == orgId && p.status == PurchaseStatus.restored) {
        restored.add(p);
      }
    });
    try {
      await store.restore(orgId: orgId);
      // The store sends restored purchases as it finds them; give the stream a moment.
      await Future<void>.delayed(Duration.zero);
      var any = false;
      for (final p in restored) {
        try {
          await ref
              .read(cloudApiProvider)
              .verifyPurchase(orgId, source: source, productId: p.productId);
          any = true;
        } catch (_) {}
      }
      return any;
    } finally {
      await _release();
      unawaited(sub.cancel());
    }
  }

  /// Opens Cloud's web checkout for [planCode] or [packCode] and watches Cloud's billing until
  /// [arrived] says the purchase landed (or [watchFor] passes). [opened] fires once the page is open.
  Future<CloudBuyResult> buyOnWeb({
    required String orgId,
    String? planCode,
    String? packCode,
    required bool Function(CloudBilling billing) arrived,
    VoidCallback? opened,
  }) async {
    final api = ref.read(cloudApiProvider);
    unawaited(
      Analytics.capture(
        'purchase_started',
        properties: {
          'store': 'dodo',
          'kind': packCode != null ? 'credit_pack' : 'subscription',
          'product_id': planCode ?? packCode,
          'for': 'cloud_models',
        },
      ),
    );
    final url = await api.checkoutUrl(
      orgId,
      planCode: planCode,
      packCode: packCode,
    );
    if (url == null) return CloudBuyResult.bought;
    await ref.read(openUrlProvider)(url);
    opened?.call();
    return watch(orgId, arrived);
  }

  /// Watches Cloud's billing for [orgId] until [arrived] (or [watchFor] passes).
  Future<CloudBuyResult> watch(
    String orgId,
    bool Function(CloudBilling billing) arrived,
  ) async {
    final api = ref.read(cloudApiProvider);
    final until = DateTime.now().add(watchFor);
    while (DateTime.now().isBefore(until)) {
      await Future<void>.delayed(watchEvery);
      try {
        if (arrived(await api.billing(orgId))) {
          unawaited(
            Analytics.capture(
              'cloud_models_purchased',
              properties: const {'store': 'dodo'},
            ),
          );
          return CloudBuyResult.bought;
        }
      } catch (_) {}
    }
    return CloudBuyResult.timedOut;
  }
}

final cloudPurchaserProvider = Provider<CloudPurchaser>(CloudPurchaser.new);
