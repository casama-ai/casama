// A message that finds no server (a deploy restarting it) tries again by itself, with one
// idempotency key for every try, so the server posts it once.
import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/server_reachability.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

DioException _noConnection() => DioException(
  requestOptions: RequestOptions(path: '/v1/conversations/c/messages'),
  type: DioExceptionType.connectionError,
);

DioException _status(int code) {
  final options = RequestOptions(path: '/v1/conversations/c/messages');
  return DioException(
    requestOptions: options,
    type: DioExceptionType.badResponse,
    response: Response(requestOptions: options, statusCode: code),
  );
}

void main() {
  final realDelays = sendRetryDelays;
  setUp(
    () => sendRetryDelays = const [
      Duration(milliseconds: 1),
      Duration(milliseconds: 1),
      Duration(milliseconds: 1),
    ],
  );
  final realWindow = autoResendWindow;
  tearDown(() {
    sendRetryDelays = realDelays;
    autoResendWindow = realWindow;
    serverReachability.value = Reachability.ok;
  });

  (ProviderContainer, FakeBackend, ChatController) setUpChat() {
    final backend = FakeBackend()
      ..storedMessages = [
        ChatMessageView(
          id: 'm-1',
          role: 'assistant',
          text: 'Hello',
          createdAt: DateTime(2026),
        ),
      ];
    final container = ProviderContainer(
      overrides: [backendProvider.overrideWithValue(backend)],
    );
    addTearDown(container.dispose);
    container.listen(chatControllerProvider(botId), (_, _) {});
    return (
      container,
      backend,
      container.read(chatControllerProvider(botId).notifier),
    );
  }

  List<MessageEntry> messages(ProviderContainer c) => c
      .read(chatControllerProvider(botId))
      .entries
      .whereType<MessageEntry>()
      .toList();

  test(
    'a connection error is tried again with the same key until it goes through',
    () async {
      final (container, backend, c) = setUpChat();
      await c.open(convId);
      backend.failSends.addAll([_noConnection(), _status(502)]);
      await c.send('Book the hotel');
      expect(backend.sent, ['Book the hotel']);
      expect(backend.sendKeys, hasLength(3));
      expect(backend.sendKeys.toSet(), hasLength(1));
      expect(
        backend.sendKeys.first,
        matches(
          RegExp(
            r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
          ),
        ),
      );
      expect(messages(container).last.failed, isFalse);
    },
  );

  test('each message has its own key', () async {
    final (_, backend, c) = setUpChat();
    await c.open(convId);
    await c.send('One');
    await c.send('Two');
    expect(backend.sendKeys.toSet(), hasLength(2));
  });

  test('a 4xx is not tried again', () async {
    final (container, backend, c) = setUpChat();
    await c.open(convId);
    backend.failSends.add(_status(422));
    await expectLater(c.send('Book the hotel'), throwsA(isA<DioException>()));
    expect(backend.sendKeys, hasLength(1));
    expect(messages(container).last.failed, isTrue);
  });

  test(
    'after the tries run out it is Not sent, and Try Again reuses the key',
    () async {
      final (container, backend, c) = setUpChat();
      await c.open(convId);
      backend.failSends.addAll(List.generate(4, (_) => _noConnection()));
      await expectLater(c.send('Book the hotel'), throwsA(isA<DioException>()));
      expect(backend.sendKeys, hasLength(4));
      final failed = messages(container).last;
      expect(failed.failed, isTrue);

      await c.resend(failed.id);
      expect(backend.sent, ['Book the hotel']);
      expect(backend.sendKeys, hasLength(5));
      expect(backend.sendKeys.toSet(), hasLength(1));
    },
  );

  test('which errors count as no connection', () {
    expect(isConnectionFailure(_noConnection()), isTrue);
    expect(isConnectionFailure(_status(503)), isTrue);
    expect(isConnectionFailure(_status(504)), isTrue);
    expect(isConnectionFailure(_status(500)), isFalse);
    expect(isConnectionFailure(_status(409)), isFalse);
    expect(
      isConnectionFailure(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.unknown,
        ),
      ),
      isTrue,
    );
    expect(isConnectionFailure(Exception('connection refused')), isFalse);
  });

  test('the tries wait about two minutes in all (B2)', () {
    sendRetryDelays = realDelays;
    expect(sendRetryDelays.map((d) => d.inSeconds), [1, 2, 4, 8, 15, 30, 60]);
    final total = sendRetryDelays.fold(Duration.zero, (a, b) => a + b);
    expect(total.inSeconds, inInclusiveRange(110, 130));
  });

  group('when the server answers again (B1)', () {
    Future<void> failToSend(ChatController c, FakeBackend backend, String text, {Object? error}) async {
      backend.failSends.addAll(List.generate(4, (_) => error ?? _noConnection()));
      await expectLater(c.send(text), throwsA(isA<DioException>()));
    }

    test('unsent messages go again, oldest first, each with its own key', () async {
      final (container, backend, c) = setUpChat();
      await c.open(convId);
      serverReachability.value = Reachability.unreachable;
      await failToSend(c, backend, 'One');
      await failToSend(c, backend, 'Two');
      final keys = backend.sendKeys.toSet().toList();
      expect(keys, hasLength(2));
      expect(messages(container).where((m) => m.failed), hasLength(2));
      backend.sendKeys.clear();

      serverReachability.value = Reachability.ok;
      await pumpEventQueue();
      expect(backend.sent, ['One', 'Two']);
      expect(backend.sendKeys, keys);
      expect(messages(container).where((m) => m.failed), isEmpty);
    });

    test('one that failed more than 10 minutes ago keeps Try Again', () async {
      final (container, backend, c) = setUpChat();
      await c.open(convId);
      serverReachability.value = Reachability.unreachable;
      await failToSend(c, backend, 'Old');
      autoResendWindow = Duration.zero;
      serverReachability.value = Reachability.ok;
      await pumpEventQueue();
      expect(backend.sent, isEmpty);
      expect(messages(container).last.failed, isTrue);
    });

    test('one the server refused (a 4xx) never goes by itself', () async {
      final (container, backend, c) = setUpChat();
      await c.open(convId);
      serverReachability.value = Reachability.unreachable;
      backend.failSends.add(_status(422));
      await expectLater(c.send('Refused'), throwsA(isA<DioException>()));
      serverReachability.value = Reachability.ok;
      await pumpEventQueue();
      expect(backend.sent, isEmpty);
      expect(backend.sendKeys, hasLength(1));
      expect(messages(container).last.failed, isTrue);
    });

    test('Try Again at the same moment does not send it twice', () async {
      final (container, backend, c) = setUpChat();
      await c.open(convId);
      serverReachability.value = Reachability.unreachable;
      await failToSend(c, backend, 'Once');
      final id = messages(container).last.id;
      serverReachability.value = Reachability.ok;
      await c.resend(id);
      await pumpEventQueue();
      expect(backend.sent, ['Once']);
    });

    test('a closed chat stops listening', () async {
      final (container, backend, c) = setUpChat();
      await c.open(convId);
      serverReachability.value = Reachability.unreachable;
      await failToSend(c, backend, 'Gone');
      container.dispose();
      serverReachability.value = Reachability.ok;
      await pumpEventQueue();
      expect(backend.sent, isEmpty);
    });
  });
}
