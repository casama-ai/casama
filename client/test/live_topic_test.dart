// A live topic stays joined: a join the server refuses (a token that ran out while the app was
// away) is tried again, and whoever listens hears that there was a gap.
import 'package:casama/core/live_topic.dart';
import 'package:flutter_test/flutter_test.dart';

/// The library's side of one topic, as the test plays it.
class _Realtime {
  /// What each join reports with, in order.
  final joins = <void Function(bool joined)>[];
  final left = <int>[];
  var connected = true;
  var tokenReady = true;
  var readyAsked = 0;
  var rejoined = 0;

  late final topic = LiveTopic<int>(
    join: (report) {
      joins.add(report);
      return joins.length;
    },
    leave: (channel) async => left.add(channel),
    connected: () => connected,
    ready: () async {
      readyAsked++;
      return tokenReady;
    },
    onRejoined: () => rejoined++,
  );
}

void main() {
  testWidgets('a join the server refuses is made again with a fresh token', (
    tester,
  ) async {
    final rt = _Realtime()..topic.start();
    expect(rt.joins, hasLength(1));

    // Back from the background: the library joined with the old token and the server said no.
    rt.joins[0](false);
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump();
    expect(rt.left, [1]);
    expect(rt.readyAsked, 1);
    expect(rt.joins, hasLength(2));

    // The new join works: there was a gap, so the listener reads again.
    rt.joins[1](true);
    expect(rt.rejoined, 1);

    await tester.pump(const Duration(minutes: 2));
    expect(rt.joins, hasLength(2));
    await rt.topic.close();
  });

  testWidgets(
    'the first join says nothing; the library joining again says there was a gap',
    (tester) async {
      final rt = _Realtime()..topic.start();
      rt.joins[0](true);
      expect(rt.rejoined, 0);

      // The connection was away and the library joined the same channel again.
      rt.joins[0](true);
      expect(rt.rejoined, 1);
      expect(rt.joins, hasLength(1));
      expect(rt.left, isEmpty);
      await rt.topic.close();
    },
  );

  testWidgets(
    'while the connection is down, the library is left to join again',
    (tester) async {
      final rt = _Realtime()..topic.start();
      rt.joins[0](true);
      rt
        ..connected = false
        ..joins[0](false);
      await tester.pump(const Duration(seconds: 30));
      expect(rt.left, isEmpty);
      expect(rt.joins, hasLength(1));

      // The connection is back and the library's own join works.
      rt
        ..connected = true
        ..joins[0](true);
      expect(rt.rejoined, 1);
      await tester.pump(const Duration(minutes: 2));
      expect(rt.joins, hasLength(1));
      await rt.topic.close();
    },
  );

  testWidgets(
    'a topic still not joined once the connection is back is joined again',
    (tester) async {
      final rt = _Realtime()..topic.start();
      rt.joins[0](true);
      rt
        ..connected = false
        ..joins[0](false);
      await tester.pump(const Duration(seconds: 5));
      expect(rt.joins, hasLength(1));

      // Back, but the library's join was refused and it reported nothing more.
      rt.connected = true;
      await tester.pump(const Duration(seconds: 2));
      await tester.pump();
      expect(rt.left, [1]);
      expect(rt.joins, hasLength(2));
      rt.joins[1](true);
      expect(rt.rejoined, 1);
      await rt.topic.close();
    },
  );

  testWidgets(
    'with no token yet it waits, and a replaced channel is no longer heard',
    (tester) async {
      final rt = _Realtime()
        ..tokenReady = false
        ..topic.start();
      rt.joins[0](false);
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pump();
      expect(rt.left, [1]);
      expect(
        rt.joins,
        hasLength(1),
        reason: 'offline or signed out: nothing to join with',
      );

      // The channel that was left says it joined after all: it isn't the topic's any more.
      rt.joins[0](true);
      expect(rt.rejoined, 0);

      rt.tokenReady = true;
      await tester.pump(const Duration(seconds: 2));
      await tester.pump();
      expect(rt.joins, hasLength(2));
      rt.joins[1](true);
      expect(
        rt.rejoined,
        1,
        reason: 'the first join that works comes after a gap',
      );
      await rt.topic.close();
    },
  );

  testWidgets(
    'a topic the server keeps refusing is asked less and less often',
    (tester) async {
      final rt = _Realtime()..topic.start();
      rt.joins[0](false);
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pump();
      expect(rt.joins, hasLength(2));

      rt.joins[1](false);
      await tester.pump(const Duration(seconds: 1));
      await tester.pump();
      expect(
        rt.joins,
        hasLength(2),
        reason: 'the second wait is longer than the first',
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.pump();
      expect(rt.joins, hasLength(3));
      await rt.topic.close();
    },
  );

  testWidgets('closing leaves the topic and stops trying', (tester) async {
    final rt = _Realtime()..topic.start();
    rt.joins[0](false);
    await rt.topic.close();
    expect(rt.left, [1]);

    rt.joins[0](true);
    await tester.pump(const Duration(minutes: 2));
    expect(rt.joins, hasLength(1));
    expect(rt.rejoined, 0);
  });
}
