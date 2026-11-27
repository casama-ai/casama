import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The 17 semantic haptics in Casama's vocabulary (docs/HAPTICS-PLAN.md §4).
enum HapticKind {
  tap,
  press,
  select,
  toggleOn,
  toggleOff,
  threshold,
  thresholdBack,
  lift,
  drop,
  snap,
  confirm,
  reject,
  warn,
  destroy,
  // Casama's four signature patterns
  attention,
  arrive,
  done,
  celebrate;

  bool get isSignature => switch (this) {
    HapticKind.attention ||
    HapticKind.arrive ||
    HapticKind.done ||
    HapticKind.celebrate => true,
    _ => false,
  };

  String get wireName => name;
}

/// Tuning parameters for the four signature patterns in the Haptics Lab (§7.5).
@immutable
class HapticSignatureTuning {
  const HapticSignatureTuning({
    this.attentionIntensity = 0.8,
    this.attentionGapMs = 90,
    this.arriveIntensity = 0.7,
    this.arriveSharpness = 0.25,
    this.doneFirstIntensity = 0.5,
    this.doneSecondIntensity = 1.0,
    this.doneGapMs = 60,
    this.celebrateIntensity = 0.9,
    this.celebrateGapMs = 55,
  });

  final double attentionIntensity;
  final int attentionGapMs;
  final double arriveIntensity;
  final double arriveSharpness;
  final double doneFirstIntensity;
  final double doneSecondIntensity;
  final int doneGapMs;
  final double celebrateIntensity;
  final int celebrateGapMs;

  static const defaults = HapticSignatureTuning();

  HapticSignatureTuning copyWith({
    double? attentionIntensity,
    int? attentionGapMs,
    double? arriveIntensity,
    double? arriveSharpness,
    double? doneFirstIntensity,
    double? doneSecondIntensity,
    int? doneGapMs,
    double? celebrateIntensity,
    int? celebrateGapMs,
  }) => HapticSignatureTuning(
    attentionIntensity: attentionIntensity ?? this.attentionIntensity,
    attentionGapMs: attentionGapMs ?? this.attentionGapMs,
    arriveIntensity: arriveIntensity ?? this.arriveIntensity,
    arriveSharpness: arriveSharpness ?? this.arriveSharpness,
    doneFirstIntensity: doneFirstIntensity ?? this.doneFirstIntensity,
    doneSecondIntensity: doneSecondIntensity ?? this.doneSecondIntensity,
    doneGapMs: doneGapMs ?? this.doneGapMs,
    celebrateIntensity: celebrateIntensity ?? this.celebrateIntensity,
    celebrateGapMs: celebrateGapMs ?? this.celebrateGapMs,
  );

  Map<String, Object> toMap() => {
    'attentionIntensity': attentionIntensity,
    'attentionGapMs': attentionGapMs,
    'arriveIntensity': arriveIntensity,
    'arriveSharpness': arriveSharpness,
    'doneFirstIntensity': doneFirstIntensity,
    'doneSecondIntensity': doneSecondIntensity,
    'doneGapMs': doneGapMs,
    'celebrateIntensity': celebrateIntensity,
    'celebrateGapMs': celebrateGapMs,
  };
}

/// Casama's semantic haptics API (docs/HAPTICS-PLAN.md §4, §7).
///
/// One gate sits in front of every call:
/// 1. Our Haptics switch ([enabled], Settings → Appearance → Haptics).
/// 2. Visibility and foreground check (background drops all haptics; `visible: false` drops
///    event-driven haptics).
/// 3. Throttle: a second haptic of the same kind within 50 ms is dropped, and any haptic within
///    30 ms after a signature is dropped.
abstract final class Haptic {
  static const prefsKey = 'appearance.haptics';
  static const _channel = MethodChannel('casama/haptics');
  static const _macChannel = MethodChannel('casama/mac');

  static bool _enabled = true;

  /// Whether haptics are enabled on this device (Settings → Appearance → Haptics).
  static bool get enabled => _enabled;

  /// Sets the in-memory switch state without playing a haptic or writing preferences (used when
  /// loading saved preferences at startup).
  static void syncEnabled(bool on) {
    _enabled = on;
  }

  /// Reads the saved Haptics switch from [SharedPreferences] before the first frame.
  static Future<bool> preload() async {
    try {
      final p = await SharedPreferences.getInstance();
      _enabled = p.getBool(prefsKey) ?? true;
    } catch (_) {
      _enabled = true;
    }
    return _enabled;
  }

  /// Turns haptics on or off on this device and persists the choice. Turning it on plays one
  /// `toggle(true)` so the person feels what they switched on; turning it off plays nothing (§7.4).
  static Future<void> setEnabled(bool on, {bool playSample = true}) async {
    _enabled = on;
    if (on && playSample) {
      toggle(true);
    }
    try {
      final p = await SharedPreferences.getInstance();
      await p.setBool(prefsKey, on);
    } catch (_) {}
  }

