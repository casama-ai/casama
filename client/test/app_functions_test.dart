// Gemini through Casama's AppFunctions on Android (docs/ANDROID-APPFUNCTIONS-PLAN.md §5–§7, D-567):
// the shared bridge's Gemini settings (longer replies, its own count, the switch), the switch
// itself, and one vocabulary across packages/contracts/assistant-actions.json and the Kotlin code.
import 'dart:convert';
import 'dart:io';

import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/push.dart';
import 'package:casama/features/app_functions/app_functions.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/island/island_feed.dart';
import 'package:casama/features/siri/siri_bridge.dart';
import 'package:casama_sdk/casama_sdk.dart';
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

class _NoPush extends PushRegistrar {
  _NoPush(Backend backend) : super(backend, (_) {});
  @override
  Future<String?> silentToken() async => null;
}

ChatMessageView _reply(String text) => ChatMessageView(
  id: 'r-${text.length}',
  role: 'assistant',
  text: text,
  createdAt: DateTime(2026, 11, 25),
  runId: runId,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    AppLockSettingsNotifier.resetForTest();
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
  });

  tearDown(() => debugDefaultTargetPlatformOverride = null);

  ({
    ProviderContainer c,
    FakeBackend backend,
    SiriBridge bridge,
    List<String> counted,
  })
  setUpBridge({bool on = true}) {
    final backend = FakeBackend();
    final c = ProviderContainer(
      overrides: [
        backendProvider.overrideWithValue(backend),
        pushProvider.overrideWithValue(_NoPush(backend)),
        currentOrgIdProvider.overrideWithValue(orgId),
        botsProvider.overrideWith(() => _Bots([backend.bot()])),
        islandLocalActivityProvider.overrideWithBuild((ref, notifier) => null),
      ],
    );
    addTearDown(c.dispose);
    final counted = <String>[];
    // The bridge as appFunctionsBridgeProvider makes it, with a recorder for the count.
    final probe = Provider<SiriBridge>(
      (ref) => SiriBridge(
        ref,
        const MethodChannel('test/app_functions'),
        poll: const Duration(milliseconds: 5),
        onAction: (action, outcome, [waitS]) => counted.add('$action:$outcome'),
        replyMax: geminiReplyMax,
        allowed: () async => on,
      ),
    );
    return (c: c, backend: backend, bridge: c.read(probe), counted: counted);
  }

  Future<Map<String, Object?>> call(
    SiriBridge bridge,
    String method,
    Map<String, Object?> args,
  ) async {
    final r = await bridge.handle(
      MethodCall(method, {'wait_ms': 200, ...args}),
    );
    return Map<String, Object?>.from(r! as Map);
  }

  test('Gemini gets the whole reply up to its own cap, longer than Siri\'s, and it is counted as Gemini\'s', () async {
    final s = setUpBridge();
    await s.c.read(botsProvider.future);
    final long = List.filled(150, 'This is a sentence.').join(' ');
    expect(long.length, greaterThan(siriReplyMax));
    s.backend.storedMessages = [_reply(long)];
    final r = await call(s.bridge, 'ask', {'text': 'Tell me everything'});
    expect(r['status'], SiriStatus.replied);
    expect((r['text']! as String).length, long.length);
    expect(s.counted, ['ask:replied']);
  });

  test('a reply over Gemini\'s cap is cut at a sentence', () {
    final long = List.filled(400, 'This is a sentence.').join(' ');
    final cut = siriSpeakable(long, max: geminiReplyMax);
    expect(cut.length, lessThanOrEqualTo(geminiReplyMax + 1));
    expect(cut, endsWith('.…'));
  });

  test(
    'the switch off: nothing is asked, run or read, and native code gets "off"',
    () async {
      final s = setUpBridge(on: false);
      await s.c.read(botsProvider.future);
      for (final m in ['ask', 'run', 'needs']) {
        final r = await call(s.bridge, m, {
          'text': 'Hello',
          'routine_id': 'r:b',
          'name': 'Brief',
        });
        expect(r['status'], SiriStatus.off, reason: m);
        expect(r['say'], contains('turned off'), reason: m);
      }
      expect(s.backend.sent, isEmpty);
      expect(s.counted, ['ask:off', 'run:off', 'needs:off']);
    },
  );

  test(
    'ping answers even with the switch off, so native code can time the start',
    () async {
      final s = setUpBridge(on: false);
      expect(await s.bridge.handle(const MethodCall('ping')), {'ok': true});
    },
  );

  test(
    'Let Gemini use Casama is on by default and remembered on this device',
    () async {
      final c = ProviderContainer();
      addTearDown(c.dispose);
      expect(c.read(geminiSwitchProvider), isTrue);
      expect(await GeminiSwitch.saved(), isTrue);
      await c.read(geminiSwitchProvider.notifier).set(false);
      expect(c.read(geminiSwitchProvider), isFalse);
      expect(await GeminiSwitch.saved(), isFalse);
    },
  );

  test('native code hears "on" once signed in and "off" when the switch goes off', () async {
    // Build 101: each change sent the value from before it, so signing in sent "off" and Gemini
    // found every function disabled.
    final backend = FakeBackend()..signedIn = false;
    final c = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
    addTearDown(c.dispose);
    final told = <bool>[];
    c.listen(Provider<void>((ref) => followGeminiAccess(ref, told.add)), (_, _) {});
    await pumpEventQueue();
    expect(told, [false]);
    await backend.signIn('a@example.com', 'pw');
    await pumpEventQueue();
    expect(told.last, isTrue);
    await c.read(geminiSwitchProvider.notifier).set(false);
    await pumpEventQueue();
    expect(told.last, isFalse);
    await c.read(geminiSwitchProvider.notifier).set(true);
    await pumpEventQueue();
    expect(told.last, isTrue);
    await backend.signOut();
    await pumpEventQueue();
    expect(told.last, isFalse);
  });

  test('without the build switch there is no bridge and no Settings tile', () {
    expect(kAppFunctions, isFalse);
    expect(appFunctionsAvailable, isFalse);
    final c = ProviderContainer(
      overrides: [backendProvider.overrideWithValue(FakeBackend())],
    );
    addTearDown(c.dispose);
    expect(c.read(appFunctionsBridgeProvider), isNull);
  });

  test('one vocabulary: the Android ids in assistant-actions.json are the functions the Kotlin code declares', () {
    final actions = jsonDecodeFile(
      '../packages/contracts/assistant-actions.json',
    );
    final shared = {
      for (final a in (actions['actions'] as List).cast<Map<String, Object?>>())
        if (a['android'] case final String id) id,
    };
    final model = File(
      'android/app/src/main/kotlin/ai/casama/app/AssistantModel.kt',
    ).readAsStringSync();
    final listed = RegExp(r'val FUNCTIONS = listOf\(([^)]*)\)')
        .firstMatch(model)!
        .group(1)!;
    final ids = {
      for (final m in RegExp(r'"(\w+)"').allMatches(listed)) m.group(1)!,
    };
    final declared = {
      for (final m
          in RegExp(r'@AppFunctionDeclaration\([^)]*\)\s*suspend fun (\w+)')
              .allMatches(
                File(
                  'android/app/src/appFunctions/kotlin/ai/casama/app/CasamaFunctions.kt',
                ).readAsStringSync(),
              ))
        m.group(1)!,
    };
    expect(ids, shared);
    expect(declared, shared);
    // Approvals stay in Casama for Gemini (plan §4.4): no Android function decides one.
    final decide = (actions['actions'] as List)
        .cast<Map<String, Object?>>()
        .firstWhere((a) => a['action'] == 'decide_approval');
    expect(decide['android'], isNull);
  });
}

Map<String, Object?> jsonDecodeFile(String path) =>
    Map<String, Object?>.from(jsonDecode(File(path).readAsStringSync()) as Map);
