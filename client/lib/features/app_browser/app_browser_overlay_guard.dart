import 'dart:ui' show Size;

import 'package:flutter/foundation.dart';

/// Ref-counted guard that hides the Linux native GTK overlay whenever Flutter draws a popup,
/// snackbar, tooltip, drag preview, ask card or emoji picker over the chat/browser
/// (docs/LINUX-BROWSER-PLAN.md §4.2). Kept tiny with no app-browser imports so release builds
/// without `CASAMA_APP_BROWSER` still tree-shake the rest of `app_browser/`.
class AppBrowserOverlayGuard {
  AppBrowserOverlayGuard._();

  static int _count = 0;

  /// True while at least one Flutter popup or overlay is above the web area.
  static final ValueNotifier<bool> hidden = ValueNotifier<bool>(false);

  /// Suppresses the GTK overlay until the returned callback is called (idempotent).
  static VoidCallback suppress() {
    _count++;
    if (!hidden.value) hidden.value = true;
    var released = false;
    return () {
      if (released) return;
      released = true;
      if (_count > 0) _count--;
      if (_count == 0 && hidden.value) hidden.value = false;
    };
  }

  /// Suppresses the GTK overlay for the lifetime of [future].
  static Future<T> suppressWhile<T>(Future<T> future) {
    final release = suppress();
    return future.whenComplete(release);
  }

  @visibleForTesting
  static void resetForTesting() {
    _count = 0;
    hidden.value = false;
    AppBrowserLinuxLive.showing.value = false;
  }
}

/// Whether the Linux live web area is on screen right now (not its picture). While it is, native
/// draws the bot's cursor above the page and the Flutter cursor stays hidden, so there is never
/// two cursors or none (LINUX-BROWSER-PLAN §4.2).
abstract final class AppBrowserLinuxLive {
  static final ValueNotifier<bool> showing = ValueNotifier<bool>(false);

  /// Goes up each time the person closes the page's own window (Wayland).
  static final ValueNotifier<int> pageWindowClosed = ValueNotifier<int>(0);

  /// The page's size in points while its picture shows (Wayland), for fitting the cursor drawn
  /// over the picture; null when the picture is the area's own size.
  static final ValueNotifier<Size?> pictureOf = ValueNotifier<Size?>(null);
}
