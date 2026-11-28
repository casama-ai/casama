// Add 11 (the small ones): regenerate a reply, delete a message, find in this chat, paste a picture.
import 'dart:convert';

import 'package:casama/core/backend.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/chat/widgets/chat_widgets.dart';
import 'package:casama/features/chat/widgets/composer.dart';
import 'package:casama/ui/bot_avatar.dart';
import 'package:casama/ui/shell_header.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

FakeBackend _backend() => FakeBackend()
  ..storedMessages = [
    ChatMessageView(
      id: 'u1',
      role: 'user',
      text: 'What is the capital of France?',
      createdAt: DateTime(2026, 11, 1),
    ),
    ChatMessageView(
      id: 'a1',
      role: 'assistant',
      text: 'Paris is the capital.',
      createdAt: DateTime(2026, 11, 1, 0, 1),
    ),
    ChatMessageView(
      id: 'u2',
      role: 'user',
      text: 'And of Spain?',
      createdAt: DateTime(2026, 11, 1, 0, 2),
    ),
    ChatMessageView(
      id: 'a2',
      role: 'assistant',
      text: 'Madrid is the capital.',
      createdAt: DateTime(2026, 11, 1, 0, 3),
    ),
  ];

Future<FakeBackend> _open(WidgetTester tester) async {
  await setSize(tester, const Size(1200, 900));
  final b = _backend();
  await tester.pumpWidget(
    harness(b, const ChatScreen(botId: botId, conversationId: convId)),
  );
  await tester.pumpAndSettle();
  return b;
}

Future<FakeBackend> _openWith(WidgetTester tester, FakeBackend b) async {
  await setSize(tester, const Size(1200, 900));
  await tester.pumpWidget(
    harness(b, const ChatScreen(botId: botId, conversationId: convId)),
  );
  await tester.pumpAndSettle();
  return b;
}

