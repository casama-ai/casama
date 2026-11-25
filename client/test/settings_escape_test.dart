import 'package:casama/app.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/router.dart' show routerProvider;
import 'package:casama/features/settings/model_keys_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';

void main() {
  Future<ProviderContainer> open(WidgetTester tester, String path) async {
    await setSize(tester, const Size(1600, 1000));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [backendProvider.overrideWithValue(FakeBackend())],
        child: const CasamaApp(),
      ),
    );
    await tester.pumpAndSettle();
    final container = ProviderScope.containerOf(
      tester.element(find.byType(CasamaApp)),
    );
    container.read(routerProvider).go(path);
    await tester.pumpAndSettle();
    return container;
  }

  String where(ProviderContainer c) =>
      c.read(routerProvider).routerDelegate.currentConfiguration.uri.path;

  testWidgets('Esc on a settings page goes back to the settings list (F2)', (
    tester,
  ) async {
    final c = await open(tester, '/settings/keys');
    expect(find.byType(ModelKeysScreen), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(where(c), '/settings');
    expect(find.byType(ModelKeysScreen), findsNothing);
  });

  testWidgets('Esc in a text field on a settings page stays on the page (F2)', (
    tester,
  ) async {
    final c = await open(tester, '/settings/keys');
    final field = find.byType(EditableText).first;
    await tester.ensureVisible(field);
    await tester.tap(field);
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(where(c), '/settings/keys');
  });

  testWidgets('Esc with a dialog open closes the dialog, not the page (F2)', (
    tester,
  ) async {
    final c = await open(tester, '/settings/keys');
    showDialog<void>(
      context: tester.element(find.byType(ModelKeysScreen)),
      builder: (_) => const AlertDialog(content: Text('a dialog')),
    );
    await tester.pumpAndSettle();
    expect(find.text('a dialog'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(find.text('a dialog'), findsNothing);
    expect(where(c), '/settings/keys');
  });
}
