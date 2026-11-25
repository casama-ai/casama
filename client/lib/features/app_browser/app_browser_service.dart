import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/backend.dart';
import '../../core/chat_focus.dart';
import '../../core/providers.dart';
import '../../core/remote_config.dart' show appVersionProvider;
import 'app_browser_channel.dart';
import 'app_browser_controller.dart';
import 'app_browser_flag.dart';
import 'app_browser_linux.dart';
import 'app_browser_socket.dart';
import 'app_browser_ws_stub.dart'
    if (dart.library.io) 'app_browser_ws_io.dart'
    as ws;

/// SharedPreferences key marking a workspace where the person manually unpaired this device, so
/// automatic pairing stays off until they switch it back on in Settings.
const _optedOutPrefix = 'casama.app_browser.opted_out.';

/// Default device display name for automatic pairing (plan §1.3, Linux plan §2).
String defaultAppBrowserDeviceName(String system) => switch (system) {
  'ios' => 'iPhone',
  'macos' => 'Mac',
  'linux' => 'Linux Computer',
  'windows' => 'Windows PC',
  _ => 'Android Phone',
};

/// Where this phone keeps its browser's device token (it comes back once, at pairing).
abstract interface class AppBrowserTokenStore {
  Future<String?> read(String deviceId);
  Future<void> write(String deviceId, String token);
  Future<void> delete(String deviceId);
}

class SecureAppBrowserTokenStore implements AppBrowserTokenStore {
  static const _secure = FlutterSecureStorage();
  String _key(String deviceId) => 'casama.app_browser.$deviceId';

  @override
  Future<String?> read(String deviceId) => _secure.read(key: _key(deviceId));
  @override
  Future<void> write(String deviceId, String token) =>
      _secure.write(key: _key(deviceId), value: token);
  @override
  Future<void> delete(String deviceId) => _secure.delete(key: _key(deviceId));
}

/// For tests.
class MemoryAppBrowserTokenStore implements AppBrowserTokenStore {
  final tokens = <String, String>{};
  @override
  Future<String?> read(String deviceId) async => tokens[deviceId];
  @override
  Future<void> write(String deviceId, String token) async =>
      tokens[deviceId] = token;
  @override
  Future<void> delete(String deviceId) async => tokens.remove(deviceId);
}

final appBrowserTokenStoreProvider = Provider<AppBrowserTokenStore>(
  (ref) => createAppBrowserTokenStore(SecureAppBrowserTokenStore()),
);
final appBrowserTransportProvider = Provider<AppBrowserTransport>(
  (ref) => defaultAppBrowserTransport(),
);

/// This install's id, the one the chat focus uses (the server pairs the phone browser with it).
final appBrowserClientIdProvider = FutureProvider<String>(
  (ref) => ref.watch(chatFocusProvider).clientId(),
);

/// Whether this person may use the phone browser here, and this install's device. Null in a build
/// without it, off a phone, or with no workspace.
final appBrowserStatusProvider = FutureProvider<AppBrowserState?>((ref) async {
  if (!kAppBrowserCode || !ref.watch(appBrowserOnProvider)) return null;
  final org = ref.watch(currentOrgIdProvider);
  final system = appBrowserSystem;
  if (org == null || system == null) return null;
  final clientId = await ref.watch(appBrowserClientIdProvider.future);
  return ref
      .watch(backendProvider)
      .appBrowserState(org, system: system, clientId: clientId);
});

/// Pairing and the device socket: pairs automatically at sign-in when available and supported
/// (docs/IN-APP-BROWSER-PLAN.md §1.3), and keeps the socket open while the app is in front (or
/// while the window is open on macOS). Kept alive by the app.
class AppBrowserService with WidgetsBindingObserver {
  AppBrowserService(this._ref) {
    WidgetsBinding.instance.addObserver(this);
    _active = _isActive(WidgetsBinding.instance.lifecycleState);
    _backend = _ref.read(backendProvider);
    _backend.addBeforeSignOut(unpairOnSignOut);
    _ref.listen(
      appBrowserStatusProvider,
      (_, next) {
        if (next.isLoading) return;
        unawaited(_sync(next.value));
      },
      fireImmediately: true,
    );
    // Ask the server again now and then while not connected: the owner may switch this system on,
    // or the workspace switch may change, while the app stays open. A desktop window never goes
    // through "back in front", so without this a Linux or Mac app learned it only on restart.
    _recheck = Timer.periodic(recheckEvery, (_) {
      if (_disposed || !_active || _socket != null) return;
      _ref.invalidate(appBrowserStatusProvider);
    });
  }

