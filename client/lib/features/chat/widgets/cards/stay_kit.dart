import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import '../../../../ui/adaptive_modal.dart';
import '../bot_ui_map.dart';
import 'live_kit.dart';

// What the hotel and shopping cards share (docs/STAYS-AND-SHOPPING-PLAN.md §4–§6): money and
// dates, a stay's rating and terms, the sheet frame, a photo gallery, a map of pins, the compare
// table and small form parts. Everything a card says comes from its own data; nothing here asks
// the model.

/// Sends an event to the bot: its name, its values, and the words shown as the person's message.
typedef CardAct = void Function(
  String event,
  Map<String, Object?> values,
  String label,
);

const stayTeal = Color(0xFF1F9D8B);
const shopPink = Color(0xFFD9488B);

// ---------------------------------------------------------------------------------------------
// Money, numbers and dates
// ---------------------------------------------------------------------------------------------

/// An amount in the card's currency: whole units when the number is whole, cents otherwise.
String cardMoney(BuildContext context, num v, String? currency) {
  final locale = context.l10n.localeName;
  final cur = (currency ?? '').trim().toUpperCase();
  final digits = v == v.roundToDouble() ? 0 : 2;
  final plain = NumberFormat.decimalPatternDigits(
    locale: locale,
    decimalDigits: digits,
  ).format(v);
  if (cur.isEmpty) return plain;
  try {
    return NumberFormat.simpleCurrency(
      locale: locale,
      name: cur,
      decimalDigits: digits,
    ).format(v);
  } catch (_) {
    return '$plain $cur';
  }
}

/// A short amount for a chart: "₱9.1K".
String cardMoneyShort(BuildContext context, num v, String? currency) {
  final cur = (currency ?? '').trim().toUpperCase();
  if (v.abs() < 1000 || cur.isEmpty) return cardMoney(context, v.round(), cur);
  try {
    return NumberFormat.compactSimpleCurrency(
      locale: context.l10n.localeName,
      name: cur,
    ).format(v);
  } catch (_) {
    return cardMoney(context, v.round(), cur);
  }
}

/// "8.8", "9", "4.25": a number without a trailing ".0".
String cardNumber(BuildContext context, num v) =>
    NumberFormat.decimalPattern(context.l10n.localeName)
        .format(v == v.roundToDouble() ? v.round() : v);

/// The day of "2027-03-12" (or of a longer ISO time); null for anything else.
DateTime? cardDay(String? iso) {
  if (iso == null || iso.length < 10) return null;
  final d = DateTime.tryParse(iso.substring(0, 10));
  return d == null ? null : DateTime(d.year, d.month, d.day);
}

