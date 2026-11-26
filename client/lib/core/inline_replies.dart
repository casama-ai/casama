import 'dart:async';

import 'package:dio/dio.dart' show DioException;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'backend.dart';
import 'chat_focus.dart' show notificationsChannel;

// Inline replies typed in an iPhone or Mac notification (docs/APPLE-INTEGRATIONS-PLAN.md §5.3).
//
// Native code gives each reply an id and holds it until Dart answers: `takeInlineReplies` hands
// over the queue, each one taken is answered with `inlineReplyDone` {id, ok}, and a reply typed
// while Dart listens arrives as an `inlineReply` call, answered with whether it went out. Either
// answer ends it, sent or not. The app's engine sends them (`PushRegistrar` in push.dart); on the
// iPhone, a headless engine started for them when Casama isn't running does
// (`runHeadlessInlineReplies` below). That one alone may also leave a reply for later.

/// What became of an inline reply.
enum InlineReplyOutcome {
  /// The server has it.
  sent,

  /// It can't go: no text, no bot or chat, nobody signed in, or the server refused it.
  dropped,

  /// No connection, or the server is down or busy for now: worth sending again later.
  later,
}

/// The headless engine's answer to an `inlineReply` it couldn't send for now: native code keeps
/// the reply queued and stops that engine.
const inlineReplyLater = 'later';

/// Sends one inline reply to its bot; never throws. The native reply id is the idempotency key,
/// so the same reply handed over twice (an engine stopped before confirming it, or a second engine
/// took it over) makes one message.
Future<InlineReplyOutcome> deliverInlineReply(
  Backend? backend,
  Map<String, dynamic> data,
) async {
  final text = data['text'] is String ? (data['text'] as String).trim() : '';
  if (text.isEmpty || backend == null || backend.userId == null) {
    return InlineReplyOutcome.dropped;
  }
  var conversationId = data['conversation_id'] is String
      ? (data['conversation_id'] as String).trim()
      : '';
  final botId = data['bot_id'] is String
      ? (data['bot_id'] as String).trim()
      : '';
  try {
    if (conversationId.isEmpty) {
      if (botId.isEmpty) return InlineReplyOutcome.dropped;
      conversationId = (await backend.createConversation(botId)).id;
    }
    final id = data['id'];
    await backend.send(
      conversationId,
      text,
      idempotencyKey: id is String && id.isNotEmpty ? id : null,
    );
    return InlineReplyOutcome.sent;
  } catch (e) {
    debugPrint('inline notification reply failed: $e');
    return _worthRetrying(e)
        ? InlineReplyOutcome.later
        : InlineReplyOutcome.dropped;
  }
}

/// A failure that may pass: no answer from the server (offline, a timeout), or the server down
/// or busy. Anything the server answered otherwise (a refusal) won't change on a retry.
bool _worthRetrying(Object e) {
  if (e is TimeoutException) return true;
  if (e is! DioException) return false;
  final status = e.response?.statusCode;
  return status == null || status >= 500 || status == 429;
}

/// [deliverInlineReply] as the app's engine answers it: whether it went out. A reply that didn't
/// is dropped, later or not: the app is the last try.
Future<bool> sendInlineReply(
  Backend? backend,
  Map<String, dynamic> data,
) async => await deliverInlineReply(backend, data) == InlineReplyOutcome.sent;

/// Answers native code's `inlineReply` calls with what [answer] gives: whether the reply went
/// out, or [inlineReplyLater] (headless engine only).
void listenForInlineReplies(
  Future<Object?> Function(Map<String, dynamic> data) answer, {
  MethodChannel channel = notificationsChannel,
}) {
  channel.setMethodCallHandler((call) async {
    if (call.method == 'inlineReply' && call.arguments is Map) {
      return answer(Map<String, dynamic>.from(call.arguments as Map));
    }
    return null;
  });
}

/// Takes the replies native code holds, sends each with [send] in turn and answers each with
/// `inlineReplyDone`. Taking also tells native code that this engine listens for `inlineReply`,
/// so [listenForInlineReplies] comes first. The first reply left for later ends the run
/// unanswered, with the rest: answers false then, true once every reply was answered. Never
/// throws.
Future<bool> sendQueuedInlineReplies(
  Future<InlineReplyOutcome> Function(Map<String, dynamic> data) send, {
  MethodChannel channel = notificationsChannel,
}) async {
  List<Object?>? queued;
  try {
    queued = await channel.invokeMethod<List<Object?>>('takeInlineReplies');
  } catch (e) {
    debugPrint('inline notification replies unavailable: $e');
  }
  for (final item in queued ?? const <Object?>[]) {
    if (item is! Map) continue;
    final data = Map<String, dynamic>.from(item);
    final outcome = await send(data);
    if (outcome == InlineReplyOutcome.later) return false;
    final id = data['id'];
    if (id is String && id.isNotEmpty) {
      try {
        await channel.invokeMethod<void>('inlineReplyDone', {
          'id': id,
          'ok': outcome == InlineReplyOutcome.sent,
        });
      } catch (e) {
        debugPrint('inline notification reply not confirmed: $e');
      }
    }
  }
  return true;
}

/// The headless engine's work (`inlineReplyMain`, started by AppDelegate.swift when a reply is
/// typed while Casama isn't running): connects with the saved sign-in, sends the queue the same
/// way the app does, and answers replies typed meanwhile. Native code stops the engine once
/// everything it handed over is answered.
///
/// [connect] answers the backend, null when nobody is signed in (each reply is then answered as
/// not sent and dropped, as in the app), or throws when it can't connect. A reply that is dropped
/// in the app (signed out, refused by the server) is dropped here too. With no connection (to
/// start, or for a reply) nothing more is sent: `stopInlineReplies` tells native code to stop the
/// engine and keep what's left queued for the next start, as before this engine existed.
Future<void> runHeadlessInlineReplies(
  Future<Backend?> Function() connect, {
  MethodChannel channel = notificationsChannel,
  Duration timeout = const Duration(seconds: 20),
}) async {
  var stopped = false;
  Future<void> stop() async {
    if (stopped) return;
    stopped = true;
    try {
      await channel.invokeMethod<void>('stopInlineReplies');
    } catch (_) {}
  }

  Backend? backend;
  try {
    backend = await connect().timeout(timeout);
  } catch (e) {
    debugPrint('inline notification replies: no connection: $e');
    await stop();
    return;
  }
  Future<InlineReplyOutcome> send(Map<String, dynamic> data) =>
      deliverInlineReply(backend, data);
  listenForInlineReplies((data) async {
    final outcome = await send(data);
    if (outcome != InlineReplyOutcome.later) {
      return outcome == InlineReplyOutcome.sent;
    }
    unawaited(stop());
    return inlineReplyLater;
  }, channel: channel);
  if (!await sendQueuedInlineReplies(send, channel: channel)) await stop();
}
