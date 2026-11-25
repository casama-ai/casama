// The flight cards (docs/FLIGHT-CARDS-PLAN.md §11): each renders the shapes the server sends
// (fixtures built from recorded Kiwi.com answers) on a phone and a wide window; a Fares card
// moves along its strip of days and opens a fare flight by flight; a calendar opens a day and the
// next month, and an explore card a place, through the card's own views; the search form sends
// what live.fares takes; the watches card lists the person's own watches.
import 'dart:convert';
import 'dart:io';

import 'package:casama/core/backend.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

Map<String, Object?> _load(String name) {
  final f = File('../packages/contracts/fixtures/$name');
  return Map<String, Object?>.from(jsonDecode(f.readAsStringSync()) as Map);
}

Map<String, Object?> _message(
  String id,
  List<Map<String, Object?>> components,
) => {
  'surfaceId': id,
  'messages': [
    {
      'version': '1.0',
      'createSurface': {
        'surfaceId': id,
        'catalogId':
            'https://a2ui.org/specification/v1_0/catalogs/basic/catalog.json',
      },
    },
    {
      'version': '1.0',
      'updateComponents': {'surfaceId': id, 'components': components},
    },
  ],
};

/// Fails with the full diagnostics (which widget overflowed, and where).
void _noErrors(WidgetTester tester) {
  final e = tester.takeException();
  if (e != null) fail(e is FlutterError ? e.toStringDeep() : '$e');
}

