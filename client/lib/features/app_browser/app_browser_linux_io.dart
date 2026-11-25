import 'dart:convert';
import 'dart:io';

import 'app_browser_service.dart';

/// Reads `/etc/os-release` synchronously on Linux; null elsewhere or on error.
String? readOsReleaseSync() {
  if (!Platform.isLinux) return null;
  try {
    return File('/etc/os-release').readAsStringSync();
  } catch (_) {
    return null;
  }
}

/// Resolves `$XDG_DATA_HOME/casama/app-browser-device` (default `~/.local/share/casama/app-browser-device`).
String linuxTokenFilePath({Map<String, String>? environment}) {
  final env = environment ?? Platform.environment;
  final xdg = env['XDG_DATA_HOME'];
  final base = (xdg != null && xdg.isNotEmpty)
      ? xdg
      : '${env['HOME'] ?? '.'}/.local/share';
  return '$base/casama/app-browser-device';
}

/// `~/Library/Application Support/casama/app-browser-device`; in the sandbox `HOME` is the app's
/// own container, so the file is private to Casama.
String macTokenFilePath({Map<String, String>? environment}) {
  final env = environment ?? Platform.environment;
  return '${env['HOME'] ?? '.'}/Library/Application Support/casama/app-browser-device';
}

/// The macOS fallback when the Keychain refuses the token (see createAppBrowserTokenStore).
AppBrowserTokenStore createMacFileTokenStore({String? path}) =>
    FileAppBrowserTokenStore(path: path ?? macTokenFilePath());

/// Creates a mode-0600 file-backed token store for Linux desktops without a Secret Service (§2).
AppBrowserTokenStore createLinuxFileTokenStore({String? path}) =>
    FileAppBrowserTokenStore(path: path ?? linuxTokenFilePath());

/// Mode-0600 JSON file storing in-app browser device tokens when libsecret is unavailable.
class FileAppBrowserTokenStore implements AppBrowserTokenStore {
  FileAppBrowserTokenStore({required this.path});

  final String path;

  Future<Map<String, String>> _readAll() async {
    final f = File(path);
    if (!await f.exists()) return {};
    try {
      final raw = jsonDecode(await f.readAsString());
      if (raw is Map) {
        return {
          for (final e in raw.entries)
            if (e.key is String && e.value is String)
              e.key as String: e.value as String,
        };
      }
    } catch (_) {}
    return {};
  }

  Future<void> _writeAll(Map<String, String> map) async {
    final f = File(path);
    if (map.isEmpty) {
      if (await f.exists()) await f.delete();
      return;
    }
    await f.parent.create(recursive: true);
    await f.writeAsString(jsonEncode(map), flush: true);
    if (Platform.isLinux || Platform.isMacOS) {
      await Process.run('chmod', ['600', f.path]);
    }
  }

  @override
  Future<String?> read(String deviceId) async => (await _readAll())[deviceId];

  @override
  Future<void> write(String deviceId, String token) async {
    final map = await _readAll();
    map[deviceId] = token;
    await _writeAll(map);
  }

  @override
  Future<void> delete(String deviceId) async {
    final map = await _readAll();
    if (map.remove(deviceId) != null) {
      await _writeAll(map);
    }
  }
}
