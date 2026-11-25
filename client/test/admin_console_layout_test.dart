import 'package:casama/features/admin/admin_nav.dart';
import 'package:casama/features/admin/admin_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'admin_test_helpers.dart';
import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// The whole console, through its own shell, at a phone and a desktop width
/// (docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §3): every section opens and nothing overflows.
void main() {
  for (final (name, size) in [('phone', const Size(360, 780)), ('desktop', const Size(1300, 900))]) {
    testWidgets('$name: every section opens without overflow', (tester) async {
      await setSize(tester, size);
      await tester.pumpWidget(harness(FakeBackend(), const AdminScreen()));
      await tester.pumpAndSettle();
      await unlockAdmin(tester);
      expect(tester.takeException(), isNull);
      for (final s in AdminSection.values) {
        // Resets and Partners show only where billing is on (Casama Cloud).
        if (s == AdminSection.overview || s == AdminSection.resets || s == AdminSection.partners) continue;
        await openAdminSection(tester, s.id);
        expect(tester.takeException(), isNull, reason: s.id);
        if (size.width < 840) {
          // A phone shows the section's name in the app bar, with a way back home.
          expect(find.byKey(const Key('adminSectionBack')), findsOneWidget, reason: s.id);
        }
      }
    });
  }

  testWidgets('phone: back goes from a section to the console home, not out of it', (tester) async {
    await setSize(tester, const Size(390, 844));
    await tester.pumpWidget(harness(FakeBackend(), const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'users');
    expect(find.byKey(const Key('adminNav-users')), findsNothing);
    await tester.tap(find.byKey(const Key('adminSectionBack')));
    await tester.pumpAndSettle();
    // Home again: the section list sits under the overview, below the fold.
    final home = find.byWidgetPredicate((w) => w is Scrollable && w.axisDirection == AxisDirection.down).first;
    await tester.scrollUntilVisible(find.byKey(const Key('adminNav-users')), 300, scrollable: home);
    expect(find.byKey(const Key('adminNav-users')), findsOneWidget);
  });

  testWidgets('desktop: the side list stays, and ?tab= opens a section', (tester) async {
    await setSize(tester, const Size(1300, 900));
    await tester.pumpWidget(harness(FakeBackend(), const AdminScreen(tab: 'mail')));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    expect(find.byKey(const Key('adminNav-overview')), findsOneWidget);
    expect(find.byKey(const Key('adminNav-security')), findsOneWidget);
    expect(find.byKey(const Key('adminSectionBack')), findsNothing);
    expect(find.byKey(const Key('adminLockNow')), findsOneWidget);
  });

  testWidgets('the section picker jumps by typing', (tester) async {
    await setSize(tester, const Size(390, 844));
    await tester.pumpWidget(harness(FakeBackend(), const AdminScreen(tab: 'users')));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    // The phone's title opens the picker.
    await tester.tap(find.descendant(of: find.byType(AppBar), matching: find.text('Users')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('adminSectionSearch')), 'mai');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPick-mail')), findsOneWidget);
    expect(find.byKey(const Key('adminPick-users')), findsNothing);
    // Words typed match the start of a word: "mai" is Mail, not the middle of "Domains" or "email".
    expect(find.byKey(const Key('adminPick-domains')), findsNothing);
    await tester.testTextInput.receiveAction(TextInputAction.go);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminSectionSearch')), findsNothing, reason: 'picker closed');
    expect(find.byKey(const Key('adminSectionBack')), findsOneWidget);
    expect(find.text('Mail'), findsWidgets);
  });

  testWidgets('desktop: the side search finds a setting and opens it', (tester) async {
    await setSize(tester, const Size(1300, 900));
    await tester.pumpWidget(harness(FakeBackend(), const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await tester.enterText(find.byKey(const Key('adminConsoleSearch')), 'call limits');
    await tester.pumpAndSettle();
    // The groups give way to what matches.
    expect(find.byKey(const Key('adminNav-users')), findsNothing);
    expect(find.byKey(const Key('adminFind-callLimits')), findsOneWidget);
    await tester.tap(find.byKey(const Key('adminFind-callLimits')));
    await tester.pumpAndSettle();
    // Services opened and scrolled down to the Advanced card.
    final tile = find.byKey(const Key('adminJson-callLimits'));
    expect(tile, findsOneWidget);
    expect(tester.getRect(tile).bottom, lessThan(900));
    expect(tester.getRect(tile).top, greaterThan(0));
    expect(tester.takeException(), isNull);
    // Clearing brings the groups back.
    await tester.tap(find.byKey(const Key('adminConsoleSearchClear')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminNav-users')), findsOneWidget);
  });

  testWidgets('phone: home search finds settings by other words, and says when nothing matches', (tester) async {
    await setSize(tester, const Size(390, 844));
    await tester.pumpWidget(harness(FakeBackend(), const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await tester.enterText(find.byKey(const Key('adminConsoleSearch')), 'face id');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminFind-screenLock')), findsOneWidget);
    await tester.enterText(find.byKey(const Key('adminConsoleSearch')), 'signup gate');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminFind-gate')), findsOneWidget);
    await tester.tap(find.byKey(const Key('adminFind-gate')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminSectionBack')), findsOneWidget);
    expect(find.descendant(of: find.byType(AppBar), matching: find.text('Waitlist')), findsOneWidget);
    await tester.tap(find.byKey(const Key('adminSectionBack')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('adminConsoleSearch')), 'zzqx');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminSearchNone')), findsOneWidget);
  });

  testWidgets('the picker finds settings too', (tester) async {
    await setSize(tester, const Size(1300, 900));
    await tester.pumpWidget(harness(FakeBackend(), const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.metaLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyK);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.metaLeft);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('adminSectionSearch')), 'markup');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPick-markup')), findsOneWidget);
    await tester.testTextInput.receiveAction(TextInputAction.go);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminMarkup')), findsOneWidget);
  });
}
