import 'dart:async';
import 'dart:convert';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/app_lock/session_store.dart' show appSecureStorage;
import 'selfhost_api.dart' show casamaCloudApi;

/// The person's Casama Cloud account on this device, kept apart from the server the app is using
/// (docs/SELFHOST-CLOUD-MODELS-PLAN.md §4.1, §7.2, §7.4.1). An app on a self-hosted server signs in
/// to Casama Cloud for the free personal license and for Casama Cloud models; the session is kept
/// in the system keychain so the person signs in once per device, and Settings shows a "Casama
/// Cloud account" section (sign out, delete account) whenever one is kept (Apple 5.1.1(v)).
///
/// The session never reaches the self-hosted server: Cloud hands the app one-time connect codes,
/// which the app passes on.
abstract class CloudAccountStore {
  Future<AuthSession?> load();
  Future<void> save(AuthSession session);
  Future<void> clear();
}

/// The system keychain (Keychain, Keystore, DPAPI, libsecret; the browser's storage on the web).
/// A keychain that fails counts as empty: the person signs in again rather than seeing an error.
class SecureCloudAccountStore implements CloudAccountStore {
  const SecureCloudAccountStore();
  static const _key = 'casama.cloud.session';

  @override
  Future<AuthSession?> load() async {
    try {
      // A keychain that never answers (a locked or missing secret service) must not hold up the
      // sign-in sheet: after a few seconds, count it as empty.
      final raw = await appSecureStorage
          .read(key: _key)
          .timeout(const Duration(seconds: 5), onTimeout: () => null);
      if (raw == null) return null;
      final j = jsonDecode(raw) as Map<String, dynamic>;
      return AuthSession.fromAuthResponse(j);
    } catch (e) {
      debugPrint('cloud session unreadable: $e');
      return null;
    }
  }

  @override
  Future<void> save(AuthSession session) async {
    try {
      await appSecureStorage.write(
        key: _key,
        value: jsonEncode(session.toJson()),
      );
    } catch (e) {
      debugPrint('cloud session not saved: $e');
    }
  }

  @override
  Future<void> clear() async {
    try {
      await appSecureStorage.delete(key: _key);
    } catch (_) {}
  }
}

/// Keeps nothing (tests, and anywhere without a keychain).
class MemoryCloudAccountStore implements CloudAccountStore {
  MemoryCloudAccountStore([this._session]);
  AuthSession? _session;
  @override
  Future<AuthSession?> load() async => _session;
  @override
  Future<void> save(AuthSession session) async => _session = session;
  @override
  Future<void> clear() async => _session = null;
}

final cloudAccountStoreProvider = Provider<CloudAccountStore>(
  (ref) => const SecureCloudAccountStore(),
);

/// Refreshes a Casama Cloud session (Cloud's Supabase Auth). Tests replace it.
abstract class CloudSessionRefresher {
  Future<AuthSession> refresh(String refreshToken);
}

class SdkCloudSessionRefresher implements CloudSessionRefresher {
  CasamaClient? _client;
  @override
  Future<AuthSession> refresh(String refreshToken) async =>
      (_client ??= await CasamaClient.connect(
        casamaCloudApi,
      )).auth.refresh(refreshToken);
}

final cloudSessionRefresherProvider = Provider<CloudSessionRefresher>(
  (ref) => SdkCloudSessionRefresher(),
);

/// The kept Casama Cloud session, or null when the person isn't signed in to Cloud on this device.
final cloudAccountProvider =
    AsyncNotifierProvider<CloudAccountNotifier, AuthSession?>(
      CloudAccountNotifier.new,
    );

class CloudAccountNotifier extends AsyncNotifier<AuthSession?> {
  Future<AuthSession?>? _refreshing;

  @override
  Future<AuthSession?> build() => ref.watch(cloudAccountStoreProvider).load();

  /// Keeps [session] on this device (after the email-code sign-in).
  Future<void> keep(AuthSession session) async {
    await ref.read(cloudAccountStoreProvider).save(session);
    state = AsyncData(session);
  }

  /// A session good for a call now: the kept one, refreshed when it is about to expire. Null when
  /// none is kept, or Cloud no longer accepts it (then it is forgotten and the person signs in
  /// again). One refresh at a time, so two calls never spend the same refresh token.
  Future<AuthSession?> fresh() async {
    final s = await future;
    if (s == null) return null;
    if (!s.isExpired) return s;
    return _refreshing ??= () async {
      try {
        final next = await ref
            .read(cloudSessionRefresherProvider)
            .refresh(s.refreshToken);
        await keep(next);
        return next;
      } on AuthException catch (e) {
        // A refused refresh token (signed out elsewhere, account deleted): sign in again.
        if ((e.statusCode ?? 0) >= 400 && (e.statusCode ?? 0) < 500) {
          await signOut();
        }
        return null;
      } catch (_) {
        // No network: the old token may still work for a moment; the call says if not.
        return s;
      } finally {
        _refreshing = null;
      }
    }();
  }