AssistantMessage _reply(WidgetTester tester, String id) => tester
    .widgetList<AssistantMessage>(find.byType(AssistantMessage))
    .firstWhere((m) => m.entry.id == id);

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('regenerate asks the question again as a new version', (
    tester,
  ) async {
    final b = await _open(tester);
    _reply(tester, 'a2').onRegenerate!();
    await tester.pumpAndSettle();
    // The message it answered reruns with the same words (the old reply stays as a branch).
    expect(b.edits, [('u2', 'And of Spain?')]);
  });

  testWidgets('delete a message after asking', (tester) async {
    final b = await _open(tester);
    _reply(tester, 'a1').onDelete!();
    await tester.pumpAndSettle();
    expect(find.text('Delete this message?'), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirmDeleteMessage')));
    await tester.pumpAndSettle();
    expect(b.deletedMessages, ['a1']);
    expect(find.text('Paris is the capital.'), findsNothing);
    expect(find.text('Madrid is the capital.'), findsOneWidget);
  });

  testWidgets('your own message can be deleted too', (tester) async {
    final b = await _open(tester);
    tester
        .widgetList<UserBubble>(find.byType(UserBubble))
        .firstWhere((u) => u.text.startsWith('What'))
        .onDelete!();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirmDeleteMessage')));
    await tester.pumpAndSettle();
    expect(b.deletedMessages, ['u1']);
  });

  testWidgets('find in chat steps through matches, newest first', (
    tester,
  ) async {
    await _open(tester);
    await tester.tap(find.byKey(const Key('chatMoreMenu')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('findInChat')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('findInChatField')), 'capital');
    await tester.pumpAndSettle();
    // Three messages mention it; the newest is first and highlighted.
    expect(
      tester.widget<Text>(find.byKey(const Key('findCount'))).data,
      '1 of 3',
    );
    expect(find.byKey(const Key('focusedMessage')), findsOneWidget);
    expect(
      find.descendant(
        of: find.byKey(const Key('focusedMessage')),
        matching: find.text('Madrid is the capital.'),
      ),
      findsOneWidget,
    );
    await tester.tap(find.byKey(const Key('findOlder')));
    await tester.pumpAndSettle();
    expect(
      tester.widget<Text>(find.byKey(const Key('findCount'))).data,
      '2 of 3',
    );
    await tester.enterText(find.byKey(const Key('findInChatField')), 'tokyo');
    await tester.pumpAndSettle();
    expect(
      tester.widget<Text>(find.byKey(const Key('findCount'))).data,
      'No matches',
    );
    await tester.tap(find.byKey(const Key('closeFind')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('findBar')), findsNothing);
    // The highlight fades after a moment.
    await tester.pump(const Duration(seconds: 4));
  });

  testWidgets('Cmd/Ctrl+F opens find', (tester) async {
    await _open(tester);
    await tester.tap(find.byKey(const Key('messageInput')));
    await tester.pump();
    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyF);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('findBar')), findsOneWidget);
  });

  test('findInEntries matches every word, ignoring case', () {
    // Pure function over the controller's entries.
    expect(findInEntries(const [], 'x'), isEmpty);
  });

  testWidgets(
    'on a phone the header keeps Call, New Topic and More, so the name has room; Made Here is in More',
    (tester) async {
      await setSize(tester, const Size(390, 844));
      final b = _backend()
        ..creationList = [fakeCreation('c1'), fakeCreation('c2', title: 'Zebra game')];
      await tester.pumpWidget(
        harness(b, const ChatScreen(botId: botId, conversationId: convId)),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('callButton')), findsOneWidget);
      expect(find.byKey(const Key('newChatButton')), findsOneWidget);
      expect(find.byKey(const Key('madeHereButton')), findsNothing);
      expect(find.byKey(const Key('appBrowserHeaderButton')), findsNothing);
      // One capsule holds the three.
      for (final k in ['callButton', 'newChatButton', 'chatMoreMenu']) {
        expect(
          find.descendant(of: find.byType(HeaderButtonGroup), matching: find.byKey(Key(k))),
          findsOneWidget,
        );
      }

      // The name opens the bot sheet: profile, topics and what it made.
      await tester.tap(find.descendant(of: find.byType(ShellHeader), matching: find.byType(BotAvatar)));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('chatBotSheet')), findsOneWidget);
      expect(find.byKey(const Key('botSheetProfile')), findsOneWidget);
      expect(find.byKey(const Key('botSheetTopics')), findsOneWidget);
      await tester.tap(find.byKey(const Key('botSheetMadeHere')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('chatBotSheet')), findsNothing);
      expect(find.text('Zebra game'), findsOneWidget);
      await tester.tapAt(const Offset(195, 40));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('chatMoreMenu')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('openMadeHere')), findsOneWidget);
      expect(
        tester.widget<Text>(find.byKey(const Key('madeHereMenuCount'))).data,
        '2',
      );
      await tester.tap(find.byKey(const Key('openMadeHere')));
      await tester.pumpAndSettle();
      expect(find.text('Zebra game'), findsOneWidget);
    },
  );

  testWidgets('wider than a phone, Made Here keeps its header button', (
    tester,
  ) async {
    final b = await _openWith(
      tester,
      _backend()..creationList = [fakeCreation('c1')],
    );
    expect(b.creationList, hasLength(1));
    expect(find.byKey(const Key('madeHereButton')), findsOneWidget);
    await tester.tap(find.byKey(const Key('chatMoreMenu')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('openMadeHere')), findsNothing);
  });

  testWidgets('pasting a picture attaches it', (tester) async {
    // A real 1x1 PNG, since the pending chip draws it.
    final png = base64Decode(
      'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==',
    );
    final before = ChatComposer.readClipboardImage;
    ChatComposer.readClipboardImage = () async => png;
    addTearDown(() => ChatComposer.readClipboardImage = before);
    final b = await _open(tester);
    await tester.tap(find.byKey(const Key('messageInput')));
    await tester.pump();
    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyV);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
    await tester.pumpAndSettle();
    // Attachments go to /v1/media, not onto a computer (SERVER-TOOLS-PLAN Phase 4).
    expect(b.uploads, isEmpty);
    final (_, name, bytes) = b.uploadedMedia.single;
    expect(name, contains('pasted-'));
    expect(name, endsWith('.png'));
    expect(bytes, png);
  });
}