  /// How often an unconnected app asks the server again whether it may use the browser.
  static const recheckEvery = Duration(minutes: 2);
  Timer? _recheck;

  final Ref _ref;
  late final Backend _backend;
  AppBrowserSocket? _socket;
  String? _socketDevice;
  bool _active = true;
  bool _autoPairing = false;
  Future<LocalDevice>? _pairing;
  bool _disposed = false;

  /// The socket's state, for the settings screen.
  final link = ValueNotifier(AppBrowserLink.off);

  /// Phones connect while in front, including `inactive`: the app is still on screen behind Face
  /// ID, password AutoFill, Control Center or the notification shade, and a bot's step shouldn't
  /// break for a glance (D-529). macOS and Linux stay connected while the window is open (even
  /// behind another window, §4 / Linux §4.3) and drop when hidden or quitting.
  static bool _isActive(AppLifecycleState? s) =>
      s == null ||
      s == AppLifecycleState.resumed ||
      s == AppLifecycleState.inactive;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final nowActive = _isActive(state);
    if (nowActive == _active) return;
    _active = nowActive;
    unawaited(_sync(_ref.read(appBrowserStatusProvider).value));
    // Back in front: ask the server again (the stage or the workspace switch may have changed).
    if (nowActive) _ref.invalidate(appBrowserStatusProvider);
  }

  /// Called on macOS when the main window hides (close button / Cmd+W) or reopens (§4).
  void setWindowOpen(bool open) {
    if (open == _active) return;
    _active = open;
    _ref.read(chatFocusProvider).setWindowOpen(open);
    unawaited(_sync(_ref.read(appBrowserStatusProvider).value));
  }

  Future<bool> _isOptedOut(String orgId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('$_optedOutPrefix$orgId') == true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _setOptedOut(String orgId, bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (value) {
        await prefs.setBool('$_optedOutPrefix$orgId', true);
      } else {
        await prefs.remove('$_optedOutPrefix$orgId');
      }
    } catch (_) {}
  }

  Future<void> _sync(AppBrowserState? status) async {
    if (_disposed) return;
    final device = status?.device;
    final controller = _ref.read(appBrowserProvider.notifier);
    controller.device = device;
    final token = device == null
        ? null
        : await _ref.read(appBrowserTokenStoreProvider).read(device.id);

    // Automatic pairing (§1.3): when available, active, supported and not manually unpaired, pair
    // in the background without asking (or re-pair if a reinstall lost the Keychain token).
    if (status != null &&
        status.available &&
        _active &&
        !_autoPairing &&
        (device == null || (device.enabled && token == null))) {
      final org = _ref.read(currentOrgIdProvider);
      final system = appBrowserSystem;
      if (org != null && system != null) {
        _autoPairing = true;
        try {
          if (!(await _isOptedOut(org))) {
            final support = await controller.support().catchError(
              (_) => AppBrowserSupport.missing,
            );
            if (support.supported && !_disposed) {
              await pair(name: defaultAppBrowserDeviceName(system));
              return;
            }
          }
        } catch (e, st) {
          // Best effort; retries on next focus / refresh.
          debugPrint('app browser: automatic pairing failed: $e\n$st');
        } finally {
          _autoPairing = false;
        }
      }
    }

    final want =
        status != null &&
        status.available &&
        device != null &&
        device.enabled &&
        _active &&
        token != null;
    if (!want) return _stop();
    if (_socket != null && _socketDevice == device.id) return;
    await _stop();
    final version = await _ref
        .read(appVersionProvider.future)
        .catchError((_) => '');
    if (_disposed) return;
    final socket = _socket = AppBrowserSocket(
      transport: _ref.read(appBrowserTransportProvider),
      apiUrl: _ref.read(backendProvider).apiUrl,
      token: token,
      os: ws.appBrowserOsLabel(),
      version: version,
      onCall: (call) => _ref.read(appBrowserProvider.notifier).handle(call),
      onTokenRejected: () => unawaited(_tokenRejected(device.id)),
    );
    _socketDevice = device.id;
    socket.link.addListener(() => link.value = socket.link.value);
    socket.start();
  }

  /// The server refused this install's token (another pairing replaced it): forget it and look
  /// again. A device that's still on then re-pairs like after a reinstall; one turned off stays off.
  Future<void> _tokenRejected(String deviceId) async {
    if (_disposed) return;
    await _stop();
    await _ref.read(appBrowserTokenStoreProvider).delete(deviceId);
    if (!_disposed) _ref.invalidate(appBrowserStatusProvider);
  }

  Future<void> _stop() async {
    final s = _socket;
    _socket = null;
    _socketDevice = null;
    if (s == null) return;
    await s.stop();
    link.value = AppBrowserLink.off;
    // Whatever a bot was waiting on can't be answered now.
    _ref.read(appBrowserProvider.notifier).disconnected();
  }

  /// Pairs this device's browser (automatically at sign-in or when turned back on in Settings).
  Future<LocalDevice> pair({required String name}) {
    final active = _pairing;
    if (active != null) return active;
    final org = _ref.read(currentOrgIdProvider);
    final system = appBrowserSystem;
    if (org == null || system == null) {
      throw StateError('No workspace or unsupported platform');
    }
    _autoPairing = true;
    final fut = () async {
      try {
        await _setOptedOut(org, false);
        final clientId = await _ref.read(appBrowserClientIdProvider.future);
        final created = await _ref
            .read(backendProvider)
            .pairAppBrowser(org, name: name, system: system, clientId: clientId);
        await _ref
            .read(appBrowserTokenStoreProvider)
            .write(created.id, created.token);
        _ref.invalidate(appBrowserStatusProvider);
        return LocalDevice.fromJson(created.toJson()..remove('token'));
      } finally {
        _autoPairing = false;
        _pairing = null;
      }
    }();
    return _pairing = fut;
  }

  /// Whether this device still holds its token (a reinstall loses it: re-paired automatically).
  Future<bool> hasToken(String deviceId) async =>
      await _ref.read(appBrowserTokenStoreProvider).read(deviceId) != null;

  /// Forgets this device's browser: the device row and its token.
  /// When [manual] is true (from Settings), stays unpaired until the person turns it back on.
  Future<void> unpair(String deviceId, {bool manual = true}) async {
    await _stop();
    final org = _ref.read(currentOrgIdProvider);
    if (manual && org != null) await _setOptedOut(org, true);
    await _ref.read(backendProvider).deleteLocalDevice(deviceId);
    await _ref.read(appBrowserTokenStoreProvider).delete(deviceId);
    _ref.invalidate(appBrowserStatusProvider);
  }

  /// Called before signing out (§1.3, Linux §4.1): stops WebKit (so helper processes exit before
  /// deleting data/cache folders on Linux), deletes the device row and removes its token without
  /// leaving an opt-out flag for the next sign-in.
  Future<void> unpairOnSignOut() async {
    final device = _ref.read(appBrowserStatusProvider).value?.device;
    await _stop();
    if (!kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.linux ||
            defaultTargetPlatform == TargetPlatform.windows)) {
      try {
        await _ref
            .read(appBrowserChannelProvider)
            .dispose(wipeData: true)
            .timeout(const Duration(seconds: 5));
      } catch (_) {}
    }
    if (device == null) return;
    try {
      await _ref
          .read(backendProvider)
          .deleteLocalDevice(device.id)
          .timeout(const Duration(seconds: 5));
    } catch (_) {}
    try {
      await _ref.read(appBrowserTokenStoreProvider).delete(device.id);
    } catch (_) {}
  }

  void dispose() {
    _disposed = true;
    _recheck?.cancel();
    _backend.removeBeforeSignOut(unpairOnSignOut);
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_socket?.stop());
    _socket = null;
  }
}

/// Started with the app (only in builds with the phone browser, on a phone).
final appBrowserServiceProvider = Provider<AppBrowserService>((ref) {
  final s = AppBrowserService(ref);
  ref.onDispose(s.dispose);
  return s;
});
