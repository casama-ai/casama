// File > New Chat on the Mac (E1): which bot the new chat is with, and the chat it opens stays
// blank instead of bringing the newest conversation back.
import 'package:casama/core/backend.dart';
import 'package:casama/core/mac_bridge.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

Bot _bot(
  String id, {
  num sortKey = 0,
  String? folder,
  DateTime? wrote,
  DateTime? botSaid,
}) {
  final last = wrote ?? botSaid;
  return Bot(
    id: id,
    orgId: 'org',
    name: id,
    avatarUrl: null,
    personaMd: '',
    modelPolicy: ModelPolicy(
      primary: ModelChoice(credentialId: 'cred', model: 'fixture'),
    ),
    autonomy: Autonomy.askRisky,
    visibility: Visibility.team,
    budget: BotBudget(perRunUsd: 1, dailyUsd: 10),
    status: BotStatusEnum.idle,
    defaultComputerId: null,
    folderId: folder,
    archivedAt: null,
    setupStatus: BotSetupStatusEnum.done,
    sortKey: sortKey,
    createdAt: DateTime(2026),
    lastMessage: last == null
        ? null
        : BotLastMessage(
            text: 'hi',
            from: wrote != null
                ? BotLastMessageFromEnum.you
                : BotLastMessageFromEnum.bot,
            fileName: null,
            fileMime: null,
            conversationId: 'c-$id',
            at: last,
          ),
  );
}

void main() {
  final bots = [
    _bot('a', sortKey: 2),
    _bot('b', sortKey: 1, wrote: DateTime(2026, 11, 20)),
    _bot('c', sortKey: 0, wrote: DateTime(2026, 11, 24)),
    _bot('d', sortKey: 3, botSaid: DateTime(2026, 11, 25)),
  ];

  test('in a bot chat, that bot, with the old chat address dropped', () {
    expect(
      newChatBot(
        location: Uri.parse('/bots/a/chat?c=old'),
        lastChatBot: 'b',
        bots: bots,
      ),
      'a',
    );
  });

  test('a group chat shown under a bot address is not that bot', () {
    expect(
      newChatBot(
        location: Uri.parse('/bots/a/chat?c=g1'),
        lastChatBot: 'b',
        bots: bots,
        groupIds: {'g1'},
      ),
      'b',
    );
  });

  test('elsewhere: the bot whose chat was open last', () {
    expect(
      newChatBot(
        location: Uri.parse('/inbox?tab=0'),
        lastChatBot: 'a',
        bots: bots,
      ),
      'a',
    );
    expect(
      newChatBot(
        location: Uri.parse('/settings'),
        lastChatBot: 'a',
        bots: bots,
      ),
      'a',
    );
  });

  test(
    'no chat opened yet: the bot written to last, not one that wrote last',
    () {
      expect(
        newChatBot(
          location: Uri.parse('/library'),
          lastChatBot: null,
          bots: bots,
        ),
        'c',
      );
      expect(
        newChatBot(
          location: Uri.parse('/library'),
          lastChatBot: 'gone',
          bots: bots,
        ),
        'c',
      );
    },
  );

  test(
    'nobody written to: the first bot in the sidebar; no bots: the bots list',
    () {
      final quiet = [
        _bot('x', sortKey: 5),
        _bot('y', sortKey: 1),
        _bot('z', sortKey: 0, folder: 'f'),
      ];
      final folders = [const BotFolder(id: 'f', name: 'F', sortKey: 0)];
      expect(
        newChatBot(
          location: Uri.parse('/inbox'),
          lastChatBot: null,
          bots: quiet,
          folders: folders,
        ),
        'y',
      );
      expect(
        newChatBot(
          location: Uri.parse('/inbox'),
          lastChatBot: null,
          bots: const [],
        ),
        isNull,
      );
    },
  );

  test('the chat New Chat opens stays blank', () async {
    final backend = FakeBackend()
      ..storedMessages = [
        ChatMessageView(
          id: 'm-1',
          role: 'assistant',
          text: 'Old chat',
          createdAt: DateTime(2026),
        ),
      ];
    final container = ProviderContainer(
      overrides: [backendProvider.overrideWithValue(backend)],
    );
    addTearDown(container.dispose);
    container.listen(chatControllerProvider(botId), (_, _) {});
    final c = container.read(chatControllerProvider(botId).notifier);
    await c.open(convId);
    expect(
      container.read(chatControllerProvider(botId)).conversationId,
      convId,
    );

    await c.newChat(keepOnNextOpen: true);
    // The screen at /bots/<bot>/chat (no c=) opens with no chat named.
    await c.open(null);
    final state = container.read(chatControllerProvider(botId));
    expect(state.conversationId, isNull);
    expect(state.entries, isEmpty);
    // Only that one open: the next one brings the newest chat as before.
    await c.open(null);
    expect(
      container.read(chatControllerProvider(botId)).conversationId,
      convId,
    );
  });
}
