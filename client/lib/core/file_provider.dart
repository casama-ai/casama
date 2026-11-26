import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'age_range.dart';
import 'providers.dart';

/// Read-only File Provider bridge (docs/APPLE-INTEGRATIONS-PLAN.md §8).
/// Stores the `cfk_` key in the shared Keychain and registers/removes the "Casama Computers"
/// `NSFileProviderDomain` in Files (iOS) and Finder (macOS).
class FileProviderService {
  FileProviderService({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel('casama/file_provider');

  final MethodChannel _channel;

  bool get _isApple =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS);

  Future<bool> isSupported() async {
    if (!_isApple) return false;
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
    if (!_isApple) return false;
    try {
      return await _channel.invokeMethod<bool>('setKey', {
            'key': key,
            'api_url': apiUrl,
            'org_id': orgId,
          }) ??
          false;
    } catch (_) {
      return false;
    }
  }

  Future<void> clearKey() async {
    if (!_isApple) return;
    try {
      await _channel.invokeMethod<void>('clearKey');
    } catch (_) {
      // Best-effort cleanup on sign-out.
    }
  }
}

final fileProviderServiceProvider = Provider<FileProviderService>(
  (ref) => FileProviderService(),
);

/// Provisions a read-only `cfk_` key for Files (iOS) / Finder (macOS) once per `(userId, orgId)`
/// and clears it on sign-out or when the account is restricted (teen/under-13).
final fileProviderSyncProvider = Provider<void>((ref) {
  var busy = false;

  Future<void> sync() async {
    if (busy) return;
    final service = ref.read(fileProviderServiceProvider);
    final backend = ref.read(backendProvider);
    final userId = backend.userId;
    final orgId = ref.read(currentOrgIdProvider);
    final restricted =
        ref.read(isTeenModeProvider) || ref.read(isUnder13BlockedProvider);

    if (userId == null || restricted) {
      await service.clearKey();
      return;
    }
    if (orgId == null || !await service.isSupported()) return;

    busy = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final prefKey = 'file_provider.key.$userId.$orgId';
      if (prefs.getString(prefKey) != null) return;
      final platform = defaultTargetPlatform == TargetPlatform.macOS
          ? FileKeyCreatePlatformEnum.macos
          : FileKeyCreatePlatformEnum.ios;
      final created = await backend.createFileKey(
        orgId: orgId,
        platform: platform,
        label: platform == FileKeyCreatePlatformEnum.macos ? 'Mac Finder' : 'iPhone Files',
      );
      if (!ref.mounted) return;
      final ok = await service.setKey(
        key: created.key,
        apiUrl: backend.apiUrl,
        orgId: orgId,
      );
      if (ok) {
        await prefs.setString(prefKey, created.id);
      }
    } catch (_) {
      // Best-effort provisioning; retried on next launch or workspace switch.
    } finally {
      busy = false;
    }
  }

  ref.listen(signedInProvider, (_, next) {
    if (next.value == false) {
      unawaited(ref.read(fileProviderServiceProvider).clearKey());
    } else if (next.value == true) {
      unawaited(sync());
    }
  }, fireImmediately: true);

  ref.listen(currentOrgIdProvider, (_, _) => unawaited(sync()));
  ref.listen(ageBandProvider, (_, _) => unawaited(sync()));
});
