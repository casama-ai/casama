import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import '../../ui/page.dart';

/// Casama's own Telegram bot and Discord app (CHAT-APPS-HOSTED-PLAN): the person's connected
/// accounts, and which shared bots this server offers. Null on errors, so the screens just hide
/// the option.
final chatLinksProvider = FutureProvider.autoDispose<ChatLinkList?>((ref) async {
  try {
    return await ref.watch(backendProvider).chatLinks();
  } catch (_) {
    return null;
  }
});

Future<void> _openOutside(Uri url) async {
  try {
    await launchUrl(url, mode: LaunchMode.externalApplication, webOnlyWindowName: '_blank');
  } catch (_) {}
}

/// Opens the t.me link: in the Telegram app when installed, else the browser. Overridable in tests.
final telegramOpenerProvider = Provider<Future<void> Function(Uri url)>((ref) => _openOutside);

/// Opens Discord's sign-in in the system browser. Overridable in tests.
final discordOpenerProvider = Provider<Future<void> Function(Uri url)>((ref) => _openOutside);

/// How often the waiting sheet checks for the new connection. Overridable in tests.
final telegramPollIntervalProvider = Provider<Duration>((ref) => const Duration(seconds: 2));

ChatLink? chatLinkOf(ChatLinkList? list, ChatLinkProvider provider) {
  for (final l in list?.items ?? const <ChatLink>[]) {
    if (l.provider == provider) return l;
  }
  return null;
}

ChatLink? telegramLinkOf(ChatLinkList? list) => chatLinkOf(list, ChatLinkProvider.telegram);

bool _offered(ChatLinkList? list, ChatLinkProvider p) =>
    p == ChatLinkProvider.discord ? list?.offered.discord != null : list?.offered.telegram != null;

/// What differs between the two shared bots on screen: words, icon, keys and how to open them.
class _Hosted {
  const _Hosted(this.provider);
  final ChatLinkProvider provider;

  bool get discord => provider == ChatLinkProvider.discord;
  String get key => discord ? 'discord' : 'telegram';
  String get settingsKey => discord ? 'settingsDiscord' : 'settingsTelegram';
  String get appName => discord ? 'Discord' : 'Telegram';
  IconData get icon => discord ? LucideIcons.messageCircle : LucideIcons.send;
  Provider<Future<void> Function(Uri url)> get opener => discord ? discordOpenerProvider : telegramOpenerProvider;
  Future<String?> start(WidgetRef ref, String botId) =>
      discord ? ref.read(backendProvider).startDiscordLink(botId) : ref.read(backendProvider).startTelegramLink(botId);

  String use(AppLocalizations l) => discord ? l.discordUseCasama : l.telegramUseCasama;
  String useHelp(AppLocalizations l, String bot) => discord ? l.discordUseCasamaHelp(bot) : l.telegramUseCasamaHelp(bot);
  String otherWorkspace(AppLocalizations l) => discord ? l.discordOtherWorkspace : l.telegramOtherWorkspace;
  String linkedTitle(AppLocalizations l, String name) => discord ? l.discordLinkedTitle(name) : l.telegramLinkedTitle(name);
  String nowGoesTo(AppLocalizations l, String bot) => discord ? l.discordNowGoesTo(bot) : l.telegramNowGoesTo(bot);
  String finish(AppLocalizations l) => discord ? l.discordFinish : l.telegramFinish;
  String finishHelp(AppLocalizations l) => discord ? l.discordFinishHelp : l.telegramFinishHelp;
  String openAgain(AppLocalizations l) => discord ? l.discordOpenAgain : l.telegramOpenAgain;
  String connected(AppLocalizations l) => discord ? l.discordConnected : l.telegramConnected;
  String connectedHelp(AppLocalizations l, String name) => discord ? l.discordConnectedHelp(name) : l.telegramConnectedHelp(name);
  String connectedHelpPlain(AppLocalizations l) => discord ? l.discordConnectedHelpPlain : l.telegramConnectedHelpPlain;
  String connect(AppLocalizations l) => discord ? l.discordConnect : l.telegramConnect;
  String disconnect(AppLocalizations l) => discord ? l.discordDisconnect : l.telegramDisconnect;
  String disconnectConfirm(AppLocalizations l) => discord ? l.discordDisconnectConfirm : l.telegramDisconnectConfirm;
  String disconnectHelp(AppLocalizations l) => discord ? l.discordDisconnectHelp : l.telegramDisconnectHelp;
  String pickBot(AppLocalizations l) => discord ? l.discordPickBot : l.telegramPickBot;
  String needsBot(AppLocalizations l) => discord ? l.discordNeedsBot : l.telegramNeedsBot;
  String notOffered(AppLocalizations l) => discord ? l.discordNotOffered : l.telegramNotOffered;
}

