import 'dart:async';

import 'package:flutter/foundation.dart';

import 'app_browser_linux_stub.dart'
    if (dart.library.io) 'app_browser_linux_io.dart'
    as io;
import 'app_browser_service.dart';

export 'app_browser_overlay_guard.dart';

/// Picks the distro-appropriate package-manager command to install WebKitGTK 4.1
/// from `/etc/os-release` contents (docs/LINUX-BROWSER-PLAN.md §2).
String linuxWebKitInstallCommand({String? osRelease}) {
  final text = (osRelease ?? '').toLowerCase();
  String field(String key) {
    final m = RegExp(
      '^$key="?([^"\\n]+)"?\\s*\$',
      multiLine: true,
    ).firstMatch(text);
    return m?.group(1) ?? '';
  }

  final ids = '${field('id')} ${field('id_like')}';
  final tokens = ids.split(RegExp(r'\s+')).where((t) => t.isNotEmpty).toSet();
  if (tokens.contains('fedora') ||
      tokens.contains('rhel') ||
      tokens.contains('centos') ||
      tokens.contains('rocky') ||
      tokens.contains('almalinux')) {
    return 'sudo dnf install webkit2gtk4.1';
  }
  if (tokens.contains('arch') ||
      tokens.contains('manjaro') ||
      tokens.contains('endeavouros') ||
      tokens.contains('cachyos')) {
    return 'sudo pacman -S webkit2gtk-4.1';
  }
  if (tokens.contains('opensuse') ||
      tokens.contains('opensuse-tumbleweed') ||
      tokens.contains('opensuse-leap') ||
      tokens.contains('suse')) {
    return 'sudo zypper install libwebkit2gtk-4_1-0';
  }
  return 'sudo apt install libwebkit2gtk-4.1-0';
}

/// Reads `/etc/os-release` on Linux and returns the WebKitGTK 4.1 install command.
String currentLinuxWebKitInstallCommand() =>
    linuxWebKitInstallCommand(osRelease: io.readOsReleaseSync());

/// Creates the Linux token store: Secret Service first, falling back to a mode-0600 file at
/// `$XDG_DATA_HOME/casama/app-browser-device` when no Secret Service is running (§2).
///
/// macOS gets the same fallback, a mode-0600 file in the app's Application Support folder (inside
/// its sandbox container): when the Keychain refuses the write (-34018 "A required entitlement is
/// not present" on a build signed without a team), the device would otherwise pair but never
/// connect, with nothing on screen to say why.
AppBrowserTokenStore createAppBrowserTokenStore(AppBrowserTokenStore primary) {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.linux) {
    return FallbackAppBrowserTokenStore(
      primary: primary,
      fallback: io.createLinuxFileTokenStore(),
    );
  }
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.macOS) {
    return FallbackAppBrowserTokenStore(
      primary: primary,
      fallback: io.createMacFileTokenStore(),
    );
  }
  return primary;
}

/// Tries [primary] (Secret Service via `flutter_secure_storage`), falling back to [fallback]
/// (a mode-0600 file) when Secret Service is unavailable on minimal Linux desktops (§2).
class FallbackAppBrowserTokenStore implements AppBrowserTokenStore {
  FallbackAppBrowserTokenStore({required this.primary, required this.fallback});

  final AppBrowserTokenStore primary;
  final AppBrowserTokenStore fallback;

  @override
  Future<String?> read(String deviceId) async {
    try {
      final v = await primary.read(deviceId);
      if (v != null && v.isNotEmpty) return v;
    } catch (_) {
      // Secret Service unavailable; try the 0600 fallback file below.
    }
    try {
      return await fallback.read(deviceId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> write(String deviceId, String token) async {
    try {
      await primary.write(deviceId, token);
      // Clean any stale fallback entry once Secret Service succeeds.
      unawaited(fallback.delete(deviceId).catchError((_) {}));
      return;
    } catch (_) {
      await fallback.write(deviceId, token);
    }
  }

  @override
  Future<void> delete(String deviceId) async {
    try {
      await primary.delete(deviceId);
    } catch (_) {}
    try {
      await fallback.delete(deviceId);
    } catch (_) {}
  }
}
