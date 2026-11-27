import 'package:casama/app.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/review_prompt.dart';
import 'package:casama/core/router.dart';
import 'package:casama/features/community/community.dart';
import 'package:casama/features/referrals/invite_ask.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';
import 'package:casama/l10n/delegates.dart';

/// Invites that spread (D-588, docs/INVITE-GROWTH-PLAN.md §4.5): the share text, "Who's it for?",
/// the one-time ask after a reply, and the Chats button.

Referral _referral({
  ReferralInvites? invites,
  num reward = 2,
  num welcome = 2,
}) => Referral(
  enabled: true,
  code: 'K7M2QX',
  link: 'https://casama.ai/invite/K7M2QX',
  rewardUsd: reward,
  welcomeUsd: welcome,
  rewardCap: 20,
  invited: 0,
  rewarded: 0,
  pending: 0,
  earnedUsd: 0,
  invitedBy: null,
  redeemUntil: null,
  invites: invites,
);

ReferralInvites _invites({int total = 3, int used = 0, bool unlocked = true}) =>
    ReferralInvites(
      total: total,
      used: used,
      left: (total - used).clamp(0, total),
      unlocked: unlocked,
    );

Future<BuildContext> _context(WidgetTester tester) async {
  late BuildContext captured;
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: testLocalizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) {
          captured = context;
          return const SizedBox();
        },
      ),
    ),
  );
  return captured;
}

