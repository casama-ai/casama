import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Keeps the phone's screen on, never in the background. iOS and Android only, over the
/// `casama/screen_awake` channel; elsewhere a no-op.
///
/// More than one thing can ask: a call screen in front (D-327 §7, `by: 'call'`) and a bot using
/// the in-app browser from the chat on screen (`by: 'browser'`). The screen stays on while any of
/// them holds it.
abstract final class ScreenAwake {
  static const _channel = MethodChannel('casama/screen_awake');
  static final _holders = <String>{};
  static bool _on = false;

  static bool get on => _on;

  /// Whether [by] holds the screen on now.
  @visibleForTesting
  static bool heldBy(String by) => _holders.contains(by);

  static Future<void> set(bool on, {String by = 'call'}) async {
    if (on) {
      _holders.add(by);
    } else {
      _holders.remove(by);
    }
    final want = _holders.isNotEmpty;
    if (_on == want) return;
    _on = want;
    if (kIsWeb ||
        (defaultTargetPlatform != TargetPlatform.iOS &&
            defaultTargetPlatform != TargetPlatform.android)) {
      return;
    }
    try {
      await _channel.invokeMethod<void>('set', {'on': want});
    } on MissingPluginException {
      // A build without the native side.
    } catch (e) {
      debugPrint('screen awake: $e');
    }
  }
}
