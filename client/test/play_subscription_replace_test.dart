import 'package:casama/core/billing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:purchases_flutter/purchases_flutter.dart' as rc;

rc.SubscriptionInfo _sub(
  String id,
  rc.Store store, {
  String? plan,
  bool active = true,
}) => rc.SubscriptionInfo(
  id,
  '2026-11-01T00:00:00Z',
  true,
  active,
  true,
  store: store,
  productPlanIdentifier: plan,
);

rc.CustomerInfo _info(Map<String, rc.SubscriptionInfo> subs) => rc.CustomerInfo(
  const rc.EntitlementInfos({}, {}),
  const {},
  [
    for (final e in subs.entries)
      if (e.value.isActive) e.key,
  ],
  const [],
  const [],
  '2026-11-01T00:00:00Z',
  'org',
  const {},
  '2026-11-22T00:00:00Z',
  subscriptionsByProductIdentifier: subs,
);

void main() {
  test('an App Store subscription is never replaced through Play', () {
    final info = _info({
      'ai.casama.plus.yearly': _sub('ai.casama.plus.yearly', rc.Store.appStore),
    });
    expect(playSubscriptionToReplace(info, 'casama_pro:monthly'), isNull);
  });

  test('a Play subscription on another tier or period is replaced by its subscription id', () {
    final info = _info({
      'casama_plus:monthly': _sub(
        'casama_plus',
        rc.Store.playStore,
        plan: 'monthly',
      ),
    });
    expect(
      playSubscriptionToReplace(info, 'casama_pro:monthly'),
      'casama_plus',
    );
    expect(
      playSubscriptionToReplace(info, 'casama_plus:yearly'),
      'casama_plus',
    );
  });

  test('a key without the base plan is matched with productPlanIdentifier', () {
    final info = _info({
      'casama_plus': _sub('casama_plus', rc.Store.playStore, plan: 'monthly'),
    });
    expect(playSubscriptionToReplace(info, 'casama_plus:monthly'), isNull);
    expect(
      playSubscriptionToReplace(info, 'casama_plus:yearly'),
      'casama_plus',
    );
  });

  test('buying the plan you already have, or with only expired ones, replaces nothing', () {
    expect(
      playSubscriptionToReplace(
        _info({
          'casama_plus:monthly': _sub(
            'casama_plus',
            rc.Store.playStore,
            plan: 'monthly',
          ),
        }),
        'casama_plus:monthly',
      ),
      isNull,
    );
    expect(
      playSubscriptionToReplace(
        _info({
          'casama_plus:monthly': _sub(
            'casama_plus',
            rc.Store.playStore,
            plan: 'monthly',
            active: false,
          ),
        }),
        'casama_pro:monthly',
      ),
      isNull,
    );
  });

  test('with both stores active, the Play one is picked', () {
    final info = _info({
      'ai.casama.plus.yearly': _sub('ai.casama.plus.yearly', rc.Store.appStore),
      'casama_plus:monthly': _sub(
        'casama_plus',
        rc.Store.playStore,
        plan: 'monthly',
      ),
    });
    expect(
      playSubscriptionToReplace(info, 'casama_max:monthly'),
      'casama_plus',
    );
  });
}
