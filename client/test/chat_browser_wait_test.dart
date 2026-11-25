import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama/features/chat/widgets/chat_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness;
import 'fake_backend.dart';

/// The run waiting for the person to come back to the chat for their in-app browser (D-529).
void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  (ProviderContainer, ChatController) setUpChat() {
    final backend = FakeBackend();
    final container = ProviderContainer(
      overrides: [backendProvider.overrideWithValue(backend)],
    );
    addTearDown(container.dispose);
    container.listen(chatControllerProvider(botId), (_, _) {});
    return (container, container.read(chatControllerProvider(botId).notifier));
  }

  List<NoticeEntry> waits(ProviderContainer c) => c
      .read(chatControllerProvider(botId))
      .entries
      .whereType<NoticeEntry>()
      .where((n) => n.kind == NoticeKind.browserWait)
      .toList();

  final waiting = ev(1, 'browser.waiting', {
    'device_system': 'ios',
    'host': 'etravel.gov.ph',
    'expires_at': '2026-11-10T09:05:00.000Z',
  });

  test(
    'shows a waiting line, and takes it away when the person is back',
    () async {
      final (container, c) = setUpChat();
      await c.open(convId);
      c.apply(waiting);
      expect(waits(container).single.text, 'etravel.gov.ph');
      expect(waits(container).single.errorCode, isNull);
      c.apply(ev(2, 'browser.waiting_resolved', {'outcome': 'back'}));
      expect(waits(container), isEmpty);
    },
  );

  test(
    'a wait for Hand Back has its own line, kept through the end (D-571)',
    () async {
      final (container, c) = setUpChat();
      await c.open(convId);
      c.apply(
        ev(1, 'browser.waiting', {
          'device_system': 'macos',
          'host': 'shop.example',
          'expires_at': '2026-11-10T09:05:00.000Z',
          'hand_back': true,
        }),
      );
      expect(waits(container).single.refId, NoticeEntry.handBack);
      expect(waits(container).single.text, 'shop.example');
      c.apply(ev(2, 'browser.waiting_resolved', {'outcome': 'expired'}));
      expect(waits(container).single.refId, NoticeEntry.handBack);
      expect(waits(container).single.errorCode, 'expired');
      // An older server's wait (no hand_back) is the D-529 line.
      c.apply(waiting);
      expect(waits(container).last.refId, isNull);
    },
  );

  testWidgets(
    'the Hand Back line says what to do, and when the wait ended (D-571)',
    (tester) async {
      Future<void> show(NoticeEntry e) async {
        await tester.pumpWidget(
          harness(FakeBackend(), Scaffold(body: NoticeLine(entry: e))),
        );
        await tester.pumpAndSettle();
      }

      await show(
        const NoticeEntry(
          kind: NoticeKind.browserWait,
          text: 'shop.example',
          refId: NoticeEntry.handBack,
        ),
      );
      expect(
        find.text(
          'Your turn on shop.example. Do the step on the page, then tap Hand Back.',
        ),
        findsOneWidget,
      );
      await show(
        const NoticeEntry(
          kind: NoticeKind.browserWait,
          text: 'shop.example',
          refId: NoticeEntry.handBack,
          errorCode: 'expired',
        ),
      );
      expect(
        find.text('Stopped waiting for you to hand the browser back.'),
        findsOneWidget,
      );
    },
  );

  test('says the wait ended when the person did not come back', () async {
    final (container, c) = setUpChat();
    await c.open(convId);
    c.apply(waiting);
    c.apply(ev(2, 'browser.waiting_resolved', {'outcome': 'expired'}));
    expect(waits(container).single.errorCode, 'expired');
    // A second wait in the same run adds a fresh line and leaves the ended one.
    c.apply(
      ev(3, 'browser.waiting', {
        'device_system': 'android',
        'host': null,
        'expires_at': '2026-11-10T09:10:00.000Z',
      }),
    );
    expect(waits(container).map((n) => n.errorCode), ['expired', null]);
  });
}
