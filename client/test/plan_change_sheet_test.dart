import 'package:casama/core/providers.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/billing/billing_screen.dart'
    show openUrlProvider, platformProvider;
import 'package:casama/features/billing/plan_change_sheet.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';
import 'fake_unlockers.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  Future<PlanChangeOutcome?> openSheet(
    WidgetTester tester,
    FakeBackend backend, {
    TargetPlatform platform = TargetPlatform.macOS,
    FakeUnlockers? unlockers,
    String planCode = 'max_yearly',
    String? planName = 'Max (yearly)',
  }) async {
    PlanChangeOutcome? outcome;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          backendProvider.overrideWithValue(backend),
          platformProvider.overrideWithValue(platform),
          unlockersProvider.overrideWithValue(unlockers ?? FakeUnlockers()),
          openUrlProvider.overrideWithValue((_) async {}),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Consumer(
            builder: (context, ref, _) => Scaffold(
              body: TextButton(
                key: const Key('openSheet'),
                onPressed: () async {
                  outcome = await showPlanChangeSheet(
                    context,
                    ref,
                    orgId: 'org-1',
                    planCode: planCode,
                    planName: planName,
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('openSheet')));
    await tester.pumpAndSettle();
    return outcome;
  }

  PlanChangePreview samplePreview({
    int immediateTotal = 94446,
    int immediateTax = 6996,
    int credit = 2450,
    int recurringPreTax = 89900,
    bool discountApplied = false,
    String? discountCode,
    num? discountPercent,
    int? discountCycles,
    String currency = 'USD',
    bool? discountPreserved,
    bool? replacesDiscount,
    num? replacedDiscountPercent,
  }) => PlanChangePreview(
    planCode: 'max_yearly',
    planName: 'Max (yearly)',
    interval: PlanChangePreviewIntervalEnum.year,
    currency: currency,
    immediateTotal: immediateTotal,
    immediateTax: immediateTax,
    credit: credit,
    recurringPreTax: recurringPreTax,
    nextBillingDate: DateTime.utc(2027, 11, 24),
    discountApplied: discountApplied,
    discountCode: discountCode,
    discountPercent: discountPercent,
    discountCycles: discountCycles,
    discountPreserved: discountPreserved ?? (discountApplied ? true : null),
    replacesDiscount: replacesDiscount,
    replacedDiscountPercent: replacedDiscountPercent,
  );

  testWidgets(
    'shows immediate charge, tax, credit, renewal price and date; charges only on confirm',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, _) async => samplePreview();

      await openSheet(tester, backend);

      expect(find.byKey(const Key('planChangeSheet')), findsOneWidget);
      expect(find.text('Switch to Max (yearly)'), findsOneWidget);
      expect(find.text('\$944.46'), findsOneWidget);
      expect(find.text('Includes \$69.96 tax'), findsOneWidget);
      expect(find.text('−\$24.50'), findsOneWidget);
      expect(find.text('Then \$899.00 / year (before tax)'), findsOneWidget);
      expect(
        find.byKey(const Key('planChangeNextBillingLine')),
        findsOneWidget,
      );
      expect(backend.checkouts, isEmpty);

      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();

      expect(backend.checkoutRequests, hasLength(1));
      expect(backend.checkoutRequests.single.planCode, 'max_yearly');
      expect(backend.checkoutRequests.single.discountCode, isNull);
      expect(backend.checkoutRequests.single.expectedTotal, 94446);
      expect(backend.checkoutRequests.single.expectedCurrency, 'USD');
      expect(find.byKey(const Key('planChangeSheet')), findsNothing);
    },
  );

  testWidgets(
    'applies a discount code (every renewal and fixed renewals) and sends it on confirm',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, code) async {
          if (code?.trim().toUpperCase() == 'FOUNDER25') {
            return samplePreview(
              immediateTotal: 70173,
              immediateTax: 5198,
              recurringPreTax: 67425,
              discountApplied: true,
              discountCode: 'FOUNDER25',
              discountPercent: 25,
              discountCycles: null,
            );
          }
          if (code?.trim().toUpperCase() == 'THREE30') {
            return samplePreview(
              immediateTotal: 65000,
              immediateTax: 4800,
              recurringPreTax: 62930,
              discountApplied: true,
              discountCode: 'THREE30',
              discountPercent: 30,
              discountCycles: 3,
            );
          }
          return samplePreview();
        };

      await openSheet(tester, backend);

      // Expand "Have a code?" and apply THREE30 (for 3 renewals).
      await tester.tap(find.byKey(const Key('planChangeHaveCode')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('planChangeCodeField')),
        'three30',
      );
      await tester.tap(find.byKey(const Key('planChangeApplyCode')));
      await tester.pumpAndSettle();

      expect(find.text('30% off, for 3 renewals'), findsOneWidget);
      expect(find.text('\$650.00'), findsOneWidget);

      // Remove and apply FOUNDER25 (every renewal).
      await tester.tap(find.byKey(const Key('planChangeRemoveCode')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('planChangeCodeField')),
        'founder25',
      );
      await tester.tap(find.byKey(const Key('planChangeApplyCode')));
      await tester.pumpAndSettle();

      expect(find.text('25% off, every renewal'), findsOneWidget);
      expect(find.text('\$701.73'), findsOneWidget);
      expect(find.text('Then \$674.25 / year (before tax)'), findsOneWidget);

      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();

      expect(backend.checkoutRequests, hasLength(1));
      expect(backend.checkoutRequests.single.discountCode, 'FOUNDER25');
      expect(backend.checkoutRequests.single.expectedTotal, 70173);
      expect(backend.checkoutRequests.single.expectedCurrency, 'USD');
    },
  );

  testWidgets('shows plain error under code field when code is refused', (
    tester,
  ) async {
    await setSize(tester, const Size(1000, 800));
    final backend = FakeBackend()
      ..billingEnabled = true
      ..planCode = 'max'
      ..billingSource = BillingSummarySource_Enum.dodo
      ..onPreviewPlanChange = (_, _, code) async {
        if (code != null) {
          final req = RequestOptions(path: '/v1/orgs/org-1/billing/preview');
          throw DioException(
            requestOptions: req,
            response: Response(
              requestOptions: req,
              statusCode: 400,
              data: {
                'code': 'invalid_discount_code',
                'detail': "That code can't be used on this plan.",
              },
            ),
            type: DioExceptionType.badResponse,
          );
        }
        return samplePreview();
      };

    await openSheet(tester, backend);

    await tester.tap(find.byKey(const Key('planChangeHaveCode')));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('planChangeCodeField')),
      'BADCODE',
    );
    await tester.tap(find.byKey(const Key('planChangeApplyCode')));
    await tester.pumpAndSettle();

    expect(find.text("That code can't be used on this plan."), findsOneWidget);
    // Original preview amounts stay intact and nothing was charged.
    expect(find.text('\$944.46'), findsOneWidget);
    expect(backend.checkouts, isEmpty);
  });

  testWidgets(
    'updates amounts and asks again when server answers 409 price_changed',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      final updated = samplePreview(immediateTotal: 96000, immediateTax: 7100);
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..priceChangedOnce = updated
        ..onPreviewPlanChange = (_, _, _) async => samplePreview();

      await openSheet(tester, backend);
      expect(find.text('\$944.46'), findsOneWidget);

      // First tap hits 409 price_changed: nothing charged, sheet stays open with new total.
      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();

      expect(backend.checkoutRequests, isEmpty);
      expect(find.byKey(const Key('planChangePriceChanged')), findsOneWidget);
      expect(find.text('\$960.00'), findsOneWidget);

      // Second tap confirms with the updated total and succeeds.
      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();

      expect(backend.checkoutRequests, hasLength(1));
      expect(backend.checkoutRequests.single.expectedTotal, 96000);
      expect(find.byKey(const Key('planChangeSheet')), findsNothing);
    },
  );

  testWidgets('hides the code field where giftCodesAllowed is false (iOS)', (
    tester,
  ) async {
    await setSize(tester, const Size(430, 800));
    final backend = FakeBackend()
      ..billingEnabled = true
      ..planCode = 'max'
      ..billingSource = BillingSummarySource_Enum.dodo
      ..onPreviewPlanChange = (_, _, _) async => samplePreview();

    await openSheet(tester, backend, platform: TargetPlatform.iOS);

    expect(find.byKey(const Key('planChangeSheet')), findsOneWidget);
    expect(find.byKey(const Key('planChangeHaveCode')), findsNothing);
    expect(find.byKey(const Key('planChangeCodeField')), findsNothing);
  });

  testWidgets(
    'asks for app lock before charging when device unlock is active',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      final unlockers = FakeUnlockers(
        deviceOn: true,
        deviceResult: UnlockResult.cancelled,
      );
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, _) async => samplePreview();

      await openSheet(tester, backend, unlockers: unlockers);

      // Cancelled unlock aborts without charging.
      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();
      expect(unlockers.reasons, hasLength(1));
      expect(backend.checkoutRequests, isEmpty);
      expect(find.byKey(const Key('planChangeSheet')), findsOneWidget);

      // Passing unlock completes the plan change.
      unlockers.deviceResult = UnlockResult.ok;
      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();
      expect(unlockers.reasons, hasLength(2));
      expect(backend.checkoutRequests, hasLength(1));
      expect(find.byKey(const Key('planChangeSheet')), findsNothing);
    },
  );

  testWidgets(
    'applies a typed but unapplied code before charging, then charges on the second tap',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, code) async => code == null
            ? samplePreview()
            : samplePreview(
                immediateTotal: 70173,
                discountApplied: true,
                discountCode: 'FOUNDER25',
                discountPercent: 25,
              );

      await openSheet(tester, backend);
      await tester.tap(find.byKey(const Key('planChangeHaveCode')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('planChangeCodeField')),
        'founder25',
      );
      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();

      // Not charged yet: the code's price is shown first.
      expect(backend.checkoutRequests, isEmpty);
      expect(find.text('\$701.73'), findsOneWidget);

      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();
      expect(backend.checkoutRequests, hasLength(1));
      expect(backend.checkoutRequests.single.discountCode, 'FOUNDER25');
      expect(backend.checkoutRequests.single.expectedTotal, 70173);
    },
  );

  test('currencyMinorDigits follows ISO 4217', () {
    expect(currencyMinorDigits('USD'), 2);
    expect(currencyMinorDigits('php'), 2);
    expect(currencyMinorDigits('JPY'), 0);
    expect(currencyMinorDigits('KRW'), 0);
    expect(currencyMinorDigits('KWD'), 3);
  });

  DioException problem(int status, String code) {
    final req = RequestOptions(path: '/v1/orgs/org-1/billing');
    return DioException(
      requestOptions: req,
      response: Response(
        requestOptions: req,
        statusCode: status,
        data: {'status': status, 'code': code},
      ),
    );
  }

  testWidgets(
    'a code refused at Confirm shows the field again with the error and the price without it',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, code) async => code == null
            ? samplePreview()
            : samplePreview(
                immediateTotal: 70173,
                discountApplied: true,
                discountCode: 'FOUNDER25',
                discountPercent: 25,
              );
      await openSheet(tester, backend);
      await tester.tap(find.byKey(const Key('planChangeHaveCode')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('planChangeCodeField')),
        'founder25',
      );
      await tester.tap(find.byKey(const Key('planChangeApplyCode')));
      await tester.pumpAndSettle();
      expect(find.text('\$701.73'), findsOneWidget);

      backend.checkoutProblemOnce = 'invalid_discount_code';
      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('planChangeSheet')), findsOneWidget);
      expect(find.byKey(const Key('planChangeCodeField')), findsOneWidget);
      expect(
        find.text("That code can't be used on this plan."),
        findsOneWidget,
      );
      expect(find.text('\$944.46'), findsOneWidget);
      expect(find.text('\$701.73'), findsNothing);
      expect(find.byKey(const Key('planChangeDiscountApplied')), findsNothing);

      // The refused code left the field: Confirm now goes on without it.
      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();
      expect(backend.checkoutRequests, hasLength(1));
      expect(backend.checkoutRequests.single.discountCode, isNull);
      expect(backend.checkoutRequests.single.expectedTotal, 94446);
    },
  );

  testWidgets(
    'a code that would replace a better kept discount is refused with its own message',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, code) async {
          if (code != null) throw problem(400, 'discount_costs_more');
          return samplePreview(
            discountApplied: true,
            discountPercent: 20,
            discountPreserved: true,
          );
        };
      await openSheet(tester, backend);
      await tester.tap(find.byKey(const Key('planChangeHaveCode')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('planChangeCodeField')),
        'worse10',
      );
      await tester.tap(find.byKey(const Key('planChangeApplyCode')));
      await tester.pumpAndSettle();
      expect(
        find.text(
          'This code would replace your current discount and cost more.',
        ),
        findsOneWidget,
      );
      expect(find.text('20% off, every renewal'), findsOneWidget);

      await tester.tap(find.byKey(const Key('planChangeConfirm')));
      await tester.pumpAndSettle();
      expect(backend.checkoutRequests.single.discountCode, isNull);
    },
  );

  testWidgets(
    'a code that ends on the next plan change never says "every renewal"',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, code) async {
          return samplePreview(
            immediateTotal: 70173,
            discountApplied: code != null,
            discountCode: code?.toUpperCase(),
            discountPercent: code != null ? 25 : null,
            discountPreserved: code != null ? false : null,
          );
        };
      await openSheet(tester, backend);
      await tester.tap(find.byKey(const Key('planChangeHaveCode')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('planChangeCodeField')),
        'once25',
      );
      await tester.tap(find.byKey(const Key('planChangeApplyCode')));
      await tester.pumpAndSettle();
      expect(
        find.text('25% off each renewal; ends if you change plans again'),
        findsOneWidget,
      );
      expect(find.textContaining('every renewal'), findsNothing);
    },
  );

  testWidgets('shows yen without decimals', (tester) async {
    await setSize(tester, const Size(1000, 800));
    final backend = FakeBackend()
      ..billingEnabled = true
      ..planCode = 'max'
      ..billingSource = BillingSummarySource_Enum.dodo
      ..onPreviewPlanChange = (_, _, _) async => samplePreview(
        immediateTotal: 12000,
        immediateTax: 0,
        credit: 0,
        recurringPreTax: 12000,
        currency: 'JPY',
      );
    await openSheet(tester, backend);
    expect(find.textContaining('12,000'), findsWidgets);
    expect(find.textContaining('120'), findsNothing);
  });

  testWidgets(
    'a new subscriber goes to checkout with new_subscription_only, and a subscription that became active meanwhile is previewed instead',
    (tester) async {
      await setSize(tester, const Size(1000, 800));
      // New subscriber: the server says use_checkout, the sheet opens Dodo's page.
      final fresh = FakeBackend()..billingEnabled = true;
      final outcome = openSheet(tester, fresh);
      await outcome;
      expect(fresh.checkoutRequests.single.newSubscriptionOnly, isTrue);
      expect(find.byKey(const Key('planChangeSheet')), findsNothing);

      // Race: the first preview saw no subscription, but one is active by checkout time.
      var previews = 0;
      final raced = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, _) async {
          if (previews++ == 0) throw problem(409, 'use_checkout');
          return samplePreview();
        };
      await openSheet(tester, raced);
      expect(raced.checkoutRequests, isEmpty);
      expect(find.byKey(const Key('planChangeSheet')), findsOneWidget);
      expect(find.text('\$944.46'), findsOneWidget);
      expect(previews, 2);
    },
  );

  testWidgets('says when a code replaces the discount kept today', (
    tester,
  ) async {
    await setSize(tester, const Size(1000, 800));
    final backend = FakeBackend()
      ..billingEnabled = true
      ..planCode = 'max'
      ..billingSource = BillingSummarySource_Enum.dodo
      ..onPreviewPlanChange = (_, _, code) async => code == null
          ? samplePreview(discountApplied: true, discountPercent: 20)
          : samplePreview(
              immediateTotal: 65000,
              discountApplied: true,
              discountCode: 'ALWAYS30',
              discountPercent: 30,
              replacesDiscount: true,
              replacedDiscountPercent: 20,
            );
    await openSheet(tester, backend);
    expect(find.byKey(const Key('planChangeReplacesLine')), findsNothing);
    await tester.tap(find.byKey(const Key('planChangeHaveCode')));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('planChangeCodeField')),
      'always30',
    );
    await tester.tap(find.byKey(const Key('planChangeApplyCode')));
    await tester.pumpAndSettle();
    expect(find.text('Replaces your current 20% discount'), findsOneWidget);
  });

  for (final (code, message) in [
    (
      'discount_ends_lasting',
      'This code would end your current lasting discount.',
    ),
    ('discount_not_better', 'You already have an equal or better discount.'),
  ]) {
    testWidgets('shows "$message" for $code', (tester) async {
      await setSize(tester, const Size(1000, 800));
      final backend = FakeBackend()
        ..billingEnabled = true
        ..planCode = 'max'
        ..billingSource = BillingSummarySource_Enum.dodo
        ..onPreviewPlanChange = (_, _, c) async {
          if (c != null) throw problem(400, code);
          return samplePreview(discountApplied: true, discountPercent: 20);
        };
      await openSheet(tester, backend);
      await tester.tap(find.byKey(const Key('planChangeHaveCode')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('planChangeCodeField')),
        'x10',
      );
      await tester.tap(find.byKey(const Key('planChangeApplyCode')));
      await tester.pumpAndSettle();
      expect(find.text(message), findsOneWidget);
    });
  }
}