String isoDay(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// "Mar 12", or the text as it came when it isn't a date.
String cardDayText(BuildContext context, String? iso, {bool weekday = false}) {
  final d = cardDay(iso);
  if (d == null) return iso ?? '';
  final locale = context.l10n.localeName;
  return weekday
      ? DateFormat.MMMEd(locale).format(d)
      : DateFormat.MMMd(locale).format(d);
}

/// "Mar 12 – Mar 15".
String cardDayRange(BuildContext context, String? from, String? to) => [
  if (from != null) cardDayText(context, from),
  if (to != null) cardDayText(context, to),
].join(' – ');

/// Whole nights between two days; null when either is missing or they're the wrong way round.
int? nightsBetween(String? from, String? to) {
  final a = cardDay(from), b = cardDay(to);
  if (a == null || b == null) return null;
  final n = DateTime.utc(
    b.year,
    b.month,
    b.day,
  ).difference(DateTime.utc(a.year, a.month, a.day)).inDays;
  return n > 0 ? n : null;
}

// ---------------------------------------------------------------------------------------------
// A stay
// ---------------------------------------------------------------------------------------------

/// Where the deal with the lowest price a night is in [deals] (the list isn't always in price
/// order); null when none has a price.
int? cheapestDealIndex(List<P> deals) {
  int? best;
  for (final (i, d) in deals.indexed) {
    final n = d.n('night');
    if (n == null) continue;
    if (best == null || n < deals[best].n('night')!) best = i;
  }
  return best;
}

P? cheapestDeal(P stay) {
  final deals = stay.rows('deals');
  final i = cheapestDealIndex(deals);
  return i == null ? null : deals[i];
}

double? stayNight(P stay) => cheapestDeal(stay)?.n('night') ?? stay.n('night');
double? stayTotal(P stay) => cheapestDeal(stay)?.n('stay') ?? stay.n('stay');

/// A rating as a share of its own scale, to compare 8.8 of 10 with 4.3 of 5.
double ratingShare(P stay) {
  final r = stay.map('rating');
  final v = r.n('value'), max = r.n('max');
  return v == null || max == null || max <= 0 ? 0 : v / max;
}

/// "8.8 of 10 · 7,316", on the source's own scale.
String? stayRatingText(BuildContext context, P stay) {
  final r = stay.map('rating');
  final v = r.n('value');
  if (v == null) return null;
  final max = r.n('max');
  final count = r.i('count');
  return [
    max == null
        ? cardNumber(context, v)
        : context.l10n.cardStaysRating(
            cardNumber(context, v),
            cardNumber(context, max),
          ),
    if (count != null && count > 0) cardNumber(context, count),
  ].join(' · ');
}

/// The source's own words for where it is, or the distance from the middle of the search.
String? stayDistance(BuildContext context, P stay) {
  final d = stay.s('distance');
  if (d != null) return d;
  final km = stay.n('km');
  return km == null ? null : context.l10n.cardStaysKm(cardNumber(context, km));
}

bool stayHasTerm(P stay, String term) =>
    stay.rows('deals').any((d) => d.texts('terms').contains(term));

String? termLabel(BuildContext context, String term) {
  final l = context.l10n;
  return switch (term) {
    'free_cancellation' => l.cardStaysTermFreeCancel,
    'breakfast' => l.cardStaysTermBreakfast,
    'no_breakfast' => l.cardStaysTermNoBreakfast,
    'pay_at_property' => l.cardStaysTermPayAtHotel,
    'non_refundable' => l.cardStaysTermNonRefundable,
    _ => null,
  };
}

/// "Mar 12 – Mar 15 · 3 nights · 2 guests", from a stay card's own search.
String staysDatesLine(BuildContext context, P card, {bool rooms = false}) {
  final l = context.l10n;
  final nights =
      card.i('nights') ?? nightsBetween(card.s('checkIn'), card.s('checkOut'));
  final g = card.map('guests');
  final people = (g.i('adults') ?? 0) + (g.i('children') ?? 0);
  final r = g.i('rooms') ?? 1;
  return [
    cardDayRange(context, card.s('checkIn'), card.s('checkOut')),
    if (nights != null) l.cardStaysNights(nights),
    if (people > 0) l.cardStaysGuests(people),
    if (rooms || r > 1) l.cardStaysRooms(r),
  ].where((x) => x.isNotEmpty).join(' · ');
}

/// What the search form starts from, for a stay card's Edit.
P staySearchInitial(P card) {
  final s = card.map('search');
  final g = card.map('guests');
  return P({
    'where': s.s('where') ?? card.map('place').s('label'),
    'checkIn': card.s('checkIn'),
    'checkOut': card.s('checkOut'),
    'adults': g.i('adults'),
    'rooms': g.i('rooms'),
    'budget': s.n('budget'),
    'amenities': s.texts('amenities'),
    'currency': card.s('currency'),
  });
}

/// Hotel class as stars; says "3-star" to a screen reader.
class StarRow extends StatelessWidget {
  const StarRow({super.key, required this.stars, this.size = 12});
  final int stars;
  final double size;

  @override
  Widget build(BuildContext context) {
    final n = stars.clamp(0, 5);
    if (n == 0) return const SizedBox.shrink();
    return Semantics(
      label: context.l10n.cardStaysStars(n),
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < n; i++)
            Icon(Icons.star_rounded, size: size + 2, color: _gold),
        ],
      ),
    );
  }
}

