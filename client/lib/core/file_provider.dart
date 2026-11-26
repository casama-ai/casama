import 'dart:async';
import 'dart:convert';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'age_range.dart';
import 'backend.dart';
import 'providers.dart';

/// Read-only File Provider bridge (docs/APPLE-INTEGRATIONS-PLAN.md §8).
/// Stores the `cfk_` key in the shared Keychain and registers/removes the "Casama Computers"
/// `NSFileProviderDomain` in Files (iOS) and Finder (macOS).
class FileProviderService {
  FileProviderService({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel('casama/file_provider');

  final MethodChannel _channel;

  /// iPhone, iPad and the Mac: the only places with a File Provider. Elsewhere nothing here runs.
  bool get isPlatformSupported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS);

  Future<bool> isSupported() async {
    if (!isPlatformSupported) return false;
    try {
      return await _channel.invokeMethod<bool>('isSupported') ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> setKey({
    required String key,
    required String apiUrl,
    required String orgId,
  }) async {
    if (!isPlatformSupported) return false;
    try {
      return await _channel.invokeMethod<bool>('setKey', {
            'key': key,
            'api_url': apiUrl,
            'org_id': orgId,
          }) ??
          false;
    } catch (e) {
      debugPrint('file provider setKey failed: $e');
      return false;
    }
  }

  Future<void> clearKey() async {
    if (!isPlatformSupported) return;
    try {
      await _channel.invokeMethod<void>('clearKey');
    } catch (e) {
      // Best-effort cleanup on sign-out.
      debugPrint('file provider clearKey failed: $e');
    }
  }
}

final fileProviderServiceProvider = Provider<FileProviderService>(
  (ref) => FileProviderService(),
);

/// Which File Provider key this device holds (§8): its server id and the account and workspace it
/// was made for. The key itself never comes here: native code keeps it in the shared Keychain, so
/// signing out, teen mode or another workspace can take it back on the server by id, the way the
/// widget key works (widget_key_store.dart).
@immutable
class FileProviderKeyRecord {
  const FileProviderKeyRecord({
    required this.id,
    required this.userId,
    required this.orgId,
  });

  final String id;
  final String userId;
  final String orgId;

  Map<String, Object?> toJson() => {'id': id, 'user_id': userId, 'org_id': orgId};

  static FileProviderKeyRecord? fromJson(Object? json) {
    if (json is! Map ||
        json['id'] is! String ||
        json['user_id'] is! String ||
        json['org_id'] is! String) {
      return null;
    }
    return FileProviderKeyRecord(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      orgId: json['org_id'] as String,
    );
  }
}

/// The record of this device's key, plus the keys still to revoke on the server: ones dropped while
/// the session couldn't delete them (offline, or the session had already ended), each kept with
/// the account that owns it until that account is signed in here again.
abstract final class FileProviderKeyStore {
  static const prefKey = 'casama.file_provider.key';
  static const revokeKey = 'casama.file_provider.revoke';

  /// Builds before this store kept one key per account and workspace under this prefix, and
  /// never removed them, so a sign-out left Files and Finder without a key for good.
  static const legacyPrefix = 'file_provider.key.';

  /// At most this many keys wait to be revoked; the server trims old keys too.
  static const maxPending = 20;

  static Future<FileProviderKeyRecord?> load() async {
    try {
      final raw = (await SharedPreferences.getInstance()).getString(prefKey);
      return raw == null ? null : FileProviderKeyRecord.fromJson(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }

  static Future<void> save(FileProviderKeyRecord record) async {
    try {
      await (await SharedPreferences.getInstance()).setString(prefKey, jsonEncode(record.toJson()));
    } catch (e) {
      debugPrint('file provider key record not saved: $e');
    }
  }

  static Future<void> clear() async {
    try {
      await (await SharedPreferences.getInstance()).remove(prefKey);
    } catch (_) {}
  }

  static Future<List<({String id, String userId})>> pending() async {
    try {
      final raw = (await SharedPreferences.getInstance()).getString(revokeKey);
      if (raw == null) return const [];
      final list = jsonDecode(raw);
      if (list is! List) return const [];
      return [
        for (final e in list)
          if (e is Map && e['id'] is String && e['user_id'] is String)
            (id: e['id'] as String, userId: e['user_id'] as String),
      ];
    } catch (_) {
      return const [];
    }
  }

  static Future<void> setPending(List<({String id, String userId})> keys) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (keys.isEmpty) {
        await prefs.remove(revokeKey);
        return;
      }
      final kept = keys.length > maxPending ? keys.sublist(keys.length - maxPending) : keys;
      await prefs.setString(
        revokeKey,
        jsonEncode([
          for (final k in kept) {'id': k.id, 'user_id': k.userId},
        ]),
      );
    } catch (e) {
      debugPrint('file provider revoke list not saved: $e');
    }
  }

  static Future<void> addPending(String id, String userId) async {
    final keys = [...await pending()];
    if (keys.any((k) => k.id == id)) return;
    keys.add((id: id, userId: userId));
    await setPending(keys);
  }

  /// Moves the old per-account records into the revoke list and removes them.
  static Future<void> migrateLegacy() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final old = prefs.getKeys().where((k) => k.startsWith(legacyPrefix)).toList();
      for (final k in old) {
        final id = prefs.getString(k);
        // `file_provider.key.<user>.<org>`: user ids are UUIDs, so they hold no dots.
        final rest = k.substring(legacyPrefix.length);
        final dot = rest.indexOf('.');
        final userId = dot > 0 ? rest.substring(0, dot) : '';
        if (id != null && id.isNotEmpty && userId.isNotEmpty) await addPending(id, userId);
        await prefs.remove(k);
      }
    } catch (e) {
      debugPrint('file provider legacy keys not migrated: $e');
    }
  }
}

/// Keeps Files (iOS) and Finder (macOS) holding one read-only key, made for the signed-in account
/// and the current workspace (§8):
///
/// - signed in, not restricted, a workspace: a key is made, handed to native code and its id kept;
///   a kept key the server no longer lists (revoked elsewhere, trimmed) is made again;
/// - another workspace or account: the old key is revoked and a new one made;
/// - signing out (while the session still works, [beforeSignOut]), teen mode or under 13: the key
///   is revoked, its record removed and the Files/Finder location taken away.
///
/// Public for tests.
class FileProviderSync {
  FileProviderSync(this._ref);

