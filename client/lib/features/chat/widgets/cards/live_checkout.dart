import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_tokens.dart';
import 'live_composed.dart';
import 'live_kit.dart';
import 'stay_kit.dart';

// After "book for me" and "buy for me" (docs/STAYS-AND-SHOPPING-PLAN.md §6.2, §6.3): the check a
// bot shows before it pays, and the booking or order it ends with. Composed cards: the bot fills
// them from the page or the confirmation it read, and each says where its content came from.

// ---------------------------------------------------------------------------------------------
// Checkout: what the bot is about to pay for
// ---------------------------------------------------------------------------------------------

final checkoutComponent = liveCard('Checkout', const [
  'kind',
  'seller',
  'title',
  'lines',
  'fees',
  'total',
  'currency',
  'terms',
  'url',
], (context, p, ctl) => _Checkout(p: p, act: ctl.act));

class _Checkout extends StatefulWidget {
  const _Checkout({required this.p, required this.act});
  final P p;
  final CardAct act;

  @override
  State<_Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<_Checkout> {
  /// The answer given: "confirm", "change" or "cancel". One answer a card.
  String? _answer;

  P get p => widget.p;

  void _send(String answer, String label) {
    if (_answer != null) return;
    setState(() => _answer = answer);
    widget.act('checkout.$answer', {
      'seller': p.s('seller') ?? '',
      'total': ?p.n('total'),
      'currency': ?p.s('currency'),
    }, label);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cur = p.s('currency');
    final seller = p.s('seller');
    final lines = p.rows('lines');
    final fees = p.rows('fees');
    final total = p.n('total');
    final totalText = total == null ? '' : cardMoney(context, total, cur);
    String amount(P row) => row.n('amount') == null
        ? ''
        : cardMoney(context, row.n('amount')!, cur);

    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.receiptText,
        iconColor: stayTeal,
        title: p.s('title') ?? l.cardCheckoutTitle,
        subtitle: seller,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LivePanel(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final line in lines)
                  CardFactLine(
                    label: [
                      line.s('title') ?? '—',
                      if (line.i('qty') case final q? when q > 0)
                        l.cardCheckoutQty(q),
                    ].join(' '),
                    detail: line.s('detail'),
                    value: amount(line),
                  ),
                for (final fee in fees)
                  CardFactLine(
                    label: fee.s('label') ?? '—',
                    value: amount(fee),
                  ),
                if (lines.isNotEmpty || fees.isNotEmpty)
                  Divider(height: 12, color: context.appColors.hairline),
                CardFactLine(
                  key: const Key('checkoutTotal'),
                  label: l.cardCheckoutTotal,
                  value: totalText,
                  strong: true,
                ),
              ],
            ),
          ),
          if (p.s('terms') case final terms?) ...[
            const SizedBox(height: 8),
            Text(
              terms,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: context.cardLabel,
            ),
          ],
          if (p.s('url') case final u? when u.startsWith('https://'))
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                key: const Key('checkoutOpen'),
                onPressed: () => openCardLink(u),
                icon: const Icon(LucideIcons.externalLink, size: 14),
                label: Text(l.cardCheckoutOpen),
              ),
            ),
          const SizedBox(height: 8),
          if (_answer case final a?)
            Align(
              alignment: Alignment.centerRight,
              child: LivePill(
                key: const Key('checkoutAnswer'),
                text: switch (a) {
                  'confirm' => l.cardCheckoutConfirmed,
                  'change' => l.cardCheckoutChanging,
                  _ => l.cardCheckoutCancelled,
                },
                icon: a == 'confirm' ? LucideIcons.check : null,
                color: a == 'confirm' ? context.appColors.positive : null,
              ),
            )
          else
            Wrap(
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                TextButton(
                  key: const Key('checkoutCancel'),
                  onPressed: () => _send('cancel', l.cardCheckoutCancelLabel),
                  child: Text(l.cardCheckoutCancel),
                ),
                OutlinedButton(
                  key: const Key('checkoutChange'),
                  onPressed: () => _send('change', l.cardCheckoutChangeLabel),
                  child: Text(l.cardCheckoutChange),
                ),
                FilledButton.icon(
                  key: const Key('checkoutConfirm'),
                  onPressed: () => _send(
                    'confirm',
                    seller == null || seller.isEmpty
                        ? l.cardCheckoutConfirmNoSellerLabel(totalText)
                        : l.cardCheckoutConfirmLabel(totalText, seller),
                  ),
                  icon: const Icon(LucideIcons.check, size: 16),
                  label: Text(l.cardCheckoutConfirm),
                ),
              ],
            ),
        ],
      ),
      footer: composedFooter(context, p),
    );
  }
}

