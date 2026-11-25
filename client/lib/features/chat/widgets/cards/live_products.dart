import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/providers.dart';
import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'live_kit.dart';
import 'stay_kit.dart';

// Things to buy for a search (docs/STAYS-AND-SHOPPING-PLAN.md §5.1): a grid from Google Shopping
// or Shopify, sorted and filtered on the device. A tile opens a sheet with what the card holds and
// its buttons; comparing one product's stores costs a search, so it goes through the bot.

final productsComponent = liveCard('Products', const [
  'query',
  'country',
  'currency',
  'budget',
  'minPrice',
  'stores',
  'onSale',
  'condition',
  'sort',
  'cheapest',
  'products',
  'more',
], (context, p, ctl) => _Products(p: p, act: ctl.act, cardId: ctl.ref));

/// What "Buy for me" sends: `products.buy`.
Map<String, Object?> productBuyValues({
  required String title,
  String? store,
  String? url,
  double? price,
  String? currency,
}) => {
  'title': title,
  'store': store ?? '',
  'url': ?url,
  'price': ?price,
  'currency': ?currency,
};

/// "−20%" when the old price is higher than the price; null otherwise.
String? percentOff(BuildContext context, double? price, double? oldPrice) {
  if (price == null || oldPrice == null || oldPrice <= price || oldPrice <= 0) {
    return null;
  }
  final pct = ((1 - price / oldPrice) * 100).round();
  return pct < 1 ? null : context.l10n.cardProductsOff(pct);
}

/// A price with its struck-through old price and the percent off beside it.
class PriceLine extends StatelessWidget {
  const PriceLine({
    super.key,
    required this.price,
    this.oldPrice,
    required this.currency,
    this.big = false,
  });
  final double? price;
  final double? oldPrice;
  final String? currency;
  final bool big;

  @override
  Widget build(BuildContext context) {
    final p = price;
    if (p == null) return const SizedBox.shrink();
    final old = oldPrice != null && oldPrice! > p ? oldPrice : null;
    final off = percentOff(context, p, old);
    return Wrap(
      spacing: 6,
      runSpacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          cardMoney(context, p, currency),
          style:
              (big
                      ? context.textTheme.titleLarge
                      : context.textTheme.titleSmall)
                  ?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontFeatures: AppText.tabular,
                  ),
        ),
        if (old != null)
          Text(
            cardMoney(context, old, currency),
            style: context.cardLabel?.copyWith(
              decoration: TextDecoration.lineThrough,
              fontFeatures: AppText.tabular,
            ),
          ),
        if (off != null) LivePill(text: off, color: context.appColors.positive),
      ],
    );
  }
}

enum _Sort { best, cheapest, topRated }

class _Products extends StatefulWidget {
  const _Products({required this.p, required this.act, this.cardId});

  /// The saved card, for opening one of its own products in full without the model.
  final String? cardId;
  final P p;
  final CardAct act;

  @override
  State<_Products> createState() => _ProductsState();
}

class _ProductsState extends State<_Products> {
  late _Sort _sort = switch (widget.p.s('sort')) {
    'cheapest' => _Sort.cheapest,
    'top_rated' => _Sort.topRated,
    _ => _Sort.best,
  };
  final _stores = <String>{};
  bool _sale = false;
  bool _rated = false;
  bool _all = false;
  final _picked = <String>[];

  P get p => widget.p;

  /// Up to six stores from the results, the ones with the most products first.
  List<String> _storeChips(List<P> all) {
    final count = <String, int>{};
    for (final x in all) {
      if (x.s('store') case final s?) count[s] = (count[s] ?? 0) + 1;
    }
    if (count.length < 2) return const [];
    final names = count.keys.toList()
      ..sort((a, b) => count[b]!.compareTo(count[a]!));
    return names.take(6).toList();
  }

