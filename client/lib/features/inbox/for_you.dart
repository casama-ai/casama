import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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

/// A morning brief (D-114, INBOX-TIDY-PLAN §6.4): opens the conversation it was posted in,
/// shows a "Since yesterday" summary line when available, and marks those updates read on open.
class BriefCard extends ConsumerWidget {
  const BriefCard({
    super.key,
    required this.brief,
    this.sinceYesterdaySummary,
    this.onOpened,
  });
  final ForYouBrief brief;
  final String? sinceYesterdaySummary;
  final VoidCallback? onOpened;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final b = brief;
    final bot = (ref.watch(botsProvider).value ?? const <Bot>[]).where((x) => x.id == b.botId).firstOrNull;
    final summary = sinceYesterdaySummary?.trim();
    return AppCard(
      key: Key('brief-${b.botId}'),
      onTap: () {
        onOpened?.call();
        context.pushOnce('/bots/${b.botId}/chat?c=${b.conversationId}');
      },
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
          if (summary != null && summary.isNotEmpty)
            Text(
              l10n.briefSinceYesterday(summary),
              key: Key('briefSince-${b.botId}'),
              style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
            ),
        ],
      ),
    );
  }
}

/// A suggestion from a bot (D-114, INBOX-TIDY-PLAN §4): buttons depend on [Suggestion.kind].
class SuggestionCard extends ConsumerWidget {
  const SuggestionCard({super.key, required this.s, required this.botName});
  final Suggestion s;
  final String botName;

  Future<void> _dismiss(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final how = await showDismissSuggestion(context, s: s, botName: botName);
    if (how == null || !context.mounted) return;
    final never = how == SuggestionDismissal.forever;
    final ok = await runGuarded(context, () async {
      await ref.read(backendProvider).dismissSuggestion(s.id, dontSuggestAgain: never);
      return true;
    });
    ref.invalidate(forYouProvider);
    if (never && ok == true && context.mounted) {
      showToast(
        context,
        l10n.wontSuggestAgain(botName.trim().isEmpty ? l10n.theBot : botName.trim()),
        kind: ToastKind.success,
      );
    }
  }

  Future<void> _snooze(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final res = await runGuarded(context, () => ref.read(backendProvider).snoozeSuggestion(s.id));
    ref.invalidate(forYouProvider);
    if (res != null && context.mounted) {
      showToast(
        context,
        res.expired == true ? l10n.suggestionSnoozedExpired : l10n.suggestionSnoozed,
        kind: ToastKind.info,
      );
    }
  }

  Future<void> _accept(
    BuildContext context,
    WidgetRef ref, {
    String? said,
    String? choice,
    DateTime? remindAt,
    String? directToast,
  }) async {
    final r = await runGuarded(
      context,
      () => ref.read(backendProvider).acceptSuggestion(
        s.id,
        said: said,
        choice: choice,
        remindAt: remindAt,
      ),
    );
    ref.invalidate(forYouProvider);
    if (r == null || !context.mounted) return;
    final convId = r.conversationId;
    if (r.direct == true || convId == null || convId.isEmpty) {
      if (directToast != null) showToast(context, directToast, kind: ToastKind.success);
      return;
    }
    GoRouter.maybeOf(context)?.pushOnce('/bots/${s.botId}/chat?c=$convId');
  }