// ---------------------------------------------------------------------------------------------
// StayBooking: a booked stay
// ---------------------------------------------------------------------------------------------

final stayBookingComponent = liveCard(
  'StayBooking',
  const [
    'name',
    'imageUrl',
    'address',
    'lat',
    'lng',
    'checkIn',
    'checkOut',
    'checkInTime',
    'checkOutTime',
    'guests',
    'room',
    'confirmation',
    'total',
    'currency',
    'paid',
    'cancelBy',
    'site',
    'url',
    'phone',
  ],
  (context, p, ctl) {
    final l = context.l10n;
    final name = p.s('name');
    if (name == null) return null;
    final muted = context.colorScheme.onSurfaceVariant;
    final nights = nightsBetween(p.s('checkIn'), p.s('checkOut'));
    final guests = p.i('guests');
    final pin = cardPin(p.n('lat'), p.n('lng'), name);
    final address = p.s('address');
    final directions = mapsLink(
      lat: pin?.lat,
      lng: pin?.lng,
      address: address == null ? null : '$name, $address',
    );
    final total = p.n('total');
    final paid = switch (p.s('paid')) {
      'paid' => l.cardBookingPaid,
      'pay_at_property' => l.cardBookingPayAtHotel,
      _ => null,
    };
    final facts = [
      if (nights != null) l.cardStaysNights(nights),
      if (guests != null && guests > 0) l.cardStaysGuests(guests),
      ?p.s('room'),
    ].join(' · ');

    Widget day(String label, String? iso, String? time) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: context.cardLabel),
          Text(
            cardDayText(context, iso, weekday: true),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          if (time != null)
            Text(
              time,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.cardLabel,
            ),
        ],
      ),
    );

    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.bedDouble,
        iconColor: stayTeal,
        title: name,
        subtitle: p.s('site') == null
            ? l.cardBookingTitle
            : l.cardBookingWith(p.s('site')!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (p.s('imageUrl') case final img?) ...[
            CardImage(
              url: img,
              height: 150,
              width: double.infinity,
              radius: AppRadius.tile,
              fallback: const SizedBox(
                height: 150,
                width: double.infinity,
                child: CardPhotoPlaceholder(
                  icon: LucideIcons.bedDouble,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
          LivePanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    day(
                      l.cardBookingCheckIn,
                      p.s('checkIn'),
                      p.s('checkInTime'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 16, 8, 0),
                      child: Icon(
                        LucideIcons.arrowRight,
                        size: 14,
                        color: muted,
                      ),
                    ),
                    day(
                      l.cardBookingCheckOut,
                      p.s('checkOut'),
                      p.s('checkOutTime'),
                    ),
                  ],
                ),
                if (facts.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    facts,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.cardLabel,
                  ),
                ],
              ],
            ),
          ),
          if (p.s('confirmation') case final code?) ...[
            const SizedBox(height: 8),
            CopyLine(
              buttonKey: const Key('bookingCopy'),
              label: l.cardBookingConfirmation,
              value: code,
              tooltip: l.cardBookingCopy,
            ),
          ],
          if (total != null || paid != null)
            CardFactLine(
              key: const Key('bookingTotal'),
              label: total == null ? paid! : l.cardCheckoutTotal,
              detail: total == null ? null : paid,
              value: total == null
                  ? ''
                  : cardMoney(context, total, p.s('currency')),
              strong: total != null,
            ),
          if (p.s('cancelBy') case final by?)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  Icon(
                    LucideIcons.calendarCheck,
                    size: 14,
                    color: context.appColors.positive,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      l.cardBookingCancelBy(cardDayText(context, by)),
                      style: context.cardLabel,
                    ),
                  ),
                ],
              ),
            ),
          if (pin != null) ...[
            const SizedBox(height: 10),
            CardPinMap(key: const Key('bookingMap'), pins: [pin], height: 160),
          ],
          if (address != null) ...[
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(LucideIcons.mapPin, size: 14, color: muted),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    address,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.cardLabel,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (directions != null)
                FilledButton.tonalIcon(
                  key: const Key('bookingDirections'),
                  onPressed: () => openCardLink(directions),
                  icon: const Icon(LucideIcons.navigation, size: 16),
                  label: Text(l.cardBookingDirections),
                ),
              if (p.s('phone') case final phone?)
                FilledButton.tonalIcon(
                  key: const Key('bookingCall'),
                  onPressed: () => launchUrl(Uri(scheme: 'tel', path: phone)),
                  icon: const Icon(LucideIcons.phone, size: 16),
                  label: Text(l.cardCall),
                ),
              if (p.s('url') case final u? when u.startsWith('https://'))
                FilledButton.tonalIcon(
                  key: const Key('bookingManage'),
                  onPressed: () => openCardLink(u),
                  icon: const Icon(LucideIcons.externalLink, size: 16),
                  label: Text(l.cardBookingManage),
                ),
              FilledButton.tonalIcon(
                key: const Key('bookingCalendar'),
                onPressed: () => ctl.act('booking.calendar', {
                  'name': name,
                  'check_in': ?p.s('checkIn'),
                  'check_out': ?p.s('checkOut'),
                  'address': ?address,
                }, l.cardBookingCalendarLabel(name)),
                icon: const Icon(LucideIcons.calendarPlus, size: 16),
                label: Text(l.cardBookingCalendar),
              ),
            ],
          ),
        ],
      ),
      footer: composedFooter(context, p),
    );
  },
);

