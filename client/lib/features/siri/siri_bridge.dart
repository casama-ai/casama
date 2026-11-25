import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/analytics.dart';
import '../../core/plain_text.dart';
import '../../core/providers.dart';
import '../../core/router.dart';
import '../../core/shortcuts.dart' show askPath;
import '../../l10n/generated/app_localizations.dart';
import '../app_lock/app_lock.dart';
import '../inbox/for_you.dart' show forYouProvider, needsYouCountProvider;
import '../skills/skill_proposals.dart' show skillProposalsProvider;
import '../island/island_feed.dart';
import '../island/island_settings.dart' show islandAskBotProvider;
import '../island/run_tracker.dart';
import 'siri_index.dart';

/// Siri and Shortcuts acting through the app (docs/SIRI-AI-PLAN.md, D-564, §6.1): the App Intents in
/// `client/ios/Siri/` (compiled into the iPhone and Mac apps) hand a small map to Dart over
/// `casama/siri` and wait for the answer, so Siri acts as the signed-in person with every check the
/// app already makes. No key that can act lives in native code (decision 1).
///
/// Native → Dart:
/// - `ask` (`bot_id` may be empty, `text`, `wait_ms`, `request_id`): a new chat with the bot
///   (decision 3), the message sent, then up to `wait_ms` for the reply. Answers `status`, `say`
///   (what Siri speaks, from app_en.arb), and when allowed `text`, `bot`, `bot_id`,
///   `conversation_id`, `run_id`; `open` when the app must come forward to finish.
/// - `send` (Phase 3, iOS 27's Messages schema: `bot_id`, `text`, `request_id`): the words sent to
///   the bot in a new chat, without waiting for the reply (it arrives as a push). Answers `sent`
///   with `conversation_id`, `message_id` and `title`, or another status with `say` and `open`.
/// - `run` (`routine_id` as `<routine>:<bot>`, `name`): runs a routine now.
/// - `needs`: what needs the person, as one sentence.
/// - `ping` (Phase 0): answers at once, so native code can time how long Dart took to come up.
///
/// Dart → native `ready`: Dart listens now (native holds intents until then, ten seconds at most).
const siriChannelName = 'casama/siri';

/// How each ask ended (`status`), as Siri's words and `siri_action` name them (plan §5, §15).
abstract final class SiriStatus {
  static const replied = 'replied';

  /// Phase 3's Send: the words went to the bot; its reply comes as a notification.
  static const sent = 'sent';
  static const working = 'working';
  static const needsYou = 'needs_you';
  static const hidden = 'hidden';
  static const noCredits = 'no_credits';
  static const offline = 'offline';
  static const signedOut = 'signed_out';
  static const limited = 'limited';
  static const openApp = 'opened_app';
  static const failed = 'failed';

  /// Gemini only (D-567): Settings → Privacy → Let Gemini use Casama is off on this phone.
  static const off = 'off';
}

/// Siri may call an intent again; an id seen in the last minute gets the first answer.
const siriRepeatWindow = Duration(minutes: 1);

/// At most this many asks a minute from Siri, so a model that loops can't burn credits (§6.1).
const siriAsksPerMinute = 5;

/// The longest reply handed to Siri: it is spoken, and it becomes input to Siri's model (§9).
const siriReplyMax = 1200;

/// How long Siri's actions wait for the workspace to load after a cold start (the bots, what needs
/// the person): iOS may have started the app for this one request.
const siriLoadWait = Duration(seconds: 8);

/// How long an ask may wait for the reply when native code doesn't say. Phase 0 measures Siri's
/// real limit; native passes that, less a margin.
const siriDefaultWait = Duration(seconds: 20);

/// Counts one action (`siri_action`, or `gemini_action` for the Android functions): the action, how
/// it ended and the wait in seconds. Never any words.
typedef AssistantActionLog = void Function(String action, String outcome, [num? waitS]);

