// After Stop the chat says the reply was cancelled, also when the run's own run.cancelled never
// arrives, and after a reload; a reply that finished before the stop landed gets no marker (E4).
import 'dart:async';

import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

void main() {
  final realWait = cancelSettleWait;
  setUp(() => cancelSettleWait = const Duration(milliseconds: 20));
  tearDown(() => cancelSettleWait = realWait);

  (ProviderContainer, FakeBackend, ChatController) setUpChat({
    List<ChatMessageView> stored = const [],
  }) {
    final backend = FakeBackend()..storedMessages = stored;
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

  List<NoticeEntry> cancelled(ProviderContainer c) => c
      .read(chatControllerProvider(botId))
      .entries
      .whereType<NoticeEntry>()
      .where((n) => n.kind == NoticeKind.cancelled)
      .toList();

  Future<(ProviderContainer, FakeBackend, ChatController)> running() async {
    final chat = setUpChat();
    final (container, _, c) = chat;
    await c.open(convId);
    await c.send('Write me a long story');
    expect(container.read(chatControllerProvider(botId)).running, isTrue);
    return chat;
  }

  test('Stop with no run.cancelled heard: the marker goes in here', () async {
    final (container, backend, c) = await running();
    backend.runStatuses[runId] = RunStatus.cancelled;
    await c.cancel();
    expect(backend.cancelled, isTrue);
    final marks = cancelled(container);
    expect(marks, hasLength(1));
    expect(marks.single.refId, runId);
    expect(container.read(chatControllerProvider(botId)).running, isFalse);
  });

  test('a Stop request that never answers is sent again, then the marker goes in', () async {
    final realTimeout = cancelRequestTimeout;
    cancelRequestTimeout = const Duration(milliseconds: 30);
    addTearDown(() => cancelRequestTimeout = realTimeout);
    final (container, backend, c) = await running();
    backend
      ..runStatuses[runId] = RunStatus.cancelled
      ..cancelHangs = 1;
    await c.cancel();
    expect(backend.cancelCalls, 2);
    expect(cancelled(container), hasLength(1));
    expect(container.read(chatControllerProvider(botId)).running, isFalse);
  });

  test('a Stop that never answers twice says so instead of hanging on Working', () async {
    final realTimeout = cancelRequestTimeout;
    cancelRequestTimeout = const Duration(milliseconds: 30);
    addTearDown(() => cancelRequestTimeout = realTimeout);
    final (_, backend, c) = await running();
    backend.cancelHangs = 2;
    await expectLater(c.cancel(), throwsA(isA<TimeoutException>()));
  });

  test('run.cancelled arriving in time puts one marker in', () async {
    final (container, backend, c) = await running();
    backend.runStatuses[runId] = RunStatus.cancelled;
    final stopping = c.cancel();
    backend.runEventsController.add(
      ev(2, 'run.cancelled', {'cancelled_by': 'user'}),
    );
    await stopping;
    expect(cancelled(container), hasLength(1));
    // A late copy of the event adds nothing.
    c.apply(ev(3, 'run.cancelled', {'cancelled_by': 'user'}));
    expect(cancelled(container), hasLength(1));
  });

  test('a reply that finished before the stop landed gets no marker', () async {
    final (container, backend, c) = await running();
    backend.runStatuses[runId] = RunStatus.completed;
    await c.cancel();
    expect(cancelled(container), isEmpty);
    expect(container.read(chatControllerProvider(botId)).running, isFalse);
  });

  test('a cancelled last run shows its marker when the chat opens', () async {
    final (container, backend, c) = setUpChat(
      stored: [
        ChatMessageView(
          id: 'm-1',
          role: 'user',
          text: 'Write me a long story',
          createdAt: DateTime(2026),
          runId: runId,
        ),
      ],
    );
    backend.runStatus = RunStatus.cancelled;
    await c.open(convId);
    final marks = cancelled(container);
    expect(marks, hasLength(1));
    expect(marks.single.refId, runId);
  });
}
