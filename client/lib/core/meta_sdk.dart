import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show MethodChannel;

import 'distribution.dart';

/// Meta's SDK in the iOS and Android apps (docs/ADS-ATTRIBUTION-PLAN.md §6.5).
///
/// Off until allowed. The keys come from the gitignored `client/config/telemetry.json`, which only
/// official builds pass (`CASAMA_OFFICIAL_BUILD=1`):
///   --dart-define=META_APP_ID=...        Meta app id
///   --dart-define=META_CLIENT_TOKEN=...  its client token
/// A build without them never reaches the SDK. When it runs, it reports the install and app opens
/// (`activateApp`) and nothing else: Casama's server tells Meta about sign-ups and purchases.
class MetaConfig {
  MetaConfig._();

  static const appId = String.fromEnvironment('META_APP_ID');
  static const clientToken = String.fromEnvironment('META_CLIENT_TOKEN');

  /// Both keys are in this build.
  static bool get hasKeys => appId.isNotEmpty && clientToken.isNotEmpty;

  /// An official build: the keys only come from the official builds' telemetry file, and a
  /// community store build (F-Droid) never runs Meta even if someone passes them.
  static bool get officialBuild =>
      hasKeys && androidDistribution(kDistribution) != 'foss';
}

/// Whether Meta's SDK may run on this device right now. Every gate must be open; with no answer
/// from the server ([serverAllows] null) it stays off.
bool metaSdkMayStart({
  required bool officialBuild,
  required bool hasKeys,
  required bool cloud,
  required bool isWeb,
  required TargetPlatform platform,
  required bool signedIn,
  required bool? serverAllows,
  required bool analyticsConsent,
}) =>
    officialBuild &&
    hasKeys &&
    cloud &&
    !isWeb &&
    (platform == TargetPlatform.iOS || platform == TargetPlatform.android) &&
    signedIn &&
    serverAllows == true &&
    analyticsConsent;

/// What reaches the native SDK. A fake in tests.
abstract class MetaSdkDriver {
  /// Sets the keys, initializes the SDK and reports the app open.
  Future<void> start();

  /// Stops automatic logging and advertising id collection for the rest of this run.
  Future<void> stop();

  /// Meta's anonymous id for this install, once started.
  Future<String?> anonymousId();
}

/// Starts and stops Meta's SDK as the gates say. Never throws.
class MetaSdk {
  MetaSdk._();

  static MetaSdkDriver driver = FacebookSdkDriver();
  static var _running = false;
  static Future<void> _queue = Future.value();

  /// Whether the SDK was started in this run (and not stopped since).
  static bool get running => _running;

  /// Starts the SDK when [allowed] and it isn't running, stops it when not; answers Meta's
  /// anonymous id while it runs, else null.
  static Future<String?> apply(bool allowed) {
    final done = Completer<String?>();
    _queue = _queue.then((_) async {
      try {
        if (allowed) {
          if (!_running) {
            await driver.start();
            _running = true;
          }
          final id = await driver.anonymousId();
          done.complete(id != null && _validAnonId(id) ? id : null);
          return;
        }
        if (_running) {
          _running = false;
          await driver.stop();
        }
      } catch (e) {
        debugPrint('Meta SDK: $e');
      }
      if (!done.isCompleted) done.complete(null);
    });
    return done.future;
  }

  static bool _validAnonId(String s) =>
      s.length <= 100 && RegExp(r'^[A-Za-z0-9_:.-]+$').hasMatch(s);

  @visibleForTesting
  static void reset() {
    _running = false;
    _queue = Future.value();
    driver = FacebookSdkDriver();
  }
}

/// The real SDK through facebook_app_events, with the keys set by `casama/meta`
/// (AppDelegate.swift and MainActivity.kt). iOS and Android only.
class FacebookSdkDriver implements MetaSdkDriver {
  static const _channel = MethodChannel('casama/meta');
  final _fb = FacebookAppEvents();

  bool get _supported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  bool get _ios => defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Future<void> start() async {
    if (!_supported || !MetaConfig.hasKeys) {
      throw StateError('Meta SDK unavailable here');
    }
    // iOS: the link that opened the app, which reached the app before the SDK ran (Android's SDK
    // keeps it from process start by itself).
    String? link;
    if (_ios) {
      try {
        final uri = await AppLinks().getInitialLink().timeout(
          const Duration(seconds: 2),
        );
        if (uri != null && (uri.scheme == 'https' || uri.scheme == 'http')) {
          link = uri.toString();
        }
      } catch (_) {}
    }
    await _channel.invokeMethod<void>('configure', {
      'appId': MetaConfig.appId,
      'clientToken': MetaConfig.clientToken,
      'url': ?link,
    });
    await _fb.initializeSdk();
    await _fb.setAutoLogAppEventsEnabled(false);
    // iOS: no tracking prompt in v1 (Decision 2), so no advertising id. Android: Meta may read it
    // while it runs (Decision 3); Google Analytics never does.
    await _fb.setAdvertiserIdCollectionEnabled(!_ios);
    await _fb.activateApp();
  }

  @override
  Future<void> stop() async {
    if (!_supported) return;
    await _fb.setAutoLogAppEventsEnabled(false);
    await _fb.setAdvertiserIdCollectionEnabled(false);
  }

  @override
  Future<String?> anonymousId() async {
    if (!_supported) return null;
    return _fb.getAnonymousId();
  }
}
