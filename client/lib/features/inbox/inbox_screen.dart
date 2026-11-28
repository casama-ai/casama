import 'dart:async';

import 'dart:convert';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/backend.dart';
import '../../core/display_text.dart';
import '../../core/number_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../core/haptics.dart';
import '../../core/tool_label.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/action_buttons.dart';
import '../../ui/app_card.dart';
import '../../ui/edge_fade.dart';
import '../../ui/reveal_when_selected.dart';
import '../../ui/page.dart';
import '../../ui/tab_reselect.dart';
import '../../ui/shell_header.dart';
import '../../ui/glow_button.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/form_sheet.dart';
import '../../ui/tool_words.dart';
import '../library/library_links.dart';
import '../pages/pages_screen.dart';
import '../skills/skill_proposals.dart';
import 'decision_header.dart';
import 'for_you.dart';
import '../app_lock/confirm_identity.dart';
// The one nudge after an answered request: the watch's (D-410) or the widgets' (D-405).
import '../watch/watch_nudge.dart';

/// What the Inbox shows: everything, only what waits on a decision, morning briefs, or updates
/// (D-253: what isn't already in a bot's chat). Pages moved to the Library (D-274).
enum InboxFilter {
  all,
  needsYou,
  briefs,
  updates;

  /// From Chats (D-253): `/inbox?tab=0` is Needs you, `/inbox` the Updates row.
  static InboxFilter fromTab(String? tab) => tab == '0' ? needsYou : updates;
}

/// Requests waiting for you (approvals, takeovers, suggestions, skill ideas), then morning briefs,
/// notifications and new pages in one list, with filter chips.
class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key, this.initialFilter = InboxFilter.all, this.title});
  final InboxFilter initialFilter;

  /// Opened from Chats (D-253): "Needs you", or "Casama" for updates.
  final String? title;

  @override
  ConsumerState<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  late var _filter = widget.initialFilter;

  @override
  void initState() {
    super.initState();
    // What the Inbox showed last time stays while it reloads, so opening it never flashes empty.
    refreshKeptOnOpen(context, [forYouProvider, skillProposalsProvider, pagesProvider(null)]);
  }

  @override
  void didUpdateWidget(InboxScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialFilter != widget.initialFilter) _filter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final needsYou = ref.watch(needsYouCountProvider);
    String label(InboxFilter f) => switch (f) {
      InboxFilter.all => l10n.filterAll,
      InboxFilter.needsYou => needsYou == 0 ? l10n.inboxNeedsYou : l10n.inboxNeedsYouCount(needsYou),
      InboxFilter.briefs => l10n.inboxBriefs,
      InboxFilter.updates => l10n.inboxUpdates,
    };
    // Opened from Chats (D-253): Needs you and Updates are one list each.
    final chips = switch (widget.initialFilter) {
      InboxFilter.needsYou when widget.title != null => const <InboxFilter>[],
      InboxFilter.updates => const <InboxFilter>[],
      _ => const [InboxFilter.all, InboxFilter.needsYou, InboxFilter.briefs],
    };
    // The iOS status bar scrolls the feed to the top.
    return PrimaryScrollController(
      controller: TabReselect.inbox,
      child: Scaffold(
      appBar: ShellHeader(
        title: widget.title ?? l10n.inbox,
        phoneFallback: '/bots',
        bottom: chips.isEmpty ? null : PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: SizedBox(
            height: 52,
            // Scrolls sideways, so the chips never wrap or overflow on a small phone.
            child: EdgeFade(child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(AppSpace.md, 0, AppSpace.md, AppSpace.xxs),
              child: Row(
                spacing: AppSpace.xs,
                children: [
                  for (final f in chips)
                    RevealWhenSelected(selected: _filter == f, child: ChoiceChip(
                      key: Key('inboxFilter-${f.name}'),
                      showCheckmark: false,
                      label: Text(label(f), style: const TextStyle(fontFeatures: AppText.tabular)),
                      selected: _filter == f,
                      onSelected: (_) => setState(() => _filter = f),
                    )),
                ],
              ),
            )),
          ),
        ),
      ),
      body: _InboxFeed(filter: _filter),
    ),
    );
  }
}

/// Whether [n] asks for a decision that is still waiting in Needs you, so Updates doesn't show it
/// twice. Answered requests stay in Updates.
bool _waitingAbove(NotificationView n, Set<String> approvalIds, Set<String> takeoverIds) {
  if (!n.isRequest || n.link == null) return false;
  final uri = Uri.tryParse(n.link!);
  if (uri == null) return false;
  final path = uri.pathSegments;
  if (path.length == 2 && path.first == 'approvals') return approvalIds.contains(path[1]);
  final takeover = uri.queryParameters['takeover'];
  return takeover != null && takeoverIds.contains(takeover);
}

/// The All, Needs you and Briefs filters of the Inbox.
class _InboxFeed extends ConsumerStatefulWidget {
  const _InboxFeed({required this.filter});
  final InboxFilter filter;

  /// How far back published pages show among the updates (INBOX-TIDY-PLAN §6.3: 3 days at most,
  /// and gone once opened).
  static const _recentPages = Duration(days: 3);