  /// Forgets the Cloud session on this device. Nothing changes on Cloud or on the server.
  Future<void> signOut() async {
    await ref.read(cloudAccountStoreProvider).clear();
    state = const AsyncData(null);
  }
}

/// A Casama Cloud workspace the person belongs to.
class CloudWorkspace {
  const CloudWorkspace({
    required this.id,
    required this.name,
    required this.role,
    this.planCode = 'free',
  });
  final String id;
  final String name;

  /// `owner` | `admin` | `member`.
  final String role;
  final String planCode;

  /// Only owners and admins choose who pays (§4.1 step 3).
  bool get canPay => role == 'owner' || role == 'admin';
}

/// What a Cloud workspace's billing says, as far as Cloud models care.
class CloudBilling {
  const CloudBilling({
    required this.planCode,
    required this.planName,
    this.creditsUsd = 0,
    this.casamaModels = true,
    this.source = 'none',
    this.webPortal = false,
  });

  final String planCode;
  final String planName;
  final double creditsUsd;

  /// Whether the plan includes Casama's own models (`casama_models`).
  final bool casamaModels;

  /// Where the plan was bought: `dodo` (web), `app_store`, `google_play`, or `none`.
  final String source;

  /// Whether the plan can be managed in Cloud's web billing portal (bought on the web).
  final bool webPortal;

  /// A paid plan that includes Casama's models, or bought credits (decision 1). Free plans don't count.
  bool get covers => (planCode != 'free' && casamaModels) || creditsUsd > 0;
  bool get paid => planCode != 'free';
}

/// A Cloud plan as the plan picker shows it.
class CloudPlan {
  const CloudPlan({
    required this.code,
    required this.name,
    required this.interval,
    this.priceLabel,
    this.web = true,
    this.storeProductIds = const {},
    this.popular = false,
  });
  final String code;
  final String name;

  /// `week` | `month` | `year`.
  final String interval;
  final String? priceLabel;
  final bool web;
  final Map<String, String> storeProductIds;
  final bool popular;
}

/// A credit pack (Top up).
class CloudPack {
  const CloudPack({
    required this.code,
    required this.name,
    required this.creditsUsd,
    this.priceLabel,
    this.web = true,
    this.storeProductIds = const {},
  });
  final String code;
  final String name;
  final double creditsUsd;
  final String? priceLabel;
  final bool web;
  final Map<String, String> storeProductIds;
}

class CloudCatalog {
  const CloudCatalog({this.plans = const [], this.packs = const []});
  final List<CloudPlan> plans;
  final List<CloudPack> packs;
}

/// A one-time code that lets the server the app is on connect to Cloud for [CloudWorkspace] (§13.1).
class CloudConnectCode {
  const CloudConnectCode(this.code, this.expiresAt);
  final String code;
  final DateTime? expiresAt;
}

/// An error Cloud or the server answered with (`{ code, message }`), with words for a person.
class CloudError implements Exception {
  const CloudError(this.code, this.message, {this.status});
  final String code;
  final String message;
  final int? status;
  @override
  String toString() => message;
}

/// The `{ code, message }` body of [e] (§13), or null when it has none.
CloudError? cloudErrorOf(Object e) {
  if (e is CloudError) return e;
  if (e is! DioException) return null;
  final data = e.response?.data;
  if (data is Map && data['code'] is String) {
    return CloudError(
      data['code'] as String,
      (data['message'] ?? data['detail'] ?? data['code']).toString(),
      status: e.response?.statusCode,
    );
  }
  final status = e.response?.statusCode;
  if (status == 401) return CloudError('unauthorized', '', status: status);
  return null;
}

/// Casama Cloud's API with the kept session: workspaces, billing, purchases, connect codes and
/// account deletion. Tests replace it.
abstract class CloudApi {
  Future<List<CloudWorkspace>> workspaces();
  Future<CloudWorkspace> createWorkspace(String name);
  Future<CloudBilling> billing(String orgId);
  Future<CloudCatalog> plans();

  /// A web checkout page for [planCode] or [packCode], or null when an existing web plan was
  /// changed in place.
  Future<String?> checkoutUrl(
    String orgId, {
    String? planCode,
    String? packCode,
  });
  Future<String> billingPortalUrl(String orgId);
  Future<CloudBilling> verifyPurchase(
    String orgId, {
    required String source,
    required String productId,
    String? transactionId,
    String? purchaseToken,
  });
  Future<void> redeemGiftCode(String orgId, String code);

  /// `POST /v1/selfhost/cloud/connect-codes` (§13.1).
  Future<CloudConnectCode> connectCode({
    required String orgId,
    required String instanceId,
    String? instanceName,
  });

  /// Deletes the Cloud account (the same deletion as Cloud's own Settings → Privacy). Returns when
  /// its data is purged.
  Future<DateTime> deleteAccount(String confirmEmail);
}