const _gold = Color(0xFFE2A400);

/// "★ 4.3 (646)" for a product, out of 5.
class ProductRating extends StatelessWidget {
  const ProductRating({super.key, required this.rating});
  final P rating;

  @override
  Widget build(BuildContext context) {
    final v = rating.n('value');
    if (v == null) return const SizedBox.shrink();
    final count = rating.i('count');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, size: 14, color: _gold),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            [
              cardNumber(context, v),
              if (count != null && count > 0) '(${fmtCompact(context, count)})',
            ].join(' '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.cardLabel,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------------------------
// Sheets
// ---------------------------------------------------------------------------------------------

/// The frame every stay and shopping sheet uses: a title with Close, and a body that scrolls when
/// it's taller than the screen.
class CardSheet extends StatelessWidget {
  const CardSheet({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
  });
  final String title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty)
                      Text(
                        subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.cardLabel,
                      ),
                  ],
                ),
              ),
              IconButton(
                key: const Key('cardSheetClose'),
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(LucideIcons.x, size: 20),
                tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(right: 8),
              child: child,
            ),
          ),
        ],
      ),
    ),
  );
}

/// An act that also closes the sheet it was sent from.
CardAct? closingAct(BuildContext sheet, CardAct? act) => act == null
    ? null
    : (event, values, label) {
        Navigator.of(sheet).maybePop();
        act(event, values, label);
      };

// ---------------------------------------------------------------------------------------------
// Pictures
// ---------------------------------------------------------------------------------------------

/// A picture's place when there is none, or it didn't load.
class CardPhotoPlaceholder extends StatelessWidget {
  const CardPhotoPlaceholder({super.key, required this.icon, this.size = 22});
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: context.colorScheme.surfaceContainerHighest,
    child: Center(
      child: Icon(
        icon,
        size: size,
        color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
      ),
    ),
  );
}

/// Photos to swipe through, with dots; one photo is just the photo.
class CardGallery extends StatefulWidget {
  const CardGallery({
    super.key,
    required this.urls,
    required this.icon,
    this.height = 180,
    this.fit = BoxFit.cover,
  });
  final List<String> urls;
  final IconData icon;
  final double height;
  final BoxFit fit;

  @override
  State<CardGallery> createState() => _CardGalleryState();
}

