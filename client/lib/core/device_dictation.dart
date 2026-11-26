import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// How a session of the device's own dictation ended.
enum DeviceDictationEnd {
  /// It stopped (the person tapped stop, or paused long enough) after hearing something.
  done,

  /// It stopped without hearing any words.
  nothingHeard,

  /// The recognizer failed (no service, no network for it, language not supported).
  failed,
}

/// The device's own speech recognition: Speech on iOS and macOS, the system recognizer on
/// Android, Web Speech in the browser. Free, and words show up while the person speaks.
///
/// Dictation goes to the server first (Whisper copes with mixed languages, like Taglish); this
/// is the fallback when that service fails or the workspace has none.
abstract class DeviceDictation {
  /// Whether this platform has a recognizer worth trying (no prompt, no plugin call).
  bool get supported;

  /// Starts listening. Asks for speech permission the first time. False when the recognizer
  /// can't start (denied, missing), so the caller can go back to the server.
  ///
  /// [onWords] gets everything heard so far, each time it changes. [onEnd] runs once.
  Future<bool> start({
    required void Function(String words) onWords,
    required void Function(DeviceDictationEnd end) onEnd,
  });

  /// Stops and keeps what was heard ([onEnd] follows).
  Future<void> stop();

  /// Stops and drops the session (no [onEnd]).
  Future<void> cancel();
}

class SpeechToTextDictation implements DeviceDictation {
  final _stt = SpeechToText();
  var _ready = false;
  void Function(String words)? _onWords;
  void Function(DeviceDictationEnd end)? _onEnd;
  var _heard = false;

  @override
  bool get supported =>
      kIsWeb ||
      const {
        TargetPlatform.android,
        TargetPlatform.iOS,
        TargetPlatform.macOS,
      }.contains(defaultTargetPlatform);

  Future<bool> _init() async {
    if (_ready) return true;
    try {
      _ready = await _stt.initialize(onError: _error, onStatus: _status);
    } catch (e) {
      debugPrint('device dictation unavailable: $e');
      _ready = false;
    }
    return _ready;
  }

  @override
  Future<bool> start({
    required void Function(String words) onWords,
    required void Function(DeviceDictationEnd end) onEnd,
  }) async {
    if (!supported || !await _init()) return false;
    _onWords = onWords;
    _onEnd = onEnd;
    _heard = false;
    try {
      await _stt.listen(
        onResult: (r) {
          final words = r.recognizedWords.trim();
          if (words.isNotEmpty) {
            _heard = true;
            _onWords?.call(words);
          }
          if (r.finalResult) {
            _finish(_heard ? DeviceDictationEnd.done : DeviceDictationEnd.nothingHeard);
          }
        },
        listenOptions: SpeechListenOptions(
          listenMode: ListenMode.dictation,
          partialResults: true,
          cancelOnError: true,
          autoPunctuation: true,
          // Long enough to think mid-sentence; iOS caps a session at about a minute anyway.
          pauseFor: const Duration(seconds: 5),
          listenFor: const Duration(minutes: 1),
        ),
      );
      return true;
    } catch (e) {
      debugPrint('device dictation failed to start: $e');
      _onWords = null;
      _onEnd = null;
      return false;
    }
  }

  void _status(String status) {
    if (status == SpeechToText.doneStatus) {
      _finish(_heard ? DeviceDictationEnd.done : DeviceDictationEnd.nothingHeard);
    }
  }

  void _error(dynamic e) {
    final msg = '${e.errorMsg}';
    if (e.permanent != true) return;
    debugPrint('device dictation error: $msg');
    // Silence is not a failure of the recognizer, only of this attempt.
    final quiet = msg == 'error_no_match' || msg == 'error_speech_timeout';
    _finish(
      quiet
          ? (_heard ? DeviceDictationEnd.done : DeviceDictationEnd.nothingHeard)
          : DeviceDictationEnd.failed,
    );
  }

  void _finish(DeviceDictationEnd end) {
    final cb = _onEnd;
    _onEnd = null;
    _onWords = null;
    cb?.call(end);
  }

  @override
  Future<void> stop() => _stt.stop();

