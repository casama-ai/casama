import 'package:casama/features/admin/admin_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'admin_test_helpers.dart';
import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

// The admin console's Growth section (D-530, docs/ADMIN-GROWTH-PLAN.md).
void main() {
  for (final size in [const Size(1200, 2400), const Size(390, 2400)]) {
    testWidgets(
      'Growth shows tiles, charts, first steps, coming back, money and failures at ${size.width.toInt()} wide',
      (tester) async {
        await setSize(tester, size);
        final backend = FakeBackend();
        await tester.pumpWidget(harness(backend, const AdminScreen()));
        await tester.pumpAndSettle();
        await unlockAdmin(tester);
        await openAdminSection(tester, 'growth');
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(backend.growthDays, [30]);
        expect(find.text('1 team account left out'), findsOneWidget);
        expect(find.byKey(const Key('growthTiles')), findsOneWidget);
        for (final key in ['growthPeople', 'growthRuns', 'growthFirstSteps']) {
          expect(find.byKey(Key(key)), findsOneWidget);
        }
        expect(find.text('Got a first useful result'), findsOneWidget);
        // 30 days of 94 runs with 6 failed each.
        expect(find.text('2,820 runs · 180 failed (6%)'), findsOneWidget);

        await tester.scrollUntilVisible(
          find.byKey(const Key('growthSpeed')),
          400,
          scrollable: find.byType(Scrollable).last,
        );
        await tester.pumpAndSettle();
        expect(
          find.text('90%'),
          findsOneWidget,
        ); // 18 of 20 in their first week
        expect(find.text('cloud_daily_cap'), findsOneWidget);
        expect(find.text('Paid in, ever'), findsOneWidget);
        expect(find.text('Kept, ever'), findsOneWidget);
        // Revenue (D-552): every platform's real charges in one place.
        expect(find.byKey(const Key('growthRevenue')), findsOneWidget);
        expect(find.text(r'$49.00 · 1 charge'), findsOneWidget);
        expect(find.text(r'$29.98 · 2 charges'), findsOneWidget);
        expect(find.text(r'$0.00 · 0 charges'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('the range asks the server for that many days', (tester) async {
    await setSize(tester, const Size(1200, 2000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'growth');
    await tester.pumpAndSettle();
    await tester.tap(find.text('7 days'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('90 days'));
    await tester.pumpAndSettle();
    expect(backend.growthDays, [30, 7, 90]);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Users marks an account as team', (tester) async {
    await setSize(tester, const Size(900, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'users');
    await tester.pumpAndSettle();
    final list = find.byKey(const Key('adminUsersList'));
    expect(
      find.descendant(of: list, matching: find.text('Team')),
      findsNothing,
    );
    await tester.tap(
      find.descendant(of: list, matching: find.byTooltip('More actions')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('teamUser-u1')));
    await tester.pumpAndSettle();
    expect(backend.teamUsers, {'u1'});
    expect(
      find.descendant(of: list, matching: find.text('Team')),
      findsOneWidget,
    );

    await tester.tap(
      find.descendant(of: list, matching: find.byTooltip('More actions')),
    );
    await tester.pumpAndSettle();
    expect(find.text('Count as a customer'), findsOneWidget);
    await tester.tap(find.byKey(const Key('teamUser-u1')));
    await tester.pumpAndSettle();
    expect(backend.teamUsers, isEmpty);
  });
}
