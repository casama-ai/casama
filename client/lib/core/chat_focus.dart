import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'backend.dart';
import 'install_id.dart';
import 'providers.dart';

/// Tells the server which chat is on screen on this install (D-325), so a reply to it doesn't
/// push to any of the person's devices, and clears that chat's notifications from the system.
///
/// The chat screen calls [open] and [close]. While a chat is open and the app is in front, the
/// focus is sent again every [refresh]; the server ignores one older than 45 seconds, so a killed
/// app never silences replies for long. Going to the background sends null at once.
class ChatFocusReporter with WidgetsBindingObserver {
  ChatFocusReporter(this._backend, {this.prefs}) {
    WidgetsBinding.instance.addObserver(this);
    _foreground = _isForeground(WidgetsBinding.instance.lifecycleState);
  }

  final Backend _backend;

  /// Where the install's id is kept (tests pass their own).
  SharedPreferences? prefs;

  static const refresh = Duration(seconds: 30);

  /// Foreground presence refresh when no chat is open (D-534).
  static const presenceRefresh = Duration(seconds: 60);

  String? _conversation;
  bool _foreground = true;
  bool _presenceEnabled = false;
  DateTime? _foregroundSince;
  String? _sent;
  bool _sentOnce = false;
  bool _sentActive = false;
  Timer? _timer;
  bool _disposed = false;

  /// Starts reporting foreground presence even outside a chat (D-534). Called once the signed-in
  /// shell mounts; idempotent.
  void enablePresence() {
    if (_presenceEnabled || _disposed) return;
    _presenceEnabled = true;
    if (_foreground) {
      _foregroundSince ??= DateTime.now().toUtc();
      _sync();
    }
  }

  /// The chat on screen, as last reported by the chat screen.
  String? get conversation => _conversation;

  /// What the server should see now: the open chat while the app is in front.
  String? get focus => _foreground ? _conversation : null;

  /// On macOS, Linux and Windows, the chat stays open for the in-app browser while the window isn't
  /// hidden or closed (IN-APP-BROWSER-PLAN §4, LINUX-BROWSER-PLAN §3, WINDOWS-BROWSER-PLAN §3).
  bool _windowOpen = true;
  String? get _openForDesktop =>
      !kIsWeb &&
          (defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.linux ||
              defaultTargetPlatform == TargetPlatform.windows) &&
          _windowOpen
      ? _conversation
      : null;

  void open(String? conversationId) {
    if (conversationId == _conversation) return;
    _conversation = conversationId;
    if (conversationId != null) unawaited(clearSystemNotifications(conversationId));
    _sync();
  }

  /// Only clears when [conversationId] is still the open one (another chat may have opened first).
  void close(String? conversationId) {
    if (conversationId != _conversation) return;
    _conversation = null;
    _sync();
  }

  /// Called on macOS when the main window hides (Cmd+W / close button) or reappears.
  void setWindowOpen(bool open) {
    if (open == _windowOpen) return;
    _windowOpen = open;
    _sync();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final front = _isForeground(state);
    final winOpen = state != AppLifecycleState.hidden && state != AppLifecycleState.detached;
    if (front == _foreground && winOpen == _windowOpen) return;
    final wasFront = _foreground;
    _foreground = front;
    _windowOpen = winOpen;
    if (front && !wasFront) {
      _foregroundSince = DateTime.now().toUtc();
    } else if (!front) {
      _foregroundSince = null;
    }
    if (front && _conversation != null) unawaited(clearSystemNotifications(_conversation!));
    _sync();
  }

  /// On a phone, `inactive` still counts: the chat is on screen behind Face ID, AutoFill, Control
  /// Center or the notification shade (D-529), and the in-app browser needs the focus to hold.
  static bool _isForeground(AppLifecycleState? state) =>
      state == null ||
      state == AppLifecycleState.resumed ||
      (state == AppLifecycleState.inactive && _isPhone);

  static bool get _isPhone =>
      !kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

  String? _sentOpen;

  void _sync() {
    if (_disposed) return;
    final want = focus;
    final wantOpen = _openForDesktop;
    final wantActive = _presenceEnabled && _foreground;
    if (wantActive || want != null) _foregroundSince ??= DateTime.now().toUtc();
    _timer?.cancel();
    _timer = null;
    if (want != null || wantOpen != null) {
      _timer = Timer.periodic(
        refresh,
        (_) => unawaited(_send(want, wantOpen, active: _foreground, force: true)),
      );
      unawaited(_send(want, wantOpen, active: _foreground));
      return;
    }
    if (wantActive) {
      _timer = Timer.periodic(
        presenceRefresh,
        (_) => unawaited(_send(null, null, active: true, force: true)),
      );
      unawaited(_send(null, null, active: true));
      return;
    }
    // Going to the background with a chat open must clear conversation_id (and clears active_at
    // in the same upsert). Outside a chat, stopping the timer lets active_at age out with no write.
    if (_sent != null || _sentOpen != null) {
      unawaited(_send(null, null, active: false));
    } else {
      // Mark locally inactive so returning to foreground sends a fresh presence heartbeat at once.
      _sentActive = false;
    }
  }

  Future<void> _send(
    String? conversationId,
    String? openConversationId, {
    required bool active,
    bool force = false,
  }) async {
    // Nothing to clear on a fresh start: an install that never reported has no row.
    if (!force && _sentOnce && conversationId == _sent && openConversationId == _sentOpen && active == _sentActive) {
      return;
    }
    if (!force && !_sentOnce && conversationId == null && openConversationId == null && !active) return;
    _sent = conversationId;
    _sentOpen = openConversationId;
    _sentActive = active;
    _sentOnce = true;
    try {
      await _backend.setChatFocus(
        await clientId(),
        conversationId,
        openConversationId: openConversationId,
        active: active,
        activeSince: active ? _foregroundSince : null,
      );
    } catch (e) {
      // Best effort: a server from before D-325 has no chat_focus table, and the push still comes.
      debugPrint('chat focus not sent: $e');
    }
  }

  /// A random id for this install, kept across launches.
  Future<String> clientId() async => installId(prefs ??= await SharedPreferences.getInstance());

  void dispose() {
    _disposed = true;
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }
}

/// The native side of notifications (D-325): clearing a chat's notifications, the iPhone badge,
/// and approval buttons tapped on Android. Missing on platforms without it.
const notificationsChannel = MethodChannel('casama/notifications');

/// Removes this conversation's reply notifications from the notification centre (Android: by
/// tag; iPhone and Mac: by thread).
Future<void> clearSystemNotifications(String conversationId) async {
  if (kIsWeb) return;
  if (defaultTargetPlatform != TargetPlatform.android && defaultTargetPlatform != TargetPlatform.iOS && defaultTargetPlatform != TargetPlatform.macOS) return;
  try {
    await notificationsChannel.invokeMethod('clear', {'conversation_id': conversationId, 'tag': 'reply-$conversationId'});
  } catch (_) {
    // Older native code without the channel: nothing to clear.
  }
}

final chatFocusProvider = Provider<ChatFocusReporter>((ref) {
  final reporter = ChatFocusReporter(ref.watch(backendProvider));
  ref.onDispose(reporter.dispose);
  return reporter;
});
