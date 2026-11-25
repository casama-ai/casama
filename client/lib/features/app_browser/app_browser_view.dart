import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../ui/bot_cursor.dart';
import 'app_browser_channel.dart';
import 'app_browser_controller.dart';
import 'app_browser_linux.dart';

/// The native web area (PROTOCOL.md §3): a platform view of type `casama/app_browser_view` on
/// iOS, Android and macOS, or an overlay host on Linux (a `GtkOverlay`, docs/LINUX-BROWSER-PLAN.md
/// §4.2) and Windows (a WebView2 child window, docs/WINDOWS-BROWSER-PLAN.md §4.2).
/// Native keeps one web area for the app's life; this only shows it.
class AppBrowserWebArea extends StatelessWidget {
  const AppBrowserWebArea({super.key, this.suppressed = false});

  /// On Linux, temporarily hides the native GTK overlay (showing the last screenshot instead) so
  /// Flutter cards drawn over the page (such as an ask card) stay visible and clickable.
  final bool suppressed;

  // The page takes every touch inside it (scrolls, pinches, taps), not the screen around it.
  static final _gestures = <Factory<OneSequenceGestureRecognizer>>{
    Factory<OneSequenceGestureRecognizer>(EagerGestureRecognizer.new),
  };

  @override
  Widget build(BuildContext context) => switch (defaultTargetPlatform) {
    TargetPlatform.iOS => UiKitView(
      viewType: MethodAppBrowserChannel.viewType,
      gestureRecognizers: _gestures,
    ),
    TargetPlatform.android => AndroidView(
      viewType: MethodAppBrowserChannel.viewType,
      gestureRecognizers: _gestures,
    ),
    TargetPlatform.macOS => AppKitView(
      viewType: MethodAppBrowserChannel.viewType,
      gestureRecognizers: _gestures,
    ),
    // Windows has no platform views either: the WebView2 page is a child window laid over the
    // Flutter view, placed the same way (docs/WINDOWS-BROWSER-PLAN.md §1.1, §4.2).
    TargetPlatform.linux ||
    TargetPlatform.windows => _LinuxAppBrowserWebArea(suppressed: suppressed),
    _ => const SizedBox.shrink(),
  };
}

/// Hosts the WebKitGTK `WebKitWebView` inside the Linux window's `GtkOverlay` (§4.2): sends this
/// box's window coordinates to native on layout/resize, and hides the overlay (showing the last
/// captured screenshot in its place) whenever a route, dialog, snackbar, tooltip, drag preview,
/// emoji picker or ask card draws above it.
class _LinuxAppBrowserWebArea extends ConsumerStatefulWidget {
  const _LinuxAppBrowserWebArea({required this.suppressed});

  final bool suppressed;

  @override
  ConsumerState<_LinuxAppBrowserWebArea> createState() =>
      _LinuxAppBrowserWebAreaState();
}

