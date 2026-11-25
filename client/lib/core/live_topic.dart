import 'dart:async';

/// One Realtime topic, kept joined.
///
/// The Realtime library joins a topic again by itself after the connection drops. A join the
/// server refuses is different: the library reports the error and never tries again. That is what
/// happens when the app comes back after its sign-in token ran out (a phone in the background, a
/// computer asleep): the library joins with the old token a moment before the new one arrives.
/// The topic then stayed silent until the app restarted, so an open chat, the chats list and the
/// inbox stopped following what happened, and nothing told them to read again.
///
/// This watches every join. When one fails while the connection is up, it leaves the topic and
/// joins again once the token is good, and says so ([onRejoined]) so whoever listens can read what
/// it missed.
///
/// [C] is the library's channel; the calls into the library are passed in, so this can be tested
/// without a server.
class LiveTopic<C> {
  LiveTopic({
    required this.join,
    required this.leave,
    required this.connected,
    required this.ready,
    this.onRejoined,
    this.retryDelays = defaultRetryDelays,
    this.checkEvery = const Duration(seconds: 2),
  });

  /// Joins the topic and returns its channel. `report(true)` every time the server accepts the
  /// join; `report(false)` when a join fails, times out or the channel closes.
  final C Function(void Function(bool joined) report) join;

  /// Leaves [channel] for good.
  final Future<void> Function(C channel) leave;

  /// Whether the connection to Realtime is up.
  final bool Function() connected;

  /// Makes a join possible and says whether it is: signed in, with a token that hasn't run out
  /// (renewed here when it has).
  final Future<bool> Function() ready;

  /// The topic is joined again after a gap, in which something may have been missed.
  final void Function()? onRejoined;

  /// The waits before joining again, by failed tries in a row; the last one repeats.
  final List<Duration> retryDelays;

  /// How often a topic that isn't joined looks again while the connection is down.
  final Duration checkEvery;

  /// The first is short: a refused join is nearly always the token, and the new one is a moment
  /// away. A topic the server keeps refusing (a chat deleted meanwhile) settles at once a minute.
  static const defaultRetryDelays = [
    Duration(milliseconds: 300),
    Duration(seconds: 2),
    Duration(seconds: 5),
    Duration(seconds: 15),
    Duration(seconds: 30),
    Duration(seconds: 60),
  ];

  C? _channel;

  /// Each join gets a number: what an earlier join's channel still reports is ignored.
  int _join = 0;
  bool _joinedOnce = false;

  /// A join failed since the last one that worked: whatever happened meanwhile was not heard.
  bool _gap = false;
  bool _closed = false;
  int _failures = 0;
  Timer? _retry;

  void start() {
    if (_closed || _channel != null) return;
    _channel = _joinNow();
  }

  Future<void> close() async {
    _closed = true;
    _join++;
    _retry?.cancel();
    _retry = null;
    final channel = _channel;
    _channel = null;
    if (channel != null) {
      try {
        await leave(channel);
      } catch (_) {}
    }
  }

  C _joinNow() {
    final mine = ++_join;
    return join((joined) => _report(mine, joined));
  }

  void _report(int from, bool joined) {
    if (_closed || from != _join) return;
    if (!joined) {
      _gap = true;
      _retryIn(retryDelays[_failures.clamp(0, retryDelays.length - 1)]);
      return;
    }
    _retry?.cancel();
    _retry = null;
    _failures = 0;
    // Joined a second time (the library does that after the connection was away), or joined at
    // last after a join that failed: either way there was a gap.
    final again = _joinedOnce || _gap;
    _joinedOnce = true;
    _gap = false;
    if (again) onRejoined?.call();
  }

  void _retryIn(Duration wait) {
    if (_closed || _retry != null) return;
    _retry = Timer(wait, () => unawaited(_retryNow()));
  }

  Future<void> _retryNow() async {
    _retry = null;
    if (_closed) return;
    // The connection is down: the library joins this channel again by itself when it is back, and
    // reports it. Leaving now would only add a second join to wait for. With no channel left (an
    // earlier try found no token), nothing would bring the connection back, so that case goes on.
    if (_channel != null && !connected()) {
      _retryIn(checkEvery);
      return;
    }
    _failures++;
    final mine = ++_join;
    final old = _channel;
    _channel = null;
    if (old != null) {
      try {
        await leave(old);
      } catch (_) {}
    }
    if (_closed || mine != _join) return;
    var ok = false;
    try {
      ok = await ready();
    } catch (_) {}
    if (_closed || mine != _join) return;
    if (!ok) {
      // Offline, or signed out: nothing to join with yet.
      _retryIn(retryDelays[_failures.clamp(0, retryDelays.length - 1)]);
      return;
    }
    _gap = true;
    _channel = _joinNow();
  }
}
