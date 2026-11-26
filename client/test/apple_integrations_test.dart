import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:casama/core/age_range.dart';
import 'package:casama/core/apple_device_actions.dart';
import 'package:casama/core/backend.dart';
import 'package:casama/core/device_dictation.dart';
import 'package:casama/core/file_provider.dart';
import 'package:casama/core/on_device_model.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/push.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/devices/device_collector.dart';
import 'package:casama/features/siri/focus_filter.dart';
import 'package:casama/features/siri/siri_bridge.dart';

import 'fake_backend.dart';

class _BotsStub extends BotsNotifier {
  _BotsStub(this.initial);
  final List<Bot> initial;
  @override
  Future<List<Bot>> build() async => initial;
}

class _OrgsStub extends OrganizationsNotifier {
  @override
  Future<List<OrganizationWithRole>> build() async => const [];
}

class _FakeFallbackDictation implements DeviceDictation {
  bool started = false;
  bool stopped = false;

  @override
  bool get supported => true;

  @override
  Future<bool> start({
    required void Function(String words) onWords,
    required void Function(DeviceDictationEnd end) onEnd,
  }) async {
    started = true;
    onWords('fallback words');
    onEnd(DeviceDictationEnd.done);
    return true;
  }

  @override
  Future<void> stop() async => stopped = true;

  @override
  Future<void> cancel() async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Declared Age Range (item 2)', () {
    test('maps API age bands and computes teen/under13 flags', () {
      expect(AgeBand.fromApi('under13').isUnder13, isTrue);
      expect(AgeBand.fromApi('13to15').isTeen, isTrue);
      expect(AgeBand.fromApi('16to17').isTeen, isTrue);
      expect(AgeBand.fromApi('18plus').isRestricted, isFalse);
      expect(AgeBand.fromApi('declined').isRestricted, isFalse);
      expect(AgeBand.fromApi(null), AgeBand.unknown);
    });

    test('needsRefresh returns true when null or older than 30 days', () {
      final now = DateTime.utc(2026, 11, 26);
      expect(AgeRangeService.needsRefresh(null, now: now), isTrue);
      expect(
        AgeRangeService.needsRefresh(
          now.subtract(const Duration(days: 10)),
          now: now,
        ),
        isFalse,
      );
      expect(
        AgeRangeService.needsRefresh(
          now.subtract(const Duration(days: 30)),
          now: now,
        ),
        isTrue,
      );
    });