  @override
  Future<void> cancel() async {
    _onEnd = null;
    _onWords = null;
    await _stt.cancel();
  }
}

/// On-device SpeechAnalyzer dictation on iOS 26+ and macOS 26+ (docs/APPLE-INTEGRATIONS-PLAN.md §7.2),
/// falling back to [SpeechToTextDictation] on older OS versions and other platforms.
class SpeechAnalyzerDictation implements DeviceDictation {
  SpeechAnalyzerDictation({
    MethodChannel? channel,
    DeviceDictation? fallback,
  })  : _channel = channel ?? const MethodChannel('casama/speech_analyzer'),
        _fallback = fallback ?? SpeechToTextDictation();

  final MethodChannel _channel;
  final DeviceDictation _fallback;
  bool _usingNative = false;
  void Function(String words)? _onWords;
  void Function(DeviceDictationEnd end)? _onEnd;

  bool get _isApple =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS);

  @override
  bool get supported => _isApple || _fallback.supported;

  Future<bool> _nativeSupported() async {
    if (!_isApple) return false;
    try {
      return await _channel.invokeMethod<bool>('isSupported') ?? false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> start({
    required void Function(String words) onWords,
    required void Function(DeviceDictationEnd end) onEnd,
  }) async {
    if (await _nativeSupported()) {
      _onWords = onWords;
      _onEnd = onEnd;
      _channel.setMethodCallHandler(_handleNative);
      try {
        final started = await _channel.invokeMethod<bool>('start') ?? false;
        if (started) {
          _usingNative = true;
          return true;
        }
      } catch (e) {
        debugPrint('SpeechAnalyzer unavailable, falling back: $e');
      }
      _channel.setMethodCallHandler(null);
      _onWords = null;
      _onEnd = null;
    }
    _usingNative = false;
    return _fallback.start(onWords: onWords, onEnd: onEnd);
  }

  Future<void> _handleNative(MethodCall call) async {
    final args = call.arguments is Map ? call.arguments as Map : const {};
    switch (call.method) {
      case 'onWords':
        final words = (args['words'] as String?)?.trim() ?? '';
        if (words.isNotEmpty) _onWords?.call(words);
      case 'onEnd':
        final reason = args['reason'] as String?;
        final end = switch (reason) {
          'done' => DeviceDictationEnd.done,
          'nothingHeard' => DeviceDictationEnd.nothingHeard,
          _ => DeviceDictationEnd.failed,
        };
        final cb = _onEnd;
        _onEnd = null;
        _onWords = null;
        _usingNative = false;
        cb?.call(end);
    }
  }

  @override
  Future<void> stop() async {
    if (_usingNative) {
      await _channel.invokeMethod<void>('stop').catchError((_) {});
      _usingNative = false;
    } else {
      await _fallback.stop();
    }
  }

  @override
  Future<void> cancel() async {
    if (_usingNative) {
      _onWords = null;
      _onEnd = null;
      _usingNative = false;
      await _channel.invokeMethod<void>('cancel').catchError((_) {});
    } else {
      await _fallback.cancel();
    }
  }
}

final deviceDictationProvider = Provider<DeviceDictation>(
  (ref) => SpeechAnalyzerDictation(),
);

/// Which dictation the mic uses next. The server first; after it fails, the device's own for a
/// while, then the server again, so one bad moment doesn't stick for the rest of the day.
class DictationRoute {
  DictationRoute({DateTime Function()? now}) : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  DateTime? _deviceUntil;

  /// How long the device stays first after the server fails.
  static const fallbackFor = Duration(minutes: 30);

  bool get preferDevice {
    final until = _deviceUntil;
    return until != null && _now().isBefore(until);
  }

  /// The server failed (or has no service): use the device for [fallbackFor], or for the rest
  /// of this run when [forSession].
  void useDevice({bool forSession = false}) =>
      _deviceUntil = forSession ? DateTime(9999) : _now().add(fallbackFor);

  /// The device's recognizer failed or isn't there: back to the server.
  void useServer() => _deviceUntil = null;
}

final dictationRouteProvider = Provider<DictationRoute>(
  (ref) => DictationRoute(),
);