  /// Max ideas shown at once in Needs you (§5.1); the rest wait their turn and stay in the badge.
  static const _maxVisibleIdeas = 8;

  @override
  ConsumerState<_InboxFeed> createState() => _InboxFeedState();
}

class _InboxFeedState extends ConsumerState<_InboxFeed> {
  /// Suggestion ids hidden by "Put away all" while the Undo snackbar is open.
  final _pendingPutAway = <String>{};
  Timer? _putAwayTimer;

  /// Page ids marked seen in this session before [forYouProvider] reloads.
  final _localSeenPages = <String>{};

  @override
  void dispose() {
    _putAwayTimer?.cancel();
    super.dispose();
  }

  void _startPutAwayAll(BuildContext context, List<String> ids) {
    if (ids.isEmpty) return;
    final l10n = context.l10n;
    _putAwayTimer?.cancel();
    setState(() => _pendingPutAway.addAll(ids));
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger?.hideCurrentSnackBar();
    var undone = false;
    messenger?.showSnackBar(
      SnackBar(
        content: Text(l10n.suggestionPutAwayCount(ids.length)),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: l10n.suggestionUndo,
          onPressed: () {
            undone = true;
            _putAwayTimer?.cancel();
            if (mounted) setState(() => _pendingPutAway.removeAll(ids));
          },
        ),
      ),
    );
    _putAwayTimer = Timer(const Duration(seconds: 4), () async {
      if (undone || !mounted) return;
      try {
        await ref.read(backendProvider).putAwaySuggestions(ids);
        ref.invalidate(forYouProvider);
      } catch (_) {
        if (mounted) setState(() => _pendingPutAway.removeAll(ids));
      }
    });
  }

  void _markPageSeen(String pageId) {
    setState(() => _localSeenPages.add(pageId));
    unawaited(
      ref.read(backendProvider).markInboxSeen('page', pageId).then((_) {
        ref.invalidate(forYouProvider);
      }).catchError((_) {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filter = widget.filter;
    final l10n = context.l10n;
    final all = filter == InboxFilter.all;
    // The Updates row (D-253): notices and pages that aren't already in a bot's chat; no decisions.
    final updatesOnly = filter == InboxFilter.updates;
    final withNotes = all || updatesOnly;
    final approvals = ref.watch(approvalsProvider);
    final forYou = ref.watch(forYouProvider);
    final notifications = ref.watch(notificationsProvider);
    final takeoversValue = ref.watch(takeoversProvider);
    final proposalsValue = ref.watch(skillProposalsProvider);
    final pagesValue = withNotes ? ref.watch(pagesProvider(null)) : const AsyncData(<BotPage>[]);
    final takeovers = takeoversValue.value ?? const <TakeoverRequest>[];
    final proposals = proposalsValue.value ?? const <SkillProposal>[];
    final pages = pagesValue.value ?? const <BotPage>[];
    final bots = ref.watch(botsProvider).value ?? const <Bot>[];
    Bot? botById(String id) => bots.where((b) => b.id == id).firstOrNull;
    String botName(String id) => botById(id)?.name ?? '';

    // The lists this filter is made of; the rest fill in when they arrive.
    final sources = <AsyncValue<Object?>>[
      if (filter != InboxFilter.briefs && !updatesOnly) approvals,
      if (!updatesOnly) forYou,
      if (withNotes) notifications,
    ];
    // Also waited for (but never an error on their own): takeovers go above approvals and pages
    // reorder the updates, so arriving late they would shove the list around.
    final extras = <AsyncValue<Object?>>[
      if (filter != InboxFilter.briefs && !updatesOnly) ...[takeoversValue, proposalsValue],
      if (withNotes) pagesValue,
    ];
    final failed = sources.where((s) => s.hasError && !s.hasValue).toList();
    final AsyncValue<void> state = [...sources, ...extras].any((s) => s.isLoading && !s.hasValue)
        ? const AsyncLoading()
        : failed.length == sources.length
        ? AsyncError(failed.first.error!, failed.first.stackTrace ?? StackTrace.current)
        : const AsyncData(null);

    Future<void> refresh() async {
      ref.invalidate(approvalsProvider);
      ref.invalidate(takeoversProvider);
      ref.invalidate(forYouProvider);
      ref.invalidate(skillProposalsProvider);
      if (withNotes) {
        ref.invalidate(notificationsProvider);
        ref.invalidate(pagesProvider(null));
      }
    }

    return AsyncView(
      value: state,
      onRetry: refresh,
      loading: _InboxSkeleton(filter: filter),
      data: (_) {
        final pending = approvals.value ?? const <Approval>[];
        final allSuggestions = forYou.value?.suggestions ?? const <Suggestion>[];
        // `look` suggestions move to Updates (§4.1); the rest wait in Needs you.
        final lookSuggestions = [for (final s in allSuggestions) if (s.kind == SuggestionKind.look) s];
        final activeSuggestions = [
          for (final s in allSuggestions)
            if (s.kind != SuggestionKind.look && !_pendingPutAway.contains(s.id)) s,
        ];

        // Order ideas (§5.4): answer cards, urgent or timed (remind), then the rest, newest first.
        int ideaRank(Suggestion s) {
          if (s.kind == SuggestionKind.answer) return 0;
          if (s.urgency == SuggestionUrgencyEnum.urgent || s.kind == SuggestionKind.remind) return 1;
          return 2;
        }

        final sortedSuggestions = [...activeSuggestions]
          ..sort((a, b) {
            final cmp = ideaRank(a).compareTo(ideaRank(b));
            return cmp != 0 ? cmp : b.createdAt.compareTo(a.createdAt);
          });

        // Combine suggestions + skill ideas up to the 8-idea cap (§5.1).
        final allIdeas = <({String botId, Widget widget, String? suggestionId})>[
          for (final s in sortedSuggestions)
            (
              botId: s.botId,
              widget: SuggestionCard(key: ValueKey(('suggestion', s.id)), s: s, botName: botName(s.botId)),
              suggestionId: s.id,
            ),
          for (final p in proposals)
            (
              botId: p.botId,
              widget: SkillProposalCard(key: ValueKey(('proposal', p.id)), proposal: p, botName: botName(p.botId)),
              suggestionId: null,
            ),
        ];
        final visibleIdeas = allIdeas.take(_InboxFeed._maxVisibleIdeas).toList();
        final hiddenIdeasCount = allIdeas.length - visibleIdeas.length;

        // Group > 2 visible ideas from the same bot into one expandable card (§5.4).
        final countsByBot = <String, int>{};
        for (final idea in visibleIdeas) {
          countsByBot[idea.botId] = (countsByBot[idea.botId] ?? 0) + 1;
        }
        final groupedBotWidgets = <String, List<Widget>>{};
        for (final idea in visibleIdeas) {
          if ((countsByBot[idea.botId] ?? 0) > 2) {
            groupedBotWidgets.putIfAbsent(idea.botId, () => []).add(idea.widget);
          }
        }
        final emittedGroupedBots = <String>{};
        final ideaWidgets = <Widget>[];
        for (final idea in visibleIdeas) {
          if ((countsByBot[idea.botId] ?? 0) > 2) {
            if (emittedGroupedBots.add(idea.botId)) {
              final b = botById(idea.botId);
              ideaWidgets.add(
                BotIdeasGroupCard(
                  key: ValueKey(('botIdeasGroup', idea.botId)),
                  botId: idea.botId,
                  botName: b?.name ?? '',
                  avatarUrl: b?.avatarUrl,
                  children: groupedBotWidgets[idea.botId]!,
                ),
              );
            }
          } else {
            ideaWidgets.add(idea.widget);
          }
        }
        if (hiddenIdeasCount > 0) {
          ideaWidgets.add(
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.sm),
              child: Center(
                child: Text(
                  l10n.suggestionMoreWaiting(hiddenIdeasCount),
                  key: const Key('moreIdeasWaiting'),
                  style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                ),
              ),
            ),
          );
        }

        final visibleSuggestionIds = [
          for (final idea in visibleIdeas)
            if (idea.suggestionId != null) idea.suggestionId!,
        ];
        final showPutAwayAll = visibleIdeas.length > 5 && visibleSuggestionIds.isNotEmpty;

        final decisions = filter == InboxFilter.briefs || updatesOnly
            ? const <Widget>[]
            : <Widget>[
                for (final t in takeovers)
                  Padding(
                    key: ValueKey(('takeover', t.id)),
                    padding: const EdgeInsets.only(bottom: AppSpace.sm),
                    child: TakeoverCard(takeover: t),
                  ),
                for (final (i, a) in pending.indexed)
                  Padding(
                    key: ValueKey(('approval', a.id)),
                    padding: const EdgeInsets.only(bottom: AppSpace.sm),
                    child: ApprovalCard(approval: a).appListItemEntrance(i),
                  ),
                if (showPutAwayAll)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpace.xs),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton.icon(
                        key: const Key('putAwayAll'),
                        onPressed: () => _startPutAwayAll(context, visibleSuggestionIds),
                        icon: const Icon(LucideIcons.archive, size: 16),
                        label: Text(l10n.suggestionActionPutAwayAll),
                      ),
                    ),
                  ),
                ...ideaWidgets,
              ];

        // Updates: briefs, `look` suggestions, notifications (grouped by bot+kind+day) and unseen
        // pages (up to 3 days), newest first.
        final approvalIds = {for (final a in pending) a.id};
        final takeoverIds = {for (final t in takeovers) t.id};
        final notes = withNotes
            ? [
                for (final n in notifications.value ?? const <NotificationView>[])
                  // Reply notices (D-325) are read in their chat, not listed here.
                  if (!n.isReply && !_waitingAbove(n, approvalIds, takeoverIds) && (!updatesOnly || isUpdateRowNotification(n))) n,
              ]
            : const <NotificationView>[];
        final seenPageIds = {
          ...?forYou.value?.seenPageIds,
          ..._localSeenPages,
        };
        final sincePages = DateTime.now().subtract(_InboxFeed._recentPages);
        final visiblePages = [
          for (final p in pages)
            if (p.createdAt.isAfter(sincePages) && !seenPageIds.contains(p.id)) p,
        ];

        // Group notifications by (botId, kind, localYMD) when >= 2 on the same day (§6.1).
        String dayKey(DateTime dt) {
          final l = dt.toLocal();
          return '${l.year}-${l.month}-${l.day}';
        }

        final noteBuckets = <String, List<NotificationView>>{};
        for (final n in notes) {
          final k = '${n.botId ?? ''}|${n.kind}|${dayKey(n.createdAt)}';
          noteBuckets.putIfAbsent(k, () => []).add(n);
        }

        final updates = <(DateTime, Object)>[
          if (filter != InboxFilter.needsYou && !updatesOnly)
            for (final b in forYou.value?.briefs ?? const <ForYouBrief>[]) (b.createdAt, b),
          if (filter != InboxFilter.needsYou && filter != InboxFilter.briefs)
            for (final s in lookSuggestions) (s.createdAt, s),
          for (final bucket in noteBuckets.values)
            if (bucket.length >= 2)
              (bucket.first.createdAt, _NotificationGroup(items: bucket))
            else
              (bucket.first.createdAt, bucket.first),
          for (final p in visiblePages) (p.createdAt, p),
        ]..sort((a, b) => b.$1.compareTo(a.$1));

        // Build "Since yesterday" summary for each brief (§6.4).
        final yesterdayCutoff = DateTime.now().subtract(const Duration(hours: 24));
        (String? summary, List<String> unreadIds) briefSummary(ForYouBrief b) {
          final botPages = visiblePages.where((p) => p.botId == b.botId && p.createdAt.isAfter(yesterdayCutoff)).length;
          final botNotes = [
            for (final n in notes)
              if (n.botId == b.botId && n.createdAt.isAfter(yesterdayCutoff)) n,
          ];
          final routineCount = botNotes.where((n) => n.kind == 'routine' || n.kind == 'routine_result').length;
          final otherCount = botNotes.length - routineCount;
          final parts = <String>[
            if (botPages > 0) l10n.briefSincePages(botPages),
            if (routineCount > 0) l10n.briefSinceRoutines(routineCount),
            if (otherCount > 0) l10n.briefSinceUpdates(otherCount),
          ];
          final unreadIds = [for (final n in botNotes) if (n.readAt == null) n.id];
          return (parts.isEmpty ? null : parts.join(', '), unreadIds);
        }

        // Rows in a row share one card; a brief or look card breaks the run with its own card.
        final updateWidgets = <Widget>[];
        var rows = <Widget>[];
        void flushRows() {
          if (rows.isEmpty) return;
          updateWidgets.add(Padding(padding: const EdgeInsets.only(bottom: AppSpace.sm), child: GroupedCard(children: rows)));
          rows = [];
        }

        for (final (_, item) in updates) {
          switch (item) {
            case ForYouBrief b:
              flushRows();
              final (summary, unreadIds) = briefSummary(b);
              updateWidgets.add(
                Padding(
                  key: ValueKey(('brief', b.botId)),
                  padding: const EdgeInsets.only(bottom: AppSpace.sm),
                  child: BriefCard(
                    brief: b,
                    sinceYesterdaySummary: summary,
                    onOpened: unreadIds.isEmpty
                        ? null
                        : () {
                            final notifier = ref.read(notificationsProvider.notifier);
                            for (final id in unreadIds) {
                              unawaited(notifier.markRead(id).catchError((_) {}));
                            }
                          },
                  ),
                ),
              );
            case Suggestion s:
              flushRows();
              updateWidgets.add(SuggestionCard(key: ValueKey(('look', s.id)), s: s, botName: botName(s.botId)));
            case _NotificationGroup g:
              rows.add(_GroupedNotificationRow(group: g, botName: g.botId != null ? botName(g.botId!) : ''));
            case NotificationView n:
              rows.add(_NotificationRow(notification: n));
            case BotPage p:
              rows.add(_PageUpdateRow(page: p, botName: botName(p.botId), onSeen: () => _markPageSeen(p.id)));
          }
        }
        flushRows();

        final hasUnread = notes.any((n) => n.readAt == null);
        final markAllButton = hasUnread
            ? TextButton.icon(
                key: const Key('markAllRead'),
                onPressed: () => runGuarded(context, ref.read(notificationsProvider.notifier).markAllRead),
                icon: const Icon(LucideIcons.checkCheck, size: 18),
                label: Text(l10n.markAllRead),
              )
            : null;
        final children = <Widget>[
          if (failed.isNotEmpty) Padding(padding: const EdgeInsets.only(bottom: AppSpace.sm), child: InlineError(error: failed.first.error!, onRetry: refresh)),
          if (all && decisions.isNotEmpty) SectionHeader(title: l10n.inboxNeedsYou, count: (pending.length + takeovers.length + allIdeas.length).humanizedCount(context.l10n.localeName), padding: const EdgeInsets.fromLTRB(AppSpace.xxs, AppSpace.xs, AppSpace.xxs, AppSpace.xs)),
          ...decisions,
          if (all && updateWidgets.isNotEmpty)
            SectionHeader(
              title: l10n.inboxUpdates,
              padding: EdgeInsets.fromLTRB(AppSpace.xxs, decisions.isEmpty ? AppSpace.xs : AppSpace.lg, AppSpace.xxs, AppSpace.xs),
              trailing: markAllButton,
            )
          else if (updatesOnly && updateWidgets.isNotEmpty && markAllButton != null)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.xxs),
              child: Align(alignment: AlignmentDirectional.centerEnd, child: markAllButton),
            ),
          ...updateWidgets,
        ];
        if (children.isEmpty) {
          return switch (filter) {
            InboxFilter.needsYou => EmptyState(icon: LucideIcons.circleCheckBig, title: l10n.inboxNeedsYouEmpty, message: l10n.inboxNeedsYouEmptyHelp),
            InboxFilter.briefs => EmptyState(icon: LucideIcons.sun, title: l10n.noBriefs, message: l10n.forYouEmptyHelp),
            InboxFilter.updates => EmptyState(icon: LucideIcons.bell, title: l10n.updatesEmpty, message: l10n.updatesEmptyHelp),
            _ => EmptyState(icon: LucideIcons.inbox, title: l10n.forYouEmpty, message: l10n.inboxEmptyHelp),
          };
        }
        return RefreshIndicator(
          onRefresh: hapticRefresh(refresh),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final side = pageSide(constraints.maxWidth);
              return ListView(
                // Ends above the floating tab bar (the shell sets the bottom padding to its height).
                padding: EdgeInsets.fromLTRB(side, AppSpace.xs, side, AppSpace.xl + MediaQuery.paddingOf(context).bottom),
                children: children,
              );
            },
          ),
        );
      },
    );
  }
}

