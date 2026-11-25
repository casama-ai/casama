import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:casama/features/chat/chat_screen.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// The sign-in card in the in-app browser (D-511): a secret request with `login_host`.
void main() {
  Future<FakeBackend> openChat(WidgetTester tester) async {
    await setSize(tester, const Size(500, 900));
    final backend = FakeBackend();
    await tester.pumpWidget(
      harness(backend, const ChatScreen(botId: botId, conversationId: convId)),
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('messageInput')),
      'sign me in to RevenueCat',
    );
    await tester.pump();
    await tester.tap(find.byKey(const Key('sendButton')));
    await tester.pump();
    backend.runEventsController.add(
      ev(1, 'secret.requested', {
        'request_id': 'lr1',
        'name': 'REVENUECAT_COM_PASSWORD',
        'service': 'revenuecat.com',
        'allowed_hosts': ['revenuecat.com'],
        'reason': 'Sign in to RevenueCat',
        'kind': 'value',
        'expires_at': '2026-11-11T00:00:00Z',
        'login_host': 'revenuecat.com',
      }),
    );
    await tester.pump(const Duration(milliseconds: 100));
    return backend;
  }

  testWidgets('shares a login from the card, never through the chat', (
    tester,
  ) async {
    final backend = await openChat(tester);
    expect(find.byKey(const Key('chatLoginRequest')), findsOneWidget);
    expect(find.byKey(const Key('secretValue')), findsNothing);
    expect(find.textContaining('sign in to revenuecat.com'), findsOneWidget);
    // Not on a device with the page open: no Sign In on Page.
    expect(find.byKey(const Key('loginRequestOnPage')), findsNothing);

    await tester.tap(find.byKey(const Key('loginRequestShare')));
    await tester.pump();
    await tester.enterText(
      find.byKey(const Key('loginRequestUsername')),
      'me@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('loginRequestPassword')),
      'hunter2-pw',
    );
    await tester.pump();
    await tester.tap(find.byKey(const Key('loginRequestSave')));
    await tester.pump(const Duration(milliseconds: 100));
    expect(backend.loginAnswers, [('lr1', 'me@example.com', true)]);
    expect(find.text('Shared your login for revenuecat.com'), findsOneWidget);
    expect(find.text('hunter2-pw'), findsNothing);
    expect(find.byKey(const Key('messageInput')), findsOneWidget);
    expect(
      tester
          .widget<TextField>(find.byKey(const Key('messageInput')))
          .controller
          ?.text,
      isEmpty,
    );
  });

  testWidgets('signing in on the page folds the card', (tester) async {
    final backend = await openChat(tester);
    backend.runEventsController.add(
      ev(2, 'secret.resolved', {
        'request_id': 'lr1',
        'outcome': 'declined',
        'on_page': true,
      }),
    );
    await tester.pump(const Duration(milliseconds: 100));
    expect(
      find.text('Signing in to revenuecat.com on the page'),
      findsOneWidget,
    );
    expect(find.byKey(const Key('loginRequestShare')), findsNothing);
  });

  testWidgets('Not Now declines it', (tester) async {
    final backend = await openChat(tester);
    await tester.tap(find.byKey(const Key('loginRequestNotNow')));
    await tester.pump(const Duration(milliseconds: 100));
    expect(backend.secretAnswers, [('lr1', null)]);
    expect(find.byKey(const Key('loginRequestShare')), findsNothing);
  });
}
