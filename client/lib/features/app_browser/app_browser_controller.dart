import 'dart:async';
import 'dart:convert';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' show FocusManager;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/analytics.dart';
import '../../core/chat_focus.dart';
import '../../core/haptics.dart';
import '../../core/providers.dart';
import '../../core/screen_awake.dart';
import '../../ui/bot_cursor.dart';
import 'app_browser_background.dart';
import 'app_browser_channel.dart';
import 'app_browser_flag.dart';
import 'app_browser_overlay_guard.dart';
import 'app_browser_service.dart';
import 'app_browser_sites.dart';
import 'app_browser_socket.dart';

/// Where a bot's use of the phone browser is (PROTOCOL.md §1, plan §4).
enum AppBrowserPhase {
  /// No bot is using it (the page may still be there).
  idle,

  /// A bot is driving the page.
  working,

  /// A site ask or a step ask is waiting for the person.
  asking,

  /// The bot handed the page to the person ("Your turn").
  yourTurn,

  /// The person touched the page or tapped Take Over: the bot waits for Hand Back.
  tookOver,

  /// The run's chat left the screen (or the app went to the background) while a bot was using it.
  away,
}

enum AppBrowserAskKind { site, step }

/// What the person is being asked.
class AppBrowserAsk {
  const AppBrowserAsk.site({
    required this.botName,
    required String this.host,
    this.siteKind,
    this.conversationId,
  }) : kind = AppBrowserAskKind.site,
       reason = null,
       step = null,
       name = null;

  const AppBrowserAsk.step({
    required this.botName,
    this.reason,
    this.step,
    this.name,
    this.conversationId,
  }) : kind = AppBrowserAskKind.step,
       host = null,
       siteKind = null;

  final AppBrowserAskKind kind;
  final String botName;
  final String? conversationId;

  /// A site ask: the site, and the off-by-default kind when one was switched back on.
  final String? host;
  final String? siteKind;

  /// A step ask: why the server asks (`args.reason`), the step ("click", "fill", "press") and the
  /// element's name.
  final String? reason;
  final String? step;
  final String? name;
}

/// The person's answer to a site ask.
enum AppBrowserSiteAnswer { once, always, never }

/// What the phone browser shows: who is using it, where it is, what is asked.
@immutable
class AppBrowserSession {
  const AppBrowserSession({
    this.phase = AppBrowserPhase.idle,
    this.run,
    this.url,
    this.title = '',
    this.loading = false,
    this.canGoBack = false,
    this.canGoForward = false,
    this.ask,
    this.handoffReason,
    this.person = false,
    this.doneRun,
  });

  final AppBrowserPhase phase;

  /// The run using the page; null when no bot is.
  final AppBrowserRun? run;
  final String? url;
  final String title;
  final bool loading;
  final bool canGoBack;
  final bool canGoForward;
  final AppBrowserAsk? ask;

  /// What "Your turn" says (`args.reason` of a handoff).
  final String? handoffReason;

  /// The person is browsing by hand (Sign In to a Site): no bot, only the first two gate steps.
  final bool person;

  /// The run that just finished driving the page on its own (its reply ended; not Stop, not away),
  /// until the person answers the full view's "done" card or another run starts.
  final AppBrowserRun? doneRun;

  /// A bot is using the page now (working, asking, handed it over, or paused by the person).
  bool get botActive =>
      run != null &&
      (phase == AppBrowserPhase.working ||
          phase == AppBrowserPhase.asking ||
          phase == AppBrowserPhase.yourTurn ||
          phase == AppBrowserPhase.tookOver);

  String? get conversationId => run?.conversationId;
  String? get host {
    final u = url;
    if (u == null || u == 'about:blank') return null;
    final h = hostOf(u);
    return h == null || h.isEmpty ? null : h;
  }

  bool get secure => url?.toLowerCase().startsWith('https://') ?? false;

  AppBrowserSession copyWith({
    AppBrowserPhase? phase,
    AppBrowserRun? run,
    bool clearRun = false,
    String? url,
    bool clearUrl = false,
    String? title,
    bool? loading,
    bool? canGoBack,
    bool? canGoForward,
    AppBrowserAsk? ask,
    bool clearAsk = false,
    String? handoffReason,
    bool clearHandoff = false,
    bool? person,
    AppBrowserRun? doneRun,
    bool clearDone = false,
  }) => AppBrowserSession(
    phase: phase ?? this.phase,
    run: clearRun ? null : run ?? this.run,
    url: clearUrl ? null : url ?? this.url,
    title: title ?? this.title,
    loading: loading ?? this.loading,
    canGoBack: canGoBack ?? this.canGoBack,
    canGoForward: canGoForward ?? this.canGoForward,
    ask: clearAsk ? null : ask ?? this.ask,
    handoffReason: clearHandoff ? null : handoffReason ?? this.handoffReason,
    person: person ?? this.person,
    doneRun: clearDone ? null : doneRun ?? this.doneRun,
  );
}

/// How long the phone waits for the person and the page (PROTOCOL.md §1).
class AppBrowserTimings {
  const AppBrowserTimings({
    this.ask = const Duration(minutes: 5),
    this.takeOver = const Duration(minutes: 8),
    this.settle = const Duration(seconds: 15),
    this.dialog = const Duration(seconds: 30),
    this.commandMs = 30000,
    this.cursorBeat = const Duration(milliseconds: 250),
  });

  /// A site or step ask with no answer counts as no.
  final Duration ask;

  /// Calls wait this long for Hand Back after the person took over.
  final Duration takeOver;

  /// `open` waits this long for the page to settle.
  final Duration settle;

  /// A page dialog the bot doesn't answer is dismissed.
  final Duration dialog;
  final int commandMs;

  /// A step waits this long after the bot's cursor is told where it lands, so the cursor is seen
  /// to arrive before the page changes (docs/BOT-CURSOR-PLAN.md §5).
  final Duration cursorBeat;
}

