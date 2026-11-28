import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../ui/adaptive_modal.dart';

/// Archive and Delete for one bot, shared by its profile and the sidebar's right-click menu (the
/// customer's build 117 round, W-N2).
///
/// Delete takes the existing routes only: every direct chat with the bot is deleted (the same
/// call as Delete All Chats), then the bot is archived, so it stops running and leaves the
/// sidebar. Its settings, memory and usage records stay, in Archived bots. No hard delete of the
/// bot's row: it cascades into 48 tables and leaves behind what lives outside the database (its
/// computer, chat-app webhooks, mail address, sites), which nothing cleans up yet.
Future<bool> confirmArchiveBot(
  BuildContext context,
  WidgetRef ref,
  Bot bot,
) async {
  final l10n = context.l10n;
  final ok = await showConfirm(
    context: context,
    title: l10n.archiveBotTitle(bot.name),
    message: l10n.archiveBotBody,
    confirmLabel: l10n.archive,
    destructive: true,
    icon: LucideIcons.archive,
    confirmKey: const Key('confirmArchive'),
  );
  if (!ok || !context.mounted) return false;
  final done = await runGuarded(context, () async {
    await ref.read(backendProvider).setBotArchived(bot.id, true);
    return true;
  });
  if (done != true || !context.mounted) return false;
  await _gone(context, ref, bot);
  if (context.mounted) showSuccess(context, l10n.botArchived(bot.name));
  return true;
}

/// See [confirmArchiveBot].
Future<bool> confirmDeleteBot(
  BuildContext context,
  WidgetRef ref,
  Bot bot,
) async {
  final l10n = context.l10n;
  final ok = await showConfirm(
    context: context,
    title: l10n.deleteBotTitle(bot.name),
    message: l10n.deleteBotBody(bot.name),
    confirmLabel: l10n.delete,
    destructive: true,
    icon: LucideIcons.trash2,
    confirmKey: const Key('confirmDeleteBot'),
  );
  if (!ok || !context.mounted) return false;
  final backend = ref.read(backendProvider);
  final skipped = await runGuarded(context, () async {
    // Archived first, so no new run starts in a chat while the chats go.
    await backend.setBotArchived(bot.id, true);
    final (_, skipped) = await backend.deleteBotConversations(bot.id);
    return skipped;
  });
  if (skipped == null || !context.mounted) return false;
  ref.invalidate(conversationsProvider(bot.id));
  await _gone(context, ref, bot);
  if (!context.mounted) return true;
  if (skipped > 0) {
    showWarning(
      context,
      '${l10n.botDeleted(bot.name)} ${l10n.chatsKeptBusy(skipped)}',
    );
  } else {
    showSuccess(context, l10n.botDeleted(bot.name));
  }
  return true;
}

/// Off the list at once (cache included), then away from its pages if one is open.
Future<void> _gone(BuildContext context, WidgetRef ref, Bot bot) async {
  final router = GoRouter.maybeOf(context);
  await ref.read(botsProvider.notifier).drop(bot.id);
  ref
    ..invalidate(botsProvider)
    ..invalidate(archivedBotsProvider);
  if (router == null) return;
  final at = router.state.uri.path;
  if (at.startsWith('/bots/${bot.id}/') || at == '/bots/${bot.id}') {
    router.go('/bots');
  }
}
