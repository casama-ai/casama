import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

const _installIdKey = 'push.client_id';

/// A random id for this app install, kept across launches. Chat focus (D-325), the in-app browser's
/// pairing and each sent message (D-519) carry it, so the server can tell the person's devices apart.
Future<String> installId([SharedPreferences? prefs]) async {
  final store = prefs ?? await SharedPreferences.getInstance();
  final existing = store.getString(_installIdKey);
  if (existing != null && existing.isNotEmpty) return existing;
  final random = Random.secure();
  final id = [for (var i = 0; i < 16; i++) random.nextInt(256).toRadixString(16).padLeft(2, '0')].join();
  await store.setString(_installIdKey, id);
  return id;
}
