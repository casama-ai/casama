// Siri acting through the app (docs/SIRI-AI-PLAN.md §5, §6.1, §6.4): each outcome of an ask, the
// request-id memory, the per-minute limit, the privacy rules, and what Spotlight may hold.
import 'dart:async';

import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/push.dart';
import 'package:casama/core/shortcuts.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/island/island_feed.dart';
import 'package:casama/features/island/run_tracker.dart';
import 'package:casama/features/siri/siri_bridge.dart';
import 'package:casama/features/siri/siri_index.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_backend.dart';

class _Bots extends BotsNotifier {
  _Bots(this.initial);
  final List<Bot> initial;
  @override
  Future<List<Bot>> build() async => initial;
}

/// Workspaces that arrive when the test says, as after a cold start.
class _LateOrgs extends OrganizationsNotifier {
  _LateOrgs(this.ready);
  final Future<List<OrganizationWithRole>> ready;
  @override
  Future<List<OrganizationWithRole>> build() => ready;
}

/// The bots the way the real list behaves: an empty list while there is no workspace yet, then the
/// workspace's bots once it is known.
class _WorkspaceBots extends BotsNotifier {
  _WorkspaceBots(this.bots);
  final List<Bot> bots;
  @override
  Future<List<Bot>> build() async {
    if (ref.watch(currentOrgIdProvider) == null) {
      await ref.watch(organizationsProvider.future);
      return const [];
    }
    return bots;
  }
}

class _NoPush extends PushRegistrar {
  _NoPush(Backend backend) : super(backend, (_) {});
  @override
  Future<String?> silentToken() async => null;
}