/// The same bridge serves Gemini's AppFunctions on Android (docs/ANDROID-APPFUNCTIONS-PLAN.md §7.2,
/// D-567) over `casama/app_functions`: one set of actions with one meaning (plan §5). Gemini's
/// replies may be longer ([replyMax]), are counted as `gemini_action` ([onAction]), and [allowed]
/// is its Settings switch.
class SiriBridge {
  SiriBridge(
    this._ref,
    this._channel, {
    DateTime Function()? now,
    this.poll = const Duration(seconds: 1),
    this.onAction = Analytics.siriAction,
    this.replyMax = siriReplyMax,
    this.allowed,
  }) : _now = now ?? DateTime.now;

  final Ref _ref;
  final MethodChannel _channel;
  final DateTime Function() _now;

  /// How often a waiting ask checks its run.
  final Duration poll;

  /// Where each action is counted.
  final AssistantActionLog onAction;

  /// The longest reply handed over.
  final int replyMax;

  /// Whether the assistant may act at all (null: always). When false, every action answers
  /// [SiriStatus.off].
  final FutureOr<bool> Function()? allowed;

  final _seen = <String, ({DateTime at, Future<Map<String, Object?>> answer})>{};
  final _asks = <DateTime>[];

  void start() {
    _channel.setMethodCallHandler(handle);
    unawaited(_channel.invokeMethod<void>('ready').catchError((_) {}));
  }

  void dispose() => _channel.setMethodCallHandler(null);

  AppLocalizations get _l10n => _ref.read(islandL10nProvider);

  /// Answers one call from native code. Public for tests.
  Future<Object?> handle(MethodCall call) async {
    final args = call.arguments is Map ? Map<String, Object?>.from(call.arguments as Map) : const <String, Object?>{};
    final gate = allowed;
    if (gate != null && const {'ask', 'send', 'run', 'needs'}.contains(call.method) && !await gate()) {
      return _answer(call.method, SiriStatus.off, _l10n.geminiOff);
    }
    switch (call.method) {
      case 'ping':
        return {'ok': true};
      case 'ask':
        return _remembered(args, () => _ask(args));
      case 'send':
        return _remembered(args, () => _send(args));
      case 'run':
        return _remembered(args, () => _run(args));
      case 'needs':
        return _needs();
    }
    return null;
  }

  Future<Map<String, Object?>> _remembered(Map<String, Object?> args, Future<Map<String, Object?>> Function() act) {
    final now = _now();
    _seen.removeWhere((_, v) => now.difference(v.at) > siriRepeatWindow);
    final id = args['request_id'];
    if (id is! String || id.isEmpty) return act();
    final earlier = _seen[id];
    if (earlier != null) return earlier.answer;
    final answer = act();
    _seen[id] = (at: now, answer: answer);
    return answer;
  }

  bool get _signedIn => _ref.read(backendProvider).userId != null;

  /// The app lock is on for this person, or a workspace asks for it (D-375): Siri doesn't act or
  /// read out in place; the app opens behind its lock screen, as widgets do (decision 4, §4.3).
  bool get _locked {
    if (_ref.read(appLockRequiredByProvider) != null) return true;
    return _ref.read(appLockSettingsProvider).activeFor(_ref.read(backendProvider).userId);
  }

  /// Hide reply text (D-325) is on, or can't be read: Siri says a bot replied, never what (§4.3).
  Future<bool> _hideReplies() async {
    try {
      return (await _ref.read(backendProvider).pushPrefs()).hideReplyText;
    } catch (_) {
      return true;
    }
  }

  List<Bot> get _bots => [
    for (final b in _ref.read(botsProvider).value ?? const <Bot>[])
      if (b.status != BotStatusEnum.disabled) b,
  ];

  /// Waits (up to [siriLoadWait]) for [provider] to have a value: after a cold start Siri's request
  /// can arrive before the workspace has loaded. Errors and slowness leave what is there.
  Future<void> _loaded<T>(AsyncValue<T> now, Future<T> Function() future) async {
    if (now.hasValue) return;
    try {
      await future().timeout(siriLoadWait);
    } catch (_) {}
  }

  /// The workspaces first: until they load, the bots list answers an empty list for no workspace,
  /// then reloads with the real one. A cold Gemini call landed in that gap and only opened the app
  /// (build 101).
  Future<void> _botsLoaded() async {
    await _loaded(_ref.read(organizationsProvider), () => _ref.read(organizationsProvider.future));
    // Still loading with the earlier (empty) list counts as not loaded yet.
    final bots = _ref.read(botsProvider);
    if (bots.hasValue && !bots.isLoading) return;
    try {
      await _ref.read(botsProvider.future).timeout(siriLoadWait);
    } catch (_) {}
  }

