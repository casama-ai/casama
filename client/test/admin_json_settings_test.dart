import 'package:casama/features/admin/remote_settings_cards.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness;
import 'fake_backend.dart';

void main() {
  testWidgets(
    'the owner edits a JSON setting; bad JSON is refused before saving',
    (tester) async {
      final backend = FakeBackend();
      await tester.pumpWidget(
        harness(
          backend,
          const Scaffold(
            body: AdminJsonSettingTile(kind: AdminJsonSettingKind.modelCatalog),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('adminJson-modelCatalog')));
      await tester.pumpAndSettle();

      final field = find.byKey(const Key('adminJsonField-modelCatalog'));
      await tester.enterText(field, '{not json');
      await tester.tap(find.byKey(const Key('adminJsonSave-modelCatalog')));
      await tester.pumpAndSettle();
      expect(backend.adminJsonSettings, isEmpty);
      expect(find.textContaining("isn't valid JSON"), findsOneWidget);

      await tester.enterText(
        field,
        '{"default_models": {"openrouter": "acme/model-1"}}',
      );
      // Valid again: Save turns back on.
      await tester.pump();
      await tester.tap(find.byKey(const Key('adminJsonSave-modelCatalog')));
      await tester.pumpAndSettle();
      expect(backend.adminJsonSettings[AdminJsonSettingKind.modelCatalog], {
        'default_models': {'openrouter': 'acme/model-1'},
      });
      expect(field, findsNothing);
    },
  );

  testWidgets(
    'the JSON editor: Save turns off on bad JSON, and Format pretty-prints',
    (tester) async {
      final backend = FakeBackend();
      await tester.pumpWidget(
        harness(
          backend,
          const Scaffold(
            body: AdminJsonSettingTile(kind: AdminJsonSettingKind.callLimits),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('adminJson-callLimits')));
      await tester.pumpAndSettle();

      final field = find.byKey(const Key('adminJsonField-callLimits'));
      final save = find.byKey(const Key('adminJsonSave-callLimits'));
      bool saveOn() => tester.widget<FilledButton>(save).onPressed != null;
      expect(saveOn(), isTrue);

      // Monospace text.
      final style = tester.widget<TextField>(field).style;
      expect(style?.fontFamily, 'monospace');

      await tester.enterText(field, '{"max_minutes": 5,');
      // The error waits for a pause in typing.
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.textContaining("isn't valid JSON"), findsNothing);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.textContaining("isn't valid JSON"), findsOneWidget);
      expect(find.textContaining('line 1'), findsOneWidget);
      expect(saveOn(), isFalse);

      // Fixing it turns Save back on at once.
      await tester.enterText(field, '{"max_minutes":5,"ring":{"seconds":30}}');
      await tester.pump();
      expect(find.textContaining("isn't valid JSON"), findsNothing);
      expect(saveOn(), isTrue);

      await tester.tap(find.byKey(const Key('adminJsonField-callLimits-format')));
      await tester.pump();
      expect(
        tester.widget<TextField>(field).controller!.text,
        '{\n  "max_minutes": 5,\n  "ring": {\n    "seconds": 30\n  }\n}',
      );

      // A valid JSON value that isn't an object is refused too.
      await tester.enterText(field, '[1, 2]');
      await tester.pump(const Duration(milliseconds: 600));
      expect(find.text('This needs to be one JSON object, in curly brackets.'), findsOneWidget);
      expect(saveOn(), isFalse);
      expect(backend.adminJsonSettings, isEmpty);
    },
  );
}
