import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/analytics.dart';
import '../../../../core/providers.dart';
import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'fare_kit.dart';
import 'live_fares.dart';
import 'live_kit.dart';

// The person's price watches (docs/FLIGHT-CARDS-PLAN.md §3.6): each watched trip's fare now, how
// it has moved since the watch began, its target and when it ends, with Stop. The card carries no
// rows: each person's app loads their own watches, so nobody in a shared chat sees another's.

final fareWatchesComponent = liveCard('FareWatches', const [
  'count',
  'limit',
], (context, p, ctl) => _Watches(p: p));

class _Watches extends ConsumerStatefulWidget {
  const _Watches({required this.p});
  final P p;

  @override
  ConsumerState<_Watches> createState() => _WatchesState();
}

class _WatchesState extends ConsumerState<_Watches> {
  final _busy = <String>{};

  @override
  void initState() {
    super.initState();
    // The bot may have just started or stopped one: read them again as the card appears.
    Future.microtask(() {
      if (mounted) ref.invalidate(fareWatchesProvider);
    });
  }

  Future<void> _stop(String cardId) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.maybeOf(context);
    setState(() => _busy.add(cardId));
    try {
      await ref.read(backendProvider).unwatchFares(cardId);
      ref.invalidate(fareWatchesProvider);
      messenger?.showSnackBar(SnackBar(content: Text(l.cardFaresWatchStopped)));
      Analytics.log('fare_watch_stopped', {'where': 'watches_card'});
    } catch (_) {
      messenger?.showSnackBar(SnackBar(content: Text(l.cardFaresWatchFailed)));
    } finally {
      if (mounted) setState(() => _busy.remove(cardId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final watches = ref.watch(fareWatchesProvider);
    final list = watches.value ?? const <Map<String, Object?>>[];
    final limit = widget.p.i('limit') ?? 5;
    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.bellRing,
        iconColor: planeBlue,
        title: l.cardFareWatchesTitle,
        pill: watches.hasValue ? '${list.length}/$limit' : null,
        pillColor: planeBlue,
      ),
      body: !watches.hasValue
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          : list.isEmpty
          ? LivePanel(
              child: Text(l.cardFareWatchesNone, style: context.cardBody),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final w in list) ...[
                  _WatchTile(
                    w: w,
                    busy: _busy.contains('${w['card_id']}'),
                    onStop: () => _stop('${w['card_id']}'),
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
    );
  }
}

class _WatchTile extends StatelessWidget {
  const _WatchTile({required this.w, required this.busy, required this.onStop});
  final Map<String, Object?> w;
  final bool busy;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cur = w['currency'] as String?;
    final first = w['first_price'];
    final last = w['last_price'];
    final low = w['low_price'];
    final below = w['below'];
    final points = watchPoints(w);
    final ends = DateTime.tryParse('${w['ends_at']}');
    final date = ends == null
        ? ''
        : DateFormat.MMMd(l.localeName).format(ends.toLocal());
    final muted = context.colorScheme.onSurfaceVariant;
    return LivePanel(
      padding: const EdgeInsets.fromLTRB(12, 10, 4, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${w['route'] ?? ''}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      last is num
                          ? fmtFare(context, last, cur)
                          : l.cardFareWatchesNoPrice,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontFeatures: AppText.tabular,
                      ),
                    ),
                    // A fare going down is the good news here.
                    if (first is num &&
                        last is num &&
                        first > 0 &&
                        first != last)
                      ChangePill(
                        pct: (last - first) / first * 100,
                        goodWhenUp: false,
                      ),
                  ],
                ),
              ),
              if (points.length > 1)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: 84,
                    height: 28,
                    child: Sparkline(
                      points: points,
                      color: planeBlue,
                      height: 28,
                    ),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  [
                    below is num
                        ? l.cardFareWatchesTarget(fmtFare(context, below, cur))
                        : l.cardFareWatchesAnyDrop,
                    if (low is num && last is num && low < last)
                      l.cardFareWatchesLow(fmtFare(context, low, cur)),
                    if (date.isNotEmpty) l.cardFareWatchesEnds(date),
                  ].join(' · '),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: muted,
                    height: 1.3,
                  ),
                ),
              ),
              TextButton(
                key: Key('fareWatchesStop-${w['card_id']}'),
                onPressed: busy ? null : onStop,
                child: Text(l.cardFaresWatchStop),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