    test('providers reflect teen mode and under-13 block', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(ageBandProvider.notifier).setBand(AgeBand.teen16to17);
      expect(container.read(isTeenModeProvider), isTrue);
      expect(container.read(isUnder13BlockedProvider), isFalse);

      container.read(ageBandProvider.notifier).setBand(AgeBand.under13);
      expect(container.read(isTeenModeProvider), isFalse);
      expect(container.read(isUnder13BlockedProvider), isTrue);
    });
  });

  group('Focus Filters (item 6)', () {
    testWidgets('filters bots and toggles Show All via FocusFilterChip', (
      tester,
    ) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(focusFilterProvider.notifier).applyNativePayload({
        'active': true,
        'bot_ids': ['bot-1', 'bot-2'],
        'hold_check_ins': true,
      });

      final all = ['bot-1', 'bot-2', 'bot-3'];
      expect(container.read(focusFilterProvider).filterBots(all, (id) => id), [
        'bot-1',
        'bot-2',
      ]);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: Scaffold(body: FocusFilterChip())),
        ),
      );

      expect(find.byKey(const Key('focusFilterChip')), findsOneWidget);
      expect(find.text('Focus filter · 2 shown'), findsOneWidget);

      await tester.tap(find.byKey(const Key('focusFilterChip')));
      await tester.pump();

      expect(find.text('Focus filter · Showing all'), findsOneWidget);
      expect(container.read(focusFilterProvider).filterBots(all, (id) => id), [
        'bot-1',
        'bot-2',
        'bot-3',
      ]);
    });
  });

  group('SpeechAnalyzer dictation (item 17)', () {
    test('falls back to SpeechToTextDictation when native SpeechAnalyzer is unavailable', () async {
      final fallback = _FakeFallbackDictation();
      final dictation = SpeechAnalyzerDictation(fallback: fallback);
      String? heard;
      DeviceDictationEnd? ended;

      final ok = await dictation.start(
        onWords: (w) => heard = w,
        onEnd: (e) => ended = e,
      );
      expect(ok, isTrue);
      expect(fallback.started, isTrue);
      expect(heard, 'fallback words');
      expect(ended, DeviceDictationEnd.done);
    });
  });

  group('Native bridges (items 16, 18, 19, 20)', () {
    test(
      'OnDeviceModelService calls casama/on_device_model on Apple platforms',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
        addTearDown(() => debugDefaultTargetPlatformOverride = null);

        const ch = MethodChannel('casama/on_device_model');
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(ch, (call) async {
              if (call.method == 'isAvailable') return true;
              if (call.method == 'generateTitle') return 'Weekend Trip Plan';
              return null;
            });
        addTearDown(() {
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(ch, null);
        });

        final svc = OnDeviceModelService(channel: ch);
        expect(await svc.isAvailable(), isTrue);
        expect(
          await svc.generateTitle('Help me plan a weekend trip to Kyoto'),
          'Weekend Trip Plan',
        );
      },
    );

    test(
      'AlarmKitClient & HomeKitClient dispatch actions to method channels',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        addTearDown(() => debugDefaultTargetPlatformOverride = null);

        const alarmCh = MethodChannel('casama/alarm_kit');
        const homeCh = MethodChannel('casama/home_kit');
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(
              alarmCh,
              (call) async => {'ok': true, 'method': call.method},
            );
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(
              homeCh,
              (call) async => {'ok': true, 'method': call.method},
            );
        addTearDown(() {
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(alarmCh, null);
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(homeCh, null);
        });

        final alarm = AlarmKitClient(channel: alarmCh);
        final home = HomeKitClient(channel: homeCh);

        expect(await alarm.execute('alarm.set', {'duration_seconds': 120}), {
          'ok': true,
          'method': 'set',
        });
        expect(
          await home.execute('home.set', {
            'accessory_id': 'a1',
            'characteristic': 'power',
            'value': false,
          }),
          {'ok': true, 'method': 'set'},
        );
      },
    );

    test('FileProviderService sets and clears read-only key', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      const ch = MethodChannel('casama/file_provider');
      final calls = <String>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(ch, (call) async {
            calls.add(call.method);
            return true;
          });
      addTearDown(() {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(ch, null);
      });

      final svc = FileProviderService(channel: ch);
      expect(
        await svc.setKey(
          key: 'cfk_test',
          apiUrl: 'https://api.casama.ai',
          orgId: 'org-1',
        ),
        isTrue,
      );
      await svc.clearKey();
      expect(calls, ['setKey', 'clearKey']);
    });
  });

  group('End-to-end Dart wiring', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      AppLockSettingsNotifier.resetForTest();
    });

    testWidgets('Under13BlockedGate blocks signed-in under-13 accounts', (
      tester,
    ) async {
      final backend = FakeBackend();
      final container = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(backend),
          signedInProvider.overrideWith((_) => Stream.value(true)),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Under13BlockedGate(
              child: Scaffold(body: Text('Main App')),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Main App'), findsOneWidget);

      container.read(ageBandProvider.notifier).setBand(AgeBand.under13);
      await tester.pump();
      expect(find.byKey(const Key('under13BlockedGate')), findsOneWidget);
      expect(find.text('Main App'), findsNothing);
    });

    test('focusFilterSyncProvider sets and clears device quiet_until', () async {
      final backend = FakeBackend();
      final container = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(backend),
          signedInProvider.overrideWith((_) => Stream.value(true)),
        ],
      );
      addTearDown(container.dispose);

      container.read(focusFilterSyncProvider);
      container.read(focusFilterProvider.notifier).applyNativePayload({
        'active': true,
        'bot_ids': ['bot-1'],
        'hold_check_ins': true,
      });
      await Future<void>.delayed(Duration.zero);
      expect(backend.quietUntilCalls, hasLength(1));
      expect(backend.quietUntilCalls.first, isNotNull);

      container.read(focusFilterProvider.notifier).applyNativePayload({
        'active': false,
        'bot_ids': <String>[],
        'hold_check_ins': false,
      });
      await Future<void>.delayed(Duration.zero);
      expect(backend.quietUntilCalls, hasLength(2));
      expect(backend.quietUntilCalls.last, isNull);
    });

    test('PluginDeviceCollector wires AlarmKit and HomeKit on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      const alarmCh = MethodChannel('casama/alarm_kit_wiring_test');
      const homeCh = MethodChannel('casama/home_kit_wiring_test');
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(alarmCh, (call) async {
            if (call.method == 'requestPermission') return true;
            return {'ok': true, 'kind': 'alarm', 'method': call.method};
          });
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(homeCh, (call) async {
            if (call.method == 'requestPermission') return true;
            return {'ok': true, 'kind': 'home', 'method': call.method};
          });
      addTearDown(() {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(alarmCh, null);
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(homeCh, null);
      });

      final collector = PluginDeviceCollector(
        alarms: AlarmKitClient(channel: alarmCh),
        home: HomeKitClient(channel: homeCh),
      );
      expect(collector.supported, containsAll([DeviceKind.alarm, DeviceKind.home]));
      expect(await collector.requestPermission(DeviceKind.alarm), isTrue);
      expect(await collector.requestPermission(DeviceKind.home), isTrue);
      expect(
        await collector.write('alarm.set', {'duration_seconds': 60}),
        {'ok': true, 'kind': 'alarm', 'method': 'set'},
      );
      expect(
        await collector.write('home.list', const {}),
        {'ok': true, 'kind': 'home', 'method': 'list'},
      );
    });

    test('PushRegistrar.handleInlineReply sends to existing or new chat', () async {
      final backend = FakeBackend();
      final registrar = PushRegistrar(backend, (_) {});
      addTearDown(registrar.dispose);

      await registrar.handleInlineReply({
        'bot_id': botId,
        'conversation_id': convId,
        'text': 'Sounds good!',
      });
      expect(backend.sent, contains('Sounds good!'));

      await registrar.handleInlineReply({
        'bot_id': botId,
        'conversation_id': '',
        'text': 'Start fresh',
      });
      expect(backend.sent, contains('Start fresh'));
    });

    test('SiriBridge last_reply respects hideReplyText and start_computer blocks teen mode', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final backend = FakeBackend();
      backend.prefs = const PushPrefs(hideReplyText: true);
      final bot = (await backend.bots(orgId)).first.copyWith(
        lastMessage: BotLastMessage(
          conversationId: convId,
          from: BotLastMessageFromEnum.bot,
          text: 'Private secret reply',
          at: DateTime(2026, 11, 25),
          fileMime: null,
          fileName: null,
        ),
      );
      final container = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(backend),
          currentOrgIdProvider.overrideWithValue(orgId),
          organizationsProvider.overrideWith(_OrgsStub.new),
          botsProvider.overrideWith(() => _BotsStub([bot])),
        ],
      );
      addTearDown(container.dispose);

      final bridge = container.read(siriBridgeProvider)!;
      final hiddenRes = await bridge.handle(
        const MethodCall('last_reply', {'bot_id': botId}),
      ) as Map<String, Object?>;
      expect(hiddenRes['status'], SiriStatus.hidden);
      expect(hiddenRes['text'], '');

      backend.prefs = const PushPrefs(hideReplyText: false);
      final visibleRes = await bridge.handle(
        const MethodCall('last_reply', {'bot_id': botId}),
      ) as Map<String, Object?>;
      expect(visibleRes['status'], SiriStatus.replied);
      expect(visibleRes['text'], 'Private secret reply');

      container.read(ageBandProvider.notifier).setBand(AgeBand.teen16to17);
      final compRes = await bridge.handle(
        const MethodCall('start_computer', {'name': 'Work'}),
      ) as Map<String, Object?>;
      expect(compRes['status'], SiriStatus.failed);
      expect(backend.computerActions, isEmpty);
    });
  });
}
