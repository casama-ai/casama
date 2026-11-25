import 'package:casama/features/owner_live/owner_live_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

void main() {
  const growth = [
    'partner_interest',
    'creator_open',
    'partner_claimed',
    'gift_open',
    'comp_redeemed',
    'referral_rewarded',
    'newsletter_confirmed',
    'testimonial_submitted',
  ];

  test('growth events (D-546) have their own group and icons', () {
    expect(LiveGroup.growth.kinds, containsAll(growth));
    for (final kind in growth) {
      expect(liveKindIcon(kind), isNot(LucideIcons.activity), reason: kind);
      final groups = LiveGroup.values.where(
        (g) => g != LiveGroup.all && g.kinds.contains(kind),
      );
      expect(groups, [LiveGroup.growth], reason: kind);
    }
  });
}
