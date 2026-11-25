import 'package:casama/features/admin/admin_screen.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'admin_test_helpers.dart';
import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// Inactive accounts (docs/INACTIVE-ACCOUNTS-PLAN.md) in Admin.
void main() {
  testWidgets('the owner sets the steps and announces the rule', (
    tester,
  ) async {
    await setSize(tester, const Size(900, 2400));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    final card = find.byKey(const Key('inactivityCard'));
    await tester.scrollUntilVisible(
      card,
      300,
      scrollable: find
          .descendant(
            of: find.byType(ListView),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    expect(find.text('Inactive accounts'), findsOneWidget);
    expect(find.textContaining('Announce the rule first'), findsOneWidget);

    await tester.tap(
      find.descendant(
        of: find.byKey(const Key('inactivity-rest')),
        matching: find.text('On'),
      ),
    );
    await tester.pumpAndSettle();
    expect(backend.inactivitySettings.rest, InactivityStepMode.on_);

    await tester.ensureVisible(find.byKey(const Key('announceInactivity')));
    await tester.tap(find.byKey(const Key('announceInactivity')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirmAnnounceInactivity')));
    await tester.pumpAndSettle();
    expect(backend.inactivityAnnouncements, 1);
    // Announced today: On steps still only report for 14 days.
    expect(
      find.textContaining('14 days after the announcement'),
      findsOneWidget,
    );
    expect(find.byKey(const Key('announceInactivity')), findsNothing);
  });

  testWidgets('Users shows where each account is and keeps one', (
    tester,
  ) async {
    await setSize(tester, const Size(900, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'users');
    await tester.pumpAndSettle();
    final list = find.byKey(const Key('adminUsersList'));
    expect(find.descendant(of: list, matching: find.text('Removal soon')), findsOneWidget);
    await tester.tap(find.descendant(of: list, matching: find.byTooltip('More actions')));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await tester.tap(find.byKey(const Key('keepUser-u1')));
    await tester.pumpAndSettle();
    // Keeping asks first, with what it means.
    expect(find.text('Never rested or removed for being unused'), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirmKeepUser')));
    await tester.pumpAndSettle();
    expect(backend.keptUsers, {'u1'});
    expect(find.descendant(of: list, matching: find.text('Kept')), findsOneWidget);
    expect(find.descendant(of: list, matching: find.text('Removal soon')), findsNothing);
  });
}
