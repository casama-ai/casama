// Computer places: a bot keeps its own computer and may also work on the person's. The panel
// switches between the two, "Works on" is saved from there, and a step on the person's computer
// says so in the chat.
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama/features/chat/chat_screen.dart' show computerForBot;
import 'package:casama/features/chat/widgets/chat_widgets.dart';
import 'package:casama/features/computer/bot_places.dart';
import 'package:casama/features/computer/computer_screen.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

const _mac = '66666666-6666-4666-8666-666666666666';
const _macDevice = '77777777-7777-4777-8777-777777777777';
const _macName = "Oliver's MacBook Pro";

Computer _computer(
  String id,
  ComputerKindEnum kind, {
  String? name,
  String? ownerBotId,
}) => Computer(
  id: id,
  orgId: orgId,
  kind: kind,
  name: name ?? id,
  ownerBotId: ownerBotId,
  lastActiveAt: null,
  error: null,
  provider: kind == ComputerKindEnum.local ? 'local' : 'docker',
  profile: ComputerProfileEnum.headless,
  state: ComputerState.running,
  size: ComputerSize(),
  hasSnapshot: false,
  maxDesktops: 1,
  createdAt: DateTime(2026),
);

BotPlace _home() => BotPlace(
  where: PlaceWhere.botComputer,
  computerId: computerId,
  deviceId: null,
  name: 'Team computer',
  kind: BotPlaceKindEnum.team,
  platform: null,
  online: true,
  capabilities: const {},
  selected: false,
);

BotPlace _mine({bool online = true}) => BotPlace(
  where: PlaceWhere.myComputer,
  computerId: _mac,
  deviceId: _macDevice,
  name: _macName,
  kind: BotPlaceKindEnum.local,
  platform: 'macos',
  online: online,
  capabilities: const {'shell': true, 'files': true},
  selected: true,
);

BotPlaces _places({
  PlaceMode mode = PlaceMode.auto,
  bool home = true,
  bool mine = true,
}) => BotPlaces(
  botId: botId,
  mode: mode,
  deviceId: null,
  places: [if (home) _home(), if (mine) _mine()],
);

FakeBackend _backend(BotPlaces? places) {
  final backend = FakeBackend()
    ..extraComputers = [
      _computer(_mac, ComputerKindEnum.local, name: _macName),
    ];
  if (places != null) backend.botPlacesByBot[botId] = places;
  return backend;
}

