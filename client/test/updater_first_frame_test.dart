import 'dart:async';

import 'package:casama/core/updater.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the updater starts only after its gate (first frame), so its prompt never beats the window', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    final oldGate = updaterGate;
    final oldStart = updaterStart;
    addTearDown(() {
      updaterGate = oldGate;
      updaterStart = oldStart;
    });
    final gate = Completer<void>();
    var started = 0;
    final oldPause = updaterPause;
    addTearDown(() => updaterPause = oldPause);
    updaterPause = Duration.zero;
    updaterGate = () => gate.future;
    updaterStart = () async => started++;

    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(updaterProvider);
    await Future<void>.delayed(Duration.zero);
    expect(started, 0, reason: 'nothing starts before the first frame');

    gate.complete();
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);
    expect(started, 1);
  });

  test('closing during the pause after the first frame starts nothing and leaves no timer', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    final oldGate = updaterGate, oldStart = updaterStart, oldPause = updaterPause;
    addTearDown(() {
      updaterGate = oldGate;
      updaterStart = oldStart;
      updaterPause = oldPause;
    });
    var started = 0;
    updaterGate = () async {};
    updaterStart = () async => started++;
    updaterPause = const Duration(milliseconds: 50);
    final container = ProviderContainer();
    container.read(updaterProvider);
    await Future<void>.delayed(Duration.zero);
    container.dispose();
    await Future<void>.delayed(const Duration(milliseconds: 80));
    expect(started, 0);
  });
}
