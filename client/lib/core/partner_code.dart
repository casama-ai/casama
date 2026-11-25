import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A creator's code (Casama Partners, D-543) waiting for the person to be signed in, and how it
/// arrived: `link_web` (a casama.ai/c/ link or `?partner=`) or `play_referrer` (Google Play's
/// install referrer).
@immutable
class PendingPartnerCode {
  const PendingPartnerCode(this.code, this.via);
  final String code;
  final String via;

  @override
  bool operator ==(Object other) => other is PendingPartnerCode && other.code == code && other.via == via;

  @override
  int get hashCode => Object.hash(code, via);

  @override
  String toString() => 'PendingPartnerCode($code, $via)';
}

/// A creator code as the server keeps it: 3 to 20 letters and digits, upper case. Takes a bare code
/// or a pasted link (`casama.ai/c/maya`). Null when it can't be one.
String? normalizePartnerCode(String? raw) {
  if (raw == null) return null;
  final last = raw.trim().replaceFirst(RegExp(r'[?#].*$'), '').replaceFirst(RegExp(r'/+$'), '').split('/').last;
  final s = last.toUpperCase().replaceAll(RegExp('[^0-9A-Z]'), '');
  if (s.length < 3 || s.length > 20) return null;
  return s;
}

/// Whether typed text is shaped like a friend's invite code (6 letters and digits, D-211) or a
/// casama.ai/i/ link. Those go to the friend's-code redeem, which also takes a creator code of that
/// length; anything else (a longer or shorter code, a casama.ai/c/ link) is a creator code.
bool looksLikeFriendCode(String typed) {
  final t = typed.trim();
  if (RegExp(r'/c/', caseSensitive: false).hasMatch(t)) return false;
  if (RegExp(r'/i/', caseSensitive: false).hasMatch(t)) return true;
  return t.toUpperCase().replaceAll(RegExp('[^0-9A-Z]'), '').length == 6;
}

/// The creator code in Google Play's install referrer (`utm_source=site&partner=MAYA`), or null.
String? partnerCodeFromReferrer(String? referrer) {
  if (referrer == null || referrer.isEmpty) return null;
  try {
    var params = Uri.splitQueryString(referrer);
    // Some links encode the whole referrer once more ("utm_source%3Dsite%26partner%3DMAYA").
    if (!params.containsKey('partner') && referrer.contains('%3D')) {
      params = Uri.splitQueryString(Uri.decodeComponent(referrer));
    }
    return normalizePartnerCode(params['partner']);
  } catch (_) {
    return null;
  }
}

/// Where a pending creator code lives on the device until it is claimed after sign-in. Kept on disk
/// so it survives installing the app, signing up and a web sign-in that reloads the page.
class PartnerCodeStore {
  PartnerCodeStore._();

  static const _key = 'casama.pending_partner';

  /// The last code claimed or refused for good, so a link seen again (the web's cookie) isn't
  /// claimed over and over.
  static const _doneKey = 'casama.partner_done';

  /// Bumped on every change, so the app's provider reads the store again.
  static final changes = ValueNotifier<int>(0);

  static Future<PendingPartnerCode?> read({SharedPreferences? prefs}) async {
    try {
      final p = prefs ?? await SharedPreferences.getInstance();
      final raw = p.getString(_key);
      if (raw == null) return null;
      final i = raw.indexOf('|');
      if (i <= 0) return null;
      final code = normalizePartnerCode(raw.substring(i + 1));
      // Already claimed or refused (a prefs reload elsewhere can bring a removed value back).
      if (code == null || p.getString(_doneKey) == code) return null;
      return PendingPartnerCode(code, raw.substring(0, i));
    } catch (_) {
      return null;
    }
  }

  /// Keeps [raw] as the pending code. [replace]: false keeps one already waiting (the Play
  /// referrer never overrides a link the person opened). Returns whether it was kept.
  static Future<bool> save(String? raw, {required String via, bool replace = true, SharedPreferences? prefs}) async {
    final code = normalizePartnerCode(raw);
    if (code == null) return false;
    try {
      final p = prefs ?? await SharedPreferences.getInstance();
      if (p.getString(_doneKey) == code) return false;
      if (!replace && p.getString(_key) != null) return false;
      if (p.getString(_key) == '$via|$code') return true;
      await p.setString(_key, '$via|$code');
      changes.value++;
      return true;
    } catch (_) {
      return false;
    }
  }

  /// The pending code was claimed, or refused for good: forget it, and don't take it again.
  static Future<void> finish(String code, {SharedPreferences? prefs}) async {
    try {
      final p = prefs ?? await SharedPreferences.getInstance();
      await p.setString(_doneKey, code);
      await p.remove(_key);
      changes.value++;
    } catch (_) {}
  }
}
