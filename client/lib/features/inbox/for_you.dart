import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/backend.dart';
import '../../core/date_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/bot_avatar.dart';
import '../chat/widgets/chat_markdown.dart';
import '../skills/skill_proposals.dart';
import '../../ui/action_buttons.dart';
import '../../ui/glow_button.dart';
import 'decision_header.dart';
import 'dismiss_suggestion_sheet.dart';

/// The "For you" feed (D-114): the latest morning briefs, pending suggestions and approvals,
/// shown in the Inbox.
// Kept when the Inbox closes, so it opens with what it showed; the Inbox refreshes it as it opens.
final forYouProvider = FutureProvider<ForYou>((ref) async {
  final org = ref.watch(currentOrgProvider);
  if (org == null) return ForYou(briefs: const [], suggestions: const [], approvals: const []);
  return ref.watch(backendProvider).forYou(org.id);
});

/// Where the suggestions on one card stand (D-247), by their ids joined with commas. It reloads
/// with For you, so a suggestion answered elsewhere shows as answered here too.
final suggestionStatesProvider = FutureProvider.autoDispose.family<Map<String, SuggestionState>, String>((ref, ids) {
  ref.watch(forYouProvider);
  return ref.watch(backendProvider).suggestionStates(ids.split(','));
});

/// A morning brief (D-114): opens the conversation it was posted in.
class BriefCard extends ConsumerWidget {
  const BriefCard({super.key, required this.brief});
  final ForYouBrief brief;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final b = brief;
    final bot = (ref.watch(botsProvider).value ?? const <Bot>[]).where((x) => x.id == b.botId).firstOrNull;
    return AppCard(
      key: Key('brief-${b.botId}'),
      onTap: () => context.pushOnce('/bots/${b.botId}/chat?c=${b.conversationId}'),
      padding: const EdgeInsets.all(AppSpace.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpace.sm,
        children: [
          Row(children: [
            BotAvatar(name: bot?.name ?? '', avatar: bot?.avatarUrl, size: 28),
            const SizedBox(width: AppSpace.sm),
            Expanded(child: Text(l10n.morningBriefFrom(bot?.name ?? ''), style: context.textTheme.titleSmall)),
            TimeAgo(b.createdAt, style: context.textTheme.labelSmall),
          ]),
          ChatMarkdown(data: b.text),
        ],
      ),
    );
  }
}

