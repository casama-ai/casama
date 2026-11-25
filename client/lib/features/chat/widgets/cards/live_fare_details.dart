import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'fare_kit.dart';
import 'live_kit.dart';

// One fare in full (docs/FLIGHT-CARDS-PLAN.md §3.2): every flight, the waits between them, bags
// and what to look at twice. A card when the bot is asked about one option; a sheet when the
// person taps a row of a Fares card. Both draw the same body from what the card already holds.

final fareDetailsComponent = liveCard(
  'FareDetails',
  const [
    'from',
    'to',
    'depart',
    'return',
    'travellers',
    'cabin',
    'currency',
    'roundTrip',
    'outboundOnly',
    'position',
    'of',
    'option',
    'airports',
    'searchUrl',
    'affiliate',
    'compare',
  ],
  (context, p, ctl) {
    final o = p.map('option');
    final price = o.n('price');
    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.plane,
        iconColor: planeBlue,
        title:
            '${p.map('from').s('label') ?? '—'} → ${p.map('to').s('label') ?? '—'}',
        subtitle: _subtitle(context, p),
        pill: price == null ? null : fmtFare(context, price, p.s('currency')),
        pillColor: planeBlue,
      ),
      body: FareDetailsBody(card: p, option: o),
    );
  },
);

String _subtitle(BuildContext context, P card) {
  final l = context.l10n;
  final dates = [
    fareDate(context, card.s('depart')),
    if (card.s('return') != null) fareDate(context, card.s('return')),
  ].join(' – ');
  return [
    dates,
    l.cardFaresTravellers(farePeople(card)),
    fareCabin(context, card.s('cabin')),
  ].join(' · ');
}

/// The flights, the notes and the Book button for one option of [card].
class FareDetailsBody extends StatelessWidget {
  const FareDetailsBody({super.key, required this.card, required this.option});
  final P card;
  final P option;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final link = option.s('link');
    final compare = card.map('compare').s('url');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        LivePanel(
          child: FareOptionDetails(
            option: option,
            airports: card.map('airports'),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          card.b('outboundOnly') == true
              ? l.cardFaresOutboundOnly
              : l.cardFaresCheck,
          style: context.cardLabel,
        ),
        if (link != null) ...[
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: FilledButton.icon(
              key: const Key('fareDetailsBook'),
              onPressed: () => openCardLink(link),
              icon: const Icon(LucideIcons.externalLink, size: 16),
              label: Text(l.cardFaresBook),
            ),
          ),
        ],
        if (compare != null && compare.startsWith('https://'))
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => openCardLink(compare),
              icon: const Icon(LucideIcons.externalLink, size: 14),
              label: Text(
                l.cardFaresCompare(
                  card.map('compare').s('name') ?? 'Aviasales',
                ),
              ),
            ),
          ),
        if (card.b('affiliate') == true) ...[
          const SizedBox(height: 4),
          Text(l.cardFaresAffiliate, style: context.cardLabel),
        ],
      ],
    );
  }
}

/// A Fares row opened in full.
class FareDetailsSheet extends StatelessWidget {
  const FareDetailsSheet({super.key, required this.card, required this.option});
  final P card;
  final P option;

  @override
  Widget build(BuildContext context) {
    final price = option.n('price');
    final airlines = option.texts('airlines');
    return FareSheet(
      header: FareSheetHeader(
        title:
            '${card.map('from').s('label') ?? '—'} → ${card.map('to').s('label') ?? '—'}',
        subtitle: airlines.isEmpty ? null : airlines.join(' + '),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (price != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                fmtFare(context, price, card.s('currency')),
                key: const Key('fareDetailsPrice'),
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontFeatures: AppText.tabular,
                ),
              ),
            ),
          FareDetailsBody(card: card, option: option),
        ],
      ),
    );
  }
}
