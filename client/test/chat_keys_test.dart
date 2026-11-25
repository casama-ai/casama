// On a Mac keyboard, Enter sends (Shift+Enter and an input method still composing keep it), and
// while the bot works the composer still takes every key, Space included (D-549, G1/G2). In a
// group chat, Enter during a run holds the message and sends it when the run ends, and a click
// into the Mac's in-app browser page takes Flutter's focus off the message box.
import 'package:casama/app.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/app_browser/app_browser_controller.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/groups/group_chats.dart';
import 'package:casama/features/home/home_shell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'app_browser_fakes.dart';
import 'fake_backend.dart';

Future<FakeBackend> _open(WidgetTester tester) async {
  await setSize(tester, const Size(900, 900));
  final backend = FakeBackend();
  await tester.pumpWidget(
    harness(backend, const ChatScreen(botId: botId, conversationId: convId)),
  );
  await tester.pumpAndSettle();
  return backend;
}

final _input = find.byKey(const Key('messageInput'));

Future<void> _type(WidgetTester tester, String text) async {
  await tester.showKeyboard(_input);
  await tester.enterText(_input, text);
  await tester.pump();
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));
  final mac = TargetPlatformVariant.only(TargetPlatform.macOS);

  testWidgets('Enter sends with the composer focused', (tester) async {
    final backend = await _open(tester);
    await _type(tester, 'who are you');
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(backend.sent, ['who are you']);
    expect(find.text('who are you'), findsWidgets);
    await tester.pump(const Duration(seconds: 1));
  }, variant: mac);

  testWidgets('Shift+Enter and a word still composing do not send', (
    tester,
  ) async {
    final backend = await _open(tester);
    await _type(tester, 'line one');
    await tester.sendKeyDownEvent(LogicalKeyboardKey.shiftLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.shiftLeft);
    await tester.pump();
    expect(backend.sent, isEmpty);

    tester.testTextInput.updateEditingValue(
      const TextEditingValue(
        text: 'にほん',
        selection: TextSelection.collapsed(offset: 3),
        composing: TextRange(start: 0, end: 3),
      ),
    );
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(backend.sent, isEmpty);
  }, variant: mac);

  testWidgets('while the bot works, Space reaches the text and Enter sends', (
    tester,
  ) async {
    final backend = await _open(tester);
    await _type(tester, 'first');
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    backend.runEventsController
      ..add(
        ev(1, 'run.started', {
          'trigger': 'chat',
          'model': 'm',
          'computer_id': null,
        }),
      )
      ..add(ev(2, 'message.delta', {'message_id': 'a1', 'text': 'Working'}));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.byKey(const Key('stopButton')), findsOneWidget);

    await _type(tester, 'next');
    // A key the framework handles never reaches the text field's input method.
    final spaceHandled = await tester.sendKeyEvent(LogicalKeyboardKey.space);
    expect(spaceHandled, isFalse, reason: 'Space must go on to the text');
    await _type(tester, 'next one');
    expect(tester.widget<TextField>(_input).controller!.text, 'next one');

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(backend.sent, ['first', 'next one']);
    await tester.pump(const Duration(seconds: 1));
  }, variant: mac);

  testWidgets(
    'in the whole Mac app, Enter sends and Space types while the bot works',
    (tester) async {
      await setSize(tester, const Size(1400, 820));
      final backend = FakeBackend();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [backendProvider.overrideWithValue(backend)],
          child: const CasamaApp(),
        ),
      );
      Future<void> settle() async {
        for (var i = 0; i < 20; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
      }

      await settle();
      GoRouter.of(tester.element(find.byType(HomeShell)))
          .go('/bots/$botId/chat?c=$convId');
      await settle();
      await _type(tester, 'first');
      expect(await tester.sendKeyEvent(LogicalKeyboardKey.enter), isTrue);
      await tester.pump();
      expect(backend.sent, ['first']);
      backend.runEventsController
        ..add(
          ev(1, 'run.started', {
            'trigger': 'chat',
            'model': 'm',
            'computer_id': null,
          }),
        )
        ..add(ev(2, 'message.delta', {'message_id': 'a1', 'text': 'Working'}));
      await settle();
      expect(find.byKey(const Key('stopButton')), findsOneWidget);
      await _type(tester, 'next');
      expect(await tester.sendKeyEvent(LogicalKeyboardKey.space), isFalse);
      await _type(tester, 'next one');
      expect(await tester.sendKeyEvent(LogicalKeyboardKey.enter), isTrue);
      await tester.pump();
      expect(backend.sent, ['first', 'next one']);
      await settle();
    },
    variant: mac,
  );

  testWidgets(
    'in a group chat, Enter while a bot works holds the message and sends it when the run ends',
    (tester) async {
      await setSize(tester, const Size(1400, 900));
      final backend = FakeBackend();
      backend.extraBots.add(backend.bot(id: 'bot-b', name: 'Bea'));
      final g = await backend.createGroupChat(botId, ['bot-b']);
      await tester.pumpWidget(
        harness(backend, GroupChatScreen(conversationId: g.id)),
      );
      await tester.pumpAndSettle();
      await _type(tester, 'first');
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(backend.sent, ['first']);
      backend.runEventsController
        ..add(
          ev(1, 'run.started', {
            'trigger': 'chat',
            'model': 'm',
            'computer_id': null,
          }),
        )
        ..add(ev(2, 'message.delta', {'message_id': 'a1', 'text': 'Working'}));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byKey(const Key('stopButton')), findsOneWidget);

      await _type(tester, 'next');
      expect(await tester.sendKeyEvent(LogicalKeyboardKey.space), isFalse);
      await _type(tester, 'next one');
      // Before: Enter was taken and did nothing, so it looked broken.
      expect(await tester.sendKeyEvent(LogicalKeyboardKey.enter), isTrue);
      await tester.pump();
      expect(backend.sent, ['first'], reason: 'a group run cannot take it');
      expect(find.text('Sends when this reply is done'), findsOneWidget);
      expect(tester.widget<TextField>(_input).controller!.text, 'next one');

      backend.runEventsController.add(
        ev(3, 'run.completed', {'final_message_id': 'a1'}),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(backend.sent, ['first', 'next one']);
      expect(tester.widget<TextField>(_input).controller!.text, isEmpty);
      await tester.pump(const Duration(seconds: 5));
    },
    variant: mac,
  );

  testWidgets(
    'a click or key in the browser page takes focus off the message box',
    (tester) async {
      final channel = FakeAppBrowserChannel();
      final container = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(FakeBackend()),
          ...appBrowserOverrides(channel: channel, focus: () => null),
        ],
      );
      addTearDown(container.dispose);
      container.read(appBrowserProvider);
      final input = FocusNode();
      addTearDown(input.dispose);
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TextField(focusNode: input))),
      );
      input.requestFocus();
      await tester.pump();
      expect(input.hasFocus, isTrue);
      // Native reports a real click or key in the page; AppKit gave the page the keyboard.
      channel.handler!.userTouched();
      await tester.pump();
      expect(input.hasFocus, isFalse);
    },
    // Windows too: Take Over turns into Hand Back in place and kept Flutter's focus.
    variant: TargetPlatformVariant({TargetPlatform.macOS, TargetPlatform.windows}),
  );
}
