import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// What this phone's web area can do (`supported` in PROTOCOL.md §3).
class AppBrowserSupport {
  const AppBrowserSupport({
    required this.supported,
    this.reason,
    this.realTaps = false,
    this.liveOverlay = true,
  });

  factory AppBrowserSupport.fromMap(Map<Object?, Object?>? m) =>
      AppBrowserSupport(
        supported: m?['supported'] == true,
        reason: m?['reason'] as String?,
        realTaps: m?['realTaps'] == true,
        liveOverlay: m?['liveOverlay'] != false,
      );

  /// No native side (a build without the switch, a test): not available.
  static const missing = AppBrowserSupport(supported: false, reason: 'missing');

  final bool supported;

  /// Why not, from native ("os_too_old", "no_isolated_world", ...), for the settings screen.
  final String? reason;

  /// Android: clicks are real taps sent to the view; iPhone: the page script sends the events.
  final bool realTaps;

  /// Linux: whether the live page can be laid over the window. Not on Wayland, where Flutter
  /// draws above it: the app shows the page's picture, and a window of its own for typing.
  final bool liveOverlay;
}

/// Where the web area is (`url` in PROTOCOL.md §3).
class AppBrowserPage {
  const AppBrowserPage({
    required this.url,
    this.title = '',
    this.loading = false,
    this.canGoBack = false,
    this.canGoForward = false,
    this.size = Size.zero,
  });

  factory AppBrowserPage.fromMap(Map<Object?, Object?>? m) => AppBrowserPage(
    url: (m?['url'] as String?) ?? 'about:blank',
    title: (m?['title'] as String?) ?? '',
    loading: m?['loading'] == true,
    canGoBack: m?['canGoBack'] == true,
    canGoForward: m?['canGoForward'] == true,
    size: Size(
      (m?['width'] as num?)?.toDouble() ?? 0,
      (m?['height'] as num?)?.toDouble() ?? 0,
    ),
  );

  static const blank = AppBrowserPage(url: 'about:blank');

  final String url;
  final String title;
  final bool loading;
  final bool canGoBack;
  final bool canGoForward;

  /// Linux: the page's size in points (its picture and the cursor are fitted to it).
  final Size size;
}

/// The calls native makes on Dart (PROTOCOL.md §3, "Methods native calls on Dart").
abstract interface class AppBrowserNativeEvents {
  /// A main-frame navigation is about to start; true lets it load. [user]: started by a real touch.
  Future<bool> navigate(
    String url, {
    required bool redirect,
    required bool user,
  });
  void pageStarted(String url);
  void pageFinished(String url, String title);

  /// The address actually committed (after redirects); false makes native load about:blank.
  Future<bool> landed(String url);

  /// A real finger touched the web area (never native's own [AppBrowserChannel.tap]).
  void userTouched();

  /// A page dialog opened; answered later with [AppBrowserChannel.answerDialog].
  void dialog(String kind, String message);

  /// The web content process ended; the page is lost.
  void gone(String reason);

  /// macOS: the main window was closed/hidden (keeps the page for ten minutes, stops active bots).
  void windowHidden() {}

  /// macOS: the main window is on screen again (Dock, menu bar, notch) after [windowHidden].
  void windowShown() {}

  /// Linux (Wayland): the person closed the page's own window.
  void pageWindowClosed() {}
}

/// The `casama/app_browser` method channel (PROTOCOL.md §3): one web area per app, created on
/// first use and kept while the app lives.
abstract interface class AppBrowserChannel {
  Future<AppBrowserSupport> supported();
  Future<void> load(String url);

  /// Sends one page-script command (packages/page-agent/README.md) and returns its answer.
  Future<Map<String, dynamic>> command(
    Map<String, Object?> command, {
    int? timeoutMs,
  });

  /// Android only: a real tap at [x],[y] (CSS px in the viewport).
  Future<void> tap(double x, double y);

  /// Android only: whether the page may open the soft keyboard. Shut while a bot drives the page,
  /// open once the person has it (Take Over, "Your turn"); a real touch opens it natively too.
  Future<void> keyboard({required bool allowed});

  /// A JPEG of the web area, base64; null when there is none yet.
  Future<String?> screenshot({int quality = 70});
  Future<AppBrowserPage> url();
  Future<void> back();
  Future<void> forward();
  Future<void> reload();
  Future<void> stop();
  Future<void> answerDialog({required bool accept, String? text});

  /// Linux only: positions or hides the native `GtkOverlay` child carrying the `WebKitWebView`.
  Future<void> setOverlayBounds({
    required bool visible,
    double x = 0,
    double y = 0,
    double width = 0,
    double height = 0,
  });

  /// Linux only: the bot's cursor over the live web area. Native draws it one layer above the
  /// page, because a cursor Flutter draws would be under the `GtkOverlay` web view (BOT-CURSOR-PLAN,
  /// LINUX-BROWSER-PLAN §4.2). [x],[y] are in the web area's points; [act] is rest, click or
  /// typing; [step] goes up with every step; [color] is ARGB.
  Future<void> setCursor({
    required bool visible,
    double x = 0,
    double y = 0,
    String act = 'rest',
    int step = 0,
    int nudge = 0,
    String? label,
    int color = 0xFF6750A4,
    double size = 22,
    bool reduceMotion = false,
  });

  /// Linux (Wayland) only: shows the live page in a window of its own, for the person to type
  /// into, or puts it back.
  Future<void> pageWindow({required bool open, String? title});

