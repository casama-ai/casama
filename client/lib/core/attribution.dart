import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'analytics.dart';
import 'install_tracker.dart';
import 'partner_code.dart';
import 'attribution_stub.dart'
    if (dart.library.js_interop) 'attribution_web.dart';
import 'telemetry.dart';

/// Captures first-touch platform & acquisition attribution once per account and sends it to
/// `POST /v1/me/attribution` on Casama Cloud when consent is enabled (D-533).
class Attribution {
  static const _sentPrefix = 'casama.attribution_sent.';
  static const _linkedPrefix = 'casama.install_linked.';
  static Map<String, String>? _initialWeb;
  static String? _pendingPlan;

  /// Call once at startup (before GoRouter modifies the browser URL on web).
  static void captureInitial() {
    _initialWeb ??= readInitialWebAttribution();
    _pendingPlan ??= readInitialWebPlan();
    // A creator's code from casama.ai/c/<code> (D-543), claimed after sign-in.
    final partner = readInitialWebPartner();
    if (partner != null) unawaited(PartnerCodeStore.save(partner, via: 'link_web'));
  }

  /// Returns and clears any plan tier (`plus`, `pro`, `max`) clicked on casama.ai/pricing before sign-in.
  static String? takePendingPlan() {
    final tier = _pendingPlan ?? readInitialWebPlan();
    _pendingPlan = null;
    clearInitialWebPlan();
    return tier;
  }

  /// Testing hook for pending pricing-page plan tier.
  static void setPendingPlanForTest(String? tier) {
    _pendingPlan = tier;
  }

  /// The web app's first-touch source, landing page and website click id (`click`); null elsewhere.
  static Map<String, String>? get initialWeb => _initialWeb ??= readInitialWebAttribution();

  /// Sends first-touch platform and web UTM/referrer attribution once per user.
  ///
  /// The install id (D-537) goes along even with analytics off, alone: it only joins this
  /// install's first open to the account in the instance owner's Live activity.
  static Future<void> sync(
    String userId,
    Future<void> Function({
      String? platform,
      String? source,
      String? medium,
      String? campaign,
      String? landing,
      String? installId,
    })
    send,
  ) async {
    final installId = InstallTracker.installId;
    if (!Telemetry.isCloud && installId == null) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_sentPrefix$userId';
      final linkKey = '$_linkedPrefix$userId';
      final consent = Telemetry.isCloud && await Analytics.isConsentEnabled();
      final platform = Telemetry.platformName;
      if (consent && prefs.getBool(key) != true && platform != 'unknown') {
        final web = _initialWeb ?? readInitialWebAttribution();
        await send(
          platform: platform,
          source: web?['source'],
          medium: web?['medium'],
          campaign: web?['campaign'],
          landing: web?['landing'],
          installId: installId,
        );
        await prefs.setBool(key, true);
        if (installId != null) await prefs.setBool(linkKey, true);
      } else if (installId != null && prefs.getBool(linkKey) != true) {
        await send(installId: installId);
        await prefs.setBool(linkKey, true);
      }
    } catch (_) {
      // Best-effort: tried again on next sign-in if offline.
    }
  }
}
