import 'dart:async';

import 'package:casama/features/computer/computer_screen.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// Lists files only when [answer] is set; otherwise the list never comes (a computer that
/// doesn't answer).
class _FilesBackend extends FakeBackend {
  var asked = 0;
  List<ComputerFileEntry>? answer;

  @override
  Future<List<ComputerFileEntry>> listFiles(String computerId, String path) {
    asked++;
    final a = answer;
    return a == null
        ? Completer<List<ComputerFileEntry>>().future
        : Future.value(a);
  }
}

void main() {
  testWidgets('asleep, Files asks nothing and offers Wake up (E6)', (
    tester,
  ) async {
    await setSize(tester, const Size(700, 900));
    final backend = _FilesBackend();
    var woke = 0;
    await tester.pumpWidget(
      harness(
        backend,
        Scaffold(
          body: FilesTab(computerId: 'c1', asleep: true, onWake: () => woke++),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('filesAsleep')), findsOneWidget);
    expect(find.text('The computer is asleep'), findsOneWidget);
    expect(backend.asked, 0);
    await tester.tap(find.byKey(const Key('filesWake')));
    expect(woke, 1);
  });

  testWidgets('once the computer wakes, Files lists the folder (E6)', (
    tester,
  ) async {
    await setSize(tester, const Size(700, 900));
    final backend = _FilesBackend()..answer = const [];
    Widget tab({required bool asleep, bool waking = false}) => harness(
      backend,
      Scaffold(
        body: FilesTab(computerId: 'c1', asleep: asleep, waking: waking),
      ),
    );
    await tester.pumpWidget(tab(asleep: false, waking: true));
    await tester.pumpAndSettle();
    expect(find.text('Starting'), findsOneWidget);
    expect(backend.asked, 0);
    await tester.pumpWidget(tab(asleep: false));
    await tester.pumpAndSettle();
    expect(backend.asked, 1);
    expect(find.byKey(const Key('filesAsleep')), findsNothing);
  });

  testWidgets(
    'awake, a list that never comes stops after 15 s with Try Again (E6)',
    (tester) async {
      await setSize(tester, const Size(700, 900));
      final backend = _FilesBackend();
      await tester.pumpWidget(
        harness(backend, const Scaffold(body: FilesTab(computerId: 'c1'))),
      );
      await tester.pump();
      expect(find.byKey(const Key('filesError')), findsNothing);
      await tester.pump(const Duration(seconds: 16));
      await tester.pump();
      expect(find.byKey(const Key('filesError')), findsOneWidget);
      expect(find.textContaining('took too long'), findsOneWidget);
      backend.answer = const [];
      await tester.tap(find.byKey(const Key('filesRetry')));
      await tester.pumpAndSettle();
      expect(backend.asked, 2);
      expect(find.byKey(const Key('filesError')), findsNothing);
    },
  );
}
