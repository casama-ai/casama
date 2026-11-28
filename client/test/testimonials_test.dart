import 'dart:convert';

import 'package:casama/core/providers.dart';
import 'package:casama/core/remote_config.dart';
import 'package:casama/features/admin/testimonials_tab.dart';
import 'package:casama/features/testimonials/testimonials.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:casama/features/auth/sign_in_screen.dart';

import 'app_test.dart' show harness, setSize;
import 'billing_test.dart' show pumpPaywall;
import 'fake_backend.dart';

/// Testimonials in the app (D-545): one quote at a time on the paywall and the sign-in screen,
/// cached for a day and hidden when there are too few or the server can't be reached; the app's
/// own ask; and Admin → Testimonials.
PublicTestimonial _q(
  String quote,
  String name, {
  int? rating,
  String? role,
  String? incentive,
}) => PublicTestimonial(
  quote: quote,
  nameShown: name,
  roleShown: role,
  rating: rating,
  source_: TestimonialSource.email,
  sourceUrl: null,
  incentiveNote: incentive,
);

Widget _quote(
  FakeBackend backend, {
  TestimonialPlace place = TestimonialPlace.appPaywall,
}) => harness(
  backend,
  Scaffold(
    body: Center(
      child: TestimonialQuote(
        place: place,
        interval: const Duration(seconds: 2),
      ),
    ),
  ),
);

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('quotes on the paywall and sign-in screen', () {
    testWidgets('one quote shows; empty list shows nothing', (tester) async {
      final backend = FakeBackend()
        ..testimonialsState = [_q('It does my errands.', 'Matt W.')];
      await tester.pumpWidget(_quote(backend));
      await tester.pumpAndSettle();
      expect(find.textContaining('errands'), findsOneWidget);
      expect(backend.testimonialPlacesAsked, [TestimonialPlace.appPaywall]);

      SharedPreferences.setMockInitialValues({});
      final empty = FakeBackend()..testimonialsState = [];
      await tester.pumpWidget(KeyedSubtree(key: const ValueKey('empty'), child: _quote(empty)));
      await tester.pumpAndSettle();
      expect(find.byType(Text), findsNothing);
    });

    testWidgets(
      'two or more show one at a time, with name, role, stars and label',
      (tester) async {
        final backend = FakeBackend()
          ..testimonialsState = [
            _q(
              'It does my errands.',
              'Matt W.',
              rating: 5,
              role: 'Max plan, UK',
            ),
            _q(
              'My bot books my flights.',
              'Ana R.',
              incentive: 'Received a discount',
            ),
          ];
        await tester.pumpWidget(_quote(backend));
        await tester.pumpAndSettle();
        expect(find.text('“It does my errands.”'), findsOneWidget);
        expect(find.text('Matt W., Max plan, UK'), findsOneWidget);
        expect(find.text('“My bot books my flights.”'), findsNothing);
        expect(find.byIcon(LucideIcons.star), findsNWidgets(5));
        await tester.pump(const Duration(seconds: 2));
        await tester.pumpAndSettle();
        expect(find.text('“My bot books my flights.”'), findsOneWidget);
        expect(find.text('Received a discount'), findsOneWidget);
        expect(find.text('“It does my errands.”'), findsNothing);
        await tester.pumpWidget(const SizedBox());
      },
    );

    testWidgets('offline with nothing kept: nothing shows', (tester) async {
      final backend = FakeBackend()..testimonialsFail = true;
      await tester.pumpWidget(
        _quote(backend, place: TestimonialPlace.appSignin),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('a list fetched today is kept and not asked for again', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        testimonialsCacheKey(
          'http://localhost:8787',
          TestimonialPlace.appPaywall,
        ): jsonEncode({
          'at': DateTime.now()
              .subtract(const Duration(hours: 3))
              .toIso8601String(),
          'items': [
            _q('Kept one.', 'Kim L.').toJson(),
            _q('Kept two.', 'Lee P.').toJson(),
          ],
        }),
      });
      final backend = FakeBackend()..testimonialsFail = true;
      await tester.pumpWidget(_quote(backend));
      await tester.pumpAndSettle();
      expect(find.text('“Kept one.”'), findsOneWidget);
      expect(backend.testimonialPlacesAsked, isEmpty);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('a list older than a day is fetched again, and saved', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        testimonialsCacheKey(
          'http://localhost:8787',
          TestimonialPlace.appPaywall,
        ): jsonEncode({
          'at': DateTime.now()
              .subtract(const Duration(days: 2))
              .toIso8601String(),
          'items': [
            _q('Old one.', 'Kim L.').toJson(),
            _q('Old two.', 'Lee P.').toJson(),
          ],
        }),
      });
      final backend = FakeBackend()..testimonialsState = [];
      await tester.pumpWidget(_quote(backend));
      await tester.pumpAndSettle();
      expect(find.textContaining('Old'), findsNothing);
      expect(backend.testimonialPlacesAsked, [TestimonialPlace.appPaywall]);
      final saved = jsonDecode(
        (await SharedPreferences.getInstance()).getString(
          testimonialsCacheKey(
            'http://localhost:8787',
            TestimonialPlace.appPaywall,
          ),
        )!,
      );
      expect(saved['items'], isEmpty);
    });
  });

  group('where they show', () {
    final two = [
      _q('It does my errands.', 'Matt W.'),
      _q('My bot books my flights.', 'Ana R.'),
    ];

    testWidgets('the paywall shows a quote under the plans', (tester) async {
      await setSize(tester, const Size(430, 1600));
      final backend = FakeBackend()
        ..billingEnabled = true
        ..testimonialsState = two;
      await pumpPaywall(tester, backend);
      expect(find.byKey(const Key('paywallTier-pro')), findsOneWidget);
      expect(find.text('“It does my errands.”'), findsOneWidget);
      expect(
        backend.testimonialPlacesAsked,
        contains(TestimonialPlace.appPaywall),
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('the paywall shows none while the server has none', (
      tester,
    ) async {
      await setSize(tester, const Size(430, 1600));
      final backend = FakeBackend()..billingEnabled = true;
      await pumpPaywall(tester, backend);
      expect(find.byKey(const Key('paywallTier-pro')), findsOneWidget);
      expect(find.byType(TestimonialQuote), findsOneWidget);
      expect(find.textContaining('“'), findsNothing);
    });

    testWidgets(
      'the sign-in screen shows no quotes (Oliver, 2026-11-28), and fits a small phone',
      (tester) async {
        await setSize(tester, const Size(320, 640));
        final backend = FakeBackend()
          ..signedIn = false
          ..testimonialsState = two;
        await tester.pumpWidget(harness(backend, const SignInScreen()));
        for (var i = 0; i < 5; i++) {
          await tester.pump(const Duration(milliseconds: 200));
        }
        expect(find.byType(TestimonialQuote), findsNothing);
        expect(find.text('“It does my errands.”'), findsNothing);
        expect(find.byKey(const Key('openSignIn')), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  });

  group('the app\'s own ask', () {
    testWidgets('sends only with words, and consent only when ticked', (
      tester,
    ) async {
      final backend = FakeBackend();
      await tester.pumpWidget(
        harness(
          backend,
          const Scaffold(body: TestimonialAskSheet(name: 'Ana R.')),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text('You can quote this on casama.ai and in the app as Ana R.'),
        findsOneWidget,
      );
      final consent = tester.widget<CheckboxListTile>(
        find.byKey(const Key('testimonialAskConsent')),
      );
      expect(consent.value, isFalse, reason: 'consent starts unticked');
      await tester.tap(find.byKey(const Key('testimonialAskSend')));
      await tester.pumpAndSettle();
      expect(backend.submittedTestimonials, isEmpty);

      await tester.enterText(
        find.byKey(const Key('testimonialAskText')),
        'It does my errands.',
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('testimonialAskSend')));
      await tester.pumpAndSettle();
      expect(backend.submittedTestimonials.single, (
        quote: 'It does my errands.',
        consent: false,
      ));
    });

    testWidgets('a ticked box sends consent', (tester) async {
      final backend = FakeBackend();
      await tester.pumpWidget(
        harness(backend, const Scaffold(body: TestimonialAskSheet())),
      );
      await tester.pumpAndSettle();
      expect(
        find.text(
          'You can quote this on casama.ai and in the app as a Casama user',
        ),
        findsOneWidget,
      );
      await tester.enterText(
        find.byKey(const Key('testimonialAskText')),
        'Love it',
      );
      await tester.tap(find.byKey(const Key('testimonialAskConsent')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('testimonialAskSend')));
      await tester.pumpAndSettle();
      expect(backend.submittedTestimonials.single.consent, isTrue);
    });

    test('asks only after enough replies and days, never soon after the store sheet or itself', () async {
      final now = DateTime(2026, 12, 1, 12);
      final days = [for (var i = 0; i < 5; i++) '2026-11-2${i + 1}'];
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final prompt = container.read(
        Provider((ref) => TestimonialAskPrompt(ref, now: () => now)),
      );

      SharedPreferences.setMockInitialValues({'casama.review.days': days});
      for (var i = 1; i < TestimonialAskPrompt.minReplies; i++) {
        expect(await prompt.due(), isFalse, reason: 'reply $i');
      }
      expect(await prompt.due(), isTrue);

      SharedPreferences.setMockInitialValues({
        'casama.review.days': days.take(4).toList(),
        'casama.testimonial.replies': 50,
      });
      expect(await prompt.due(), isFalse, reason: 'too few days of use');

      SharedPreferences.setMockInitialValues({
        'casama.review.days': days,
        'casama.testimonial.replies': 50,
        'casama.review.asked': now
            .subtract(const Duration(hours: 20))
            .toIso8601String(),
      });
      expect(
        await prompt.due(),
        isFalse,
        reason: 'the store sheet showed yesterday',
      );

      SharedPreferences.setMockInitialValues({
        'casama.review.days': days,
        'casama.testimonial.replies': 50,
        'casama.testimonial.asked': now
            .subtract(const Duration(days: 60))
            .toIso8601String(),
      });
      expect(await prompt.due(), isFalse, reason: 'asked 60 days ago');
    });

    test(
      'stays quiet while the flag is off, without asking the server',
      () async {
        SharedPreferences.setMockInitialValues({
          'casama.review.days': [for (var i = 0; i < 9; i++) '2026-11-1$i'],
          'casama.testimonial.replies': 99,
        });
        final backend = FakeBackend();
        final container = ProviderContainer(
          overrides: [backendProvider.overrideWithValue(backend)],
        );
        addTearDown(container.dispose);
        expect(
          container.read(remoteConfigProvider).value?.flags['testimonial_ask'],
          isNot(true),
        );
        expect(await container.read(testimonialAskProvider).moment(), isFalse);
      },
    );
  });

  group('Admin → Testimonials', () {
    testWidgets(
      'lists quotes with their state, flags missing consent and placeholders, and adds one',
      (tester) async {
        await setSize(tester, const Size(1300, 900));
        final backend = FakeBackend()
          ..adminTestimonialsState = [
            FakeBackend.fakeTestimonial(
              id: 'matt',
              quote: "[PLACEHOLDER] Paste Matt's own words from his Toolradar review once it's published.",
              roleShown: 'Max plan, UK',
            ),
            FakeBackend.fakeTestimonial(
              id: 'ana',
              quote: 'Nice app',
              name: 'Ana R.',
              consent: null,
            ),
          ];
        await tester.pumpWidget(
          harness(backend, const Scaffold(body: TestimonialsTab())),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(find.byKey(const Key('adminTestimonial-matt')), findsOneWidget);
        expect(find.text('Placeholder'), findsOneWidget);
        expect(find.text('No consent yet'), findsOneWidget);

        await tester.tap(find.byKey(const Key('adminTestimonialAdd')));
        await tester.pumpAndSettle();
        await tester.enterText(
          find.byKey(const Key('adminTestimonialQuote')),
          'It does my errands.',
        );
        await tester.enterText(
          find.byKey(const Key('adminTestimonialName')),
          'Sam P.',
        );
        await tester.enterText(
          find.byKey(const Key('adminTestimonialConsent')),
          'Yes, quote me.',
        );
        await tester.ensureVisible(
          find.byKey(const Key('adminTestimonialPlace-app_paywall')),
        );
        await tester.tap(
          find.byKey(const Key('adminTestimonialPlace-app_paywall')),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('adminTestimonialSave')));
        await tester.pumpAndSettle();
        expect(backend.adminTestimonialsState.last.nameShown, 'Sam P.');
        expect(backend.adminTestimonialsState.last.places, [
          TestimonialPlace.appPaywall,
        ]);
        expect(find.byKey(const Key('adminTestimonial-t3')), findsOneWidget);
      },
    );

    testWidgets('moves a live quote down', (tester) async {
      await setSize(tester, const Size(1300, 900));
      final backend = FakeBackend()
        ..adminTestimonialsState = [
          FakeBackend.fakeTestimonial(
            id: 'a',
            quote: 'First',
            state: TestimonialState.live,
            sort: 0,
          ),
          FakeBackend.fakeTestimonial(
            id: 'b',
            quote: 'Second',
            state: TestimonialState.live,
            sort: 1,
          ),
        ];
      await tester.pumpWidget(
        harness(backend, const Scaffold(body: TestimonialsTab())),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('adminTestimonialDown-a')));
      await tester.pumpAndSettle();
      final live = [...backend.adminTestimonialsState]
        ..sort((x, y) => x.sort.compareTo(y.sort));
      expect(live.map((t) => t.id), ['b', 'a']);
    });
  });
}