  /// Clears cookies and site data: one [host], or everything.
  Future<void> clearData({String? host});

  /// Destroys the web view and its context. When [wipeData] is true (Linux sign-out, §4.1),
  /// deletes the separate data and cache folders after WebKit's helper processes stop.
  Future<void> dispose({bool wipeData = false});

  /// Who answers native's calls; one at a time (the controller).
  void setHandler(AppBrowserNativeEvents? handler);
}

/// The real channel.
class MethodAppBrowserChannel implements AppBrowserChannel {
  MethodAppBrowserChannel([MethodChannel? channel])
    : _channel = channel ?? const MethodChannel(name);

  static const name = 'casama/app_browser';

  /// The platform view type of the web area (no creation params).
  static const viewType = 'casama/app_browser_view';

  final MethodChannel _channel;
  AppBrowserNativeEvents? _handler;

  Future<Map<Object?, Object?>?> _call(
    String method, [
    Map<String, Object?>? args,
  ]) => _channel.invokeMethod<Map<Object?, Object?>>(method, args);

  @override
  Future<AppBrowserSupport> supported() async {
    try {
      return AppBrowserSupport.fromMap(await _call('supported'));
    } on MissingPluginException {
      return AppBrowserSupport.missing;
    } on PlatformException catch (e) {
      return AppBrowserSupport(supported: false, reason: e.code);
    }
  }

  @override
  Future<void> load(String url) => _call('load', {'url': url});

  @override
  Future<Map<String, dynamic>> command(
    Map<String, Object?> command, {
    int? timeoutMs,
  }) async {
    final back = await _channel.invokeMethod<Object?>('command', {
      'json': jsonEncode(command),
      'timeout_ms': ?timeoutMs,
    });
    final raw = back is Map ? back['json'] : back;
    if (raw is String) return (jsonDecode(raw) as Map).cast<String, dynamic>();
    if (raw is Map) return raw.cast<String, dynamic>();
    return {'ok': false, 'code': 'error', 'message': 'No answer from the page'};
  }

  @override
  Future<void> tap(double x, double y) => _call('tap', {'x': x, 'y': y});

  @override
  Future<void> keyboard({required bool allowed}) async {
    try {
      await _call('keyboard', {'allowed': allowed});
    } on MissingPluginException {
      // Only Android's web area needs it.
    }
  }

  @override
  Future<String?> screenshot({int quality = 70}) async =>
      (await _call('screenshot', {'quality': quality}))?['data'] as String?;

  @override
  Future<AppBrowserPage> url() async =>
      AppBrowserPage.fromMap(await _call('url'));

  @override
  Future<void> back() => _call('back');

  @override
  Future<void> forward() => _call('forward');

  @override
  Future<void> reload() => _call('reload');

  @override
  Future<void> stop() => _call('stop');

  @override
  Future<void> answerDialog({required bool accept, String? text}) =>
      _call('answerDialog', {'accept': accept, 'text': text});

  @override
  Future<void> setOverlayBounds({
    required bool visible,
    double x = 0,
    double y = 0,
    double width = 0,
    double height = 0,
  }) => _call('setOverlayBounds', {
    'visible': visible,
    'x': x,
    'y': y,
    'width': width,
    'height': height,
  });

  @override
  Future<void> setCursor({
    required bool visible,
    double x = 0,
    double y = 0,
    String act = 'rest',
    int step = 0,
    int nudge = 0,
    String? label,
    int color = 0xFF6750A4,
    double size = 22,
    bool reduceMotion = false,
  }) => _channel.invokeMethod<Object?>('cursor', {
    'visible': visible,
    'x': x,
    'y': y,
    'act': act,
    'step': step,
    'nudge': nudge,
    'label': label,
    'color': color,
    'size': size,
    'reduceMotion': reduceMotion,
  });

  @override
  Future<void> pageWindow({required bool open, String? title}) =>
      _call('pageWindow', {'open': open, 'title': title});

  @override
  Future<void> clearData({String? host}) => _call('clearData', {'host': host});

  @override
  Future<void> dispose({bool wipeData = false}) =>
      _call('dispose', {'wipeData': wipeData});

  @override
  void setHandler(AppBrowserNativeEvents? handler) {
    _handler = handler;
    _channel.setMethodCallHandler(handler == null ? null : _onNative);
  }

  Future<Object?> _onNative(MethodCall call) async {
    final h = _handler;
    if (h == null) return null;
    final a = (call.arguments as Map?)?.cast<String, Object?>() ?? const {};
    String s(String key) => (a[key] as String?) ?? '';
    switch (call.method) {
      case 'navigate':
        return h.navigate(
          s('url'),
          redirect: a['redirect'] == true,
          user: a['user'] == true,
        );
      case 'pageStarted':
        h.pageStarted(s('url'));
      case 'pageFinished':
        h.pageFinished(s('url'), s('title'));
      case 'landed':
        return h.landed(s('url'));
      case 'userTouched':
        h.userTouched();
      case 'dialog':
        h.dialog(s('kind'), s('message'));
      case 'gone':
        h.gone(s('reason'));
      case 'windowHidden':
        h.windowHidden();
      case 'windowShown':
        h.windowShown();
      case 'pageWindowClosed':
        h.pageWindowClosed();
      default:
        throw MissingPluginException(
          'casama/app_browser has no ${call.method}',
        );
    }
    return null;
  }
}

/// The channel the app uses; tests put a fake in.
final appBrowserChannelProvider = Provider<AppBrowserChannel>(
  (ref) => MethodAppBrowserChannel(),
);
