import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'fare_kit.dart';
import 'live_fares.dart';
import 'live_kit.dart';

// A trip's price trend (docs/FLIGHT-CARDS-PLAN.md §3.7), for "book now or wait?": the cheapest
// fare now, Google Flights' usual range with where that fare sits in it, and how the price has
// moved. A snapshot: it has no refresh, since repeating it would be a paid search.

final fareTrendComponent = liveCard(
  'FareTrend',
  const [
    'from',
    'to',
    'depart',
    'return',
    'travellers',
    'cabin',
    'currency',
    'roundTrip',
    'cheapest',
    'typical',
    'seen',
    'searchUrl',
  ],
  (context, p, ctl) {
    final l = context.l10n;
    final cur = p.s('currency');
    final route =
        '${p.map('from').s('label') ?? '—'} → ${p.map('to').s('label') ?? '—'}';
    final dates = [
      fareDate(context, p.s('depart')),
      if (p.s('return') != null) fareDate(context, p.s('return')),
    ].join(' – ');
    final cheapest = p.n('cheapest');
    final typical = p.map('typical');
    final low = typical.n('low');
    final high = typical.n('high');
    final seen = p.map('seen');
    final history = [
      if (typical['history'] case final List h)
        for (final x in h)
          if (x is List && x.length == 2 && x[1] is num)
            (x[1] as num).toDouble(),
    ];
    final level = switch (typical.s('level')) {
      'low' => (l.cardFaresLevelLow, context.appColors.positive),
      'high' => (l.cardFaresLevelHigh, context.appColors.warning),
      'typical' => (
        l.cardFaresLevelTypical,
        context.colorScheme.onSurfaceVariant,
      ),
      _ => null,
    };
    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.trendingDown,
        iconColor: planeBlue,
        title: route,
        titleMaxLines: 2,
        subtitle: [
          dates,
          l.cardFaresTravellers(farePeople(p)),
          fareCabin(context, p.s('cabin')),
        ].join(' · '),
        pill: level?.$1,
        pillColor: level?.$2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (cheapest != null) ...[
            Text(l.cardFareTrendNow, style: context.cardLabel),
            Text(
              fmtFare(context, cheapest, cur),
              key: const Key('fareTrendNow'),
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                fontFeatures: AppText.tabular,
              ),
            ),
            const SizedBox(height: 10),
          ],
          if (low != null && high != null)
            LivePanel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l.cardFaresTypical(
                      fmtFare(context, low, cur),
                      fmtFare(context, high, cur),
                    ),
                    style: context.cardLabel,
                  ),
                  const SizedBox(height: 8),
                  // The bar is the usual range; the mark is today's cheapest fare.
                  RangeBar(
                    min:
                        [low, ?cheapest].reduce((a, b) => a < b ? a : b) * 0.92,
                    max:
                        [high, ?cheapest].reduce((a, b) => a > b ? a : b) *
                        1.08,
                    lo: low,
                    hi: high,
                    marker: cheapest,
                    colors: [
                      context.appColors.positive,
                      context.appColors.warning,
                    ],
                  ),
                ],
              ),
            ),
          if (history.length > 1) ...[
            const SizedBox(height: 10),
            Sparkline(
              key: const Key('fareTrendHistory'),
              points: history,
              color: planeBlue,
              height: 64,
            ),
            const SizedBox(height: 4),
            Text(
              [
                if (seen.i('days') case final days?)
                  l.cardFareTrendHistory(days),
                if (seen.n('low') != null && seen.n('high') != null)
                  l.cardFareTrendSeen(
                    fmtFare(context, seen.n('low')!, cur),
                    fmtFare(context, seen.n('high')!, cur),
                  ),
              ].join(' · '),
              style: context.cardLabel,
            ),
          ],
          const SizedBox(height: 8),
          Text(l.cardFareTrendNote, style: context.cardLabel),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FilledButton.tonal(
                key: const Key('fareTrendSeeFares'),
                // The bot answers with a fares card, which can be watched; this card stays.
                onPressed: () => ctl.act(
                  'flights.open',
                  fareTrip(p),
                  l.cardFaresOpenLabel(route, dates),
                ),
                child: Text(l.cardFareCalSeeFares),
              ),
              if (p.s('searchUrl') case final u? when u.startsWith('https://'))
                TextButton.icon(
                  onPressed: () => openCardLink(u),
                  icon: const Icon(LucideIcons.externalLink, size: 14),
                  label: Text(l.cardFaresSeeAll),
                ),
            ],
          ),
        ],
      ),
    );
  },
);
