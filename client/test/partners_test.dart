import 'package:casama/app.dart';
import 'package:casama/core/install_tracker.dart';
import 'package:casama/core/partner_code.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/router.dart';
import 'package:casama/features/admin/partners_tab.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// Casama Partners in the app (D-543): creator codes typed, from links and from Google Play, and
/// Admin → Partners.
Future<ProviderContainer> _app(WidgetTester tester, FakeBackend backend) async {
  await tester.pumpWidget(
    ProviderScope(overrides: [backendProvider.overrideWithValue(backend)], child: const CasamaApp()),
  );
  await _settle(tester, 5);
  return ProviderScope.containerOf(tester.element(find.byType(CasamaApp)));
}

Future<void> _settle(WidgetTester tester, [int times = 10]) async {
  for (var i = 0; i < times; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    InstallTracker.reset();
  });

  group('code shapes', () {
    test('6 characters or an /i/ link is a friend\'s code; anything else a creator\'s', () {
      expect(looksLikeFriendCode('K7M2QX'), isTrue);
      expect(looksLikeFriendCode('ana 234'), isTrue);
      expect(looksLikeFriendCode('https://casama.ai/i/K7M2QX'), isTrue);
      expect(looksLikeFriendCode('MAYA'), isFalse);
      expect(looksLikeFriendCode('techwithsam'), isFalse);
      expect(looksLikeFriendCode('casama.ai/c/TECHIE'), isFalse);
    });

    test('creator codes are normalized and links reduced to the code', () {
      expect(normalizePartnerCode(' maya '), 'MAYA');
      expect(normalizePartnerCode('https://casama.ai/c/maya?x=1'), 'MAYA');
      expect(normalizePartnerCode('ab'), isNull);
      expect(normalizePartnerCode('A' * 21), isNull);
    });

    test('the Play install referrer carries the creator code', () {
      expect(partnerCodeFromReferrer('utm_source=site&utm_medium=creator&partner=MAYA&cv=abc12345abc'), 'MAYA');
      expect(partnerCodeFromReferrer('utm_source%3Dsite%26partner%3Dmaya'), 'MAYA');
      expect(partnerCodeFromReferrer('utm_source=site'), isNull);
      expect(partnerCodeFromReferrer('%E0%A4%A'), isNull);
      expect(partnerCodeFromReferrer(null), isNull);
    });
  });

  group('pending creator code', () {
    test('Google Play\'s referrer keeps it as play_referrer, never over a link', () async {
      final prefs = await SharedPreferences.getInstance();
      final sent = <Map<String, Object?>>[];
      await InstallTracker.start(
        cloud: true,
        send: (b) async => sent.add(b),
        prefs: prefs,
        keychain: false,
        playReferrer: () async => 'utm_source=site&partner=maya',
      );
      expect(await PartnerCodeStore.read(prefs: prefs), const PendingPartnerCode('MAYA', 'play_referrer'));
      // The code is kept on the device only: nothing about it goes with the first open.
      expect(sent.single.values.whereType<String>().any((v) => v.toUpperCase().contains('MAYA')), isFalse);

      // A link opened earlier wins over the referrer.
      SharedPreferences.setMockInitialValues({});
      InstallTracker.reset();
      final fresh = await SharedPreferences.getInstance();
      await PartnerCodeStore.save('SAM', via: 'link_web', prefs: fresh);
      await InstallTracker.start(
        cloud: true,
        send: (_) async {},
        prefs: fresh,
        keychain: false,
        playReferrer: () async => 'partner=MAYA',
      );
      expect(await PartnerCodeStore.read(prefs: fresh), const PendingPartnerCode('SAM', 'link_web'));
    });

    test('a finished code isn\'t taken again', () async {
      final prefs = await SharedPreferences.getInstance();
      await PartnerCodeStore.save('MAYA', via: 'link_web', prefs: prefs);
      await PartnerCodeStore.finish('MAYA', prefs: prefs);
      expect(await PartnerCodeStore.read(prefs: prefs), isNull);
      expect(await PartnerCodeStore.save('maya', via: 'link_web', prefs: prefs), isFalse);
    });

    testWidgets('a creator link signed out is kept through sign-in', (tester) async {
      await setSize(tester, const Size(500, 1000));
      final backend = FakeBackend()..signedIn = false;
      final c = await _app(tester, backend);
      c.read(routerProvider).go('/c/maya');
      await _settle(tester);
      expect(c.read(routerProvider).state.matchedLocation, '/sign-in');
      expect(backend.claimedPartners, isEmpty);
      expect(await PartnerCodeStore.read(), const PendingPartnerCode('MAYA', 'link_web'));
    });

    testWidgets('signed in, a creator link is claimed once with link_web', (tester) async {
      await setSize(tester, const Size(500, 1000));
      final backend = FakeBackend();
      final c = await _app(tester, backend);
      c.read(routerProvider).go('/c/MAYA');
      await _settle(tester);
      expect(backend.claimedPartners, [(code: 'MAYA', via: 'link_web')]);
      expect(await PartnerCodeStore.read(), isNull);
      expect(c.read(routerProvider).state.matchedLocation, isNot(startsWith('/c/')));
    });

    testWidgets('a Play referrer code is claimed after sign-in with play_referrer; a wrong one is dropped', (
      tester,
    ) async {
      await setSize(tester, const Size(500, 1000));
      SharedPreferences.setMockInitialValues({'casama.pending_partner': 'play_referrer|NOPE'});
      final backend = FakeBackend();
      await _app(tester, backend);
      await _settle(tester);
      expect(backend.claimedPartners, [(code: 'NOPE', via: 'play_referrer')]);
      // partner_not_found is final: the code is dropped, not tried on every launch.
      expect(await PartnerCodeStore.read(), isNull);
    });
  });

  group('Invite Friends', () {
    testWidgets('a creator code goes to the partner claim, a 6-character one to the friend\'s redeem', (tester) async {
      await setSize(tester, const Size(500, 1600));
      final backend = FakeBackend();
      final c = await _app(tester, backend);
      c.read(routerProvider).go('/settings/invite');
      await _settle(tester);
      expect(find.text('Got a Code?'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('referralCodeField')), 'nope1');
      await tester.tap(find.byKey(const Key('referralRedeem')));
      await _settle(tester);
      expect(backend.claimedPartners, [(code: 'nope1', via: 'typed')]);
      expect(backend.redeemedReferrals, isEmpty);
      expect(find.text("That creator code doesn't exist. Check it and try again."), findsOneWidget);

      await tester.enterText(find.byKey(const Key('referralCodeField')), 'maya');
      await tester.tap(find.byKey(const Key('referralRedeem')));
      await _settle(tester);
      expect(backend.claimedPartners.last, (code: 'maya', via: 'typed'));
      expect(backend.redeemedReferrals, isEmpty);
      expect(find.byKey(const Key('inviteFriendsSentBy')), findsOneWidget);
      expect(find.text('Maya sent you to Casama.'), findsOneWidget);
      expect(find.byKey(const Key('referralCodeField')), findsNothing);
    });

    testWidgets('a 6-character code still goes to the friend\'s redeem', (tester) async {
      await setSize(tester, const Size(500, 1600));
      final backend = FakeBackend();
      final c = await _app(tester, backend);
      c.read(routerProvider).go('/settings/invite');
      await _settle(tester);
      await tester.enterText(find.byKey(const Key('referralCodeField')), 'ANA234');
      await tester.tap(find.byKey(const Key('referralRedeem')));
      await _settle(tester);
      expect(backend.redeemedReferrals, ['ANA234']);
      expect(backend.claimedPartners, isEmpty);
    });

    testWidgets('a partner sees their code, link and the portal button', (tester) async {
      await setSize(tester, const Size(500, 1800));
      final backend = FakeBackend()
        ..partnerMeState = PartnerMe(
          enabled: true,
          sentBy: null,
          canClaim: false,
          claimDaysLeft: 0,
          partner: PartnerMePartner(
            code: 'MAYA',
            link: 'https://casama.ai/c/maya',
            status: 'active',
            portalUrl: 'https://partners.casama.ai',
          ),
        );
      final c = await _app(tester, backend);
      c.read(routerProvider).go('/settings/invite');
      await _settle(tester);
      expect(find.byKey(const Key('partnerCodeCard')), findsOneWidget);
      expect(find.text('MAYA'), findsOneWidget);
      expect(find.text('https://casama.ai/c/maya'), findsOneWidget);
      expect(find.byKey(const Key('partnerPortal')), findsOneWidget);
    });
  });

  group('Admin → Partners', () {
    testWidgets('shows totals and partners, syncs, and pauses a partner from its detail', (tester) async {
      await setSize(tester, const Size(1300, 900));
      final backend = FakeBackend()
        ..adminPartnerCommissionsState = [
          AdminPartnerCommission(
            id: 'c1',
            partnerId: 'p1',
            partnerName: 'Maya',
            kind: AdminPartnerCommissionKindEnum.sale,
            source_: 'dodo',
            baseUsd: 13.94,
            rate: 0.3,
            amountUsd: 4.18,
            status: AdminPartnerCommissionStatusEnum.pending,
            holdUntil: DateTime.now().add(const Duration(days: 30)),
            note: null,
            syncState: 'pushed',
            syncError: null,
            paidAt: null,
            createdAt: DateTime.now(),
          ),
        ];
      await tester.pumpWidget(harness(backend, const Scaffold(body: PartnersTab())));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byKey(const Key('adminPartnersPending')), findsOneWidget);
      expect(find.byKey(const Key('adminPartner-p1')), findsOneWidget);
      expect(find.byKey(const Key('adminPartnerCommission-c1')), findsOneWidget);
      expect(find.byKey(const Key('adminPartnersTolt')), findsOneWidget);

      await tester.tap(find.byKey(const Key('adminPartnersSync')));
      await tester.pumpAndSettle();
      expect(backend.partnerSyncs, 1);

      await tester.tap(find.byKey(const Key('adminPartner-p1')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('adminPartnerDetail')), findsOneWidget);
      await tester.tap(find.byKey(const Key('adminPartnerPause')));
      await tester.pumpAndSettle();
      expect(backend.partnerUpdates.single.$1, 'p1');
      expect(backend.partnerUpdates.single.$2.status, UpdateAdminPartnerRequestStatusEnum.paused);

      // Codes sit further down the sheet: retire one.
      final list = find
          .descendant(of: find.byKey(const Key('adminPartnerDetail')), matching: find.byType(Scrollable))
          .first;
      await tester.scrollUntilVisible(find.byKey(const Key('adminPartnerCodeMenu-MAYA')), 200, scrollable: list);
      await tester.tap(find.byKey(const Key('adminPartnerCodeMenu-MAYA')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('adminPartnerCodeRetire-MAYA')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('adminPartnerRetireConfirm')));
      await tester.pumpAndSettle();
      expect(backend.partnerCodeUpdates.single.$1, 'MAYA');
      expect(backend.partnerCodeUpdates.single.$2.status, UpdateAdminPartnerCodeRequestStatusEnum.retired);
    });

    testWidgets('says so when partners are off', (tester) async {
      await setSize(tester, const Size(500, 900));
      final backend = FakeBackend();
      backend.adminPartnersState = backend.adminPartnersState.copyWith(enabled: false, partners: const []);
      await tester.pumpWidget(harness(backend, const Scaffold(body: PartnersTab())));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('adminPartnersOff')), findsOneWidget);
    });
  });
}
