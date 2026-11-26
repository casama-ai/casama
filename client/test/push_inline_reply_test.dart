import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:casama/core/push.dart';

import 'fake_backend.dart';

// Inline notification replies on the iPhone (APPLE-INTEGRATIONS-PLAN §5.3): native keeps the app
// awake until Dart says a reply went out, so every reply gets an answer.
const _channel = MethodChannel('casama/notifications');
const _codec = StandardMethodCodec();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  late List<Object?> queued;
  late List<Map<Object?, Object?>> confirmed;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    queued = const [];
    confirmed = [];
    messenger.setMockMethodCallHandler(_channel, (call) async {
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
    debugDefaultTargetPlatformOverride = null;
    messenger.setMockMethodCallHandler(_channel, null);
    _channel.setMethodCallHandler(null);
  });

  /// Sends what native sends for a reply typed while the app runs; answers Dart's reply.
  Future<Object?> pushReply(Map<String, Object?> reply) async {
    ByteData? answer;
    await messenger.handlePlatformMessage(
      _channel.name,
      _codec.encodeMethodCall(MethodCall('inlineReply', reply)),
      (data) => answer = data,
    );
    return _codec.decodeEnvelope(answer!);
  }

  test(
    'queued replies are sent and each one confirmed with whether it went out',
    () async {
      queued = [
        {
          'id': 'r1',
          'bot_id': botId,
          'conversation_id': convId,
          'text': ' Queued hi ',
        },
        {'id': 'r2', 'bot_id': botId, 'conversation_id': convId, 'text': '   '},
        // An older native side without ids: sent, nothing to confirm.
        {'bot_id': botId, 'conversation_id': convId, 'text': 'No id'},
      ];
      final backend = FakeBackend();
      final registrar = PushRegistrar(backend, (_) {});
      addTearDown(registrar.dispose);

      await registrar.start();
      await pumpEventQueue();

      expect(backend.sent, ['Queued hi', 'No id']);
      expect(backend.sendKeys, ['r1', null]);
      expect(confirmed, [
        {'id': 'r1', 'ok': true},
        {'id': 'r2', 'ok': false},
      ]);
    },
  );

  test(
    'a reply pushed while running is answered with whether it went out',
    () async {
      final backend = FakeBackend();
      final registrar = PushRegistrar(backend, (_) {});
      addTearDown(registrar.dispose);
      await registrar.start();
      await pumpEventQueue();

      expect(
        await pushReply({
          'id': 'r3',
          'bot_id': botId,
          'conversation_id': convId,
          'text': 'Live',
        }),
        isTrue,
      );
      expect(backend.sent, ['Live']);
      expect(backend.sendKeys, ['r3']);

      backend.failNextSend = Exception('offline');
      expect(
        await pushReply({
          'id': 'r4',
          'bot_id': botId,
          'conversation_id': convId,
          'text': 'Lost',
        }),
        isFalse,
      );

      backend.signedInAs = null;
      expect(
        await pushReply({
          'id': 'r5',
          'bot_id': botId,
          'conversation_id': convId,
          'text': 'Signed out',
        }),
        isFalse,
      );
      expect(backend.sent, ['Live']);
    },
  );

  test('a native side that fails to hand over the queue leaves the listener working', () async {
    messenger.setMockMethodCallHandler(_channel, (call) async {
      if (call.method == 'takeInlineReplies') {
        throw PlatformException(code: 'gone');
      }
      return null;
    });
    final backend = FakeBackend();
    final registrar = PushRegistrar(backend, (_) {});
    addTearDown(registrar.dispose);
    await registrar.start();
    await pumpEventQueue();

    expect(
      await pushReply({
        'id': 'r6',
        'bot_id': botId,
        'conversation_id': '',
        'text': 'New chat',
      }),
      isTrue,
    );
    expect(backend.sent, ['New chat']);
  });
}