  List<P> _shown(List<P> all) {
    final list = [
      for (final x in all)
        if ((_stores.isEmpty || _stores.contains(x.s('store'))) &&
            (!_sale ||
                (x.n('oldPrice') ?? 0) > (x.n('price') ?? double.infinity)) &&
            (!_rated || (x.map('rating').n('value') ?? 0) >= 4))
          x,
    ];
    switch (_sort) {
      case _Sort.cheapest:
        list.sort(
          (a, b) => (a.n('price') ?? double.infinity).compareTo(
            b.n('price') ?? double.infinity,
          ),
        );
      case _Sort.topRated:
        list.sort((a, b) {
          final ra = a.map('rating'), rb = b.map('rating');
          final v = (rb.n('value') ?? 0).compareTo(ra.n('value') ?? 0);
          return v != 0
              ? v
              : (rb.n('count') ?? 0).compareTo(ra.n('count') ?? 0);
        });
      case _Sort.best:
        break;
    }
    return list;
  }

  void _pick(String id, bool on) => setState(() {
    if (!on) {
      _picked.remove(id);
    } else if (_picked.length < comparePickLimit && !_picked.contains(id)) {
      _picked.add(id);
    }
  });

  void _open(List<P> all, P product) {
    // Its place in the card's own list, which is the order the server numbers them in.
    final position = all.indexWhere((x) => x.s('id') == product.s('id')) + 1;
    showCardSheet<void>(
      context,
      builder: (sheet) => CardSheet(
        title: p.s('query') ?? sheet.l10n.cardProductsTitle,
        child: _ProductSheet(
          card: p,
          product: product,
          position: position,
          act: closingAct(sheet, widget.act)!,
          // Free sources list their own products as views: variants and stock load in the sheet.
          cardId: p.map('live').texts('views').contains('item:${product.s('id')}') ? widget.cardId : null,
        ),
      ),
    );
  }

