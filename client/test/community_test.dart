import 'package:casama/core/providers.dart';
import 'package:casama/core/review_prompt.dart';
import 'package:casama/features/community/community.dart';
import 'package:casama/features/testimonials/testimonials.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_backend.dart';

/// Casama's open-source community in the app (D-577, docs/GITHUB-STARS-PLAN.md §5.3): the Cloud
/// ask's timing, its once-ever rule, and its seven days from the other asks, both ways.

const _sentence =
    "Casama is open source. If it's useful to you, a star on GitHub helps other people find it.";

List<String> _days(int n) => [
  for (var i = 0; i < n; i++)
    DateTime(
      2026,
      10,
      1,
    ).add(Duration(days: i)).toIso8601String().substring(0, 10),
];

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    // An error snackbar in an earlier test of the same shard sets this for the whole program.
    ReviewPrompt.errorThisSession = false;
  });

  group('the Cloud ask: when it may show', () {
    final now = DateTime(2026, 12, 1, 12);
    late ProviderContainer container;
    late StarAskPrompt prompt;
    setUp(() {
      container = ProviderContainer();
      prompt = container.read(
        Provider((ref) => StarAskPrompt(ref, now: () => now)),
      );
    });
    tearDown(() => container.dispose());

    test(
      'developers at 7 days of use and 20 replies, everyone else at 14 and 40',
      () async {
        SharedPreferences.setMockInitialValues({
          'casama.review.days': _days(7),
          StarAskPrompt.repliesKey: 19,
        });
        expect(
          await prompt.due(developer: true),
          isFalse,
          reason: '19 replies',
        );
        expect(await prompt.due(developer: true, replies: 20), isTrue);
        expect(await prompt.due(developer: false, replies: 20), isFalse);

        SharedPreferences.setMockInitialValues({
          'casama.review.days': _days(6),
        });
        expect(
          await prompt.due(developer: true, replies: 99),
          isFalse,
          reason: '6 days of use',
        );

        SharedPreferences.setMockInitialValues({
          'casama.review.days': _days(13),
        });
        expect(await prompt.due(developer: false, replies: 99), isFalse);
        SharedPreferences.setMockInitialValues({
          'casama.review.days': _days(14),
        });
        expect(await prompt.due(developer: false, replies: 39), isFalse);
        expect(await prompt.due(developer: false, replies: 40), isTrue);
      },
    );

    test(
      'never within 7 days of the store sheet or the testimonial ask',
      () async {
        for (final key in ['casama.review.asked', 'casama.testimonial.asked']) {
          SharedPreferences.setMockInitialValues({
            'casama.review.days': _days(20),
            key: now.subtract(const Duration(days: 6)).toIso8601String(),
          });
          expect(
            await prompt.due(developer: true, replies: 50),
            isFalse,
            reason: key,
          );
          SharedPreferences.setMockInitialValues({
            'casama.review.days': _days(20),
            key: now.subtract(const Duration(days: 8)).toIso8601String(),
          });
          expect(
            await prompt.due(developer: true, replies: 50),
            isTrue,
            reason: key,
          );
        }
      },
    );

    test('once per device, ever', () async {
      SharedPreferences.setMockInitialValues({
        'casama.review.days': _days(30),
        StarAskPrompt.askedKey: DateTime(2025, 1, 1).toIso8601String(),
      });
      expect(await prompt.due(developer: true, replies: 500), isFalse);
    });

    test('the testimonial ask keeps 7 days from the star ask', () async {
      final t = container.read(
        Provider((ref) => TestimonialAskPrompt(ref, now: () => now)),
      );
      SharedPreferences.setMockInitialValues({
        'casama.review.days': _days(10),
        'casama.testimonial.replies': 50,
        StarAskPrompt.askedKey: now
            .subtract(const Duration(days: 3))
            .toIso8601String(),
      });
      expect(await t.due(), isFalse);
      SharedPreferences.setMockInitialValues({
        'casama.review.days': _days(10),
        'casama.testimonial.replies': 50,
        StarAskPrompt.askedKey: now
            .subtract(const Duration(days: 8))
            .toIso8601String(),
      });
      expect(await t.due(), isTrue);
    });
  });

  group('the Cloud ask: after a finished reply', () {
    final navigator = GlobalKey<NavigatorState>();
    Future<void> pumpHost(WidgetTester tester) => tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigator,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SizedBox(),
      ),
    );

    ({
      ProviderContainer container,
      StarAskPrompt prompt,
      List<Uri> opened,
      List<int> shown,
    })
    setup(FakeBackend backend, {bool? cloud = true, bool? answer}) {
      final opened = <Uri>[];
      final shown = <int>[];
      final container = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(backend),
          casamaCloudProvider.overrideWithValue(cloud),
          communityOpenProvider.overrideWithValue((uri) async {
            opened.add(uri);
            return true;
          }),
        ],
      );
      addTearDown(container.dispose);
      final prompt = container.read(
        Provider(
          (ref) => StarAskPrompt(
            ref,
            delay: Duration.zero,
            context: () => navigator.currentContext,
            show: (_) async {
              shown.add(1);
              return answer;
            },
          ),
        ),
      );
      return (
        container: container,
        prompt: prompt,
        opened: opened,
        shown: shown,
      );
    }

    testWidgets(
      'a developer sees it at the 20th reply; Star on GitHub opens the repo',
      (tester) async {
        await pumpHost(tester);
        SharedPreferences.setMockInitialValues({
          'casama.review.days': _days(7),
          StarAskPrompt.repliesKey: 18,
        });
        final backend = FakeBackend()
          ..starAskState = StarAsk(ask: true, developer: true);
        final s = setup(backend, answer: true);
        await tester.runAsync(() async {
          expect(await s.prompt.moment(), isFalse, reason: 'reply 19');
          expect(
            backend.starAskCalls,
            0,
            reason: 'too early to ask the server',
          );
          expect(await s.prompt.moment(), isTrue, reason: 'reply 20');
          expect(s.shown, hasLength(1));
          expect(s.opened.single.toString(), 'https://casama.ai/github');
          // Once per device, ever.
          expect(await s.prompt.moment(), isFalse);
        });
        expect(s.shown, hasLength(1));
      },
    );

    testWidgets(
      'without a developer signal it waits for 14 days and 40 replies',
      (tester) async {
        await pumpHost(tester);
        SharedPreferences.setMockInitialValues({
          'casama.review.days': _days(14),
          StarAskPrompt.repliesKey: 25,
        });
        final backend = FakeBackend()
          ..starAskState = StarAsk(ask: true, developer: false);
        final s = setup(backend, answer: false);
        await tester.runAsync(() async {
          expect(await s.prompt.moment(), isFalse);
          final p = await SharedPreferences.getInstance();
          await p.setInt(StarAskPrompt.repliesKey, 39);
          expect(await s.prompt.moment(), isTrue, reason: 'reply 40');
          // Not now is final.
          expect(p.getString(StarAskPrompt.askedKey), isNotNull);
          expect(await s.prompt.moment(), isFalse);
        });
        expect(s.shown, hasLength(1));
        expect(s.opened, isEmpty);
      },
    );

    testWidgets('never off Casama Cloud, or when the server says no', (
      tester,
    ) async {
      await pumpHost(tester);
      for (final cloud in [false, null]) {
        SharedPreferences.setMockInitialValues({
          'casama.review.days': _days(30),
          StarAskPrompt.repliesKey: 99,
        });
        final backend = FakeBackend()
          ..starAskState = StarAsk(ask: true, developer: true);
        final s = setup(backend, cloud: cloud, answer: true);
        await tester.runAsync(() async {
          expect(await s.prompt.moment(), isFalse, reason: '$cloud');
        });
        expect(backend.starAskCalls, 0);
        expect(s.shown, isEmpty);
      }
      SharedPreferences.setMockInitialValues({
        'casama.review.days': _days(30),
        StarAskPrompt.repliesKey: 99,
      });
      final backend = FakeBackend()
        ..starAskState = StarAsk(ask: false, developer: true);
      final s = setup(backend, answer: true);
      await tester.runAsync(() async {
        expect(await s.prompt.moment(), isFalse);
      });
      expect(s.shown, isEmpty);
    });

    testWidgets('another ask on the same reply: it only counts the reply', (
      tester,
    ) async {
      await pumpHost(tester);
      SharedPreferences.setMockInitialValues({
        'casama.review.days': _days(30),
        StarAskPrompt.repliesKey: 50,
      });
      final backend = FakeBackend()
        ..starAskState = StarAsk(ask: true, developer: true);
      final s = setup(backend, answer: true);
      await tester.runAsync(() async {
        expect(await s.prompt.moment(anotherShown: true), isFalse);
        final p = await SharedPreferences.getInstance();
        expect(p.getInt(StarAskPrompt.repliesKey), 51);
      });
      expect(backend.starAskCalls, 0);
      expect(s.shown, isEmpty);
    });

    testWidgets('the sheet: the sentence, Star on GitHub and Not now', (
      tester,
    ) async {
      bool? result = true;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => TextButton(
              onPressed: () async => result = await showStarAskSheet(context),
              child: const Text('open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('Casama on GitHub'), findsOneWidget);
      expect(find.text(_sentence), findsOneWidget);
      await tester.tap(find.text('Not now'));
      await tester.pumpAndSettle();
      expect(result, isFalse);

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('starAskStar')));
      await tester.pumpAndSettle();
      expect(result, isTrue);
    });
  });
}