  Future<void> _pickReminderTime(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final now = DateTime.now();
    final initial = (s.remindAt?.toLocal().isAfter(now) ?? false)
        ? s.remindAt!.toLocal()
        : now.add(const Duration(hours: 2));
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null || !context.mounted) return;
    final picked = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    final formatted = '${picked.formattedDate(context)}, ${picked.formattedTime(context)}';
    await _accept(
      context,
      ref,
      said: l10n.suggestionActionRemindMe(formatted),
      remindAt: picked,
      directToast: l10n.suggestionReminderSet(formatted),
    );
  }

  Future<void> _done(BuildContext context, WidgetRef ref, {String? openUrl}) async {
    await runGuarded(context, () async {
      await ref.read(backendProvider).doneSuggestion(s.id);
      return true;
    });
    ref.invalidate(forYouProvider);
    if (openUrl == null || openUrl.isEmpty || !context.mounted) return;
    if (openUrl.startsWith('/') && !openUrl.startsWith('//')) {
      GoRouter.maybeOf(context)?.pushOnce(openUrl);
      return;
    }
    final uri = Uri.tryParse(openUrl);
    if (uri != null && (uri.scheme == 'https' || uri.scheme == 'http')) {
      unawaited(launchUrl(uri, mode: LaunchMode.externalApplication));
    }
  }

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
    final kind = s.kind ?? SuggestionKind.do_;
    final badge = switch (kind) {
      SuggestionKind.answer => LucideIcons.messageCircleQuestion,
      SuggestionKind.turnOn => LucideIcons.repeat,
      SuggestionKind.remind => LucideIcons.bellRing,
      SuggestionKind.look => LucideIcons.eye,
      SuggestionKind.do_ => urgent ? LucideIcons.zap : LucideIcons.lightbulb,
    };
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
              badge: badge,
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
            _buildActions(context, ref, kind),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context, WidgetRef ref, SuggestionKind kind) {
    final l10n = context.l10n;
    switch (kind) {
      case SuggestionKind.answer:
        final choices = s.choices ?? const <String>[];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpace.xs,
          children: [
            if (choices.isNotEmpty)
              Wrap(
                spacing: AppSpace.xs,
                runSpacing: AppSpace.xs,
                children: [
                  for (final (i, choice) in choices.indexed)
                    FilledButton.tonal(
                      key: Key('choice-${s.id}-$i'),
                      onPressed: () => _accept(context, ref, choice: choice, said: choice),
                      child: Text(choice),
                    ),
                ],
              ),
            Wrap(
              spacing: AppSpace.xs,
              runSpacing: AppSpace.xxs,
              alignment: WrapAlignment.end,
              children: [
                TextButton(
                  key: Key('somethingElse-${s.id}'),
                  onPressed: () => GoRouter.maybeOf(context)?.pushOnce('/bots/${s.botId}/chat'),
                  child: Text(l10n.suggestionActionSomethingElse),
                ),
                TextButton(
                  key: Key('dismiss-${s.id}'),
                  onPressed: () => _dismiss(context, ref),
                  child: Text(l10n.notNow),
                ),
              ],
            ),
          ],
        );

      case SuggestionKind.turnOn:
        return ActionButtons(
          actions: [
            OutlinedButton(
              key: Key('dismiss-${s.id}'),
              onPressed: () => _dismiss(context, ref),
              child: Text(l10n.notNow),
            ),
            GlowButton(
              key: Key('accept-${s.id}'),
              onPressed: () => _accept(
                context,
                ref,
                said: l10n.suggestionActionTurnOn,
                directToast: l10n.suggestionTurnedOn,
              ),
              child: Text(l10n.suggestionActionTurnOn),
            ),
          ],
          extra: [
            TextButton(
              key: Key('later-${s.id}'),
              onPressed: () => _snooze(context, ref),
              style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
              child: Text(l10n.suggestionActionLater),
            ),
          ],
        );

      case SuggestionKind.remind:
        final when = s.remindAt?.toLocal();
        final whenLabel = when != null ? '${when.formattedDate(context)}, ${when.formattedTime(context)}' : null;
        final primaryText = whenLabel != null
            ? l10n.suggestionActionRemindMe(whenLabel)
            : l10n.suggestionActionPickTime;
        return ActionButtons(
          actions: [
            OutlinedButton(
              key: Key('dismiss-${s.id}'),
              onPressed: () => _dismiss(context, ref),
              child: Text(l10n.notNow),
            ),
            GlowButton(
              key: Key('accept-${s.id}'),
              onPressed: when != null
                  ? () => _accept(
                        context,
                        ref,
                        said: primaryText,
                        remindAt: when,
                        directToast: l10n.suggestionReminderSet(whenLabel!),
                      )
                  : () => _pickReminderTime(context, ref),
              child: Text(primaryText, textAlign: TextAlign.center),
            ),
          ],
          extra: [
            if (when != null)
              TextButton(
                key: Key('pickTime-${s.id}'),
                onPressed: () => _pickReminderTime(context, ref),
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                child: Text(l10n.suggestionActionPickTime),
              ),
          ],
        );

      case SuggestionKind.look:
        final link = s.url?.trim();
        return ActionButtons(
          actions: [
            OutlinedButton(
              key: Key('gotIt-${s.id}'),
              onPressed: () => _done(context, ref),
              child: Text(l10n.suggestionActionGotIt),
            ),
            if (link != null && link.isNotEmpty)
              GlowButton(
                key: Key('open-${s.id}'),
                onPressed: () => _done(context, ref, openUrl: link),
                child: Text(l10n.suggestionActionOpen),
              ),
          ],
        );

      case SuggestionKind.do_:
        final custom = s.label?.trim();
        final primaryLabel = (custom != null && custom.isNotEmpty) ? custom : l10n.doIt;
        return ActionButtons(
          actions: [
            OutlinedButton(
              key: Key('dismiss-${s.id}'),
              onPressed: () => _dismiss(context, ref),
              child: Text(l10n.notNow),
            ),
            GlowButton(
              key: Key('accept-${s.id}'),
              onPressed: () => _accept(context, ref, said: primaryLabel),
              child: Text(primaryLabel),
            ),
          ],
          extra: [
            TextButton(
              key: Key('later-${s.id}'),
              onPressed: () => _snooze(context, ref),
              style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
              child: Text(l10n.suggestionActionLater),
            ),
          ],
        );
    }
  }
}

