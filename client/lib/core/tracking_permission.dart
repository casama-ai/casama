import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show MethodChannel;
import 'package:flutter/widgets.dart'
    show AppLifecycleListener, AppLifecycleState, WidgetsBinding;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meta_sdk.dart';

/// Apple's App Tracking Transparency on iPhone and iPad (D-589, docs/ADS-ATTRIBUTION-PLAN.md §6.5).
///
/// Meta's SDK and Meta app events for an iPhone or iPad run only after the person taps Allow in
/// Apple's own prompt. Casama shows no screen of its own before it. The prompt comes once, after
/// the first-run pages (AI providers, name, how you heard, picks, notifications), while the app is
/// in front. It never blocks anything: Ask App Not to Track only means no Meta SDK and no Meta
/// events from this device.
enum TrackingStatus {
  notDetermined('not_determined'),
  restricted('restricted'),
  denied('denied'),
  authorized('authorized'),

  /// Not an iPhone or iPad, or this build has no tracking prompt.
  unavailable(null);

  const TrackingStatus(this.wire);

  /// The install record's `ios_tracking` value; null when it doesn't apply.
  final String? wire;

  static TrackingStatus fromNative(Object? v) => switch (v) {
    'authorized' => authorized,
    'denied' => denied,
    'restricted' => restricted,
    'not_determined' => notDetermined,
    _ => unavailable,
  };
}

/// What reaches iOS. A fake in tests.
abstract class TrackingDriver {
  /// `ATTrackingManager.trackingAuthorizationStatus`.
  Future<TrackingStatus> status();

  /// Shows Apple's prompt when the status is still not determined and answers the new status.
  Future<TrackingStatus> request();

  /// Opens Casama's page in the Settings app, where Allow Tracking is changed.
  Future<void> openSettings();

  /// Registers the install with SKAdNetwork once (Apple's own private ad measurement: no
  /// identifiers leave the device), whatever the person answered.
  Future<void> registerInstall();
}

/// The real thing through `casama/tracking` (AppDelegate.swift).
class ChannelTrackingDriver implements TrackingDriver {
  static const _channel = MethodChannel('casama/tracking');

  @override
  Future<TrackingStatus> status() async =>
      TrackingStatus.fromNative(await _channel.invokeMethod<String>('status'));

  @override
  Future<TrackingStatus> request() async =>
      TrackingStatus.fromNative(await _channel.invokeMethod<String>('request'));

  @override
  Future<void> openSettings() => _channel.invokeMethod<void>('openSettings');

  @override
  Future<void> registerInstall() =>
      _channel.invokeMethod<void>('registerInstall');
}

/// Whether this build asks for tracking at all: the official iPhone and iPad app with Meta's keys,
/// pointed at Casama Cloud. It doesn't depend on the server's region answer or the person's
/// switches, so the prompt shows the same way for everyone, App Review included; those still
/// keep Meta's SDK off after an Allow (see [metaSdkMayStart]).
bool trackingPromptApplies({
  required bool officialBuild,
  required bool cloud,
  required bool isWeb,
  required TargetPlatform platform,
}) => officialBuild && cloud && !isWeb && platform == TargetPlatform.iOS;

/// The tracking status on this device, and the one-time ask.
class TrackingPermissionNotifier extends Notifier<TrackingStatus> {
  /// Where the calls go. A fake in tests.
  static TrackingDriver driver = ChannelTrackingDriver();

  /// Whether the app points at Casama Cloud (set at startup, with [AdsAttribution.cloud]).
  static var cloud = false;

  /// Overrides for tests.
  @visibleForTesting
  static bool? appliesOverride;
  @visibleForTesting
  static bool Function()? inFrontOverride;

  /// How long nothing may cover the app before the prompt shows: the first-run pages load their
  /// answers from the server, and for a moment none of them shows yet.
  static const settleTime = Duration(seconds: 3);

  var _firstRunDone = false;
  var _asking = false;
  var _registered = false;
  Timer? _settle;

  bool get _applies =>
      appliesOverride ??
      trackingPromptApplies(
        officialBuild: MetaConfig.officialBuild,
        cloud: cloud,
        isWeb: kIsWeb,
        platform: defaultTargetPlatform,
      );

  bool get _inFront =>
      inFrontOverride?.call() ??
      WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;

  @override
  TrackingStatus build() {
    if (!_applies) return TrackingStatus.unavailable;
    final lifecycle = AppLifecycleListener(onResume: _onResume);
    ref.onDispose(lifecycle.dispose);
    ref.onDispose(() => _settle?.cancel());
    unawaited(refresh());
    return TrackingStatus.unavailable;
  }

  /// Reads the status again (it can change in the Settings app at any time).
  Future<void> refresh() async {
    if (!_applies) return;
    try {
      final s = await driver.status();
      if (ref.mounted) state = s;
    } catch (e) {
      debugPrint('tracking status: $e');
    }
  }

  void _onResume() {
    unawaited(() async {
      await refresh();
      await _maybeAsk();
    }());
  }

  /// Whether a first-run page (or sign-in) covers the app right now. Once nothing has covered it
  /// for [settleTime], the prompt shows if the app is in front, else on the next resume.
  void firstRunClear(bool clear) {
    if (_firstRunDone || !_applies) return;
    if (!clear) {
      _settle?.cancel();
      _settle = null;
      return;
    }
    _settle ??= Timer(settleTime, () {
      _settle = null;
      _firstRunDone = true;
      unawaited(_maybeAsk());
    });
  }

  Future<void> _maybeAsk() async {
    if (!_applies || !_firstRunDone || _asking) return;
    if (state == TrackingStatus.unavailable) await refresh();
    if (state != TrackingStatus.notDetermined) {
      await _register();
      return;
    }
    // iOS ignores the request (and keeps "not determined") while the app isn't active, for
    // example while another system alert is up; the next resume tries again.
    if (!_inFront) return;
    _asking = true;
    try {
      final s = await driver.request();
      if (ref.mounted) state = s;
      if (s != TrackingStatus.notDetermined) await _register();
    } catch (e) {
      debugPrint('tracking request: $e');
    } finally {
      _asking = false;
    }
  }

  Future<void> _register() async {
    if (_registered) return;
    _registered = true;
    try {
      await driver.registerInstall();
    } catch (e) {
      debugPrint('SKAdNetwork: $e');
    }
  }

  /// Opens Casama's page in the Settings app.
  Future<void> openSettings() async {
    try {
      await driver.openSettings();
    } catch (e) {
      debugPrint('tracking settings: $e');
    }
  }

  @visibleForTesting
  static void reset() {
    driver = ChannelTrackingDriver();
    cloud = false;
    appliesOverride = null;
    inFrontOverride = null;
  }
}

final trackingPermissionProvider =
    NotifierProvider<TrackingPermissionNotifier, TrackingStatus>(
      TrackingPermissionNotifier.new,
    );