class _LinuxAppBrowserWebAreaState
    extends ConsumerState<_LinuxAppBrowserWebArea>
    with WidgetsBindingObserver {
  /// Every web area on screen, and the one the overlay is placed over now. There is one overlay:
  /// only the area that placed it hides it, and when that one lets go the others place it again
  /// (the side panel under the full view, APP-BROWSER-PANEL-PLAN §3).
  static final _live = <_LinuxAppBrowserWebAreaState>[];
  static _LinuxAppBrowserWebAreaState? _shower;

  final _key = GlobalKey();
  late final AppBrowserChannel _channel;
  Rect? _lastRect;

  /// The size the hidden page waits at. One page for every area, so shared like [_shower].
  static Size? _parkedSize;
  bool _lastVisible = false;
  Uint8List? _snapshot;
  var _capturing = false;
  late final BotCursorController _cursor;

  /// False on Wayland, where Flutter draws above the GTK overlay: the page's picture shows here,
  /// refreshed twice a second, and the page gets a window of its own while the person types.
  /// Null until native says.
  bool? _liveOverlay;
  Timer? _pictures;
  // The page's own window (Wayland) is one for every area too.
  static var _pageWindowOpen = false;
  static var _pageWindowDismissed = false;
  ProviderSubscription<AppBrowserSession>? _session;

  @override
  void initState() {
    super.initState();
    _channel = ref.read(appBrowserChannelProvider);
    final browser = ref.read(appBrowserProvider.notifier);
    _cursor = browser.cursor;
    _cursor.addListener(_pushCursor);
    WidgetsBinding.instance.addObserver(this);
    _live.add(this);
    AppBrowserOverlayGuard.hidden.addListener(_onGuardChanged);
    AppBrowserLinuxLive.pageWindowClosed.addListener(_onPageWindowClosed);
    unawaited(
      browser.support().then((s) {
        if (!mounted) return;
        setState(() => _liveOverlay = s.liveOverlay);
        if (!s.liveOverlay) {
          _pictures = Timer.periodic(const Duration(milliseconds: 500), (_) {
            // Not while the page is in its own window: the person is there, and a picture
            // taken while the page moves between windows can leave it blank.
            if (!_pageWindowOpen) unawaited(_grabPicture());
          });
          _syncPageWindow(ref.read(appBrowserProvider));
        }
        _scheduleSync();
      }, onError: (_) {}),
    );
    _session = ref.listenManual(
      appBrowserProvider,
      (_, s) => _syncPageWindow(s),
    );
    _scheduleSync();
  }

  /// Wayland: while the person types into the page (Take Over, "Your turn", Sign In to a Site),
  /// it opens in a window of its own; it goes back when they're done or close it.
  void _syncPageWindow(AppBrowserSession s) {
    if (_liveOverlay != false || !mounted) return;
    final typing = s.person ||
        s.phase == AppBrowserPhase.tookOver ||
        s.phase == AppBrowserPhase.yourTurn;
    if (!typing) _pageWindowDismissed = false;
    final want = typing && !_pageWindowDismissed;
    if (want == _pageWindowOpen) return;
    _pageWindowOpen = want;
    unawaited(
      _channel
          .pageWindow(open: want, title: s.title.isEmpty ? s.url : s.title)
          .catchError((_) {}),
    );
  }

  /// Wayland: a picture, and the size of the page it shows (the hidden page keeps its own size,
  /// so the picture and the cursor are fitted to it).
  Future<void> _grabPicture() async {
    await _grabSnapshot();
    if (!mounted) return;
    try {
      final size = (await _channel.url()).size;
      if (mounted && !size.isEmpty) AppBrowserLinuxLive.pictureOf.value = size;
    } catch (_) {}
  }

  void _onPageWindowClosed() {
    _pageWindowOpen = false;
    _pageWindowDismissed = true;
  }

  /// Sends the bot's cursor to native, which draws it above the live page. While the page's
  /// picture shows instead, native's is hidden and the screen's Flutter cursor draws it.
  void _pushCursor() {
    if (!mounted) return;
    // Another area shows the page: the cursor is that one's to move.
    if (_shower != null && _shower != this) return;
    final t = _cursor.target;
    final live = _lastVisible;
    unawaited(
      _channel
          .setCursor(
            visible: live && t != null,
            x: t?.at.dx ?? 0,
            y: t?.at.dy ?? 0,
            act: switch (t?.act) {
              BotCursorAct.click => 'click',
              BotCursorAct.typing => 'typing',
              _ => 'rest',
            },
            step: t?.step ?? 0,
            nudge: t?.nudge ?? 0,
            label: ref.read(appBrowserProvider).run?.botName,
            color: Theme.of(context).colorScheme.primary.toARGB32(),
            size: BotCursorSize.large.points,
            reduceMotion: MediaQuery.disableAnimationsOf(context),
          )
          .catchError((_) {}),
    );
  }

  void _setLive(bool live) {
    if (AppBrowserLinuxLive.showing.value != live) {
      AppBrowserLinuxLive.showing.value = live;
    }
    _pushCursor();
  }

  @override
  void didUpdateWidget(covariant _LinuxAppBrowserWebArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.suppressed != widget.suppressed) {
      if (widget.suppressed) unawaited(_grabSnapshot());
      _scheduleSync();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scheduleSync();
  }

  @override
  void didChangeMetrics() {
    _scheduleSync();
  }

  void _onGuardChanged() {
    if (AppBrowserOverlayGuard.hidden.value) unawaited(_grabSnapshot());
    if (mounted) setState(() {});
    _scheduleSync();
  }

  bool get _shouldShow {
    if (!mounted) return false;
    // Not before native says the live overlay works (it never does on Wayland).
    if (_liveOverlay != true) return false;
    if (widget.suppressed || AppBrowserOverlayGuard.hidden.value) return false;
    final route = ModalRoute.of(context);
    if (route != null && !route.isCurrent) return false;
    return true;
  }

  Future<void> _grabSnapshot() async {
    if (_capturing || !mounted) return;
    _capturing = true;
    try {
      final bytes = await ref.read(appBrowserProvider.notifier).picture();
      if (mounted && bytes != null) setState(() => _snapshot = bytes);
    } finally {
      _capturing = false;
    }
  }

  void _scheduleSync() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncBounds());
  }

  void _syncBounds() {
    if (!mounted) return;
    final show = _shouldShow;
    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    final rect = box == null || !box.hasSize || box.size.isEmpty
        ? null
        : box.localToGlobal(Offset.zero) & box.size;
    if (!show) {
      // The page waits at this area's size (see [_park]), only while no other area shows the page: hiding it there would take it from that one.
      final mine = _shower == null || _shower == this;
      if (_lastVisible ||
          (mine && rect != null && rect.size != _parkedSize)) {
        _lastVisible = false;
        _lastRect = null;
        if (_shower == this) {
          _letGo(rect);
        } else if (mine) {
          _park(rect);
        }
      }
      return;
    }
    if (rect == null) return;
    if (_lastVisible && _lastRect == rect && _shower == this) return;
    final appearing = !_lastVisible || _shower != this;
    final before = _shower;
    if (before != null && before != this) {
      before._lastVisible = false;
      before._lastRect = null;
    }
    _shower = this;
    _lastVisible = true;
    _lastRect = rect;
    unawaited(
      _channel
          .setOverlayBounds(
            visible: true,
            x: rect.left,
            y: rect.top,
            width: rect.width,
            height: rect.height,
          )
          .catchError((_) {}),
    );
    if (appearing) _setLive(true);
  }

  /// Hides the page, laid out at [rect]'s size so its picture fills the area 1:1 and the bot's
  /// cursor drawn over the picture lands on the same spot.
  void _park(Rect? rect) {
    _parkedSize = rect?.size;
    unawaited(
      _channel
          .setOverlayBounds(
            visible: false,
            width: rect?.width ?? 0,
            height: rect?.height ?? 0,
          )
          .catchError((_) {}),
    );
    _setLive(false);
  }

  /// Hides the overlay and lets another area on screen place it.
  void _letGo(Rect? rect) {
    _shower = null;
    _park(rect);
    for (final other in _live) {
      if (other != this) other._scheduleSync();
    }
  }

  @override
  void dispose() {
    _pictures?.cancel();
    _session?.close();
    AppBrowserLinuxLive.pageWindowClosed.removeListener(_onPageWindowClosed);
    if (_pageWindowOpen && _live.length == 1) {
      _pageWindowOpen = false;
      unawaited(_channel.pageWindow(open: false).catchError((_) {}));
    }
    _cursor.removeListener(_pushCursor);
    AppBrowserOverlayGuard.hidden.removeListener(_onGuardChanged);
    WidgetsBinding.instance.removeObserver(this);
    _live.remove(this);
    if (_live.isEmpty) {
      // The last area: the next one parks the page again and starts its window afresh.
      _parkedSize = null;
      _pageWindowDismissed = false;
    }
    if (_shower == this) {
      // Not [_letGo]: it moves the cursor through ref, which is gone by now.
      _shower = null;
      unawaited(_channel.setOverlayBounds(visible: false).catchError((_) {}));
      unawaited(_channel.setCursor(visible: false).catchError((_) {}));
      for (final other in _live) {
        other._scheduleSync();
      }
    }
    // Not now: the screen listening to it can't rebuild while the tree is being torn down.
    scheduleMicrotask(() {
      if (_shower == null) AppBrowserLinuxLive.showing.value = false;
      if (_live.isEmpty) AppBrowserLinuxLive.pictureOf.value = null;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hidden = !_shouldShow;
    if (hidden && _snapshot == null) unawaited(_grabSnapshot());
    return LayoutBuilder(
      builder: (context, _) {
        _scheduleSync();
        return SizedBox.expand(
          key: _key,
          child: hidden && _snapshot != null
              ? Image.memory(
                  _snapshot!,
                  key: const Key('linuxOverlaySnapshot'),
                  // Wayland shows the whole page (it may not be the area's size); elsewhere the
                  // picture is the area's own size.
                  fit: _liveOverlay == false ? BoxFit.contain : BoxFit.cover,
                  alignment: Alignment.topCenter,
                  gaplessPlayback: true,
                )
              : const SizedBox.expand(),
        );
      },
    );
  }
}

/// Builds the web area; tests put a plain box in (platform views don't draw in widget tests).
final appBrowserWebAreaProvider = Provider<WidgetBuilder>(
  (ref) =>
      (_) => const AppBrowserWebArea(),
);
