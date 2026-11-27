import 'dart:async';

import 'package:dio/dio.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:casama/core/local_cache.dart';
import 'package:casama/features/chat/chat_screen.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

String inputText(WidgetTester tester) => tester
    .widget<TextField>(find.byKey(const Key('messageInput')))
    .controller!
    .text;

const otherBotId = '66666666-6666-4666-8666-666666666666';

void main() {
  testWidgets('a half-written message is still there after leaving the chat', (
    tester,
  ) async {
    await setSize(tester, const Size(700, 900));
    final cache = MemoryCache();
    final backend = FakeBackend();
    await tester.pumpWidget(
      harness(
        backend,
        const ChatScreen(botId: botId, conversationId: convId),
        cache: cache,
      ),
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('messageInput')),
      'Remind me to call the bank',
    );
    await tester.pumpAndSettle();

    // Closing the chat before the save timer runs still keeps it.
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      harness(
        backend,
        const ChatScreen(botId: botId, conversationId: convId),
        cache: cache,
      ),
    );
    await tester.pumpAndSettle();
    expect(inputText(tester), 'Remind me to call the bank');

    // Sending clears it, so the next visit starts empty.
    await tester.tap(find.byKey(const Key('sendButton')));
    await tester.pump(const Duration(seconds: 1));
    expect(inputText(tester), isEmpty);
    expect(cache.data['draft:$botId:$convId'], anyOf(isNull, 'null'));
  });

  /// One chat screen that the sidebar points at another bot, as on a computer (the router keeps it).
  Widget switcher(ValueNotifier<String> bot) => ValueListenableBuilder<String>(
    valueListenable: bot,
    builder: (_, id, _) => ChatScreen(botId: id),
  );

  testWidgets('each chat keeps its own draft when the screen moves to another bot', (tester) async {
    await setSize(tester, const Size(700, 900));
    final cache = MemoryCache();
    final backend = FakeBackend();
    final bot = ValueNotifier(botId);
    await tester.pumpWidget(harness(backend, switcher(bot), cache: cache));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('messageInput')), 'Find three robot vacuums');
    bot.value = otherBotId;
    await tester.pump();
    // The other bot's box starts empty, and what is typed while it loads stays with it.
    expect(inputText(tester), isEmpty);
    await tester.enterText(find.byKey(const Key('messageInput')), '@everyone pick a team name');
    await tester.pumpAndSettle();
    expect(inputText(tester), '@everyone pick a team name');
    expect(cache.data['draft:$botId:$convId'], '"Find three robot vacuums"');
    bot.value = botId;
    await tester.pumpAndSettle();
    expect(inputText(tester), 'Find three robot vacuums');
  });

  testWidgets('a send that fails after the person moved on goes back to its own chat, not the one on screen', (tester) async {
    await setSize(tester, const Size(700, 900));
    final cache = MemoryCache();
    final options = RequestOptions(path: '/v1/conversations');
    final backend = FakeBackend()
      ..clearedBots.add(botId);
    final bot = ValueNotifier(botId);
    await tester.pumpWidget(harness(backend, switcher(bot), cache: cache));
    await tester.pumpAndSettle();
    backend
      ..holdCreateConversation = Completer<void>()
      ..failCreateConversation = DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        response: Response(requestOptions: options, statusCode: 422),
      );
    await tester.enterText(find.byKey(const Key('messageInput')), 'Research request for one bot');
    await tester.pump();
    await tester.tap(find.byKey(const Key('sendButton')));
    await tester.pump();
    expect(inputText(tester), isEmpty);
    // The person opens the group before the send comes back.
    bot.value = otherBotId;
    await tester.pump();
    backend.holdCreateConversation!.complete();
    backend.holdCreateConversation = null;
    await tester.pumpAndSettle();
    expect(inputText(tester), isEmpty);
    expect(backend.sent, isEmpty);
    expect(cache.data['draft:$botId:new'], '"Research request for one bot"');
  });
}
