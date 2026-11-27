import 'package:casama/features/admin/free_plans_tab.dart';
import 'package:casama_sdk/casama_sdk.dart' show CompSettings;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// Admin → Free Plans (D-461): gift codes are made, shown once and copied; free plans are given,
/// extended and ended.
void main() {
  final copied = <String>[];
  setUp(() {
    copied.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (call) async {
      if (call.method == 'Clipboard.setData') copied.add((call.arguments as Map)['text'] as String);
      return null;
    });
  });
  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, null);
  });

  for (final (name, size) in [('phone', const Size(390, 900)), ('desktop', const Size(1300, 900))]) {
    testWidgets('$name: lists codes and free plans without overflow', (tester) async {
      await setSize(tester, size);
      await tester.pumpWidget(harness(FakeBackend(), const Scaffold(body: FreePlansTab())));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byKey(const Key('freeCode-code-1')), findsOneWidget);
      expect(find.text('Used Up'), findsOneWidget);
      expect(find.byKey(const Key('freeComp-comp-1')), findsOneWidget);
    });
  }

  testWidgets('makes a gift code, shows it once and copies the link', (tester) async {
    await setSize(tester, const Size(500, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: FreePlansTab())));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('freeNewCode')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('freeCodeNote')), 'For Maya');
    await tester.tap(find.byKey(const Key('freeCodeCreate')));
    await tester.pumpAndSettle();

    final r = backend.lastCompCodeRequest!;
    expect(r.planCode, 'plus');
    expect(r.months, 3);
    expect(r.maxRedemptions, 1);
    expect(r.note, 'For Maya');
    expect(find.byKey(const Key('freeMadeCode')), findsOneWidget);
    expect(find.text('G-ABCDE-F7KQ2'), findsOneWidget);

    await tester.tap(find.byKey(const Key('freeMadeCopyLink')));
    await tester.pumpAndSettle();
    expect(copied, ['https://casama.ai/g/G-ABCDE-F7KQ2']);

    await tester.tap(find.byKey(const Key('freeMadeDone')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('freeMadeCode')), findsNothing);
    // The list now has the new code, by its hint only.
    expect(find.byKey(const Key('freeCode-code-2')), findsOneWidget);
  });

  testWidgets('turns a code off', (tester) async {
    await setSize(tester, const Size(500, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: FreePlansTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('freeCodeToggle-code-1')));
    await tester.pumpAndSettle();
    expect(backend.adminCodes.single.disabled, isTrue);
    expect(find.text('Off'), findsOneWidget);
  });

  testWidgets('gives a plan by email, then extends and ends it', (tester) async {
    await setSize(tester, const Size(500, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: FreePlansTab())));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('freeGive')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('freeGiveEmail')), 'not an email');
    await tester.tap(find.byKey(const Key('freeGiveSubmit')));
    await tester.pumpAndSettle();
    expect(backend.lastGrantRequest, isNull);
    await tester.enterText(find.byKey(const Key('freeGiveEmail')), 'maya@example.com');
    await tester.tap(find.byKey(const Key('freeGiveSubmit')));
    await tester.pumpAndSettle();
    expect(backend.lastGrantRequest!.email, 'maya@example.com');
    expect(backend.lastGrantRequest!.planCode, 'plus');
    expect(find.byKey(const Key('freeComp-comp-2')), findsOneWidget);

    await tester.tap(find.byKey(const Key('freeActions-comp-2')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('freeExtend-comp-2')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('freeExtendSubmit')));
    await tester.pumpAndSettle();
    expect(backend.adminCompList.first.months, 4);

    await tester.tap(find.byKey(const Key('freeActions-comp-2')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('freeEnd-comp-2')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('freeEndConfirm')));
    await tester.pumpAndSettle();
    expect(backend.adminCompList.first.endReason, 'revoked');
    // Running only: the ended one leaves the list.
    expect(find.byKey(const Key('freeComp-comp-2')), findsNothing);
  });

  testWidgets('says so when free plans are off', (tester) async {
    await setSize(tester, const Size(500, 900));
    final backend = FakeBackend();
    backend.compSettings = CompSettings(enabled: false, grantPlans: const ['plus'], codePlans: const ['plus'], maxMonths: 12, maxActive: 50);
    await tester.pumpWidget(harness(backend, const Scaffold(body: FreePlansTab())));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('freeOff')), findsOneWidget);
  });
}
