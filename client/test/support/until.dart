import 'package:flutter_test/flutter_test.dart';

/// Waits in real time until [done] holds, and fails the test after [timeout].
///
/// For code on real timers that a fixed sleep would race: `suite app` runs four shards side by
/// side with other sessions' suites, so a 100 ms sleep can come back before a 20 ms timer fires.
/// Wait for the outcome instead; [timeout] is only the give-up point, not the expected time.
Future<void> until(
  bool Function() done, {
  Duration timeout = const Duration(seconds: 10),
  String? reason,
}) async {
  final watch = Stopwatch()..start();
  while (!done()) {
    if (watch.elapsed > timeout) {
      fail('timed out after $timeout waiting for ${reason ?? 'the condition'}');
    }
    await Future<void>.delayed(const Duration(milliseconds: 2));
  }
}
