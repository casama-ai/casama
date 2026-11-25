import 'package:casama/features/admin/pricing_tab.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

void main() {
  testWidgets(
    'pricing rows: the name in bold, the code on the line under it, the price on the right',
    (tester) async {
      await setSize(tester, const Size(390, 1200));
      final backend = FakeBackend();
      await tester.pumpWidget(
        harness(backend, const Scaffold(body: PricingTab())),
      );
      await tester.pumpAndSettle();

      final row = find.byKey(const Key('adminPlan-pro'));
      final name = find.descendant(of: row, matching: find.text('Pro'));
      final code = find.descendant(of: row, matching: find.text('pro'));
      final price = find.descendant(of: row, matching: find.text(r'$39/mo'));
      expect(name, findsOneWidget);
      expect(code, findsOneWidget);
      expect(price, findsOneWidget);
      expect(
        tester.getTopLeft(code).dy,
        greaterThan(tester.getBottomLeft(name).dy - 1),
      );
      expect(
        tester.getTopLeft(price).dx,
        greaterThan(tester.getTopRight(name).dx),
      );
      expect(tester.widget<Text>(name).style?.fontWeight, FontWeight.w700);
      expect(
        find.descendant(of: row, matching: find.text('3 workspaces')),
        findsOneWidget,
      );
      // No ' · '-joined line any more.
      expect(find.textContaining(' · '), findsNothing);
      // A plan with no price label says so.
      expect(
        find.descendant(
          of: find.byKey(const Key('adminPlan-free')),
          matching: find.text('No price label'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(const Key('adminPack-credits_10')),
          matching: find.text(r'$10 in credits'),
        ),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);

      // A row still opens its editor.
      await tester.tap(row);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('savePlan')), findsOneWidget);
    },
  );

  testWidgets('pricing: no plans or packs shows empty states', (tester) async {
    await setSize(tester, const Size(390, 1200));
    final backend = FakeBackend()
      ..pricing = AdminPricing(
        billingEnabled: true,
        plans: const [],
        packs: const [],
        settings: BillingSettings(markup: 1.3),
      );
    await tester.pumpWidget(
      harness(backend, const Scaffold(body: PricingTab())),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminNoPlans')), findsOneWidget);
    expect(find.byKey(const Key('adminNoPacks')), findsOneWidget);
    expect(find.text('No plans yet.'), findsOneWidget);
  });
}
