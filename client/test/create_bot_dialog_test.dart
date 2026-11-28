// The New bot dialog (the customer's build 117 report, N7): Create stays in sight at any window
// height, says why it can't be used yet, a key without a default model gets one from its list, a
// rejected key is marked, and a click outside doesn't throw away what was typed.
import 'package:casama/features/bots/bots_screen.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// One xAI key, which has no default model on the server.
class _XaiBackend extends FakeBackend {
  _XaiBackend({this.lastTestOk});
  final bool? lastTestOk;

  @override
  Future<List<Credential>> credentials(String orgId) async => [
    Credential(
      id: 'xai',
      orgId: orgId,
      provider: ProviderId.xai,
      label: 'Grok',
      baseUrl: null,
      keyHint: '9999',
      lastTestedAt: null,
      lastTestOk: lastTestOk,
      ownerUserId: null,
      status: CredentialStatus.ok,
      account: null,
      fallbackOnLimit: false,
      embeddingModel: null,
      createdAt: DateTime(2026),
    ),
  ];
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  Future<void> open(WidgetTester tester, FakeBackend backend, Size size) async {
    await setSize(tester, size);
    await tester.pumpWidget(
      harness(
        backend,
        Scaffold(
          body: Consumer(
            builder: (context, ref, _) => TextButton(
              onPressed: () => showCreateBot(context, ref),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.byType(CreateBotSheet), findsOneWidget);
  }

  Finder createButton() => find.descendant(
    of: find.byType(CreateBotSheet),
    matching: find.text('Create'),
  );

  for (final size in const [Size(1470, 868), Size(1100, 620)]) {
    testWidgets(
      'Create is in sight without scrolling at ${size.width.toInt()}×${size.height.toInt()}',
      (tester) async {
        await open(tester, FakeBackend(), size);
        final rect = tester.getRect(createButton());
        expect(rect.bottom, lessThanOrEqualTo(size.height));
        expect(rect.top, greaterThanOrEqualTo(0));
        // Nothing covers it: a tap at its centre lands on the button.
      final hit = tester.hitTestOnBinding(rect.center);
      final target = tester.renderObject(createButton());
      expect(hit.path.any((e) => e.target == target), isTrue);
      },
    );
  }

  testWidgets('a click outside with something typed asks before closing', (
    tester,
  ) async {
    await open(tester, FakeBackend(), const Size(1470, 868));
    await tester.enterText(find.widgetWithText(TextField, 'Bot name'), 'Scout');
    await tester.pumpAndSettle();

    // Just below the dialog, on the barrier.
    await tester.tapAt(const Offset(10, 860));
    await tester.pumpAndSettle();
    expect(find.text('Discard This Bot?'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.byType(CreateBotSheet), findsOneWidget);
    expect(find.text('Scout'), findsWidgets);

    await tester.tapAt(const Offset(10, 860));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('createBotDiscard')));
    await tester.pumpAndSettle();
    expect(find.byType(CreateBotSheet), findsNothing);
  });

  testWidgets('a click outside an untouched dialog just closes it', (
    tester,
  ) async {
    await open(tester, FakeBackend(), const Size(1470, 868));
    await tester.tapAt(const Offset(10, 860));
    await tester.pumpAndSettle();
    expect(find.byType(CreateBotSheet), findsNothing);
  });

  testWidgets(
    'a key with no default model gets the first recommended one, so Create works',
    (tester) async {
      await open(tester, _XaiBackend(lastTestOk: true), const Size(1470, 868));
      expect(find.text('DeepSeek: DeepSeek V4.1 Flash 1017'), findsOneWidget);
      expect(find.byKey(const Key('createBotMissing')), findsNothing);
      final button = tester.widget<ButtonStyleButton>(
        find
            .ancestor(
              of: createButton(),
              matching: find.bySubtype<ButtonStyleButton>(),
            )
            .first,
      );
      expect(button.onPressed, isNotNull);
    },
  );

  testWidgets(
    'a rejected key is marked, its models are not picked, and Create says why',
    (tester) async {
      await open(tester, _XaiBackend(lastTestOk: false), const Size(1470, 868));
      expect(find.byKey(const Key('createBotMissing')), findsOneWidget);
      expect(
        find.textContaining('The provider rejected this key'),
        findsWidgets,
      );
      final button = tester.widget<ButtonStyleButton>(
        find
            .ancestor(
              of: createButton(),
              matching: find.bySubtype<ButtonStyleButton>(),
            )
            .first,
      );
      expect(button.onPressed, isNull);
      // The model list shows the reason and its rows can't be picked.
      await tester.ensureVisible(find.byKey(const Key('modelPicker')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('modelPicker')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('modelKeyRejected')), findsOneWidget);
      final row = tester.widget<ListTile>(
        find.byKey(const Key('model-meta/muse-ember')),
      );
      expect(row.enabled, isFalse);
    },
  );
}
