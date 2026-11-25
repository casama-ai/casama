import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/bot_cursor.dart';
import '../../ui/shell_layout.dart' show sidePanelDraggingProvider;
import '../chat/chat_controller.dart';
import 'app_browser_controller.dart';
import 'app_browser_flag.dart';
import 'app_browser_pane.dart';
import 'app_browser_settings.dart' show openAppBrowser;

// The in-app browser in the side panel on wide windows (APP-BROWSER-PANEL-PLAN): while a bot from
// the open chat works in it, the panel that otherwise shows the bot's computer shows the page.

/// The run and page on which the person chose "Show computer" in the panel (§2.5). The panel goes
/// back to the page when the run moves to another page, or needs the person.
class AppBrowserPanelComputer extends Notifier<(String, String?)?> {
  @override
  (String, String?)? build() => null;
  void choose(String runId, String? url) => state = (runId, url);
  void clear() => state = null;
}

final appBrowserPanelComputerProvider =
    NotifierProvider<AppBrowserPanelComputer, (String, String?)?>(
      AppBrowserPanelComputer.new,
    );

/// How many side panels show the page now. While one does, the chat's floating card steps aside
/// (§2.3).
class AppBrowserInPanel extends Notifier<int> {
  @override
  int build() => 0;
  // Called a moment after the panel comes or goes, when the whole scope may be gone too.
  void add() {
    if (ref.mounted) state++;
  }

  void remove() {
    if (ref.mounted) state = state > 0 ? state - 1 : 0;
  }
}

final appBrowserInPanelProvider = NotifierProvider<AppBrowserInPanel, int>(
  AppBrowserInPanel.new,
);

/// Whether a bot from chat [conversationId] is using the in-app browser now.
bool _browserRunHere(AppBrowserSession s, String? conversationId) =>
    conversationId != null &&
    s.run?.conversationId == conversationId &&
    (s.botActive || s.phase == AppBrowserPhase.away);

/// Whether the side panel beside chat [conversationId] shows the in-app browser (§2.1, §2.5).
final panelShowsAppBrowserProvider = Provider.family<bool, String?>((
  ref,
  conversationId,
) {
  if (!kAppBrowserCode ||
      conversationId == null ||
      !ref.watch(appBrowserOnProvider)) {
    return false;
  }
  final s = ref.watch(appBrowserProvider);
  if (!_browserRunHere(s, conversationId)) return false;
  final chose = ref.watch(appBrowserPanelComputerProvider);
  final needsYou =
      s.phase == AppBrowserPhase.asking || s.phase == AppBrowserPhase.yourTurn;
  return !(chose != null &&
      chose.$1 == s.run!.id &&
      chose.$2 == s.url &&
      !needsYou);
});

/// Whether the side panel beside the chat with [botId] shows the in-app browser now. The shell
/// leaves out the panel's frosted blur while it does: macOS doesn't place the page's native view
/// inside a backdrop blur, so the page would be missing from the panel.
final sidePaneShowsAppBrowserProvider = Provider.family<bool, String?>((
  ref,
  botId,
) {
  if (!kAppBrowserCode || botId == null || !ref.watch(appBrowserOnProvider)) {
    return false;
  }
  final conversationId = ref.watch(
    chatControllerProvider(botId).select((c) => c.conversationId),
  );
  return ref.watch(panelShowsAppBrowserProvider(conversationId));
});

/// What the side panel beside the chat with [botId] shows: [computer], or the in-app browser while
/// a bot from this chat uses it. The panel being open is the person's choice
/// (`computerPanelProvider`); nothing here opens or closes it (§2.4).
class AppBrowserSidePane extends ConsumerWidget {
  const AppBrowserSidePane({
    super.key,
    required this.botId,
    required this.computer,
  });
  final String? botId;
  final Widget computer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = botId;
    if (!kAppBrowserCode || id == null || !ref.watch(appBrowserOnProvider)) {
      return computer;
    }
    if (ref.watch(sidePaneShowsAppBrowserProvider(id))) {
      return const AppBrowserPanel(key: Key('appBrowserPanel'));
    }
    final conversationId = ref.watch(
      chatControllerProvider(id).select((c) => c.conversationId),
    );
    // The person chose the computer during the run: one tap goes back to the page.
    final here = _browserRunHere(ref.watch(appBrowserProvider), conversationId);
    return Column(
      children: [
        if (here)
          Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpace.xs,
                AppSpace.xs,
                AppSpace.xs,
                0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  key: const Key('appBrowserPanelBack'),
                  onPressed: ref
                      .read(appBrowserPanelComputerProvider.notifier)
                      .clear,
                  icon: const Icon(LucideIcons.globe, size: 16),
                  label: Text(appBrowserTitleFor(context.l10n)),
                ),
              ),
            ),
          ),
        Expanded(child: computer),
      ],
    );
  }
}

/// The page in the side panel: a header with the site, Take Over or Hand Back, Stop, the full
/// view and the way to the computer; under it the same page area as the full view.
class AppBrowserPanel extends ConsumerStatefulWidget {
  const AppBrowserPanel({super.key});

  @override
  ConsumerState<AppBrowserPanel> createState() => _AppBrowserPanelState();
}

class _AppBrowserPanelState extends ConsumerState<AppBrowserPanel> {
  late final AppBrowserInPanel _shown;

  @override
  void initState() {
    super.initState();
    _shown = ref.read(appBrowserInPanelProvider.notifier);
    // After this frame: a provider can't change while the tree builds.
    Future.microtask(_shown.add);
  }

  @override
  void dispose() {
    unawaited(Future.microtask(_shown.remove));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = ref.watch(appBrowserProvider);
    final controller = ref.read(appBrowserProvider.notifier);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.md,
            AppSpace.xs,
            AppSpace.xs,
            AppSpace.xs,
          ),
          child: Row(
            children: [
              Expanded(child: AppBrowserSiteTitle(session: s, compact: true)),
              ...appBrowserRunActions(context, s, controller, icons: true),
              IconButton(
                key: const Key('appBrowserPanelFull'),
                tooltip: l10n.liveExpand,
                icon: const Icon(LucideIcons.maximize2, size: 18),
                onPressed: () => openAppBrowser(context),
              ),
              IconButton(
                key: const Key('appBrowserPanelComputer'),
                tooltip: l10n.showComputer,
                icon: const Icon(LucideIcons.monitor, size: 18),
                onPressed: s.run == null
                    ? null
                    : () => ref
                          .read(appBrowserPanelComputerProvider.notifier)
                          .choose(s.run!.id, s.url),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2,
          child: s.loading ? const LinearProgressIndicator(minHeight: 2) : null,
        ),
        Divider(height: 1, thickness: 1, color: context.appColors.hairline),
        // A strip beside the page for the panel's resize handle: on a Mac the page's native view
        // takes every click over it, so a handle drawn over the page can't be grabbed.
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: AppBrowserPageArea(
              showAsk: false,
              cursorSize: BotCursorSize.large,
              frozen: ref.watch(sidePanelDraggingProvider),
            ),
          ),
        ),
      ],
    );
  }
}
