import '../../core/analytics.dart';
import 'dart:math' as math;

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/shell_header.dart';
import '../chat/chat_controller.dart' show chatControllerProvider;
import 'creation_detail.dart';
import 'creation_tile.dart';

/// What a bot made, with what was made in one chat first (LIBRARY-PLAN §5.4, "Made here").
class MadeHere {
  const MadeHere({required this.here, required this.others, this.more = false});

  /// Made in this chat (or topic).
  final List<Creation> here;

  /// The bot's other things, newest first.
  final List<Creation> others;

  /// The bot made more than were loaded: "See all" opens the Library on it.
  final bool more;

  int get count => here.length + others.length;
}

typedef MadeHereKey = ({String botId, String? conversationId});

/// A bot's things for its chat's Made here: the chat's own first, then the rest of the bot's.
final madeHereProvider = FutureProvider.autoDispose
    .family<MadeHere, MadeHereKey>((ref, key) async {
      final orgId = ref.watch(currentOrgIdProvider);
      if (orgId == null) return const MadeHere(here: [], others: []);
      final backend = ref.watch(backendProvider);
      final conversationId = key.conversationId;
      final results = await Future.wait([
        if (conversationId != null)
          backend.creations(orgId, conversationId: conversationId, limit: 60),
        backend.creations(orgId, botId: key.botId, limit: 60),
      ]);
      final here = conversationId == null
          ? const <Creation>[]
          : results.first.items;
      final ids = {for (final c in here) c.id};
      final bot = results.last;
      return MadeHere(
        here: here,
        others: [
          for (final c in bot.items)
            if (!ids.contains(c.id)) c,
        ],
        more: bot.nextCursor != null,
      );
    });

/// Made here as a list: this chat's things, then the bot's others, as tiles. [onOpen] opens one.
class MadeHereList extends ConsumerWidget {
  const MadeHereList({
    super.key,
    required this.botId,
    required this.conversationId,
    required this.onOpen,
    this.selectedId,
    this.shrinkWrap = false,
  });
  final String botId;
  final String? conversationId;
  final ValueChanged<Creation> onOpen;
  final String? selectedId;