// ---------------------------------------------------------------------------------------------
// Order: something bought, and where it is
// ---------------------------------------------------------------------------------------------

/// The steps an order moves through, in order; "paid" sits with "ordered".
const _orderSteps = ['ordered', 'shipped', 'out_for_delivery', 'delivered'];

final orderComponent = liveCard(
  'Order',
  const [
    'store',
    'orderId',
    'placed',
    'items',
    'total',
    'currency',
    'status',
    'eta',
    'trackingNumber',
    'carrier',
    'tracking',
    'url',
  ],
  (context, p, ctl) {
    final l = context.l10n;
    final store = p.s('store');
    if (store == null) return null;
    final cur = p.s('currency');
    final items = p.rows('items');
    final total = p.n('total');
    final status = p.s('status') ?? 'ordered';
    final stopped = switch (status) {
      'cancelled' => l.cardOrderCancelled,
      'returned' => l.cardOrderReturned,
      _ => null,
    };
    final step = stopped != null
        ? -1
        : (_orderSteps.indexOf(status)).clamp(0, _orderSteps.length - 1);
    final tracking = p.map('tracking');
    final number = p.s('trackingNumber') ?? tracking.s('number');
    final carrier = p.s('carrier') ?? tracking.s('carrier');
    final subtitle = [
      if (p.s('orderId') case final id?) l.cardOrderNumber(id),
      if (p.s('placed') case final d?)
        l.cardOrderPlaced(cardDayText(context, d)),
    ].join(' · ');

    return LiveLayout(
      header: LiveHeader(
        icon: LucideIcons.package,
        iconColor: shopPink,
        title: store,
        subtitle: subtitle.isEmpty ? null : subtitle,
        pill: stopped,
        pillColor: stopped == null ? null : context.appColors.warning,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _OrderSteps(step: step),
          if (p.s('eta') case final eta? when stopped == null && step < 3) ...[
            const SizedBox(height: 8),
            Text(
              l.cardOrderArrives(cardDayText(context, eta, weekday: true)),
              key: const Key('orderEta'),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const SizedBox(height: 10),
          LivePanel(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final item in items)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        CardImage(
                          url: item.s('imageUrl'),
                          width: 40,
                          height: 40,
                          radius: 8,
                          fit: BoxFit.contain,
                          fallback: const SizedBox(
                            width: 40,
                            height: 40,
                            child: CardPhotoPlaceholder(
                              icon: LucideIcons.package,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            [
                              item.s('title') ?? '—',
                              if (item.i('qty') case final q? when q > 1)
                                l.cardCheckoutQty(q),
                            ].join(' '),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        if (item.n('amount') case final a?) ...[
                          const SizedBox(width: 10),
                          Text(
                            cardMoney(context, a, cur),
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontFeatures: AppText.tabular,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                if (total != null) ...[
                  if (items.isNotEmpty)
                    Divider(height: 12, color: context.appColors.hairline),
                  CardFactLine(
                    key: const Key('orderTotal'),
                    label: l.cardCheckoutTotal,
                    value: cardMoney(context, total, cur),
                    strong: true,
                  ),
                ],
              ],
            ),
          ),
          if (number != null) ...[
            const SizedBox(height: 8),
            CopyLine(
              buttonKey: const Key('orderCopy'),
              label: carrier == null
                  ? l.cardOrderTracking
                  : '${l.cardOrderTracking} · $carrier',
              value: number,
              tooltip: l.cardOrderCopy,
            ),
          ],
          if (number != null || p.s('url') != null) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (number != null)
                  FilledButton.tonalIcon(
                    key: const Key('orderTrack'),
                    onPressed: () => ctl.act('order.track', {
                      'number': number,
                      'carrier': ?carrier,
                    }, l.cardOrderTrackLabel(number)),
                    icon: const Icon(LucideIcons.truck, size: 16),
                    label: Text(l.cardOrderTrack),
                  ),
                if (p.s('url') case final u? when u.startsWith('https://'))
                  FilledButton.tonalIcon(
                    key: const Key('orderPage'),
                    onPressed: () => openCardLink(u),
                    icon: const Icon(LucideIcons.externalLink, size: 16),
                    label: Text(l.cardOrderPage),
                  ),
              ],
            ),
          ],
        ],
      ),
      footer: composedFooter(context, p),
    );
  },
);

