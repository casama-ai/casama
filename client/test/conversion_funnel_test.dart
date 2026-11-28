import 'package:casama/core/analytics.dart';
import 'package:casama/core/attribution.dart';
import 'package:casama/core/billing.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/billing/billing_screen.dart' show platformProvider;
import 'package:casama/features/billing/upgrade_prompt.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama/features/chat/widgets/limit_card.dart';
import 'package:casama/features/privacy/ai_consent_step.dart';
import 'package:casama/features/testimonials/testimonials.dart';
import 'package:casama/features/welcome/first_value_gate.dart';
import 'package:casama/features/welcome/heard_from_step.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness;
import 'fake_backend.dart';

void main() {
  test(
    'deferSecondaryOnboardingProvider waits until first value on first run',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(deferSecondaryOnboardingProvider), isFalse);
      container.read(heardFromFirstRunProvider.notifier).mark();
      expect(container.read(deferSecondaryOnboardingProvider), isTrue);
      container.read(firstValueReachedProvider.notifier).mark();
      expect(container.read(deferSecondaryOnboardingProvider), isFalse);
    },
  );

  test(
    'Attribution.takePendingPlan returns pending tier once and clears it',
    () {
      Attribution.setPendingPlanForTest('pro');
      expect(Attribution.takePendingPlan(), 'pro');
      expect(Attribution.takePendingPlan(), isNull);
    },
  );

  test(
    'kMinTestimonials is 1 so a single verified quote shows on the paywall',
    () {
      expect(kMinTestimonials, 1);
    },
  );

  test(
    'aiConsentAskedHereProvider is true on iOS and false on macOS DMG (direct), Android, Windows, Linux',
    () {
      for (final (platform, expected) in [
        (TargetPlatform.iOS, true),
        (TargetPlatform.macOS, false), // default kDistribution == 'direct' (DMG)
        (TargetPlatform.android, false),
        (TargetPlatform.windows, false),
        (TargetPlatform.linux, false),
      ]) {
        final container = ProviderContainer(
          overrides: [platformProvider.overrideWithValue(platform)],
        );
        addTearDown(container.dispose);
        expect(
          container.read(aiConsentAskedHereProvider),
          expected,
          reason: '$platform',
        );
      }
    },
  );

  test('PayFeedbackTracker asks once after typing on 2 distinct days', () async {
    SharedPreferences.setMockInitialValues({});
    expect(await PayFeedbackTracker.shouldAsk(), isFalse);
    await PayFeedbackTracker.recordTypedToday(now: DateTime.utc(2026, 11, 28));
    expect(await PayFeedbackTracker.shouldAsk(), isFalse);
    await PayFeedbackTracker.recordTypedToday(now: DateTime.utc(2026, 11, 29));
    expect(await PayFeedbackTracker.shouldAsk(), isTrue);
    await PayFeedbackTracker.markAsked();
    expect(await PayFeedbackTracker.shouldAsk(), isFalse);
  });

  testWidgets(
    'LimitCard explains the limit calmly with Keep going and See plans and logs analytics',
    (tester) async {
      final events = <String>[];
      Analytics.onCaptureForTest = (name, _) => events.add(name);
      addTearDown(() => Analytics.onCaptureForTest = null);

      final backend = FakeBackend();
      final summary = BillingSummary(
        enabled: true,
        planCode: 'free',
        planName: 'Free',
        interval: 'none',
        limits: const {'cloud_daily_usd': 0.25},
        unlimited: false,
        validUntil: null,
        source_: BillingSummarySource_Enum.default_,
        cancelAtPeriodEnd: false,
        creditsUsd: 1.0,
        daily: BillingSummaryDaily(
          usedUsd: 0.25,
          capUsd: 0.25,
          resetsAt: DateTime.now().toUtc().add(const Duration(hours: 6)),
        ),
        subscriptions: const [],
        providers: const [BillingSource.dodo],
      );
      var keptGoing = false;
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            backendProvider.overrideWithValue(backend),
            billingProvider.overrideWith((_) async => summary),
          ],
          child: harness(
            backend,
            Scaffold(
              body: LimitCard(
                entry: NoticeEntry(
                  kind: NoticeKind.failed,
                  text: 'Daily cap reached',
                  errorCode: 'max_steps',
                  refId: 'run-limit-test',
                ),
                canKeepGoing: true,
                onKeepGoing: () => keptGoing = true,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('limitCard-max_steps')), findsOneWidget);
      expect(find.byKey(const Key('limitCardKeepGoing')), findsOneWidget);
      expect(find.byKey(const Key('limitCardSeePlans')), findsOneWidget);
      expect(events, contains('limit_card_shown'));

      await tester.tap(find.byKey(const Key('limitCardKeepGoing')));
      await tester.pump();
      expect(keptGoing, isTrue);
      expect(events, contains('limit_card_action'));
    },
  );
}