/// Makes a one-time link (Telegram) or Discord's sign-in, opens it, and waits until the
/// connection shows up. Returns true once connected.
Future<bool> connectChatApp(BuildContext context, WidgetRef ref, String botId, ChatLinkProvider provider) async {
  final h = _Hosted(provider);
  final url = await runGuarded(context, () => h.start(ref, botId));
  if (url == null || !context.mounted) return false;
  final before = chatLinkOf(
    await ref.read(backendProvider).chatLinks().catchError((_) => ChatLinkList(items: const [], offered: ChatLinkListOffered(telegram: null, discord: null))),
    provider,
  );
  await ref.read(h.opener)(Uri.parse(url));
  if (!context.mounted) return false;
  final ok = await showAdaptiveSheet<bool>(
    context: context,
    builder: (_) => _WaitForLink(hosted: h, url: url, before: before?.linkedAt),
  );
  ref.invalidate(chatLinksProvider);
  return ok ?? false;
}

Future<bool> connectTelegram(BuildContext context, WidgetRef ref, String botId) =>
    connectChatApp(context, ref, botId, ChatLinkProvider.telegram);

class _WaitForLink extends ConsumerStatefulWidget {
  const _WaitForLink({required this.hosted, required this.url, required this.before});
  final _Hosted hosted;
  final String url;
  final DateTime? before;

  @override
  ConsumerState<_WaitForLink> createState() => _WaitForLinkState();
}

class _WaitForLinkState extends ConsumerState<_WaitForLink> {
  Timer? _timer;
  final _started = DateTime.now();
  String? _connectedAs;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(ref.read(telegramPollIntervalProvider), (_) => _check());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _check() async {
    // The code or sign-in lasts 15 minutes; after that there's nothing to wait for.
    if (DateTime.now().difference(_started) > const Duration(minutes: 15)) {
      _timer?.cancel();
      return;
    }
    try {
      final link = chatLinkOf(await ref.read(backendProvider).chatLinks(), widget.hosted.provider);
      if (link == null || !mounted) return;
      if (widget.before != null && !link.linkedAt.isAfter(widget.before!)) return;
      _timer?.cancel();
      setState(() => _connectedAs = link.externalName ?? '');
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final h = widget.hosted;
    final done = _connectedAs != null;
    return FormSheet(
      key: Key('${h.key}Wait'),
      icon: done ? LucideIcons.circleCheck : h.icon,
      title: done ? h.connected(l10n) : h.finish(l10n),
      subtitle: done
          ? (_connectedAs!.isEmpty ? h.connectedHelpPlain(l10n) : h.connectedHelp(l10n, _connectedAs!))
          : h.finishHelp(l10n),
      submitLabel: done ? l10n.doneLabel : h.openAgain(l10n),
      submitKey: Key('${h.key}WaitSubmit'),
      showCancel: !done,
      onSubmit: () => done ? Navigator.pop(context, true) : ref.read(h.opener)(Uri.parse(widget.url)),
      children: [
        if (!done)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpace.md),
            child: Center(child: SizedBox.square(dimension: 24, child: CircularProgressIndicator(strokeWidth: 2))),
          ),
      ],
    );
  }
}