class _NotificationGroup {
  const _NotificationGroup({required this.items});
  final List<NotificationView> items;
  String? get botId => items.first.botId;
  String get kind => items.first.kind;
  DateTime get createdAt => items.first.createdAt;
}

/// Groups multiple same-day notifications of the same kind from one bot (§6.1). Expands in place.
class _GroupedNotificationRow extends StatefulWidget {
  const _GroupedNotificationRow({required this.group, required this.botName});
  final _NotificationGroup group;
  final String botName;

  @override
  State<_GroupedNotificationRow> createState() => _GroupedNotificationRowState();
}

class _GroupedNotificationRowState extends State<_GroupedNotificationRow> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final colors = context.appColors;
    final g = widget.group;
    final isRoutine = g.kind == 'routine' || g.kind == 'routine_result';
    final name = widget.botName.trim();
    final title = isRoutine
        ? (name.isNotEmpty
            ? l10n.updatesGroupedRoutine(name, g.items.length)
            : l10n.updatesGroupedRoutinePlain(g.items.length))
        : (name.isNotEmpty
            ? l10n.updatesGroupedNotice(name, g.items.length)
            : l10n.updatesGroupedNoticePlain(g.items.length));
    final hasUnread = g.items.any((n) => n.readAt == null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          key: Key('groupedNotif-${g.botId ?? 'none'}-${g.kind}'),
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(AppSpace.md, 12, AppSpace.md, 12),
            child: Row(
              children: [
                _RowIcon(
                  icon: isRoutine ? LucideIcons.clock : LucideIcons.bell,
                  color: isRoutine ? colors.info : scheme.primary,
                ),
                const SizedBox(width: AppSpace.sm),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpace.xs),
                TimeAgo(g.createdAt, style: context.textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant)),
                const SizedBox(width: AppSpace.xs),
                Icon(
                  _expanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
                  size: 16,
                  color: scheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
        if (_expanded)
          for (final n in g.items)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: AppSpace.md),
              child: _NotificationRow(notification: n),
            ),
      ],
    );
  }
}

