import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:casama/app.dart';
import 'package:casama/core/age_range.dart';
import 'package:casama/core/apple_device_actions.dart';
import 'package:casama/core/backend.dart';
import 'package:casama/core/device_dictation.dart';
import 'package:casama/core/document_scanner.dart';
import 'package:casama/core/file_provider.dart';
import 'package:casama/core/on_device_model.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/push.dart';
import 'package:casama/core/router.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/bots/bots_screen.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/devices/device_collector.dart';
import 'package:casama/features/devices/device_labels.dart';
import 'package:casama/features/settings/settings_screen.dart';
import 'package:casama/features/siri/focus_filter.dart';
import 'package:casama/features/siri/siri_bridge.dart';
import 'package:casama/l10n/generated/app_localizations.dart';

import 'app_test.dart' show harness, setSize;
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

/// Files and Finder without native code: what was handed over and taken away.
class _FakeFileProvider extends FileProviderService {
  final calls = <String>[];
  final keys = <String>[];
  var setKeyOk = true;

  @override
  bool get isPlatformSupported => true;

  @override
  Future<bool> isSupported() async => true;

  @override
  Future<bool> setKey({
    required String key,
    required String apiUrl,
    required String orgId,
  }) async {
    calls.add('setKey');
    keys.add(key);
    return setKeyOk;
  }

  @override
  Future<void> clearKey() async => calls.add('clearKey');
}

/// Apple's Declared Age Range sheet, answering [band].
class _FakeAgeRange extends AgeRangeService {
  _FakeAgeRange(this.band);
  AgeBand? band;
  var requests = 0;

  @override
  Future<bool> isSupported() async => true;

  @override
  Future<AgeBand?> requestAgeRange() async {
    requests++;
    return band;
  }
}

/// The workspace in use, changeable by a test.
class _TestOrg extends Notifier<String?> {
  @override
  String? build() => orgId;

  void set(String? id) => state = id;
}

final _testOrgProvider = NotifierProvider<_TestOrg, String?>(_TestOrg.new);

class _Scanner extends DocumentScannerService {
  _Scanner(this.error);
  final Object? error;

  @override
  Future<ScannedDocument?> scan() async {
    final e = error;
    if (e != null) throw e;
    return null;
  }
}

class _NoComputersBackend extends FakeBackend {
  @override
  Future<List<Computer>> computers(String orgId) async => const [];
}

Me _me({AccountAgeBand? band, DateTime? updatedAt}) => Me(
  userId: 'me',
  email: 'tester@example.com',
  displayName: 'Tester',
  locale: 'en',
  timezone: 'UTC',
  accountAgeBand: band,
  accountAgeBandUpdatedAt: updatedAt,
  organizations: const [],
);

