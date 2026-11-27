// The shopping cards (docs/STAYS-AND-SHOPPING-PLAN.md §15): each renders what the server's
// builders make from recorded Google Shopping and Shopify answers (packages/contracts/fixtures/
// stays-products-cards.json) on a phone and a wide window; a Products card sorts, filters, opens
// and compares its tiles on the device and asks the bot to compare one product's stores by its
// place in the card; Checkout sends its three answers; an Order shows with and without its
// optional fields.
import 'dart:convert';
import 'dart:io';

import 'package:casama/core/backend.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/chat/widgets/cards/live_kit.dart' show LivePill;
import 'package:flutter/services.dart';
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
const _p47 = '6830838209041902695';
const _catEar = '15319879854011478250';
const _soundgear = '13394993224174916901';
const _newBt = '17882176634304257545';
const _endurance = '16348904602268763809';
const _singleEar = '9261933754817149081';
const _enduranceBh = '16348904602268763809~2';

const _checkout = <String, Object?>{
  'component': 'Checkout',
  'kind': 'order',
  'seller': 'Lazada',
  'lines': [
    {
      'title': 'JBL Soundgear Clips',
      'detail': 'Black',
      'qty': 1,
      'amount': 4863.48,
    },
  ],
  'fees': [
    {'label': 'Delivery to Makati', 'amount': 0},
    {'label': 'Service fee', 'amount': 36.52},
  ],
  'total': 4900,
  'currency': 'PHP',
  'terms': 'Returns within 7 days · Arrives Mar 3–5',
  'url': 'https://www.lazada.com.ph/checkout',
  'source': {'name': 'Lazada'},
};

