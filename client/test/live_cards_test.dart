// Live data cards and composed cards (docs/RICH-CARDS-PLAN.md): every card renders the shapes the
// server sends (fixtures written from the real providers) without errors or overflows, on a phone
// and a wide window; refresh goes through the API and swaps in the new data; Quiz answers.
import 'dart:convert';
import 'dart:io';

import 'package:casama/core/backend.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/chat/widgets/cards/live_tools.dart' show convertUnit;
import 'package:casama/features/settings/cards_settings_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

Map<String, Object?> _load(String name) {
  final f = File('../packages/contracts/fixtures/$name');
  return Map<String, Object?>.from(jsonDecode(f.readAsStringSync()) as Map);
}

Map<String, Object?> _message(String id, List<Map<String, Object?>> components) => {
  'surfaceId': id,
  'messages': [
    {
      'version': '1.0',
      'createSurface': {'surfaceId': id, 'catalogId': 'https://a2ui.org/specification/v1_0/catalogs/basic/catalog.json'},
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

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));
  final live = _load('live-cards.json');
  final composed = _load('composed-cards.json');

  Future<FakeBackend> show(WidgetTester tester, List<Map<String, Object?>> components, {Size size = const Size(420, 1600)}) async {
    await setSize(tester, size);
    final m = _message('ui_live', components);
    final backend = FakeBackend()
      ..storedMessages = [
        ChatMessageView(
          id: 'msg-1',
          role: 'assistant',
          text: 'Here you go.',
          createdAt: DateTime(2026),
          ui: [UiPart(surfaceId: m['surfaceId']! as String, messages: m['messages']! as List<Object?>)],
        ),
      ];
    await tester.pumpWidget(harness(backend, const ChatScreen(botId: botId, conversationId: convId)));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    return backend;
  }

  for (final size in const [Size(390, 2400), Size(1100, 2400)]) {
    for (final entry in {...live, ...composed}.entries) {
      testWidgets('${entry.key} renders at ${size.width.toInt()} wide', (tester) async {
        final card = Map<String, Object?>.from(entry.value! as Map);
        await show(tester, [
          {'id': 'root', ...card},
        ], size: size);
        _noErrors(tester);
        // The card drew something: its summary or its own title is on screen.
        expect(find.byKey(const Key('botUi-ui_live')), findsOneWidget);
        final box = tester.getSize(find.byKey(const Key('botUi-ui_live')));
        expect(box.height, greaterThan(60), reason: '${entry.key} drew nothing');
        // Leave clocks and countdowns ticking off the test.
        await tester.pumpWidget(const SizedBox());
      });
    }
  }

  testWidgets('a Comparison keeps long names whole and scrolls when there are many items', (tester) async {
    Map<String, Object?> card(List<String> items) => {
      'component': 'Comparison',
      'title': 'Starbucks whole beans on Lazada',
      'items': items,
      'rows': [
        {'label': 'Price', 'values': [for (final _ in items) '₱1,150 (was ₱1,300)'], 'best': items.length - 1},
        {'label': 'Sold / rating', 'values': [for (final _ in items) '1.5K sold · 4.9 (327)'], 'best': 0},
        {'label': 'Seller', 'values': [for (final _ in items) 'BARISTA HOUSE · 98%'], 'best': 0},
        {'label': 'Delivery', 'values': ['5–10 Dec'], 'best': 0},
      ],
    };
    await show(tester, [
      {'id': 'root', ...card(['Espresso Roast', 'Sumatra Dark', 'House Blend (Japan)'])},
    ], size: const Size(390, 2400));
    _noErrors(tester);
    expect(find.text('Espresso Roast'), findsOneWidget);
    expect(find.text('Wins 3'), findsOneWidget);
    // A row with fewer values than items fills the gap instead of shifting columns.
    expect(find.text('—'), findsNWidgets(2));
    await tester.pumpWidget(const SizedBox());
    await show(tester, [
      {'id': 'root', ...card(['Espresso Roast', 'Sumatra Dark', 'House Blend', 'Veranda Blend', 'Pike Place'])},
    ], size: const Size(390, 2400));
    _noErrors(tester);
    expect(find.descendant(of: find.byKey(const Key('botUi-ui_live')), matching: find.byWidgetPredicate((w) => w is SingleChildScrollView && w.scrollDirection == Axis.horizontal)), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a Dashboard lays several cards out', (tester) async {
    await show(tester, [
      {'id': 'root', 'component': 'Dashboard', 'title': 'Morning brief', 'children': ['w', 'q', 'c']},
      {'id': 'w', ...Map<String, Object?>.from(live['weather_now']! as Map)},
      {'id': 'q', ...Map<String, Object?>.from(live['quote_crypto']! as Map)},
      {'id': 'c', ...Map<String, Object?>.from(composed['countdown']! as Map)},
    ], size: const Size(1100, 2400));
    _noErrors(tester);
    expect(find.text('Morning brief'), findsOneWidget);
    expect(find.text('San Francisco'), findsWidgets);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a Fares card sorts, filters and shows every option on the device', (tester) async {
    await show(tester, [
      {'id': 'root', ...Map<String, Object?>.from(live['fares_kiwi']! as Map)},
    ], size: const Size(390, 2400));
    _noErrors(tester);
    expect(find.text('Manila → Tokyo'), findsOneWidget);
    expect(find.text('from ₱17,772'), findsOneWidget);
    // Three options until Show all; every one has a Book button.
    expect(find.textContaining('Book'), findsNWidgets(3));
    await tester.tap(find.byKey(const Key('faresMore')));
    await tester.pump();
    expect(find.textContaining('Book'), findsNWidgets(6));
    await tester.tap(find.byKey(const Key('faresSort-fastest')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('faresDirect')));
    await tester.pump();
    _noErrors(tester);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a Fares card watches its price and stops', (tester) async {
    const ref = '00000000-0000-0000-0000-0000000000f1';
    final card = Map<String, Object?>.from(live['fares_kiwi']! as Map);
    card['live'] = {...Map<String, Object?>.from(card['live']! as Map), 'ref': ref};
    final backend = await show(tester, [
      {'id': 'root', ...card},
    ], size: const Size(390, 2400));
    backend.onRefreshLiveCard = (id, view) => {'id': id, 'card': card, 'error': null, 'pinned': false};
    await tester.ensureVisible(find.byKey(const Key('faresWatch')));
    await tester.tap(find.byKey(const Key('faresWatch')));
    await tester.pumpAndSettle();
    expect(find.text('Watch this price'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('faresWatchTarget')), '15000');
    await tester.tap(find.byKey(const Key('faresWatchStart')));
    await tester.pumpAndSettle();
    expect(backend.liveCardActions, contains('watch:$ref:15000.0'));
    expect(find.textContaining('Watching for ₱15,000 or less'), findsOneWidget);
    _noErrors(tester);
    await tester.tap(find.byKey(const Key('faresWatchStop')));
    await tester.pumpAndSettle();
    expect(backend.liveCardActions, contains('unwatch:$ref'));
    expect(find.byKey(const Key('faresWatch')), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a Fares card with affiliate links says so', (tester) async {
    final card = Map<String, Object?>.from(live['fares_kiwi']! as Map)..['affiliate'] = true;
    await show(tester, [
      {'id': 'root', ...card},
    ], size: const Size(390, 2400));
    _noErrors(tester);
    expect(find.byKey(const Key('faresAffiliate')), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a Fares card shows its compare link only when it is https', (tester) async {
    final card = Map<String, Object?>.from(live['fares_kiwi']! as Map)
      ..['affiliate'] = true
      ..['compare'] = {'name': 'Aviasales', 'url': 'https://tp.example/r?u=x'};
    await show(tester, [
      {'id': 'root', ...card},
    ], size: const Size(390, 2400));
    _noErrors(tester);
    expect(find.byKey(const Key('faresCompare')), findsOneWidget);
    expect(find.text('Compare on Aviasales'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    card['compare'] = {'name': 'Aviasales', 'url': 'javascript:alert(1)'};
    await show(tester, [
      {'id': 'root', ...card},
    ], size: const Size(390, 2400));
    expect(find.byKey(const Key('faresCompare')), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a Parcel card with no live status links the carrier pages (D-480)', (tester) async {
    final now = DateTime.now().toUtc();
    final live = {
      'source': {'id': 'carrier', 'name': 'Carrier tracking page'},
      'fetchedAt': now.toIso8601String(),
      'staleAfter': now.add(const Duration(days: 1)).toIso8601String(),
    };
    await show(tester, [
      {
        'id': 'root',
        'component': 'Parcel',
        'tracking': '1Z999AA10123456784',
        'carrier': 'UPS',
        'status': 'unknown',
        'events': <Object?>[],
        'links': [
          {'name': 'UPS', 'url': 'https://www.ups.com/track?tracknum=1Z999AA10123456784'},
          {'name': 'Evil', 'url': 'javascript:alert(1)'},
          {'name': '17TRACK', 'url': 'https://t.17track.net/en#nums=1Z999AA10123456784'},
        ],
        'live': live,
      },
    ], size: const Size(390, 1200));
    _noErrors(tester);
    expect(find.textContaining('No live status'), findsOneWidget);
    expect(find.text('Track on UPS'), findsOneWidget);
    expect(find.text('Track on 17TRACK'), findsOneWidget);
    expect(find.text('Track on Evil'), findsNothing);
    expect(find.text('Label made'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a full workspace hears it can watch no more', (tester) async {
    const ref = '00000000-0000-0000-0000-0000000000f2';
    final card = Map<String, Object?>.from(live['fares_kiwi']! as Map);
    card['live'] = {...Map<String, Object?>.from(card['live']! as Map), 'ref': ref};
    final backend = await show(tester, [
      {'id': 'root', ...card},
    ], size: const Size(390, 2400));
    backend.watchFull = true;
    await tester.ensureVisible(find.byKey(const Key('faresWatch')));
    await tester.tap(find.byKey(const Key('faresWatch')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('faresWatchStart')));
    await tester.pumpAndSettle();
    expect(find.textContaining('already watching 10 prices'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('Settings → Cards lists price watches and stops one', (tester) async {
    await setSize(tester, const Size(390, 2400));
    final backend = FakeBackend();
    await backend.watchFares('card-1', below: 9000);
    await tester.pumpWidget(harness(backend, const CardsSettingsScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Manila → Tokyo · Mar 12–Mar 19'), findsOneWidget);
    expect(find.textContaining('Now ₱10,200'), findsOneWidget);
    await tester.ensureVisible(find.byKey(const Key('cardsFareWatch-card-1')));
    await tester.tap(find.descendant(of: find.byKey(const Key('cardsFareWatch-card-1')), matching: find.text('Stop')));
    await tester.pumpAndSettle();
    expect(backend.liveCardActions, contains('unwatch:card-1'));
    expect(find.textContaining('No price watches'), findsOneWidget);
    _noErrors(tester);
  });

  testWidgets('a Google Fares card says the return is picked on Google', (tester) async {
    await show(tester, [
      {'id': 'root', ...Map<String, Object?>.from(live['fares_google']! as Map)},
    ], size: const Size(390, 2400));
    _noErrors(tester);
    expect(find.text('See all on Google Flights'), findsOneWidget);
    expect(find.textContaining('Usually ₱13,000–₱29,500'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a Carousel swipes between cards', (tester) async {
    await show(tester, [
      {'id': 'root', 'component': 'Carousel', 'children': ['a', 'b']},
      {'id': 'a', ...Map<String, Object?>.from(live['fx']! as Map)},
      {'id': 'b', ...Map<String, Object?>.from(live['quote_crypto']! as Map)},
    ]);
    _noErrors(tester);
    expect(find.text('Currency'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('refresh asks the API by id and shows the new numbers', (tester) async {
    final card = Map<String, Object?>.from(live['quote_crypto']! as Map);
    final liveBlock = Map<String, Object?>.from(card['live']! as Map)
      ..['ref'] = '11111111-1111-1111-1111-111111111111'
      ..['staleAfter'] = DateTime.now().add(const Duration(hours: 1)).toIso8601String();
    card['live'] = liveBlock;
    final backend = await show(tester, [
      {'id': 'root', ...card},
    ]);
    backend.onRefreshLiveCard = (id, view) => {
      'id': id,
      'card': {...card, 'price': 123456.0, 'live': liveBlock},
      'fetched_at': DateTime.now().toIso8601String(),
      'error': null,
      'pinned': false,
    };
    await tester.tap(find.byTooltip('Refresh').first);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(backend.liveCardActions, contains('refresh:11111111-1111-1111-1111-111111111111::true'));
    expect(find.textContaining('123,456'), findsWidgets);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a chart range is a view the API fills', (tester) async {
    final card = Map<String, Object?>.from(live['quote_stock']! as Map);
    card['live'] = {...Map<String, Object?>.from(card['live']! as Map), 'ref': '22222222-2222-2222-2222-222222222222', 'staleAfter': DateTime.now().add(const Duration(hours: 1)).toIso8601String()};
    final backend = await show(tester, [
      {'id': 'root', ...card},
    ]);
    backend.onRefreshLiveCard = (id, view) => {'id': id, 'card': card, 'fetched_at': DateTime.now().toIso8601String(), 'error': null, 'pinned': false};
    await tester.tap(find.text('1Y'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(backend.liveCardActions.last, startsWith('refresh:22222222-2222-2222-2222-222222222222:1Y'));
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('Quiz shows the right answer and tells the bot', (tester) async {
    final backend = await show(tester, [
      {'id': 'root', ...Map<String, Object?>.from(composed['quiz']! as Map)},
    ]);
    await tester.tap(find.text('Samar'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(backend.sentUiActions.last['name'], 'quiz.answer');
    expect((backend.sentUiActions.last['context']! as Map)['correct'], false);
    expect(find.textContaining('Luzon covers'), findsOneWidget);
  });

  test('units convert', () {
    expect(convertUnit(10, 'km', 'mi'), closeTo(6.2137, 0.001));
    expect(convertUnit(100, 'c', 'f'), closeTo(212, 0.001));
    expect(convertUnit(1, 'cup', 'ml'), closeTo(236.588, 0.01));
    expect(convertUnit(1, 'kg', 'km'), isNull);
  });
}
