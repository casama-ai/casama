import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:play_install_referrer/play_install_referrer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'attribution.dart';
import 'partner_code.dart';
import 'telemetry.dart';

/// The app's first open on this install, and its first sign-in attempt (D-537,
/// docs/LIVE-ACTIVITY-V2-PLAN.md), for the instance owner's Live activity.
///
/// One call each, ever, per install, with a random install id made here. Never an advertising id
/// or anything about the device. Only to Casama Cloud (and a debug build's own local server), and
/// it doesn't wait on the analytics switch: it says an install happened, nothing about what the
/// person does. Android adds the website click it came from, from Google Play's install referrer;
/// the web app reads it from its link.
class InstallTracker {
  InstallTracker._();

  static const _idKey = 'casama.install_id';
  static const _openSentKey = 'casama.install_first_open_sent';
  static const _signinSentKey = 'casama.install_signin_sent';

  /// Kept in the keychain too: on iOS it outlives deleting the app, so a reinstall shows as one.
  static const _keptKey = 'casama.install_id.kept';
  static const _secure = FlutterSecureStorage();

  static String? _id;
  static var _reinstall = false;
  static Future<void> Function(Map<String, Object?> body)? _send;

  /// This install's id once made; null before [start] or where it isn't used.
  static String? get installId => _id;

  /// Makes or reads the install id and sends the first open once. [cloud]: the server is Casama
  /// Cloud. Never throws.
  static Future<void> start({
    required bool cloud,
    required Future<void> Function(Map<String, Object?> body) send,
    @visibleForTesting SharedPreferences? prefs,
    @visibleForTesting bool keychain = true,
    @visibleForTesting Future<String?> Function()? playReferrer,
  }) async {
    if (!cloud && !kDebugMode) return;
    _send = send;
    try {
      final p = prefs ?? await SharedPreferences.getInstance();
      var id = p.getString(_idKey);
      if (id == null) {
        final kept = keychain && _usesKeychain ? await _readKept() : null;
        _reinstall = kept != null;
        id = _newId();
        await p.setString(_idKey, id);
        if (keychain && _usesKeychain) {
          unawaited(_secure.write(key: _keptKey, value: id).catchError((_) {}));
        }
      }
      _id = id;
      if (p.getBool(_openSentKey) == true) return;
      final web = Attribution.initialWeb;
      final play = await (playReferrer ?? _playReferrer)();
      // A creator's code carried through Google Play (casama.ai/c/<code>, D-543): kept on this
      // device and claimed once the person signs in. It goes nowhere else.
      await PartnerCodeStore.save(partnerCodeFromReferrer(play), via: 'play_referrer', replace: false, prefs: p);
      final fromPlay = play == null
          ? const <String, String>{}
          : Uri.splitQueryString(play);
      final click = web?['click'] ?? fromPlay['cv'];
      await send(
        {
          'event': 'first_open',
          'install_id': id,
          if (click != null && _validId(click)) 'click_id': click,
          if (_reinstall) 'reinstall': true,
          'platform': Telemetry.platformName,
          'distribution': Telemetry.distributionName,
          'version': await _version(),
          'locale': PlatformDispatcher.instance.locale.toLanguageTag(),
          'source': web?['source'] ?? fromPlay['utm_source'],
          'medium': web?['medium'] ?? fromPlay['utm_medium'],
          'campaign': web?['campaign'] ?? fromPlay['utm_campaign'],
          'landing': web?['landing'],
        }..removeWhere((_, v) => v == null || (v is String && v.isEmpty)),
      );
      await p.setBool(_openSentKey, true);
    } catch (_) {
      // Offline or an older server: the next launch tries again.
    }
  }

  /// The first sign-in attempt on this install, once. Never throws.
  static Future<void> signinStarted({
    @visibleForTesting SharedPreferences? prefs,
  }) async {
    final id = _id;
    final send = _send;
    if (id == null || send == null) return;
    try {
      final p = prefs ?? await SharedPreferences.getInstance();
      if (p.getBool(_signinSentKey) == true) return;
      await p.setBool(_signinSentKey, true);
      await send({
        'event': 'signin_started',
        'install_id': id,
        'platform': Telemetry.platformName,
      });
    } catch (_) {}
  }

  @visibleForTesting
  static void reset() {
    _id = null;
    _send = null;
    _reinstall = false;
  }

  static bool get _usesKeychain =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS);

  static Future<String?> _readKept() async {
    try {
      return await _secure.read(key: _keptKey);
    } catch (_) {
      return null;
    }
  }

  /// Google Play's install referrer text as Play gave it, for the ads attribution install record
  /// (docs/ADS-ATTRIBUTION-PLAN.md §6.3). Android only; read once per run.
  static Future<String?> playReferrerText() => _referrerText ??= _playReferrer();
  static Future<String?>? _referrerText;

  /// Google Play's install referrer ("utm_source=…&cv=…"), Android only; null elsewhere.
  static Future<String?> _playReferrer() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return null;
    try {
      return (await PlayInstallReferrer.installReferrer.timeout(
        const Duration(seconds: 5),
      )).installReferrer;
    } catch (_) {
      return null;
    }
  }

  /// "0.1.0+92": the version and build number.
  static Future<String?> _version() async {
    try {
      final info = await PackageInfo.fromPlatform();
      return info.buildNumber.isEmpty
          ? info.version
          : '${info.version}+${info.buildNumber}';
    } catch (_) {
      return null;
    }
  }

  static bool _validId(String s) =>
      RegExp(r'^[A-Za-z0-9_-]{8,64}$').hasMatch(s);

  static String _newId() {
    final r = Random.secure();
    const chars = '0123456789abcdefghijklmnopqrstuvwxyz';
    return List.generate(26, (_) => chars[r.nextInt(chars.length)]).join();
  }
}