  /// Whether this device has a haptics surface that Settings → Appearance → Haptics controls:
  /// iPhone, Android, and macOS (Force Touch trackpad). Hidden on iPad, web, Windows, and Linux.
  static bool isSupportedIn(BuildContext context) {
    if (kIsWeb) return false;
    return switch (defaultTargetPlatform) {
      TargetPlatform.android || TargetPlatform.macOS => true,
      TargetPlatform.iOS => MediaQuery.sizeOf(context).shortestSide < 600,
      _ => false,
    };
  }

  /// Live signature tuning from the Haptics Lab (§7.5).
  static HapticSignatureTuning tuning = HapticSignatureTuning.defaults;

  /// Resets [tuning] to [HapticSignatureTuning.defaults].
  static void resetTuning() {
    tuning = HapticSignatureTuning.defaults;
  }

  /// Recorded haptics that passed the gate since the last [debugReset].
  @visibleForTesting
  static final List<HapticKind> debugLog = <HapticKind>[];

  /// Optional observer called whenever a haptic passes the gate.
  @visibleForTesting
  static void Function(HapticKind kind)? debugObserver;

  /// Injectable clock for deterministic throttle and timing tests.
  static DateTime Function() debugClock = DateTime.now;

  static final Map<HapticKind, DateTime> _lastPlayedAt =
      <HapticKind, DateTime>{};
  static DateTime? _lastSignatureAt;
  static bool? _canVibrateFallback;

  /// Resets throttle state, switch state, fallback cache, and [debugLog] for tests.
  @visibleForTesting
  static void debugReset({bool enabled = true}) {
    _enabled = enabled;
    _lastPlayedAt.clear();
    _lastSignatureAt = null;
    _canVibrateFallback = null;
    debugLog.clear();
    debugObserver = null;
    debugClock = DateTime.now;
    tuning = HapticSignatureTuning.defaults;
  }

  // --- Vocabulary (§4) ---

  /// You pressed something that does a thing (send, start, copy).
  static Future<void> tap() => _play(HapticKind.tap);

  /// A firm command (stop, restart, end the call).
  static Future<void> press() => _play(HapticKind.press);

  /// You moved between choices (tabs, segments, menus, pickers, chips, reactions, chart points).
  static Future<void> select() => _play(HapticKind.select);

  /// A switch or checkbox changed.
  static Future<void> toggle(bool on) =>
      _play(on ? HapticKind.toggleOn : HapticKind.toggleOff);

  /// A gesture crossed the point where letting go acts (long-press menu, pull to refresh, drag to
  /// dismiss, zoom past fill).
  static Future<void> threshold() => _play(HapticKind.threshold);

  /// You pulled back before letting go.
  static Future<void> thresholdBack() => _play(HapticKind.thresholdBack);

  /// A drag picked something up.
  static Future<void> lift() => _play(HapticKind.lift);

  /// A drag put something down, or the bot hung up a call.
  static Future<void> drop() => _play(HapticKind.drop);

  /// A dragged thing settled into place (bubble to the edge, pane to a width stop, slider stop).
  static Future<void> snap() => _play(HapticKind.snap);

  /// What you asked for worked.
  static Future<void> confirm() => _play(HapticKind.confirm);

  /// It didn't (wrong code, failed).
  static Future<void> reject({bool visible = true}) =>
      _play(HapticKind.reject, visible: visible);

  /// Careful, or fix this first.
  static Future<void> warn() => _play(HapticKind.warn);

  /// You confirmed something you can't undo (delete, remove).
  static Future<void> destroy() => _play(HapticKind.destroy);

  /// Signature: a bot is waiting on you (approval, takeover, a question).
  static Future<void> attention({bool visible = true}) =>
      _play(HapticKind.attention, visible: visible);

  /// Signature: the first words of a reply you waited for.
  static Future<void> arrive({required bool visible}) =>
      _play(HapticKind.arrive, visible: visible);

  /// Signature: a long task finished while you watched.
  static Future<void> done({required bool visible}) =>
      _play(HapticKind.done, visible: visible);

  /// Signature: a rare milestone (first purchase, first bot, welcome done).
  static Future<void> celebrate() => _play(HapticKind.celebrate);

  /// Plays [kind] directly (used by the Haptics Lab).
  static Future<void> playKind(HapticKind kind, {bool bypassThrottle = false}) =>
      _play(kind, bypassThrottle: bypassThrottle);