  /// The bot to ask: the one named, else the one Quick ask would use (decision 6), the bot talked
  /// to last, else the first.
  Bot? _botFor(String? id) {
    final bots = _bots;
    if (id != null && id.isNotEmpty) return bots.where((b) => b.id == id).firstOrNull;
    final saved = _ref.read(islandAskBotProvider);
    return bots.where((b) => b.id == saved).firstOrNull ?? bots.firstOrNull;
  }

  Map<String, Object?> _answer(
    String action,
    String status,
    String say, {
    String? open,
    DateTime? started,
    Map<String, Object?> extra = const {},
  }) {
    final waited = started == null ? null : _now().difference(started).inMilliseconds / 1000;
    onAction(action, open != null && status != SiriStatus.needsYou && status != SiriStatus.hidden ? SiriStatus.openApp : status, waited);
    return {'status': status, 'say': say, 'open': ?open, ...extra};
  }

  Future<Map<String, Object?>> _ask(Map<String, Object?> args) async {
    final started = _now();
    final text = args['text'] is String ? (args['text'] as String).trim() : '';
    final botId = args['bot_id'] is String ? args['bot_id'] as String : null;
    final l10n = _l10n;
    if (!_signedIn) return _answer('ask', SiriStatus.signedOut, l10n.siriSignedOut, open: '/');
    await _botsLoaded();
    final bot = _botFor(botId);
    final fallback = askPath(botId: bot?.id, text: text);
    if (_locked) return _answer('ask', SiriStatus.openApp, l10n.siriOpenToFinish, open: fallback);
    if (bot == null || text.isEmpty) return _answer('ask', SiriStatus.openApp, l10n.siriOpenToFinish, open: fallback);
    // A model that loops can't spend someone's credits: the sixth ask in a minute opens the app.
    _asks.removeWhere((t) => started.difference(t) > const Duration(minutes: 1));
    if (_asks.length >= siriAsksPerMinute) return _answer('ask', SiriStatus.limited, l10n.siriTooMany, open: fallback);
    _asks.add(started);

    final backend = _ref.read(backendProvider);
    final String conversationId;
    final String runId;
    try {
      final c = await backend.createConversation(bot.id);
      final requestId = args['request_id'];
      final sent = await backend.send(c.id, text, idempotencyKey: requestId is String && requestId.isNotEmpty ? requestId : null);
      conversationId = c.id;
      runId = sent.runId;
    } catch (e) {
      final status = _failure(e);
      return _answer('ask', status, _sayFailure(status), open: status == SiriStatus.failed ? fallback : null, started: started);
    }
    if (_ref.mounted) {
      // Followed like a run started here: the Live Activity and the reply push carry on (§5).
      _ref.read(runTrackerProvider.notifier).startedHere(runId, botId: bot.id, conversationId: conversationId);
      unawaited(_ref.read(islandAskBotProvider.notifier).set(bot.id));
    }
    final chat = '/bots/${bot.id}/chat?c=$conversationId';
    final ids = {'bot': bot.name, 'bot_id': bot.id, 'conversation_id': conversationId, 'run_id': runId};

    final waitMs = args['wait_ms'] is int ? args['wait_ms'] as int : siriDefaultWait.inMilliseconds;
    final deadline = started.add(Duration(milliseconds: waitMs.clamp(0, 60000)));
    RunStatus? status;
    while (true) {
      try {
        status = (await backend.run(runId)).status;
      } catch (_) {
        status = null;
      }
      if (status != null && status != RunStatus.queued && status != RunStatus.running) break;
      if (!_now().add(poll).isBefore(deadline)) break;
      await Future<void>.delayed(poll);
    }
    switch (status) {
      case RunStatus.waitingApproval || RunStatus.waitingTakeover:
        return _answer('ask', SiriStatus.needsYou, l10n.siriNeedsYou(bot.name), open: chat, started: started, extra: ids);
      case RunStatus.failed || RunStatus.cancelled:
        return _answer('ask', SiriStatus.failed, l10n.siriBotFailed(bot.name), open: chat, started: started, extra: ids);
      case RunStatus.completed:
        if (_locked || await _hideReplies()) {
          return _answer('ask', SiriStatus.hidden, l10n.siriRepliedHidden(bot.name), open: chat, started: started, extra: ids);
        }
        final reply = await _reply(conversationId, runId);
        if (reply == null) {
          return _answer('ask', SiriStatus.hidden, l10n.siriRepliedHidden(bot.name), open: chat, started: started, extra: ids);
        }
        return _answer('ask', SiriStatus.replied, reply, started: started, extra: {...ids, 'text': reply, 'answered_by': l10n.siriAnsweredBy(bot.name)});
      default:
        return _answer('ask', SiriStatus.working, l10n.siriStillWorking(bot.name), started: started, extra: ids);
    }
  }