/// The app goes to the background and comes back, the way the system reports it.
void _leaveAndReturn() {
  for (final s in const [
    AppLifecycleState.inactive,
    AppLifecycleState.hidden,
    AppLifecycleState.paused,
    AppLifecycleState.hidden,
    AppLifecycleState.inactive,
    AppLifecycleState.resumed,
  ]) {
    TestWidgetsFlutterBinding.instance.handleAppLifecycleStateChanged(s);
  }
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
          child: const MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(body: FocusFilterChip()),
          ),
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
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
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
      // In the app's words (app_en.arb), not hard-coded ones.
      expect(find.text('Casama is for people 13 and older'), findsOneWidget);
      expect(find.byKey(const Key('under13SignOut')), findsOneWidget);
      expect(find.text('Sign Out'), findsOneWidget);
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
  group('File Provider key lifecycle (item 1)', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    ({ProviderContainer c, FakeBackend backend, _FakeFileProvider files}) start({FakeBackend? backend}) {
      final b = backend ?? FakeBackend();
      final files = _FakeFileProvider();
      final c = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(b),
          fileProviderServiceProvider.overrideWithValue(files),
          currentOrgIdProvider.overrideWith((ref) => ref.watch(_testOrgProvider)),
        ],
      );
      addTearDown(c.dispose);
      // Kept alive the way the app keeps it (app.dart), so its listeners run.
      c.listen(fileProviderSyncProvider, (_, _) {});
      return (c: c, backend: b, files: files);
    }

    Future<void> settle(ProviderContainer c) async {
      await pumpEventQueue();
      await c.read(fileProviderSyncProvider).sync();
    }

    Future<FileProviderKeyRecord?> record() => FileProviderKeyStore.load();
    Future<List<String>> pending() async => [for (final k in await FileProviderKeyStore.pending()) k.id];

    test('makes one key, hands it to Files and keeps its id; a confirmed key is not made again', () async {
      final t = start();
      await settle(t.c);
      expect(t.files.keys, ['cfk_test_1']);
      final kept = await record();
      expect(kept?.id, 'fk-1');
      expect(kept?.userId, 'me');
      expect(kept?.orgId, orgId);

      await settle(t.c);
      expect(t.backend.createdFileKeys.map((k) => k.id), ['fk-1']);
      expect(t.files.keys, hasLength(1));
    });

    test('signing out revokes the key and removes its record; signing back in makes a new one', () async {
      final t = start();
      await settle(t.c);
      await t.backend.signOut();
      await settle(t.c);
      expect(t.backend.deletedFileKeyIds, ['fk-1']);
      expect(t.files.calls.last, 'clearKey');
      expect(await record(), isNull);

      // The bug: the old record stayed, so this sign-in never handed Files a key again.
      await t.backend.signIn('tester@example.com', 'pw');
      await settle(t.c);
      expect(t.files.keys, ['cfk_test_1', 'cfk_test_2']);
      expect((await record())?.id, 'fk-2');
      expect(t.backend.createdFileKeys.map((k) => k.id), ['fk-2']);
    });

    test('a session that ended elsewhere keeps the key to revoke once that account is back', () async {
      final t = start();
      await settle(t.c);
      t.backend.endSession();
      await settle(t.c);
      expect(t.backend.deletedFileKeyIds, isEmpty);
      expect(t.files.calls.last, 'clearKey');
      expect(await pending(), ['fk-1']);

      await t.backend.signIn('tester@example.com', 'pw');
      await settle(t.c);
      expect(t.backend.deletedFileKeyIds, ['fk-1']);
      expect(await pending(), isEmpty);
      expect((await record())?.id, 'fk-2');
    });

    test('an offline sign-out keeps the key and revokes it at the next sign-in', () async {
      final t = start();
      await settle(t.c);
      t.backend.fileKeyDeleteFails = true;
      await t.backend.signOut();
      await settle(t.c);
      expect(await record(), isNull);
      expect(await pending(), ['fk-1']);

      t.backend.fileKeyDeleteFails = false;
      await t.backend.signIn('tester@example.com', 'pw');
      await settle(t.c);
      expect(t.backend.deletedFileKeyIds, ['fk-1']);
      expect(await pending(), isEmpty);
    });

    test('teen mode and under 13 revoke the key; back to adult makes a new one', () async {
      final t = start();
      await settle(t.c);
      t.c.read(ageBandProvider.notifier).setBand(AgeBand.teen16to17);
      await settle(t.c);
      expect(t.backend.deletedFileKeyIds, ['fk-1']);
      expect(t.files.calls.last, 'clearKey');
      expect(await record(), isNull);
      expect(t.backend.createdFileKeys, isEmpty);

      t.c.read(ageBandProvider.notifier).setBand(AgeBand.under13);
      await settle(t.c);
      expect(t.backend.createdFileKeys, isEmpty);

      t.c.read(ageBandProvider.notifier).setBand(AgeBand.adult18plus);
      await settle(t.c);
      expect((await record())?.id, 'fk-2');
      expect(t.files.keys.last, 'cfk_test_2');
    });

    test('another workspace replaces the key; workspaces still loading leave it alone', () async {
      final t = start();
      await settle(t.c);
      t.c.read(_testOrgProvider.notifier).set(null);
      await settle(t.c);
      expect(t.backend.deletedFileKeyIds, isEmpty);
      expect((await record())?.id, 'fk-1');

      t.c.read(_testOrgProvider.notifier).set('org-2');
      await settle(t.c);
      expect(t.backend.deletedFileKeyIds, ['fk-1']);
      final kept = await record();
      expect(kept?.id, 'fk-2');
      expect(kept?.orgId, 'org-2');
      expect(t.backend.createdFileKeys.single.orgId, 'org-2');
    });

    test('a kept key the server no longer lists is made again', () async {
      SharedPreferences.setMockInitialValues({
        FileProviderKeyStore.prefKey: '{"id":"fk-gone","user_id":"me","org_id":"$orgId"}',
      });
      final t = start();
      await settle(t.c);
      expect(t.files.keys, ['cfk_test_1']);
      expect((await record())?.id, 'fk-1');
    });

    test("an earlier build's per-workspace record is revoked and no longer blocks a new key", () async {
      SharedPreferences.setMockInitialValues({'file_provider.key.me.$orgId': 'fk-legacy'});
      final t = start();
      await settle(t.c);
      expect(t.backend.deletedFileKeyIds, ['fk-legacy']);
      expect(t.files.keys, ['cfk_test_1']);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getKeys().where((k) => k.startsWith(FileProviderKeyStore.legacyPrefix)), isEmpty);
    });

    test('a key native code refused is revoked rather than left behind', () async {
      final t = start();
      t.files.setKeyOk = false;
      await settle(t.c);
      expect(await record(), isNull);
      expect(t.backend.deletedFileKeyIds, contains('fk-1'));
    });
  });

  group('Declared Age Range sync (item 2)', () {
    ({ProviderContainer c, FakeBackend backend, _FakeAgeRange apple}) start(AgeBand? band) {
      final backend = FakeBackend();
      final apple = _FakeAgeRange(band);
      final c = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(backend),
          ageRangeServiceProvider.overrideWithValue(apple),
        ],
      );
      addTearDown(c.dispose);
      return (c: c, backend: backend, apple: apple);
    }

    test('asks Apple when the band is stale and sends it; a fresh band is left alone', () async {
      final t = start(AgeBand.adult18plus);
      t.c.listen(ageBandSyncProvider, (_, _) {});
      await pumpEventQueue();
      expect(t.apple.requests, 1);
      expect(t.backend.ageBandCalls, [AccountAgeBand.n18plus]);
      expect(t.c.read(ageBandProvider), AgeBand.adult18plus);

      t.backend.fakeMe = _me(band: AccountAgeBand.n18plus, updatedAt: DateTime.now().toUtc());
      await t.c.read(ageBandSyncProvider).sync();
      expect(t.apple.requests, 1);
      expect(t.backend.ageBandCalls, hasLength(1));
    });

    test("a looser band Apple reports waits for the server, which may keep the stricter one", () async {
      final t = start(AgeBand.adult18plus);
      t.backend.fakeMe = _me(band: AccountAgeBand.n13to15, updatedAt: DateTime(2020).toUtc());
      t.backend.ageBandServerKeeps = AccountAgeBand.n13to15;
      t.c.listen(ageBandSyncProvider, (_, _) {});
      await pumpEventQueue();
      expect(t.apple.requests, 1);
      expect(t.backend.ageBandCalls, [AccountAgeBand.n18plus]);
      expect(t.c.read(ageBandProvider), AgeBand.teen13to15);
      expect(t.c.read(isTeenModeProvider), isTrue);
    });

    test("the server's band applies at once, and teen mode follows it", () async {
      final t = start(null);
      t.backend.fakeMe = _me(band: AccountAgeBand.n13to15, updatedAt: DateTime.now().toUtc());
      t.c.listen(ageBandSyncProvider, (_, _) {});
      await pumpEventQueue();
      expect(t.c.read(isTeenModeProvider), isTrue);
      expect(t.apple.requests, 0);
    });

    test('a failed send is sent again when the app comes back, without asking Apple twice', () async {
      final t = start(AgeBand.teen13to15);
      t.backend.ageBandFailures = 1;
      t.c.listen(ageBandSyncProvider, (_, _) {});
      await pumpEventQueue();
      expect(t.backend.ageBandCalls, [AccountAgeBand.n13to15]);
      expect(t.c.read(ageBandSyncProvider).needsRetry, isTrue);
      expect(t.c.read(isTeenModeProvider), isTrue);

      _leaveAndReturn();
      await pumpEventQueue();
      expect(t.backend.ageBandCalls, [AccountAgeBand.n13to15, AccountAgeBand.n13to15]);
      expect(t.apple.requests, 1);
      expect(t.c.read(ageBandSyncProvider).needsRetry, isFalse);

      // Sent now: coming back again sends nothing more.
      _leaveAndReturn();
      await pumpEventQueue();
      expect(t.backend.ageBandCalls, hasLength(2));
    });

    test("a failed /v1/me read doesn't ask Apple and is tried again on resume", () async {
      final t = start(AgeBand.adult18plus);
      t.backend.getMeFailures = 1;
      t.c.listen(ageBandSyncProvider, (_, _) {});
      await pumpEventQueue();
      expect(t.apple.requests, 0);
      expect(t.c.read(ageBandSyncProvider).needsRetry, isTrue);

      _leaveAndReturn();
      await pumpEventQueue();
      expect(t.backend.getMeCalls, 2);
      expect(t.apple.requests, 1);
      expect(t.backend.ageBandCalls, [AccountAgeBand.n18plus]);
    });

    test('signing out forgets the band', () async {
      final t = start(AgeBand.teen16to17);
      t.c.listen(ageBandSyncProvider, (_, _) {});
      await pumpEventQueue();
      expect(t.c.read(isTeenModeProvider), isTrue);
      await t.backend.signOut();
      await pumpEventQueue();
      expect(t.c.read(ageBandProvider), AgeBand.unknown);
    });
  });

  group('Focus hold retries (item 5)', () {
    testWidgets('a failed hold is tried again with growing waits, then gives up', (tester) async {
      final backend = FakeBackend()..quietUnregistered = true;
      final c = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
      c.read(focusFilterSyncProvider);
      c.read(focusFilterProvider.notifier).applyNativePayload({
        'active': true,
        'bot_ids': ['bot-1'],
        'hold_check_ins': true,
      });
      await tester.pump();
      expect(backend.quietUntilCalls, hasLength(1));
      for (final (i, wait) in focusHoldRetryDelays.indexed) {
        await tester.pump(wait);
        expect(backend.quietUntilCalls, hasLength(i + 2));
      }
      // Bounded: no more tries until something changes.
      await tester.pump(const Duration(minutes: 30));
      expect(backend.quietUntilCalls, hasLength(focusHoldRetryDelays.length + 1));
      c.dispose();
    });

    testWidgets('a hold that fails once goes through on the retry; Focus ending releases it', (tester) async {
      final backend = FakeBackend()..quietFailures = 1;
      final c = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
      c.read(focusFilterSyncProvider);
      c.read(focusFilterProvider.notifier).applyNativePayload({
        'active': true,
        'bot_ids': ['bot-1'],
        'hold_check_ins': true,
      });
      await tester.pump();
      await tester.pump(focusHoldRetryDelays.first);
      expect(backend.quietUntilCalls, hasLength(2));
      expect(backend.quietUntilCalls.last, isNotNull);
      await tester.pump(const Duration(minutes: 30));
      expect(backend.quietUntilCalls, hasLength(2));

      // Renewed while the Focus stays on.
      await tester.pump(focusHoldRenewEvery);
      expect(backend.quietUntilCalls, hasLength(3));

      c.read(focusFilterProvider.notifier).applyNativePayload({
        'active': false,
        'bot_ids': <String>[],
        'hold_check_ins': false,
      });
      await tester.pump();
      expect(backend.quietUntilCalls.last, isNull);
      // The renewal stopped with the Focus.
      await tester.pump(focusHoldRenewEvery);
      expect(backend.quietUntilCalls, hasLength(4));
      c.dispose();
    });
  });

  group('Focus filter in the Chats list (item 6)', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('group chats stay when any of their bots is chosen', () {
      const filter = FocusFilterState(active: true, botIds: {'a'});
      final groups = [
        ['a', 'b'],
        ['c'],
        ['b', 'a'],
      ];
      expect(filter.filterGroups(groups, (g) => g), [
        ['a', 'b'],
        ['b', 'a'],
      ]);
      expect(filter.copyWith(showAllOverride: true).filterGroups(groups, (g) => g), groups);
    });

    testWidgets('the Chats list shows only the chosen bots and their group chats, with the chip to show all', (tester) async {
      await setSize(tester, const Size(500, 1200));
      final backend = FakeBackend();
      backend.extraBots
        ..add(backend.bot(id: 'bot-b', name: 'Bea'))
        ..add(backend.bot(id: 'bot-c', name: 'Cy'));
      backend.groups
        ..add(Conversation(id: 'g1', botId: botId, title: 'With Ada', lastMessageAt: null, createdAt: DateTime(2026), kind: ConversationKindEnum.group, botIds: const [botId, 'bot-c']))
        ..add(Conversation(id: 'g2', botId: 'bot-b', title: 'Bea and Cy', lastMessageAt: null, createdAt: DateTime(2026), kind: ConversationKindEnum.group, botIds: const ['bot-b', 'bot-c']));
      await tester.pumpWidget(harness(backend, const Scaffold(body: BotsList())));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('group-g2')), findsOneWidget);

      final c = ProviderScope.containerOf(tester.element(find.byType(BotsList)));
      c.read(focusFilterProvider.notifier).applyNativePayload({
        'active': true,
        'bot_ids': [botId],
        'hold_check_ins': false,
      });
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('bot-$botId')), findsOneWidget);
      expect(find.byKey(const Key('bot-bot-b')), findsNothing);
      expect(find.byKey(const Key('bot-bot-c')), findsNothing);
      expect(find.byKey(const Key('group-g1')), findsOneWidget);
      expect(find.byKey(const Key('group-g2')), findsNothing);
      expect(find.text('Focus filter · 1 shown'), findsOneWidget);

      await tester.tap(find.byKey(const Key('focusFilterChip')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('bot-bot-b')), findsOneWidget);
      expect(find.byKey(const Key('group-g2')), findsOneWidget);
      expect(find.text('Focus filter · Showing all'), findsOneWidget);
    });
  });

  group('Teen mode in the app (item 7)', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      AppLockSettingsNotifier.resetForTest();
    });

    test('the computer pages are the ones teen mode keeps closed', () {
      expect(teenBlockedLocation('/computer'), isTrue);
      expect(teenBlockedLocation('/computer/live'), isTrue);
      expect(teenBlockedLocation('/settings/computers'), isTrue);
      expect(teenBlockedLocation('/settings/devices'), isFalse);
      expect(teenBlockedLocation('/computers-guide'), isFalse);
    });

    testWidgets('links to a computer lead to the chats in teen mode', (tester) async {
      await setSize(tester, const Size(500, 1000));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [backendProvider.overrideWithValue(FakeBackend())],
          child: const CasamaApp(),
        ),
      );
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      final c = ProviderScope.containerOf(tester.element(find.byType(CasamaApp)));
      final router = c.read(routerProvider);
      expect(router.state.uri.path, '/bots');

      c.read(ageBandProvider.notifier).setBand(AgeBand.teen13to15);
      await tester.pump(const Duration(milliseconds: 100));
      for (final link in ['/settings/computers', '/computer?bot=$botId', '/computer/live?c=$computerId']) {
        router.go(link);
        await tester.pump(const Duration(milliseconds: 100));
        expect(router.state.uri.path, '/bots', reason: link);
      }

      // An adult opens the same page.
      c.read(ageBandProvider.notifier).setBand(AgeBand.adult18plus);
      router.go('/settings/computers');
      await tester.pump(const Duration(milliseconds: 100));
      expect(router.state.uri.path, '/settings/computers');
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('Settings has no Computers row in teen mode', (tester) async {
      // Advanced already open, so its rows are on screen.
      SharedPreferences.setMockInitialValues({
        'advanced.open': ['settings'],
      });
      await setSize(tester, const Size(430, 3200));
      await tester.pumpWidget(harness(FakeBackend(), const SettingsScreen()));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(find.byKey(const Key('settingsDevices')), 300, scrollable: find.byType(Scrollable).first);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('settingsComputers')), findsOneWidget);

      final c = ProviderScope.containerOf(tester.element(find.byType(SettingsScreen)));
      c.read(ageBandProvider.notifier).setBand(AgeBand.teen16to17);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('settingsComputers')), findsNothing);
      expect(find.byKey(const Key('settingsDevices')), findsOneWidget);
    });
  });

  testWidgets('a chat offers no way into the computer in teen mode', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await setSize(tester, const Size(1400, 900));
    await tester.pumpWidget(harness(FakeBackend(), const ChatScreen(botId: botId, conversationId: convId)));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('computerPanelToggle')), findsOneWidget);

    final c = ProviderScope.containerOf(tester.element(find.byType(ChatScreen)));
    c.read(ageBandProvider.notifier).setBand(AgeBand.teen13to15);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('computerPanelToggle')), findsNothing);
  });

  group('Words from app_en.arb (items 3, 4)', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('AlarmKit and HomeKit kinds have their own words', () {
      final l10n = lookupAppLocalizations(const Locale('en'));
      expect(deviceKindLabel(l10n, DeviceKind.alarm), 'alarms');
      expect(deviceKindLabel(l10n, DeviceKind.home), 'Home accessories');
    });

    for (final (name, error, shown) in [
      ('a failed scan says so in plain words', PlatformException(code: 'scan_failed', message: 'VisionKit exploded'), true),
      ('closing the scanner says nothing', PlatformException(code: 'cancelled'), false),
      ('no scan says nothing', null, false),
    ]) {
      testWidgets(name, (tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        await setSize(tester, const Size(430, 932));
        await tester.pumpWidget(
          harness(
            FakeBackend(),
            const ChatScreen(botId: botId, conversationId: convId),
            overrides: [documentScannerProvider.overrideWithValue(_Scanner(error))],
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('attachButton')));
        await tester.pumpAndSettle();
        expect(find.text('Scan document'), findsOneWidget);
        await tester.tap(find.byKey(const Key('attachScan')));
        await tester.pumpAndSettle();
        expect(find.text("Couldn't scan the document. Try again."), shown ? findsOneWidget : findsNothing);
        expect(find.textContaining('PlatformException'), findsNothing);
        expect(find.textContaining('VisionKit'), findsNothing);
        // Let any toast go.
        await tester.pump(const Duration(seconds: 10));
        await tester.pumpAndSettle();
        debugDefaultTargetPlatformOverride = null;
      });
    }
  });
  group('Siri: computers and stopping a bot (item 8)', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      AppLockSettingsNotifier.resetForTest();
    });

    (ProviderContainer, SiriBridge) bridgeFor(FakeBackend backend) {
      final c = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(backend),
          currentOrgIdProvider.overrideWithValue(orgId),
          organizationsProvider.overrideWith(_OrgsStub.new),
          botsProvider.overrideWith(() => _BotsStub(const [])),
        ],
      );
      addTearDown(c.dispose);
      return (c, c.read(siriBridgeProvider)!);
    }

    Future<Map<String, Object?>> call(SiriBridge bridge, String method, [Map<String, Object?> args = const {}]) async =>
        await bridge.handle(MethodCall(method, args)) as Map<String, Object?>;

    test('start_computer starts the named computer for an adult', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      final backend = FakeBackend();
      final (c, bridge) = bridgeFor(backend);
      c.read(ageBandProvider.notifier).setBand(AgeBand.adult18plus);
      final res = await call(bridge, 'start_computer', {'name': 'team'});
      expect(res['status'], SiriStatus.working);
      expect(res['say'], 'Starting Team computer.');
      expect(backend.startedComputers, [computerId]);
    });

    test('start_computer with no name (and an unknown band) starts the first computer', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      final backend = FakeBackend();
      final (_, bridge) = bridgeFor(backend);
      final res = await call(bridge, 'start_computer');
      expect(res['status'], SiriStatus.working);
      expect(backend.startedComputers, [computerId]);
    });

    test('start_computer says when there are no computers or the start fails, in the app words', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      final (_, none) = bridgeFor(_NoComputersBackend());
      final empty = await call(none, 'start_computer', {'name': 'Work'});
      expect(empty['status'], SiriStatus.failed);
      expect(empty['say'], 'You have no computers in this workspace.');

      final failing = FakeBackend()..startComputerError = Exception('boom');
      final (_, bridge) = bridgeFor(failing);
      final res = await call(bridge, 'start_computer', {'name': 'team'});
      expect(res['status'], SiriStatus.failed);
      expect(res['say'], "Couldn't start the computer right now.");
    });

    test('under 13 gets no computer either', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      final backend = FakeBackend();
      final (c, bridge) = bridgeFor(backend);
      c.read(ageBandProvider.notifier).setBand(AgeBand.under13);
      final res = await call(bridge, 'start_computer', {'name': 'team'});
      expect(res['status'], SiriStatus.failed);
      expect(res['say'], "Computers aren't available for this account.");
      expect(backend.startedComputers, isEmpty);
    });

    test('stop_bot asks which bot, and says when it is not running', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      final (_, bridge) = bridgeFor(FakeBackend());
      final which = await call(bridge, 'stop_bot');
      expect(which['status'], SiriStatus.failed);
      expect(which['say'], 'Which bot should I stop?');
      final idle = await call(bridge, 'stop_bot', {'bot_id': botId});
      expect(idle['status'], SiriStatus.replied);
      expect(idle['say'], "That bot isn't running right now.");
    });
  });
}
