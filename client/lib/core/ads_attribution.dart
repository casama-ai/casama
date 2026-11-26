import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart'
    show Acquisition, AttributionStatus, $AttributionStatusCopyWith;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'analytics.dart';
import 'attribution.dart';
import 'backend.dart';
import 'billing.dart';
import 'device_details_stub.dart' if (dart.library.io) 'device_details_io.dart';
import 'install_tracker.dart';
import 'landing_labels.dart';
import 'meta_sdk.dart';
import 'providers.dart';
import 'telemetry.dart';
import 'tracking_permission.dart';

/// Ads attribution in the app (docs/ADS-ATTRIBUTION-PLAN.md, Phases 1 and 3): the install record
/// after sign-in, Meta's SDK behind its gates, the buyer before each purchase, and RevenueCat's
/// source fields. Only to Casama Cloud: on a self-hosted server none of this runs.
class AdsAttribution {
  AdsAttribution._();

  /// The app points at Casama Cloud (set once at startup from the server's config).
  static var cloud = false;

  /// Where the calls go (set once at startup).
  static Backend? backend;

  static const _installSentKey = 'casama.ads_install_sent';
  static const _metaAllowedPrefix = 'casama.meta_sdk_allowed.';
  static const _sourceSetPrefix = 'casama.rc_source_set.';

  /// The person and install that pressed Buy, right before a store purchase or a web checkout, so
  /// the next charge is credited to them. Best effort: never waits long, never throws.
  static Future<void> checkoutIntent({
    required String orgId,
    String? productId,
  }) async {
    final b = backend;
    if (!cloud || b == null) return;
    try {
      await b
          .postCheckoutIntent(
            orgId: orgId,
            installId: InstallTracker.installId,
            productId: productId,
          )
          .timeout(const Duration(seconds: 5));
    } catch (_) {}
  }

  /// The server's last answer to "may Meta's SDK start" for [userId] on this device; null when
  /// it never answered.
  static Future<bool?> savedMetaAllowed(
    String userId, [
    SharedPreferences? prefs,
  ]) async {
    try {
      return (prefs ?? await SharedPreferences.getInstance()).getBool(
        '$_metaAllowedPrefix$userId',
      );
    } catch (_) {
      return null;
    }
  }

  static Future<void> _saveMetaAllowed(String userId, bool allowed) async {
    try {
      await (await SharedPreferences.getInstance()).setBool(
        '$_metaAllowedPrefix$userId',
        allowed,
      );
    } catch (_) {}
  }

  /// Posts this install's record once per sign-in, and again when Meta's anonymous id appears or
  /// goes or the iPhone's tracking answer changes ([iosTracking], D-589). Needs Casama Cloud, an
  /// install id and the "Share usage data" switch on. Never throws.
  static Future<void> postInstall({
    required String userId,
    required String? metaAnonId,
    String? iosTracking,
    @visibleForTesting SharedPreferences? prefs,
    @visibleForTesting
    Future<Map<String, Object?>> Function(
      String installId,
      String? metaAnonId,
      String? iosTracking,
    )?
    collect,
  }) async {
    final b = backend;
    final installId = InstallTracker.installId;
    if (!cloud ||
        b == null ||
        installId == null ||
        Telemetry.platformName == 'unknown') {
      return;
    }
    try {
      if (!await Analytics.isConsentEnabled()) return;
      final p = prefs ?? await SharedPreferences.getInstance();
      final signature =
          '$userId|$installId|${metaAnonId ?? ''}|${iosTracking ?? ''}';
      if (p.getString(_installSentKey) == signature) return;
      final body = await (collect ?? collectInstallRecord)(
        installId,
        metaAnonId,
        iosTracking,
      );
      await b.postAttributionInstall(body);
      await p.setString(_installSentKey, signature);
    } catch (_) {
      // Offline: tried again at the next launch or sign-in.
    }
  }

  /// Signed out: the next sign-in posts the install record again, and Meta's SDK stops.
  static Future<void> signedOut([SharedPreferences? prefs]) async {
    try {
      await (prefs ?? await SharedPreferences.getInstance()).remove(
        _installSentKey,
      );
    } catch (_) {}
    await MetaSdk.apply(false);
  }