class _CardGalleryState extends State<CardGallery> {
  final _pages = PageController();
  int _at = 0;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  Widget _photo(String? url) => CardImage(
    url: url,
    width: double.infinity,
    height: widget.height,
    radius: AppRadius.tile,
    fit: widget.fit,
    fallback: SizedBox(
      width: double.infinity,
      height: widget.height,
      child: CardPhotoPlaceholder(icon: widget.icon, size: 30),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final urls = widget.urls.take(12).toList();
    if (urls.length < 2) return _photo(urls.firstOrNull);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            key: const Key('cardGallery'),
            controller: _pages,
            itemCount: urls.length,
            onPageChanged: (i) => setState(() => _at = i),
            itemBuilder: (context, i) => Semantics(
              label: context.l10n.cardStaysPhoto(i + 1, urls.length),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: _photo(urls[i]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < urls.length; i++)
              Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == _at
                      ? context.colorScheme.onSurface
                      : context.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.3,
                        ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------------------------
// The map
// ---------------------------------------------------------------------------------------------

/// A place for the map: where it is and what its pin says.
typedef CardPin = ({double lat, double lng, String? label});

/// A pin from a `{lat, lng}` pair; null when either is missing or off the globe.
CardPin? cardPin(double? lat, double? lng, String? label) =>
    lat == null || lng == null || lat.abs() > 90 || lng.abs() > 180
    ? null
    : (lat: lat, lng: lng, label: label);

/// The app's own map (D-310) with a card's pins; a tap on one answers with its place in [pins].
class CardPinMap extends StatelessWidget {
  const CardPinMap({
    super.key,
    required this.pins,
    this.height = 180,
    this.onTap,
  });
  final List<CardPin> pins;
  final double height;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    if (pins.isEmpty) return const SizedBox.shrink();
    return BotMapCard(
      spec: MapCardSpec(
        // One pin sits in the middle; several are fitted in view.
        center: pins.length == 1
            ? LatLng(pins.first.lat, pins.first.lng)
            : null,
        zoom: 14,
        markers: [
          for (final p in pins.take(50))
            (point: LatLng(p.lat, p.lng), label: p.label),
        ],
        path: const [],
        height: height,
      ),
      onMarkerTap: onTap,
    );
  }
}

/// A maps link for a place: its coordinates when known, else its address.
String? mapsLink({double? lat, double? lng, String? address}) {
  final q = lat != null && lng != null ? '$lat,$lng' : address;
  if (q == null || q.trim().isEmpty) return null;
  return Uri.https('www.google.com', '/maps/search/', {
    'api': '1',
    'query': q,
  }).toString();
}

// ---------------------------------------------------------------------------------------------
// Compare
// ---------------------------------------------------------------------------------------------

/// How many rows a person may tick to compare.
const comparePickLimit = 4;

/// The tick on a row or tile.
class PickTick extends StatelessWidget {
  const PickTick({
    super.key,
    required this.picked,
    required this.onChanged,
    this.enabled = true,
  });
  final bool picked;
  final bool enabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final off = !enabled && !picked;
    return IconButton(
      // At the limit the tick still takes the tap (it mustn't open the row under it) and says why.
      onPressed: () {
        if (!off) return onChanged(!picked);
        final messenger = ScaffoldMessenger.maybeOf(context);
        messenger?.hideCurrentSnackBar();
        messenger?.showSnackBar(
          SnackBar(content: Text(context.l10n.cardStaysCompareHint)),
        );
      },
      isSelected: picked,
      visualDensity: VisualDensity.compact,
      tooltip: context.l10n.cardStaysComparePick,
      icon: Icon(
        picked ? LucideIcons.squareCheck : LucideIcons.square,
        size: 18,
        color: picked
            ? context.colorScheme.primary
            : off
            ? context.colorScheme.onSurfaceVariant.withValues(alpha: 0.35)
            : null,
      ),
    );
  }
}

/// "Tick up to 4 to compare", then a Compare button once two are ticked.
class CompareBar extends StatelessWidget {
  const CompareBar({
    super.key,
    required this.buttonKey,
    required this.count,
    required this.onCompare,
  });
  final Key buttonKey;
  final int count;
  final VoidCallback onCompare;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Row(
      children: [
        Expanded(child: Text(l.cardStaysCompareHint, style: context.cardLabel)),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          key: buttonKey,
          onPressed: count >= 2 ? onCompare : null,
          icon: const Icon(LucideIcons.columns2, size: 16),
          label: Text(l.cardStaysCompare(count)),
          style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
        ),
      ],
    );
  }
}

/// The picked things side by side: one column each, one row per fact. Scrolls sideways on a phone.
Future<void> showCompareSheet(
  BuildContext context, {
  required List<String> names,
  required List<(String label, List<String> values)> rows,
}) => showCardSheet(
  context,
  builder: (sheet) => CardSheet(
    title: sheet.l10n.cardStaysCompareTitle,
    child: SingleChildScrollView(
      key: const Key('compareSheet'),
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: const FixedColumnWidth(132),
        columnWidths: const {0: FixedColumnWidth(96)},
        border: TableBorder(
          horizontalInside: BorderSide(color: sheet.appColors.hairline),
        ),
        children: [
          TableRow(
            children: [
              const SizedBox.shrink(),
              for (final n in names)
                _CompareCell(
                  n,
                  style: sheet.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 3,
                ),
            ],
          ),
          for (final (label, values) in rows)
            TableRow(
              children: [
                _CompareCell(label, style: sheet.cardLabel),
                for (final v in values)
                  _CompareCell(v, style: sheet.textTheme.bodyMedium),
              ],
            ),
        ],
      ),
    ),
  ),
);

