import 'package:casama/core/billing.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

void main() {
  final fake = FakeBackend()..billingEnabled = true;

  test('a reload that still says Free shows the plan the purchase was just verified with', () async {
    fake.planCode = 'free';
    final stale = await fake.billing('org');
    fake.planCode = 'plus_weekly';
    final verified = await fake.billing('org');
    expect(preferVerifiedBilling(stale, verified).planCode, 'plus_weekly');
  });

  test(
    'a reload with a plan always wins, and nothing verified changes nothing',
    () async {
      fake.planCode = 'pro';
      final fetched = await fake.billing('org');
      fake.planCode = 'plus';
      final verified = await fake.billing('org');
      expect(preferVerifiedBilling(fetched, verified).planCode, 'pro');
      fake.planCode = 'free';
      expect(
        preferVerifiedBilling(await fake.billing('org'), null).planCode,
        'free',
      );
    },
  );

  test('a verify that itself says Free is not preferred', () async {
    fake.planCode = 'free';
    final both = await fake.billing('org');
    expect(identical(preferVerifiedBilling(both, both), both), isTrue);
  });

  test('the safety net only lasts a short while after a purchase', () {
    expect(PurchaseVerifier.trustVerifiedFor, const Duration(minutes: 2));
    expect(
      PurchaseVerifier.reloadsAfterPurchase.last,
      lessThan(PurchaseVerifier.trustVerifiedFor),
    );
  });
}