/// The name on the computer's own header card (the panel's, under the places bar).
Finder _panelTitle(String name) =>
    find.descendant(of: find.byType(ComputerPanel), matching: find.text(name));

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('the bot\'s own computer', () {
    final team = _computer('team', ComputerKindEnum.team);
    final own = _computer('own', ComputerKindEnum.private, ownerBotId: 'ada');
    final mac = _computer(_mac, ComputerKindEnum.local);

    test('a person\'s computer is never it, even when an older default still points there', () {
      expect(
        computerForBot([team, own, mac], 'ada', defaultComputerId: _mac)?.id,
        'own',
      );
      expect(
        computerForBot([team, mac], 'ada', defaultComputerId: _mac)?.id,
        'team',
      );
      expect(
        computerForBot([team, own, mac], 'ada', places: _places())?.id,
        'own',
      );
    });

    test('on a server with no cloud computers, the person\'s computer is all there is', () {
      expect(
        computerForBot([team, mac], 'ada', places: _places(home: false))?.id,
        _mac,
      );
      // Nobody's computer lent either: what it always was.
      expect(
        computerForBot(
          [team, mac],
          'ada',
          places: _places(home: false, mine: false),
        )?.id,
        'team',
      );
    });

    test('where the panel opens: the bot\'s own, unless the person keeps it on theirs', () {
      expect(_places().opensOn?.computerId, computerId);
      expect(
        _places(mode: PlaceMode.botComputer).opensOn?.computerId,
        computerId,
      );
      expect(_places(mode: PlaceMode.myComputer).opensOn?.computerId, _mac);
      expect(_places(home: false).opensOn?.computerId, _mac);
      expect(_places(mine: false).hasChoice, isFalse);
    });
  });

  testWidgets('one place: the panel is as it always was', (tester) async {
    await setSize(tester, const Size(800, 1000));
    for (final places in [null, _places(mine: false)]) {
      await tester.pumpWidget(
        harness(
          _backend(places),
          const Scaffold(body: ComputerScreen(botId: botId, embedded: true)),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('botPlacesBar')), findsNothing);
      expect(_panelTitle('Team computer'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    }
  });

  testWidgets(
    'two places: the bar switches what the panel shows, and holds Works on',
    (tester) async {
      await setSize(tester, const Size(800, 1000));
      final backend = _backend(_places());
      await tester.pumpWidget(
        harness(
          backend,
          const Scaffold(body: ComputerScreen(botId: botId, embedded: true)),
        ),
      );
      await tester.pumpAndSettle();
      final bar = find.byKey(const Key('botPlacesBar'));
      expect(bar, findsOneWidget);
      expect(
        find.descendant(of: bar, matching: find.text('Team computer')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: bar, matching: find.text('Works on: Automatic')),
        findsOneWidget,
      );
      expect(_panelTitle('Team computer'), findsOneWidget);

      // Looking at the person's computer changes the panel and nothing else.
      await tester.tap(bar);
      await tester.pumpAndSettle();
      expect(find.text('Your computer · Online'), findsOneWidget);
      await tester.tap(find.byKey(const Key('place-$_mac')));
      await tester.pumpAndSettle();
      expect(_panelTitle(_macName), findsOneWidget);
      expect(
        find.descendant(of: bar, matching: find.text(_macName)),
        findsOneWidget,
      );
      expect(backend.placePreferenceSets, isEmpty);

      // The same list ends with Works on.
      await tester.tap(bar);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('placesWorksOn')));
      await tester.pumpAndSettle();
      expect(find.text('Only the bot\'s computer'), findsOneWidget);
      await tester.tap(find.byKey(const Key('worksOn-mine')));
      await tester.pumpAndSettle();
      expect(backend.placePreferenceSets, [
        (botId, PlaceMode.myComputer, null),
      ]);
      expect(
        find.descendant(
          of: bar,
          matching: find.text('Works on: Only my computer'),
        ),
        findsOneWidget,
      );
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('Only my computer: the panel opens on the person\'s computer', (
    tester,
  ) async {
    await setSize(tester, const Size(800, 1000));
    await tester.pumpWidget(
      harness(
        _backend(_places(mode: PlaceMode.myComputer)),
        const Scaffold(body: ComputerScreen(botId: botId, embedded: true)),
      ),
    );
    await tester.pumpAndSettle();
    expect(_panelTitle(_macName), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'a step on the person\'s computer is tagged with its name; one on the bot\'s own is not',
    (tester) async {
      await setSize(tester, const Size(600, 800));
      const here = ToolEntry(
        callId: 'a',
        tool: 'shell.exec',
        args: {'command': 'ls'},
        status: ToolStatus.done,
        durationMs: 40,
      );
      const there = ToolEntry(
        callId: 'b',
        tool: 'shell.exec',
        args: {'command': 'ls'},
        status: ToolStatus.done,
        durationMs: 40,
        onComputer: _macName,
      );
      await tester.pumpWidget(
        harness(
          FakeBackend(),
          const Scaffold(body: ToolGroupCard(steps: [here, there])),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('toolPlaceTag')), findsOneWidget);
      expect(
        find.descendant(
          of: find.byKey(const Key('toolPlaceTag')),
          matching: find.text(_macName),
        ),
        findsOneWidget,
      );
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('an approval for the person\'s computer says so in its title', (
    tester,
  ) async {
    await setSize(tester, const Size(600, 800));
    const entry = ApprovalEntry(
      approvalId: 'ap1',
      tool: 'shell.exec',
      args: {'command': 'rm -rf build'},
      risk: 'high',
      onComputer: _macName,
    );
    await tester.pumpWidget(
      harness(
        FakeBackend(),
        const Scaffold(
          body: SingleChildScrollView(
            child: ApprovalPrompt(entry: entry, botName: 'Ada'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('on $_macName'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  test('only a person\'s own computer is named as a place', () {
    expect(
      personalPlaceName(
        ToolStartedEventPayloadPlace(
          computerId: _mac,
          kind: 'local',
          name: _macName,
        ),
      ),
      _macName,
    );
    expect(
      personalPlaceName(
        ToolStartedEventPayloadPlace(
          computerId: computerId,
          kind: 'team',
          name: 'Team computer',
        ),
      ),
      isNull,
    );
    expect(
      personalPlaceName(
        ToolStartedEventPayloadPlace(
          computerId: _mac,
          kind: 'local',
          name: ' ',
        ),
      ),
      isNull,
    );
    expect(personalPlaceName(null), isNull);
  });
}