/// On a bot's chat apps screen: "Use Casama's Telegram bot" (or Discord bot) when the server has
/// one, or the connected account and where its messages go. Shows nothing on servers without one.
class HostedChatTile extends ConsumerWidget {
  const HostedChatTile({super.key, required this.provider, required this.botId, required this.botName, required this.orgId});
  final ChatLinkProvider provider;
  final String botId;
  final String botName;
  final String? orgId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(chatLinksProvider).value;
    if (!_offered(list, provider)) return const SizedBox.shrink();
    final h = _Hosted(provider);
    final l10n = context.l10n;
    final link = chatLinkOf(list, provider);
    final here = link != null && (orgId == null || link.orgId == orgId);
    final Widget tile;
    if (!here) {
      tile = GroupedTile(
        key: Key('${h.key}Connect'),
        icon: h.icon,
        title: h.use(l10n),
        subtitle: link == null ? h.useHelp(l10n, botName) : h.otherWorkspace(l10n),
        onTap: () => connectChatApp(context, ref, botId, provider),
        trailing: const Icon(LucideIcons.externalLink, size: 18),
      );
    } else {
      final toThis = link.defaultBotId == botId;
      final other = toThis ? null : ref.watch(botProvider(link.defaultBotId ?? ''))?.name;
      tile = GroupedTile(
        key: Key('${h.key}Linked'),
        icon: h.icon,
        title: h.linkedTitle(l10n, link.externalName ?? h.appName),
        subtitle: toThis ? l10n.telegramGoesTo(botName) : l10n.telegramGoesElsewhere(other ?? l10n.theBot, botName),
        onTap: toThis
            ? null
            : () async {
                await runGuarded(context, () => ref.read(backendProvider).updateChatLink(link.id, defaultBotId: botId));
                ref.invalidate(chatLinksProvider);
                if (context.mounted) showMessage(context, h.nowGoesTo(l10n, botName));
              },
        trailing: toThis ? const Icon(LucideIcons.check, size: 18) : null,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GroupedCard(children: [tile]),
    );
  }
}

/// Casama's Telegram bot on a bot's chat apps screen.
class TelegramLinkTile extends StatelessWidget {
  const TelegramLinkTile({super.key, required this.botId, required this.botName, required this.orgId});
  final String botId;
  final String botName;
  final String? orgId;

  @override
  Widget build(BuildContext context) =>
      HostedChatTile(provider: ChatLinkProvider.telegram, botId: botId, botName: botName, orgId: orgId);
}

