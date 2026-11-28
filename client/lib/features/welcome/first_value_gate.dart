import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/attribution.dart';
import '../../core/billing.dart';
import '../../core/providers.dart';
import '../../core/router.dart';
import '../billing/paywall.dart';
import 'heard_from_step.dart';

/// Whether this session has finished at least one person-asked reply (docs/CONVERSION-FUNNEL-PLAN.md §3).
///
/// On a brand-new account's first run (`heardFromFirstRunProvider == true`), secondary onboarding
/// overlays (`HeardFromStep`, `GalleryPicksStep`, `NotificationsPrimer`) wait until this flips to
/// `true` so the person reaches the chat composer and gets a real reply first.
class FirstValueReached extends Notifier<bool> {
  @override
  bool build() {
    ref.watch(signedInProvider);
    return false;
  }

  void mark() {
    if (!state) state = true;
  }
}

final firstValueReachedProvider = NotifierProvider<FirstValueReached, bool>(
  FirstValueReached.new,
);

/// True while secondary first-run overlays should stay out of the way so the user can send their
/// first message unobstructed.
final deferSecondaryOnboardingProvider = Provider.autoDispose<bool>((ref) {
  return ref.watch(heardFromFirstRunProvider) &&
      !ref.watch(firstValueReachedProvider);
});

/// Handles `?plan=plus|pro|max` handoffs from `casama.ai/pricing` once sign-in and consent are clear.
class PricingHandoff {
  PricingHandoff(this._ref);

  final Ref _ref;

  /// Opens the paywall on a tier clicked on `casama.ai/pricing` (`?plan=plus|pro|max`), once.
  Future<bool> openPendingPricingPlan() async {
    final tier = Attribution.takePendingPlan();
    if (tier == null) return false;
    final ctx = _ref.read(routerProvider).routerDelegate.navigatorKey.currentContext;
    if (ctx == null || !ctx.mounted) return false;
    final billing = _ref.read(billingProvider).value;
    if (billing != null && (!billing.enabled || billing.planCode != 'free')) {
      return false;
    }
    final org = _ref.read(currentOrgProvider);
    if (org != null && org.role == OrgRole.member) return false;
    await openPaywall(ctx, source: 'pricing_link', tier: tier);
    return true;
  }
}

final pricingHandoffProvider = Provider<PricingHandoff>((ref) => PricingHandoff(ref));
