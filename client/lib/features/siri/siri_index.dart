import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/providers.dart';
import '../app_lock/app_lock.dart';
import 'siri_bridge.dart' show siriChannelName;

/// Spotlight, what is on screen, and donations (docs/SIRI-AI-PLAN.md Phase 2, §6.4–§6.6).
///
/// Dart → native over `casama/siri`:
/// - `index` (`bots`, `routines`, `chats`; all empty to clear): what Spotlight and Siri may find.
///   Names and titles only, never words from a chat (§4.4).
/// - `screen` (`kind`: `bot` or `chat`, `id`, `bot_id`; null when neither is open): the entity on
///   screen, so Siri AI knows what "this chat" means (§6.5).
/// - `donate` (`kind`: `ask` with `bot_id`, or `run` with `routine_id` and `name`): something the
///   person just did by hand, so Siri can suggest it (§6.6).

bool get _apple => !kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS);

const _channel = MethodChannel(siriChannelName);

/// **Show in Spotlight and Siri** (Settings → Privacy; decision 5): on by default, kept on this
/// device.
class SiriSpotlight extends Notifier<bool> {
  static const prefKey = 'casama.siri.spotlight';

  @override
  bool build() {
    SharedPreferences.getInstance()
        .then((p) {
          final saved = p.getBool(prefKey) ?? true;
          if (ref.mounted && saved != state) state = saved;
        })
        .catchError((_) {});
    return true;
  }

  Future<void> set(bool on) async {
    state = on;
    try {
      await (await SharedPreferences.getInstance()).setBool(prefKey, on);
    } catch (_) {}
  }
}

final siriSpotlightProvider = NotifierProvider<SiriSpotlight, bool>(SiriSpotlight.new);

/// Whether chats may be listed for Spotlight and Siri, and anything set on screen: signed in, the
/// switch on, and no app lock (on for this person, or asked for by a workspace).
final siriIndexAllowedProvider = Provider<bool>((ref) {
  if (ref.watch(signedInProvider).value != true) return false;
  if (!ref.watch(siriSpotlightProvider)) return false;
  if (ref.watch(appLockRequiredByProvider) != null) return false;
  return !ref.watch(appLockSettingsProvider).activeFor(ref.watch(backendProvider).userId);
});

/// How many chats Spotlight gets, newest first (§6.3).
const siriChatsMax = 50;

/// The newest chats across [convs] (per bot), as the index and the intents list them: ids, titles
/// and the bot's name; chats without a title are left out (there is nothing to find them by).
List<Map<String, Object?>> siriChats(List<Bot> bots, Map<String, List<Conversation>> convs) {
  final names = {for (final b in bots) b.id: b.name};
  final all = [
    for (final e in convs.entries)
      for (final c in e.value)
        if ((c.title ?? '').trim().isNotEmpty && names.containsKey(e.key)) (c, e.key),
  ]..sort((a, b) => (b.$1.lastMessageAt ?? b.$1.createdAt).compareTo(a.$1.lastMessageAt ?? a.$1.createdAt));
  return [
    for (final (c, botId) in all.take(siriChatsMax))
      {
        'id': c.id,
        'name': c.title!.trim(),
        'detail': names[botId],
        'bot_id': botId,
        'at': (c.lastMessageAt ?? c.createdAt).toUtc().toIso8601String(),
      },
  ];
}

/// Tells native code what Spotlight may hold. [list] is the shortcuts list (`bots`, `routines`,
/// `chats`); null clears the index.
Future<void> siriIndex(Map<String, Object?>? list) async {
  if (!_apple) return;
  try {
    await _channel.invokeMethod<void>('index', list ?? const {'bots': [], 'routines': [], 'chats': []});
  } catch (_) {}
}

/// The bot or chat a path shows, as `screen` names it; null for anything else.
Map<String, Object?>? siriScreenFor(Uri uri) {
  final s = uri.pathSegments;
  if (s.length == 3 && s[0] == 'bots' && s[2] == 'chat') {
    final c = uri.queryParameters['c'];
    return c == null || c.isEmpty ? {'kind': 'bot', 'id': s[1], 'bot_id': s[1]} : {'kind': 'chat', 'id': c, 'bot_id': s[1]};
  }
  return null;
}

String? _lastScreen;

/// Tells native code what is on screen (null: nothing it can name). Only changes are sent.
Future<void> siriScreen(Map<String, Object?>? screen) async {
  if (!_apple) return;
  final key = screen?.toString();
  if (key == _lastScreen) return;
  _lastScreen = key;
  try {
    await _channel.invokeMethod<void>('screen', screen);
  } catch (_) {
    _lastScreen = null;
  }
}

/// Donates something the person did by hand (§6.6): `ask` from Quick ask, `run` from Run now.
Future<void> siriDonate(Map<String, Object?> what) async {
  if (!_apple) return;
  try {
    await _channel.invokeMethod<void>('donate', what);
  } catch (_) {}
}
