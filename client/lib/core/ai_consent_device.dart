import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Which account agreed to AI providers on this device (App Review 5.1.1(i), 2026-11-26).
///
/// The account's own record isn't enough: a fresh install, or the next sign-in after a sign-out,
/// shows the consent step again, so whoever holds this device has seen it before anything is
/// sent. Read before the first frame ([preload]) so an app that agreed never flashes the step.
class AiConsentDevice {
  AiConsentDevice._();

  static const key = 'privacy.aiConsentDevice.v1';
  static String? _user;

  static Future<void> preload() async {
    try {
      _user = (await SharedPreferences.getInstance()).getString(key);
    } catch (_) {}
  }

  /// Records that [userId] agreed on this device, or forgets it (null: withdrawn or signed out).
  static Future<void> save(String? userId) async {
    _user = userId;
    try {
      final prefs = await SharedPreferences.getInstance();
      if (userId == null) {
        await prefs.remove(key);
      } else {
        await prefs.setString(key, userId);
      }
    } catch (_) {}
  }

  /// When [userId] agreed, from the account's [metadata], only if they agreed on this device too.
  static DateTime? consentAt(String? userId, Map<String, dynamic>? metadata) {
    if (userId == null || _user != userId) return null;
    final v = metadata?['ai_consent_at'];
    return v is String ? DateTime.tryParse(v) : null;
  }

  @visibleForTesting
  static void resetForTest() => _user = null;
}