/// [CloudApi] over the generated client, with the kept session as the bearer token.
class HttpCloudApi implements CloudApi {
  HttpCloudApi(this._token, {Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: casamaCloudApi,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 30),
            ),
          ) {
    _dio.interceptors.add(const AcceptLanguageInterceptor());
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _token();
          if (token == null) {
            handler.reject(
              DioException(
                requestOptions: options,
                response: Response(
                  requestOptions: options,
                  statusCode: 401,
                  data: const {'code': 'unauthorized', 'message': ''},
                ),
              ),
            );
            return;
          }
          options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
      ),
    );
    _api = CasamaApi(dio: _dio, interceptors: const []);
  }

  final Future<String?> Function() _token;
  final Dio _dio;
  late final CasamaApi _api;

  static CloudBilling _billing(BillingSummary b) => CloudBilling(
    planCode: b.planCode,
    planName: b.planName,
    creditsUsd: b.creditsUsd.toDouble(),
    casamaModels: b.casamaModels != BillingSummaryCasamaModelsEnum.off,
    source: b.source_.value,
    webPortal: b.source_.value == 'dodo',
  );

  static CloudWorkspace _workspace(OrganizationWithRole o) => CloudWorkspace(
    id: o.id,
    name: o.name,
    role: o.role.value,
    planCode: o.plan,
  );

  @override
  Future<List<CloudWorkspace>> workspaces() async => [
    for (final o in (await _api.getWorkspacesApi().listOrgs()).data!.items)
      _workspace(o),
  ];

  @override
  Future<CloudWorkspace> createWorkspace(String name) async {
    final o = (await _api.getWorkspacesApi().createOrg(
      createOrganizationRequest: CreateOrganizationRequest(name: name),
    )).data!;
    return CloudWorkspace(
      id: o.id,
      name: o.name,
      role: 'owner',
      planCode: o.plan,
    );
  }

  @override
  Future<CloudBilling> billing(String orgId) async =>
      _billing((await _api.getBillingApi().getBilling(id: orgId)).data!);

  @override
  Future<CloudCatalog> plans() async {
    final c = (await _api.getBillingApi().listPlans(periods: 'week')).data!;
    return CloudCatalog(
      plans: [
        for (final p in c.plans)
          if (p.code != 'free')
            CloudPlan(
              code: p.code,
              name: p.name,
              interval: p.interval.value,
              priceLabel: p.priceLabel,
              web: p.web,
              storeProductIds: p.storeProductIds,
              popular: p.paywallPopular ?? false,
            ),
      ],
      packs: [
        for (final p in c.packs)
          CloudPack(
            code: p.code,
            name: p.name,
            creditsUsd: p.creditsUsd.toDouble(),
            priceLabel: p.priceLabel,
            web: p.web,
            storeProductIds: p.storeProductIds ?? const {},
          ),
      ],
    );
  }

  @override
  Future<String?> checkoutUrl(
    String orgId, {
    String? planCode,
    String? packCode,
  }) async {
    final r = (await _api.getBillingApi().createCheckout(
      id: orgId,
      checkoutRequest: CheckoutRequest(planCode: planCode, packCode: packCode),
    )).data!;
    return r.changed == true ? null : r.url;
  }

  @override
  Future<String> billingPortalUrl(String orgId) async =>
      (await _api.getBillingApi().billingPortal(
        id: orgId,
        portalRequest: PortalRequest(),
      )).data!.url;

  @override
  Future<CloudBilling> verifyPurchase(
    String orgId, {
    required String source,
    required String productId,
    String? transactionId,
    String? purchaseToken,
  }) async => _billing(
    (await _api.getBillingApi().verifyPurchase(
      id: orgId,
      purchaseRequest: PurchaseRequest(
        source_: source == 'app_store'
            ? PurchaseRequestSource_Enum.appStore
            : PurchaseRequestSource_Enum.googlePlay,
        productId: productId,
        transactionId: transactionId,
        purchaseToken: purchaseToken,
      ),
    )).data!,
  );

  @override
  Future<void> redeemGiftCode(String orgId, String code) async {
    await _api.getCompsApi().redeemCompCode(
      redeemCompRequest: RedeemCompRequest(code: code.trim(), orgId: orgId),
    );
  }

  @override
  Future<CloudConnectCode> connectCode({
    required String orgId,
    required String instanceId,
    String? instanceName,
  }) async {
    final r = await _dio.post<Map<String, dynamic>>(
      '/v1/selfhost/cloud/connect-codes',
      data: {
        'org_id': orgId,
        'instance_id': instanceId,
        'instance_name': ?instanceName,
      },
      options: Options(contentType: 'application/json'),
    );
    final j = r.data ?? const {};
    return CloudConnectCode(
      j['code'] as String,
      DateTime.tryParse('${j['expires_at']}'),
    );
  }

  @override
  Future<DateTime> deleteAccount(String confirmEmail) async =>
      (await _api.getPrivacyApi().deleteMyAccount(
        deleteAccountRequest: DeleteAccountRequest(confirmEmail: confirmEmail),
      )).data!.purgeAfter;
}

final cloudApiProvider = Provider<CloudApi>((ref) {
  return HttpCloudApi(
    () async =>
        (await ref.read(cloudAccountProvider.notifier).fresh())?.accessToken,
  );
});