/// Ordered → shipped → out for delivery → delivered, filled up to [step]; all empty when the order
/// was cancelled or returned (-1).
class _OrderSteps extends StatelessWidget {
  const _OrderSteps({required this.step});
  final int step;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final labels = [
      l.cardOrderStepOrdered,
      l.cardOrderStepShipped,
      l.cardOrderStepOut,
      l.cardOrderStepDelivered,
    ];
    final on = context.appColors.positive;
    final off = context.colorScheme.surfaceContainerHighest;
    return Semantics(
      label: step < 0 ? null : labels[step],
      excludeSemantics: true,
      child: Row(
        key: Key('orderSteps-$step'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (i, label) in labels.indexed)
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 3,
                          color: i == 0
                              ? Colors.transparent
                              : (i <= step ? on : off),
                        ),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i <= step ? on : off,
                        ),
                        child: i <= step
                            ? Icon(
                                LucideIcons.check,
                                size: 11,
                                color: context.colorScheme.surface,
                              )
                            : null,
                      ),
                      Expanded(
                        child: Container(
                          height: 3,
                          color: i == labels.length - 1
                              ? Colors.transparent
                              : (i < step ? on : off),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: i == step ? FontWeight.w700 : null,
                      color: i <= step
                          ? context.colorScheme.onSurface
                          : context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
