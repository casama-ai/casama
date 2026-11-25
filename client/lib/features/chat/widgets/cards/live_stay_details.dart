import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'live_fares.dart' show priceWatchRow;
import 'live_kit.dart';
import 'stay_kit.dart';

// One place to stay in full (docs/STAYS-AND-SHOPPING-PLAN.md §4.2): its photos, rating, every
// booking site's price and terms, what it has, a map. Shown as a card in the chat, and as the
// sheet a Stays row opens from the row's own data (no call).

final stayDetailsComponent = liveCard(
  'StayDetails',
  const [
    'place',
    'checkIn',
    'checkOut',
    'nights',
    'guests',
    'currency',
    'search',
    'stay',
    'position',
  'compare',
  'affiliate',
],
  (context, p, ctl) {
    final stay = p.map('stay');
    if (stay.isEmpty) return null;
    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.bedDouble,
        iconColor: stayTeal,
        title: p.map('place').s('label') ?? context.l10n.cardStaysDetailsTitle,
        subtitle: staysDatesLine(context, p),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          StayDetailsView(card: p, stay: stay, act: ctl.act),
          // The watch follows this place's nightly price on free sources (plan §6.1).
          if (ctl.ref case final id? when stay.n('night') != null) ...[
            const SizedBox(height: 8),
            priceWatchRow(cardId: id, currency: p.s('currency'), price: stay.n('night')!),
          ],
        ],
      ),
    );
  },
);

/// A Stays row in full, in a sheet. [card] is the Stays card (its dates, guests and currency).
Future<void> showStayDetailsSheet(
  BuildContext context, {
  required P card,
  required P stay,
  CardAct? act,
}) => showCardSheet<void>(
  context,
  builder: (sheet) => CardSheet(
    title: card.map('place').s('label') ?? sheet.l10n.cardStaysDetailsTitle,
    subtitle: staysDatesLine(sheet, card),
    child: StayDetailsView(card: card, stay: stay, act: closingAct(sheet, act)),
  ),
);

/// What "Book for me" sends for a stay's cheapest deal: `stays.book`.
Map<String, Object?> stayBookValues(P card, P stay, P deal) {
  final g = card.map('guests');
  return {
    'name': stay.s('name') ?? '',
    'site': deal.s('site') ?? '',
    'url': ?deal.s('url'),
    'check_in': ?card.s('checkIn'),
    'check_out': ?card.s('checkOut'),
    'adults': g.i('adults') ?? 2,
    'rooms': g.i('rooms') ?? 1,
    // The whole stay's price on that site, as the card shows it.
    'price': ?(deal.n('stay') ?? deal.n('night')),
    'currency': ?card.s('currency'),
  };
}

class StayDetailsView extends StatefulWidget {
  const StayDetailsView({
    super.key,
    required this.card,
    required this.stay,
    this.act,
  });

  /// The card around the stay: `checkIn`, `checkOut`, `nights`, `guests`, `currency`.
  final P card;
  final P stay;

  /// Sends "stays.book"; without it the view has links only.
  final CardAct? act;

  @override
  State<StayDetailsView> createState() => _StayDetailsViewState();
}