const _ref = '00000000-0000-0000-0000-0000000000fa';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));
  final fares = _load('fare-cards.json');
  final composed = _load('composed-cards.json');

  /// A sample card; with [ref] it can be refreshed and asked for views, and isn't due yet.
  Map<String, Object?> sample(String name, {bool ref = false}) {
    final card = Map<String, Object?>.from(fares[name]! as Map);
    if (ref) {
      card['live'] = {
        ...Map<String, Object?>.from(card['live']! as Map),
        'ref': _ref,
        'staleAfter': DateTime.now()
            .add(const Duration(hours: 1))
            .toIso8601String(),
      };
    }
    return card;
  }

  Map<String, Object?> answer(Map<String, Object?> card) => {
    'id': _ref,
    'card': card,
    'fetched_at': DateTime.now().toIso8601String(),
    'error': null,
    'pinned': false,
  };

  Future<FakeBackend> show(
    WidgetTester tester,
    Map<String, Object?> card, {
    Size size = const Size(390, 2600),
    void Function(FakeBackend backend)? before,
  }) async {
    await setSize(tester, size);
    final m = _message('ui_live', [
      {'id': 'root', ...card},
    ]);
    final backend = FakeBackend()
      ..storedMessages = [
        ChatMessageView(
          id: 'msg-1',
          role: 'assistant',
          text: 'Here you go.',
          createdAt: DateTime(2026),
          ui: [
            UiPart(
              surfaceId: m['surfaceId']! as String,
              messages: m['messages']! as List<Object?>,
            ),
          ],
        ),
      ];
    before?.call(backend);
    await tester.pumpWidget(
      harness(backend, const ChatScreen(botId: botId, conversationId: convId)),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    return backend;
  }

  Future<void> tapKey(WidgetTester tester, String key) async {
    await tester.ensureVisible(find.byKey(Key(key)));
    await tester.pump();
    await tester.tap(find.byKey(Key(key)));
    // A message to the bot starts the chat's thinking animation, which never settles.
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 120));
    }
  }

  for (final size in const [Size(390, 2600), Size(1100, 2600)]) {
    for (final entry in {
      ...fares,
      'flight_search': composed['flight_search'],
    }.entries) {
      testWidgets('${entry.key} renders at ${size.width.toInt()} wide', (
        tester,
      ) async {
        await show(
          tester,
          Map<String, Object?>.from(entry.value! as Map),
          size: size,
        );
        _noErrors(tester);
        expect(find.byKey(const Key('botUi-ui_live')), findsOneWidget);
        final box = tester.getSize(find.byKey(const Key('botUi-ui_live')));
        expect(
          box.height,
          greaterThan(60),
          reason: '${entry.key} drew nothing',
        );
        await tester.pumpWidget(const SizedBox());
      });
    }
  }

  testWidgets('a Fares card moves along its strip of days without the bot', (
    tester,
  ) async {
    final card = sample('fares_strip', ref: true);
    final backend = await show(tester, card);
    backend.onRefreshLiveCard = (id, view) =>
        answer({...card, 'depart': ?view});
    expect(find.byKey(const Key('faresDay-2027-03-09')), findsOneWidget);
    expect(find.byKey(const Key('faresWatch')), findsOneWidget);
    await tapKey(tester, 'faresDay-2027-03-10');
    expect(backend.liveCardActions, contains('refresh:$_ref:2027-03-10:false'));
    // Nothing was sent to the bot, and a watch isn't offered on a day that isn't the card's own.
    expect(backend.sentUiActions, isEmpty);
    expect(find.byKey(const Key('faresWatch')), findsNothing);
    // Back on the searched day it is the card itself again.
    await tapKey(tester, 'faresDay-2027-03-12');
    expect(backend.liveCardActions.last, 'refresh:$_ref::false');
    expect(find.byKey(const Key('faresWatch')), findsOneWidget);
    _noErrors(tester);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'a Fares card says what to look at twice and filters on the device',
    (tester) async {
      await show(tester, sample('fares_stops'));
      // Two airlines on one way: a caution with its words, not a color alone.
      expect(find.text('Separate tickets'), findsWidgets);
      expect(find.textContaining('Book'), findsNWidgets(3));
      // Every option leaves in the morning or at night; none in the evening.
      await tapKey(tester, 'faresTimes');
      await tester.tap(find.text('Evening').last, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.text('No flights match these filters.'), findsOneWidget);
      expect(find.text('Time · 1'), findsOneWidget);
      await tapKey(tester, 'faresTimes');
      await tester.tap(find.text('Evening').last, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.textContaining('Book'), findsNWidgets(3));
      await tapKey(tester, 'faresBag');
      expect(find.text('No flights match these filters.'), findsOneWidget);
      _noErrors(tester);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('tapping a fare opens it flight by flight', (tester) async {
    final card = sample('fares_stops');
    final first = Map<String, Object?>.from(
      (card['options']! as List).first as Map,
    );
    await show(tester, card);
    await tapKey(tester, 'faresRow-${first['id']}');
    expect(find.byKey(const Key('fareDetailsPrice')), findsOneWidget);
    expect(find.textContaining('5J5054'), findsOneWidget);
    expect(find.textContaining('MM571'), findsOneWidget);
    expect(find.text('3h 10m layover in Tokyo (NRT)'), findsOneWidget);
    expect(find.text('Narita International'), findsWidgets);
    expect(find.textContaining('may be separate tickets'), findsOneWidget);
    expect(find.byKey(const Key('fareDetailsBook')), findsOneWidget);
    _noErrors(tester);
    await tapKey(tester, 'fareSheetClose');
    expect(find.byKey(const Key('fareDetailsPrice')), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a FareDetails card shows the flights the bot was asked about', (
    tester,
  ) async {
    await show(tester, sample('fare_details'));
    expect(find.text('Manila → Sapporo'), findsOneWidget);
    expect(find.textContaining('5J5054'), findsOneWidget);
    expect(find.text('3h 10m layover in Tokyo (NRT)'), findsOneWidget);
    expect(find.byKey(const Key('fareDetailsBook')), findsOneWidget);
    _noErrors(tester);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'a calendar opens a day in a sheet, and the bot only when asked',
    (tester) async {
      final card = sample('fare_calendar', ref: true);
      final day = Map<String, Object?>.from(fares['fares_strip']! as Map)
        ..remove('strip');
      final backend = await show(tester, card);
      backend.onRefreshLiveCard = (id, view) => answer(day);
      expect(find.text('March 2027'), findsOneWidget);
      expect(find.byKey(const Key('fareCalDay-2027-03-31')), findsOneWidget);
      await tapKey(tester, 'fareCalDay-2027-03-12');
      expect(
        backend.liveCardActions,
        contains('refresh:$_ref:2027-03-12:false'),
      );
      // The day's fares, with Book, and no message to the bot yet.
      expect(find.textContaining('Book'), findsWidgets);
      expect(backend.sentUiActions, isEmpty);
      _noErrors(tester);
      await tapKey(tester, 'faresOpenInChat');
      final sent = backend.sentUiActions.single;
      expect(sent['name'], 'flights.open');
      expect(sent['context'], containsPair('depart', '2027-03-12'));
      expect(sent['context'], containsPair('from', 'Manila'));
      expect(backend.sent.single, 'Show flights Manila → Tokyo on Mar 12');
      // The sheet closed and the calendar is still there to use.
      expect(find.byKey(const Key('faresOpenInChat')), findsNothing);
      expect(find.byKey(const Key('fareCalDay-2027-03-12')), findsOneWidget);
      // Asking the bot didn't use the card up: another day still opens.
      await tapKey(tester, 'fareCalDay-2027-03-14');
      expect(
        backend.liveCardActions,
        contains('refresh:$_ref:2027-03-14:false'),
      );
      await tapKey(tester, 'fareSheetClose');
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('a calendar moves a month through its own view', (tester) async {
    final card = sample('fare_calendar', ref: true);
    final backend = await show(tester, card);
    backend.onRefreshLiveCard = (id, view) => answer({
      ...card,
      'month': view ?? '2027-03',
      'days': [
        if (view != null)
          {'date': '$view-05', 'price': 7100, 'level': 'low'}
        else
          ...(card['days']! as List),
      ],
      'cheapest': view != null
          ? {'date': '$view-05', 'price': 7100}
          : card['cheapest'],
      'months': {'prev': '2027-03', 'next': '2027-05'},
    });
    await tapKey(tester, 'fareCalNext');
    expect(backend.liveCardActions, contains('refresh:$_ref:2027-04:false'));
    expect(find.text('April 2027'), findsOneWidget);
    expect(find.byKey(const Key('fareCalDay-2027-04-05')), findsOneWidget);
    // Back to the month the card was shown with: the card itself, no view.
    await tapKey(tester, 'fareCalPrev');
    expect(backend.liveCardActions.last, 'refresh:$_ref::false');
    expect(backend.sentUiActions, isEmpty);
    _noErrors(tester);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'an explore card opens a place: its month, then a day, then back',
    (tester) async {
      final card = sample('fare_explore', ref: true);
      final month = Map<String, Object?>.from(fares['fare_calendar']! as Map);
      final day = Map<String, Object?>.from(fares['fares_strip']! as Map)
        ..remove('strip');
      final backend = await show(tester, card);
      backend.onRefreshLiveCard = (id, view) =>
          answer(view != null && view.length > 11 ? day : month);
      expect(find.text('From Manila · anywhere'), findsOneWidget);
      expect(find.text('Kalibo'), findsOneWidget);
      await tapKey(tester, 'fareExploreMore');
      await tapKey(tester, 'farePlace-HKG');
      expect(backend.liveCardActions, contains('refresh:$_ref:HKG:false'));
      expect(find.text('March 2027'), findsOneWidget);
      await tapKey(tester, 'fareCalDay-2027-03-12');
      expect(
        backend.liveCardActions,
        contains('refresh:$_ref:HKG:2027-03-12:false'),
      );
      expect(find.byKey(const Key('faresOpenInChat')), findsOneWidget);
      await tapKey(tester, 'fareSheetBack');
      expect(find.text('March 2027'), findsOneWidget);
      expect(find.byKey(const Key('faresOpenInChat')), findsNothing);
      expect(backend.sentUiActions, isEmpty);
      _noErrors(tester);
      await tapKey(tester, 'fareSheetClose');
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'a sheet says so when its view can\'t be loaded, and tries again',
    (tester) async {
      final card = sample('fare_calendar', ref: true);
      final backend = await show(tester, card);
      var fail = true;
      backend.onRefreshLiveCard = (id, view) => fail
          ? {'id': id, 'card': card, 'error': 'That day has passed.'}
          : answer(
              Map<String, Object?>.from(fares['fares_strip']! as Map)
                ..remove('strip'),
            );
      await tapKey(tester, 'fareCalDay-2027-03-12');
      expect(find.text("Couldn't load these fares."), findsOneWidget);
      fail = false;
      await tapKey(tester, 'fareSheetRetry');
      expect(find.byKey(const Key('faresOpenInChat')), findsOneWidget);
      await tapKey(tester, 'fareSheetClose');
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('the search form sends what live.fares takes, once', (
    tester,
  ) async {
    final backend = await show(
      tester,
      Map<String, Object?>.from(composed['flight_search']! as Map),
    );
    expect(find.text('Where to?'), findsOneWidget);
    expect(find.text('Mar 12 – Mar 19'), findsOneWidget);
    await tapKey(tester, 'flightSearchInfantsPlus');
    await tapKey(tester, 'flightSearchCabin-business');
    await tapKey(tester, 'flightSearchGo');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'flights.search');
    expect(sent['context'], {
      'from': 'Manila',
      'to': 'Tokyo',
      'depart': '2027-03-12',
      'return': '2027-03-19',
      'adults': 2,
      'children': 1,
      'infants': 1,
      'cabin': 'business',
    });
    expect(backend.sent.single, 'Flights Manila → Tokyo, Mar 12 – Mar 19');
    // The form is used up: a second tap sends nothing.
    await tester.tap(
      find.byKey(const Key('flightSearchGo')),
      warnIfMissed: false,
    );
    await tester.pump();
    expect(backend.sentUiActions, hasLength(1));
    _noErrors(tester);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('the search form looks airports up and can search anywhere', (
    tester,
  ) async {
    final backend = await show(tester, {
      'component': 'FlightSearch',
      'from': 'Manila',
      'depart': '2027-03-12',
      'trip': 'oneway',
    });
    // Nothing to send until there is somewhere to go.
    expect(
      tester
          .widget<FilledButton>(find.byKey(const Key('flightSearchGo')))
          .onPressed,
      isNull,
    );
    await tester.enterText(find.byKey(const Key('flightSearchTo')), 'tok');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump();
    expect(backend.airportQueries, ['tok']);
    expect(find.byKey(const Key('flightSearchHit-HND+NRT')), findsOneWidget);
    // One airport sends its code; the field keeps its name.
    await tester.tap(find.byKey(const Key('flightSearchHit-NRT')));
    await tester.pumpAndSettle();
    expect(find.text('Narita (NRT)'), findsOneWidget);
    expect(find.byKey(const Key('flightSearchHit-HND+NRT')), findsNothing);
    await tapKey(tester, 'flightSearchGo');
    expect(backend.sentUiActions.single['context'], {
      'from': 'Manila',
      'to': 'NRT',
      'depart': '2027-03-12',
      'adults': 1,
      'children': 0,
      'infants': 0,
      'cabin': 'economy',
    });
    _noErrors(tester);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a whole month away sends the month and the nights', (
    tester,
  ) async {
    final backend = await show(tester, {
      'component': 'FlightSearch',
      'from': 'Manila',
      'depart': '2027-03-12',
      'return': '2027-03-19',
    });
    await tapKey(tester, 'flightSearchAnywhere');
    await tapKey(tester, 'flightSearchWholeMonth');
    expect(find.byKey(const Key('flightSearchDates')), findsNothing);
    await tapKey(tester, 'flightSearchNightsPlus');
    await tapKey(tester, 'flightSearchGo');
    expect(backend.sentUiActions.single['context'], {
      'from': 'Manila',
      'to': 'anywhere',
      'depart': '2027-03',
      'nights': 8,
      'adults': 1,
      'children': 0,
      'infants': 0,
      'cabin': 'economy',
    });
    expect(backend.sent.single, 'Flights Manila → Anywhere, March 2027');
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('Not now closes the form without a search', (tester) async {
    final backend = await show(tester, {'component': 'FlightSearch'});
    await tapKey(tester, 'flightSearchSkip');
    expect(backend.sentUiActions.single['name'], 'flights.skip');
    expect(backend.sent.single, 'Not now');
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'Edit search opens the form with the card\'s trip and leaves the card usable',
    (tester) async {
      final card = sample('fares_strip');
      final backend = await show(tester, card);
      await tapKey(tester, 'faresEdit');
      expect(find.byKey(const Key('flightSearchGo')), findsOneWidget);
      expect(find.text('One way'), findsOneWidget);
      await tapKey(tester, 'flightSearchAdultsPlus');
      await tapKey(tester, 'flightSearchGo');
      final sent = backend.sentUiActions.single;
      // Not the form's own event: the Fares card it came from isn't used up.
      expect(sent['name'], 'flights.open');
      expect(sent['context'], containsPair('adults', 2));
      expect(sent['context'], containsPair('depart', '2027-03-12'));
      expect(find.byKey(const Key('flightSearchGo')), findsNothing);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'the watches card lists the person\'s own watches and stops one',
    (tester) async {
      final backend = await show(
        tester,
        sample('fare_watches'),
        before: (b) => b.fareWatchList.addAll([
          {
            'id': 'w-1',
            'card_id': 'card-1',
            'route': 'Manila → Tokyo · Mar 12–19',
            'below': 15000,
            'currency': 'PHP',
            'first_price': 17772,
            'last_price': 15900,
            'low_price': 15400,
            'history': [
              [1795305600, 17772],
              [1795327200, 16800],
              [1795348800, 15400],
              [1795370400, 15900],
            ],
            'ends_at': '2027-03-12T15:59:59Z',
            'created_at': '2026-11-22T00:00:00Z',
          },
          {
            'id': 'w-2',
            'card_id': 'card-2',
            'route': 'Cebu → Singapore · Apr 2',
            'below': null,
            'currency': 'PHP',
            'first_price': 4100,
            'last_price': 4210,
            'history': [
              [1795305600, 4100],
            ],
            'ends_at': '2027-01-19T00:00:00Z',
            'created_at': '2026-11-20T00:00:00Z',
          },
        ]),
      );
      await tester.pumpAndSettle();
      expect(find.text('Price watches'), findsOneWidget);
      expect(find.text('2/5'), findsOneWidget);
      expect(find.text('Manila → Tokyo · Mar 12–19'), findsOneWidget);
      expect(find.text('₱15,900'), findsOneWidget);
      expect(find.textContaining('Target ₱15,000'), findsOneWidget);
      expect(find.textContaining('lowest ₱15,400'), findsOneWidget);
      expect(find.textContaining('Any big drop'), findsOneWidget);
      _noErrors(tester);
      await tapKey(tester, 'fareWatchesStop-card-1');
      expect(backend.liveCardActions, contains('unwatch:card-1'));
      expect(find.text('Manila → Tokyo · Mar 12–19'), findsNothing);
      expect(find.text('1/5'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'a price trend shows where today sits and asks the bot for fares',
    (tester) async {
      final backend = await show(tester, sample('fare_trend'));
      expect(find.text('Manila → Tokyo'), findsOneWidget);
      expect(find.text('Low now'), findsOneWidget);
      expect(find.byKey(const Key('fareTrendNow')), findsOneWidget);
      expect(find.textContaining('Usually ₱6,200–₱11,800'), findsOneWidget);
      expect(find.byKey(const Key('fareTrendHistory')), findsOneWidget);
      expect(find.textContaining('The last 58 days'), findsOneWidget);
      // A snapshot: nothing to refresh.
      expect(find.byTooltip('Refresh'), findsNothing);
      _noErrors(tester);
      await tapKey(tester, 'fareTrendSeeFares');
      expect(backend.sentUiActions.single['name'], 'flights.open');
      expect(
        backend.sentUiActions.single['context'],
        containsPair('depart', '2027-03-12'),
      );
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('the watches card says when there is nothing watched', (
    tester,
  ) async {
    await show(tester, sample('fare_watches'));
    await tester.pumpAndSettle();
    expect(
      find.textContaining("You're not watching any fares"),
      findsOneWidget,
    );
    expect(find.text('0/5'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
