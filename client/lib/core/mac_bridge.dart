import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

import '../features/bots/bots_screen.dart' show CreateBotSheet;
import '../features/chat/chat_controller.dart';
import '../features/groups/group_chats.dart' show groupChatsProvider;
import '../features/home/home_shell.dart' show groupBotsByFolder;
import '../features/search/search_view.dart';
import '../ui/adaptive_modal.dart';
import 'backend.dart' show BotFolder;
import 'providers.dart';
import 'router.dart';
import 'updater.dart';
import 'analytics.dart';
import 'remote_content.dart';

/// Where Help in the menu bar goes (overridable per build until the docs site has its address).
const kHelpUrl = String.fromEnvironment('CASAMA_HELP_URL', defaultValue: 'https://docs.casama.ai');

const _channel = MethodChannel('casama/mac');

bool get _isMac => !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;

/// The Mac app's menu bar actions (File, Go, Settings…, Help) and its dock badge: the count of
/// what waits for you, the same as the Inbox badge. Watched by the app root on macOS.
final macBridgeProvider = Provider<void>((ref) {
  if (!_isMac) return;
  _channel.setMethodCallHandler((call) async {
    if (call.method == 'menu' && call.arguments is String) await _menu(ref, call.arguments as String);
    return null;
  });
  ref.onDispose(() => _channel.setMethodCallHandler(null));
  // The bot whose chat was on screen last, for New Chat from anywhere else (E1).
  final delegate = ref.read(routerProvider).routerDelegate;
  void remember() {
    final bot = _botChat.firstMatch(delegate.currentConfiguration.uri.path)?.group(1);
    if (bot != null) _lastChatBot = bot;
  }

  delegate.addListener(remember);
  ref.onDispose(() => delegate.removeListener(remember));
  ref.listen<int>(inboxBadgeProvider, (_, count) => unawaited(_channel.invokeMethod('badge', count).catchError((_) => null)), fireImmediately: true);
});

Future<void> _menu(Ref ref, String action) async {
  Analytics.feature('mac_menu');
  final router = ref.read(routerProvider);
  final context = router.routerDelegate.navigatorKey.currentContext;
  switch (action) {
    case 'settings':
      router.go('/settings');
    case 'newChat':
      // In a bot's chat: a fresh conversation there, with the old one's address gone (it brought
      // the old chat back). Elsewhere: a fresh chat with the bot used last; no bots: the bots.
      final uri = router.routerDelegate.currentConfiguration.uri;
      final bot = newChatBot(
        location: uri,
        lastChatBot: _lastChatBot,
        bots: ref.read(botsProvider).value ?? const [],
        folders: ref.read(botFoldersProvider).value ?? const [],
        groupIds: {for (final g in ref.read(groupChatsProvider).value ?? const <Conversation>[]) g.id},
      );
      if (bot == null) {
        router.go('/bots');
        return;
      }
      final chat = ref.read(chatControllerProvider(bot).notifier);
      final target = '/bots/$bot/chat';
      if (uri.toString() == target) {
        await chat.newChat();
      } else {
        await chat.newChat(keepOnNextOpen: true);
        router.go(target);
      }
    case 'newBot':
      if (context != null && context.mounted) await showAdaptiveSheet<void>(context: context, contentPadsBottom: true, builder: (_) => const CreateBotSheet());
    case 'search':
      if (context != null && context.mounted) await showWorkspaceSearch(context);
    case 'checkUpdates':
      await checkForUpdatesNow();
    case 'help':
      await launchUrl(remoteUri('docs', kHelpUrl), mode: LaunchMode.externalApplication);
    default:
      if (action.startsWith('go:/')) router.go(action.substring(3));
  }
}

final _botChat = RegExp(r'^/bots/([^/]+)/chat');
String? _lastChatBot;

/// Which bot File > New Chat starts a chat with (E1), or null for the bots list: the bot whose
/// chat [location] is (not a group chat shown there), else [lastChatBot] while it is still one of
/// [bots], else the bot the person wrote to last, else the first bot in the sidebar's order.
@visibleForTesting
String? newChatBot({
  required Uri location,
  required String? lastChatBot,
  required List<Bot> bots,
  List<BotFolder> folders = const [],
  Set<String> groupIds = const {},
}) {
  final here = _botChat.firstMatch(location.path)?.group(1);
  if (here != null && !groupIds.contains(location.queryParameters['c'])) return here;
  if (bots.isEmpty) return null;
  if (lastChatBot != null && bots.any((b) => b.id == lastChatBot)) return lastChatBot;
  Bot? wrote;
  for (final b in bots) {
    final m = b.lastMessage;
    if (m == null || m.from != BotLastMessageFromEnum.you) continue;
    if (wrote == null || m.at.isAfter(wrote.lastMessage!.at)) wrote = b;
  }
  if (wrote != null) return wrote.id;
  return groupBotsByFolder(bots, folders).firstOrNull?.$2.firstOrNull?.id;
}

/// "Open at login" (macOS 13+): null where the system can't do it.
final launchAtLoginProvider = FutureProvider<bool?>((ref) async {
  if (!_isMac) return null;
  try {
    return await _channel.invokeMethod<bool>('launchAtLogin');
  } catch (_) {
    return null;
  }
});

Future<bool?> setLaunchAtLogin(bool on) => _channel.invokeMethod<bool>('setLaunchAtLogin', on);
