// Computer places: a routine works on the bot's own computer unless it is set to the person's,
// and the choice shows only when one of their computers lets the bot in.
import 'package:casama/features/routines/edit_routine_sheet.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

const _mac = '66666666-6666-4666-8666-666666666666';

BotPlaces _places({required bool mine}) => BotPlaces(
  botId: botId,
  mode: PlaceMode.auto,
  deviceId: null,
  places: [
    BotPlace(
      where: PlaceWhere.botComputer,
      computerId: computerId,
      deviceId: null,
      name: 'Team computer',
      kind: BotPlaceKindEnum.team,
      platform: null,
      online: true,
      capabilities: const {},
      selected: false,
    ),
    if (mine)
      BotPlace(
        where: PlaceWhere.myComputer,
        computerId: _mac,
        deviceId: 'dev-mac',
        name: "Oliver's MacBook Pro",
        kind: BotPlaceKindEnum.local,
        platform: 'macos',
        online: true,
        capabilities: const {},
        selected: true,
      ),
  ],
);

Future<Routine> _routine(FakeBackend backend) async {
  await backend.createRoutine(
    botId,
    name: 'Tidy Downloads',
    instructions: 'Sort the folder.',
    trigger: 'schedule',
    cron: '0 8 * * *',
  );
  return backend.routineList.last;
}

void main() {
  testWidgets('no computer of theirs lets the bot in: nothing to choose', (
    tester,
  ) async {
    await setSize(tester, const Size(700, 1400));
    for (final places in [null, _places(mine: false)]) {
      final backend = FakeBackend();
      if (places != null) backend.botPlacesByBot[botId] = places;
      final routine = await _routine(backend);
      await tester.pumpWidget(
        harness(backend, Scaffold(body: EditRoutineSheet(routine: routine))),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('editRoutineWhere')), findsNothing);
      await tester.pumpWidget(const SizedBox());
    }
  });

  testWidgets('Where it works: the bot\'s computer, or mine when it is on', (
    tester,
  ) async {
    await setSize(tester, const Size(700, 1400));
    final backend = FakeBackend()..botPlacesByBot[botId] = _places(mine: true);
    final routine = await _routine(backend);
    await tester.pumpWidget(
      harness(backend, Scaffold(body: EditRoutineSheet(routine: routine))),
    );
    await tester.pumpAndSettle();
    final where = find.byKey(const Key('editRoutineWhere'));
    expect(
      find.descendant(of: where, matching: find.text("The bot's computer")),
      findsOneWidget,
    );

    await tester.ensureVisible(where);
    await tester.tap(where);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('routineWhere-mine')));
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: where,
        matching: find.text("My computer when it's on"),
      ),
      findsOneWidget,
    );

    await tester.tap(find.byKey(const Key('saveRoutine')));
    await tester.pumpAndSettle();
    expect(backend.routineUpdates.last.$2['computer'], 'my_computer');
    await tester.pumpWidget(const SizedBox());
  });
}