/// "Ada published Weekly sales" among the updates; opens it in the Library (D-274), or in the
/// browser when the Library can't find it, and marks it seen so it leaves Updates (§6.3).
class _PageUpdateRow extends ConsumerWidget {
  const _PageUpdateRow({required this.page, required this.botName, required this.onSeen});
  final BotPage page;
  final String botName;
  final VoidCallback onSeen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final p = page;
    return InkWell(
      key: Key('pageUpdate-${p.id}'),
      onTap: () async {
        onSeen();
        final c = await findCreation(ref, pageId: p.id, title: p.title);
        if (!context.mounted) return;
        if (c != null) {
          unawaited(context.pushOnce('/library/${c.id}'));
        } else {
          await openBotPage(context, ref, p);
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(AppSpace.md, 12, AppSpace.md, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RowIcon(icon: LucideIcons.fileText, color: scheme.primary),
            const SizedBox(width: AppSpace.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          l10n.botPublishedPage(botName.isEmpty ? l10n.aBot : botName, p.title),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: AppSpace.xs),
                      TimeAgo(p.createdAt, style: context.textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    switch (p.visibility) {
                      BotPageVisibilityEnum.public => l10n.pagePublic,
                      BotPageVisibilityEnum.workspace => l10n.pageWorkspace,
                      _ => l10n.pagePrivate,
                    },
                    style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant, height: 1.35),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The inbox feed still loading, in the filter's shape: approval cards under Needs you, then a
/// card of update rows (All); approval cards alone (Needs you); brief cards (Briefs).
class _InboxSkeleton extends StatelessWidget {
  const _InboxSkeleton({required this.filter});
  final InboxFilter filter;

  @override
  Widget build(BuildContext context) {
    Widget gapped(Widget w) => Padding(padding: const EdgeInsets.only(bottom: AppSpace.sm), child: w);
    return SkeletonPage(
      children: switch (filter) {
        InboxFilter.needsYou => [gapped(const _ApprovalCardSkeleton()), gapped(const _ApprovalCardSkeleton())],
        InboxFilter.briefs => [gapped(const _BriefCardSkeleton()), gapped(const _BriefCardSkeleton())],
        _ => [
          const SkeletonSectionHeader(width: 84, padding: EdgeInsets.fromLTRB(AppSpace.xxs, AppSpace.xs, AppSpace.xxs, AppSpace.xs)),
          gapped(const _ApprovalCardSkeleton()),
          const SkeletonSectionHeader(width: 72),
          gapped(
            SkeletonGroupedCard(
              count: 3,
              row: SkeletonRow(
                leadingSize: 36,
                trailing: SkeletonTrailing.meta,
                subtitleLines: 2,
                padding: const EdgeInsets.fromLTRB(AppSpace.md, 12, AppSpace.md, 12),
                titleStyle: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                subtitleStyle: context.textTheme.bodySmall?.copyWith(height: 1.35),
              ),
            ),
          ),
        ],
      },
    );
  }
}

/// An [ApprovalCard] still loading: avatar and request, the risk pill, the arguments box and
/// the buttons.
class _ApprovalCardSkeleton extends StatelessWidget {
  const _ApprovalCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final text = context.textTheme;
    return SkeletonCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SkeletonBone(width: 36, height: 36, radius: 18),
              const SizedBox(width: AppSpace.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SkeletonText(style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700, height: 1.3), widthFactor: 0.72),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const SkeletonBone(width: 64, height: 22, radius: AppRadius.pill),
                        const SizedBox(width: AppSpace.xs),
                        Expanded(child: SkeletonText(style: text.bodySmall, widthFactor: 0.6)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          const SkeletonBone(height: 96, radius: 10),
          const SizedBox(height: AppSpace.sm),
          const Row(
            spacing: AppSpace.xs,
            children: [
              Expanded(child: SkeletonBone(height: 44, radius: AppRadius.pill)),
              Expanded(child: SkeletonBone(height: 44, radius: AppRadius.pill)),
            ],
          ),
          const SizedBox(height: AppSpace.xxs),
          const SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpace.md,
              children: [SkeletonBone(width: 88, height: 12), SkeletonBone(width: 72, height: 12)],
            ),
          ),
        ],
      ),
    );
  }
}

