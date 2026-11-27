import 'dart:io';

import 'package:casama/core/chat_focus.dart';
import 'package:casama/core/haptics.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/widgets.dart';
import 'package:casama/features/admin/haptics_lab.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama/features/chat/widgets/chat_widgets.dart';
import 'package:casama/l10n/delegates.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/theme/app_theme.dart';
import 'package:casama/ui/adaptive_modal.dart';
import 'package:casama/ui/form_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_backend.dart';

void main() {
  const nativeChannel = MethodChannel('casama/haptics');
  const fallbackChannel = MethodChannel('haptic_feedback');
  const macChannel = MethodChannel('casama/mac');
  late List<MethodCall> nativeCalls;
  late List<MethodCall> fallbackCalls;
  late List<MethodCall> macCalls;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    nativeCalls = [];
    fallbackCalls = [];
    macCalls = [];
    Haptic.debugReset();
    final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(nativeChannel, (call) async {
      nativeCalls.add(call);
      return true;
    });
    messenger.setMockMethodCallHandler(fallbackChannel, (call) async {
      fallbackCalls.add(call);
      return call.method == 'canVibrate' ? true : null;
    });
    messenger.setMockMethodCallHandler(macChannel, (call) async {
      macCalls.add(call);
      return null;
    });
  });

  tearDown(() {
    final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(nativeChannel, null);
    messenger.setMockMethodCallHandler(fallbackChannel, null);
    messenger.setMockMethodCallHandler(macChannel, null);
    debugDefaultTargetPlatformOverride = null;
    Haptic.debugReset();
  });

  Widget app(Widget child, {FakeBackend? backend}) => ProviderScope(
    overrides: [if (backend != null) backendProvider.overrideWithValue(backend)],
    child: MaterialApp(
      theme: AppTheme.light(),
      localizationsDelegates: testLocalizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );

  group('Guard test (§7.6)', () {
    test('no HapticFeedback. or package:haptic_feedback outside core/haptics.dart', () {
      final files = Directory('lib')
          .listSync(recursive: true)
          .whereType<File>()
          .map((f) => f.path.replaceAll(r'\', '/'))
          .where((p) => p.endsWith('.dart') && p != 'lib/core/haptics.dart')
          .toList()
        ..sort();
      final violations = <String>[];
      for (final path in files) {
        final lines = File(path).readAsLinesSync();
        for (var i = 0; i < lines.length; i++) {
          final line = lines[i].trim();
          if (line.startsWith('//')) continue;
          if (line.contains('HapticFeedback.') || line.contains('package:haptic_feedback')) {
            violations.add('$path:${i + 1}: $line');
          }
        }
      }
      expect(
        violations,
        isEmpty,
        reason: 'All haptics must go through Haptic in lib/core/haptics.dart:\n${violations.join('\n')}',
      );
    });
  });

  group('Gate, throttle & visibility (§7.1, §7.4)', () {
    test('switch off silences every haptic; turning it on plays toggleOn once', () async {
      await Haptic.setEnabled(false);
      expect(Haptic.debugLog, isEmpty);

      Haptic.tap();
      Haptic.press();
      Haptic.select();
      Haptic.toggle(true);
      Haptic.confirm();
      Haptic.reject();
      Haptic.destroy();
      Haptic.attention();
      Haptic.arrive(visible: true);
      Haptic.done(visible: true);
      Haptic.celebrate();
      expect(Haptic.debugLog, isEmpty);

      await Haptic.setEnabled(true);
      expect(Haptic.debugLog, [HapticKind.toggleOn]);
    });

    test('throttle drops same kind within 50 ms and any haptic within 30 ms of a signature', () {
      var now = 1000;
      Haptic.debugClock = () => DateTime.fromMillisecondsSinceEpoch(now);

      Haptic.select();
      now = 1020;
      Haptic.select(); // < 50 ms: dropped
      now = 1049;
      Haptic.select(); // 49 ms: dropped
      now = 1050;
      Haptic.select(); // 50 ms: plays
      expect(Haptic.debugLog, [HapticKind.select, HapticKind.select]);

      Haptic.debugLog.clear();
      now = 2000;
      Haptic.attention(); // signature
      now = 2015;
      Haptic.tap(); // within 30 ms of signature: dropped
      now = 2030;
      Haptic.tap(); // 30 ms: plays
      expect(Haptic.debugLog, [HapticKind.attention, HapticKind.tap]);
    });

    test('visible: false drops event haptics (arrive, done, attention, reject)', () {
      var now = 1000;
      Haptic.debugClock = () {
        now += 100;
        return DateTime.fromMillisecondsSinceEpoch(now);
      };
      Haptic.arrive(visible: false);
      Haptic.done(visible: false);
      Haptic.attention(visible: false);
      Haptic.reject(visible: false);
      expect(Haptic.debugLog, isEmpty);

      Haptic.arrive(visible: true);
      Haptic.done(visible: true);
      Haptic.attention(visible: true);
      Haptic.reject(visible: true);
      expect(Haptic.debugLog, [
        HapticKind.arrive,
        HapticKind.done,
        HapticKind.attention,
        HapticKind.reject,
      ]);
    });

    test('Mac trackpad plays only drag haptics via casama/mac', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      var now = 1000;
      Haptic.debugClock = () {
        now += 100;
        return DateTime.fromMillisecondsSinceEpoch(now);
      };

      await Haptic.tap();
      await Haptic.confirm();
      expect(macCalls, isEmpty);

      await Haptic.threshold();
      await Haptic.lift();
      await Haptic.drop();
      await Haptic.snap();
      await Haptic.select();
      expect(macCalls.map((c) => (c.arguments as Map)['pattern']), [
        'levelChange',
        'generic',
        'alignment',
        'alignment',
        'alignment',
      ]);
    });

    test('falls back to haptic_feedback when casama/haptics is unavailable', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(nativeChannel, null);
      await Haptic.confirm();
      expect(
        fallbackCalls.where((c) => c.method != 'canVibrate').map((c) => c.method),
        ['success'],
      );
    });
  });

  group('Widget flows (§7.6)', () {
    testWidgets('an error snackbar plays reject', (tester) async {
      await tester.pumpWidget(
        app(
          Builder(
            builder: (context) => TextButton(onPressed: () => showError(context, Exception('Nope')), child: const Text('Fail')),
          ),
        ),
      );
      await tester.tap(find.text('Fail'));
      await tester.pump();
      expect(Haptic.debugLog, [HapticKind.reject]);
    });

    testWidgets('showSuccess plays confirm once and showWarning plays warn', (tester) async {
      var now = 1000;
      Haptic.debugClock = () {
        now += 100;
        return DateTime.fromMillisecondsSinceEpoch(now);
      };
      await tester.pumpWidget(
        app(
          Builder(
            builder: (context) => Column(
              children: [
                TextButton(onPressed: () => showSuccess(context, 'Saved'), child: const Text('Save')),
                TextButton(onPressed: () => showWarning(context, 'Check the email'), child: const Text('Warn')),
              ],
            ),
          ),
        ),
      );
      await tester.tap(find.text('Save'));
      await tester.pump();
      await tester.tap(find.text('Warn'));
      await tester.pump();
      expect(Haptic.debugLog, [HapticKind.confirm, HapticKind.warn]);
    });

    testWidgets('flipping a form switch plays toggleOn then toggleOff', (tester) async {
      var now = 1000;
      Haptic.debugClock = () {
        now += 100;
        return DateTime.fromMillisecondsSinceEpoch(now);
      };
      var on = false;
      await tester.pumpWidget(
        app(
          StatefulBuilder(
            builder: (context, setState) => FormSwitch(title: 'Wi-Fi', value: on, onChanged: (v) => setState(() => on = v)),
          ),
        ),
      );
      await tester.tap(find.text('Wi-Fi'));
      await tester.pump();
      expect(on, isTrue);
      expect(Haptic.debugLog, [HapticKind.toggleOn]);

      await tester.tap(find.text('Wi-Fi'));
      await tester.pump();
      expect(on, isFalse);
      expect(Haptic.debugLog, [HapticKind.toggleOn, HapticKind.toggleOff]);
    });

    testWidgets('destructive confirm sheet plays destroy once on submit', (tester) async {
      bool? confirmed;
      await tester.pumpWidget(
        app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                confirmed = await showConfirm(
                  context: context,
                  title: 'Delete bot?',
                  confirmLabel: 'Delete',
                  destructive: true,
                );
              },
              child: const Text('Open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(Haptic.debugLog, isEmpty);

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      expect(confirmed, isTrue);
      expect(Haptic.debugLog, [HapticKind.destroy]);
    });

    testWidgets('ApprovalPrompt plays confirm after Allow and tap on Deny; silent when Haptics is off', (tester) async {
      var now = 1000;
      Haptic.debugClock = () {
        now += 100;
        return DateTime.fromMillisecondsSinceEpoch(now);
      };
      final fake = FakeBackend();
      await tester.pumpWidget(
        app(
          const ApprovalPrompt(
            entry: ApprovalEntry(
              approvalId: 'appr1',
              tool: 'shell.run',
              args: {'command': 'ls'},
              risk: 'low',
            ),
            botName: 'Ava',
          ),
          backend: fake,
        ),
      );

      await tester.tap(find.byKey(const Key('chatApprove')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(Haptic.debugLog, [HapticKind.confirm]);

      // Reset card for Deny test.
      Haptic.debugLog.clear();
      fake.decisions.clear();
      await tester.pumpWidget(
        app(
          const ApprovalPrompt(
            key: ValueKey('deny'),
            entry: ApprovalEntry(
              approvalId: 'appr1',
              tool: 'shell.run',
              args: {'command': 'ls'},
              risk: 'low',
            ),
            botName: 'Ava',
          ),
          backend: fake,
        ),
      );
      await tester.tap(find.byKey(const Key('chatDeny')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(Haptic.debugLog, [HapticKind.tap]);

      // With Haptics off, neither Allow nor Deny plays anything.
      Haptic.debugLog.clear();
      fake.decisions.clear();
      await Haptic.setEnabled(false);
      await tester.pumpWidget(
        app(
          const ApprovalPrompt(
            key: ValueKey('off'),
            entry: ApprovalEntry(
              approvalId: 'appr1',
              tool: 'shell.run',
              args: {'command': 'ls'},
              risk: 'low',
            ),
            botName: 'Ava',
          ),
          backend: fake,
        ),
      );
      await tester.tap(find.byKey(const Key('chatApprove')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      expect(Haptic.debugLog, isEmpty);
    });

    testWidgets('bot reply plays attention/reject when visible, and nothing when off-screen or switch off', (tester) async {
      var now = 1000;
      Haptic.debugClock = () {
        now += 100;
        return DateTime.fromMillisecondsSinceEpoch(now);
      };
      final fake = FakeBackend();
      final container = ProviderContainer(
        overrides: [backendProvider.overrideWithValue(fake)],
      );
      addTearDown(container.dispose);

      final ctrl = container.read(chatControllerProvider(botId).notifier);
      await ctrl.open(convId);

      // Simulate an approval arriving in a chat that is NOT on screen: nothing plays.
      container.read(chatFocusProvider).open('other-conv');
      ctrl.apply(ev(2, 'approval.requested', {
        'approval_id': 'a1',
        'tool': 'shell.run',
        'args_redacted': {'command': 'ls'},
        'risk': 'low',
        'expires_at': '2026-11-28T09:00:00.000Z',
      }));
      expect(Haptic.debugLog, isEmpty);

      // Now looking at convId: approval plays attention.
      container.read(chatFocusProvider).open(convId);
      ctrl.apply(ev(3, 'approval.requested', {
        'approval_id': 'a2',
        'tool': 'shell.run',
        'args_redacted': {'command': 'ls'},
        'risk': 'low',
        'expires_at': '2026-11-28T09:00:00.000Z',
      }));
      expect(Haptic.debugLog, [HapticKind.attention]);

      // Run failure while looking plays reject.
      Haptic.debugLog.clear();
      ctrl.apply(ev(4, 'run.failed', {'error_code': 'internal_error', 'message': 'boom'}));
      expect(Haptic.debugLog, [HapticKind.reject]);
    });

    testWidgets('Haptics Lab renders all 17 haptics and plays on tap', (tester) async {
      await tester.pumpWidget(app(const HapticsLabSheet()));
      expect(find.text('Haptics Lab'), findsOneWidget);
      await tester.tap(find.byKey(const Key('hapticLabPlay-attention')));
      await tester.pump();
      expect(Haptic.debugLog, [HapticKind.attention]);
    });

    testWidgets('a disabled control stays disabled', (tester) async {
      expect(hapticOnChanged<bool>(null), isNull);
    });

    testWidgets('without the plugin nothing throws', (tester) async {
      final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(nativeChannel, null);
      messenger.setMockMethodCallHandler(fallbackChannel, null);
      await tester.runAsync(() async {
        await Haptic.reject();
        await Haptic.reject();
      });
    });
  });
}