  /// Phase 3 (§6.7): Siri's Send, in the person's own words. The same checks as an ask, but the
  /// bot must be named, and nothing waits for the reply.
  Future<Map<String, Object?>> _send(Map<String, Object?> args) async {
    final started = _now();
    final text = args['text'] is String ? (args['text'] as String).trim() : '';
    final botId = args['bot_id'] is String ? args['bot_id'] as String : '';
    final l10n = _l10n;
    if (!_signedIn) return _answer('send', SiriStatus.signedOut, l10n.siriSignedOut, open: '/');
    await _botsLoaded();
    final bot = botId.isEmpty ? null : _botFor(botId);
    final fallback = askPath(botId: bot?.id, text: text);
    if (_locked || bot == null || text.isEmpty) return _answer('send', SiriStatus.openApp, l10n.siriOpenToFinish, open: fallback);
    _asks.removeWhere((t) => started.difference(t) > const Duration(minutes: 1));
    if (_asks.length >= siriAsksPerMinute) return _answer('send', SiriStatus.limited, l10n.siriTooMany, open: fallback);
    _asks.add(started);
    final backend = _ref.read(backendProvider);
    try {
      final c = await backend.createConversation(bot.id);
      final requestId = args['request_id'];
      final sent = await backend.send(c.id, text, idempotencyKey: requestId is String && requestId.isNotEmpty ? requestId : null);
      if (_ref.mounted) {
        _ref.read(runTrackerProvider.notifier).startedHere(sent.runId, botId: bot.id, conversationId: c.id);
        unawaited(_ref.read(islandAskBotProvider.notifier).set(bot.id));
      }
      return _answer('send', SiriStatus.sent, l10n.siriStillWorking(bot.name), extra: {
        'bot': bot.name,
        'bot_id': bot.id,
        'conversation_id': c.id,
        'message_id': sent.messageId,
        'run_id': sent.runId,
        'title': bot.name,
      });
    } catch (e) {
      final status = _failure(e);
      return _answer('send', status, _sayFailure(status), open: status == SiriStatus.failed ? fallback : null);
    }
  }

  /// The run's reply as plain words for speech, cut to [siriReplyMax].
  Future<String?> _reply(String conversationId, String runId) async {
    try {
      final messages = await _ref.read(backendProvider).messages(conversationId, limit: 10);
      final mine = messages.where((m) => m.role == 'assistant' && m.runId == runId && m.text.trim().isNotEmpty).toList();
      final last = mine.lastOrNull ?? messages.where((m) => m.role == 'assistant' && m.text.trim().isNotEmpty).lastOrNull;
      if (last == null) return null;
      return siriSpeakable(last.text, max: replyMax);
    } catch (_) {
      return null;
    }
  }

  String _failure(Object e) {
    if (e is DioException) {
      if (e.response?.statusCode == 402) return SiriStatus.noCredits;
      if (e.response == null) return SiriStatus.offline;
    }
    return SiriStatus.failed;
  }

  String _sayFailure(String status) => switch (status) {
    SiriStatus.noCredits => _l10n.siriNoCredits,
    SiriStatus.offline => _l10n.siriOffline,
    _ => _l10n.siriOpenToFinish,
  };