  final Ref _ref;
  Future<void>? _running;
  var _again = false;

  /// One run at a time; a call during a run makes one more run after it, so the last state wins.
  Future<void> sync() {
    final running = _running;
    if (running != null) {
      _again = true;
      return running;
    }
    return _running = _loop().whenComplete(() => _running = null);
  }

  Future<void> _loop() async {
    do {
      _again = false;
      try {
        await _sync();
      } catch (e) {
        // Retried on the next sign-in, workspace switch or launch.
        debugPrint('file provider sync failed: $e');
      }
    } while (_again && _ref.mounted);
  }

  Future<void> _sync() async {
    final service = _ref.read(fileProviderServiceProvider);
    if (!service.isPlatformSupported) return;
    final backend = _ref.read(backendProvider);
    final userId = backend.isSignedIn ? backend.userId : null;
    final orgId = _ref.read(currentOrgIdProvider);
    final restricted =
        _ref.read(isTeenModeProvider) || _ref.read(isUnder13BlockedProvider);

    await FileProviderKeyStore.migrateLegacy();
    if (userId != null) await _revokePending(backend, userId);
    // Signed in while the workspaces load: nothing to decide yet, and the key stays.
    if (userId != null && !restricted && orgId == null) return;

    var record = await FileProviderKeyStore.load();
    final wanted = userId != null && !restricted && orgId != null;
    if (record != null &&
        (!wanted || record.userId != userId || record.orgId != orgId)) {
      await FileProviderKeyStore.clear();
      await _revoke(backend, record, signedInAs: userId);
      record = null;
    }
    if (userId == null || restricted || orgId == null) {
      await service.clearKey();
      return;
    }
    if (!await service.isSupported() || !_ref.mounted) return;

    if (record != null) {
      // The record alone isn't proof: the key may have been revoked from another device or trimmed
      // by the server, and Files would then fail on every request.
      final List<FileKey> keys;
      try {
        keys = await backend.listFileKeys();
      } catch (e) {
        // Offline: keep what's there and check again next time.
        debugPrint('file provider key check failed: $e');
        return;
      }
      if (keys.any((k) => k.id == record!.id)) return;
      debugPrint('file provider key ${record.id} is gone on the server; making a new one');
      await FileProviderKeyStore.clear();
    }

    final platform = defaultTargetPlatform == TargetPlatform.macOS
        ? FileKeyCreatePlatformEnum.macos
        : FileKeyCreatePlatformEnum.ios;
    final created = await backend.createFileKey(
      orgId: orgId,
      platform: platform,
      label: platform == FileKeyCreatePlatformEnum.macos ? 'Mac Finder' : 'iPhone Files',
    );
    final made = FileProviderKeyRecord(id: created.id, userId: userId, orgId: orgId);
    if (!_ref.mounted) {
      await _revoke(backend, made, signedInAs: userId);
      return;
    }
    final ok = await service.setKey(
      key: created.key,
      apiUrl: backend.apiUrl,
      orgId: orgId,
    );
    if (!ok) {
      // Native code didn't take it: don't leave a key nobody holds.
      await _revoke(backend, made, signedInAs: userId);
      return;
    }
    await FileProviderKeyStore.save(made);
  }