/// A [BriefCard] still loading: the bot's avatar and heading, then a few lines of the brief.
class _BriefCardSkeleton extends StatelessWidget {
  const _BriefCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final text = context.textTheme;
    return SkeletonCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpace.sm,
        children: [
          Row(
            children: [
              const SkeletonBone(width: 28, height: 28, radius: 14),
              const SizedBox(width: AppSpace.sm),
              Expanded(child: SkeletonText(style: text.titleSmall, widthFactor: 0.5)),
              const SkeletonBone(width: 36, height: 10),
            ],
          ),
          SkeletonText(style: text.bodyMedium, lines: 4, widthFactor: 0.8),
        ],
      ),
    );
  }
}

/// The tinted icon tile at the start of an update row.
class _RowIcon extends StatelessWidget {
  const _RowIcon({required this.icon, required this.color});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.isDark ? 0.2 : 0.12),
        borderRadius: BorderRadius.circular(AppRadius.icon),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 19, color: color),
    );
  }
}

/// One approval request with approve, deny and "always allow".
class ApprovalCard extends ConsumerStatefulWidget {
  const ApprovalCard({super.key, required this.approval, this.onDecided});
  final Approval approval;
  final VoidCallback? onDecided;

  @override
  ConsumerState<ApprovalCard> createState() => _ApprovalCardState();
}