const _order = <String, Object?>{
  'component': 'Order',
  'store': 'Lazada',
  'orderId': 'LZ-88213',
  'placed': '2027-02-27',
  'items': [
    {
      'title': 'JBL Soundgear Clips',
      'qty': 2,
      'amount': 9726.96,
      'imageUrl': 'https://encrypted-tbn1.gstatic.com/shopping?q=x',
    },
    {'title': 'USB-C cable'},
  ],
  'total': 9726.96,
  'currency': 'PHP',
  'status': 'shipped',
  'eta': '2027-03-04',
  'trackingNumber': 'JT0012345678',
  'carrier': 'J&T Express',
  'url': 'https://my.lazada.com.ph/order/LZ-88213',
  'source': {'name': 'Lazada'},
};

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));
  final cards = _load('stays-products-cards.json');

  Map<String, Object?> sample(String name) =>
      Map<String, Object?>.from(cards[name]! as Map);

  Future<FakeBackend> show(
    WidgetTester tester,
    Map<String, Object?> card, {
    Size size = const Size(390, 3600),
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

  /// Where each tile on show is, by id, in reading order.
  List<(String id, Offset at)> tiles(WidgetTester tester) {
    final found = <(String, Offset)>[];
    for (final e in find.byType(InkWell).evaluate()) {
      final key = e.widget.key;
      if (key is ValueKey<String> && key.value.startsWith('productsTile-')) {
        final box = e.renderObject! as RenderBox;
        found.add((key.value.substring(13), box.localToGlobal(Offset.zero)));
      }
    }
    found.sort((a, b) {
      final dy = a.$2.dy.compareTo(b.$2.dy);
      return dy != 0 ? dy : a.$2.dx.compareTo(b.$2.dx);
    });
    return found;
  }

  List<String> ids(WidgetTester tester) => [
    for (final t in tiles(tester)) t.$1,
  ];

  Future<void> end(WidgetTester tester) async {
    _noErrors(tester);
    // Leave nothing ticking off the test.
    await tester.pumpWidget(const SizedBox());
  }

  for (final size in const [Size(360, 4200), Size(1100, 4200)]) {
    for (final entry in <String, Map<String, Object?>>{
      for (final name in const [
        'products',
        'products_shopify',
        'product_details',
        'product_details_shopify',
        'product_details_bare',
      ])
        name: sample(name),
      'checkout': _checkout,
      'order': _order,
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

  testWidgets('a Products card says what was searched and lays out a grid', (
    tester,
  ) async {
    await show(tester, sample('products'));
    expect(find.text('wireless earbuds'), findsOneWidget);
    expect(find.text('PH · under ₱5,000'), findsOneWidget);
    expect(find.text('from ₱118'), findsOneWidget);
    // The first six, in the server's order, two across on a phone.
    expect(ids(tester), [
      _p47,
      _catEar,
      _soundgear,
      _newBt,
      _endurance,
      _singleEar,
    ]);
    expect({for (final t in tiles(tester)) t.$2.dx}, hasLength(2));
    // Whole amounts have no cents; others keep them.
    expect(find.text('₱599'), findsOneWidget);
    expect(find.text('₱4,863.48'), findsOneWidget);
    expect(find.text('shopee.ph and other stores'), findsOneWidget);
    expect(find.text('5 (1.8K)'), findsOneWidget);
    expect(find.text('The price is checked at the store.'), findsOneWidget);
    await tapKey(tester, 'productsMore');
    expect(ids(tester), hasLength(7));
    expect(ids(tester).last, _enduranceBh);
    expect(find.text('PRICE DROP'), findsOneWidget);
    await end(tester);
  });

  testWidgets('a wide Products card has more tiles across', (tester) async {
    await show(tester, sample('products'), size: const Size(1100, 3000));
    expect(
      {for (final t in tiles(tester)) t.$2.dx}.length,
      greaterThanOrEqualTo(3),
    );
    await end(tester);
  });

  testWidgets('a Products card sorts and filters on the device', (
    tester,
  ) async {
    final backend = await show(tester, sample('products'));
    await tapKey(tester, 'productsMore');
    await tapKey(tester, 'productsSort-cheapest');
    expect(ids(tester).first, _catEar);
    expect(ids(tester).last, _soundgear);
    // The best rated first; between equals, the one more people rated.
    await tapKey(tester, 'productsSort-top_rated');
    expect(ids(tester).take(3), [_singleEar, _p47, _newBt]);
    await tapKey(tester, 'productsSort-best');

    // Store chips come from the results.
    await tapKey(tester, 'productsStore-Shopee');
    expect(ids(tester), [_catEar, _newBt, _singleEar]);
    await tapKey(tester, 'productsStore-Lazada Philippines');
    expect(ids(tester), [_catEar, _soundgear, _newBt, _singleEar]);
    await tapKey(tester, 'productsRated');
    expect(ids(tester), [_soundgear, _newBt, _singleEar]);
    await tapKey(tester, 'productsStore-Shopee');
    await tapKey(tester, 'productsStore-Lazada Philippines');
    expect(ids(tester), [_p47, _soundgear, _newBt, _singleEar]);
    // Nothing in this search has an old price.
    await tapKey(tester, 'productsSale');
    expect(ids(tester), isEmpty);
    expect(find.text('Nothing matches these filters.'), findsOneWidget);
    expect(backend.sentUiActions, isEmpty);
    expect(backend.liveCardActions, isEmpty);
    await end(tester);
  });

  testWidgets('a Shopify product opens with its versions and stock, without the model', (
    tester,
  ) async {
    const ref = '11111111-1111-4111-8111-111111111111';
    final card = sample('products_shopify');
    final id = ((card['products'] as List).first as Map)['id'] as String;
    final backend = await show(tester, {
      ...card,
      'live': {...(card['live'] as Map), 'ref': ref},
    });
    backend.onRefreshLiveCard = (_, _) => {'card': sample('product_details_shopify')};
    await tapKey(tester, 'productsTile-$id');
    await frames(tester);
    expect(backend.liveCardActions, contains('refresh:$ref:item:$id:false'));
    expect(find.byKey(const Key('productOffers')), findsOneWidget);
    expect(find.byKey(const Key('productOfferBuy-0')), findsOneWidget);
    expect(backend.sentUiActions, isEmpty);
    await end(tester);
  });

  testWidgets('a product from Google opens without a call: its stores cost a search', (
    tester,
  ) async {
    final card = sample('products');
    final id = ((card['products'] as List).first as Map)['id'] as String;
    final backend = await show(tester, {
      ...card,
      'live': {...(card['live'] as Map), 'ref': '11111111-1111-4111-8111-111111111111'},
    });
    await tapKey(tester, 'productsTile-$id');
    await frames(tester);
    expect(backend.liveCardActions.where((a) => a.contains(':item:')), isEmpty);
    expect(find.byKey(const Key('productOffers')), findsNothing);
    await end(tester);
  });

  testWidgets('a sale shows the old price struck through and the percent off', (
    tester,
  ) async {
    await show(tester, sample('products_shopify'));
    expect(find.text('₱3,100'), findsOneWidget);
    final old = tester.widget<Text>(find.text('₱6,900'));
    expect(old.style!.decoration, TextDecoration.lineThrough);
    expect(find.text('−55%'), findsOneWidget);
    // One store only: no store chips.
    expect(find.byKey(const Key('productsStore-Plug')), findsNothing);
    await tapKey(tester, 'productsSale');
    expect(ids(tester), hasLength(1));
    await end(tester);
  });

  testWidgets('Compare stores names the product by its place in the card', (
    tester,
  ) async {
    final backend = await show(tester, sample('products'));
    // Sorted another way on the device: the place sent is still the card's own.
    await tapKey(tester, 'productsMore');
    await tapKey(tester, 'productsSort-cheapest');
    await tapKey(tester, 'productsTile-$_soundgear');
    expect(find.byKey(const Key('cardSheetClose')), findsOneWidget);
    expect(find.text('JBL Soundgear Clips'), findsWidgets);
    expect(find.text('Lazada Philippines and other stores'), findsWidgets);
    expect(find.byKey(const Key('productBuy')), findsOneWidget);
    expect(find.byKey(const Key('productBuyForMe')), findsOneWidget);
    await tapKey(tester, 'productCompare');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'products.compare');
    expect(sent['context'], {
      'query': 'wireless earbuds',
      'detail': 3,
      'budget': 5000,
      'sort': 'best',
    });
    expect(backend.sent.single, 'Compare stores for JBL Soundgear Clips');
    expect(find.byKey(const Key('cardSheetClose')), findsNothing);
    await end(tester);
  });

  testWidgets('Compare stores carries the search\'s own stores and sort', (
    tester,
  ) async {
    final card = sample('products')
      ..['sort'] = 'cheapest'
      ..['stores'] = ['Shopee', 'Lazada']
      ..remove('budget');
    final backend = await show(tester, card);
    await tapKey(tester, 'productsTile-$_p47');
    await tapKey(tester, 'productCompare');
    expect(backend.sentUiActions.single['context'], {
      'query': 'wireless earbuds',
      'detail': 1,
      'stores': ['Shopee', 'Lazada'],
      'sort': 'cheapest',
    });
    await end(tester);
  });

  testWidgets('Buy for me from a tile tells the bot what and where', (
    tester,
  ) async {
    final backend = await show(tester, sample('products'));
    await tapKey(tester, 'productsTile-$_soundgear');
    await tapKey(tester, 'productBuyForMe');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'products.buy');
    final context = Map<String, Object?>.from(sent['context']! as Map);
    expect(context.remove('url'), startsWith('https://www.google.com/search'));
    expect(context, {
      'title': 'JBL Soundgear Clips',
      'store': 'Lazada Philippines',
      'price': 4863.48,
      'currency': 'PHP',
    });
    expect(
      backend.sent.single,
      'Buy JBL Soundgear Clips at Lazada Philippines',
    );
    await end(tester);
  });

  testWidgets('compare takes up to four products and sets them side by side', (
    tester,
  ) async {
    await show(tester, sample('products'));
    OutlinedButton compare() =>
        tester.widget<OutlinedButton>(find.byKey(const Key('productsCompare')));
    expect(compare().onPressed, isNull);
    for (final id in [_p47, _catEar, _soundgear, _newBt]) {
      await tapKey(tester, 'productsPick-$id');
    }
    expect(find.text('Compare (4)'), findsOneWidget);
    // A fifth can't be ticked, and its tick doesn't open the tile under it.
    await tapKey(tester, 'productsPick-$_endurance');
    expect(find.text('Compare (4)'), findsOneWidget);
    expect(find.byKey(const Key('cardSheetClose')), findsNothing);
    await tapKey(tester, 'productsPick-$_catEar');
    await tapKey(tester, 'productsPick-$_newBt');
    expect(find.text('Compare (2)'), findsOneWidget);
    await tapKey(tester, 'productsCompare');
    final sheet = find.byKey(const Key('compareSheet'));
    expect(sheet, findsOneWidget);
    Finder inSheet(String text) =>
        find.descendant(of: sheet, matching: find.text(text));
    expect(inSheet('JBL Soundgear Clips'), findsOneWidget);
    expect(inSheet('Price'), findsOneWidget);
    expect(inSheet('₱599'), findsOneWidget);
    expect(inSheet('₱4,863.48'), findsOneWidget);
    expect(inSheet('Lazada Philippines'), findsOneWidget);
    expect(inSheet('4.3 of 5 · 646'), findsOneWidget);
    expect(inSheet('Delivery'), findsOneWidget);
    await tapKey(tester, 'cardSheetClose');
    await end(tester);
  });

  testWidgets(
    'a ProductDetails card lists the stores and marks the lowest total',
    (tester) async {
      final backend = await show(tester, sample('product_details'));
      expect(find.text('JBL Soundgear Clips'), findsWidgets);
      expect(find.text('by JBL'), findsOneWidget);
      expect(find.byKey(const Key('cardGallery')), findsOneWidget);
      // Five stores, then the rest.
      expect(find.byKey(const Key('productOffer-4')), findsOneWidget);
      expect(find.byKey(const Key('productOffer-5')), findsNothing);
      expect(
        find.descendant(
          of: find.byKey(const Key('productOffer-0')),
          matching: find.byKey(const Key('productOfferLowest')),
        ),
        findsOneWidget,
      );
      expect(find.text('Delivery: Free'), findsNWidgets(2));
      await tapKey(tester, 'productOffersMore');
      expect(find.byKey(const Key('productOffer-7')), findsOneWidget);
      // Price and delivery together, where they differ.
      expect(find.text('Total ₱9,169'), findsNWidgets(2));
      // Five things about it, then the rest.
      expect(find.text('•  '), findsNWidgets(5));
      await tapKey(tester, 'productFeaturesMore');
      expect(find.text('•  '), findsNWidgets(8));
      expect(find.text('What buyers say'), findsOneWidget);
      expect(find.textContaining('extremely convenient'), findsOneWidget);
      expect(find.text('The price is checked at the store.'), findsOneWidget);
      expect(find.byKey(const Key('productDetailsBuy')), findsOneWidget);
      await tapKey(tester, 'productDetailsBuyForMe');
      final sent = backend.sentUiActions.single;
      expect(sent['name'], 'products.buy');
      final context = Map<String, Object?>.from(sent['context']! as Map);
      expect(context.remove('url'), startsWith('https://www.lazada.com.ph/'));
      expect(context, {
        'title': 'JBL Soundgear Clips',
        'store': 'Lazada Philippines',
        'price': 4863.48,
        'currency': 'PHP',
      });
      await end(tester);
    },
  );

  testWidgets(
    'offers that differ by version say which, and what is out of stock',
    (tester) async {
      final card = sample('product_details_shopify');
      final offers = [
        for (final o in card['offers']! as List)
          Map<String, Object?>.from(o as Map),
      ];
      // The cheapest is sold out: the next one is the one to buy.
      offers[0]['available'] = false;
      card['offers'] = offers;
      await show(tester, card);
      expect(
        find.textContaining('HEAVYS Wireless EarBuds *PreOrder'),
        findsWidgets,
      );
      expect(find.text('Out of stock'), findsOneWidget);
      expect(
        find.descendant(
          of: find.byKey(const Key('productOffer-1')),
          matching: find.byKey(const Key('productOfferLowest')),
        ),
        findsOneWidget,
      );
      final old = tester.widget<Text>(find.text('₱13,600'));
      expect(old.style!.decoration, TextDecoration.lineThrough);
      await end(tester);
    },
  );

  testWidgets('a product with one store and nothing more still shows', (
    tester,
  ) async {
    await show(tester, sample('product_details_bare'));
    expect(find.byKey(const Key('productOffer-0')), findsOneWidget);
    expect(find.byKey(const Key('productOfferLowest')), findsNothing);
    expect(find.byKey(const Key('productOffersMore')), findsNothing);
    expect(find.text('About it'), findsNothing);
    expect(find.text('What buyers say'), findsNothing);
    expect(find.byKey(const Key('productDetailsBuyForMe')), findsOneWidget);
    await end(tester);
  });

  testWidgets('a checkout with no seller confirms the total alone', (
    tester,
  ) async {
    final backend = await show(tester, {..._checkout}..remove('seller'));
    expect(find.text('Confirm and pay'), findsOneWidget);
    await tapKey(tester, 'checkoutConfirm');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'checkout.confirm');
    expect(backend.sent.single, 'Confirm ₱4,900');
    await end(tester);
  });

  for (final (key, event, label) in const [
    ('checkoutConfirm', 'checkout.confirm', 'Confirm ₱4,900 at Lazada'),
    ('checkoutChange', 'checkout.change', 'Change something'),
    ('checkoutCancel', 'checkout.cancel', 'Cancel this'),
  ]) {
    testWidgets('Checkout sends $event', (tester) async {
      final backend = await show(tester, _checkout);
      expect(find.text('Check before I pay'), findsOneWidget);
      expect(find.text('Lazada'), findsWidgets);
      expect(find.text('JBL Soundgear Clips × 1'), findsOneWidget);
      expect(find.text('Black'), findsOneWidget);
      expect(find.text('₱4,863.48'), findsOneWidget);
      expect(find.text('Delivery to Makati'), findsOneWidget);
      expect(find.text('₱36.52'), findsOneWidget);
      expect(find.text('₱4,900'), findsOneWidget);
      expect(
        find.text('Returns within 7 days · Arrives Mar 3–5'),
        findsOneWidget,
      );
      expect(find.byKey(const Key('checkoutOpen')), findsOneWidget);
      await tapKey(tester, key);
      final sent = backend.sentUiActions.single;
      expect(sent['name'], event);
      expect(sent['context'], {
        'seller': 'Lazada',
        'total': 4900,
        'currency': 'PHP',
      });
      expect(backend.sent.single, label);
      // One answer a card.
      await tester.tap(find.byKey(Key(key)), warnIfMissed: false);
      await tester.pump();
      expect(backend.sentUiActions, hasLength(1));
      await end(tester);
    });
  }

  testWidgets('a Checkout for a stay with one line and no extras', (
    tester,
  ) async {
    await show(tester, {
      'component': 'Checkout',
      'kind': 'stay',
      'seller': 'Booking.com',
      'title': 'Check this booking',
      'lines': [
        {'title': 'Standard Double Room, 3 nights', 'amount': 29013},
      ],
      'total': 29013,
      'currency': 'PHP',
    });
    expect(find.text('Check this booking'), findsOneWidget);
    expect(find.text('₱29,013'), findsNWidgets(2));
    expect(find.byKey(const Key('checkoutOpen')), findsNothing);
    expect(find.byKey(const Key('checkoutConfirm')), findsOneWidget);
    await end(tester);
  });

  testWidgets('an Order shows its items, where it is, and tracks it', (
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
    final backend = await show(tester, _order);
    expect(find.text('Lazada'), findsWidgets);
    expect(find.text('Order LZ-88213 · Placed Feb 27'), findsOneWidget);
    expect(find.text('JBL Soundgear Clips × 2'), findsOneWidget);
    expect(find.text('USB-C cable'), findsOneWidget);
    expect(find.text('₱9,726.96'), findsNWidgets(2));
    // Ordered and shipped are done; two steps to go.
    expect(find.byKey(const Key('orderSteps-1')), findsOneWidget);
    for (final step in const [
      'Ordered',
      'Shipped',
      'Out for delivery',
      'Delivered',
    ]) {
      expect(find.text(step), findsOneWidget);
    }
    expect(find.text('Arrives Thu, Mar 4'), findsOneWidget);
    expect(find.text('Tracking number · J&T Express'), findsOneWidget);
    expect(find.text('JT0012345678'), findsOneWidget);
    expect(find.byKey(const Key('orderPage')), findsOneWidget);
    await tapKey(tester, 'orderCopy');
    expect(copied, 'JT0012345678');
    await tapKey(tester, 'orderTrack');
    final sent = backend.sentUiActions.single;
    expect(sent['name'], 'order.track');
    expect(sent['context'], {
      'number': 'JT0012345678',
      'carrier': 'J&T Express',
    });
    expect(backend.sent.single, 'Track JT0012345678');
    await end(tester);
  });

  testWidgets('an Order with only a store and a status leaves the rest out', (
    tester,
  ) async {
    await show(tester, {
      'component': 'Order',
      'store': 'Shopee',
      'items': [
        {'title': 'Phone case'},
      ],
      'status': 'delivered',
      'eta': '2027-03-04',
    });
    expect(find.text('Shopee'), findsOneWidget);
    expect(find.byKey(const Key('orderSteps-3')), findsOneWidget);
    // Delivered: no arrival date to wait for.
    for (final key in const [
      'orderEta',
      'orderTotal',
      'orderCopy',
      'orderTrack',
      'orderPage',
    ]) {
      expect(find.byKey(Key(key)), findsNothing, reason: key);
    }
    await end(tester);
  });

  testWidgets('a cancelled Order says so instead of a step', (tester) async {
    await show(tester, {..._order, 'status': 'cancelled'});
    expect(find.byKey(const Key('orderSteps--1')), findsOneWidget);
    expect(find.widgetWithText(LivePill, 'Cancelled'), findsOneWidget);
    expect(find.byKey(const Key('orderEta')), findsNothing);
    await tester.pumpWidget(const SizedBox());
    // The plan's older shape for the tracking number is read too.
    final backend = await show(tester, {
      'component': 'Order',
      'store': 'Shopee',
      'status': 'returned',
      'items': const <Object?>[],
      'tracking': {'number': 'SPX123'},
    });
    expect(find.widgetWithText(LivePill, 'Returned'), findsOneWidget);
    await tapKey(tester, 'orderTrack');
    expect(backend.sentUiActions.single['context'], {'number': 'SPX123'});
    await end(tester);
  });

  for (final entry in <String, Map<String, Object?>>{
    'an empty Products': {'component': 'Products'},
    'a Products tile with only a title': {
      'component': 'Products',
      'query': 'things',
      'products': [
        {'title': 'A thing'},
        {'id': 3, 'price': 'cheap', 'rating': 5, 'store': 9, 'badge': 12},
        {
          'id': 'x',
          'title': 'No picture, an old price below the price',
          'price': 10,
          'oldPrice': 5,
          'imageUrl': 'http://not-https.example/x.png',
        },
      ],
    },
    'a ProductDetails with only a title': {
      'component': 'ProductDetails',
      'product': {'title': 'A thing'},
    },
    'a ProductDetails with odd values': {
      'component': 'ProductDetails',
      'product': {'title': 'A thing', 'rating': 'great'},
      'images': [null, 4],
      'features': 'many',
      'offers': [
        {'store': 'A'},
        {'price': 'low', 'available': 'yes', 'variant': 3},
        {'store': 'B', 'price': 5, 'total': 5, 'available': false},
      ],
      'reviews': [
        {'rating': 9},
        {'text': 'Fine', 'rating': 'five'},
      ],
    },
    'an empty Checkout': {'component': 'Checkout'},
    'a Checkout with odd values': {
      'component': 'Checkout',
      'seller': 4,
      'lines': [
        {'title': 'A', 'qty': 'two', 'amount': 'free'},
        'not a line',
      ],
      'fees': 'none',
      'total': 'a lot',
      'url': 'javascript:alert(1)',
    },
    'an Order with odd values': {
      'component': 'Order',
      'store': 'S',
      'status': 'lost at sea',
      'placed': 'last week',
      'eta': 'soon',
      'items': [
        {'qty': 0},
        7,
      ],
      'total': 'unknown',
    },
  }.entries) {
    testWidgets('${entry.key} never throws', (tester) async {
      await show(tester, entry.value, size: const Size(360, 2400));
      await end(tester);
    });
  }
}
