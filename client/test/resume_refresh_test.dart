// Back in front, the app reads again: the open chat, the chats list and the inbox show what
// happened while it was away, without waiting for the live connection to say so.
import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// The app goes to the background, the way the system reports it.
Future<void> leaveApp(WidgetTester tester) async {
  for (final s in const [
    AppLifecycleState.inactive,
    AppLifecycleState.hidden,
    AppLifecycleState.paused,
  ]) {
    tester.binding.handleAppLifecycleStateChanged(s);
  }
  await tester.pump();
}

/// And comes back to the front.
Future<void> returnToApp(WidgetTester tester) async {
  for (final s in const [
    AppLifecycleState.hidden,
    AppLifecycleState.inactive,
    AppLifecycleState.resumed,
  ]) {
    tester.binding.handleAppLifecycleStateChanged(s);
  }
  await tester.pump();
}

ChatMessageView _message(String id, String role, String text, int minute) =>
    ChatMessageView(
      id: id,
      role: role,
      text: text,
      createdAt: DateTime(2026, 11, 1, 9, minute),
    );

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('the open chat shows a reply that came while the app was away', (
    tester,
  ) async {
    await setSize(tester, const Size(500, 900));
    final backend = FakeBackend()
      ..storedMessages = [_message('m1', 'user', 'Any news on the visa?', 0)];
    await tester.pumpWidget(
      harness(backend, const ChatScreen(botId: botId, conversationId: convId)),
    );
    await tester.pumpAndSettle();
    expect(find.text('Any news on the visa?'), findsOneWidget);

    await leaveApp(tester);
    // The bot answers while the phone is in a pocket. Nothing live reaches the app.
    backend.storedMessages = [
      ...backend.storedMessages,
      _message('m2', 'assistant', 'Approved this morning.', 30),
    ];
    final readsBefore = backend.messageRequests.length;
    await returnToApp(tester);
    await tester.pumpAndSettle();

    expect(backend.messageRequests.length, greaterThan(readsBefore));
    expect(
      find.textContaining('Approved this morning.', findRichText: true),
      findsOneWidget,
    );
  });

  testWidgets(
    'a first read that fails on the way back is tried again, with no offline note',
    (tester) async {
      await setSize(tester, const Size(500, 900));
      final backend = FakeBackend()
        ..storedMessages = [_message('m1', 'user', 'Any news on the visa?', 0)];
      await tester.pumpWidget(
        harness(
          backend,
          const ChatScreen(botId: botId, conversationId: convId),
        ),
      );
      await tester.pumpAndSettle();

      await leaveApp(tester);
      backend
        ..storedMessages = [
          ...backend.storedMessages,
          _message('m2', 'assistant', 'Approved this morning.', 30),
        ]
        // The connection the phone kept is gone: its first request fails.
        ..offline = true;
      await returnToApp(tester);
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byKey(const Key('offlineNote')), findsNothing);
      expect(find.text('Any news on the visa?'), findsOneWidget);

      backend.offline = false;
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(
        find.textContaining('Approved this morning.', findRichText: true),
        findsOneWidget,
      );
      expect(find.byKey(const Key('offlineNote')), findsNothing);
    },
  );

  testWidgets('a chat still unreachable after the second try says so', (
    tester,
  ) async {
    await setSize(tester, const Size(500, 900));
    final backend = FakeBackend()
      ..storedMessages = [_message('m1', 'user', 'Any news on the visa?', 0)];
    await tester.pumpWidget(
      harness(backend, const ChatScreen(botId: botId, conversationId: convId)),
    );
    await tester.pumpAndSettle();

    await leaveApp(tester);
    backend.offline = true;
    await returnToApp(tester);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('offlineNote')), findsOneWidget);
    expect(find.text('Any news on the visa?'), findsOneWidget);
  });

  testWidgets('the chats list reads again when the app comes back', (
    tester,
  ) async {
    final backend = FakeBackend();
    await tester.pumpWidget(
      harness(
        backend,
        Consumer(
          builder: (context, ref, _) {
            // As the home shell does: it tells the lists when the app is back in front.
            ref.watch(waitingRefreshProvider);
            return Column(
              children: [
                for (final b in ref.watch(botsProvider).value ?? const [])
                  Text(b.name),
              ],
            );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Ada'), findsOneWidget);
    expect(find.text('Grace'), findsNothing);

    await leaveApp(tester);
    // Made on the person's computer while the phone was away.
    backend.extraBots.add(backend.bot(id: 'bot-grace', name: 'Grace'));
    await returnToApp(tester);
    await tester.pump(BotsNotifier.changeSettle);
    await tester.pumpAndSettle();
    expect(find.text('Grace'), findsOneWidget);
  });

  group('the inbox', () {
    Widget inbox(FakeBackend backend) => harness(
      backend,
      Consumer(
        builder: (context, ref, _) {
          // As the home shell does: it tells the lists when the app is back in front.
          ref.watch(waitingRefreshProvider);
          return Column(
            children: [
              for (final n
                  in ref.watch(notificationsProvider).value ??
                      const <NotificationView>[])
                Text('${n.title}${n.readAt == null ? '' : ' (read)'}'),
              TextButton(
                onPressed: () =>
                    ref.read(notificationsProvider.notifier).markRead('n1'),
                child: const Text('Mark first read'),
              ),
            ],
          );
        },
      ),
    );

    NotificationView routineResult() => NotificationView(
      id: 'n2',
      kind: 'routine',
      title: 'Morning brief is ready',
      body: 'Three things for today',
      createdAt: DateTime(2026, 11, 1, 7),
    );

    testWidgets('shows what was sent while the app was away', (tester) async {
      final backend = FakeBackend();
      await tester.pumpWidget(inbox(backend));
      await tester.pumpAndSettle();
      expect(find.text('Morning brief is ready'), findsNothing);

      await leaveApp(tester);
      backend.storedNotifications = [
        routineResult(),
        ...backend.storedNotifications,
      ];
      await returnToApp(tester);
      await tester.pumpAndSettle();
      expect(find.text('Morning brief is ready'), findsOneWidget);
    });

    testWidgets(
      'reads again when the live connection is back (a computer waking up)',
      (tester) async {
        final backend = FakeBackend();
        await tester.pumpWidget(inbox(backend));
        await tester.pumpAndSettle();

        backend.storedNotifications = [
          routineResult(),
          ...backend.storedNotifications,
        ];
        backend.notificationsMissedController.add(null);
        await tester.pumpAndSettle();
        expect(find.text('Morning brief is ready'), findsOneWidget);
      },
    );

    testWidgets('keeps what was just marked read here', (tester) async {
      final backend = FakeBackend();
      await tester.pumpWidget(inbox(backend));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Mark first read'));
      await tester.pump();
      expect(find.text('Ada needs approval (read)'), findsOneWidget);

      // The server's list, read before it knew: the notification is still unread there.
      backend.notificationsMissedController.add(null);
      await tester.pumpAndSettle();
      expect(find.text('Ada needs approval (read)'), findsOneWidget);
    });
  });
}