class _CompareCell extends StatelessWidget {
  const _CompareCell(this.text, {this.style, this.maxLines = 4});
  final String text;
  final TextStyle? style;
  final int maxLines;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
    child: Text(
      text.isEmpty ? '—' : text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: style,
    ),
  );
}

/// Opens a sheet the way the rest of the app does (a sheet on a phone, a dialog on a wide window).
Future<T?> showCardSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
}) => showAdaptiveSheet<T>(context: context, builder: builder);

// ---------------------------------------------------------------------------------------------
// Small parts
// ---------------------------------------------------------------------------------------------

/// A label with − and + around a number. [name] makes the keys: "staySearchAdults" gives
/// staySearchAdultsMinus, staySearchAdultsValue and staySearchAdultsPlus.
class CardStepper extends StatelessWidget {
  const CardStepper({
    super.key,
    required this.name,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });
  final String name;
  final String label;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Row(
      children: [
        Expanded(child: Text(label, style: context.textTheme.bodyMedium)),
        IconButton(
          key: Key('${name}Minus'),
          onPressed: value > min ? () => onChanged(value - 1) : null,
          icon: const Icon(LucideIcons.minus, size: 16),
          tooltip: l.cardStaysFewer(label),
          visualDensity: VisualDensity.compact,
        ),
        SizedBox(
          width: 24,
          child: Text(
            '$value',
            key: Key('${name}Value'),
            textAlign: TextAlign.center,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton(
          key: Key('${name}Plus'),
          onPressed: value < max ? () => onChanged(value + 1) : null,
          icon: const Icon(LucideIcons.plus, size: 16),
          tooltip: l.cardStaysMore(label),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}

/// A value with a copy button beside it (a confirmation or tracking number).
class CopyLine extends StatelessWidget {
  const CopyLine({
    super.key,
    required this.buttonKey,
    required this.label,
    required this.value,
    required this.tooltip,
  });
  final Key buttonKey;
  final String label;
  final String value;
  final String tooltip;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: context.cardLabel),
            SelectableText(
              value,
              maxLines: 1,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontFeatures: AppText.tabular,
              ),
            ),
          ],
        ),
      ),
      IconButton(
        key: buttonKey,
        onPressed: () async {
          final messenger = ScaffoldMessenger.maybeOf(context);
          final done = context.l10n.cardCopied;
          await Clipboard.setData(ClipboardData(text: value));
          messenger?.showSnackBar(SnackBar(content: Text(done)));
        },
        icon: const Icon(LucideIcons.copy, size: 16),
        tooltip: tooltip,
      ),
    ],
  );
}

/// A label on the left and a value on the right, for totals and facts.
class CardFactLine extends StatelessWidget {
  const CardFactLine({
    super.key,
    required this.label,
    required this.value,
    this.detail,
    this.strong = false,
  });
  final String label;
  final String value;
  final String? detail;
  final bool strong;

  @override
  Widget build(BuildContext context) {
    final style = strong
        ? context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)
        : context.textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
                if (detail != null)
                  Text(
                    detail!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.cardLabel,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(value, style: style?.copyWith(fontFeatures: AppText.tabular)),
        ],
      ),
    );
  }
}

/// The "Compare on Booking.com" link and the line that says Casama may earn from links, for cards
/// whose server set them (docs/STAYS-AND-SHOPPING-PLAN.md Phase 7). Nothing when neither is set.
class CardAffiliateFooter extends StatelessWidget {
  const CardAffiliateFooter({super.key, required this.card});
  final P card;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final compare = card.map('compare');
    final url = compare.s('url');
    final linked = url != null && url.startsWith('https://');
    final affiliate = card.b('affiliate') == true;
    if (!linked && !affiliate) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (linked)
          TextButton.icon(
            key: const Key('cardCompare'),
            onPressed: () => openCardLink(url),
            icon: const Icon(LucideIcons.externalLink, size: 14),
            label: Text(l.cardFaresCompare(compare.s('name') ?? 'Booking.com')),
          ),
        if (affiliate) Text(l.cardFaresAffiliate, key: const Key('cardAffiliate'), style: context.cardLabel),
      ],
    );
  }
}