  Future<Map<String, Object?>> _run(Map<String, Object?> args) async {
    final l10n = _l10n;
    final id = args['routine_id'] is String ? args['routine_id'] as String : '';
    final name = args['name'] is String ? args['name'] as String : '';
    final parts = id.split(':');
    final open = '/run-routine/$id';
    if (!_signedIn) return _answer('run', SiriStatus.signedOut, l10n.siriSignedOut, open: '/');
    if (parts.length != 2 || parts.any((p) => p.isEmpty) || _locked) {
      return _answer('run', SiriStatus.openApp, l10n.siriOpenToFinish, open: open);
    }
    try {
      final runId = await _ref.read(backendProvider).runRoutine(parts[0]);
      if (_ref.mounted) _ref.read(runTrackerProvider.notifier).startedHere(runId, botId: parts[1]);
      return _answer('run', SiriStatus.working, l10n.siriRoutineStarted(name), extra: {'run_id': runId});
    } catch (e) {
      final status = _failure(e);
      return _answer('run', status, _sayFailure(status), open: status == SiriStatus.failed ? open : null);
    }
  }

  Future<Map<String, Object?>> _needs() async {
    final l10n = _l10n;
    if (!_signedIn) return _answer('needs', SiriStatus.signedOut, l10n.siriSignedOut, open: '/');
    // A cold start: count only once each part has loaded, never a false "nothing needs you".
    await Future.wait([
      _loaded(_ref.read(approvalsProvider), () => _ref.read(approvalsProvider.future)),
      _loaded(_ref.read(takeoversProvider), () => _ref.read(takeoversProvider.future)),
      _loaded(_ref.read(forYouProvider), () => _ref.read(forYouProvider.future)),
      _loaded(_ref.read(skillProposalsProvider), () => _ref.read(skillProposalsProvider.future)),
    ]);
    if (!_ref.mounted) return _answer('needs', SiriStatus.failed, l10n.siriOpenToFinish, open: '/inbox');
    final count = _ref.read(needsYouCountProvider);
    if (count == 0) return _answer('needs', SiriStatus.replied, l10n.siriNothingNeedsYou);
    final parts = [l10n.siriThingsNeedYou(count)];
    // Bot names only, and only while the app may say more than a count (§4.3).
    if (!_locked) {
      final waiting = _ref.read(islandFeedProvider).where((i) => i.phase == IslandPhase.needsOk).map((i) => i.bot).toSet();
      if (waiting.isNotEmpty) parts.add(l10n.siriNeedsYouBots(waiting.take(2).join(', ')));
    }
    return _answer('needs', SiriStatus.replied, parts.join(' '), open: '/inbox');
  }
}

/// [markdown] as words Siri can speak: Markdown and code go, and a long reply is cut at a sentence
/// near [max] ([siriReplyMax] unless given).
String siriSpeakable(String markdown, {int max = siriReplyMax}) {
  final plain = plainPreview(markdown);
  if (plain.length <= max) return plain;
  final cut = plain.substring(0, max);
  final end = cut.lastIndexOf(RegExp(r'[.!?]\s'));
  return '${end > max ~/ 2 ? cut.substring(0, end + 1) : cut.trimRight()}…';
}

/// The live bridge on iPhone and Mac; null elsewhere.
final siriBridgeProvider = Provider<SiriBridge?>((ref) {
  if (kIsWeb || (defaultTargetPlatform != TargetPlatform.iOS && defaultTargetPlatform != TargetPlatform.macOS)) {
    return null;
  }
  final bridge = SiriBridge(ref, const MethodChannel(siriChannelName))..start();
  ref.onDispose(bridge.dispose);
  // What is on screen (Phase 2, §6.5): the bot or chat open, while Spotlight and Siri may know.
  final delegate = ref.read(routerProvider).routerDelegate;
  void follow() {
    final allowed = ref.read(siriIndexAllowedProvider);
    unawaited(siriScreen(allowed ? siriScreenFor(delegate.currentConfiguration.uri) : null));
  }
  delegate.addListener(follow);
  ref.onDispose(() => delegate.removeListener(follow));
  ref.listen(siriIndexAllowedProvider, (_, _) => follow());
  return bridge;
});
