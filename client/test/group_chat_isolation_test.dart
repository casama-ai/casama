// A group chat and its lead bot's own chat share one controller: going from the group to the bot
// never shows the group's thread in the bot's chat, even when listing the bot's chats fails
// (build 108, Windows: the group showed in a bot's chat under "← General" for four minutes).
import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

const groupId = '77777777-7777-4777-8777-777777777777';

void main() {
  test('the bot chat never opens the group after leaving it', () async {
    final backend = FakeBackend()
      ..storedMessages = [
        ChatMessageView(id: 'own-1', role: 'assistant', text: 'Your own chat', createdAt: DateTime(2026)),
      ]
      ..messagesByConversation[groupId] = [
        ChatMessageView(id: 'group-1', role: 'user', text: '@everyone what are you working on?', createdAt: DateTime(2026)),
      ];
    final container = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
    addTearDown(container.dispose);
    container.listen(chatControllerProvider(botId), (_, _) {});
    final c = container.read(chatControllerProvider(botId).notifier);

    // The bot's own chat first, so its last chat is known.
    c.group = false;
    await c.open(null);
    expect(container.read(chatControllerProvider(botId)).conversationId, convId);

    c.group = true;
    await c.open(groupId);
    expect(container.read(chatControllerProvider(botId)).conversationId, groupId);

    // Back to the bot while its chat list can't be read.
    backend.failConversations = true;
    c.group = false;
    await c.open(null);
    final s = container.read(chatControllerProvider(botId));
    expect(s.conversationId, isNot(groupId));
    final texts = [for (final e in s.entries) if (e is MessageEntry) e.text];
    expect(texts, isNot(contains('@everyone what are you working on?')));
  });
}
