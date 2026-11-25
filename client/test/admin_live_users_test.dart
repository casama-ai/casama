import 'package:casama/core/chat_focus.dart';
import 'package:casama/features/admin/admin_screen.dart';
import 'package:casama/features/admin/live_users_card.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_test_helpers.dart';
import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

// Live users in the admin console (D-534, docs/LIVE-USERS-PLAN.md).
void main() {
  setUp(() {
    LiveUsersCard.disablePulseForTesting = true;
    SharedPreferences.setMockInitialValues({});
  });
  tearDown(() {
    LiveUsersCard.disablePulseForTesting = false;
  });

  for (final size in [const Size(1200, 2200), const Size(390, 2200)]) {
    testWidgets(
      'Live tile renders online now, GA4 realtime, sparkline, and expandable roster at ${size.width.toInt()} wide',
      (tester) async {
        await setSize(tester, size);
        final backend = FakeBackend();
        await tester.pumpWidget(harness(backend, const AdminScreen()));
        await tester.pumpAndSettle();
        await unlockAdmin(tester);
        await openAdminSection(tester, 'growth');
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.byKey(const Key('growthLiveCard')), findsOneWidget);
        expect(find.byKey(const Key('liveOnlinePanel')), findsOneWidget);
        expect(find.byKey(const Key('liveGa4Panel')), findsOneWidget);
        expect(find.byKey(const Key('liveGa4Sparkline')), findsOneWidget);
        expect(find.text('Online now'), findsOneWidget);
        expect(find.text('Last 30 min'), findsOneWidget);
        expect(find.text('2 in a chat · 1 in app'), findsOneWidget);
        expect(find.text('1 team account online (left out)'), findsOneWidget);
        expect(find.text('6 in last 5 min'), findsOneWidget);
        expect(find.textContaining('United States 11'), findsOneWidget);

        // Expand Who's online roster.
        expect(find.byKey(const Key('liveOnlineList')), findsNothing);
        await tester.tap(find.byKey(const Key('liveOnlineToggle')));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('liveOnlineList')), findsOneWidget);
        expect(find.text('Alice Rivera'), findsOneWidget);
        expect(find.text('alice@example.com'), findsOneWidget);
        expect(find.text('Bob Chen'), findsOneWidget);
        expect(find.text('carol@example.com'), findsOneWidget);
        expect(find.text('iOS ×2'), findsOneWidget);
        expect(find.text('In chat'), findsNWidgets(2));
        expect(find.text('In app'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets(
    'Live tile handles GA4 unconfigured and error states gracefully',
    (tester) async {
      await setSize(tester, const Size(1200, 1600));
      final backend = FakeBackend()
        ..liveGa4 = AdminLiveGa4(
          configured: false,
          error: null,
          activeUsers: 0,
          activeUsers5m: 0,
          byPlatform: const [],
          byCountry: const [],
          byMinute: const [],
          fetchedAt: DateTime.utc(2026, 11, 24),
          cached: false,
        );
      await tester.pumpWidget(
        harness(backend, const LiveUsersCard(autoRefresh: false)),
      );
      await tester.pumpAndSettle();
      expect(
        find.text("Google Analytics isn't set up on this server."),
        findsOneWidget,
      );
      expect(find.byKey(const Key('liveGa4Sparkline')), findsNothing);
      expect(find.byKey(const Key('liveOnlineCount')), findsOneWidget);

      final errBackend = FakeBackend()
        ..liveGa4 = AdminLiveGa4(
          configured: true,
          error: 'GA4 realtime answered 403',
          activeUsers: 0,
          activeUsers5m: 0,
          byPlatform: const [],
          byCountry: const [],
          byMinute: const [],
          fetchedAt: DateTime.utc(2026, 11, 24),
          cached: false,
        );
      await tester.pumpWidget(
        harness(errBackend, const LiveUsersCard(autoRefresh: false)),
      );
      await tester.pumpAndSettle();
      expect(find.text("Couldn't reach Google Analytics"), findsOneWidget);
      expect(find.text('GA4 realtime answered 403'), findsOneWidget);
    },
  );

  testWidgets(
    'Live tile auto-refreshes every 30 s only while in foreground and stops on dispose',
    (tester) async {
      await setSize(tester, const Size(1000, 1400));
      final backend = FakeBackend();
      await tester.pumpWidget(harness(backend, const LiveUsersCard()));
      await tester.pumpAndSettle();
      expect(backend.liveOnlineCalls, 1);
      expect(backend.liveGa4Calls, 1);

      await tester.pump(kAdminLiveRefresh);
      await tester.pump();
      expect(backend.liveOnlineCalls, 2);
      expect(backend.liveGa4Calls, 2);

      // Backgrounding pauses the 30 s timer.
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump(kAdminLiveRefresh * 2);
      expect(backend.liveOnlineCalls, 2);
      expect(backend.liveGa4Calls, 2);

      // Returning to foreground refreshes immediately and resumes the timer.
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();
      expect(backend.liveOnlineCalls, 3);
      expect(backend.liveGa4Calls, 3);

      // Disposing cancels the timer cleanly.
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(kAdminLiveRefresh * 2);
      expect(backend.liveOnlineCalls, 3);
      expect(backend.liveGa4Calls, 3);
    },
  );

  testWidgets(
    'Phase 2 ChatFocusReporter reports foreground presence outside a chat every 60 s',
    (tester) async {
      final backend = FakeBackend();
      final reporter = ChatFocusReporter(
        backend,
        prefs: await SharedPreferences.getInstance(),
      );
      addTearDown(reporter.dispose);

      reporter.enablePresence();
      await tester.pump();
      final id = await reporter.clientId();
      expect(backend.chatFocus[id], isNull);
      expect(backend.chatActive[id], isTrue);
      expect(backend.chatActiveSince[id], isNotNull);
      final initialCalls = backend.chatFocusCalls;
      final firstSince = backend.chatActiveSince[id];

      // Refreshes every 60 s while browsing outside a chat.
      await tester.pump(
        ChatFocusReporter.presenceRefresh + const Duration(seconds: 1),
      );
      expect(backend.chatFocusCalls, initialCalls + 1);
      expect(backend.chatActive[id], isTrue);
      expect(backend.chatActiveSince[id], firstSince);

      // Backgrounding outside a chat stops the timer without making an extra write.
      final callsBeforeBg = backend.chatFocusCalls;
      reporter.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump(ChatFocusReporter.presenceRefresh * 2);
      expect(backend.chatFocusCalls, callsBeforeBg);

      // Resuming reports presence immediately with a fresh activeSince timestamp.
      reporter.didChangeAppLifecycleState(AppLifecycleState.resumed);
      await tester.pump();
      expect(backend.chatFocusCalls, callsBeforeBg + 1);
      expect(backend.chatActive[id], isTrue);
      expect(backend.chatActiveSince[id], isNotNull);

      // Opening a chat switches back to 30 s refresh; backgrounding clears both chat & active.
      reporter.open('c-live');
      await tester.pump();
      expect(backend.chatFocus[id], 'c-live');
      expect(backend.chatActive[id], isTrue);
      reporter.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump();
      expect(backend.chatFocus[id], isNull);
      expect(backend.chatActive[id], isFalse);
    },
  );

  testWidgets(
    'Include team toggle loads and shows team accounts with Team badge',
    (tester) async {
      await setSize(tester, const Size(1200, 1800));
      final backend = FakeBackend();
      await tester.pumpWidget(harness(backend, const AdminScreen()));
      await tester.pumpAndSettle();
      await unlockAdmin(tester);
      await openAdminSection(tester, 'growth');
      await tester.pumpAndSettle();

      expect(backend.liveOnlineIncludeTeamCalls, contains(false));
      expect(find.text('Oliver'), findsNothing);

      await tester.tap(find.byKey(const Key('liveIncludeTeamToggle')));
      await tester.pumpAndSettle();
      expect(backend.liveOnlineIncludeTeamCalls.last, isTrue);
      expect(find.byKey(const Key('liveOnlineList')), findsOneWidget);
      expect(find.text('Oliver'), findsOneWidget);
      expect(find.text('owner@example.com'), findsOneWidget);
      expect(find.text('Team'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'Tapping a person in Who\'s online jumps straight to them in Admin -> Users',
    (tester) async {
      await setSize(tester, const Size(1200, 1800));
      final backend = FakeBackend();
      await tester.pumpWidget(harness(backend, const AdminScreen()));
      await tester.pumpAndSettle();
      await unlockAdmin(tester);
      await openAdminSection(tester, 'growth');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('liveOnlineToggle')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('livePerson-u1')));
      await tester.pumpAndSettle();

      // Now on Admin -> Users with search pre-filled to alice@example.com.
      expect(find.byKey(const Key('adminUsersSearch')), findsOneWidget);
      expect(find.text('alice@example.com'), findsWidgets);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'Admin -> Overview shows Online now stat and tapping it opens Growth',
    (tester) async {
      await setSize(tester, const Size(1200, 1800));
      final backend = FakeBackend();
      await tester.pumpWidget(harness(backend, const AdminScreen()));
      await tester.pumpAndSettle();
      await unlockAdmin(tester);

      final tile = find.byKey(const Key('overviewOnlineNow'));
      expect(tile, findsOneWidget);
      expect(
        find.descendant(of: tile, matching: find.text('Online now')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: tile, matching: find.text('3')),
        findsOneWidget,
      );

      await tester.tap(tile);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('growthLiveCard')), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
