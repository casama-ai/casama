import 'dart:async';

import 'package:casama/core/backend.dart';
import 'package:casama/core/inline_replies.dart';
import 'package:casama_sdk/casama_sdk.dart'
    show AppMentionRef, SendMessageResponse;
import 'package:dio/dio.dart'
    show DioException, DioExceptionType, RequestOptions, Response;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

// iPhone notification replies typed while Casama isn't running (APPLE-INTEGRATIONS-PLAN §5.3):
// AppDelegate.swift starts a headless engine on `inlineReplyMain`, which sends the queue the same
// way the app does. Native code ends each reply when Dart answers it, so every reply gets one;
// with no connection the headless engine stops and leaves the rest queued for the next start.
const _channel = MethodChannel('casama/notifications');
const _codec = StandardMethodCodec();

DioException _offline() => DioException(
  requestOptions: RequestOptions(path: '/v1/chat'),
  type: DioExceptionType.connectionError,
);

DioException _status(int code) {
  final request = RequestOptions(path: '/v1/chat');
  return DioException(
    requestOptions: request,
    response: Response<Object?>(requestOptions: request, statusCode: code),
    type: DioExceptionType.badResponse,
  );
}

/// A backend whose sends wait for [gate], to type a reply while another one is being sent.
class _GatedBackend extends FakeBackend {
  Completer<void>? gate;

  @override
  Future<SendMessageResponse> send(
    String conversationId,
    String text, {
    List<AttachmentRef> attachments = const [],
    Map<String, Object?>? uiAction,
    List<String> skills = const [],
    List<AppMentionRef> apps = const [],
    String? idempotencyKey,
  }) async {
    final wait = gate;
    if (wait != null) {
      gate = null;
      await wait.future;
    }
    return super.send(
      conversationId,
      text,
      attachments: attachments,
      uiAction: uiAction,
      skills: skills,
      apps: apps,
      idempotencyKey: idempotencyKey,
    );
  }
}

/// A backend whose nth send (from 1) fails with what [failure] answers for it; null: it goes.
class _FlakyBackend extends FakeBackend {
  _FlakyBackend(this.failure);
  final Object? Function(int n) failure;
  var _sends = 0;