/// A suggestion from a bot (D-114): do it, or dismiss it once or for good.
class SuggestionCard extends ConsumerWidget {
  const SuggestionCard({super.key, required this.s, required this.botName});
  final Suggestion s;
  final String botName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final scheme = context.colorScheme;
    final bot = (ref.watch(botsProvider).value ?? const <Bot>[]).where((x) => x.id == s.botId).firstOrNull;
    final name = bot?.name ?? botName;
    final urgent = s.urgency == SuggestionUrgencyEnum.urgent;
    final meta = context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant);
    final soon = _expiresSoon(context, s.expiresAt);
    final offer = (s.pushText ?? '').trim();
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.sm),
      child: AppCard(
        key: Key('suggestion-${s.id}'),
        borderColor: urgent ? colors.warning.withValues(alpha: context.isDark ? 0.35 : 0.3) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecisionHeader(
              botName: name,
              avatarUrl: bot?.avatarUrl,
              badge: urgent ? LucideIcons.zap : LucideIcons.lightbulb,
              badgeColor: urgent ? colors.warning : colors.info,
              title: s.title,
              details: [
                if (urgent) StatusLabel(text: l10n.priorityUrgent, color: colors.warning, pill: true),
                // One text, so the expiry wraps like words and never leaves a "·" hanging.
                Tooltip(
                  message: s.createdAt.toLocal().formattedExact(context),
                  child: Text.rich(TextSpan(style: meta, children: [
                    if (name.trim().isNotEmpty) TextSpan(text: '${name.trim()} · '),
                    TextSpan(text: relativeTime(s.createdAt, context)),
                    if (soon != null) ...[
                      const TextSpan(text: ' · '),
                      TextSpan(text: soon, style: TextStyle(color: colors.warning, fontWeight: FontWeight.w600)),
                    ],
                  ]), key: Key('details-${s.id}')),
                ),
              ],
            ),
            // The bot's own offer, as its push said it (D-247), then the details.
            if (offer.isNotEmpty) ...[
              const SizedBox(height: AppSpace.sm),
              Text(offer, style: context.textTheme.bodyMedium?.copyWith(height: 1.4)),
            ],
            if (s.bodyMd.isNotEmpty) ...[
              const SizedBox(height: AppSpace.xs),
              Text(s.bodyMd, style: (offer.isEmpty ? context.textTheme.bodyMedium : meta)?.copyWith(height: 1.4)),
            ],
            const SizedBox(height: AppSpace.md),
            ActionButtons(
              actions: [
                OutlinedButton(
                  key: Key('dismiss-${s.id}'),
                  onPressed: () async {
                    final how = await showDismissSuggestion(context, s: s, botName: botName);
                    if (how == null || !context.mounted) return;
                    final never = how == SuggestionDismissal.forever;
                    final ok = await runGuarded(context, () async {
                      await ref.read(backendProvider).dismissSuggestion(s.id, dontSuggestAgain: never);
                      return true;
                    });
                    ref.invalidate(forYouProvider);
                    // "For good" teaches the bot something, so say it landed; the card leaving is
                    // enough for "just this once".
                    if (never && ok == true && context.mounted) {
                      showToast(context, l10n.wontSuggestAgain(botName.trim().isEmpty ? l10n.theBot : botName.trim()), kind: ToastKind.success);
                    }
                  },
                  child: Text(l10n.dismiss),
                ),
                GlowButton(
                  key: Key('accept-${s.id}'),
                  onPressed: () async {
                    final r = await runGuarded(context, () => ref.read(backendProvider).acceptSuggestion(s.id));
                    ref.invalidate(forYouProvider);
                    if (r != null && context.mounted) GoRouter.maybeOf(context)?.pushOnce('/bots/${s.botId}/chat?c=${r.conversationId}');
                  },
                  child: Text(l10n.doIt),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// "Expires in 3 hours" once a suggestion has less than a day left (they last 3 days by default),
/// so the expiry only shows when it matters; null before that.
String? _expiresSoon(BuildContext context, DateTime expiresAt) {
  final l10n = context.l10n;
  final left = expiresAt.toLocal().difference(DateTime.now());
  if (left >= const Duration(hours: 24)) return null;
  if (left <= Duration.zero) return l10n.suggestionExpired;
  if (left.inMinutes < 60) return l10n.suggestionExpiresInMinutes(left.inMinutes < 1 ? 1 : left.inMinutes);
  return l10n.suggestionExpiresInHours(left.inHours);
}

/// Decisions waiting across bots (D-253, the Needs you row): approvals, takeovers, suggestions and
/// skill ideas.
final needsYouCountProvider = Provider<int>((ref) =>
    (ref.watch(approvalsProvider).value?.length ?? 0) +
    (ref.watch(takeoversProvider).value?.length ?? 0) +
    (ref.watch(forYouProvider).value?.suggestions.length ?? 0) +
    (ref.watch(skillProposalsProvider).value?.length ?? 0));

/// What the Updates row lists (D-253): notifications that aren't requests (those wait in Needs
/// you) and don't open a bot's chat (briefs, routine results and suggestions are read there).
bool isUpdateRowNotification(NotificationView n) =>
    !n.isRequest && !(n.link != null && RegExp(r'^/bots/[^/]+/chat').hasMatch(n.link!));

/// Unread updates (D-253, the Updates row's count): only what that list shows, so a brief read in
/// its chat never counts twice.
final unreadUpdatesProvider = Provider<int>((ref) =>
    (ref.watch(notificationsProvider).value ?? const <NotificationView>[]).where((n) => n.readAt == null && isUpdateRowNotification(n)).length);
