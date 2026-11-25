// The hotel cards (docs/STAYS-AND-SHOPPING-PLAN.md §15): each renders what the server's builders
// make from recorded trivago and Google answers (packages/contracts/fixtures/
// stays-products-cards.json, written by packages/agent/scripts/stays-products-fixtures.ts) on a
// phone and a wide window; a Stays card sorts, filters, maps, opens and compares its rows on the
// device; the search form sends what live.stays takes; a booking shows with and without its
// optional fields.
import 'dart:convert';
import 'dart:io';

import 'package:casama/core/backend.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/chat/widgets/cards/live_kit.dart'
    show LivePanel;
import 'package:casama/features/chat/widgets/cards/stay_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
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

// The fixture's own ids, in the card's order.
const _grandArc = '100-2217308';
const _sotetsu = '100-2617476';
const _dormy = '100-5819096';
const _otemachi = '100-1154812';
const _mitsukoshimae = '100-1328267';
const _gate = '100-10940628';

const _booking = <String, Object?>{
  'component': 'StayBooking',
  'name': 'Hotel Grand Arc Hanzomon',
  'imageUrl': 'https://imgcy.trivago.com/partner-images/f0/43/x.jpeg',
  'address': '1-1 Hayabusacho, Chiyoda City, Tokyo 102-0092, Japan',
  'lat': 35.6831,
  'lng': 139.7434,
  'checkIn': '2027-03-12',
  'checkOut': '2027-03-15',
  'checkInTime': '3:00 PM',
  'checkOutTime': '11:00 AM',
  'guests': 2,
  'room': 'Standard Double Room',
  'confirmation': 'BK-4821-7730',
  'total': 29013,
  'currency': 'PHP',
  'paid': 'pay_at_property',
  'cancelBy': '2027-03-10',
  'site': 'Booking.com',
  'url': 'https://www.booking.com/mybooking.html',
  'phone': '+81 3-3288-0111',
  'source': {'name': 'Booking.com'},
};

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));
  final cards = _load('stays-products-cards.json');

  Map<String, Object?> sample(String name) =>
      Map<String, Object?>.from(cards[name]! as Map);

  Future<FakeBackend> show(
    WidgetTester tester,
    Map<String, Object?> card, {
    Size size = const Size(390, 3000),
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
    await tester.pumpWidget(
      harness(backend, const ChatScreen(botId: botId, conversationId: convId)),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    return backend;
  }

  /// Sheets slide in, and a message to the bot starts the chat's thinking animation, which never
  /// settles: a fixed number of frames instead of pumpAndSettle.
  Future<void> frames(WidgetTester tester) async {
    for (var i = 0; i < 8; i++) {
      await tester.pump(const Duration(milliseconds: 120));
    }
  }

  Future<void> tapKey(WidgetTester tester, String key) async {
    await tester.ensureVisible(find.byKey(Key(key)).last);
    await tester.pump();
    await tester.tap(find.byKey(Key(key)).last);
    await frames(tester);
  }

  /// The stays on show, by id, top to bottom.
  List<String> rows(WidgetTester tester) {
    final found = <(double, String)>[];
    for (final e in find.byType(InkWell).evaluate()) {
      final key = e.widget.key;
      if (key is ValueKey<String> && key.value.startsWith('staysRow-')) {
        final box = e.renderObject! as RenderBox;
        found.add((box.localToGlobal(Offset.zero).dy, key.value.substring(9)));
      }
    }
    found.sort((a, b) => a.$1.compareTo(b.$1));
    return [for (final f in found) f.$2];
  }

  Future<void> end(WidgetTester tester) async {
    _noErrors(tester);
    // Leave nothing ticking off the test.
    await tester.pumpWidget(const SizedBox());
  }

  for (final size in const [Size(360, 3600), Size(1100, 3600)]) {
    for (final entry in <String, Map<String, Object?>>{
      for (final name in const [
        'stays',
        'stays_google',
        'stay_details',
        'stay_details_more',
        'stay_trend',
      ])
        name: sample(name),
      'stay_search': {'component': 'StaySearch', 'where': 'Shinjuku, Tokyo'},
      'stay_booking': _booking,
    }.entries) {
      testWidgets('${entry.key} renders at ${size.width.toInt()} wide', (
        tester,
      ) async {
        await show(tester, entry.value, size: size);
        _noErrors(tester);
        expect(find.byKey(const Key('botUi-ui_live')), findsOneWidget);
        final box = tester.getSize(find.byKey(const Key('botUi-ui_live')));
        expect(
          box.height,
          greaterThan(60),
          reason: '${entry.key} drew nothing',
        );
        await end(tester);
      });
    }
  }

  testWidgets('a Stays card says what the search was and what each row costs', (
    tester,
  ) async {
    await show(tester, sample('stays'));
    expect(find.text('Tokyo'), findsOneWidget);
    expect(find.text('Mar 12 – Mar 15 · 3 nights · 2 guests'), findsOneWidget);
    expect(find.text('from ₱6,592 a night'), findsOneWidget);
    // The first three, in the server's order.
    expect(rows(tester), [_grandArc, _sotetsu, _dormy]);
    expect(find.text('Hotel Grand Arc Hanzomon'), findsOneWidget);
    expect(find.text('8.8 of 10 · 7,316'), findsOneWidget);
    expect(find.text('3.2 km to Akihabara Station'), findsOneWidget);
    expect(find.textContaining('₱9,671'), findsOneWidget);
    expect(find.text('₱29,013 for 3 nights'), findsOneWidget);
    expect(
      find.text('Booking.com · No breakfast · Free cancellation'),
      findsNWidgets(3),
    );
    expect(find.text('+2 more sites'), findsNWidgets(3));
    expect(find.byKey(const Key('staysDeal-$_grandArc')), findsOneWidget);
    expect(
      find.text('The price is checked on the booking site.'),
      findsOneWidget,
    );
    await end(tester);
  });

  testWidgets('a Stays card sorts, filters and shows every row on the device', (
    tester,
  ) async {
    final backend = await show(tester, sample('stays'));
    await tapKey(tester, 'staysMore');
    expect(rows(tester), [
      _grandArc,
      _sotetsu,
      _dormy,
      _otemachi,
      _mitsukoshimae,
      _gate,
    ]);
    await tapKey(tester, 'staysSort-cheapest');
    expect(rows(tester).first, _mitsukoshimae);
    expect(rows(tester).last, _gate);
    // Ratings are compared as a share of their own scale.
    await tapKey(tester, 'staysSort-top_rated');
    expect(rows(tester).take(3), [_gate, _dormy, _grandArc]);
    // Two are 1 km away: the cheaper of them first.
    await tapKey(tester, 'staysSort-closest');
    expect(rows(tester).take(2), [_otemachi, _gate]);

    await tapKey(tester, 'staysSort-best');
    await tapKey(tester, 'staysFilter-stars4');
    expect(rows(tester), [_gate]);
    await tapKey(tester, 'staysFilter-free_cancellation');
    expect(rows(tester), isEmpty);
    expect(find.text('Nothing matches these filters.'), findsOneWidget);
    await tapKey(tester, 'staysFilter-stars4');
    // Any site's deal counts: Otemachi's cheapest is non-refundable, another site's isn't.
    expect(rows(tester), [
      _grandArc,
      _sotetsu,
      _dormy,
      _otemachi,
      _mitsukoshimae,
    ]);
    await tapKey(tester, 'staysFilter-free_cancellation');
    await tapKey(tester, 'staysFilter-rated8');
    expect(rows(tester), [_grandArc, _sotetsu, _dormy, _otemachi, _gate]);
    await tapKey(tester, 'staysFilter-rated8');
    await tapKey(tester, 'staysFilter-pay_at_property');
    expect(rows(tester), [_grandArc]);
    await tapKey(tester, 'staysFilter-pay_at_property');
    // Amenity chips come from the results; one every place has is left out.
    expect(find.byKey(const Key('staysFilter-has:WiFi')), findsNothing);
    await tapKey(tester, 'staysFilter-has:Spa');
    expect(rows(tester), [_dormy]);
    // Nothing was asked of the bot or the server.
    expect(backend.sentUiActions, isEmpty);
    expect(backend.liveCardActions, isEmpty);
    await end(tester);
  });

  testWidgets('a row opens in full in a sheet, and Book for me tells the bot', (
    tester,
  ) async {
    final backend = await show(tester, sample('stays'));
    await tapKey(tester, 'staysRow-$_grandArc');
    expect(find.byKey(const Key('cardSheetClose')), findsOneWidget);
    expect(
      find.text('Mar 12 – Mar 15 · 3 nights · 2 guests · 1 room'),
      findsOneWidget,
    );
    // Every site's price and terms, the cheapest marked.
    expect(find.text('Trip.com'), findsOneWidget);
    expect(find.text('Priceline'), findsOneWidget);
    expect(find.byKey(const Key('stayDealCheapest')), findsOneWidget);
    expect(find.text('Pay at the hotel'), findsOneWidget);
    expect(find.byKey(const Key('stayDeal-0')), findsOneWidget);
    expect(find.byKey(const Key('stayMap')), findsOneWidget);
    await tapKey(tester, 'stayBook');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'stays.book');
    final context = Map<String, Object?>.from(sent['context']! as Map);
    expect(context.remove('url'), startsWith('https://www.trivago.com.ph/'));
    expect(context, {
      'name': 'Hotel Grand Arc Hanzomon',
      'site': 'Booking.com',
      'check_in': '2027-03-12',
      'check_out': '2027-03-15',
      'adults': 2,
      'rooms': 1,
      'price': 29013,
      'currency': 'PHP',
    });
    expect(backend.sent.single, 'Book Hotel Grand Arc Hanzomon on Booking.com');
    // The sheet closed.
    expect(find.byKey(const Key('cardSheetClose')), findsNothing);
    await end(tester);
  });

  testWidgets('a StayDetails card lists every site and marks the cheapest', (
    tester,
  ) async {
    final backend = await show(tester, sample('stay_details_more'));
    expect(find.byKey(const Key('cardGallery')), findsOneWidget);
    expect(find.text('Traveluro'), findsOneWidget);
    expect(find.text('Check-in 3:00 PM · Check-out 11:00 AM'), findsOneWidget);
    expect(find.text('Meiji Jingu'), findsOneWidget);
    expect(find.text('10 min taxi'), findsOneWidget);
    expect(find.byKey(const Key('staySite')), findsOneWidget);
    expect(find.text('A forecast, not live prices.'), findsNothing);
    // Google's deals follow trivago's: the cheapest is found by price, not by place.
    expect(
      find.descendant(
        of: find.ancestor(
          of: find.text('Traveluro'),
          matching: find.byType(LivePanel),
        ),
        matching: find.byKey(const Key('stayDealCheapest')),
      ),
      findsOneWidget,
    );
    expect(find.byKey(const Key('stayDealCheapest')), findsOneWidget);
    await tapKey(tester, 'stayBook');
    final context = backend.sentUiActions.single['context']! as Map;
    expect(context['site'], 'Traveluro');
    expect(context['price'], 20219);
    await end(tester);
  });

  testWidgets('compare takes up to four stays and sets them side by side', (
    tester,
  ) async {
    await show(tester, sample('stays'));
    await tapKey(tester, 'staysMore');
    OutlinedButton compare() =>
        tester.widget<OutlinedButton>(find.byKey(const Key('staysCompare')));
    expect(compare().onPressed, isNull);
    await tapKey(tester, 'staysPick-$_grandArc');
    expect(compare().onPressed, isNull);
    for (final id in [_sotetsu, _dormy, _gate]) {
      await tapKey(tester, 'staysPick-$id');
    }
    expect(find.text('Compare (4)'), findsOneWidget);
    // A fifth can't be ticked, and its tick doesn't open the row under it.
    await tapKey(tester, 'staysPick-$_otemachi');
    expect(find.text('Compare (4)'), findsOneWidget);
    expect(find.byKey(const Key('cardSheetClose')), findsNothing);
    // Unticking one frees a place.
    await tapKey(tester, 'staysPick-$_dormy');
    expect(find.text('Compare (3)'), findsOneWidget);
    await tapKey(tester, 'staysCompare');
    final sheet = find.byKey(const Key('compareSheet'));
    expect(sheet, findsOneWidget);
    Finder inSheet(String text) =>
        find.descendant(of: sheet, matching: find.text(text));
    expect(inSheet('Hotel Grand Arc Hanzomon'), findsOneWidget);
    expect(inSheet('The Gate Hotel Tokyo by Hulic'), findsOneWidget);
    expect(inSheet('Dormy Inn Premium Tokyo Kodenmacho'), findsNothing);
    expect(inSheet('Price a night'), findsOneWidget);
    expect(inSheet('₱20,643'), findsOneWidget);
    expect(inSheet('₱61,928'), findsOneWidget);
    expect(inSheet('9.1 of 10 · 6,003'), findsOneWidget);
    expect(inSheet('4-star'), findsOneWidget);
    expect(inSheet('WiFi, A/C, Gym'), findsOneWidget);
    // Free cancellation: two have it, The Gate doesn't. Nobody has breakfast.
    expect(inSheet('Yes'), findsNWidgets(2));
    expect(inSheet('No'), findsNWidgets(4));
    await tapKey(tester, 'cardSheetClose');
    await end(tester);
  });

  testWidgets('the map shows a price pin for each stay and a pin opens it', (
    tester,
  ) async {
    await show(tester, sample('stays'));
    expect(find.byType(FlutterMap), findsNothing);
    await tester.ensureVisible(find.byKey(const Key('staysViewMap')));
    await tester.tap(find.byKey(const Key('staysViewMap')));
    await frames(tester);
    expect(find.byKey(const Key('staysMap')), findsOneWidget);
    expect(find.byType(FlutterMap), findsOneWidget);
    expect(rows(tester), isEmpty);
    // All six have coordinates; each pin says its price a night.
    expect(
      tester.widget<MarkerLayer>(find.byType(MarkerLayer)).markers,
      hasLength(6),
    );
    expect(find.text('₱9,671'), findsOneWidget);
    expect(find.text('₱20,643'), findsOneWidget);
    // The filters still apply.
    await tapKey(tester, 'staysFilter-stars4');
    expect(
      tester.widget<MarkerLayer>(find.byType(MarkerLayer)).markers,
      hasLength(1),
    );
    await tapKey(tester, 'staysFilter-stars4');
    await tester.tap(find.byKey(const Key('mapPin-0')), warnIfMissed: false);
    await frames(tester);
    expect(find.byKey(const Key('cardSheetClose')), findsOneWidget);
    expect(find.text('Hotel Grand Arc Hanzomon'), findsWidgets);
    expect(find.byKey(const Key('stayBook')), findsOneWidget);
    await tapKey(tester, 'cardSheetClose');
    await tester.tap(find.byKey(const Key('staysViewList')));
    await frames(tester);
    expect(rows(tester), hasLength(3));
    await end(tester);
  });

  testWidgets('a stay with no spot on the map says so', (tester) async {
    await show(tester, {
      'component': 'Stays',
      'place': {'label': 'Tokyo'},
      'stays': [
        {'id': 'a', 'name': 'No Coordinates Inn', 'night': 100, 'stay': 200},
      ],
    });
    await tester.tap(find.byKey(const Key('staysViewMap')));
    await frames(tester);
    expect(find.byType(FlutterMap), findsNothing);
    expect(
      find.text('None of these places has a spot on the map.'),
      findsOneWidget,
    );
    await end(tester);
  });

  testWidgets('Edit opens the form filled in with the card\'s own search', (
    tester,
  ) async {
    // Dates that are still ahead whenever this runs.
    final a = DateUtils.dateOnly(DateTime.now()).add(const Duration(days: 40));
    final b = a.add(const Duration(days: 3));
    final card = sample('stays')
      ..['checkIn'] = isoDay(a)
      ..['checkOut'] = isoDay(b)
      ..['search'] = {
        'where': 'Tokyo',
        'budget': 12000,
        'amenities': ['pool', 'free_cancellation'],
      };
    final backend = await show(tester, card);
    await tapKey(tester, 'staysEdit');
    expect(find.text('Find a place to stay'), findsOneWidget);
    expect(
      tester
          .widget<TextField>(find.byKey(const Key('staySearchWhere')))
          .controller!
          .text,
      'Tokyo',
    );
    expect(find.text('12000'), findsOneWidget);
    expect(find.text('PHP'), findsOneWidget);
    await tapKey(tester, 'staySearchRoomsPlus');
    await tapKey(tester, 'staySearchAmenity-pool');
    await tapKey(tester, 'staySearchAmenity-gym');
    await tapKey(tester, 'staySearchGo');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'stays.open');
    expect(sent['context'], {
      'where': 'Tokyo',
      'check_in': isoDay(a),
      'check_out': isoDay(b),
      'adults': 2,
      'rooms': 2,
      'budget': 12000,
      'amenities': ['free_cancellation', 'gym'],
    });
    expect(backend.sent.single, startsWith('Stays in Tokyo, '));
    expect(find.text('Find a place to stay'), findsNothing);
    await end(tester);
  });

  testWidgets('the search form needs a place and both dates, and sends once', (
    tester,
  ) async {
    final a = DateUtils.dateOnly(DateTime.now()).add(const Duration(days: 20));
    final b = a.add(const Duration(days: 2));
    FilledButton go() =>
        tester.widget<FilledButton>(find.byKey(const Key('staySearchGo')));

    // No dates: nothing to send, and the picker opens.
    await show(tester, {
      'component': 'StaySearch',
      'where': 'Cebu',
    }, size: const Size(1100, 900));
    expect(find.text('Find a place to stay'), findsOneWidget);
    expect(go().onPressed, isNull);
    await tapKey(tester, 'staySearchDates');
    expect(find.byType(DateRangePickerDialog), findsOneWidget);
    await tester.pumpWidget(const SizedBox());

    // A day that has passed is dropped, so the dates are asked for again.
    await show(tester, {
      'component': 'StaySearch',
      'where': 'Cebu',
      'checkIn': '2020-01-10',
      'checkOut': '2020-01-12',
    });
    expect(go().onPressed, isNull);
    expect(find.text('Pick dates'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());

    // Dates but no place.
    final backend = await show(tester, {
      'component': 'StaySearch',
      'title': 'Where in Cebu?',
      'checkIn': isoDay(a),
      'checkOut': isoDay(b),
      'adults': 3,
    });
    expect(find.text('Where in Cebu?'), findsOneWidget);
    expect(go().onPressed, isNull);
    expect(find.textContaining('2 nights'), findsOneWidget);
    // The place is looked up as it's typed; free text stands too.
    await tester.enterText(find.byKey(const Key('staySearchWhere')), 'man');
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pump();
    expect(find.text('Manila, Metro Manila, Philippines'), findsOneWidget);
    expect(go().onPressed, isNotNull);
    await tester.tap(find.byKey(const Key('staySearchHit-0')));
    await frames(tester);
    expect(find.byKey(const Key('staySearchHit-0')), findsNothing);
    await tapKey(tester, 'staySearchAdultsMinus');
    await tapKey(tester, 'staySearchGo');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'stays.search');
    expect(sent['context'], {
      'where': 'Manila',
      'check_in': isoDay(a),
      'check_out': isoDay(b),
      'adults': 2,
      'rooms': 1,
    });
    // The form is used up: a second tap sends nothing.
    await tester.tap(
      find.byKey(const Key('staySearchGo')),
      warnIfMissed: false,
    );
    await tester.pump();
    expect(backend.sentUiActions, hasLength(1));
    await end(tester);
  });

  testWidgets('Not now tells the bot to stop', (tester) async {
    final backend = await show(tester, {'component': 'StaySearch'});
    await tapKey(tester, 'staySearchSkip');
    expect(backend.sentUiActions.single['name'], 'stays.cancel');
    expect(backend.sent.single, 'Not now');
    await end(tester);
  });

  testWidgets('a StayTrend card switches class on the device and picks dates', (
    tester,
  ) async {
    final backend = await show(tester, sample('stay_trend'));
    expect(find.text('Tokyo · price by month'), findsOneWidget);
    expect(find.byKey(const Key('stayTrendMonth-2027-01')), findsOneWidget);
    expect(find.byKey(const Key('stayTrendMonth-2027-07')), findsOneWidget);
    expect(
      find.text('Cheapest: January, about ₱15,546 a night'),
      findsOneWidget,
    );
    expect(find.text('A forecast, not live prices.'), findsOneWidget);
    await tapKey(tester, 'stayTrendClass-3');
    expect(
      find.text('Cheapest: January, about ₱9,105 a night'),
      findsOneWidget,
    );
    await tapKey(tester, 'stayTrendClass-5');
    expect(find.text('Cheapest: July, about ₱42,774 a night'), findsOneWidget);
    expect(backend.liveCardActions, isEmpty);
    await tapKey(tester, 'stayTrendPick');
    expect(find.text('Find a place to stay'), findsOneWidget);
    expect(
      tester
          .widget<TextField>(find.byKey(const Key('staySearchWhere')))
          .controller!
          .text,
      'Tokyo',
    );
    await tapKey(tester, 'cardSheetClose');
    expect(backend.sentUiActions, isEmpty);
    await end(tester);
  });

  testWidgets('a StayBooking shows the stay and its own buttons', (
    tester,
  ) async {
    String? copied;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          copied = (call.arguments as Map)['text'] as String?;
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );
    final backend = await show(tester, _booking);
    expect(find.text('Hotel Grand Arc Hanzomon'), findsWidgets);
    expect(find.text('Booked with Booking.com'), findsOneWidget);
    expect(find.text('Fri, Mar 12'), findsOneWidget);
    expect(find.text('Mon, Mar 15'), findsOneWidget);
    expect(find.text('3:00 PM'), findsOneWidget);
    expect(
      find.text('3 nights · 2 guests · Standard Double Room'),
      findsOneWidget,
    );
    expect(find.text('BK-4821-7730'), findsOneWidget);
    expect(find.text('₱29,013'), findsOneWidget);
    expect(find.text('Pay at the hotel'), findsOneWidget);
    expect(find.text('Free cancellation until Mar 10'), findsOneWidget);
    expect(find.byKey(const Key('bookingMap')), findsOneWidget);
    for (final key in const [
      'bookingDirections',
      'bookingCall',
      'bookingManage',
      'bookingCalendar',
    ]) {
      expect(find.byKey(Key(key)), findsOneWidget, reason: key);
    }
    await tapKey(tester, 'bookingCopy');
    expect(copied, 'BK-4821-7730');
    await tapKey(tester, 'bookingCalendar');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'booking.calendar');
    expect(sent['context'], {
      'name': 'Hotel Grand Arc Hanzomon',
      'check_in': '2027-03-12',
      'check_out': '2027-03-15',
      'address': '1-1 Hayabusacho, Chiyoda City, Tokyo 102-0092, Japan',
    });
    await end(tester);
  });

  testWidgets('a StayBooking with only a name and dates leaves the rest out', (
    tester,
  ) async {
    final backend = await show(tester, {
      'component': 'StayBooking',
      'name': 'Casa Uno',
      'checkIn': '2027-05-01',
      'checkOut': '2027-05-02',
    });
    expect(find.text('Casa Uno'), findsOneWidget);
    expect(find.text('Your booking'), findsOneWidget);
    expect(find.text('1 night'), findsOneWidget);
    for (final key in const [
      'bookingMap',
      'bookingCopy',
      'bookingTotal',
      'bookingDirections',
      'bookingCall',
      'bookingManage',
    ]) {
      expect(find.byKey(Key(key)), findsNothing, reason: key);
    }
    await tapKey(tester, 'bookingCalendar');
    expect(backend.sentUiActions.single['context'], {
      'name': 'Casa Uno',
      'check_in': '2027-05-01',
      'check_out': '2027-05-02',
    });
    await end(tester);
  });

  for (final entry in <String, Map<String, Object?>>{
    'an empty Stays': {'component': 'Stays'},
    'a Stays row with only a name': {
      'component': 'Stays',
      'stays': [
        {'name': 'Somewhere'},
        {'id': 7, 'deals': 'none', 'rating': 'good', 'amenities': 3},
      ],
    },
    'a StayDetails with only a name': {
      'component': 'StayDetails',
      'stay': {'name': 'Somewhere'},
    },
    'a StayDetails with odd values': {
      'component': 'StayDetails',
      'checkIn': 'soon',
      'guests': 2,
      'stay': {
        'name': 'Somewhere',
        'lat': 400,
        'lng': 'east',
        'images': [1, null, 'http://not-https.example/x.jpg'],
        'deals': [
          {'site': 'A'},
          {
            'night': 'cheap',
            'terms': ['made_up', 4],
          },
        ],
        'nearby': ['a park'],
      },
    },
    'an empty StayTrend': {'component': 'StayTrend'},
    'a StayTrend with one month and no range': {
      'component': 'StayTrend',
      'place': {'label': 'Cebu'},
      'class': 4,
      'classes': [4],
      'months': [
        {'month': '2027-02', 'average': 3100},
        {'month': 'someday', 'average': 0},
      ],
    },
    'an empty StaySearch': {'component': 'StaySearch'},
    'a StaySearch with odd values': {
      'component': 'StaySearch',
      'where': 12,
      'checkIn': 'tomorrow',
      'adults': 40,
      'rooms': 0,
      'budget': 'low',
      'amenities': ['jacuzzi', 'pool'],
    },
    'a StayBooking with text for dates': {
      'component': 'StayBooking',
      'name': 'Casa Uno',
      'checkIn': 'Friday',
      'checkOut': 'Sunday',
      'cancelBy': 'the day before',
      'lat': 91,
      'lng': 0,
      'paid': 'paid',
    },
  }.entries) {
    testWidgets('${entry.key} never throws', (tester) async {
      await show(tester, entry.value, size: const Size(360, 2400));
      await end(tester);
    });
  }

  testWidgets('money shows whole units when whole and cents otherwise', (
    tester,
  ) async {
    late BuildContext context;
    await tester.pumpWidget(
      harness(
        FakeBackend(),
        Builder(
          builder: (c) {
            context = c;
            return const SizedBox();
          },
        ),
      ),
    );
    expect(cardMoney(context, 9671, 'PHP'), '₱9,671');
    expect(cardMoney(context, 4863.48, 'PHP'), '₱4,863.48');
    expect(cardMoney(context, 120.5, 'usd'), r'$120.50');
    expect(cardMoney(context, 1200, 'JPY'), '¥1,200');
    expect(cardMoney(context, 1200, null), '1,200');
    expect(nightsBetween('2027-03-12', '2027-03-15'), 3);
    expect(nightsBetween('2027-03-15', '2027-03-12'), isNull);
    expect(nightsBetween('soon', '2027-03-12'), isNull);
    expect(
      mapsLink(lat: 35.68, lng: 139.74),
      'https://www.google.com/maps/search/?api=1&query=35.68%2C139.74',
    );
    expect(mapsLink(address: '  '), isNull);
  });
}
