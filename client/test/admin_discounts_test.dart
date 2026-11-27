import 'package:casama/features/admin/discounts_tab.dart';
import 'package:casama_sdk/casama_sdk.dart' show AdminDiscountState;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// Admin → Discount Codes (docs/DISCOUNT-ADMIN-PLAN.md): list, create with launch defaults and
/// guardrails, copy code/post line, turn off/on, and delete unused codes.
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
    testWidgets('$name: lists discount codes without overflow', (tester) async {
      await setSize(tester, size);
      await tester.pumpWidget(harness(FakeBackend(), const Scaffold(body: DiscountsTab())));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byKey(const Key('discountCard-dsc-1')), findsOneWidget);
      expect(find.text('CASAMA-PH'), findsOneWidget);
      expect(find.text('Made in Dodo'), findsOneWidget);
      // Used code has no Delete button; unused code has one.
      expect(find.byKey(const Key('discountDelete-dsc-1')), findsNothing);
      expect(find.byKey(const Key('discountDelete-dsc-2')), findsOneWidget);
    });
  }

  testWidgets('creates a launch-deal code, shows live preview, and copies post line', (tester) async {
    await setSize(tester, const Size(520, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: DiscountsTab())));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('discountNew')));
    await tester.pumpAndSettle();
    // Live preview shows Plus $15 → $7.50 for the first month, then $15
    expect(find.textContaining('Plus \$15 → \$7.50 for the first month, then \$15'), findsOneWidget);
    expect(find.text('Make Code'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('discountCode')), 'casama-maya');
    await tester.enterText(find.byKey(const Key('discountChannel')), "Maya's newsletter");
    await tester.tap(find.byKey(const Key('discountCreateSubmit')));
    await tester.pumpAndSettle();

    final req = backend.lastCreateDiscountRequest!;
    expect(req.code, 'CASAMA-MAYA');
    expect(req.percent, 50);
    expect(req.cycles, 1);
    expect(req.maxUses, 100);
    expect(req.perPerson, 1);
    expect(req.plans, containsAll(['plus', 'pro', 'max']));
    expect(req.confirmLarge, isFalse);

    expect(find.byKey(const Key('discountMadeCode')), findsOneWidget);
    await tester.tap(find.byKey(const Key('discountMadeCopyPost')));
    await tester.pumpAndSettle();
    expect(copied, ['Use CASAMA-MAYA at checkout on casama.ai for 50% off your first month']);

    await tester.tap(find.byKey(const Key('discountMadeDone')));
    await tester.pumpAndSettle();
    expect(find.text('CASAMA-MAYA'), findsOneWidget);
  });

  testWidgets('shows amber guardrail warning and requires Make Large Discount for >50% off', (tester) async {
    await setSize(tester, const Size(520, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: DiscountsTab())));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('discountNew')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('discountCode')), 'CASAMA-BIG');
    await tester.enterText(find.byKey(const Key('discountPercent')), '75');
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('discountLargeWarning')), findsOneWidget);
    expect(find.text('Make Large Discount'), findsOneWidget);

    await tester.tap(find.byKey(const Key('discountCreateSubmit')));
    await tester.pumpAndSettle();
    expect(backend.lastCreateDiscountRequest!.confirmLarge, isTrue);
  });

  testWidgets('turns a code off and deletes an unused code', (tester) async {
    await setSize(tester, const Size(520, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: DiscountsTab())));
    await tester.pumpAndSettle();

    // Turn off CASAMA-PH
    await tester.tap(find.byKey(const Key('discountToggle-dsc-1')));
    await tester.pumpAndSettle();
    expect(backend.adminDiscountList.firstWhere((d) => d.id == 'dsc-1').state, AdminDiscountState.off);

    // Delete unused CASAMA-UNUSED
    await tester.tap(find.byKey(const Key('discountDelete-dsc-2')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('discountDeleteConfirm')));
    await tester.pumpAndSettle();
    expect(backend.deletedDiscountIds, ['dsc-2']);
    expect(find.byKey(const Key('discountCard-dsc-2')), findsNothing);
  });
}
