import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../theme/app_tokens.dart';
import '../../ui/screen_tile.dart';
import '../../ui/shell_layout.dart';
import '../chat/widgets/screen_card.dart' show screenCardWidth;
import 'app_browser_ask.dart';
import 'app_browser_controller.dart';
import 'app_browser_flag.dart';
import 'app_browser_panel.dart' show appBrowserInPanelProvider;
import 'app_browser_settings.dart' show openAppBrowser;
import '../../ui/decode_size.dart';

/// The phone browser over a phone chat (plan §4, SCREEN-CARD-PLAN): while a bot works on this
/// phone from this chat, the floating card shows the page (a picture a second; a tap opens it full
/// size), and an ask waits as a card at the bottom so it can be answered without opening it.
class AppBrowserChatOverlay extends ConsumerStatefulWidget {
  const AppBrowserChatOverlay({
    super.key,
    required this.conversationId,
    required this.layout,
    required this.running,
  });
  final String? conversationId;

  /// Whether the chat has a reply in progress. When it stops, the bot's use of the phone is over.
  final bool running;
  final LayoutSize layout;

  @override
  ConsumerState<AppBrowserChatOverlay> createState() =>
      _AppBrowserChatOverlayState();
}

class _AppBrowserChatOverlayState extends ConsumerState<AppBrowserChatOverlay> {
  /// Read only when the phone browser is on, so a chat without it never starts one.
  AppBrowserController? _controller;

  /// The run whose card the person hid; it comes back for the next run.
  String? _hiddenRun;

  @override
  void didUpdateWidget(AppBrowserChatOverlay old) {
    super.didUpdateWidget(old);
    final left = old.conversationId;
    // After this frame: a provider can't change while the tree builds.
    final c = _controller;
    if (c != null && left != widget.conversationId) {
      Future.microtask(() => c.leftChat(left));
    } else if (c != null && old.running && !widget.running) {
      Future.microtask(() => c.runOver(widget.conversationId));
    }
  }

  @override
  void dispose() {
    // Leaving the chat stops the bot's use of the phone (plan §5).
    final left = widget.conversationId;
    final c = _controller;
    if (c != null) Future.microtask(() => c.leftChat(left));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!kAppBrowserCode || !ref.watch(appBrowserOnProvider)) {
      return const SizedBox.shrink();
    }
    _controller ??= ref.read(appBrowserProvider.notifier);
    final s = ref.watch(appBrowserProvider);
    final here =
        widget.conversationId != null &&
        s.run?.conversationId == widget.conversationId;
    if (!here || !(s.botActive || s.phase == AppBrowserPhase.away)) {
      return const SizedBox.shrink();
    }
    final ask = s.ask;
    final tileState = switch (s.phase) {
      AppBrowserPhase.working => ScreenTileState.watching,
      AppBrowserPhase.asking ||
      AppBrowserPhase.yourTurn => ScreenTileState.needsYou,
      AppBrowserPhase.tookOver => ScreenTileState.held,
      _ => ScreenTileState.stale,
    };
    // On a Mac the page waits laid out at the window's size, so its picture is landscape; a
    // phone-shaped card would leave its lower half empty.
    final aspect = !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS
        ? 16 / 10
        : 10 / 14;
    // The side panel beside the chat shows the page itself (APP-BROWSER-PANEL-PLAN §2.3).
    final inPanel = ref.watch(appBrowserInPanelProvider) > 0;
    return Stack(
      children: [
        if (_hiddenRun != s.run?.id && !inPanel)
          LayoutBuilder(
            builder: (context, box) => ScreenTileCorner(
              width: screenCardWidth(box.maxWidth, widget.layout),
              aspectRatio: aspect,
              child: ScreenTile(
                key: const Key('appBrowserTile'),
                picture: _LivePicture(
                  live:
                      s.phase == AppBrowserPhase.working ||
                      s.phase == AppBrowserPhase.asking,
                ),
                state: tileState,
                botName: s.run?.botName ?? '',
                aspectRatio: aspect,
                onTap: () => openAppBrowser(context),
                onClose: () => setState(() => _hiddenRun = s.run?.id),
              ),
            ),
          ),
        if (ask != null && ask.conversationId == widget.conversationId)
          Positioned(
            left: AppSpace.sm,
            right: AppSpace.sm,
            bottom: AppSpace.sm,
            child: AppBrowserAskCard(ask: ask),
          ),
      ],
    );
  }
}

/// The page as a picture, fetched once a second while [live] (one platform view is enough).
class _LivePicture extends ConsumerStatefulWidget {
  const _LivePicture({required this.live});
  final bool live;

  @override
  ConsumerState<_LivePicture> createState() => _LivePictureState();
}

class _LivePictureState extends ConsumerState<_LivePicture> {
  Uint8List? _bytes;
  Timer? _tick;
  var _busy = false;

  @override
  void initState() {
    super.initState();
    // Linux and Windows cards refresh about twice a second while the bot works (their live page is a
    // native layer over the window, so the card shows pictures: LINUX-BROWSER-PLAN §4.2,
    // WINDOWS-BROWSER-PLAN §4.2).
    final period = !kIsWeb &&
            (defaultTargetPlatform == TargetPlatform.linux ||
                defaultTargetPlatform == TargetPlatform.windows)
        ? const Duration(milliseconds: 500)
        : const Duration(seconds: 1);
    _tick = Timer.periodic(period, (_) => _grab());
    _grab();
  }

  Future<void> _grab() async {
    if (_busy || (!widget.live && _bytes != null)) return;
    _busy = true;
    final b = await ref.read(appBrowserProvider.notifier).picture();
    _busy = false;
    if (mounted && b != null) setState(() => _bytes = b);
  }

  @override
  void dispose() {
    _tick?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final b = _bytes;
    if (b == null) return const SizedBox.shrink();
    return LayoutBuilder(
      builder: (context, box) => Image(
        image: widthDecode(context, MemoryImage(b), width: box.maxWidth),
        key: const Key('appBrowserPicture'),
        // The page's full width, top first: on a Mac a page waits laid out at the window's size, so
        // a wide picture filling the narrow card would lose both sides.
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        gaplessPlayback: true,
      ),
    );
  }
}
