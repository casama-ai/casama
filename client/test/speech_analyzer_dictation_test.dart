import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:casama/core/device_dictation.dart';

// On-device SpeechAnalyzer dictation (APPLE-INTEGRATIONS-PLAN §7.2) against a scripted native side.
const _channel = MethodChannel('casama/speech_analyzer');
const _codec = StandardMethodCodec();

class _Fallback implements DeviceDictation {
  var started = false;

  @override
  bool get supported => true;

  @override
  Future<bool> start({
    required void Function(String words) onWords,
    required void Function(DeviceDictationEnd end) onEnd,
  }) async {
    started = true;
    return true;
  }

  @override
  Future<void> stop() async {}

  @override
  Future<void> cancel() async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  late List<String> calls;
  late Future<bool> Function() startAnswer;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    calls = [];
    startAnswer = () async => true;
    messenger.setMockMethodCallHandler(_channel, (call) async {
      calls.add(call.method);
      switch (call.method) {
        case 'isSupported':
          return true;
        case 'start':
          return startAnswer();
      }
      return null;
    });
  });

  tearDown(() async {
    debugDefaultTargetPlatformOverride = null;
    messenger.setMockMethodCallHandler(_channel, null);
    // A message sent while no handler was set waits in the channel's buffer: take it now, so the
    // next test's handler doesn't get it.
    _channel.setMethodCallHandler((_) async => null);
    await pumpEventQueue();
    _channel.setMethodCallHandler(null);
  });

  /// Sends what the native side sends; answers whether a Dart handler was there to take it (a
  /// message with none waits in the channel buffer, unanswered).
  Future<bool> fromNative(String method, Map<String, Object?> args) async {
    ByteData? answer;
    await messenger.handlePlatformMessage(
      _channel.name,
      _codec.encodeMethodCall(MethodCall(method, args)),
      (data) => answer = data,
    );
    return answer != null;
  }

  test('passes on the running transcript, then ends once and lets go of the channel', () async {
    final dictation = SpeechAnalyzerDictation(fallback: _Fallback());
    final heard = <String>[];
    final ends = <DeviceDictationEnd>[];

    expect(await dictation.start(onWords: heard.add, onEnd: ends.add), isTrue);
    await fromNative('onWords', {'words': 'hello', 'final': false});
    await fromNative('onWords', {'words': 'hello wor', 'final': false});
    await fromNative('onWords', {'words': ' hello world ', 'final': true});
    await fromNative('onWords', {'words': '   ', 'final': true});
    expect(heard, ['hello', 'hello wor', 'hello world']);

    await dictation.stop();
    expect(calls, ['isSupported', 'start', 'stop']);
    // Stopping waits for native's onEnd, which settles the last words first.
    expect(ends, isEmpty);
    await fromNative('onWords', {'words': 'hello world.', 'final': true});
    expect(await fromNative('onEnd', {'reason': 'done'}), isTrue);
    expect(heard.last, 'hello world.');
    expect(ends, [DeviceDictationEnd.done]);

    // Over: the handler is off the channel and nothing more arrives.
    expect(await fromNative('onEnd', {'reason': 'failed'}), isFalse);
    expect(ends, [DeviceDictationEnd.done]);
  });

  test(
    'a cancel after stop still reaches native, and its late onEnd is dropped',
    () async {
      final dictation = SpeechAnalyzerDictation(fallback: _Fallback());
      final ends = <DeviceDictationEnd>[];
      expect(await dictation.start(onWords: (_) {}, onEnd: ends.add), isTrue);

      await dictation.stop();
      await dictation.cancel();
      expect(calls, ['isSupported', 'start', 'stop', 'cancel']);
      expect(await fromNative('onEnd', {'reason': 'done'}), isFalse);
      expect(ends, isEmpty);
    },
  );

  test('cancelled while starting: no fallback, start answers false', () async {
    final answer = Completer<bool>();
    startAnswer = () => answer.future;
    final fallback = _Fallback();
    final dictation = SpeechAnalyzerDictation(fallback: fallback);

    final starting = dictation.start(onWords: (_) {}, onEnd: (_) {});
    await pumpEventQueue();
    await dictation.cancel();
    expect(calls, ['isSupported', 'start', 'cancel']);
    // Native answers the start it dropped with false.
    answer.complete(false);
    expect(await starting, isFalse);
    expect(fallback.started, isFalse);
    expect(await fromNative('onWords', {'words': 'late'}), isFalse);
  });

  test(
    'a native start that fails falls back and leaves the channel alone',
    () async {
      startAnswer = () async => false;
      final fallback = _Fallback();
      final dictation = SpeechAnalyzerDictation(fallback: fallback);

      expect(await dictation.start(onWords: (_) {}, onEnd: (_) {}), isTrue);
      expect(fallback.started, isTrue);
      expect(await fromNative('onWords', {'words': 'stray'}), isFalse);
    },
  );

  test('dispose cancels a running session and clears the handler', () async {
    final dictation = SpeechAnalyzerDictation(fallback: _Fallback());
    expect(await dictation.start(onWords: (_) {}, onEnd: (_) {}), isTrue);

    dictation.dispose();
    await pumpEventQueue();
    expect(calls.last, 'cancel');
    expect(await fromNative('onEnd', {'reason': 'done'}), isFalse);
  });
}