ChatMessageView _reply(String text, {String? run = runId}) =>
    ChatMessageView(id: 'r-$text', role: 'assistant', text: text, createdAt: DateTime(2026, 11, 25), runId: run);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    AppLockSettingsNotifier.resetForTest();
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  });

  tearDown(() => debugDefaultTargetPlatformOverride = null);

  ({ProviderContainer c, FakeBackend backend, SiriBridge bridge}) setUpBridge({List<Bot>? bots}) {
    final backend = FakeBackend();
    final c = ProviderContainer(
      overrides: [
        backendProvider.overrideWithValue(backend),
        pushProvider.overrideWithValue(_NoPush(backend)),
        currentOrgIdProvider.overrideWithValue(orgId),
        botsProvider.overrideWith(() => _Bots(bots ?? [backend.bot()])),
        islandLocalActivityProvider.overrideWithBuild((ref, notifier) => null),
      ],
    );
    addTearDown(c.dispose);
    // Not the provider: tests drive the bridge directly, with a short poll.
    late SiriBridge bridge;
    final probe = Provider<SiriBridge>((ref) => SiriBridge(ref, const MethodChannel('test/siri'), poll: const Duration(milliseconds: 5)));
    bridge = c.read(probe);
    return (c: c, backend: backend, bridge: bridge);
  }

  Future<Map<String, Object?>> ask(SiriBridge bridge, Map<String, Object?> args) async {
    final r = await bridge.handle(MethodCall('ask', {'wait_ms': 200, ...args}));
    return Map<String, Object?>.from(r! as Map);
  }

  test('a reply in time is spoken, and says which bot answered when none was named', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    s.backend.storedMessages = [_reply('**Done.** The list has three items left.')];
    final r = await ask(s.bridge, {'text': 'What is left?', 'request_id': 'q1'});
    expect(r['status'], SiriStatus.replied);
    expect(r['say'], 'Done. The list has three items left.');
    expect(r['answered_by'], 'Ada answered.');
    expect(r['bot_id'], botId);
    expect(r.containsKey('open'), isFalse);
    expect(s.backend.sent, ['What is left?']);
    // The run is followed like one started here (Live Activity, reply push).
    expect(s.c.read(runTrackerProvider).map((t) => t.runId), contains(runId));
  });

  test('a cold start: an ask that arrives before the bots have loaded still goes to the bot', () async {
    final s = setUpBridge();
    // No await on the bots: Siri started the app for this request.
    s.backend.storedMessages = [_reply('Hi')];
    final r = await ask(s.bridge, {'text': 'Hello'});
    expect(r['status'], SiriStatus.replied);
    expect(s.backend.sent, ['Hello']);
  });

  test('a cold start before the workspaces load: the ask waits for the real bots, not the empty list', () async {
    // Build 101: the bots list answered [] for "no workspace yet", the ask took that as "no bots"
    // and only opened the app.
    final backend = FakeBackend();
    final orgs = Completer<List<OrganizationWithRole>>();
    final c = ProviderContainer(
      overrides: [
        backendProvider.overrideWithValue(backend),
        pushProvider.overrideWithValue(_NoPush(backend)),
        organizationsProvider.overrideWith(() => _LateOrgs(orgs.future)),
        botsProvider.overrideWith(() => _WorkspaceBots([backend.bot()])),
        islandLocalActivityProvider.overrideWithBuild((ref, notifier) => null),
      ],
    );
    addTearDown(c.dispose);
    final bridge = c.read(Provider<SiriBridge>((ref) => SiriBridge(ref, const MethodChannel('test/siri'), poll: const Duration(milliseconds: 5))));
    c.listen(botsProvider, (_, _) {});
    backend.storedMessages = [_reply('Hi')];
    final answer = ask(bridge, {'text': 'Hello'});
    await Future<void>.delayed(const Duration(milliseconds: 20));
    orgs.complete(await backend.organizations());
    final r = await answer;
    expect(r['status'], SiriStatus.replied);
    expect(backend.sent, ['Hello']);
  });

  test('a repeat of the same request id gets the first answer and sends nothing again', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    s.backend.storedMessages = [_reply('Hi')];
    final a = await ask(s.bridge, {'text': 'Hello', 'request_id': 'same'});
    final b = await ask(s.bridge, {'text': 'Hello', 'request_id': 'same'});
    expect(b, a);
    expect(s.backend.sent, ['Hello']);
    expect(s.backend.sendKeys, ['same']);
  });

  test('still running when time is up: "still working", no app opening', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    s.backend.runStatus = RunStatus.running;
    final r = await ask(s.bridge, {'text': 'Long one', 'wait_ms': 30});
    expect(r['status'], SiriStatus.working);
    expect(r['say'], contains('still working'));
    expect(r.containsKey('open'), isFalse);
  });

  test('waiting for an OK, or failed: says so and opens the chat', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    s.backend.runStatus = RunStatus.waitingApproval;
    var r = await ask(s.bridge, {'text': 'Send it'});
    expect(r['status'], SiriStatus.needsYou);
    expect(r['open'], '/bots/$botId/chat?c=$convId');
    s.backend.runStatus = RunStatus.failed;
    r = await ask(s.bridge, {'text': 'Again'});
    expect(r['status'], SiriStatus.failed);
  });

  test('Hide reply text: Siri says the bot replied, never what', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    s.backend.prefs = const PushPrefs(hideReplyText: true);
    s.backend.storedMessages = [_reply('secret numbers')];
    final r = await ask(s.bridge, {'text': 'Numbers?'});
    expect(r['status'], SiriStatus.hidden);
    expect(r['say'], 'Ada replied. Open Casama to read it.');
    expect(r.containsKey('text'), isFalse);
  });

  test('with the app lock on, nothing is sent: the app opens with the words kept', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    await s.c.read(appLockSettingsProvider.notifier).save(const AppLockSettings(enabled: true, userId: 'me'));
    final r = await ask(s.bridge, {'text': 'hi there', 'bot_id': botId});
    expect(r['status'], SiriStatus.openApp);
    expect(r['open'], askPath(botId: botId, text: 'hi there'));
    expect(s.backend.sent, isEmpty);
    final run = Map<String, Object?>.from((await s.bridge.handle(const MethodCall('run', {'routine_id': 'r1:$botId', 'name': 'Morning'})))! as Map);
    expect(run['status'], SiriStatus.openApp);
    expect(s.backend.routinesRun, isEmpty);
  });

  test('signed out, no words, an unknown bot, out of credits, offline', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    expect((await ask(s.bridge, {'text': ''}))['status'], SiriStatus.openApp);
    expect((await ask(s.bridge, {'text': 'x', 'bot_id': 'gone'}))['status'], SiriStatus.openApp);
    s.backend.failNextSend = DioException(
      requestOptions: RequestOptions(path: '/x'),
      response: Response(requestOptions: RequestOptions(path: '/x'), statusCode: 402),
    );
    expect((await ask(s.bridge, {'text': 'x'}))['status'], SiriStatus.noCredits);
    s.backend.failNextSend = DioException(requestOptions: RequestOptions(path: '/x'), type: DioExceptionType.connectionError);
    expect((await ask(s.bridge, {'text': 'x'}))['status'], SiriStatus.offline);
    s.backend.signedInAs = null;
    expect((await ask(s.bridge, {'text': 'x'}))['status'], SiriStatus.signedOut);
  });

  test('the sixth ask in a minute opens the app instead of sending', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    s.backend.storedMessages = [_reply('ok')];
    for (var i = 0; i < siriAsksPerMinute; i++) {
      expect((await ask(s.bridge, {'text': 'q$i', 'request_id': 'id$i'}))['status'], SiriStatus.replied);
    }
    final r = await ask(s.bridge, {'text': 'one more', 'request_id': 'id-last'});
    expect(r['status'], SiriStatus.limited);
    expect(s.backend.sent, hasLength(siriAsksPerMinute));
  });

  Future<Map<String, Object?>> send(SiriBridge bridge, Map<String, Object?> args) async =>
      Map<String, Object?>.from((await bridge.handle(MethodCall('send', args)))! as Map);

  test('Send a message (Phase 3) sends to the named bot and returns the ids, no wait', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    final r = await send(s.bridge, {'bot_id': botId, 'text': ' Check the list ', 'request_id': 's1'});
    expect(r['status'], SiriStatus.sent);
    expect(r['bot_id'], botId);
    expect(r['run_id'], isNotNull);
    expect(r['conversation_id'], isNotNull);
    expect(r['say'], contains('still working'));
    expect(s.backend.sent, ['Check the list']);
    expect(s.backend.sendKeys, ['s1']);
    final again = await send(s.bridge, {'bot_id': botId, 'text': 'Check the list', 'request_id': 's1'});
    expect(again, r);
    expect(s.backend.sent, hasLength(1));
  });

  test('Send a message: no bot, an unknown bot, no words or the app lock open the app and send nothing', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    expect((await send(s.bridge, {'text': 'hi'}))['status'], SiriStatus.openApp);
    expect((await send(s.bridge, {'bot_id': 'gone', 'text': 'hi'}))['status'], SiriStatus.openApp);
    final empty = await send(s.bridge, {'bot_id': botId, 'text': '  '});
    expect(empty['status'], SiriStatus.openApp);
    await s.c.read(appLockSettingsProvider.notifier).save(const AppLockSettings(enabled: true, userId: 'me'));
    final locked = await send(s.bridge, {'bot_id': botId, 'text': 'hi there'});
    expect(locked['status'], SiriStatus.openApp);
    expect(locked['open'], askPath(botId: botId, text: 'hi there'));
    expect(s.backend.sent, isEmpty);
  });

  test('Send a message: signed out, out of credits, offline, and the per-minute limit shared with asks', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    s.backend.failNextSend = DioException(
      requestOptions: RequestOptions(path: '/x'),
      response: Response(requestOptions: RequestOptions(path: '/x'), statusCode: 402),
    );
    expect((await send(s.bridge, {'bot_id': botId, 'text': 'x'}))['status'], SiriStatus.noCredits);
    s.backend.failNextSend = DioException(requestOptions: RequestOptions(path: '/x'), type: DioExceptionType.connectionError);
    expect((await send(s.bridge, {'bot_id': botId, 'text': 'x'}))['status'], SiriStatus.offline);
    for (var i = 2; i < siriAsksPerMinute; i++) {
      expect((await send(s.bridge, {'bot_id': botId, 'text': 'q$i', 'request_id': 'id$i'}))['status'], SiriStatus.sent);
    }
    expect((await send(s.bridge, {'bot_id': botId, 'text': 'one more', 'request_id': 'last'}))['status'], SiriStatus.limited);
    s.backend.signedInAs = null;
    expect((await send(s.bridge, {'bot_id': botId, 'text': 'x'}))['status'], SiriStatus.signedOut);
  });

  test('Run a routine starts it in place; What needs me counts', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    final run = Map<String, Object?>.from((await s.bridge.handle(const MethodCall('run', {'routine_id': 'r1:$botId', 'name': 'Morning brief'})))! as Map);
    expect(run['say'], 'Started Morning brief.');
    expect(s.backend.routinesRun, ['r1']);
    final needs = Map<String, Object?>.from((await s.bridge.handle(const MethodCall('needs')))! as Map);
    // Counted once loaded: an early read would wrongly say nothing needs you.
    expect(needs['say'], startsWith('One thing needs you.'));
    expect(needs['open'], '/inbox');
  });

  test('long replies are cut at a sentence', () {
    final long = List.filled(200, 'This is one sentence.').join(' ');
    final spoken = siriSpeakable(long);
    expect(spoken.length, lessThanOrEqualTo(siriReplyMax + 1));
    expect(spoken, endsWith('.…'));
    expect(siriSpeakable('Short `code` and [a link](https://x.y).'), 'Short code and a link.');
  });

  group('Spotlight (Phase 2)', () {
    Conversation conv(String id, String? title, DateTime at) => Conversation(
      id: id,
      botId: botId,
      title: title,
      lastMessageAt: at,
      createdAt: DateTime(2026),
      kind: ConversationKindEnum.direct,
      botIds: const [botId],
    );

    test('chats: titled only, newest first, capped, with the bot', () {
      final f = FakeBackend();
      final chats = siriChats([f.bot()], {
        botId: [
          conv('old', 'Old plan', DateTime(2026, 1)),
          conv('untitled', null, DateTime(2026, 12)),
          conv('new', ' Launch list ', DateTime(2026, 11)),
        ],
        'other-bot': [conv('x', 'Not a listed bot', DateTime(2026, 12))],
      });
      expect(chats.map((c) => c['id']), ['new', 'old']);
      expect(chats.first['name'], 'Launch list');
      expect(chats.first['detail'], 'Ada');
      expect(chats.first['bot_id'], botId);
      final many = siriChats([f.bot()], {botId: [for (var i = 0; i < 80; i++) conv('c$i', 'Chat $i', DateTime(2026, 1, 1, i))]});
      expect(many, hasLength(siriChatsMax));
    });

    test('allowed only while signed in, switched on, and without the app lock', () async {
      final backend = FakeBackend();
      final c = ProviderContainer(
        overrides: [backendProvider.overrideWithValue(backend), signedInProvider.overrideWith((ref) => Stream.value(true))],
      );
      addTearDown(c.dispose);
      final sub = c.listen(siriIndexAllowedProvider, (_, _) {});
      addTearDown(sub.close);
      await c.read(signedInProvider.future);
      expect(c.read(siriIndexAllowedProvider), isTrue);
      await c.read(siriSpotlightProvider.notifier).set(false);
      expect(c.read(siriIndexAllowedProvider), isFalse);
      await c.read(siriSpotlightProvider.notifier).set(true);
      expect(c.read(siriIndexAllowedProvider), isTrue);
      await c.read(appLockSettingsProvider.notifier).save(const AppLockSettings(enabled: true, userId: 'me'));
      expect(c.read(siriIndexAllowedProvider), isFalse);
    });

    test('what is on screen: a bot or a chat, nothing else', () {
      expect(siriScreenFor(Uri.parse('/bots/b1/chat')), {'kind': 'bot', 'id': 'b1', 'bot_id': 'b1'});
      expect(siriScreenFor(Uri.parse('/bots/b1/chat?c=c9')), {'kind': 'chat', 'id': 'c9', 'bot_id': 'b1'});
      expect(siriScreenFor(Uri.parse('/settings')), isNull);
      expect(siriScreenFor(Uri.parse('/bots')), isNull);
    });

    test('the list the intents read carries chats only when given', () {
      final f = FakeBackend();
      expect(shortcutsList([f.bot()], const {})['chats'], isEmpty);
      final chats = siriChats([f.bot()], {botId: [conv('c1', 'Plan', DateTime(2026))]});
      expect((shortcutsList([f.bot()], const {}, chats: chats)['chats'] as List).single['id'], 'c1');
    });
  });
}
