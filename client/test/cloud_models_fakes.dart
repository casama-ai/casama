// Fakes for Casama Cloud models in the app (docs/SELFHOST-CLOUD-MODELS-PLAN.md): Cloud's API, the
// self-hosted server's Cloud models routes, the kept Cloud session and a store that logs out.
import 'dart:async';

import 'package:casama/core/billing.dart';
import 'package:casama/core/cloud_account.dart';
import 'package:casama/features/cloud_models/cloud_models_api.dart';
import 'package:casama_sdk/casama_sdk.dart' show AuthSession;

AuthSession cloudSessionFor(String email, {bool expired = false}) =>
    AuthSession(
      accessToken: 'cloud-access',
      refreshToken: 'cloud-refresh',
      expiresAt: DateTime.now().add(
        expired ? const Duration(minutes: -5) : const Duration(hours: 1),
      ),
      userId: 'cloud-user',
      email: email,
    );

class FakeCloudApi implements CloudApi {
  List<CloudWorkspace> workspaceList = [
    const CloudWorkspace(
      id: 'cw-1',
      name: 'Oliver HQ',
      role: 'owner',
      planCode: 'pro',
    ),
  ];
  final created = <String>[];
  Map<String, CloudBilling> billingFor = {
    'cw-1': const CloudBilling(
      planCode: 'pro',
      planName: 'Pro',
      source: 'dodo',
      webPortal: true,
    ),
  };

  /// What [billing] answers after a purchase lands (a web checkout being watched).
  CloudBilling Function(String orgId)? billingAfter;
  CloudCatalog catalog = const CloudCatalog(
    plans: [
      CloudPlan(
        code: 'plus',
        name: 'Plus',
        interval: 'month',
        priceLabel: r'$15',
        storeProductIds: {
          'app_store': 'casama_plus_monthly',
          'google_play': 'casama_plus:monthly',
        },
      ),
      CloudPlan(
        code: 'pro',
        name: 'Pro',
        interval: 'month',
        priceLabel: r'$49',
        popular: true,
        storeProductIds: {'app_store': 'casama_pro_monthly'},
      ),
    ],
    packs: [
      CloudPack(
        code: 'credits_10',
        name: r'$10 credits',
        creditsUsd: 10,
        priceLabel: r'$10',
        storeProductIds: {'app_store': 'casama_credits_10'},
      ),
    ],
  );
  final checkouts = <String>[];
  final verified = <String>[];
  final connectCodes = <({String orgId, String instanceId})>[];
  final deleted = <String>[];
  final gifts = <String>[];
  var billingCalls = 0;

  @override
  Future<List<CloudWorkspace>> workspaces() async => workspaceList;

  @override
  Future<CloudWorkspace> createWorkspace(String name) async {
    created.add(name);
    final w = CloudWorkspace(id: 'cw-new', name: name, role: 'owner');
    workspaceList = [...workspaceList, w];
    billingFor['cw-new'] = const CloudBilling(
      planCode: 'free',
      planName: 'Free',
    );
    return w;
  }

  @override
  Future<CloudBilling> billing(String orgId) async {
    billingCalls++;
    return billingAfter?.call(orgId) ??
        billingFor[orgId] ??
        const CloudBilling(planCode: 'free', planName: 'Free');
  }

  @override
  Future<CloudCatalog> plans() async => catalog;

  @override
  Future<String?> checkoutUrl(
    String orgId, {
    String? planCode,
    String? packCode,
  }) async {
    checkouts.add('${planCode ?? packCode}@$orgId');
    return 'https://checkout.test/${planCode ?? packCode}';
  }

  @override
  Future<String> billingPortalUrl(String orgId) async =>
      'https://portal.test/$orgId';

  @override
  Future<CloudBilling> verifyPurchase(
    String orgId, {
    required String source,
    required String productId,
    String? transactionId,
    String? purchaseToken,
  }) async {
    verified.add('$productId@$orgId');
    return billingFor[orgId] = const CloudBilling(
      planCode: 'plus',
      planName: 'Plus',
      source: 'app_store',
    );
  }

  @override
  Future<void> redeemGiftCode(String orgId, String code) async =>
      gifts.add('$code@$orgId');

  @override
  Future<CloudConnectCode> connectCode({
    required String orgId,
    required String instanceId,
    String? instanceName,
  }) async {
    connectCodes.add((orgId: orgId, instanceId: instanceId));
    return CloudConnectCode('code-${connectCodes.length}', null);
  }

  @override
  Future<DateTime> deleteAccount(String confirmEmail) async {
    deleted.add(confirmEmail);
    return DateTime.utc(2026, 12, 26);
  }
}

class FakeCloudModelsApi implements CloudModelsApi {
  FakeCloudModelsApi([
    this.current = const CloudModelsState(available: true, canManage: true),
  ]);
  CloudModelsState current;

  /// What the server's state is after connecting with a code.
  CloudModelsState Function(String code)? afterConnect;
  CloudPreview previewAnswer = const CloudPreview(
    bots: [
      PreviewBot(
        id: 'b-1',
        name: 'Ada',
        fromCredentialId: 'k-anthropic',
        fromProvider: 'anthropic',
        fromModel: 'claude-opus-5-5',
        fromLabel: 'Claude Opus 5.5 (your Anthropic key)',
        fromWorking: true,
        stepDown: true,
      ),
      PreviewBot(id: 'b-2', name: 'Bo', suggested: true),
    ],
    ownImage: true,
  );
  final connected = <String>[];
  final applied = <CloudApply>[];