class _ApprovalCardState extends ConsumerState<ApprovalCard> {
  var _busy = false;

  Future<void> _decide(bool approve, {bool always = false}) async {
    final l10n = context.l10n;
    if (!approve) Haptic.tap();
    // Allowing a high-risk request asks to unlock again (D-375).
    if (approve && widget.approval.risk == Risk.high && (!await confirmIdentity(context, ref, approval: true) || !mounted)) return;
    setState(() => _busy = true);
    final ok = await runGuarded(context, () async {
      await ref.read(backendProvider).decideApproval(widget.approval.id, approve: approve, alwaysAllow: always);
      return true;
    });
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok == true) {
      if (approve) Haptic.confirm();
      ref.invalidate(approvalsProvider);
      ref.invalidate(notificationsProvider);
      showMessage(context, approve ? l10n.approved : l10n.denied);
      unawaited(nudgeAfterAnswer(context, ref));
      widget.onDecided?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final colors = context.appColors;
    final a = widget.approval;
    final bot = ref.watch(botProvider(a.botId));
    final riskColor = switch (a.risk) {
      Risk.high => colors.negative,
      Risk.medium => colors.warning,
      Risk.low => colors.info,
    };
    // What the tool receives, without the card's own data (`_casama`, D-541).
    final args = const JsonEncoder.withIndent('  ').convert({
      for (final MapEntry(:key, :value) in a.argsRedacted.entries)
        if (!kApprovalCardKeys.contains(key)) key: value,
    });
    return AppCard(
      key: Key('approval-${a.id}'),
      borderColor: riskColor.withValues(alpha: context.isDark ? 0.35 : 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecisionHeader(
            botName: bot?.name ?? '',
            avatarUrl: bot?.avatarUrl,
            badge: LucideIcons.shieldAlert,
            badgeColor: riskColor,
            // Summaries already name the bot ("Ada wants to run …", "Ada asks to run …", D-541).
            title: approvalSummaryNamesBot(a.summary)
                ? a.summary
                : l10n.botWantsTo(bot?.name ?? l10n.aBot, a.summary),
            details: [
              StatusLabel(
                text: switch (a.risk) {
                  Risk.high => l10n.riskHigh,
                  Risk.medium => l10n.riskMedium,
                  Risk.low => l10n.riskLow,
                },
                color: riskColor,
                pill: true,
              ),
              Text(
                '${toolLabel(a.toolName)} · ${l10n.requestedAgo(relativeTime(a.createdAt, context))}',
                style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: colors.codeBackground,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colors.hairline),
            ),
            child: SingleChildScrollView(child: SelectableText(args, style: AppText.mono.copyWith(fontSize: 12.5))),
          ),
          const SizedBox(height: AppSpace.sm),
          ActionButtons(
            actions: [
              OutlinedButton.icon(
                key: const Key('deny'),
                onPressed: _busy ? null : () => _decide(false),
                icon: const Icon(LucideIcons.x, size: 18),
                label: Text(l10n.deny),
              ),
              GlowButton.icon(
                key: const Key('approve'),
                onPressed: _busy ? null : () => _decide(true),
                icon: const Icon(LucideIcons.check, size: 18),
                label: Text(l10n.approve),
              ),
            ],
            extra: [
              TextButton(
                key: const Key('alwaysAllow'),
                onPressed: _busy ? null : () => _decide(true, always: true),
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                child: Text(l10n.alwaysAllow),
              ),
              TextButton.icon(
                onPressed: () => context.pushOnce('/bots/${a.botId}/runs/${a.runId}'),
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                icon: const Icon(LucideIcons.activity, size: 18),
                label: Text(l10n.viewRun),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Deep link target for /approvals/:id (push notifications open this).
class ApprovalScreen extends ConsumerWidget {
  const ApprovalScreen({super.key, required this.approvalId});
  final String approvalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return SubPage(
      title: l10n.approval,
      body: AsyncView(
        value: ref.watch(approvalsProvider),
        onRetry: () => ref.invalidate(approvalsProvider),
        loading: const SkeletonPage(children: [_ApprovalCardSkeleton()]),
        data: (items) {
          final match = items.where((a) => a.id == approvalId);
          if (match.isEmpty) {
            return EmptyState(
              icon: LucideIcons.circleCheckBig,
              message: l10n.approvalAlreadyDecided,
              action: FilledButton.tonalIcon(onPressed: () => context.go('/inbox'), icon: const Icon(LucideIcons.inbox, size: 18), label: Text(l10n.openInbox)),
            );
          }
          return PageColumn(children: [ApprovalCard(approval: match.first)]);
        },
      ),
    );
  }
}

class _NotificationRow extends ConsumerWidget {
  const _NotificationRow({required this.notification});
  final NotificationView notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = context.colorScheme;
    final colors = context.appColors;
    final n = notification;
    final unread = n.readAt == null;
    final (icon, color) = switch (n.kind) {
      'approval' => (LucideIcons.shieldCheck, colors.warning),
      'routine' || 'routine_result' => (LucideIcons.clock, colors.info),
      'budget' => (LucideIcons.banknote, colors.negative),
      'takeover' => (LucideIcons.hand, colors.waiting),
      _ => (LucideIcons.bell, scheme.primary),
    };
    return InkWell(
      key: Key('notification-${n.id}'),
      onTap: () {
        if (unread) unawaited(ref.read(notificationsProvider.notifier).markRead(n.id).catchError((_) {}));
        final link = n.link;
        if (link == null || !link.startsWith('/')) return;
        // Skill ideas sent before the server fix link to plain /inbox, which is this list: open
        // Needs you, where they wait, instead of another copy of Updates.
        context.pushOnce(link == '/inbox' ? '/inbox?tab=0' : link);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(AppSpace.md, 12, AppSpace.md, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RowIcon(icon: icon, color: color),
            const SizedBox(width: AppSpace.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          n.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyLarge?.copyWith(fontWeight: unread ? FontWeight.w700 : FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: AppSpace.xs),
                      // "Why am I seeing this?" (D-153) on proactive messages.
                      if (n.whyRule != null)
                        InkWell(
                          key: Key('why-${n.id}'),
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => showAdaptiveSheet<void>(context: context, builder: (_) => WhySheet(notification: n)),
                          child: Padding(padding: const EdgeInsets.all(4), child: Icon(LucideIcons.info, size: 16, color: scheme.onSurfaceVariant)),
                        ),
                      TimeAgo(n.createdAt, style: context.textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant)),
                      if (unread) ...[
                        const SizedBox(width: 6),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(color: scheme.primary, shape: BoxShape.circle),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    n.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant, height: 1.35),
                  ),
                  if (n.kind == 'mail_unknown_sender' && n.botId != null && n.sender != null && n.channelId != null) ...[
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FilledButton.tonalIcon(
                        key: Key('allowMailSender-${n.id}'),
                        icon: const Icon(LucideIcons.check, size: 16),
                        label: Text(context.l10n.botEmailAllow),
                        onPressed: () async {
                          final backend = ref.read(backendProvider);
                          final channels = await runGuarded(context, () => backend.channels(n.botId!));
                          final ch = channels?.where((c) => c.id == n.channelId).firstOrNull;
                          if (ch == null || !context.mounted) return;
                          final next = {...ch.allowedSenders, n.sender!}.toList();
                          final ok = await runGuarded(
                            context,
                            () => backend.updateChannel(ch.id, allowedSenders: next),
                          );
                          if (ok == null || !context.mounted) return;
                          unawaited(ref.read(notificationsProvider.notifier).markRead(n.id).catchError((_) {}));
                          showSuccess(context, context.l10n.chatAppsSenderAllowed(n.sender!));
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A bot asking for a person to take over its screen.
class TakeoverCard extends ConsumerWidget {
  const TakeoverCard({super.key, required this.takeover});
  final TakeoverRequest takeover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final color = context.appColors.waiting;
    final bot = ref.watch(botProvider(takeover.botId));
    return AppCard(
      key: Key('takeover-${takeover.id}'),
      borderColor: color.withValues(alpha: 0.45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecisionHeader(
            botName: bot?.name ?? '',
            avatarUrl: bot?.avatarUrl,
            badge: LucideIcons.hand,
            badgeColor: color,
            title: l10n.botNeedsHelp(bot?.name ?? l10n.aBot),
            details: [TimeAgo(takeover.createdAt, style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant))],
          ),
          const SizedBox(height: AppSpace.sm),
          Text(takeover.reason, style: context.textTheme.bodyMedium?.copyWith(height: 1.4)),
          const SizedBox(height: AppSpace.md),
          ActionButtons(
            actions: [
              OutlinedButton(
                key: const Key('dismissTakeover'),
                onPressed: () async {
                  await runGuarded(context, () => ref.read(backendProvider).dismissTakeover(takeover.id));
                  ref.invalidate(takeoversProvider);
                },
                child: Text(l10n.dismiss),
              ),
              GlowButton.icon(
                key: const Key('openTakeover'),
                onPressed: () => context.pushOnce('/computer/live?c=${takeover.computerId}&takeover=${takeover.id}'),
                icon: const Icon(LucideIcons.mousePointer2, size: 18),
                label: Text(l10n.takeControl),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// "Why am I seeing this?" (D-153): the rule and the data behind a proactive message, whether it
/// waited for the brief, and "Less like this".
class WhySheet extends ConsumerStatefulWidget {
  const WhySheet({super.key, required this.notification});
  final NotificationView notification;
  @override
  ConsumerState<WhySheet> createState() => _WhySheetState();
}

class _WhySheetState extends ConsumerState<WhySheet> {
  var _sent = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final n = widget.notification;
    final held = switch (n.heldReason) {
      'meeting' => l10n.heldMeeting,
      'focus' => l10n.heldFocus,
      'driving' => l10n.heldDriving,
      'daily_cap' => l10n.heldCap,
      'low_urgency' => l10n.heldLow,
      _ => null,
    };
    return FormSheet(
      icon: LucideIcons.info,
      title: l10n.whyTitle,
      submitLabel: _sent ? l10n.lessLikeThisDone : l10n.lessLikeThis,
      submitKey: const Key('lessLikeThis'),
      onSubmit: _sent
          ? null
          : () async {
              final ok = await runGuarded(context, () async {
                await ref.read(backendProvider).lessLikeThis(n.id);
                return true;
              });
              if (ok == true && mounted) setState(() => _sent = true);
            },
      children: [
        if (n.whyRule.isUsable) Text(n.whyRule!, key: const Key('whyRule'), style: context.textTheme.bodyLarge),
        if (n.whyData.isNotEmpty) Text(l10n.whyData(n.whyData.join(', ')), style: context.textTheme.bodyMedium),
        if (n.urgency.isUsable) Text(l10n.whyUrgency(n.urgency!), style: context.textTheme.bodySmall),
        if (held != null) Text(held, key: const Key('whyHeld'), style: context.textTheme.bodySmall),
      ],
    );
  }
}