  /// Inside a sheet that sizes to its content.
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final key = (botId: botId, conversationId: conversationId);
    final botName = ref.watch(botProvider(botId))?.name ?? l10n.theBot;
    return AsyncView(
      value: ref.watch(madeHereProvider(key)),
      onRetry: () => ref.invalidate(madeHereProvider(key)),
      loading: const Padding(
        padding: EdgeInsets.all(AppSpace.xl),
        child: Center(child: CircularProgressIndicator()),
      ),
      data: (made) {
        if (made.count == 0) {
          return Padding(
            padding: const EdgeInsets.all(AppSpace.lg),
            child: EmptyState(
              key: const Key('madeHereEmpty'),
              icon: LucideIcons.library,
              message: l10n.madeHereEmpty(botName),
            ),
          );
        }
        return LayoutBuilder(
          builder: (context, box) {
            final cols = math.max(2, (box.maxWidth / 200).floor());
            Widget grid(List<Creation> items) => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                mainAxisSpacing: AppSpace.xs,
                crossAxisSpacing: AppSpace.xs,
                mainAxisExtent:
                    ((box.maxWidth -
                                AppSpace.gutter * 2 -
                                AppSpace.xs * (cols - 1)) /
                            cols) *
                        3 /
                        4 +
                    58 * MediaQuery.textScalerOf(context).scale(1),
              ),
              itemCount: items.length,
              itemBuilder: (context, i) => CreationTile(
                creation: items[i],
                selected: items[i].id == selectedId,
                onTap: () => onOpen(items[i]),
              ),
            );
            Widget heading(String text, String id) => Padding(
              padding: const EdgeInsets.only(
                top: AppSpace.md,
                bottom: AppSpace.xs,
              ),
              child: Text(
                text,
                key: Key('madeHereHeading-$id'),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
            return ListView(
              key: const Key('madeHereList'),
              shrinkWrap: shrinkWrap,
              padding: const EdgeInsets.fromLTRB(
                AppSpace.gutter,
                0,
                AppSpace.gutter,
                AppSpace.xl,
              ),
              children: [
                if (made.here.isNotEmpty) ...[
                  heading(l10n.madeHereThisChat, 'here'),
                  grid(made.here),
                ],
                if (made.others.isNotEmpty) ...[
                  heading(
                    made.here.isEmpty
                        ? l10n.madeHereByBot(botName)
                        : l10n.madeHereElsewhere(botName),
                    'others',
                  ),
                  grid(made.others),
                ],
                if (made.more)
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      key: const Key('madeHereSeeAll'),
                      onPressed: () => context.pushOnce('/library?bot=$botId'),
                      child: Text(l10n.projectSeeAll),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

/// Made here on phones and tablets: a sheet with the bot's things, this chat's first.
Future<void> showMadeHereSheet(
  BuildContext context, {
  required String botId,
  String? conversationId,
}) => showAdaptiveSheet<void>(
  context: context,
  heightFactor: 0.85,
  builder: (sheet) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpace.gutter,
          AppSpace.md,
          AppSpace.gutter,
          0,
        ),
        child: Text(
          sheet.l10n.madeHere,
          style: sheet.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      Expanded(
        child: MadeHereList(
          botId: botId,
          conversationId: conversationId,
          onOpen: (c) {
            Navigator.of(sheet).pop();
            context.pushOnce('/library/${c.id}');
          },
        ),
      ),
    ],
  ),
);

/// The chat header's Made here button, with how many things the bot made; hidden until it has
/// made something. On desktop it opens the side panel on its Made here tab.
class MadeHereButton extends ConsumerWidget {
  const MadeHereButton({
    super.key,
    required this.botId,
    required this.conversationId,
    this.onDesktop,
  });
  final String botId;
  final String? conversationId;

  /// Desktop: show Made here beside the chat instead of a sheet.
  final VoidCallback? onDesktop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final made = ref
        .watch(madeHereProvider((botId: botId, conversationId: conversationId)))
        .value;
    if (made == null || made.count == 0) return const SizedBox.shrink();
    final count = made.more ? '${made.count}+' : '${made.count}';
    final scheme = context.colorScheme;
    // A total, not something waiting: a quiet count, not an alert's red.
    return Badge(
      key: const Key('madeHereCount'),
      label: Text(count, style: const TextStyle(fontFeatures: AppText.tabular)),
      backgroundColor: scheme.surfaceContainerHighest,
      textColor: scheme.onSurface,
      offset: const Offset(-2, 2),
      child: HeaderIconButton(
        key: const Key('madeHereButton'),
        icon: LucideIcons.library,
        tooltip: context.l10n.madeHereCount(count),
        onPressed: () {
          Analytics.log('chat_header_action', {
            'action': 'made_here',
            'placement': 'header',
          });
          final desktop = onDesktop;
          if (desktop != null) return desktop();
          showMadeHereSheet(
            context,
            botId: botId,
            conversationId: conversationId,
          );
        },
      ),
    );
  }
}

/// Which tab the desktop side panel shows for each bot: its computer (false) or Made here (true).
/// Kept while the app runs.
class SidePanelMadeHere extends Notifier<Map<String, bool>> {
  @override
  Map<String, bool> build() => const {};

  void set(String botId, bool madeHere) => state = {...state, botId: madeHere};
}

final sidePanelMadeHereProvider =
    NotifierProvider<SidePanelMadeHere, Map<String, bool>>(
      SidePanelMadeHere.new,
    );

/// The desktop side panel with two tabs, Computer and Made here (LIBRARY-PLAN §5.4). A creation
/// picked in Made here opens in the panel with its native preview.
class SidePanelTabs extends ConsumerStatefulWidget {
  const SidePanelTabs({super.key, required this.botId, required this.computer});
  final String? botId;
  final Widget computer;

  @override
  ConsumerState<SidePanelTabs> createState() => _SidePanelTabsState();
}

class _SidePanelTabsState extends ConsumerState<SidePanelTabs> {
  String? _open;

  @override
  void didUpdateWidget(SidePanelTabs old) {
    super.didUpdateWidget(old);
    if (old.botId != widget.botId) _open = null;
  }

  @override
  Widget build(BuildContext context) {
    final botId = widget.botId;
    if (botId == null) return widget.computer;
    final l10n = context.l10n;
    final madeHere = ref.watch(sidePanelMadeHereProvider)[botId] ?? false;
    final conversationId = ref.watch(
      chatControllerProvider(botId).select((c) => c.conversationId),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.md,
              AppSpace.xs,
              AppSpace.md,
              AppSpace.xs,
            ),
            child: SegmentedButton<bool>(
              key: const Key('sidePanelTabs'),
              showSelectedIcon: false,
              segments: [
                ButtonSegment(
                  value: false,
                  icon: const Icon(LucideIcons.monitor, size: 16),
                  label: Text(
                    l10n.sidePanelComputer,
                    key: const Key('sidePanelComputer'),
                  ),
                ),
                ButtonSegment(
                  value: true,
                  icon: const Icon(LucideIcons.library, size: 16),
                  label: Text(
                    l10n.madeHere,
                    key: const Key('sidePanelMadeHere'),
                  ),
                ),
              ],
              selected: {madeHere},
              onSelectionChanged: (v) => ref
                  .read(sidePanelMadeHereProvider.notifier)
                  .set(botId, v.first),
            ),
          ),
        ),
        Expanded(
          child: !madeHere
              ? widget.computer
              : _open != null
              ? CreationDetailView(
                  key: ValueKey(_open),
                  creationId: _open!,
                  pane: true,
                  onClose: () => setState(() => _open = null),
                  onChanged: (c, {removed = false}) {
                    ref.invalidate(
                      madeHereProvider((
                        botId: botId,
                        conversationId: conversationId,
                      )),
                    );
                    if (removed) setState(() => _open = null);
                  },
                )
              : MadeHereList(
                  botId: botId,
                  conversationId: conversationId,
                  onOpen: (c) => setState(() => _open = c.id),
                ),
        ),
      ],
    );
  }
}

