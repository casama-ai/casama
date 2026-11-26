import 'dart:async';

import 'package:flutter/foundation.dart';

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

/// Meta's SDK is left out of the App Store review build 107: its own privacy manifest declares
/// tracking, and v1 has no tracking prompt (App Review 5.1.2). The app had no Meta keys, so it
/// never started anyway. Every call says it isn't here.
class FacebookSdkDriver implements MetaSdkDriver {
  @override
  Future<void> start() async => throw StateError('Meta SDK not in this build');

  @override
  Future<void> stop() async {}

  @override
  Future<String?> anonymousId() async => null;
}
