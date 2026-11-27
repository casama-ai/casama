// Opening a chat that hits "too many requests" waits and loads, instead of "This chat didn't load"
// (the customer's build 108 Mac, with three bots busy).
import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

DioException _limited() {
  final options = RequestOptions(path: '/v1/conversations/c/messages');
  return DioException(
    requestOptions: options,
    type: DioExceptionType.badResponse,
    response: Response(
      requestOptions: options,
      statusCode: 429,
      headers: Headers.fromMap({
        'retry-after': ['1'],
      }),
    ),
  );
}

void main() {
  test(
    'a chat whose thread read hits the rate limit loads after the wait',
    () async {
      final backend = FakeBackend()
        ..storedMessages = [
          ChatMessageView(
            id: 'm-1',
            role: 'assistant',
            text: 'Hello',
            createdAt: DateTime(2026),
          ),
        ]
        ..failMessages.add(_limited());
      final container = ProviderContainer(
        overrides: [backendProvider.overrideWithValue(backend)],
      );
      addTearDown(container.dispose);
      container.listen(chatControllerProvider(botId), (_, _) {});
      await container.read(chatControllerProvider(botId).notifier).open(convId);
      final s = container.read(chatControllerProvider(botId));
      expect(s.loadFailed, isFalse);
      expect(
        [
          for (final e in s.entries)
            if (e is MessageEntry) e.text,
        ],
        ['Hello'],
      );
    },
  );
}
