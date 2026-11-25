// Casama's own Telegram bot and Discord app (CHAT-APPS-HOSTED-PLAN): the connect tiles on a bot's
// chat apps, the wait for Telegram or Discord, Settings → Chat apps, and Slack's "anyone" switch.
import 'package:casama/features/bots/channels_screen.dart';
import 'package:casama/features/bots/telegram_link.dart';
import 'package:casama_sdk/casama_sdk.dart' show Channel, ChannelKind, ChatLink, ChatLinkProvider;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

ChatLink _link({String? defaultBot = botId, String org = orgId, ChatLinkProvider provider = ChatLinkProvider.telegram}) => ChatLink(
  id: provider == ChatLinkProvider.telegram ? '66666666-6666-4666-8666-666666666666' : '88888888-8888-4888-8888-888888888888',
  provider: provider,
  externalName: 'Ana (@ana)',
  orgId: org,
  defaultBotId: defaultBot,
  linkedAt: DateTime.utc(2026, 11, 22, 10),
  lastSeenAt: null,
);

void main() {
  testWidgets('hidden when the server has no Telegram bot of its own', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const ChannelsScreen(botId: botId)));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('telegramConnect')), findsNothing);
    expect(find.text('No chat apps yet'), findsOneWidget);
  });

  testWidgets('connects in one tap: opens Telegram, waits, then says connected', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend()..telegramBot = 'CasamaBot';
    final opened = <Uri>[];
    await tester.pumpWidget(
      harness(
        backend,
        const ChannelsScreen(botId: botId),
        overrides: [
          telegramOpenerProvider.overrideWithValue((Uri u) async => opened.add(u)),
          telegramPollIntervalProvider.overrideWithValue(const Duration(milliseconds: 100)),
        ],
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text("Use Casama's Telegram bot"), findsOneWidget);
    await tester.tap(find.byKey(const Key('telegramConnect')));
    // The waiting sheet's spinner never settles: pump for a fixed time instead.
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(backend.telegramStarts, [botId]);
    expect(opened.single.toString(), 'https://t.me/CasamaBot?start=code123');
    expect(find.text('Finish in Telegram'), findsOneWidget);

    // The person presses Start in Telegram; the sheet notices.
    backend.chatLinkList.add(_link());
    await tester.pump(const Duration(milliseconds: 150));
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pumpAndSettle();
    expect(find.text('Telegram is connected'), findsOneWidget);
    await tester.tap(find.byKey(const Key('telegramWaitSubmit')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('telegramLinked')), findsOneWidget);
    expect(find.text('Your messages there go to Ada.'), findsOneWidget);
  });

  testWidgets('a link that talks to another bot can be pointed at this one', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend()
      ..telegramBot = 'CasamaBot'
      ..chatLinkList.add(_link(defaultBot: '77777777-7777-4777-8777-777777777777'));
    await tester.pumpWidget(harness(backend, const ChannelsScreen(botId: botId)));
    await tester.pumpAndSettle();
    expect(find.textContaining('Tap to send them to Ada.'), findsOneWidget);
    await tester.tap(find.byKey(const Key('telegramLinked')));
    await tester.pumpAndSettle();
    expect(backend.chatLinkActions, ['default:${_link().id}:$botId']);
    expect(find.text('Your messages there go to Ada.'), findsOneWidget);
  });

  testWidgets('Settings → Chat apps: connected account, disconnect', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend()
      ..telegramBot = 'CasamaBot'
      ..chatLinkList.add(_link());
    await tester.pumpWidget(harness(backend, const ChatAppsScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Telegram: Ana (@ana)'), findsOneWidget);
    await tester.tap(find.byKey(const Key('settingsTelegramDisconnect')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('telegramDisconnectConfirm')));
    await tester.pumpAndSettle();
    expect(backend.chatLinkActions, ['delete:${_link().id}']);
    expect(find.byKey(const Key('settingsTelegramConnect')), findsOneWidget);
  });

  testWidgets('Settings → Chat apps on a server without the bot', (tester) async {
    await setSize(tester, const Size(900, 1400));
    await tester.pumpWidget(harness(FakeBackend(), const ChatAppsScreen()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('settingsTelegramUnavailable')), findsOneWidget);
  });

  testWidgets('Discord: one sign-in from a bot\'s chat apps, then connected', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend()..discordOffered = true;
    final opened = <Uri>[];
    await tester.pumpWidget(
      harness(
        backend,
        const ChannelsScreen(botId: botId),
        overrides: [
          discordOpenerProvider.overrideWithValue((Uri u) async => opened.add(u)),
          telegramPollIntervalProvider.overrideWithValue(const Duration(milliseconds: 100)),
        ],
      ),
    );
    await tester.pumpAndSettle();
    // No Telegram bot on this server: only Discord's tile.
    expect(find.byKey(const Key('telegramConnect')), findsNothing);
    expect(find.text("Use Casama's Discord bot"), findsOneWidget);
    await tester.tap(find.byKey(const Key('discordConnect')));
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(backend.discordStarts, [botId]);
    expect(opened.single.host, 'discord.com');
    expect(find.text('Finish in Discord'), findsOneWidget);

    backend.chatLinkList.add(_link(provider: ChatLinkProvider.discord));
    await tester.pump(const Duration(milliseconds: 150));
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pumpAndSettle();
    expect(find.text('Discord is connected'), findsOneWidget);
    await tester.tap(find.byKey(const Key('discordWaitSubmit')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('discordLinked')), findsOneWidget);
    expect(find.text('Discord: Ana (@ana)'), findsOneWidget);
  });

  testWidgets('Settings → Chat apps: Telegram and Discord side by side, Slack points to a bot', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend()
      ..telegramBot = 'CasamaBot'
      ..discordOffered = true
      ..chatLinkList.add(_link(provider: ChatLinkProvider.discord));
    await tester.pumpWidget(harness(backend, const ChatAppsScreen()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('settingsTelegramConnect')), findsOneWidget);
    expect(find.text('Discord: Ana (@ana)'), findsOneWidget);
    expect(find.byKey(const Key('settingsSlack')), findsOneWidget);
    await tester.tap(find.byKey(const Key('settingsDiscordDisconnect')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('discordDisconnectConfirm')));
    await tester.pumpAndSettle();
    expect(backend.chatLinkActions, ['delete:${_link(provider: ChatLinkProvider.discord).id}']);
    expect(find.byKey(const Key('settingsDiscordConnect')), findsOneWidget);
  });

  testWidgets('Settings → Chat apps hides Discord on a server without it', (tester) async {
    await setSize(tester, const Size(900, 1400));
    await tester.pumpWidget(harness(FakeBackend()..telegramBot = 'CasamaBot', const ChatAppsScreen()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('settingsDiscordConnect')), findsNothing);
    expect(find.byKey(const Key('settingsDiscordUnavailable')), findsNothing);
  });

  testWidgets("Casama's Slack app: anyone in the workspace may talk to it, switched in the detail", (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend()
      ..channelList.add(
        Channel(
          id: 'ch-slack',
          botId: botId,
          kind: ChannelKind.slack,
          name: 'Slack: Acme',
          config: const {'app': 'casama', 'team_id': 'T42'},
          allowedSenders: const ['UANA'],
          enabled: true,
          webhookUrl: null,
          verifyToken: null,
          lastInboundAt: null,
          lastError: null,
          createdAt: DateTime.utc(2026, 11, 1),
        ),
      );
    await tester.pumpWidget(harness(backend, const ChannelsScreen(botId: botId)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('channel-ch-slack')));
    await tester.pumpAndSettle();
    expect(find.text('Anyone in this Slack workspace'), findsOneWidget);
    await tester.tap(find.byKey(const Key('anyoneInWorkspace')));
    await tester.pumpAndSettle();
    expect(backend.channelActions, ['update:ch-slack anyone:true']);
    expect(backend.channelList.single.config['anyone_in_workspace'], true);
  });
}