  /// How many times the state was read.
  var stateReads = 0;
  final updates = <({CloudPolicy? policy, CloudFallback? fallback})>[];
  var offCalls = 0;
  List<OffBot> offAnswer = const [
    OffBot(id: 'b-1', name: 'Ada', toLabel: 'Anthropic'),
    OffBot(id: 'b-2', name: 'Bo'),
  ];

  @override
  Future<CloudModelsState> state() async {
    stateReads++;
    return current;
  }

  @override
  Future<CloudModelsState> connect(String code) async {
    connected.add(code);
    return current = afterConnect?.call(code) ?? connectedState();
  }

  @override
  Future<CloudPreview> preview() async => previewAnswer;

  @override
  Future<CloudModelsState> apply(CloudApply request) async {
    applied.add(request);
    return current;
  }

  @override
  Future<CloudModelsState> update({
    CloudPolicy? policy,
    CloudFallback? fallback,
  }) async {
    updates.add((policy: policy, fallback: fallback));
    return current;
  }

  @override
  Future<List<OffBot>> off() async {
    offCalls++;
    return offAnswer;
  }
}

/// A connected server whose Cloud answers, on Pro, with [status] overrides.
CloudModelsState connectedState({
  bool canManage = true,
  CloudStatus? status,
  ({String code, String message})? statusError,
  CloudMe me = const CloudMe(),
  CloudFallback fallback = const CloudFallback(),
  MemoryReindex? reindex,
  CloudPolicy policy = const CloudPolicy(),
}) => CloudModelsState(
  available: true,
  connected: true,
  canManage: canManage,
  payer: const CloudPayer(orgId: 'cw-1', name: 'Oliver HQ'),
  status: status ?? proStatus(),
  statusError: statusError,
  me: me,
  fallback: fallback,
  memoryReindex: reindex,
  policy: policy,
);

CloudStatus proStatus({
  bool modelsAllowed = true,
  bool paid = true,
  bool planEnded = false,
  double credits = 0,
  double includedUsed = 4,
  double includedLimit = 20,
  double todaySpend = 0.4,
  double? todayCap = 5,
  double trial = 0,
  int? seatsPlan,
  int? seatsUsed,
  List<String> scopes = const ['models'],
}) => CloudStatus(
  scopes: scopes,
  payer: const CloudPayer(orgId: 'cw-1', name: 'Oliver HQ'),
  planCode: paid ? 'pro' : 'free',
  planName: paid ? 'Pro' : 'Free',
  paid: paid,
  planEnded: planEnded,
  modelsAllowed: modelsAllowed,
  creditsUsd: credits,
  includedUsed: includedUsed,
  includedLimit: includedLimit,
  todaySpend: todaySpend,
  todayCap: todayCap,
  resetsAt: DateTime.utc(2026, 11, 27),
  trialRemaining: trial,
  seatsPlan: seatsPlan,
  seatsUsed: seatsUsed,
  jobs: const {'chat': 'deepseek/deepseek-v4.1-flash'},
);

/// A store whose purchases carry the workspace they were made for, and that logs out.
class ReleasingStore implements StorePurchases, StoreCustomerRelease {
  ReleasingStore(this.source);
  @override
  final String? source;
  final _purchases = StreamController<StorePurchase>.broadcast();
  final bought = <String>[];
  final restoredFor = <String>[];
  final completed = <String>[];
  final log = <String>[];
  var releases = 0;
  PurchaseStatus next = PurchaseStatus.purchased;

  @override
  Future<String?> storefront() async => 'USA';
  @override
  Future<List<StoreProduct>> products(Set<String> ids) async => [
    for (final id in ids) StoreProduct(id: id, price: r'$9.99'),
  ];
  @override
  Future<Map<String, int>> freeTrialDays(Set<String> ids) async => const {};
  @override
  Future<void> buy(
    StoreProduct product, {
    required String orgId,
    bool consumable = false,
  }) async {
    bought.add('${product.id}@$orgId');
    log.add('buy:$orgId');
    scheduleMicrotask(
      () => _purchases.add(
        StorePurchase(
          source: source!,
          productId: product.id,
          status: next,
          transactionId: 'tx-1',
          orgId: orgId,
        ),
      ),
    );
  }

  @override
  Future<void> restore({required String orgId}) async {
    restoredFor.add(orgId);
    log.add('restore:$orgId');
    _purchases.add(
      StorePurchase(
        source: source!,
        productId: 'casama_plus_monthly',
        restored: true,
        status: PurchaseStatus.restored,
        orgId: orgId,
      ),
    );
  }

  @override
  Stream<StorePurchase> get purchases => _purchases.stream;
  @override
  Future<void> complete(StorePurchase purchase) async =>
      completed.add(purchase.productId);
  @override
  Stream<void> get changes => const Stream.empty();
  @override
  Future<void> watchChanges() async {}
  @override
  Future<void> release() async {
    releases++;
    log.add('release');
  }
}