/// What was made in one chat, newest first: a ticket's thread (LIBRARY-PLAN §5.4).
final chatCreationsProvider = FutureProvider.autoDispose
    .family<List<Creation>, String>((ref, conversationId) async {
      final orgId = ref.watch(currentOrgIdProvider);
      if (orgId == null) return const [];
      return (await ref
              .watch(backendProvider)
              .creations(orgId, conversationId: conversationId, limit: 24))
          .items;
    });

/// "Made for this ticket": a strip of what the bot made in a ticket's thread. Draws nothing
/// until something was made there.
class MadeForTicket extends ConsumerWidget {
  const MadeForTicket({super.key, required this.conversationId});
  final String conversationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items =
        ref.watch(chatCreationsProvider(conversationId)).value ??
        const <Creation>[];
    if (items.isEmpty) return const SizedBox.shrink();
    return Column(
      key: const Key('madeForTicket'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.xxs,
            AppSpace.xl,
            AppSpace.xxs,
            AppSpace.sm,
          ),
          child: Text(
            context.l10n.madeForTicket,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 140 * 3 / 4 + 64 * MediaQuery.textScalerOf(context).scale(1),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpace.xs),
            itemBuilder: (context, i) => SizedBox(
              width: 140,
              child: CreationTile(
                creation: items[i],
                onTap: () {
                  Navigator.of(context).maybePop();
                  context.pushOnce('/library/${items[i].id}');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