  /// The install record from this device: app and device details, Meta's anonymous id (only
  /// while its SDK runs), the iPhone's tracking answer, GA4's app instance id, Google Play's
  /// referrer and the web's landing labels.
  static Future<Map<String, Object?>> collectInstallRecord(
    String installId,
    String? metaAnonId,
    String? iosTracking,
  ) async {
    PackageInfo? info;
    try {
      info = await PackageInfo.fromPlatform();
    } catch (_) {}
    String? timezone;
    try {
      timezone = (await FlutterTimezone.getLocalTimezone()).identifier;
    } catch (_) {}
    final view = PlatformDispatcher.instance.views.firstOrNull;
    return installRecordBody(
      installId: installId,
      platform: Telemetry.platformName,
      distribution: Telemetry.distributionName,
      appVersion: info == null
          ? null
          : (info.buildNumber.isEmpty
                ? info.version
                : '${info.version}+${info.buildNumber}'),
      appPackage: info?.packageName,
      osVersion: deviceOsVersion(),
      locale: PlatformDispatcher.instance.locale.toLanguageTag(),
      timezone: timezone,
      screenWidth: view?.physicalSize.width.round(),
      screenHeight: view?.physicalSize.height.round(),
      screenDensity: view?.devicePixelRatio,
      cpuCores: deviceCpuCores(),
      metaAnonId: MetaSdk.running ? metaAnonId : null,
      iosTracking: iosTracking,
      ga4AppInstanceId: await Analytics.ga4AppInstanceId(),
      playReferrer: await InstallTracker.playReferrerText(),
      landing: kIsWeb ? landingLabelsBody(Attribution.initialWeb) : null,
    );
  }
}

/// The install record's body under the contract's wire names (PostAttributionInstallRequest),
/// with empty and out-of-range values left out.
Map<String, Object?> installRecordBody({
  required String installId,
  required String platform,
  String? distribution,
  String? appVersion,
  String? appPackage,
  String? osVersion,
  String? deviceModel,
  String? locale,
  String? timezone,
  int? screenWidth,
  int? screenHeight,
  double? screenDensity,
  int? cpuCores,
  String? metaAnonId,
  String? iosTracking,
  String? ga4AppInstanceId,
  String? playReferrer,
  Map<String, Object>? landing,
}) {
  String? clip(String? s, int max) {
    final v = s?.trim();
    if (v == null || v.isEmpty) return null;
    return v.length > max ? v.substring(0, max) : v;
  }

  int? px(int? v) => v == null || v < 0 || v > 20000 ? null : v;
  final ga4 = clip(ga4AppInstanceId, 64);
  return {
    'install_id': installId,
    'platform': platform,
    'distribution': ?clip(distribution, 32),
    'app_version': ?clip(appVersion, 32),
    'app_package': ?clip(appPackage, 100),
    'os_version': ?clip(osVersion, 32),
    'device_model': ?clip(deviceModel, 64),
    'locale': ?clip(locale, 20),
    'timezone': ?clip(timezone, 64),
    'screen_width': ?px(screenWidth),
    'screen_height': ?px(screenHeight),
    if (screenDensity != null && screenDensity > 0 && screenDensity <= 20)
      'screen_density': screenDensity,
    if (cpuCores != null && cpuCores > 0 && cpuCores <= 1024)
      'cpu_cores': cpuCores,
    'meta_anon_id': ?clip(metaAnonId, 100),
    if (platform == 'ios' && _iosTrackingValues.contains(iosTracking))
      'ios_tracking': iosTracking,
    if (ga4 != null && RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(ga4))
      'ga4_app_instance_id': ga4,
    'play_referrer': ?clip(playReferrer, 2000),
    if (landing != null && landing.isNotEmpty) 'landing': landing,
  };
}

const _iosTrackingValues = {
  'authorized',
  'denied',
  'restricted',
  'not_determined',
};

