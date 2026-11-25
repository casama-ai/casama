// The bot's cursor on its screen (docs/BOT-CURSOR-PLAN.md): where each surface's fit puts it, how
// it moves, clicks, types and leaves, Reduce Motion, and how a reply's events drive it.
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama/features/computer/bot_cursors.dart';
import 'package:casama/ui/bot_cursor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_backend.dart';

const _cursor = Key('botCursor');

/// A headless bot's page, as its picture comes.
const _page = Size(1280, 577);

Future<void> _pump(
  WidgetTester tester,
  BotCursorController controller, {
  BotCursorFit fit = BotCursorFits.fill,
  Size box = const Size(400, 250),
  bool reduce = false,
  bool visible = true,
  String? label,
}) => tester.pumpWidget(
  MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(disableAnimations: reduce),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox.fromSize(
          size: box,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const ColoredBox(color: Colors.white),
              BotCursor(
                controller: controller,
                fit: fit,
                size: BotCursorSize.large,
                visible: visible,
                label: label,
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

Offset _tip(WidgetTester tester) => tester.getTopLeft(find.byKey(_cursor));

void main() {
  group('where each surface puts the cursor', () {
    test('fill: the same fraction of the layer', () {
      expect(
        BotCursorFits.fill(
          const Offset(640, 400),
          const Size(1280, 800),
          const Size(320, 200),
        ),
        const Offset(160, 100),
      );
    });

    test('points: the phone browser, where the spot is already in the layer\'s points', () {
      expect(
        BotCursorFits.points(
          const Offset(120, 340.5),
          Size.zero,
          const Size(390, 700),
        ),
        const Offset(120, 340.5),
      );
      expect(
        BotCursorFits.fill(
          const Offset(120, 340.5),
          Size.zero,
          const Size(390, 700),
        ),
        const Offset(120, 340.5),
      );
    });

    test(
      'cover, top aligned: the chat\'s card cuts the sides off a wide page',
      () {
        // 1280×577 in a 160×100 card: scaled by height, 221.8 wide, 30.9 cut from each side.
        final fit = BotCursorFits.cover(Alignment.topCenter);
        final middle = fit(
          const Offset(640, 288.5),
          _page,
          const Size(160, 100),
        );
        expect(middle.dx, closeTo(80, 0.01));
        expect(middle.dy, closeTo(50, 0.01));
        // The page's left edge is outside the card.
        expect(
          fit(Offset.zero, _page, const Size(160, 100)).dx,
          closeTo(-30.9, 0.1),
        );
      },
    );

    test('cover, top aligned: a desktop taller than the card loses its bottom, not its top', () {
      final fit = BotCursorFits.cover(Alignment.topCenter);
      // 1000×1000 in 160×100: scaled by width, 160 tall, the top 100 kept.
      expect(
        fit(const Offset(500, 0), const Size(1000, 1000), const Size(160, 100)),
        const Offset(80, 0),
      );
      expect(
        fit(
          const Offset(500, 1000),
          const Size(1000, 1000),
          const Size(160, 100),
        ).dy,
        160,
      );
    });

    test('contain: the whole picture, centred, with bars', () {
      final at = BotCursorFits.contain()(
        const Offset(0, 0),
        const Size(1280, 800),
        const Size(400, 400),
      );
      expect(at, const Offset(0, 75));
    });

    test('scaleDown: smaller to fit, never larger', () {
      // Fits: made smaller, as contain.
      expect(
        BotCursorFits.scaleDown(
          Offset.zero,
          const Size(1280, 800),
          const Size(400, 400),
        ),
        const Offset(0, 75),
      );
      // Room to spare: its own size, centred.
      expect(
        BotCursorFits.scaleDown(
          const Offset(10, 10),
          const Size(200, 100),
          const Size(400, 400),
        ),
        const Offset(110, 160),
      );
    });
  });

  group('the controller', () {
    test(
      'typing, scrolling and settling do nothing while there is no cursor',
      () {
        final c = BotCursorController();
        addTearDown(c.dispose);
        c.typing();
        c.scroll(down: true);
        c.settle();
        expect(c.target, isNull);
      },
    );

    test(
      'every step is a new one, so a second click on the same spot still rings',
      () {
        final c = BotCursorController();
        addTearDown(c.dispose);
        c.pointTo(const Offset(10, 10), of: _page);
        final first = c.target!.step;
        c.pointTo(const Offset(10, 10), of: _page);
        expect(c.target!.step, greaterThan(first));
        expect(c.target!.act, BotCursorAct.click);
      },
    );

    test(
      'the typing dots go when that step ends, and not for another step\'s end',
      () {
        final c = BotCursorController();
        addTearDown(c.dispose);
        c.pointTo(
          const Offset(10, 10),
          of: _page,
          act: BotCursorAct.typing,
          callId: 'a',
        );
        c.settle('b');
        expect(c.target!.act, BotCursorAct.typing);
        final step = c.target!.step;
        c.settle('a');
        expect(c.target!.act, BotCursorAct.rest);
        expect(
          c.target!.step,
          step,
          reason: 'nothing moves or rings when the dots go',
        );
      },
    );

    test('a scroll nudges it where it is', () {
      final c = BotCursorController();
      addTearDown(c.dispose);
      c.pointTo(const Offset(10, 20), of: _page);
      c.scroll(down: false);
      expect(c.target!.at, const Offset(10, 20));
      expect(c.target!.nudge, -1);
    });

    testWidgets('with no screen step for 20 seconds it leaves', (tester) async {
      final c = BotCursorController();
      addTearDown(c.dispose);
      c.pointTo(const Offset(10, 10), of: _page);
      await tester.pump(const Duration(seconds: 19));
      expect(c.target, isNotNull);
      c.typing();
      await tester.pump(const Duration(seconds: 19));
      expect(c.target, isNotNull, reason: 'a step restarts the clock');
      await tester.pump(const Duration(seconds: 2));
      expect(c.target, isNull);
    });

    test('nonsense is refused', () {
      final c = BotCursorController();
      addTearDown(c.dispose);
      c.pointTo(const Offset(double.nan, 1), of: _page);
      expect(c.target, isNull);
    });
  });

  group('the cursor', () {
    testWidgets('nothing is drawn until a step says where', (tester) async {
      final c = BotCursorController();
      addTearDown(c.dispose);
      await _pump(tester, c);
      expect(find.byKey(_cursor), findsNothing);
    });

    testWidgets(
      'the first time, it fades in at the spot instead of flying in',
      (tester) async {
        final c = BotCursorController();
        addTearDown(c.dispose);
        await _pump(tester, c);
        c.pointTo(const Offset(640, 288.5), of: _page);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 20));
        expect(_tip(tester), const Offset(200, 125));
        await tester.pump(const Duration(milliseconds: 200));
        expect(_tip(tester), const Offset(200, 125));
      },
    );

    testWidgets(
      'then it glides to the next spot along a bowed path, and lands on it',
      (tester) async {
        final c = BotCursorController();
        addTearDown(c.dispose);
        await _pump(tester, c);
        c.pointTo(const Offset(128, 57.7), of: _page);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 250));
        expect(_tip(tester), const Offset(40, 25));

        c.pointTo(const Offset(1152, 57.7), of: _page);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 280));
        final midway = _tip(tester);
        expect(midway.dx, inExclusiveRange(40, 360));
        expect(
          midway.dy,
          isNot(closeTo(25, 0.5)),
          reason: 'not a straight slide',
        );
        await tester.pump(const Duration(milliseconds: 500));
        expect(_tip(tester).dx, closeTo(360, 0.01));
        expect(_tip(tester).dy, closeTo(25, 0.01));
      },
    );

    testWidgets(
      'a far spot takes longer than a near one, and never longer than 650 ms',
      (tester) async {
        final c = BotCursorController();
        addTearDown(c.dispose);
        await _pump(tester, c);
        c.pointTo(const Offset(100, 100), of: _page);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 250));
        // Near: there within 400 ms.
        c.pointTo(const Offset(140, 100), of: _page);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 400));
        expect(_tip(tester).dx, closeTo(140 / 1280 * 400, 0.01));
        // Far: not yet there at 400 ms, there by 650.
        c.pointTo(const Offset(1240, 500), of: _page);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 400));
        expect(_tip(tester).dx, lessThan(1240 / 1280 * 400 - 1));
        await tester.pump(const Duration(milliseconds: 260));
        expect(_tip(tester).dx, closeTo(1240 / 1280 * 400, 0.01));
      },
    );

    testWidgets(
      'resting, it drifts, and never more than three points from the spot',
      (tester) async {
        final c = BotCursorController();
        addTearDown(c.dispose);
        await _pump(tester, c);
        c.pointTo(const Offset(640, 288.5), of: _page);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 1400));
        expect(
          _tip(tester),
          const Offset(200, 125),
          reason: 'still for the first second and a half',
        );
        var moved = false;
        for (var i = 0; i < 40; i++) {
          await tester.pump(const Duration(milliseconds: 200));
          final off = _tip(tester) - const Offset(200, 125);
          expect(off.distance, lessThanOrEqualTo(3.1));
          if (off.distance > 0.5) moved = true;
        }
        expect(moved, isTrue);
      },
    );

    testWidgets('Reduce Motion: no glide and no drift', (tester) async {
      final c = BotCursorController();
      addTearDown(c.dispose);
      await _pump(tester, c, reduce: true);
      c.pointTo(const Offset(128, 57.7), of: _page);
      await tester.pump();
      expect(_tip(tester), const Offset(40, 25));
      c.pointTo(const Offset(1152, 519.3), of: _page);
      await tester.pump();
      expect(_tip(tester).dx, closeTo(360, 0.01));
      expect(_tip(tester).dy, closeTo(225, 0.01));
      await tester.pump(const Duration(seconds: 5));
      expect(_tip(tester).dx, closeTo(360, 0.01));
      // Nothing left running: the test would hang here otherwise.
      await tester.pumpAndSettle();
    });

    testWidgets('it leaves when the bot stops driving, and is gone', (
      tester,
    ) async {
      final c = BotCursorController();
      addTearDown(c.dispose);
      await _pump(tester, c);
      c.pointTo(const Offset(640, 288.5), of: _page);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 250));
      expect(find.byKey(_cursor), findsOneWidget);
      c.leave();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 250));
      expect(find.byKey(_cursor), findsNothing);
      // And nothing keeps animating once it has gone.
      await tester.pumpAndSettle();
    });

    testWidgets(
      'hidden while someone else has the screen, back where it was after',
      (tester) async {
        final c = BotCursorController();
        addTearDown(c.dispose);
        c.pointTo(const Offset(640, 288.5), of: _page);
        await _pump(tester, c, visible: false);
        await tester.pump(const Duration(milliseconds: 250));
        expect(find.byKey(_cursor), findsNothing);
        await _pump(tester, c);
        await tester.pump(const Duration(milliseconds: 250));
        expect(_tip(tester), const Offset(200, 125));
      },
    );

    testWidgets(
      'a spot the surface crops away: it waits at that edge, half faded',
      (tester) async {
        final c = BotCursorController();
        addTearDown(c.dispose);
        await _pump(
          tester,
          c,
          fit: BotCursorFits.cover(Alignment.topCenter),
          box: const Size(160, 100),
        );
        c.pointTo(const Offset(20, 288.5), of: _page);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 250));
        expect(_tip(tester).dx, 0);
        expect(_tip(tester).dy, closeTo(50, 0.01));
        final faded = tester.widget<Opacity>(
          find
              .ancestor(of: find.byKey(_cursor), matching: find.byType(Opacity))
              .first,
        );
        expect(faded.opacity, closeTo(0.45, 0.01));
      },
    );

    testWidgets('it takes no touches and says nothing to a screen reader', (
      tester,
    ) async {
      final c = BotCursorController();
      addTearDown(c.dispose);
      var taps = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => taps++,
              ),
              BotCursor(
                controller: c,
                fit: BotCursorFits.points,
                label: 'Ava',
                size: BotCursorSize.large,
              ),
            ],
          ),
        ),
      );
      c.pointTo(const Offset(100, 100), of: Size.zero);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 250));
      expect(find.text('Ava'), findsOneWidget);
      await tester.tapAt(const Offset(104, 104));
      expect(taps, 1);
      expect(find.bySemanticsLabel('Ava'), findsNothing);
    });
  });

  group('a reply drives its computer\'s cursor', () {
    Map<String, dynamic> pointer({
      String action = 'click',
      String call = 'c1',
      String computer = 'comp-1',
    }) => {
      'call_id': call,
      'computer_id': computer,
      'action': action,
      'x': 350,
      'y': 220,
      'width': 1280,
      'height': 577,
    };

    test('the event puts the cursor on that computer only', () {
      final cursors = BotCursors();
      addTearDown(cursors.dispose);
      cursors.onRunEvent(ev(1, 'screen.pointer', pointer()));
      final t = cursors.of('comp-1').target!;
      expect(t.at, const Offset(350, 220));
      expect(t.of, const Size(1280, 577));
      expect(t.act, BotCursorAct.click);
      expect(cursors.of('comp-2').target, isNull);
    });

    test('a fill types at the field until its step ends', () {
      final cursors = BotCursors();
      addTearDown(cursors.dispose);
      cursors.onRunEvent(
        ev(1, 'screen.pointer', pointer(action: 'type', call: 'f1')),
      );
      expect(cursors.of('comp-1').target!.act, BotCursorAct.typing);
      cursors.onRunEvent(
        ev(2, 'tool.completed', {
          'call_id': 'f1',
          'result_preview': 'filled',
          'artifact_path': null,
          'duration_ms': 20,
        }),
      );
      expect(cursors.of('comp-1').target!.act, BotCursorAct.rest);
    });

    test('typing and keys show the dots where the cursor already is; a scroll nudges it', () {
      final cursors = BotCursors();
      addTearDown(cursors.dispose);
      cursors.onRunEvent(ev(1, 'screen.pointer', pointer()));
      cursors.onRunEvent(
        ev(2, 'tool.started', {
          'call_id': 't1',
          'tool': 'browser.type',
          'args_redacted': {'text': '•••'},
        }),
      );
      expect(cursors.of('comp-1').target!.act, BotCursorAct.typing);
      expect(cursors.of('comp-1').target!.at, const Offset(350, 220));
      cursors.onRunEvent(
        ev(3, 'tool.failed', {
          'call_id': 't1',
          'error_code': 'browser_error',
          'message': 'no',
        }),
      );
      expect(cursors.of('comp-1').target!.act, BotCursorAct.rest);
      cursors.onRunEvent(
        ev(4, 'tool.started', {
          'call_id': 's1',
          'tool': 'browser.scroll',
          'args_redacted': {'direction': 'up'},
        }),
      );
      expect(cursors.of('comp-1').target!.nudge, -1);
    });

    test('steps in the person\'s own Chrome, phone or Mac never move the computer\'s cursor', () {
      final cursors = BotCursors();
      addTearDown(cursors.dispose);
      cursors.onRunEvent(ev(1, 'screen.pointer', pointer()));
      final before = cursors.of('comp-1').target!.step;
      for (final where in ['mine', 'phone', 'my_computer']) {
        cursors.onRunEvent(
          ev(2, 'tool.started', {
            'call_id': 't',
            'tool': 'browser.type',
            'args_redacted': {'text': 'x', 'where': where},
          }),
        );
      }
      expect(cursors.of('comp-1').target!.step, before);
    });

    test(
      'with no cursor yet, typing shows none: there is no spot to show it at',
      () {
        final cursors = BotCursors();
        addTearDown(cursors.dispose);
        cursors.onRunEvent(
          ev(1, 'tool.started', {
            'call_id': 't1',
            'tool': 'browser.type',
            'args_redacted': {'text': 'x'},
          }),
        );
        expect(cursors.of('comp-1').target, isNull);
      },
    );

    test('it leaves when the reply ends, fails, is stopped, or asks the person to take the screen', () {
      for (final (type, payload) in <(String, Map<String, dynamic>)>[
        (
          'run.completed',
          {'usage': <String, dynamic>{}, 'final_message_id': null},
        ),
        ('run.failed', {'error_code': 'x', 'message': 'no'}),
        ('run.cancelled', {'cancelled_by': null}),
        (
          'takeover.requested',
          {'takeover_id': 't', 'computer_id': 'comp-1', 'reason': 'sign in'},
        ),
      ]) {
        final cursors = BotCursors();
        cursors.onRunEvent(ev(1, 'screen.pointer', pointer()));
        expect(cursors.of('comp-1').target, isNotNull);
        cursors.onRunEvent(ev(2, type, payload));
        expect(cursors.of('comp-1').target, isNull, reason: type);
        cursors.dispose();
      }
    });

    test('the chat feeds it: a reply the app is following moves its computer\'s cursor', () async {
      SharedPreferences.setMockInitialValues({});
      final container = ProviderContainer(
        overrides: [backendProvider.overrideWithValue(FakeBackend())],
      );
      addTearDown(container.dispose);
      container.listen(chatControllerProvider(botId), (_, _) {});
      final chat = container.read(chatControllerProvider(botId).notifier);
      chat.apply(ev(1, 'screen.pointer', pointer()));
      expect(
        container.read(botCursorsProvider).of('comp-1').target!.at,
        const Offset(350, 220),
      );
      // It adds nothing to the thread: it is how the cursor is drawn, not something that happened.
      expect(container.read(chatControllerProvider(botId)).entries, isEmpty);
      chat.apply(ev(2, 'run.completed', {'final_message_id': null}));
      expect(container.read(botCursorsProvider).of('comp-1').target, isNull);
    });

    test('an action a later server adds still moves the cursor there', () {
      final cursors = BotCursors();
      addTearDown(cursors.dispose);
      cursors.onRunEvent(ev(1, 'screen.pointer', pointer(action: 'hover')));
      expect(cursors.of('comp-1').target!.act, BotCursorAct.rest);
    });
  });
}
