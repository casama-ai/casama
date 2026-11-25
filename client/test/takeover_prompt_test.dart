// Take over or share your login, on one card (docs/TAKEOVER-SIGN-IN-PLAN.md).
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/chat/widgets/chat_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

const takeoverId = '66666666-6666-4666-8666-666666666666';

TakeoverEntry entryFor({
  String? loginHost = 'etravel.gov.ph',
  String? id = takeoverId,
}) => TakeoverEntry(
  computerId: computerId,
  reason: 'eTravel PH needs your sign-in.',
  takeoverId: id,
  loginHost: loginHost,
);

Widget card(
  FakeBackend backend,
  TakeoverEntry entry, {
  String botName = 'Max',
  VoidCallback? onOpen,
}) => harness(
  backend,
  Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: TakeoverPrompt(
        entry: entry,
        botName: botName,
        onOpen: onOpen ?? () {},
      ),
    ),
  ),
);

void main() {
  testWidgets('only Take Control when the bot did not offer a login', (
    tester,
  ) async {
    await tester.pumpWidget(card(FakeBackend(), entryFor(loginHost: null)));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('chatTakeControl')), findsOneWidget);
    expect(find.byKey(const Key('chatShareLogin')), findsNothing);
  });

  testWidgets('Not Now declines the request and folds the card', (
    tester,
  ) async {
    final backend = FakeBackend();
    await tester.pumpWidget(card(backend, entryFor()));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('chatTakeoverNotNow')));
    await tester.pumpAndSettle();
    expect(backend.dismissed, [takeoverId]);
    expect(find.byKey(const Key('chatTakeControl')), findsNothing);
    expect(find.textContaining('eTravel PH needs your sign-in.'), findsOneWidget);
  });

  testWidgets('an old request without its id offers only Take Control', (
    tester,
  ) async {
    await tester.pumpWidget(card(FakeBackend(), entryFor(id: null)));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('chatShareLogin')), findsNothing);
    expect(find.byKey(const Key('chatTakeoverNotNow')), findsNothing);
  });

  testWidgets(
    'Share Login opens the form in the card, goes back, and sends the login once',
    (tester) async {
      final backend = FakeBackend();
      var opened = 0;
      await tester.pumpWidget(
        card(backend, entryFor(), onOpen: () => opened++),
      );
      await tester.pumpAndSettle();
      expect(find.text('Take Control'), findsOneWidget);
      expect(find.text('Share Login'), findsOneWidget);

      await tester.tap(find.byKey(const Key('chatShareLogin')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('takeoverLoginUsername')), findsOneWidget);
      expect(
        find.textContaining(
          'Only used on etravel.gov.ph. Max never sees your password.',
        ),
        findsOneWidget,
      );
      // Back returns to the two choices.
      await tester.tap(find.byKey(const Key('takeoverLoginBack')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('chatTakeControl')), findsOneWidget);
      await tester.tap(find.byKey(const Key('chatTakeControl')));
      expect(opened, 1);

      await tester.tap(find.byKey(const Key('chatShareLogin')));
      await tester.pumpAndSettle();
      final save = find.byKey(const Key('takeoverLoginSave'));
      // Nothing to send until both fields are filled.
      expect(tester.widget<FilledButton>(save).onPressed, isNull);
      await tester.enterText(
        find.byKey(const Key('takeoverLoginUsername')),
        'oliver@example.com',
      );
      await tester.enterText(
        find.byKey(const Key('takeoverLoginPassword')),
        'pw-123',
      );
      await tester.pump();
      // The password field is masked and learns nothing.
      final field = tester.widget<TextField>(
        find.byKey(const Key('takeoverLoginPassword')),
      );
      expect(field.obscureText, isTrue);
      expect(field.enableSuggestions, isFalse);
      expect(field.enableIMEPersonalizedLearning, isFalse);
      // Remember starts ticked; untick it.
      await tester.tap(find.byKey(const Key('takeoverLoginRemember')));
      await tester.pump();
      await tester.tap(save);
      await tester.pumpAndSettle();

      expect(backend.sharedLogins, [(takeoverId, 'oliver@example.com', false)]);
      expect(find.text('Shared your login for etravel.gov.ph'), findsOneWidget);
      expect(find.byKey(const Key('takeoverLoginPassword')), findsNothing);
      expect(find.text('pw-123'), findsNothing);
    },
  );

  testWidgets('a refused login keeps the form open and clears the password', (
    tester,
  ) async {
    final backend = FakeBackend()
      ..shareLoginError = Exception(
        'A secret named ETRAVEL_GOV_PH_PASSWORD already exists.',
      );
    await tester.pumpWidget(card(backend, entryFor()));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('chatShareLogin')));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('takeoverLoginUsername')),
      'oliver@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('takeoverLoginPassword')),
      'pw-123',
    );
    await tester.pump();
    await tester.tap(find.byKey(const Key('takeoverLoginSave')));
    await tester.pumpAndSettle();
    expect(backend.sharedLogins, isEmpty);
    expect(find.byKey(const Key('takeoverLoginPassword')), findsOneWidget);
    final field = tester.widget<TextField>(
      find.byKey(const Key('takeoverLoginPassword')),
    );
    expect(field.controller?.text, isEmpty);
  });

  testWidgets(
    'no overflow on a small phone with a long bot name and large text',
    (tester) async {
      await setSize(tester, const Size(320, 700));
      tester.platformDispatcher.textScaleFactorTestValue = 1.3;
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await tester.pumpWidget(
        card(
          FakeBackend(),
          entryFor(),
          botName: 'Maximilian the Very Helpful Travel Assistant',
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byKey(const Key('chatShareLogin')), findsOneWidget);
      await tester.tap(find.byKey(const Key('chatShareLogin')));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'the chat card gets the login site from run events and folds when it was shared',
    (tester) async {
      await setSize(tester, const Size(500, 900));
      final backend = FakeBackend();
      await tester.pumpWidget(
        harness(
          backend,
          const ChatScreen(botId: botId, conversationId: convId),
        ),
      );
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('messageInput')),
        'fill in my eTravel entry',
      );
      await tester.pump();
      await tester.tap(find.byKey(const Key('sendButton')));
      await tester.pump();
      backend.runEventsController.add(
        ev(1, 'takeover.requested', {
          'computer_id': computerId,
          'reason': 'eTravel PH needs your sign-in.',
          'takeover_id': takeoverId,
          'login_host': 'etravel.gov.ph',
        }),
      );
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byKey(const Key('chatShareLogin')), findsOneWidget);
      backend.runEventsController.add(
        ev(2, 'takeover.resolved', {
          'computer_id': computerId,
          'outcome': 'completed',
          'note': null,
          'login_host': 'etravel.gov.ph',
        }),
      );
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('Shared your login for etravel.gov.ph'), findsOneWidget);
      expect(find.byKey(const Key('chatShareLogin')), findsNothing);
    },
  );
}