  void _compare(List<P> all) {
    final l = context.l10n;
    final cur = p.s('currency');
    final items = [
      for (final id in _picked) ...all.where((x) => x.s('id') == id).take(1),
    ];
    if (items.length < 2) return;
    showCompareSheet(
      context,
      names: [for (final x in items) x.s('title') ?? '—'],
      rows: [
        (
          l.cardProductsRowPrice,
          [
            for (final x in items)
              x.n('price') == null
                  ? ''
                  : cardMoney(context, x.n('price')!, cur),
          ],
        ),
        (l.cardProductsRowStore, [for (final x in items) x.s('store') ?? '']),
        (
          l.cardProductsRowRating,
          [
            for (final x in items)
              if (x.map('rating').n('value') case final v?)
                [
                  l.cardStaysRating(
                    cardNumber(context, v),
                    cardNumber(context, 5),
                  ),
                  if (x.map('rating').i('count') case final c? when c > 0)
                    cardNumber(context, c),
                ].join(' · ')
              else
                '',
          ],
        ),
        (
          l.cardProductsRowDelivery,
          [for (final x in items) x.s('delivery') ?? ''],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cur = p.s('currency');
    final all = p.rows('products');
    final list = _shown(all);
    final shown = _all ? list : list.take(6).toList();
    final cheapest = p.n('cheapest');
    final budget = p.n('budget');
    final ids = {for (final x in all) ?x.s('id')};
    _picked.removeWhere((id) => !ids.contains(id));
    final subtitle = [
      ?p.s('country'),
      if (budget != null && budget > 0)
        l.cardProductsUnder(cardMoney(context, budget, cur)),
    ].join(' · ');

    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.shoppingBag,
        iconColor: shopPink,
        title: p.s('query') ?? l.cardProductsTitle,
        subtitle: subtitle.isEmpty ? null : subtitle,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (cheapest != null) ...[
            Text(
              l.cardProductsFrom(cardMoney(context, cheapest, cur)),
              key: const Key('productsFrom'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelLarge?.copyWith(
                color: shopPink,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final (s, key, label) in [
                (_Sort.best, 'best', l.cardProductsSortBest),
                (_Sort.cheapest, 'cheapest', l.cardProductsSortCheapest),
                (_Sort.topRated, 'top_rated', l.cardProductsSortTopRated),
              ])
                ChoiceChip(
                  key: Key('productsSort-$key'),
                  label: Text(label),
                  selected: _sort == s,
                  onSelected: (_) => setState(() => _sort = s),
                  visualDensity: VisualDensity.compact,
                ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final s in _storeChips(all))
                FilterChip(
                  key: Key('productsStore-$s'),
                  label: Text(s),
                  selected: _stores.contains(s),
                  onSelected: (v) =>
                      setState(() => v ? _stores.add(s) : _stores.remove(s)),
                  visualDensity: VisualDensity.compact,
                ),
              FilterChip(
                key: const Key('productsSale'),
                label: Text(l.cardProductsOnSale),
                selected: _sale,
                onSelected: (v) => setState(() => _sale = v),
                visualDensity: VisualDensity.compact,
              ),
              FilterChip(
                key: const Key('productsRated'),
                label: Text(l.cardProductsRated),
                selected: _rated,
                onSelected: (v) => setState(() => _rated = v),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (list.isEmpty)
            LivePanel(child: Text(l.cardProductsNone, style: context.cardLabel))
          else
            LayoutBuilder(
              builder: (context, box) {
                // Two across on a phone, three or four on a wide card.
                final cols = box.maxWidth < 440
                    ? 2
                    : box.maxWidth < 680
                    ? 3
                    : 4;
                return Column(
                  children: [
                    for (var i = 0; i < shown.length; i += cols)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (var j = i; j < i + cols; j++) ...[
                                if (j > i) const SizedBox(width: 8),
                                Expanded(
                                  child: j < shown.length
                                      ? _Tile(
                                          product: shown[j],
                                          currency: cur,
                                          picked: _picked.contains(
                                            shown[j].s('id'),
                                          ),
                                          canPick:
                                              _picked.length < comparePickLimit,
                                          onPick: (v) =>
                                              _pick(shown[j].s('id') ?? '', v),
                                          onOpen: () => _open(all, shown[j]),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          if (list.length > 6)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                key: const Key('productsMore'),
                onPressed: () => setState(() => _all = !_all),
                child: Text(
                  _all
                      ? l.cardProductsShowFewer
                      : l.cardProductsShowAll(list.length),
                ),
              ),
            ),
          if (list.isNotEmpty)
            CompareBar(
              buttonKey: const Key('productsCompare'),
              count: _picked.length,
              onCompare: () => _compare(all),
            ),
          const SizedBox(height: 6),
          Text(l.cardProductsCheck, style: context.cardLabel),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.product,
    required this.currency,
    required this.picked,
    required this.canPick,
    required this.onPick,
    required this.onOpen,
  });
  final P product;
  final String? currency;
  final bool picked;
  final bool canPick;
  final ValueChanged<bool> onPick;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final id = product.s('id') ?? '';
    final store = product.s('store');
    return Material(
      color: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.tile),
        side: BorderSide(
          color: picked
              ? context.colorScheme.primary
              : context.appColors.hairline,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: Key('productsTile-$id'),
        onTap: onOpen,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: CardImage(
                      url: product.s('imageUrl'),
                      radius: AppRadius.icon,
                      fit: BoxFit.contain,
                      fallback: const CardPhotoPlaceholder(
                        icon: LucideIcons.shoppingBag,
                      ),
                    ),
                  ),
                  if (product.s('badge') case final badge?)
                    Positioned(
                      left: 4,
                      top: 4,
                      right: 40,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.inverseSurface,
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                          ),
                          child: Text(
                            badge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onInverseSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface.withValues(
                          alpha: 0.85,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: PickTick(
                        key: Key('productsPick-$id'),
                        picked: picked,
                        enabled: canPick,
                        onChanged: onPick,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                product.s('title') ?? '—',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium?.copyWith(height: 1.25),
              ),
              const SizedBox(height: 4),
              PriceLine(
                price: product.n('price'),
                oldPrice: product.n('oldPrice'),
                currency: currency,
              ),
              ProductRating(rating: product.map('rating')),
              if (store != null)
                Text(
                  product.b('manyStores') == true
                      ? '$store ${l.cardProductsOtherStores}'
                      : store,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.cardLabel,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A product from the grid with its buttons: Buy, Compare stores, Buy for me.
class _ProductSheet extends StatelessWidget {
  const _ProductSheet({
    required this.card,
    required this.product,
    required this.position,
    required this.act,
    this.cardId,
  });
  final P card;
  final P product;
  final String? cardId;

  /// Its 1-based place in the card's own products.
  final int position;
  final CardAct act;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cur = card.s('currency');
    final title = product.s('title') ?? '—';
    final store = product.s('store');
    final url = product.s('url');
    final budget = card.n('budget');
    final stores = card.texts('stores');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        CardGallery(
          urls: [?product.s('imageUrl')],
          icon: LucideIcons.shoppingBag,
          height: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        PriceLine(
          price: product.n('price'),
          oldPrice: product.n('oldPrice'),
          currency: cur,
          big: true,
        ),
        const SizedBox(height: 4),
        if (store != null)
          Text(
            product.b('manyStores') == true
                ? '$store ${l.cardProductsOtherStores}'
                : store,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.cardLabel,
          ),
        ProductRating(rating: product.map('rating')),
        if (product.s('delivery') case final d?)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              l.cardProductsDelivery(d),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.cardLabel,
            ),
          ),
        if (cardId case final id?) ...[
          const SizedBox(height: 10),
          _StoreOffers(cardId: id, view: 'item:${product.s('id')}', currency: cur),
        ],
        const SizedBox(height: 10),
        Text(l.cardProductsCheck, style: context.cardLabel),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            if (url != null)
              FilledButton.icon(
                key: const Key('productBuy'),
                onPressed: () => openCardLink(url),
                icon: const Icon(LucideIcons.externalLink, size: 16),
                label: Text(l.cardProductsBuy),
              ),
            if (position > 0)
              OutlinedButton.icon(
                key: const Key('productCompare'),
                onPressed: () => act('products.compare', {
                  'query': card.s('query') ?? title,
                  'detail': position,
                  if (budget != null && budget > 0) 'budget': budget.round(),
                  if (stores.isNotEmpty) 'stores': stores,
                  'sort': card.s('sort') ?? 'best',
                }, l.cardProductsCompareLabel(title)),
                icon: const Icon(LucideIcons.store, size: 16),
                label: Text(l.cardProductsCompareStores),
              ),
            OutlinedButton.icon(
              key: const Key('productBuyForMe'),
              onPressed: () => act(
                'products.buy',
                productBuyValues(
                  title: title,
                  store: store,
                  url: url,
                  price: product.n('price'),
                  currency: cur,
                ),
                l.cardProductsBuyLabel(title, store ?? ''),
              ),
              icon: const Icon(LucideIcons.sparkles, size: 16),
              label: Text(l.cardProductsBuyForMe),
            ),
          ],
        ),
      ],
    );
  }
}

/// A product's versions and stock from the card's own source, loaded when the sheet opens: the
/// card's id and the product's view go to the server (no model turn, a free source only).
class _StoreOffers extends ConsumerStatefulWidget {
  const _StoreOffers({required this.cardId, required this.view, required this.currency});
  final String cardId;
  final String view;
  final String? currency;

  @override
  ConsumerState<_StoreOffers> createState() => _StoreOffersState();
}

class _StoreOffersState extends ConsumerState<_StoreOffers> {
  List<P>? _offers;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final r = await ref.read(backendProvider).refreshLiveCard(widget.cardId, view: widget.view);
      if (!mounted) return;
      final card = r['card'];
      setState(() {
        if (r['error'] != null || card is! Map || card['component'] != 'ProductDetails') {
          _failed = true;
        } else {
          _offers = P(Map<Object?, Object?>.from(card)).rows('offers');
        }
      });
    } catch (_) {
      if (mounted) setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    // Nothing more to show is fine: the sheet already has the product as the list knew it.
    if (_failed) return const SizedBox.shrink();
    final offers = _offers;
    if (offers == null) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: LinearProgressIndicator(key: Key('productOffersLoading'), minHeight: 2),
      );
    }
    return Column(
      key: const Key('productOffers'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (i, o) in offers.take(8).indexed)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: LivePanel(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          o.s('variant') ?? o.s('store') ?? '—',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          [
                            if (o.s('variant') != null) ?o.s('store'),
                            if (o.b('available') == false) l.cardProductsOutOfStock,
                          ].join(' · '),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.cardLabel,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (o.n('price') case final v?)
                    Text(
                      cardMoney(context, v, widget.currency),
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontFeatures: AppText.tabular,
                      ),
                    ),
                  if ((o.s('checkoutUrl') ?? o.s('url')) case final u? when o.b('available') != false) ...[
                    const SizedBox(width: 4),
                    IconButton(
                      key: Key('productOfferBuy-$i'),
                      tooltip: l.cardProductsBuy,
                      onPressed: () => openCardLink(u),
                      icon: const Icon(LucideIcons.externalLink, size: 16),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}

