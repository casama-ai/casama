import 'package:flutter/foundation.dart'
    show TargetPlatform, Uint8List, defaultTargetPlatform;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/haptics.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/bot_cursor.dart';
import 'app_browser_ask.dart';
import 'app_browser_controller.dart';
import 'app_browser_flag.dart';
import 'app_browser_glow.dart';
import 'app_browser_linux.dart';
import 'app_browser_view.dart';

// The parts of the in-app browser that the full view (AppBrowserScreen) and the side panel on wide
// windows (AppBrowserPanel) share, so the two can't drift apart (APP-BROWSER-PANEL-PLAN §4.1).

/// The site with its lock and, while the bot works, "(bot) is working".
class AppBrowserSiteTitle extends StatelessWidget {
  const AppBrowserSiteTitle({
    super.key,
    required this.session,
    this.compact = false,
  });
  final AppBrowserSession session;

  /// The panel's smaller header.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = session;
    final scheme = context.colorScheme;
    final colors = context.appColors;
    final site = s.host ?? (s.title.isNotEmpty ? s.title : '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (site.isNotEmpty)
              Tooltip(
                message: s.secure
                    ? l10n.appBrowserSecure
                    : l10n.appBrowserNotSecure,
                child: Icon(
                  s.secure ? LucideIcons.lock : LucideIcons.lockOpen,
                  key: Key(s.secure ? 'appBrowserLock' : 'appBrowserNoLock'),
                  size: compact ? 13 : 15,
                  color: s.secure ? scheme.onSurfaceVariant : colors.negative,
                ),
              ),
            if (site.isNotEmpty) const SizedBox(width: 6),
            Flexible(
              child: Text(
                site.isEmpty ? appBrowserTitleFor(l10n) : site,
                key: const Key('appBrowserSite'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: compact
                    ? context.textTheme.titleSmall
                    : context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
        // Paused and "Your turn" have their own banner below.
        if (s.phase == AppBrowserPhase.working ||
            s.phase == AppBrowserPhase.asking)
          Text(
            l10n.appBrowserWorking(s.run?.botName ?? ''),
            key: const Key('appBrowserBot'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}

/// Take Over, Hand Back and Stop, as the session allows. With [icons] (the side panel's header) they
/// are icon buttons with tooltips, like the panel's other header buttons, so the site keeps room.
List<Widget> appBrowserRunActions(
  BuildContext context,
  AppBrowserSession s,
  AppBrowserController controller, {
  bool icons = false,
}) {
  final l10n = context.l10n;
  final held =
      s.phase == AppBrowserPhase.tookOver ||
      s.phase == AppBrowserPhase.yourTurn;
  void stop() {
    Haptic.press();
    controller.stopBot();
  }

  void takeOver() {
    Haptic.tap();
    controller.takeOver();
  }

  void handBack() {
    Haptic.confirm();
    controller.handBack();
  }

  if (icons) {
    return [
      if (s.botActive && !held)
        IconButton(
          key: const Key('appBrowserTakeOver'),
          tooltip: l10n.appBrowserTakeOver,
          icon: const Icon(LucideIcons.hand, size: 18),
          onPressed: takeOver,
        ),
      if (held)
        IconButton(
          key: const Key('appBrowserHandBack'),
          tooltip: l10n.appBrowserHandBack,
          icon: const Icon(LucideIcons.play, size: 18),
          onPressed: handBack,
        ),
      if (s.botActive)
        IconButton(
          key: const Key('appBrowserStop'),
          tooltip: l10n.stop,
          color: context.appColors.negative,
          icon: const Icon(LucideIcons.square, size: 18),
          onPressed: stop,
        ),
    ];
  }
  return [
    if (s.botActive && !held)
      TextButton(
        key: const Key('appBrowserTakeOver'),
        onPressed: takeOver,
        child: Text(l10n.appBrowserTakeOver),
      ),
    if (held)
      TextButton(
        key: const Key('appBrowserHandBack'),
        onPressed: handBack,
        child: Text(l10n.appBrowserHandBack),
      ),
    if (s.botActive)
      TextButton.icon(
        key: const Key('appBrowserStop'),
        style: TextButton.styleFrom(
          foregroundColor: context.appColors.negative,
        ),
        onPressed: stop,
        icon: const Icon(LucideIcons.square, size: 16),
        label: Text(l10n.stop),
      ),
  ];
}

/// The page: the "paused", "Your turn" or "away" banner, the web area, the bot's cursor over it
/// and, with [showAsk], the ask over the bottom of the page.
class AppBrowserPageArea extends ConsumerWidget {
  const AppBrowserPageArea({
    super.key,
    this.showAsk = true,
    this.cursorSize = BotCursorSize.large,
    this.frozen = false,
  });

  /// The panel leaves the ask to the card at the bottom of the chat beside it, so it isn't shown
  /// twice.
  final bool showAsk;
  final BotCursorSize cursorSize;

  /// A picture of the page in place of the page, while the panel's edge is dragged: on a Mac the
  /// page's native view takes the mouse as soon as the pointer crosses it.
  final bool frozen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(appBrowserProvider);
    final controller = ref.read(appBrowserProvider.notifier);
    final colors = context.appColors;
    final bot = s.run?.botName ?? '';
    void handBack() {
      Haptic.confirm();
      controller.handBack();
    }
    final banner = switch (s.phase) {
      AppBrowserPhase.yourTurn => AppBrowserBanner(
        key: const Key('appBrowserYourTurn'),
        color: colors.waiting,
        icon: LucideIcons.hand,
        title: l10n.appBrowserYourTurn,
        message: s.handoffReason,
        action: TextButton(
          key: const Key('appBrowserHandBackBanner'),
          onPressed: handBack,
          child: Text(l10n.appBrowserHandBack),
        ),
      ),
      AppBrowserPhase.tookOver => AppBrowserBanner(
        key: const Key('appBrowserPausedBanner'),
        color: colors.working,
        icon: LucideIcons.pause,
        title: l10n.appBrowserPaused(bot),
        action: TextButton(
          key: const Key('appBrowserHandBackBanner'),
          onPressed: handBack,
          child: Text(l10n.appBrowserHandBack),
        ),
      ),
      AppBrowserPhase.away when s.run != null => AppBrowserBanner(
        color: context.colorScheme.onSurfaceVariant,
        icon: LucideIcons.circlePause,
        title: l10n.appBrowserAway,
      ),
      _ => null,
    };
    final ask = showAsk ? s.ask : null;
    return Column(
      children: [
        ?banner,
        Expanded(
          // The glow around the page while a bot drives it (APP-BROWSER-GLOW-PLAN).
          child: AppBrowserDriveGlow(child: Stack(
            fit: StackFit.expand,
            children: [
              if (frozen)
                const _PagePicture(key: Key('appBrowserFrozen'))
              else
                ref.watch(appBrowserWebAreaProvider)(context),
              // The bot's cursor, drawn by the app above the page (BOT-CURSOR-PLAN §5). It takes
              // no touches, so the page still gets every one. On Linux the live page is a GTK
              // layer above Flutter, so native draws it there instead; this one only shows over
              // the page's picture.
              ValueListenableBuilder<bool>(
                valueListenable: AppBrowserLinuxLive.showing,
                builder: (context, nativeCursor, _) => ValueListenableBuilder<Size?>(
                  valueListenable: AppBrowserLinuxLive.pictureOf,
                  builder: (context, pictureOf, _) => BotCursor(
                    controller: controller.cursor,
                    // Over a Wayland picture of the whole page, fitted like the picture.
                    fit: pictureOf == null
                        ? BotCursorFits.points
                        : (at, of, box) => BotCursorFits.contain(
                            Alignment.topCenter,
                          )(at, pictureOf, box),
                    size: cursorSize,
                    label: s.run?.botName,
                    reportsArea: true,
                    drift: ref.watch(appBrowserGlowMotionProvider),
                    visible: !((defaultTargetPlatform == TargetPlatform.linux ||
                            defaultTargetPlatform == TargetPlatform.windows) &&
                        nativeCursor),
                  ),
                ),
              ),
              if (ask != null)
                Positioned(
                  left: AppSpace.sm,
                  right: AppSpace.sm,
                  bottom: AppSpace.sm,
                  child: Material(
                    type: MaterialType.transparency,
                    child: AppBrowserAskCard(ask: ask),
                  ),
                ),
            ],
          )),
        ),
      ],
    );
  }
}

/// The page as it was when this appeared (one picture, not a live one).
class _PagePicture extends ConsumerStatefulWidget {
  const _PagePicture({super.key});

  @override
  ConsumerState<_PagePicture> createState() => _PagePictureState();
}

class _PagePictureState extends ConsumerState<_PagePicture> {
  Uint8List? _bytes;

  @override
  void initState() {
    super.initState();
    ref.read(appBrowserProvider.notifier).picture().then((b) {
      if (mounted && b != null) setState(() => _bytes = b);
    });
  }

  @override
  Widget build(BuildContext context) {
    final b = _bytes;
    if (b == null) return const SizedBox.expand();
    return Image.memory(
      b,
      fit: BoxFit.cover,
      alignment: Alignment.topLeft,
      gaplessPlayback: true,
    );
  }
}

class AppBrowserBanner extends StatelessWidget {
  const AppBrowserBanner({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    this.message,
    this.action,
  });
  final Color color;
  final IconData icon;
  final String title;
  final String? message;
  final Widget? action;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(
      AppSpace.md,
      AppSpace.xs,
      AppSpace.xs,
      AppSpace.xs,
    ),
    color: color.withValues(alpha: 0.14),
    child: Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: AppSpace.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if ((message ?? '').isNotEmpty)
                Text(message!, style: context.textTheme.bodySmall),
            ],
          ),
        ),
        ?action,
      ],
    ),
  );
}