final appBrowserTimingsProvider = Provider<AppBrowserTimings>(
  (ref) => const AppBrowserTimings(),
);

/// The lists shipped with the app (PROTOCOL.md §2).
final appBrowserGuardProvider = FutureProvider<AppBrowserGuard>(
  (ref) => AppBrowserGuard.load(),
);

/// Hosts the server added to the kinds without a release; none when the server can't say.
final appBrowserExtraSitesProvider = FutureProvider<Map<String, List<String>>>(
  (ref) => ref
      .watch(backendProvider)
      .browserGuardSites()
      .catchError((_) => const <String, List<String>>{}),
);

/// The conversation on screen in this app now (null when no chat is open or the app is behind).
final appBrowserFocusProvider = Provider<String? Function()>((ref) {
  final focus = ref.watch(chatFocusProvider);
  return () => focus.conversation;
});

/// Page-script codes passed through to the bot as they are.
const _passThroughCodes = {
  'stale_ref',
  'covered',
  'page_changed',
  'not_editable',
  'not_file_input',
  'too_large',
  'out_of_sight',
  'unsupported',
};

/// Runs the phone browser: answers the server's calls (PROTOCOL.md §1's table), runs the site gate
/// before pages load, asks the person, and pauses when they take over. Native's events come here
/// (it is the channel's handler).
class AppBrowserController extends Notifier<AppBrowserSession>
    implements AppBrowserNativeEvents {
  late AppBrowserChannel _channel;
  AppSitePolicy _policy = const AppSitePolicy();
  AppBrowserSupport? _support;

  // The run using the page, and the sites the person answered "once" in it.
  String? _runId;
  final _once = <String>[];
  final _stopped = <String>{};
  // Completed by Stop, so a step still running (a 30 s wait) answers at once.
  var _stopSignal = Completer<void>();
  final _addedAllowed = <String>{};
  final _addedBlocked = <String>{};

  Completer<String>? _askAnswer;
  Future<void> _askQueue = Future.value();
  Completer<bool>? _handBack;
  Completer<_Nav>? _nav;
  ({String kind, String message})? _dialog;
  Timer? _dialogTimer;
  DateTime? _ownTapAt;
  var _pageLost = false;
  var _seq = 0;

  /// The bot's cursor over the page (docs/BOT-CURSOR-PLAN.md §5): the screen draws it above the
  /// web area, never inside the page. Its spots are the page's own points, which are the web
  /// area's points too.
  /// No idle clock: it stays while the bot drives the page, however long it thinks between steps,
  /// and leaves when the phase does.
  final cursor = BotCursorController(idleLeave: null);

  @override
  AppBrowserSession build() {
    _channel = ref.watch(appBrowserChannelProvider);
    _channel.setHandler(this);
    ref.onDispose(() {
      _channel.setHandler(null);
      _dialogTimer?.cancel();
      _endRun(answer: 'away');
      cursor.dispose();
      unawaited(ScreenAwake.set(false, by: 'browser'));
    });
    return const AppBrowserSession();
  }

  AppBrowserTimings get _timings => ref.read(appBrowserTimingsProvider);

  void _set(AppBrowserSession s) {
    // The cursor is there only while the bot is the one driving the page, from the moment it
    // starts (resting in the middle until its first click), not just from its first click.
    if (s.phase != AppBrowserPhase.working) cursor.leave();
    // The soft keyboard opens only once the person has the page: shut while the bot drives it or
    // asks, open on Take Over and "Your turn". Idle and away leave it as it is (a real touch opens
    // it natively).
    if (s.phase != state.phase) {
      final allowed = switch (s.phase) {
        AppBrowserPhase.working || AppBrowserPhase.asking => false,
        AppBrowserPhase.tookOver || AppBrowserPhase.yourTurn => true,
        _ => null,
      };
      if (allowed != null) {
        unawaited(
          _channel.keyboard(allowed: allowed).then((_) {}, onError: (_) {}),
        );
      }
    }
    // The screen stays on while a bot works the page or waits on the person, who is only
    // watching and not touching it: a phone locking itself would send the run away. Not while
    // the person has taken over (they are touching it) or once the run is over or away.
    unawaited(
      ScreenAwake.set(
        s.botActive && s.phase != AppBrowserPhase.tookOver,
        by: 'browser',
      ),
    );
    final bgChanged =
        s.botActive != state.botActive ||
        s.host != state.host ||
        s.run?.id != state.run?.id;
    if (ref.mounted) state = s;
    if (bgChanged) syncBackgroundConfig();
    // After the state, so the layers drawing it read this run's bot name.
    if (s.phase == AppBrowserPhase.working) cursor.enter();
  }

  /// Syncs current browser task metadata to native Android so `MainActivity.onPause` can start
  /// `AppBrowserKeepAlive` immediately while leaving a user-visible state (plan §5, §7).
  void syncBackgroundConfig([String? stepLabel]) {
    if (!ref.mounted ||
        !kAppBrowserBg ||
        kIsWeb ||
        defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    final keepGoing = ref.read(appBrowserKeepGoingProvider);
    final run = state.run;
    final active = state.botActive && run != null;
    final linkPath = run?.conversationId != null
        ? '/bots/${run!.botId}/chat?c=${run.conversationId}'
        : run != null
        ? '/bots/${run.botId}/chat'
        : '/';
    unawaited(
      _channel
          .backgroundConfig(
            active: active,
            keepGoing: keepGoing,
            runId: run?.id,
            bot: run?.botName.isNotEmpty == true ? run!.botName : 'Casama',
            site: state.host ?? '',
            step: stepLabel ?? 'Working in your browser',
            link: linkPath,
          )
          .then((_) {}, onError: (_) {}),
    );
  }

  /// Shows the cursor at a spot the page script located, then waits the beat so it is seen to
  /// land first. Nothing when the spot isn't a sensible one.
  Future<void> _pointAt(Map<String, dynamic> at, BotCursorAct act) async {
    final x = at['x'], y = at['y'];
    if (at['ok'] != true || x is! num || y is! num || x < 0 || y < 0) return;
    cursor.pointTo(
      Offset(x.toDouble(), y.toDouble()),
      of: Size.zero,
      act: act,
    );
    final beat = _timings.cursorBeat;
    if (beat > Duration.zero) await Future<void>.delayed(beat);
  }

  /// The paired device whose lists "Always" and "Never" change (the service keeps it current).
  LocalDevice? device;

  /// Attached by [AppBrowserService] when running in the app (null in standalone controller tests).
  AppBrowserService? backgroundService;

  /// What this phone's web area can do; asked once.
  Future<AppBrowserSupport> support() async =>
      _support ??= await _channel.supported();

  // --- the server's calls ---------------------------------------------------------------------

  /// Answers one call with a `BrowserResult`.
  Future<Map<String, Object?>> handle(AppBrowserCall call) async {
    final run = call.run;
    if (const {'console', 'network', 'page_text'}.contains(call.action)) {
      return _fail(
        'unsupported',
        "That isn't available in the browser inside Casama; use your own computer for it.",
      );
    }
    if (_stopped.contains(run.id)) return _stoppedFail();
    if (!_onScreen(run)) {
      if (_runId == run.id) _goAway();
      return _away();
    }
    if (_runId != run.id) _startRun(run);
    _policy = call.policy.plus(allowed: _addedAllowed, blocked: _addedBlocked);
    if (call.action != 'stop' &&
        call.action != 'handoff' &&
        _waitingForPerson) {
      if (!await _waitForHandBack(call)) {
        if (_stopped.contains(run.id)) return _stoppedFail();
        // The server stopped waiting for Hand Back (its five minutes ran out, or the run was
        // stopped, D-571): the page stays the person's, and the reply ending puts it back. Going
        // "away" would say the chat isn't open, which isn't so.
        if (call.isCancelled) {
          return _fail('away', 'The run stopped waiting for Hand Back.');
        }
        if (_runId == run.id) _goAway();
        return _fail(
          'away',
          "The person took over the page on their device and hasn't handed it back. Carry on with your own computer, or ask them.",
        );
      }
    }
    if (state.phase == AppBrowserPhase.idle ||
        state.phase == AppBrowserPhase.away ||
        state.run?.id != run.id) {
      _set(
        state.copyWith(
          phase: AppBrowserPhase.working,
          run: run,
          person: false,
          clearAsk: true,
          clearDone: true,
        ),
      );
    }
    final service = backgroundService;
    if (service != null) {
      service.background.noteStep(
        run.id,
        botName: run.botName,
        conversationId: run.conversationId,
        site: state.host,
      );
      if (service.backgroundKeepGoing) {
        service.resetBackgroundIdleTimer();
        final stepText = appBrowserStepLabel(call.action);
        if (!service.background.shouldThrottleNotify()) {
          unawaited(
            _channel
                .backgroundUpdate(step: stepText, site: state.host)
                .then((_) {}, onError: (_) {}),
          );
        }
        if (call.action == 'ask' || call.action == 'handoff') {
          final bot = run.botName.isNotEmpty ? run.botName : 'Casama';
          final linkPath = run.conversationId != null
              ? '/bots/${run.botId}/chat?c=${run.conversationId}'
              : '/bots/${run.botId}/chat';
          unawaited(
            _channel
                .backgroundNeedsYou(
                  title: '$bot needs you',
                  body:
                      (call.args['reason'] as String?) ??
                      'Open Casama to continue.',
                  link: linkPath,
                  tag: 'browser-wait-${run.id}',
                )
                .then((_) {}, onError: (_) {}),
          );
        }
      }
    }
    try {
      // Stop during a step ends it there: a wait that ran on would answer "waited" and the bot
      // would think the page was still there.
      return await Future.any([
        _dispatch(call),
        _stopSignal.future.then((_) => _stoppedFail()),
      ]);
    } on PlatformException catch (e) {
      return _fail('error', e.message ?? e.code);
    } on MissingPluginException {
      return _fail('unsupported', "This phone's app has no browser.");
    } catch (e) {
      return _fail('error', '$e');
    }
  }

  bool get _waitingForPerson =>
      ref.mounted && state.phase == AppBrowserPhase.tookOver ||
      state.phase == AppBrowserPhase.yourTurn;

  Future<Map<String, Object?>> _dispatch(AppBrowserCall call) async {
    final a = call.args;
    // Every step, a read or a wait too, shows the bot is still here.
    if (state.phase == AppBrowserPhase.working) cursor.keepAlive();
    switch (call.action) {
      case 'open':
        return _open('${a['url'] ?? ''}', call);
      case 'switch_tab':
        final url = a['url'] as String?;
        if (url != null && url.isNotEmpty) return _open(url, call);
        return _ok('There is one page in this browser.', url: state.url);
      case 'snapshot' || 'read' || 'extract' || 'scroll' || 'wait':
        if (_pageLost) return _lost();
        if (call.action == 'scroll') cursor.scroll(down: a['direction'] != 'up');
        return _pageResult(await _command(call.action, a));
      case 'url':
        final p = await _refreshPage();
        return _ok(p.url, url: p.url);
      case 'probe':
        if (_pageLost) return _lost();
        final r = await _command('probe', a);
        if (r['ok'] != true) return _pageFail(r);
        return _ok(
          jsonEncode({'facts': r['facts'], 'fingerprint': r['fingerprint']}),
        );
      case 'ask':
        final answer = await _askPerson(
          AppBrowserAsk.step(
            botName: call.run.botName,
            reason: a['reason'] as String?,
            step: a['step'] as String?,
            name: a['name'] as String?,
            conversationId: call.run.conversationId,
          ),
          call,
        );
        return _ok(switch (answer) {
          'allow' => 'allow',
          'timeout' => 'timeout',
          _ => 'deny',
        });
      case 'handoff':
        _handBack ??= Completer<bool>();
        Haptic.attention();
        _set(
          state.copyWith(
            phase: AppBrowserPhase.yourTurn,
            handoffReason: '${a['reason'] ?? ''}',
          ),
        );
        return _ok('shown');
      case 'click':
        return _click(call);
      case 'press' when _historyAction(a['key']) != null:
        return _history(_historyAction(a['key'])!, call);
      case 'fill' || 'type' || 'press':
        if (_pageLost) return _lost();
        if (call.action == 'fill' && a['ref'] != null) {
          // Where the field is, for the cursor only: the fill finds it again and reports any
          // problem itself.
          await _pointAt(
            await _command('locate', {
              'ref': a['ref'],
              'fingerprint': ?call.expect,
            }),
            BotCursorAct.typing,
          );
        } else {
          cursor.typing();
        }
        final typed = await _command(call.action, {
          ...a,
          'fingerprint': ?call.expect,
        });
        cursor.settle();
        return _pageResult(typed);
      case 'upload':
        if (_pageLost) return _lost();
        final file = (a['file'] as Map?)?.cast<String, dynamic>() ?? const {};
        return _pageResult(
          await _command('upload', {
            'ref': a['ref'],
            'name': file['name'],
            'media_type': file['media_type'],
            'data': file['data'],
          }),
        );
      case 'download':
        if (_pageLost) return _lost();
        final url = '${a['url'] ?? ''}';
        final gate = await _gateForBot(url, call);
        if (gate != null) return gate;
        final r = await _command('download', {'url': url});
        if (r['ok'] != true) return _pageFail(r);
        final file = (r['file'] as Map?)?.cast<String, dynamic>();
        return {
          'ok': true,
          'text': 'Downloaded ${file?['name'] ?? 'the file'}',
          'file': ?file,
        };
      case 'screenshot':
        final data = await _channel.screenshot(
          quality: (a['quality'] as num?)?.toInt() ?? 70,
        );
        if (data == null) {
          return _fail('error', 'There is no picture of the page yet.');
        }
        return {
          'ok': true,
          'text': '',
          'image': {'data': data, 'media_type': 'image/jpeg'},
        };
      case 'dialog':
        final d = _dialog;
        if (d == null) return _fail('error', 'No dialog is open on the page.');
        _dialog = null;
        _dialogTimer?.cancel();
        await _channel.answerDialog(
          accept: a['accept'] != false,
          text: a['text'] as String?,
        );
        return _ok('Answered the ${d.kind} "${d.message}".');
      case 'tabs':
        final p = await _refreshPage();
        return _ok('1: ${p.title} ${p.url} (current)', url: p.url);
      case 'stop':
        _set(
          state.copyWith(
            phase: AppBrowserPhase.idle,
            clearRun: true,
            clearAsk: true,
            clearHandoff: true,
          ),
        );
        return _ok('Done');
      default:
        return _fail(
          'unsupported',
          "The phone's browser can't do ${call.action}.",
        );
    }
  }

  Future<Map<String, Object?>> _open(String url, AppBrowserCall call) async {
    final gate = await _gateForBot(url, call);
    if (gate != null) return gate;
    _pageLost = false;
    final nav = _nav = Completer<_Nav>();
    _set(state.copyWith(url: url, loading: true));
    await _channel.load(url);
    final outcome = await _race(
      nav.future,
      _timings.settle,
      const _Nav.settled(),
      call.cancelled,
      const _Nav.settled(),
    );
    if (identical(_nav, nav)) _nav = null;
    if (outcome.refused != null) return _refusedResult(outcome.refused!);
    if (outcome.denied != null) {
      return _fail(
        'asked_denied',
        'The person said no to ${outcome.denied} on their device. Don\'t try it another way.',
      );
    }
    if (outcome.error != null) return _fail('error', outcome.error!);
    final p = await _refreshPage();
    return _ok('Opened ${p.title.isEmpty ? p.url : p.title}', url: p.url);
  }

  /// Keys a real browser handles itself: back, forward and reload. The page script only sends
  /// synthetic key events, and a browser never navigates on those, so a bot pressing Alt+Left
  /// went nowhere. These go to the web view instead.
  static String? _historyAction(Object? key) {
    final k = '${key ?? ''}'.replaceAll(' ', '').toLowerCase();
    return switch (k) {
      'alt+left' || 'alt+arrowleft' || 'browserback' || 'meta+[' || 'cmd+[' ||
      'command+[' || 'meta+arrowleft' || 'cmd+arrowleft' || 'cmd+left' => 'back',
      'alt+right' || 'alt+arrowright' || 'browserforward' || 'meta+]' || 'cmd+]' ||
      'command+]' || 'meta+arrowright' || 'cmd+arrowright' || 'cmd+right' => 'forward',
      'f5' || 'ctrl+r' || 'control+r' || 'meta+r' || 'cmd+r' || 'browserrefresh' => 'reload',
      _ => null,
    };
  }

  Future<Map<String, Object?>> _history(String action, AppBrowserCall call) async {
    if (_pageLost) return _lost();
    final before = await _refreshPage();
    if (action == 'back' && !before.canGoBack) {
      return _fail('error', 'There is no earlier page to go back to.');
    }
    if (action == 'forward' && !before.canGoForward) {
      return _fail('error', 'There is no later page to go forward to.');
    }
    final nav = _nav = Completer<_Nav>();
    _set(state.copyWith(loading: true));
    switch (action) {
      case 'back':
        await _channel.back();
      case 'forward':
        await _channel.forward();
      default:
        await _channel.reload();
    }
    final outcome = await _race(
      nav.future,
      _timings.settle,
      const _Nav.settled(),
      call.cancelled,
      const _Nav.settled(),
    );
    if (identical(_nav, nav)) _nav = null;
    if (outcome.refused != null) return _refusedResult(outcome.refused!);
    if (outcome.denied != null) {
      return _fail(
        'asked_denied',
        'The person said no to ${outcome.denied} on their phone. Don\'t try it another way.',
      );
    }
    if (outcome.error != null) return _fail('error', outcome.error!);
    final p = await _refreshPage();
    final where = p.title.isEmpty ? p.url : p.title;
    return _ok(
      switch (action) {
        'back' => 'Went back to $where',
        'forward' => 'Went forward to $where',
        _ => 'Reloaded $where',
      },
      url: p.url,
    );
  }

  Future<Map<String, Object?>> _click(AppBrowserCall call) async {
    if (_pageLost) return _lost();
    final a = call.args;
    final real = (await support()).realTaps;
    if (!real) {
      // For the cursor only: the click finds the element again and reports any problem itself.
      await _pointAt(
        await _command('locate', {
          'ref': a['ref'],
          'fingerprint': ?call.expect,
        }),
        BotCursorAct.click,
      );
      return _pageResult(
        await _command('click', {
          ...a,
          'fingerprint': ?call.expect,
          'synthetic': true,
        }),
      );
    }
    final at = await _command('locate', {
      'ref': a['ref'],
      'fingerprint': ?call.expect,
    });
    if (at['ok'] != true) return _pageFail(at);
    await _pointAt(at, BotCursorAct.click);
    if (_pageLost) return _lost();
    _ownTapAt = DateTime.now();
    await _channel.tap(
      (at['x'] as num).toDouble(),
      (at['y'] as num).toDouble(),
    );
    // No second question to the page: a tap that opens another page takes the script with it, and
    // the bot would be told a click that worked had failed.
    return _pageResult({'ok': true, 'text': at['text'] ?? 'Clicked.'});
  }

  /// The gate for a bot's step on [url]; null when it may go ahead, else the answer to send.
  Future<Map<String, Object?>?> _gateForBot(
    String url,
    AppBrowserCall call,
  ) async {
    final decision = await _decide(url);
    switch (decision) {
      case AppSiteAllowed():
        return null;
      case AppSiteRefused():
        return _refusedResult(decision);
      case AppSiteAsk(:final host, :final siteKind):
        final answer = await _askSite(host, siteKind, call.run, call);
        if (answer == AppBrowserSiteAnswer.once ||
            answer == AppBrowserSiteAnswer.always) {
          return null;
        }
        return _fail(
          'asked_denied',
          'The person said no to $host on their device. Don\'t try it another way.',
        );
    }
  }

  Map<String, Object?> _refusedResult(
    AppSiteRefused r,
  ) => _fail('refused', switch (r.why) {
    'not_web' => "The phone's browser opens web pages only (http or https).",
    'casama' => "Casama's own pages can't be opened in the browser inside Casama.",
    'blocked' => '${r.host} is on the never list; the phone won\'t open it.',
    _ =>
      '${r.host} is a ${r.why} site, which is off in the phone\'s browser unless the person turns it on.',
  });

  Future<AppSiteDecision> _decide(String url) async {
    final guard = await ref.read(appBrowserGuardProvider.future);
    final extra = await ref
        .read(appBrowserExtraSitesProvider.future)
        .catchError((_) => const <String, List<String>>{});
    return appSiteDecision(url, _policy, guard, once: _once, extra: extra);
  }

  // --- asks ------------------------------------------------------------------------------------

  Future<AppBrowserSiteAnswer?> _askSite(
    String host,
    String? siteKind,
    AppBrowserRun run, [
    AppBrowserCall? call,
  ]) async {
    final answer = await _askPerson(
      AppBrowserAsk.site(
        botName: run.botName,
        host: host,
        siteKind: siteKind,
        conversationId: run.conversationId,
      ),
      call,
    );
    final a = AppBrowserSiteAnswer.values
        .where((v) => v.name == answer)
        .firstOrNull;
    switch (a) {
      case AppBrowserSiteAnswer.once:
        _once.add(host);
      case AppBrowserSiteAnswer.always:
        _once.add(host);
        _addedAllowed.add(host);
        _policy = _policy.plus(allowed: [host]);
        unawaited(_saveSite(host, always: true));
      case AppBrowserSiteAnswer.never:
        _addedBlocked.add(host);
        _policy = _policy.plus(blocked: [host]);
        unawaited(_saveSite(host, always: false));
      case null:
        break;
    }
    return a;
  }

  /// Shows [ask] and waits for the person, up to the ask timeout ("timeout"), a cancelled call or
  /// the run ending ("away"). One ask at a time.
  Future<String> _askPerson(AppBrowserAsk ask, [AppBrowserCall? call]) {
    final turn = _askQueue.then((_) async {
      if (call != null && call.isCancelled) return 'away';
      final answer = _askAnswer = Completer<String>();
      final before = state.phase;
      _set(state.copyWith(phase: AppBrowserPhase.asking, ask: ask));
      final result = await _race(
        answer.future,
        _timings.ask,
        'timeout',
        call?.cancelled,
        'away',
      );
      if (identical(_askAnswer, answer)) _askAnswer = null;
      if (state.phase == AppBrowserPhase.asking) {
        _set(
          state.copyWith(
            phase: before == AppBrowserPhase.asking
                ? AppBrowserPhase.working
                : before,
            clearAsk: true,
          ),
        );
      }
      return result;
    });
    _askQueue = turn.then((_) {}, onError: (_) {});
    return turn;
  }

  /// The person's answer to the site ask on screen.
  void answerSite(AppBrowserSiteAnswer answer) => _answer(answer.name);

  /// The person's answer to the step ask on screen.
  void answerStep(bool allow) => _answer(allow ? 'allow' : 'deny');

  void _answer(String value) {
    final a = _askAnswer;
    if (a != null && !a.isCompleted) a.complete(value);
  }

  /// Saves [host] in this device's allowed (or blocked) sites; false when it didn't reach the
  /// server (no paired device, or the request failed).
  Future<bool> _saveSite(String host, {required bool always}) async {
    final d = device;
    if (d == null) return false;
    final allowed = [...?d.allowedSites];
    final blocked = [...?d.blockedSites];
    if (always) {
      blocked.remove(host);
      if (!allowed.contains(host)) allowed.add(host);
    } else {
      allowed.remove(host);
      if (!blocked.contains(host)) blocked.add(host);
    }
    try {
      device = await ref
          .read(backendProvider)
          .updateAppBrowser(d.id, allowedSites: allowed, blockedSites: blocked);
      return true;
    } catch (e) {
      debugPrint('phone browser: saving $host failed: $e');
      return false;
    }
  }

  /// Whether bots may already use [host] on this device: saved in its allowed sites, or allowed
  /// earlier in this session.
  bool siteAllowed(String host) => [
    ...?device?.allowedSites,
    ..._addedAllowed,
  ].any((p) => siteMatches(host, p));

  // --- the person's controls -------------------------------------------------------------------

  /// Take Over: the bot waits until Hand Back.
  void takeOver() {
    if (!ref.mounted || !state.botActive || _waitingForPerson) return;
    _handBack ??= Completer<bool>();
    _set(state.copyWith(phase: AppBrowserPhase.tookOver));
  }

  /// Hand Back: the bot carries on.
  void handBack() {
    if (!ref.mounted || !_waitingForPerson) return;
    final h = _handBack;
    _handBack = null;
    _set(state.copyWith(phase: AppBrowserPhase.working, clearHandoff: true));
    if (h != null && !h.isCompleted) h.complete(true);
  }

  /// Stop: the bot's run can't use the phone any more; the page stays.
  void stopBot() {
    final id = _runId;
    if (id == null || !ref.mounted) return;
    _stopped.add(id);
    _stopSignal.complete();
    _stopSignal = Completer<void>();
    _endRun(answer: 'away');
    unawaited(_channel.stop().catchError((_) {}));
    _set(
      state.copyWith(
        phase: AppBrowserPhase.idle,
        clearRun: true,
        clearAsk: true,
        clearHandoff: true,
        loading: false,
      ),
    );
  }

  /// The chat [conversationId] has no reply in progress any more: its run is over, however it
  /// ended (done, stopped, failed). The page stays; the "working" state and its card go.
  void runOver(String? conversationId) {
    if (!ref.mounted || conversationId == null) return;
    if (state.run?.conversationId != conversationId) return;
    if (!state.botActive && state.phase != AppBrowserPhase.away) return;
    // Finished while it had the page (not after it lost it): the full view says so.
    final done = state.botActive ? state.run : null;
    final host = state.host;
    final service = backgroundService;
    if (done != null && service != null && service.backgroundKeepGoing) {
      unawaited(service.finishBackgroundTask(done, host));
    }
    _endRun(answer: 'away');
    _set(
      state.copyWith(
        phase: AppBrowserPhase.idle,
        clearRun: true,
        clearAsk: true,
        clearHandoff: true,
        loading: false,
        doneRun: done,
      ),
    );
  }

  /// The person answered (or closed) the full view's "done" card.
  void dismissDone() {
    if (ref.mounted && state.doneRun != null) {
      _set(state.copyWith(clearDone: true));
    }
  }

  /// The chat [conversationId] left the screen: a run working from it is away.
  void leftChat(String? conversationId) {
    if (!ref.mounted) return;
    if (conversationId != null &&
        state.run?.conversationId == conversationId &&
        state.botActive) {
      _goAway();
    }
  }

  /// The socket closed (the app went behind, the feature was switched off): whatever waited is away.
  void disconnected() {
    if (ref.mounted && state.botActive) _goAway();
  }

  /// Opens the browser for the person (Sign In to a Site).
  Future<void> openForPerson([String? url]) async {
    if (!ref.mounted) return;
    // A run that lost the phone (its chat was left) has nothing more to say here.
    final away = state.phase == AppBrowserPhase.away;
    _set(
      state.copyWith(
        person: true,
        clearDone: true,
        phase: away ? AppBrowserPhase.idle : null,
        clearRun: away,
        clearAsk: away,
        clearHandoff: away,
      ),
    );
    if (url != null) await loadForPerson(url);
  }

  void closePerson() {
    if (ref.mounted) _set(state.copyWith(person: false));
  }

  /// An address typed by the person; a bare host gets https.
  Future<bool> loadForPerson(String raw) async {
    var url = raw.trim();
    if (url.isEmpty) return false;
    if (!RegExp(r'^[a-z][a-z0-9+.\-]*:', caseSensitive: false).hasMatch(url)) {
      url = 'https://$url';
    }
    final guard = await ref.read(appBrowserGuardProvider.future);
    if (personSiteDecision(url, guard, ownUrls: _policy.ownUrls)
        is! AppSiteAllowed) {
      return false;
    }
    _set(state.copyWith(url: url, loading: true));
    await _channel.load(url);
    return true;
  }

  Future<void> back() => _channel.back();
  Future<void> forward() => _channel.forward();
  Future<void> reload() => _channel.reload();

  /// "Let My Bots Use This Site": the page's site joins this phone's always list.
  /// Let My Bots Use This Site. Throws when the site couldn't be saved, so the screen says so
  /// instead of showing it as added.
  Future<String?> allowCurrentSite() async {
    final url = state.url;
    final host = url == null ? null : cleanSitePattern(hostOf(url) ?? '');
    if (host == null) return null;
    final system = appBrowserSystem;
    if (siteAllowed(host)) {
      Analytics.log('app_browser_site_allowed', {'outcome': 'already', 'system': ?system});
      return host;
    }
    if (device == null) {
      Analytics.log('app_browser_site_allowed', {
        'outcome': 'failed',
        'reason': 'no_device',
        'system': ?system,
      });
      throw StateError('This device isn\'t connected');
    }
    if (!await _saveSite(host, always: true)) {
      Analytics.log('app_browser_site_allowed', {
        'outcome': 'failed',
        'reason': 'save_error',
        'system': ?system,
      });
      throw StateError('Saving $host failed');
    }
    _addedAllowed.add(host);
    Analytics.log('app_browser_site_allowed', {'outcome': 'saved', 'system': ?system});
    return host;
  }

  /// Clears cookies and site data: one site, or everything.
  Future<void> clearData({String? host}) => _channel.clearData(host: host);

  /// A small picture of the page for the floating card; null when there is none.
  Future<Uint8List?> picture() async {
    try {
      final data = await _channel.screenshot(quality: 50);
      return data == null ? null : base64Decode(data);
    } catch (_) {
      return null;
    }
  }

  // --- native's events -------------------------------------------------------------------------

  @override
  Future<bool> navigate(
    String url, {
    required bool redirect,
    required bool user,
  }) async {
    if (url == 'about:blank') return true;
    final decision = await _navDecision(url, user: user);
    return decision;
  }

  @override
  Future<bool> landed(String url) async {
    final ok = await _navDecision(url, user: false, landing: true);
    if (!ok) _set(state.copyWith(url: 'about:blank'));
    return ok;
  }

  Future<bool> _navDecision(
    String url, {
    required bool user,
    bool landing = false,
  }) async {
    final guard = await ref.read(appBrowserGuardProvider.future);
    // The person's own browsing, and pages they open by touch: only the first two steps. While
    // they've taken over, every page is theirs too, including where a link of theirs lands (native
    // reports a landing without saying who started it).
    if (state.person ||
        user ||
        !state.botActive ||
        state.phase == AppBrowserPhase.tookOver) {
      final d = personSiteDecision(url, guard, ownUrls: _policy.ownUrls);
      if (d is AppSiteRefused) _completeNav(_Nav.refused(d));
      return d is AppSiteAllowed;
    }
    final d = await _decide(url);
    switch (d) {
      case AppSiteAllowed():
        return true;
      case AppSiteRefused():
        _completeNav(_Nav.refused(d));
        return false;
      case AppSiteAsk(:final host, :final siteKind):
        final run = state.run!;
        final answer = await _askSite(host, siteKind, run);
        final ok =
            answer == AppBrowserSiteAnswer.once ||
            answer == AppBrowserSiteAnswer.always;
        if (!ok) _completeNav(_Nav.denied(host));
        return ok;
    }
  }

  void _completeNav(_Nav outcome) {
    final nav = _nav;
    if (nav != null && !nav.isCompleted) nav.complete(outcome);
  }

  @override
  void pageStarted(String url) => _set(state.copyWith(url: url, loading: true));

  @override
  void pageFinished(String url, String title) {
    _set(state.copyWith(url: url, title: title, loading: false));
    _completeNav(const _Nav.settled());
    unawaited(_refreshPage().then((_) {}, onError: (_) {}));
  }

  @override
  void urlChanged(String url, String title) {
    if (url.isEmpty || url == 'about:blank') return;
    if (url == state.url && (title.isEmpty || title == state.title)) return;
    _set(state.copyWith(url: url, title: title.isEmpty ? state.title : title));
  }

  @override
  void userTouched() {
    // Native's own tap for a bot's click isn't the person.
    final own = _ownTapAt;
    if (own != null &&
        DateTime.now().difference(own) < const Duration(milliseconds: 800)) {
      return;
    }
    // On a Mac the page now has the keyboard (the person clicked or typed in it), so the message
    // box must not keep looking focused: the page takes Space (it scrolls) and Enter (it presses
    // the focused link or button), and only the letters it doesn't use reach the box (D-549 G1/G2).
    // On Windows likewise: Take Over turns into Hand Back in place and kept Flutter's focus, so a
    // key that reached Flutter (after Alt+Tab) pressed it with Space or Enter.
    if (!kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.windows)) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    if (state.phase == AppBrowserPhase.working && state.botActive) takeOver();
  }

  @override
  void dialog(String kind, String message) {
    _dialog = (kind: kind, message: message);
    _dialogTimer?.cancel();
    _dialogTimer = Timer(_timings.dialog, () {
      if (_dialog == null) return;
      _dialog = null;
      unawaited(_channel.answerDialog(accept: false).catchError((_) {}));
    });
  }

  @override
  void gone(String reason) {
    _pageLost = true;
    _completeNav(
      const _Nav.error("The device's page was closed by the system."),
    );
    _set(state.copyWith(url: 'about:blank', title: '', loading: false));
  }

  @override
  void windowHidden() {
    ref.read(appBrowserServiceProvider).setWindowOpen(false);
    leftChat(state.run?.conversationId);
  }

  /// Back on screen: the app's lifecycle may never have changed (Cmd+W leaves Casama the active
  /// app, and the notch can keep it "visible"), so only this brings the browser back.
  @override
  void windowShown() => ref.read(appBrowserServiceProvider).setWindowOpen(true);

  @override
  void pageWindowClosed() {
    if (!ref.mounted) return;
    AppBrowserLinuxLive.pageWindowClosed.value++;
    // The person was typing into the page in its own window (Wayland): closing it is Hand Back.
    if (state.phase == AppBrowserPhase.tookOver ||
        state.phase == AppBrowserPhase.yourTurn) {
      handBack();
    }
  }

  @override
  void backgroundStarted({
    required int battery,
    required bool notificationsEnabled,
  }) {
    if (!ref.mounted) return;
    final bg = backgroundService?.background;
    if (bg != null) {
      bg.startBattery = battery;
      bg.notificationsEnabled = notificationsEnabled;
    }
    if (!notificationsEnabled) {
      Analytics.log('app_browser_background_stopped', {
        'reason': 'notifications_off',
      });
    }
  }

  @override
  void backgroundStopped({required String reason, required int battery}) {
    if (!ref.mounted) return;
    if (reason == 'user_stop' && state.botActive) {
      stopBot();
    }
    final service = backgroundService;
    if (service != null) {
      unawaited(service.stopBackgroundEarly(reason, fromNative: true));
    }
  }

  @override
  void reminderOpened({required String source, required String link}) {
    if (!ref.mounted) return;
    backgroundService?.background.markReminderOpened(source);
  }

  // --- helpers ---------------------------------------------------------------------------------

  bool _onScreen(AppBrowserRun run) {
    final c = run.conversationId;
    if (c == null) return false;
    if (c == ref.read(appBrowserFocusProvider)()) return true;
    // Android keep-going mode: allow the active run to continue while the app is hidden (plan §7).
    final service = backgroundService;
    return service != null &&
        service.backgroundKeepGoing &&
        state.run?.conversationId == c &&
        state.run?.id == run.id;
  }

  void _startRun(AppBrowserRun run) {
    // A call for a different run ends the earlier run's session.
    _endRun(answer: 'away');
    _runId = run.id;
    _once.clear();
    _set(
      state.copyWith(
        phase: AppBrowserPhase.working,
        run: run,
        clearAsk: true,
        clearHandoff: true,
        person: false,
        clearDone: true,
      ),
    );
  }

  /// Ends the run's waits: a pending ask gets [answer], a wait for Hand Back gives up.
  void _endRun({required String answer}) {
    _answer(answer);
    final h = _handBack;
    _handBack = null;
    if (h != null && !h.isCompleted) h.complete(false);
  }

  void _goAway() {
    _endRun(answer: 'away');
    _set(state.copyWith(phase: AppBrowserPhase.away, clearAsk: true));
  }

  Future<bool> _waitForHandBack(AppBrowserCall call) async {
    final h = _handBack ??= Completer<bool>();
    return _race(h.future, _timings.takeOver, false, call.cancelled, false);
  }

  /// The longest the page script's `wait` lasts (packages/page-agent: `ms` is capped at 30000).
  static const _maxWaitMs = 30000;

  Future<Map<String, dynamic>> _command(
    String cmd,
    Map<String, dynamic> args,
  ) async {
    final answer = await _channel.command(
      {'id': 'c${++_seq}', 'cmd': cmd, 'args': args},
      // A wait can itself take up to 30 s (the page script's cap): give it that on top, or a
      // 30 s wait always ran out just before its answer ("The page didn't answer in time").
      timeoutMs: _timings.commandMs + (cmd == 'wait' ? _maxWaitMs : 0),
    );
    return answer;
  }

  Future<AppBrowserPage> _refreshPage() async {
    final p = await _channel.url();
    _set(
      state.copyWith(
        url: p.url,
        title: p.title,
        loading: p.loading,
        canGoBack: p.canGoBack,
        canGoForward: p.canGoForward,
      ),
    );
    return p;
  }

  Map<String, Object?> _pageResult(Map<String, dynamic> r) {
    if (r['ok'] != true) return _pageFail(r);
    return _ok('${r['text'] ?? ''}', url: (r['url'] as String?) ?? state.url);
  }

  Map<String, Object?> _pageFail(Map<String, dynamic> r) {
    final code = '${r['code'] ?? 'error'}';
    return _fail(
      _passThroughCodes.contains(code) ? code : 'error',
      '${r['message'] ?? 'The page script failed'}',
    );
  }

  Map<String, Object?> _lost() => _fail(
    'error',
    "The phone's page was closed by the system; open the address again.",
  );

  Map<String, Object?> _stoppedFail() => _fail(
    'away',
    'The person stopped you using the browser inside Casama on their device. Carry on with your own computer, or ask them.',
  );

  Map<String, Object?> _away() => _fail(
    'away',
    "The person's chat isn't open on their device, so the browser inside Casama can't be used now. Carry on with your own computer, or wait for them.",
  );

  /// [main], or [onTimeout] after [after], or [onCancel] once [cancelled] completes; the timer is
  /// cancelled as soon as one of them wins.
  static Future<T> _race<T>(
    Future<T> main,
    Duration after,
    T onTimeout, [
    Future<void>? cancelled,
    T? onCancel,
  ]) {
    final c = Completer<T>();
    final timer = Timer(after, () {
      if (!c.isCompleted) c.complete(onTimeout);
    });
    main.then(
      (v) {
        if (!c.isCompleted) c.complete(v);
      },
      onError: (Object e, StackTrace st) {
        if (!c.isCompleted) c.completeError(e, st);
      },
    );
    cancelled?.then((_) {
      if (!c.isCompleted) c.complete(onCancel ?? onTimeout);
    });
    return c.future.whenComplete(timer.cancel);
  }

  static Map<String, Object?> _ok(String text, {String? url}) => {
    'ok': true,
    'text': text,
    'url': ?url,
  };
  static Map<String, Object?> _fail(String code, String message) => {
    'ok': false,
    'code': code,
    'message': message,
  };
}

/// How a navigation the bot started ended.
class _Nav {
  const _Nav.settled() : refused = null, denied = null, error = null;
  const _Nav.refused(AppSiteRefused this.refused) : denied = null, error = null;
  const _Nav.denied(String this.denied) : refused = null, error = null;
  const _Nav.error(String this.error) : refused = null, denied = null;
  final AppSiteRefused? refused;

  /// The site the person said no to on the way.
  final String? denied;
  final String? error;
}

final appBrowserProvider =
    NotifierProvider<AppBrowserController, AppBrowserSession>(
      AppBrowserController.new,
    );
