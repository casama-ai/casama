import 'package:flutter/gestures.dart' show PointerDeviceKind, kSecondaryMouseButton;
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:casama/app.dart';
import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/bots/bot_profile_screen.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/groups/group_chats.dart';
import 'package:casama/features/home/home_shell.dart' show groupBotsByFolder;
import 'package:casama/ui/middle_ellipsis_text.dart';
import 'package:casama_sdk/casama_sdk.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';

void main() {
  testWidgets('the sidebar counts what each bot waits on, and a group chat opens from its own section', (tester) async {
    await setSize(tester, const Size(1600, 1000));
    final backend = FakeBackend()
      ..groups.add(
        Conversation(id: 'g1', botId: botId, title: 'Every Bot', lastMessageAt: null, createdAt: DateTime(2026), kind: ConversationKindEnum.group, botIds: [botId]),
      );
    await tester.pumpWidget(ProviderScope(overrides: [backendProvider.overrideWithValue(backend)], child: const CasamaApp()));
    await tester.pumpAndSettle();
    // One pending approval for Ada; its approval notification isn't counted a second time.
    expect(find.descendant(of: find.byKey(const Key('sidebar-bot-$botId')), matching: find.text('1')), findsOneWidget);
    expect(find.text('Group chats'), findsOneWidget);
    expect(find.byType(GroupAvatar), findsOneWidget);

    await tester.tap(find.byKey(const Key('sidebar-group-g1')));
    await tester.pumpAndSettle();
    expect(find.text('Select a bot to chat'), findsNothing);
    expect(find.byType(ChatScreen), findsOneWidget);
  });

  testWidgets('on large screens with the sidebar open, a chat has no Back button, while a subpage pushed from it does', (tester) async {
    await setSize(tester, const Size(1600, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(ProviderScope(overrides: [backendProvider.overrideWithValue(backend)], child: const CasamaApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('sidebar-bot-$botId')));
    await tester.pumpAndSettle();

    expect(find.byType(ChatScreen), findsOneWidget);
    expect(find.byTooltip('Back'), findsNothing);

    await tester.tap(find.text('Ada').last);
    await tester.pumpAndSettle();
    expect(find.byTooltip('Back'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.byType(ChatScreen), findsOneWidget);
    expect(find.byTooltip('Back'), findsNothing);
  });

  test('loose bots that are working or waiting on the person sort first, the rest keep their order (E3)', () {
    final f = FakeBackend();
    final bots = [
      f.bot(id: 'a', name: 'A'),
      f.bot(id: 'b', name: 'B', status: BotStatusEnum.working),
      f.bot(id: 'c', name: 'C'),
      f.bot(id: 'd', name: 'D', status: BotStatusEnum.waiting),
      f.bot(id: 'e', name: 'E'),
    ];
    expect(groupBotsByFolder(bots, const []).single.$2.map((b) => b.id), ['b', 'd', 'a', 'c', 'e']);
  });

  test('while the pointer is over the sidebar the order holds, so a click lands on the bot it aimed at', () {
    final f = FakeBackend();
    final bots = [
      f.bot(id: 'a', name: 'A'),
      f.bot(id: 'b', name: 'B'),
      f.bot(id: 'c', name: 'C', status: BotStatusEnum.working),
    ];
    // C just started working: it would go first, but the pointer is over the list.
    expect(groupBotsByFolder(bots, const [], hold: ['a', 'b', 'c']).single.$2.map((b) => b.id), ['a', 'b', 'c']);
    // A bot new to the list goes after the held ones.
    expect(
      groupBotsByFolder([...bots, f.bot(id: 'd', name: 'D')], const [], hold: ['b', 'a', 'c']).single.$2.map((b) => b.id),
      ['b', 'a', 'c', 'd'],
    );
    expect(groupBotsByFolder(bots, const []).single.$2.map((b) => b.id), ['c', 'a', 'b']);
  });

  testWidgets('a working bot scrolled out of view below shows a cue that scrolls to it (E3)', (tester) async {
    await setSize(tester, const Size(1400, 820));
    final backend = FakeBackend();
    backend.extraBots.addAll([for (var i = 0; i < 20; i++) backend.bot(id: 'idle-$i', name: 'Idle $i')]);
    // A folder at the end of the list holds a working bot.
    backend.botFolder = 'Later';
    backend.extraBots.add(backend.bot(id: 'busy', name: 'Busy', status: BotStatusEnum.working));
    await tester.pumpWidget(ProviderScope(overrides: [backendProvider.overrideWithValue(backend)], child: const CasamaApp()));
    // The working dots animate for ever, so no pumpAndSettle.
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.byKey(const Key('sidebarMoreWorking')), findsOneWidget);
    expect(find.text('1 more working'), findsOneWidget);
    await tester.tap(find.byKey(const Key('sidebarMoreWorking')));
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.byKey(const Key('sidebarMoreWorking')), findsNothing);
    final row = tester.getRect(find.byKey(const Key('sidebar-bot-busy')));
    expect(row.bottom, lessThanOrEqualTo(820));
  });

  test('answered requests and read notifications drop out of the badges', () async {
    final backend = FakeBackend()
      ..storedNotifications = [
        NotificationView(id: 'a', kind: 'approval_request', title: '', body: '', createdAt: DateTime.now(), botId: botId),
        NotificationView(id: 'r', kind: 'routine_result', title: '', body: '', link: '/bots/$botId/chat?c=c1', createdAt: DateTime.now(), botId: botId),
        NotificationView(id: 'o', kind: 'routine_result', title: '', body: '', link: '/bots/other/chat', createdAt: DateTime.now(), botId: 'other'),
        // Opens in the inbox, not in Ada's chat: opening the chat can't clear it, so it isn't
        // on her badge (it kept the badge on while her chat was open).
        NotificationView(id: 's', kind: 'suggestion', title: '', body: '', link: '/inbox?tab=0', createdAt: DateTime.now(), botId: botId),
      ];
    final container = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
    addTearDown(container.dispose);
    final subs = [
      container.listen(approvalsProvider, (_, _) {}),
      container.listen(takeoversProvider, (_, _) {}),
      container.listen(notificationsProvider, (_, _) {}),
    ];
    addTearDown(() {
      for (final s in subs) {
        s.close();
      }
    });
    await container.read(notificationsProvider.future);
    await container.read(approvalsProvider.future);
    await container.read(takeoversProvider.future);
    // Ada: the pending approval and the routine result (the approval notification isn't extra).
    expect(container.read(botBadgeProvider(botId)), 2);
    await container.read(notificationsProvider.notifier).markBotChatRead(botId);
    expect(container.read(botBadgeProvider(botId)), 1);
    expect(container.read(botBadgeProvider('other')), 1);
    // The suggestion still waits in the inbox.
    expect(container.read(notificationsProvider).value!.firstWhere((n) => n.id == 's').readAt, isNull);
    expect(container.read(inboxBadgeProvider), 3);
  });

  double rowY(WidgetTester tester, String id) => tester.getTopLeft(find.byKey(Key('sidebar-bot-$id'))).dy;

  Future<FakeBackend> openApp(WidgetTester tester, {List<Bot> Function(FakeBackend)? bots}) async {
    await setSize(tester, const Size(1600, 1000));
    final backend = FakeBackend();
    backend.extraBots.addAll(bots?.call(backend) ?? [backend.bot(id: 'b', name: 'Bo'), backend.bot(id: 'c', name: 'Cy')]);
    await tester.pumpWidget(ProviderScope(overrides: [backendProvider.overrideWithValue(backend)], child: const CasamaApp()));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('sidebar-bot-$botId')));
    await tester.pumpAndSettle();
    // Past the hold that opening a chat starts.
    await tester.pump(const Duration(seconds: 5));
    return backend;
  }

  String at(WidgetTester tester) => GoRouter.of(tester.element(find.byType(ChatScreen))).state.uri.toString();
  // Also when no chat is on screen.
  String where(WidgetTester tester) => GoRouter.of(tester.element(find.byType(Navigator).last)).state.uri.toString();

  Future<void> cyStartsWorking(WidgetTester tester, FakeBackend backend) async {
    backend.extraBots[1] = backend.bot(id: 'c', name: 'Cy', status: BotStatusEnum.working);
    backend.botsChangedController.add(null);
    // The list refetches once a burst of changes settles (400 ms).
    await tester.pump(const Duration(milliseconds: 450));
    await tester.pump();
  }

  testWidgets('after the pointer leaves the sidebar the order holds a few seconds, then catches up (build 117 N1)', (tester) async {
    final backend = await openApp(tester);
    expect(rowY(tester, 'c'), greaterThan(rowY(tester, botId)));
    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer(location: tester.getCenter(find.byKey(const Key('sidebar-bot-b'))));
    await tester.pump();
    // Off to the composer, where the person types while the bot just messaged starts working.
    await mouse.moveTo(const Offset(1000, 900));
    await tester.pump();
    await cyStartsWorking(tester, backend);
    expect(rowY(tester, 'c'), greaterThan(rowY(tester, botId)), reason: 'still where the person last saw it');
    await tester.pump(const Duration(seconds: 4));
    await tester.pump();
    expect(rowY(tester, 'c'), lessThan(rowY(tester, botId)), reason: 'working bots go first once it settles');
    await mouse.removePointer();
  });

  testWidgets('a click that comes just as the rows move is dropped, not sent to the bot that slid under it (build 117 N1)', (tester) async {
    final backend = await openApp(tester);
    expect(at(tester), '/bots/$botId/chat');
    await cyStartsWorking(tester, backend);
    // Cy jumped to the top, where Ada was a moment ago.
    expect(rowY(tester, 'c'), lessThan(rowY(tester, botId)));
    await tester.tap(find.byKey(const Key('sidebar-bot-c')));
    await tester.pump();
    expect(at(tester), '/bots/$botId/chat');
    await tester.pump(const Duration(milliseconds: 700));
    await tester.tap(find.byKey(const Key('sidebar-bot-c')));
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(at(tester), '/bots/c/chat');
  });

  testWidgets('clicking the bot that is already open keeps its chat and topic (Windows 108 L4, 117 check 26)', (tester) async {
    await openApp(tester);
    GoRouter.of(tester.element(find.byType(ChatScreen))).go('/bots/$botId/chat?c=$convId');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('sidebar-bot-$botId')));
    await tester.pumpAndSettle();
    expect(at(tester), '/bots/$botId/chat?c=$convId');
    expect(find.byType(BotProfileScreen), findsNothing);
  });

  testWidgets('right-clicking a bot in the sidebar offers its profile, Archive and Delete (W-N2)', (tester) async {
    final backend = await openApp(tester);
    final row = find.byKey(const Key('sidebar-bot-b'));
    await tester.tap(row, buttons: kSecondaryMouseButton, kind: PointerDeviceKind.mouse);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('botMenuProfile')), findsOneWidget);
    expect(find.byKey(const Key('botMenuArchive')), findsOneWidget);
    await tester.tap(find.byKey(const Key('botMenuDelete')));
    await tester.pumpAndSettle();
    expect(find.text('Delete Bo?'), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirmDeleteBot')));
    await tester.pumpAndSettle();
    expect(backend.clearedBots, contains('b'));
    expect(find.byKey(const Key('sidebar-bot-b')), findsNothing);
    // The chat on screen (Ada's) stays.
    expect(at(tester), '/bots/$botId/chat');

    // A long press does the same on a touch screen.
    await tester.longPress(find.byKey(const Key('sidebar-bot-c')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('botMenuProfile')));
    await tester.pumpAndSettle();
    expect(find.byType(BotProfileScreen), findsOneWidget);
  });

  testWidgets('deleting the bot whose chat is open leaves its chat without a rebuild error (117 checks, Delete froze Windows)', (tester) async {
    final backend = await openApp(tester);
    final row = find.byKey(const Key('sidebar-bot-$botId'));
    await tester.tap(row, buttons: kSecondaryMouseButton, kind: PointerDeviceKind.mouse);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('botMenuDelete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirmDeleteBot')));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(backend.clearedBots, contains(botId));
    expect(where(tester), isNot(startsWith('/bots/$botId')));
    expect(find.text('Say hello to .'), findsNothing);
  });

  testWidgets('a chat whose bot left the list elsewhere goes to the bot list, not "Say hello to ." (117 checks)', (tester) async {
    final backend = await openApp(tester);
    expect(at(tester), startsWith('/bots/$botId'));
    // Archived by itself in chat (or on another device): the next list read lacks it.
    await backend.setBotArchived(botId, true);
    ProviderScope.containerOf(tester.element(find.byType(ChatScreen))).invalidate(botsProvider);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    // Still there for a moment (a bot made a moment ago isn't in the list yet either)…
    expect(where(tester), startsWith('/bots/$botId'));
    // …then it leaves.
    await tester.pump(botGoneWait + const Duration(milliseconds: 100));
    await tester.pumpAndSettle();
    expect(where(tester), isNot(startsWith('/bots/$botId')));
  });

  testWidgets('Ctrl+2 goes to Needs you even when the keyboard focus is outside the shell (Windows 117 check 19)', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    try {
      await openApp(tester);
      // The focus rests outside the shell, on a layer of the window's own (as after a menu, a
      // sheet or a tooltip closed).
      final outside = FocusNode();
      addTearDown(outside.dispose);
      final entry = OverlayEntry(builder: (_) => Focus(focusNode: outside, child: const SizedBox()));
      Overlay.of(tester.element(find.byType(ChatScreen)), rootOverlay: true).insert(entry);
      addTearDown(entry.remove);
      await tester.pump();
      outside.requestFocus();
      await tester.pump();
      expect(outside.hasPrimaryFocus, isTrue);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.digit2);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pumpAndSettle();
      expect(GoRouter.of(tester.element(find.byType(Scaffold).first)).state.uri.toString(), '/inbox?tab=0');
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('long names drop their middle, so names that differ at the end stay apart (W-N11)', (tester) async {
    await setSize(tester, const Size(800, 600));
    const style = TextStyle(fontSize: 16);
    Future<String> shown(String name) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: Center(child: SizedBox(width: 150, child: MiddleEllipsisText(name, style: style))))),
      );
      return tester.widget<Text>(find.descendant(of: find.byType(MiddleEllipsisText), matching: find.byType(Text))).data!;
    }

    final a = await shown('UT 117 Win Research A');
    final b = await shown('UT 117 Win Research B');
    expect(a, isNot(b));
    expect(a, endsWith('A'));
    expect(a, contains('…'));
    // Hovering shows the whole name.
    expect(find.byTooltip('UT 117 Win Research B'), findsOneWidget);
    expect(await shown('Ada'), 'Ada');
    expect(find.byType(Tooltip), findsNothing);
  });
}
