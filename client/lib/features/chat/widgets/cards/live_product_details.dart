import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'live_fares.dart' show priceWatchRow;
import 'live_kit.dart';
import 'live_products.dart';
import 'stay_kit.dart';

// One product in full (docs/STAYS-AND-SHOPPING-PLAN.md §5.2): its pictures, its price at every
// store with delivery and the total, what it is, and what buyers say. The lowest total is marked;
// each store row opens that store's page.

final productDetailsComponent = liveCard(
  'ProductDetails',
  const [
    'query',
    'country',
    'currency',
    'budget',
    'minPrice',
    'stores',
    'onSale',
    'condition',
    'product',
    'brand',
    'images',
    'features',
    'offers',
    'variants',
    'reviews',
    'checkoutUrl',
    'position',
  'compare',
  'affiliate',
],
  (context, p, ctl) {
    if (p.map('product').isEmpty && p.rows('offers').isEmpty) return null;
    final totals = [for (final o in p.rows('offers')) if (o.b('available') != false && o.n('total') != null) o.n('total')!];
    final low = totals.isEmpty ? null : totals.reduce((a, b) => a < b ? a : b);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _ProductDetails(p: p, act: ctl.act),
        // The watch follows the lowest total, checked on free sources only (plan §6.1).
        if (ctl.ref case final id? when low != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: priceWatchRow(cardId: id, currency: p.s('currency'), price: low),
          ),
      ],
    );
  },
);

class _ProductDetails extends StatefulWidget {
  const _ProductDetails({required this.p, required this.act});
  final P p;
  final CardAct act;