class _StayDetailsViewState extends State<StayDetailsView> {
  bool _sent = false;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final card = widget.card;
    final stay = widget.stay;
    final cur = card.s('currency');
    final muted = context.colorScheme.onSurfaceVariant;
    final images = stay.texts('images');
    final photos = images.isNotEmpty
        ? images
        : [?stay.s('imageUrl')];
    final deals = stay.rows('deals');
    final bestIndex = cheapestDealIndex(deals);
    final best = bestIndex == null ? null : deals[bestIndex];
    final rating = stayRatingText(context, stay);
    final stars = stay.i('stars') ?? 0;
    final whereLine = [
      ?stay.s('area'),
      ?stayDistance(context, stay),
    ].join(' · ');
    final amenities = stay.texts('amenities');
    final nearby = stay.rows('nearby');
    final times = [
      if (stay.s('checkInTime') case final t?) l.cardStaysCheckIn(t),
      if (stay.s('checkOutTime') case final t?) l.cardStaysCheckOut(t),
    ].join(' · ');
    final pin = cardPin(stay.n('lat'), stay.n('lng'), stay.s('name'));
    final name = stay.s('name') ?? '—';
    final act = widget.act;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        CardGallery(urls: photos, icon: LucideIcons.bedDouble),
        const SizedBox(height: 10),
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        if (stars > 0 || rating != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              children: [
                if (stars > 0) ...[
                  StarRow(stars: stars),
                  const SizedBox(width: 6),
                ],
                if (rating != null)
                  Expanded(
                    child: Text(
                      rating,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.cardLabel,
                    ),
                  ),
              ],
            ),
          ),
        if (whereLine.isNotEmpty)
          Text(
            whereLine,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.cardLabel,
          ),
        const SizedBox(height: 10),
        Text(
          staysDatesLine(context, card, rooms: true),
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        if (deals.isEmpty)
          LivePanel(child: Text(l.cardStaysNoDeals, style: context.cardLabel))
        else
          for (final (i, d) in deals.indexed) ...[
            _DealRow(
              index: i,
              deal: d,
              currency: cur,
              cheapest: i == bestIndex && deals.length > 1,
            ),
            const SizedBox(height: 6),
          ],
        if (amenities.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(l.cardStaysAmenities, style: context.cardLabel),
          const SizedBox(height: 4),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [for (final a in amenities.take(16)) LivePill(text: a)],
          ),
        ],
        if (times.isNotEmpty) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(LucideIcons.clock, size: 14, color: muted),
              const SizedBox(width: 6),
              Expanded(child: Text(times, style: context.cardLabel)),
            ],
          ),
        ],
        if (nearby.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(l.cardStaysNearby, style: context.cardLabel),
          for (final n in nearby.take(6))
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      n.s('name') ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                  if (n.s('how') case final how?) ...[
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        how,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: context.cardLabel,
                      ),
                    ),
                  ],
                ],
              ),
            ),
        ],
        if (stay.s('about') case final about?) ...[
          const SizedBox(height: 10),
          Text(
            about,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: context.cardBody,
          ),
        ],
        if (pin != null) ...[
          const SizedBox(height: 10),
          CardPinMap(key: const Key('stayMap'), pins: [pin], height: 160),
        ],
        if (stay.s('address') case final address?) ...[
          const SizedBox(height: 6),
          Text(
            address,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.cardLabel,
          ),
        ],
        if (stay.s('url') case final u? when u.startsWith('https://'))
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              key: const Key('staySite'),
              onPressed: () => openCardLink(u),
              icon: const Icon(LucideIcons.globe, size: 16),
              label: Text(l.cardStaysHotelSite),
            ),
          ),
        const SizedBox(height: 8),
        Text(l.cardStaysCheck, style: context.cardLabel),
        CardAffiliateFooter(card: card),
        if (act != null && best != null) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: FilledButton.icon(
              key: const Key('stayBook'),
              onPressed: _sent
                  ? null
                  : () {
                      setState(() => _sent = true);
                      act(
                        'stays.book',
                        stayBookValues(card, stay, best),
                        l.cardStaysBookLabel(name, best.s('site') ?? ''),
                      );
                    },
              icon: const Icon(LucideIcons.sparkles, size: 16),
              label: Text(l.cardStaysBook),
            ),
          ),
        ],
      ],
    );
  }
}

/// One booking site's price: a night, the whole stay, its terms, and a link.
class _DealRow extends StatelessWidget {
  const _DealRow({
    required this.index,
    required this.deal,
    required this.currency,
    required this.cheapest,
  });
  final int index;
  final P deal;
  final String? currency;
  final bool cheapest;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final night = deal.n('night');
    final total = deal.n('stay');
    final terms = [
      for (final t in deal.texts('terms'))
        if (termLabel(context, t) case final label?) (t, label),
    ];
    final url = deal.s('url');
    return LivePanel(
      padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 2,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      deal.s('site') ?? '—',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (cheapest)
                      LivePill(
                        key: const Key('stayDealCheapest'),
                        text: l.cardStaysCheapest,
                        color: context.appColors.positive,
                      ),
                  ],
                ),
              ),
              if (url != null)
                TextButton.icon(
                  key: Key('stayDeal-$index'),
                  onPressed: () => openCardLink(url),
                  icon: const Icon(LucideIcons.externalLink, size: 14),
                  label: Text(l.cardStaysView),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                  ),
                ),
            ],
          ),
          if (night != null)
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: cardMoney(context, night, currency),
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontFeatures: AppText.tabular,
                    ),
                  ),
                  TextSpan(text: ' ${l.cardStaysANight}'),
                  if (total != null)
                    TextSpan(
                      text: '  ·  ${cardMoney(context, total, currency)}',
                    ),
                ],
              ),
              style: context.cardLabel,
            ),
          if (terms.isNotEmpty) ...[
            const SizedBox(height: 6),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: [
                for (final (t, label) in terms)
                  LivePill(
                    text: label,
                    color: switch (t) {
                      'free_cancellation' ||
                      'breakfast' => context.appColors.positive,
                      'non_refundable' => context.appColors.warning,
                      _ => null,
                    },
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
