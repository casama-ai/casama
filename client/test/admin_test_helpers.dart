import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

/// Existing console tests still enter through the real authentication screen.
Future<void> unlockAdmin(WidgetTester tester) async {
  tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
  addTearDown(() async => tester.pumpWidget(const SizedBox.shrink()));
  await tester.enterText(
    find.byKey(const Key('adminPassword')),
    'test-password',
  );
  await tester.tap(find.byKey(const Key('adminUnlockPassword')));
  await tester.pumpAndSettle();
}

/// Opens a console section by its id ('workspaces', 'domains'): from the side list on a wide
/// window, or from the home list on a phone (going home first when another section is open).
Future<void> openAdminSection(WidgetTester tester, String id) async {
  final nav = find.byKey(Key('adminNav-$id'));
  if (nav.evaluate().isEmpty) {
    final back = find.byKey(const Key('adminSectionBack'));
    if (back.evaluate().isNotEmpty) {
      await tester.tap(back);
      await tester.pumpAndSettle();
    }
  }
  // The home list is lazy on a phone: rows far down aren't built until scrolled to.
  if (nav.evaluate().isEmpty) {
    // The search box above has a Scrollable of its own: take the page's vertical list.
    final list = find.byWidgetPredicate((w) => w is Scrollable && w.axisDirection == AxisDirection.down).first;
    await tester.scrollUntilVisible(nav, 300, scrollable: list);
  }
  await tester.ensureVisible(nav);
  await tester.pumpAndSettle();
  await tester.tap(nav);
  await tester.pumpAndSettle();
}