Future<void> _settle(WidgetTester tester) async {
  for (var i = 0; i < 10; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    ReviewPrompt.errorThisSession = false;
  });

  group('the words', () {
    test('only real first names go on the link, as the website reads them', () {
      for (final ok in [
        'Maya',
        'Anne-Marie',
        'José',
        "D'Angelo",
        'Mary Jane',
      ]) {
        expect(invitedName(ok), ok, reason: ok);
      }
      expect(invitedName('  Li  '), 'Li');
      for (final bad in ['', ' ', '1Maya', '<b>', 'a' * 31, 'Maya!', '-Maya']) {
        expect(invitedName(bad), isNull, reason: bad);
      }
      expect(
        invitedLink('https://casama.ai/invite/K7M2QX', 'José'),
        'https://casama.ai/invite/K7M2QX?to=Jos%C3%A9',
      );
      expect(
        invitedLink('https://casama.ai/invite/K7M2QX', '<b>'),
        'https://casama.ai/invite/K7M2QX',
      );
    });

    test('invites to give: only unlocked ones, with some left, while the gate is on', () {
      expect(invitesToGive(null), isNull);
      expect(
        invitesToGive(_referral()),
        isNull,
        reason: 'gate open: no invites',
      );
      expect(
        invitesToGive(_referral(invites: _invites(unlocked: false))),
        isNull,
      );
      expect(invitesToGive(_referral(invites: _invites(used: 3))), isNull);
      expect(invitesToGive(_referral(invites: _invites(used: 1)))?.left, 2);
    });

    testWidgets(
      'scarce invites: "I saved you one of my 3", with the bonus and a name',
      (tester) async {
        final context = await _context(tester);
        expect(
          inviteShareText(context, _referral(invites: _invites())),
          'I saved you one of my 3 Casama invites. Casama is invite-only for now. This gets you in '
          'right away, and you get \$2 of free usage after your first chat: '
          'https://casama.ai/invite/K7M2QX',
        );
        expect(
          inviteShareText(
            context,
            _referral(invites: _invites(total: 1), welcome: 0),
            name: 'Maya',
          ),
          'Maya, I saved you my Casama invite. Casama is invite-only for now, and this gets you in '
          'right away: https://casama.ai/invite/K7M2QX?to=Maya',
        );
        // Sign-up open: D-211's text, as before.
        expect(
          inviteShareText(context, _referral(welcome: 0)),
          'Join me on Casama, where AI teammates get things done for you: '
          'https://casama.ai/invite/K7M2QX (invite code K7M2QX)',
        );
      },
    );
  });

  group('the one-time ask: when it may show', () {
    final now = DateTime(2026, 12, 1, 12);
    late ProviderContainer container;
    late InviteAskPrompt prompt;
    setUp(() {
      container = ProviderContainer();
      prompt = container.read(
        Provider((ref) => InviteAskPrompt(ref, now: () => now)),
      );
    });
    tearDown(() => container.dispose());

    test('from the 3rd finished reply, once per device, ever', () async {
      expect(await prompt.due(replies: 2), isFalse);
      expect(await prompt.due(replies: 3), isTrue);
      SharedPreferences.setMockInitialValues({
        InviteAskPrompt.askedKey: now.toIso8601String(),
      });
      expect(await prompt.due(replies: 99), isFalse);
    });

    test(
      'seven days from the store sheet, the testimonial ask and the star ask',
      () async {
        for (final key in [
          'casama.review.asked',
          'casama.testimonial.asked',
          'casama.starAsk.asked',
        ]) {
          SharedPreferences.setMockInitialValues({
            key: now.subtract(const Duration(days: 6)).toIso8601String(),
          });
          expect(await prompt.due(replies: 9), isFalse, reason: key);
          SharedPreferences.setMockInitialValues({
            key: now.subtract(const Duration(days: 8)).toIso8601String(),
          });
          expect(await prompt.due(replies: 9), isTrue, reason: key);
        }
      },
    );

    test('the star ask waits seven days after it, too', () async {
      final star = container.read(
        Provider((ref) => StarAskPrompt(ref, now: () => now)),
      );
      SharedPreferences.setMockInitialValues({
        'casama.review.days': List.generate(
          30,
          (i) => '2026-10-${(i + 1).toString().padLeft(2, '0')}',
        ),
        InviteAskPrompt.askedKey: now
            .subtract(const Duration(days: 2))
            .toIso8601String(),
      });
      expect(await star.due(developer: true, replies: 99), isFalse);
    });
  });

  group('the one-time ask: after a finished reply', () {
    final navigator = GlobalKey<NavigatorState>();
    Future<void> pumpHost(WidgetTester tester) => tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigator,
        localizationsDelegates: testLocalizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SizedBox(),
      ),
    );

    ({InviteAskPrompt prompt, List<Referral> shown}) setup(
      FakeBackend backend, {
      bool? cloud = true,
    }) {
      final shown = <Referral>[];
      final container = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(backend),
          casamaCloudProvider.overrideWithValue(cloud),
        ],
      );
      addTearDown(container.dispose);
      final prompt = container.read(
        Provider(
          (ref) => InviteAskPrompt(
            ref,
            delay: Duration.zero,
            context: () => navigator.currentContext,
            show: (_, r) async {
              shown.add(r);
              return false;
            },
          ),
        ),
      );
      return (prompt: prompt, shown: shown);
    }

    testWidgets(
      'shows at the 3rd reply when the server has invites, then never again',
      (tester) async {
        await pumpHost(tester);
        final backend = FakeBackend()
          ..referralState = _referral(invites: _invites());
        final s = setup(backend);
        await tester.runAsync(() async {
          expect(await s.prompt.moment(), isFalse, reason: 'reply 1');
          expect(await s.prompt.moment(), isFalse, reason: 'reply 2');
          expect(
            backend.referralCalls,
            0,
            reason: 'too early to ask the server',
          );
          expect(await s.prompt.moment(), isTrue, reason: 'reply 3');
          expect(await s.prompt.moment(), isFalse, reason: 'Not Now is final');
        });
        expect(s.shown, hasLength(1));
        expect(s.shown.single.invites?.left, 3);
      },
    );

    testWidgets(
      'never off Casama Cloud, with none to give, or on a reply another ask took',
      (tester) async {
        await pumpHost(tester);
        for (final cloud in [false, null]) {
          SharedPreferences.setMockInitialValues({
            InviteAskPrompt.repliesKey: 9,
          });
          final backend = FakeBackend()
            ..referralState = _referral(invites: _invites());
          final s = setup(backend, cloud: cloud);
          await tester.runAsync(() async {
            expect(await s.prompt.moment(), isFalse, reason: '$cloud');
          });
          expect(s.shown, isEmpty);
        }
        for (final r in [
          _referral(),
          _referral(invites: _invites(unlocked: false)),
          _referral(invites: _invites(used: 3)),
        ]) {
          SharedPreferences.setMockInitialValues({
            InviteAskPrompt.repliesKey: 9,
          });
          final s = setup(FakeBackend()..referralState = r);
          await tester.runAsync(() async {
            expect(await s.prompt.moment(), isFalse);
          });
          expect(s.shown, isEmpty);
          final p = await SharedPreferences.getInstance();
          expect(
            p.getString(InviteAskPrompt.askedKey),
            isNull,
            reason: 'it can still come later',
          );
        }
        SharedPreferences.setMockInitialValues({InviteAskPrompt.repliesKey: 9});
        final s = setup(
          FakeBackend()..referralState = _referral(invites: _invites()),
        );
        await tester.runAsync(() async {
          expect(await s.prompt.moment(anotherShown: true), isFalse);
        });
        expect(s.shown, isEmpty);
      },
    );

    testWidgets(
      'the sheet: how many are left, the credit, Send an Invite and Not Now',
      (tester) async {
        final context = await _context(tester);
        bool? result = true;
        final open = showInviteAskSheet(
          context,
          _referral(invites: _invites(used: 1)),
        );
        open.then((v) => result = v);
        await tester.pumpAndSettle();
        expect(find.text('Who Else Would Use This?'), findsOneWidget);
        expect(
          find.text(
            'You have 2 invites to Casama. Each one lets a friend in right away. '
            'You each get \$2 of free usage after their first chat.',
          ),
          findsOneWidget,
        );
        await tester.tap(find.text('Not Now'));
        await tester.pumpAndSettle();
        expect(result, isFalse);

        showInviteAskSheet(
          context,
          _referral(invites: _invites()),
        ).then((v) => result = v);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('inviteAskSend')));
        await tester.pumpAndSettle();
        expect(result, isTrue);
      },
    );
  });

  testWidgets("Who's it for? gives back the name, or nothing when closed", (
    tester,
  ) async {
    final context = await _context(tester);
    String? name = 'unset';
    showModalBottomSheet<String>(
      context: context,
      builder: (_) => const InviteNameSheet(),
    ).then((v) => name = v);
    await tester.pumpAndSettle();
    expect(find.text("Who's It For?"), findsOneWidget);
    await tester.enterText(find.byKey(const Key('inviteNameField')), ' Maya ');
    await tester.tap(find.byKey(const Key('inviteNameShare')));
    await tester.pumpAndSettle();
    expect(name, 'Maya');
  });

  group('in the app', () {
    Future<ProviderContainer> app(
      WidgetTester tester,
      FakeBackend backend,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [backendProvider.overrideWithValue(backend)],
          child: const CasamaApp(),
        ),
      );
      await _settle(tester);
      return ProviderScope.containerOf(tester.element(find.byType(CasamaApp)));
    }

    testWidgets(
      'the Chats screen has a ticket while there are invites to give',
      (tester) async {
        await setSize(tester, const Size(500, 1000));
        final backend = FakeBackend()
          ..referralState = _referral(invites: _invites(used: 1));
        final c = await app(tester, backend);
        c.read(routerProvider).go('/bots');
        await _settle(tester);
        expect(find.byKey(const Key('chatsInvites')), findsOneWidget);
        expect(find.byTooltip('2 invites left'), findsOneWidget);
        await tester.tap(find.byKey(const Key('chatsInvites')));
        await _settle(tester);
        expect(find.byKey(const Key('inviteFriendsHero')), findsOneWidget);
      },
    );

    testWidgets('no ticket while sign-up is open or the invites are used', (
      tester,
    ) async {
      await setSize(tester, const Size(500, 1000));
      for (final r in [_referral(), _referral(invites: _invites(used: 3))]) {
        final c = await app(tester, FakeBackend()..referralState = r);
        c.read(routerProvider).go('/bots');
        await _settle(tester);
        expect(find.byKey(const Key('chatsInvites')), findsNothing);
      }
    });

    testWidgets(
      'Invite Friends says Send an Invite and asks who it is for first',
      (tester) async {
        await setSize(tester, const Size(500, 1400));
        final backend = FakeBackend()
          ..referralState = _referral(invites: _invites());
        final c = await app(tester, backend);
        c.read(routerProvider).go('/settings/invite');
        await _settle(tester);
        expect(find.text('Send an Invite'), findsOneWidget);
        await tester.tap(find.byKey(const Key('inviteFriendsShare')));
        await _settle(tester);
        expect(find.text("Who's It For?"), findsOneWidget);
      },
    );
  });
}