  @override
  State<_ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<_ProductDetails> {
  bool _allOffers = false;
  bool _allFeatures = false;
  bool _sent = false;

  P get p => widget.p;

  /// The offer with the lowest total among those in stock; the first one when none says.
  int? _best(List<P> offers) {
    int? best;
    for (final (i, o) in offers.indexed) {
      if (o.b('available') == false) continue;
      final t = o.n('total') ?? o.n('price');
      if (t == null) continue;
      final b = best == null
          ? null
          : offers[best].n('total') ?? offers[best].n('price');
      if (b == null || t < b) best = i;
    }
    return best ?? (offers.isEmpty ? null : 0);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cur = p.s('currency');
    final product = p.map('product');
    final title = product.s('title') ?? p.s('query') ?? '—';
    final brand = p.s('brand');
    final images = p.texts('images');
    final photos = images.isNotEmpty ? images : [?product.s('imageUrl')];
    final offers = p.rows('offers');
    final bestIndex = _best(offers);
    final best = bestIndex == null ? null : offers[bestIndex];
    // Named only when the offers aren't all the same version.
    final variants = {for (final o in offers) o.s('variant')};
    final showVariant = variants.length > 1;
    final shownOffers = _allOffers ? offers : offers.take(5).toList();
    final features = p.texts('features');
    final shownFeatures = _allFeatures ? features : features.take(5).toList();
    final reviews = p.rows('reviews');
    final buyUrl = best == null
        ? null
        : best.s('checkoutUrl') ?? p.s('checkoutUrl') ?? best.s('url');
    final rating = product.map('rating');

    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.shoppingBag,
        iconColor: shopPink,
        title: title,
        subtitle: brand,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardGallery(
            urls: photos,
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
          if (brand != null || rating.n('value') != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Wrap(
                spacing: 10,
                runSpacing: 2,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  if (brand != null)
                    Text(
                      l.cardProductsBy(brand),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.cardLabel,
                    ),
                  ProductRating(rating: rating),
                ],
              ),
            ),
          const SizedBox(height: 10),
          if (offers.isNotEmpty) ...[
            Text(l.cardProductsOffers, style: context.cardLabel),
            const SizedBox(height: 4),
            LivePanel(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (final (i, o) in shownOffers.indexed) ...[
                    if (i > 0)
                      Divider(height: 1, color: context.appColors.hairline),
                    _OfferRow(
                      index: i,
                      offer: o,
                      currency: cur,
                      lowest: i == bestIndex && offers.length > 1,
                      showVariant: showVariant,
                    ),
                  ],
                ],
              ),
            ),
            if (offers.length > 5)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  key: const Key('productOffersMore'),
                  onPressed: () => setState(() => _allOffers = !_allOffers),
                  child: Text(
                    _allOffers
                        ? l.cardProductsShowFewer
                        : l.cardProductsShowAll(offers.length),
                  ),
                ),
              ),
          ],
          if (features.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(l.cardProductsFeatures, style: context.cardLabel),
            const SizedBox(height: 4),
            for (final f in shownFeatures)
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('•  ', style: context.cardBody),
                    Expanded(
                      child: Text(
                        f,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.cardBody,
                      ),
                    ),
                  ],
                ),
              ),
            if (features.length > 5)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  key: const Key('productFeaturesMore'),
                  onPressed: () => setState(() => _allFeatures = !_allFeatures),
                  child: Text(
                    _allFeatures
                        ? l.cardProductsShowFewer
                        : l.cardProductsShowMore,
                  ),
                ),
              ),
          ],
          if (reviews.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(l.cardProductsReviews, style: context.cardLabel),
            for (final r in reviews.take(5))
              if (r.s('text') case final text?)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (r.i('rating') case final n? when n > 0)
                        StarRow(stars: n, size: 10),
                      Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodySmall?.copyWith(
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
          ],
          const SizedBox(height: 10),
          Text(l.cardProductsCheck, style: context.cardLabel),
          CardAffiliateFooter(card: p),
          if (best != null) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (buyUrl != null)
                  FilledButton.icon(
                    key: const Key('productDetailsBuy'),
                    onPressed: () => openCardLink(buyUrl),
                    icon: const Icon(LucideIcons.externalLink, size: 16),
                    label: Text(l.cardProductsBuy),
                  ),
                OutlinedButton.icon(
                  key: const Key('productDetailsBuyForMe'),
                  onPressed: _sent
                      ? null
                      : () {
                          setState(() => _sent = true);
                          widget.act(
                            'products.buy',
                            productBuyValues(
                              title: title,
                              store: best.s('store'),
                              url: best.s('url') ?? buyUrl,
                              price: best.n('price'),
                              currency: cur,
                            ),
                            l.cardProductsBuyLabel(
                              title,
                              best.s('store') ?? '',
                            ),
                          );
                        },
                  icon: const Icon(LucideIcons.sparkles, size: 16),
                  label: Text(l.cardProductsBuyForMe),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// One store's price: the store (and which version), delivery, the price and the total.
class _OfferRow extends StatelessWidget {
  const _OfferRow({
    required this.index,
    required this.offer,
    required this.currency,
    required this.lowest,
    required this.showVariant,
  });
  final int index;
  final P offer;
  final String? currency;
  final bool lowest;
  final bool showVariant;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final price = offer.n('price');
    final total = offer.n('total');
    final url = offer.s('url');
    final out = offer.b('available') == false;
    final under = [
      if (showVariant) ?offer.s('variant'),
      if (offer.s('delivery') case final d?) l.cardProductsDelivery(d),
    ].join(' · ');
    return InkWell(
      key: Key('productOffer-$index'),
      onTap: url == null ? null : () => openCardLink(url),
      child: Opacity(
        opacity: out ? 0.6 : 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          offer.s('store') ?? '—',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (under.isNotEmpty)
                          Text(
                            under,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.cardLabel,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (price != null)
                        Text(
                          cardMoney(context, price, currency),
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontFeatures: AppText.tabular,
                          ),
                        ),
                      if (offer.n('oldPrice') case final old?
                          when price != null && old > price)
                        Text(
                          cardMoney(context, old, currency),
                          style: context.cardLabel?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontFeatures: AppText.tabular,
                          ),
                        ),
                      if (total != null && total != price)
                        Text(
                          l.cardProductsTotal(
                            cardMoney(context, total, currency),
                          ),
                          style: context.cardLabel?.copyWith(
                            fontFeatures: AppText.tabular,
                          ),
                        ),
                    ],
                  ),
                  if (url != null) ...[
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Icon(
                        LucideIcons.externalLink,
                        size: 13,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
              // Under the row, where a pill has the card's whole width.
              if (lowest || out)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      if (lowest)
                        LivePill(
                          key: const Key('productOfferLowest'),
                          text: l.cardProductsLowest,
                          color: context.appColors.positive,
                        ),
                      if (out)
                        LivePill(
                          text: l.cardProductsOutOfStock,
                          color: context.appColors.warning,
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
