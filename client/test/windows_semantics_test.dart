// The Windows app keeps its accessibility tree on for UI Automation (D-616): the customer's
// build 108 round saw only "FLUTTERVIEW" in Inspect.
import 'package:casama/core/windows_semantics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('on Windows the tree is on while the handle is held', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    final handle = keepWindowsSemanticsOn();
    expect(handle, isNotNull);
    expect(tester.binding.semanticsEnabled, isTrue);
    handle!.dispose();
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('elsewhere the platform asks for it itself', (tester) async {
    for (final p in [
      TargetPlatform.macOS,
      TargetPlatform.linux,
      TargetPlatform.android,
    ]) {
      debugDefaultTargetPlatformOverride = p;
      expect(keepWindowsSemanticsOn(), isNull);
    }
    debugDefaultTargetPlatformOverride = null;
  });
}