  /// Signing out, while the session still works: the server forgets the key, then the device does.
  Future<void> beforeSignOut() async {
    final service = _ref.read(fileProviderServiceProvider);
    if (!service.isPlatformSupported) return;
    try {
      await _running;
    } catch (_) {}
    final backend = _ref.read(backendProvider);
    final userId = backend.userId;
    final record = await FileProviderKeyStore.load();
    if (record != null) {
      await FileProviderKeyStore.clear();
      await _revoke(backend, record, signedInAs: userId);
    }
    if (userId != null) await _revokePending(backend, userId);
    await service.clearKey();
  }

  /// Deletes [record]'s key on the server when [signedInAs] owns it; otherwise, or when that
  /// fails, keeps it to revoke the next time its account is signed in here.
  Future<void> _revoke(
    Backend backend,
    FileProviderKeyRecord record, {
    required String? signedInAs,
  }) async {
    if (signedInAs != record.userId || !await _delete(backend, record.id)) {
      await FileProviderKeyStore.addPending(record.id, record.userId);
    }
  }

  Future<void> _revokePending(Backend backend, String userId) async {
    final keys = await FileProviderKeyStore.pending();
    if (!keys.any((k) => k.userId == userId)) return;
    final left = <({String id, String userId})>[];
    for (final k in keys) {
      if (k.userId != userId || !await _delete(backend, k.id)) left.add(k);
    }
    await FileProviderKeyStore.setPending(left);
  }

  /// True when the key is gone on the server (deleted now, or already).
  Future<bool> _delete(Backend backend, String id) async {
    try {
      await backend.deleteFileKey(id).timeout(const Duration(seconds: 5));
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return true;
      debugPrint('file provider key revoke failed: $e');
      return false;
    } catch (e) {
      debugPrint('file provider key revoke failed: $e');
      return false;
    }
  }
}

/// Provisions and revokes the read-only `cfk_` key for Files (iOS) / Finder (macOS): see
/// [FileProviderSync]. Kept alive by the app.
final fileProviderSyncProvider = Provider<FileProviderSync>((ref) {
  final sync = FileProviderSync(ref);
  final backend = ref.read(backendProvider);
  backend.addBeforeSignOut(sync.beforeSignOut);
  ref.onDispose(() => backend.removeBeforeSignOut(sync.beforeSignOut));

  ref.listen(signedInProvider, (_, next) {
    if (next.hasValue) unawaited(sync.sync());
  }, fireImmediately: true);
  ref.listen(currentOrgIdProvider, (_, _) => unawaited(sync.sync()));
  ref.listen(ageBandProvider, (_, _) => unawaited(sync.sync()));
  return sync;
});