/// Settings → Chat apps: the person's own connections to Casama's shared bots, and where Slack is.
class ChatAppsScreen extends ConsumerWidget {
  const ChatAppsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final value = ref.watch(chatLinksProvider);
    final bots = ref.watch(botsProvider).value ?? const <Bot>[];
    return SubPage(
      title: l10n.chatApps,
      body: AsyncView(
        value: value,
        onRetry: () => ref.invalidate(chatLinksProvider),
        data: (list) {
          return PageColumn(
            children: [
              FormNote(l10n.chatAppsSettingsHelp),
              const SizedBox(height: AppSpace.md),
              _HostedSection(hosted: const _Hosted(ChatLinkProvider.telegram), list: list, bots: bots),
              // Discord shows once the server offers it (or the person is still connected).
              if (_offered(list, ChatLinkProvider.discord) || chatLinkOf(list, ChatLinkProvider.discord) != null) ...[
                const SizedBox(height: AppSpace.md),
                _HostedSection(hosted: const _Hosted(ChatLinkProvider.discord), list: list, bots: bots),
              ],
              const SizedBox(height: AppSpace.md),
              // Slack installs per Slack workspace, for one bot: pick the bot, then Add to Slack there.
              GroupedCard(
                children: [
                  GroupedTile(
                    key: const Key('settingsSlack'),
                    icon: LucideIcons.hash,
                    title: 'Slack',
                    subtitle: l10n.chatAppsSlackHelp,
                    showChevron: bots.isNotEmpty,
                    onTap: bots.isEmpty
                        ? null
                        : bots.length == 1
                        ? () => context.pushOnce('/bots/${bots.first.id}/chat-apps')
                        : () => showAdaptiveSheet<void>(
                            context: context,
                            builder: (_) => _PickBotForSlack(bots: bots),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.md),
              FormNote(l10n.chatAppsPerBot),
            ],
          );
        },
      ),
    );
  }
}

class _HostedSection extends ConsumerWidget {
  const _HostedSection({required this.hosted, required this.list, required this.bots});
  final _Hosted hosted;
  final ChatLinkList? list;
  final List<Bot> bots;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final h = hosted;
    final link = chatLinkOf(list, h.provider);
    final offered = _offered(list, h.provider);
    final current = bots.where((b) => b.id == link?.defaultBotId).firstOrNull ?? bots.firstOrNull;
    return GroupedCard(
      children: [
        if (link != null) ...[
          GroupedTile(
            key: Key('${h.settingsKey}Linked'),
            icon: h.icon,
            title: h.linkedTitle(l10n, link.externalName ?? h.appName),
            subtitle: current == null ? null : l10n.telegramGoesTo(current.name),
            showChevron: bots.length > 1,
            onTap: bots.length > 1
                ? () => showAdaptiveSheet<void>(
                    context: context,
                    builder: (_) => _PickBot(hosted: h, link: link, bots: bots),
                  )
                : null,
          ),
          GroupedTile(
            key: Key('${h.settingsKey}Disconnect'),
            icon: LucideIcons.unlink,
            title: h.disconnect(l10n),
            destructive: true,
            onTap: () async {
              final ok = await showConfirm(
                context: context,
                title: h.disconnectConfirm(l10n),
                message: h.disconnectHelp(l10n),
                confirmLabel: h.disconnect(l10n),
                destructive: true,
                confirmKey: Key('${h.key}DisconnectConfirm'),
              );
              if (!ok || !context.mounted) return;
              await runGuarded(context, () => ref.read(backendProvider).deleteChatLink(link.id));
              ref.invalidate(chatLinksProvider);
            },
          ),
        ] else if (offered && bots.isNotEmpty)
          GroupedTile(
            key: Key('${h.settingsKey}Connect'),
            icon: h.icon,
            title: h.connect(l10n),
            subtitle: h.useHelp(l10n, current!.name),
            onTap: () => connectChatApp(context, ref, current.id, h.provider),
            trailing: const Icon(LucideIcons.externalLink, size: 18),
          )
        else
          GroupedTile(
            key: Key('${h.settingsKey}Unavailable'),
            icon: h.icon,
            title: h.appName,
            subtitle: offered ? h.needsBot(l10n) : h.notOffered(l10n),
          ),
      ],
    );
  }
}

class _PickBot extends ConsumerWidget {
  const _PickBot({required this.hosted, required this.link, required this.bots});
  final _Hosted hosted;
  final ChatLink link;
  final List<Bot> bots;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return FormSheet(
      icon: hosted.icon,
      title: hosted.pickBot(l10n),
      submitLabel: l10n.close,
      showCancel: false,
      onSubmit: () => Navigator.pop(context),
      children: [
        GroupedCard(
          children: [
            for (final b in bots)
              GroupedTile(
                key: Key('${hosted.key}Pick-${b.id}'),
                icon: LucideIcons.bot,
                title: b.name,
                trailing: b.id == link.defaultBotId ? const Icon(LucideIcons.check, size: 18) : null,
                onTap: () async {
                  await runGuarded(context, () => ref.read(backendProvider).updateChatLink(link.id, defaultBotId: b.id));
                  ref.invalidate(chatLinksProvider);
                  if (context.mounted) Navigator.pop(context);
                },
              ),
          ],
        ),
      ],
    );
  }
}

/// Settings → Chat apps → Slack with several bots: which bot's chat apps to open.
class _PickBotForSlack extends StatelessWidget {
  const _PickBotForSlack({required this.bots});
  final List<Bot> bots;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.hash,
      title: l10n.chatAppsSlackPickBot,
      submitLabel: l10n.close,
      showCancel: false,
      onSubmit: () => Navigator.pop(context),
      children: [
        GroupedCard(
          children: [
            for (final b in bots)
              GroupedTile(
                key: Key('slackPick-${b.id}'),
                icon: LucideIcons.bot,
                title: b.name,
                showChevron: true,
                onTap: () {
                  Navigator.pop(context);
                  context.pushOnce('/bots/${b.id}/chat-apps');
                },
              ),
          ],
        ),
      ],
    );
  }
}