  /// Prepares the native haptic generator ahead of an imminent gesture (touch down, drag start).
  static void prepare([HapticKind kind = HapticKind.tap]) {
    if (!_enabled || kIsWeb) return;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      unawaited(
        _channel
            .invokeMethod<void>('prepare', {'kind': kind.name})
            .catchError((_) {}),
      );
    }
  }

  static bool get _isAppInFront {
    try {
      final state = WidgetsBinding.instance.lifecycleState;
      // In widget tests lifecycleState is often null (or resumed); only drop when explicitly
      // backgrounded/hidden/paused/detached.
      if (state == null) return true;
      return state == AppLifecycleState.resumed ||
          state == AppLifecycleState.inactive;
    } catch (_) {
      return true;
    }
  }

  static Future<void> _play(
    HapticKind kind, {
    bool visible = true,
    bool bypassThrottle = false,
  }) async {
    if (!_enabled || !visible) return;
    if (!_isAppInFront) return;
    // Event haptics also require full resumed state when lifecycleState is tracked.
    try {
      final state = WidgetsBinding.instance.lifecycleState;
      if (kind.isSignature &&
          state != null &&
          state != AppLifecycleState.resumed) {
        return;
      }
    } catch (_) {}

    final now = debugClock();
    if (!bypassThrottle) {
      // Anything within 30 ms of a signature is dropped (§5.11, §7.1).
      final lastSig = _lastSignatureAt;
      if (lastSig != null &&
          now.difference(lastSig) < const Duration(milliseconds: 30)) {
        return;
      }
      // A second haptic within 50 ms of another of the same kind is dropped (§5.11, §7.1).
      final lastSame = _lastPlayedAt[kind];
      if (lastSame != null &&
          now.difference(lastSame) < const Duration(milliseconds: 50)) {
        return;
      }
    }

    _lastPlayedAt[kind] = now;
    if (kind.isSignature) {
      _lastSignatureAt = now;
    }

    debugLog.add(kind);
    debugObserver?.call(kind);

    if (kIsWeb) return;

    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        await _playMacTrackpad(kind);
      case TargetPlatform.iOS:
      case TargetPlatform.android:
        await _playMobile(kind);
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return;
    }
  }

  static Future<void> _playMacTrackpad(HapticKind kind) async {
    // Only drag-related haptics play on a Mac Force Touch trackpad (§4, §5.8).
    final pattern = switch (kind) {
      HapticKind.threshold => 'levelChange',
      HapticKind.lift => 'generic',
      HapticKind.drop || HapticKind.snap || HapticKind.select => 'alignment',
      _ => null,
    };
    if (pattern == null) return;
    try {
      await _macChannel.invokeMethod<void>('haptic', {'pattern': pattern});
    } catch (_) {}
  }

  static Future<void> _playMobile(HapticKind kind) async {
    try {
      await _channel.invokeMethod<void>('play', {
        'kind': kind.name,
        if (kind.isSignature) ...tuning.toMap(),
      });
      return;
    } on MissingPluginException {
      // Fall back to package:haptic_feedback when the native channel isn't bound (widget tests or
      // older runner binary).
    } catch (_) {
      return;
    }
    await _playFallback(kind);
  }

  static Future<void> _playFallback(HapticKind kind) async {
    try {
      _canVibrateFallback ??= await Haptics.canVibrate();
    } catch (_) {
      _canVibrateFallback = false;
    }
    if (!(_canVibrateFallback ?? false)) return;

    final type = switch (kind) {
      HapticKind.tap || HapticKind.toggleOn => HapticsType.light,
      HapticKind.press || HapticKind.lift => HapticsType.medium,
      HapticKind.select || HapticKind.snap => HapticsType.selection,
      HapticKind.toggleOff ||
      HapticKind.thresholdBack ||
      HapticKind.drop => HapticsType.soft,
      HapticKind.threshold => HapticsType.rigid,
      HapticKind.confirm || HapticKind.done || HapticKind.celebrate =>
        HapticsType.success,
      HapticKind.reject => HapticsType.error,
      HapticKind.warn || HapticKind.attention => HapticsType.warning,
      HapticKind.destroy => HapticsType.heavy,
      HapticKind.arrive => HapticsType.soft,
    };
    try {
      await Haptics.vibrate(type, usage: HapticsUsage.touch);
    } catch (_) {}
  }
}

/// Deprecated aliases kept for one release while call sites settle (docs/HAPTICS-PLAN.md §7.1).
class HapticsHelper {
  HapticsHelper._();

  @visibleForTesting
  static void debugReset() => Haptic.debugReset();

  static Future<void> success() => Haptic.confirm();
  static Future<void> warning() => Haptic.warn();
  static Future<void> error() => Haptic.reject();
  static Future<void> light() => Haptic.tap();
  static Future<void> medium() => Haptic.press();
  static Future<void> heavy() => Haptic.destroy();
  static Future<void> soft() => Haptic.toggle(false);
  static Future<void> selection() => Haptic.select();
}

/// [onChanged] for a switch, checkbox or dropdown that first plays the semantic haptic:
/// [Haptic.toggle] when the value is a [bool], and [Haptic.select] otherwise (§5.5, §7.1).
/// An explicit [haptic] override is called when provided. A null [onChanged] stays null, so a
/// disabled control stays disabled.
ValueChanged<T>? hapticOnChanged<T>(
  ValueChanged<T>? onChanged, {
  FutureOr<void> Function()? haptic,
}) {
  if (onChanged == null) return null;
  return (T value) {
    if (haptic != null) {
      haptic();
    } else if (value is bool) {
      Haptic.toggle(value);
    } else {
      Haptic.select();
    }
    onChanged(value);
  };
}

/// Wraps a [RefreshIndicator]'s `onRefresh` callback so pulling to refresh plays [Haptic.threshold]
/// when the refresh triggers across every screen (§5.3).
Future<void> Function() hapticRefresh(Future<void> Function() onRefresh) {
  return () {
    Haptic.threshold();
    return onRefresh();
  };
}