/// Groups > 2 ideas from the same bot into one expandable card ("Ada · 4 ideas", §5.4).
class BotIdeasGroupCard extends StatefulWidget {
  const BotIdeasGroupCard({
    super.key,
    required this.botId,
    required this.botName,
    this.avatarUrl,
    required this.children,
  });
  final String botId;
  final String botName;
  final String? avatarUrl;
  final List<Widget> children;

  @override
  State<BotIdeasGroupCard> createState() => _BotIdeasGroupCardState();
}

class _BotIdeasGroupCardState extends State<BotIdeasGroupCard> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final name = widget.botName.trim().isEmpty ? l10n.aBot : widget.botName.trim();
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppCard(
            key: Key('botIdeasGroup-${widget.botId}'),
            onTap: () => setState(() => _expanded = !_expanded),
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.sm),
            child: Row(
              children: [
                BotAvatar(name: name, avatar: widget.avatarUrl, size: 32),
                const SizedBox(width: AppSpace.sm),
                Expanded(
                  child: Text(
                    l10n.botIdeasGrouped(name, widget.children.length),
                    style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(
                  _expanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
                  size: 18,
                  color: scheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
          if (_expanded) ...[
            const SizedBox(height: AppSpace.xs),
            ...widget.children,
          ],
        ],
      ),
    );
  }
}

/// "Expires in 3 hours" once a suggestion has less than a day left (they last 48h by default),
/// so the expiry only shows when it matters; null before that.
String? _expiresSoon(BuildContext context, DateTime expiresAt) {
  final l10n = context.l10n;
  final left = expiresAt.toLocal().difference(DateTime.now());
  if (left >= const Duration(hours: 24)) return null;
  if (left <= Duration.zero) return l10n.suggestionExpired;
  if (left.inMinutes < 60) return l10n.suggestionExpiresInMinutes(left.inMinutes < 1 ? 1 : left.inMinutes);
  return l10n.suggestionExpiresInHours(left.inHours);
}

/// Decisions waiting across bots (D-253, INBOX-TIDY-PLAN §4.1): approvals, takeovers,
/// non-`look` suggestions and skill ideas. `look` suggestions live in Updates.
final needsYouCountProvider = Provider<int>((ref) =>
    (ref.watch(approvalsProvider).value?.length ?? 0) +
    (ref.watch(takeoversProvider).value?.length ?? 0) +
    (ref.watch(forYouProvider).value?.suggestions.where((s) => s.kind != SuggestionKind.look).length ?? 0) +
    (ref.watch(skillProposalsProvider).value?.length ?? 0));

/// What the Updates row lists (D-253): notifications that aren't requests (those wait in Needs
/// you) and don't open a bot's chat (briefs, routine results and suggestions are read there).
bool isUpdateRowNotification(NotificationView n) =>
    !n.isRequest && !(n.link != null && RegExp(r'^/bots/[^/]+/chat').hasMatch(n.link!));

/// Unread updates (D-253, the Updates row's count): only what that list shows, so a brief read in
/// its chat never counts twice.
final unreadUpdatesProvider = Provider<int>((ref) =>
    (ref.watch(notificationsProvider).value ?? const <NotificationView>[]).where((n) => n.readAt == null && isUpdateRowNotification(n)).length);
