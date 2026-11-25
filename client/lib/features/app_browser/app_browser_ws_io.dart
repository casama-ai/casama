import 'dart:async';
import 'dart:io';

import 'app_browser_socket.dart';

/// The device socket over dart:io (phones).
AppBrowserTransport createAppBrowserTransport() => _IoTransport();

class _IoTransport implements AppBrowserTransport {
  @override
  Future<AppBrowserConnection> connect(
    Uri url,
    Map<String, String> headers,
  ) async {
    final WebSocket ws;
    try {
      ws = await WebSocket.connect(url.toString(), headers: headers);
    } on WebSocketException catch (e) {
      if (e.httpStatusCode == 401) {
        throw const AppBrowserTokenRejected();
      }
      rethrow;
    }
    // Pings find a dead connection (a network change, sleep) so the loop dials again.
    ws.pingInterval = const Duration(seconds: 20);
    return _IoConnection(ws);
  }
}

class _IoConnection implements AppBrowserConnection {
  _IoConnection(this._ws);
  final WebSocket _ws;

  @override
  Stream<String> get messages => _ws.where((m) => m is String).cast<String>();

  @override
  void send(String message) {
    if (_ws.readyState == WebSocket.open) _ws.add(message);
  }

  @override
  Future<void> close() => _ws.close();
}

/// "iOS 26.1", "macOS 15.2", "Ubuntu 24.04.1 LTS", "Windows 11 (26200)" or "Android", for
/// `x-casama-os`; null elsewhere.
String? appBrowserOsLabel() {
  try {
    final v = RegExp(r'\d+(\.\d+)*')
        .firstMatch(Platform.operatingSystemVersion)
        ?.group(0);
    if (Platform.isIOS) return v == null ? 'iOS' : 'iOS $v';
    if (Platform.isMacOS) return v == null ? 'macOS' : 'macOS $v';
    if (Platform.isLinux) {
      try {
        final release = File('/etc/os-release').readAsStringSync();
        final pretty = RegExp(r'^PRETTY_NAME="?([^"\n]+)"?\s*$', multiLine: true)
            .firstMatch(release)
            ?.group(1)
            ?.trim();
        if (pretty != null && pretty.isNotEmpty) return pretty;
      } catch (_) {}
      return 'Linux';
    }
    if (Platform.isWindows) return windowsOsLabel(Platform.operatingSystemVersion);
    // Dart reports the kernel's version on Android, not the system's.
    if (Platform.isAndroid) return 'Android';
  } catch (_) {}
  return null;
}

/// "Windows 11 (26200)" or "Windows 10 (19045)" from Dart's Windows version string
/// (`"Windows 10 Pro" 10.0 (Build 26200)`): Windows 11 still reports 10.0, so builds 22000 and
/// later are Windows 11.
String windowsOsLabel(String version) {
  final build = int.tryParse(RegExp(r'Build (\d+)').firstMatch(version)?.group(1) ?? '');
  if (build == null) return 'Windows';
  return build >= 22000 ? 'Windows 11 ($build)' : 'Windows 10 ($build)';
}