  @override
  Future<SendMessageResponse> send(
    String conversationId,
    String text, {
    List<AttachmentRef> attachments = const [],
    Map<String, Object?>? uiAction,
    List<String> skills = const [],
    List<AppMentionRef> apps = const [],
    String? idempotencyKey,
  }) {
    failNextSend = failure(++_sends);
    return super.send(
      conversationId,
      text,
      attachments: attachments,
      uiAction: uiAction,
      skills: skills,
      apps: apps,
      idempotencyKey: idempotencyKey,
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  late List<Object?> queued;
  late List<String> calls;
  late List<Map<Object?, Object?>> confirmed;

  setUp(() {
    queued = const [];
    calls = [];
    confirmed = [];
    messenger.setMockMethodCallHandler(_channel, (call) async {
      calls.add(call.method);
      switch (call.method) {
        case 'takeInlineReplies':
          return queued;
        case 'inlineReplyDone':
          confirmed.add(call.arguments as Map<Object?, Object?>);
      }
      return null;
    });
  });

  tearDown(() {
    messenger.setMockMethodCallHandler(_channel, null);
    _channel.setMethodCallHandler(null);
  });

  /// What native sends for a reply typed while Dart listens; answers Dart's answer.
  Future<Object?> pushReply(Map<String, Object?> reply) async {
    final answer = Completer<Object?>();
    await messenger.handlePlatformMessage(
      _channel.name,
      _codec.encodeMethodCall(MethodCall('inlineReply', reply)),
      (data) =>
          answer.complete(data == null ? null : _codec.decodeEnvelope(data)),
    );
    return answer.future;
  }

  Map<String, Object?> reply(
    String id,
    String text, {
    String conversation = convId,
  }) => {
    'id': id,
    'bot_id': botId,
    'conversation_id': conversation,
    'text': text,
  };

  group('deliverInlineReply', () {
    test(
      'sends the trimmed text with the reply id as the idempotency key',
      () async {
        final backend = FakeBackend();
        expect(
          await deliverInlineReply(backend, reply('r1', '  Hi there ')),
          InlineReplyOutcome.sent,
        );
        expect(backend.sent, ['Hi there']);
        expect(backend.sendKeys, ['r1']);
      },
    );

    test('a reply with no chat starts one with its bot', () async {
      final backend = FakeBackend();
      expect(
        await deliverInlineReply(
          backend,
          reply('r2', 'New chat', conversation: ''),
        ),
        InlineReplyOutcome.sent,
      );
      expect(backend.sent, ['New chat']);
    });

    test(
      'is dropped with no text, no bot or chat, nobody signed in, or a refusal',
      () async {
        final backend = FakeBackend();
        expect(
          await deliverInlineReply(backend, reply('r3', '   ')),
          InlineReplyOutcome.dropped,
        );
        expect(
          await deliverInlineReply(backend, {
            'id': 'r4',
            'bot_id': '',
            'conversation_id': '',
            'text': 'Where to?',
          }),
          InlineReplyOutcome.dropped,
        );
        expect(
          await deliverInlineReply(null, reply('r5', 'No backend')),
          InlineReplyOutcome.dropped,
        );
        backend.failNextSend = _status(403);
        expect(
          await deliverInlineReply(backend, reply('r6', 'Refused')),
          InlineReplyOutcome.dropped,
        );
        backend.failNextSend = StateError('bad data');
        expect(
          await deliverInlineReply(backend, reply('r7', 'Broken')),
          InlineReplyOutcome.dropped,
        );
        backend.signedInAs = null;
        expect(
          await deliverInlineReply(backend, reply('r8', 'Signed out')),
          InlineReplyOutcome.dropped,
        );
        expect(backend.sent, isEmpty);
        // Only the refused sends reached the server; the others stopped before it.
        expect(backend.sendKeys, ['r6', 'r7']);
      },
    );

    test(
      'is left for later with no connection, or the server down or busy',
      () async {
        final backend = FakeBackend();
        for (final failure in [
          _offline(),
          _status(503),
          _status(429),
          TimeoutException('slow'),
        ]) {
          backend.failNextSend = failure;
          expect(
            await deliverInlineReply(backend, reply('r1', 'Hi')),
            InlineReplyOutcome.later,
            reason: '$failure',
          );
        }
        expect(backend.sent, isEmpty);
      },
    );

    test(
      'the app answers whether it went out: later counts as not sent',
      () async {
        final backend = FakeBackend();
        expect(await sendInlineReply(backend, reply('r1', 'Hi')), isTrue);
        backend.failNextSend = _offline();
        expect(await sendInlineReply(backend, reply('r2', 'Offline')), isFalse);
        backend.failNextSend = _status(404);
        expect(await sendInlineReply(backend, reply('r3', 'Gone')), isFalse);
      },
    );
  });

  group('runHeadlessInlineReplies', () {
    test('takes the queue, sends each reply and confirms each with whether it went out', () async {
      queued = [
        reply('r1', ' First '),
        reply('r2', '   '),
        // An older native side without ids: sent, nothing to confirm.
        {'bot_id': botId, 'conversation_id': convId, 'text': 'No id'},
        reply('r3', 'Last'),
      ];
      final backend = FakeBackend();
      await runHeadlessInlineReplies(() async => backend);

      expect(calls.first, 'takeInlineReplies');
      expect(backend.sent, ['First', 'No id', 'Last']);
      expect(backend.sendKeys, ['r1', null, 'r3']);
      expect(confirmed, [
        {'id': 'r1', 'ok': true},
        {'id': 'r2', 'ok': false},
        {'id': 'r3', 'ok': true},
      ]);
      expect(calls, isNot(contains('stopInlineReplies')));
    });

    test('a reply the server refuses is confirmed as not sent, so native code drops it', () async {
      queued = [reply('r1', 'Refused'), reply('r2', 'Kept')];
      final backend = FakeBackend()..failNextSend = _status(403);
      await runHeadlessInlineReplies(() async => backend);

      expect(backend.sent, ['Kept']);
      expect(confirmed, [
        {'id': 'r1', 'ok': false},
        {'id': 'r2', 'ok': true},
      ]);
    });

    test('signed out: each reply is confirmed as not sent and nothing reaches the server', () async {
      queued = [reply('r1', 'Hello'), reply('r2', 'Again')];
      await runHeadlessInlineReplies(() async => null);

      expect(confirmed, [
        {'id': 'r1', 'ok': false},
        {'id': 'r2', 'ok': false},
      ]);
      expect(await pushReply(reply('r3', 'Live')), isFalse);
      expect(calls, isNot(contains('stopInlineReplies')));
    });

    test('no connection to start: nothing is taken and native code is told to stop, keeping the queue', () async {
      queued = [reply('r1', 'Hello')];
      await runHeadlessInlineReplies(() async => throw _offline());

      expect(calls, ['stopInlineReplies']);
      expect(confirmed, isEmpty);
    });

    testWidgets('a connection that never comes stops after the timeout', (
      tester,
    ) async {
      queued = [reply('r1', 'Hello')];
      var finished = false;
      unawaited(
        runHeadlessInlineReplies(() => Completer<Backend?>().future)
            .then((_) => finished = true),
      );
      await tester.pump(const Duration(seconds: 19));
      expect(calls, isEmpty);
      await tester.pump(const Duration(seconds: 2));
      await tester.pump();
      expect(calls, ['stopInlineReplies']);
      expect(finished, isTrue);
    });

    test('the connection lost mid-queue: the rest is left unanswered and native code is told to stop', () async {
      queued = [
        reply('r1', 'Sent'),
        reply('r2', 'Offline'),
        reply('r3', 'Not tried'),
      ];
      final backend = _FlakyBackend((n) => n == 2 ? _offline() : null);
      await runHeadlessInlineReplies(() async => backend);

      expect(backend.sent, ['Sent']);
      expect(backend.sendKeys, ['r1', 'r2']);
      expect(confirmed, [
        {'id': 'r1', 'ok': true},
      ]);
      expect(calls, [
        'takeInlineReplies',
        'inlineReplyDone',
        'stopInlineReplies',
      ]);
    });

    test(
      'a reply typed while the queue is being sent is answered too',
      () async {
        queued = [reply('r1', 'Queued')];
        final backend = _GatedBackend();
        final gate = backend.gate = Completer<void>();
        final run = runHeadlessInlineReplies(() async => backend);
        await pumpEventQueue();
        // The queued reply is on its way; a new one comes in meanwhile.
        expect(calls, ['takeInlineReplies']);
        expect(await pushReply(reply('r2', 'Typed meanwhile')), isTrue);
        gate.complete();
        await run;

        expect(backend.sent, ['Typed meanwhile', 'Queued']);
        expect(backend.sendKeys, ['r2', 'r1']);
        // The pushed one was answered directly; the taken one with inlineReplyDone.
        expect(confirmed, [
          {'id': 'r1', 'ok': true},
        ]);
        // And after the queue is done, still listening until native code stops the engine.
        expect(await pushReply(reply('r3', 'Later')), isTrue);
        expect(backend.sent.last, 'Later');
      },
    );

    test('a reply typed with no connection is left for later and native code is told to stop', () async {
      final backend = FakeBackend();
      await runHeadlessInlineReplies(() async => backend);
      backend.failNextSend = _offline();

      expect(await pushReply(reply('r1', 'Offline')), inlineReplyLater);
      await pumpEventQueue();
      expect(calls, ['takeInlineReplies', 'stopInlineReplies']);
      expect(confirmed, isEmpty);
    });

    test('a native side that fails to hand over the queue leaves the listener working', () async {
      messenger.setMockMethodCallHandler(_channel, (call) async {
        if (call.method == 'takeInlineReplies') {
          throw PlatformException(code: 'gone');
        }
        return null;
      });
      final backend = FakeBackend();
      await runHeadlessInlineReplies(() async => backend);

      expect(await pushReply(reply('r1', 'Still here')), isTrue);
      expect(backend.sent, ['Still here']);
    });
  });
}