/// RevenueCat's reserved source attributes from the person's frozen acquisition. Never `$fbAnonId`
/// (RevenueCat's Meta forwarder stays off, Decision 1).
Map<String, String> revenueCatSourceFields(Acquisition a) => {
  if (a.source_.isNotEmpty) r'$mediaSource': a.source_,
  if ((a.campaign ?? '').isNotEmpty) r'$campaign': a.campaign!,
  if ((a.adSet ?? '').isNotEmpty) r'$adGroup': a.adSet!,
  if ((a.ad ?? '').isNotEmpty) r'$ad': a.ad!,
};

/// The server's ads attribution status for the signed-in person, asked once per sign-in (and
/// again after a switch changes). Null off Casama Cloud, signed out, or when it can't be read.
class AttributionStatusNotifier extends AsyncNotifier<AttributionStatus?> {
  @override
  Future<AttributionStatus?> build() async {
    if (ref.watch(signedInProvider).value != true || !AdsAttribution.cloud) {
      return null;
    }
    try {
      return await ref.read(backendProvider).attributionStatus();
    } catch (_) {
      return null;
    }
  }

  /// Turns "Help measure our ads" on or off; throws when the server refuses.
  Future<void> setMeasureAds(bool on) async {
    final next = await ref.read(backendProvider).setAdsMeasurement(on);
    state = AsyncData(next);
  }

  /// The person answered (or skipped) "How did you hear about us?".
  void markHeardFromAsked() {
    final s = state.value;
    if (s != null) state = AsyncData(s.copyWith(heardFromAsked: true));
  }
}

final attributionStatusProvider =
    AsyncNotifierProvider<AttributionStatusNotifier, AttributionStatus?>(
      AttributionStatusNotifier.new,
    );

/// Keeps Meta's SDK, the install record and RevenueCat's source fields in step with the status.
/// Kept alive by the app.
final adsAttributionSyncProvider = Provider<void>((ref) {
  Future<void> syncSource() async {
    final acquisition = ref.read(attributionStatusProvider).value?.acquisition;
    final orgId = ref.read(currentOrgIdProvider);
    if (acquisition == null || orgId == null) return;
    final store = ref.read(storeProvider);
    if (store is! RevenueCatStore) return;
    final fields = revenueCatSourceFields(acquisition);
    if (fields.isEmpty) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '${AdsAttribution._sourceSetPrefix}$orgId';
      if (prefs.getBool(key) == true) return;
      await store.setSourceFields(orgId, fields);
      await prefs.setBool(key, true);
    } catch (_) {}
  }

  Future<void> sync(AttributionStatus? status) async {
    final signedIn = ref.read(signedInProvider).value == true;
    final userId = ref.read(backendProvider).userId;
    if (!signedIn || userId == null || !AdsAttribution.cloud) {
      await MetaSdk.apply(false);
      return;
    }
    if (status != null) {
      await AdsAttribution._saveMetaAllowed(userId, status.metaSdkAllowed);
    }
    final tracking = ref.read(trackingPermissionProvider);
    final allowed = metaSdkMayStart(
      officialBuild: MetaConfig.officialBuild,
      hasKeys: MetaConfig.hasKeys,
      cloud: AdsAttribution.cloud,
      isWeb: kIsWeb,
      platform: defaultTargetPlatform,
      signedIn: signedIn,
      serverAllows:
          status?.metaSdkAllowed ??
          await AdsAttribution.savedMetaAllowed(userId),
      analyticsConsent: await Analytics.isConsentEnabled(),
      trackingAllowed: tracking == TrackingStatus.authorized,
    );
    final anonId = await MetaSdk.apply(allowed);
    await AdsAttribution.postInstall(
      userId: userId,
      metaAnonId: anonId,
      iosTracking: tracking.wire,
    );
    await syncSource();
  }

  ref.listen(attributionStatusProvider, (_, next) {
    if (!next.isLoading) unawaited(sync(next.value));
  }, fireImmediately: true);
  ref.listen(signedInProvider, (prev, next) {
    if (prev?.value == true && next.value == false) {
      unawaited(AdsAttribution.signedOut());
    }
  });
  ref.listen(currentOrgIdProvider, (_, _) => unawaited(syncSource()));
  // Allow or Ask App Not to Track (D-589): start or stop Meta's SDK and tell the server.
  ref.listen(trackingPermissionProvider, (prev, next) {
    if (prev != next) unawaited(sync(ref.read(attributionStatusProvider).value));
  });
});
