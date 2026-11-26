// Casama Cloud models in the app (docs/SELFHOST-CLOUD-MODELS-PLAN.md §4, §7.2, §7.4, §9): the build
// switch, the Casama Cloud row on the Models screen, the turn-on flow (sign in, who pays, plan,
// connect, review, done), living with it (usage, the 80% warning, every §9 stop with its action,
// the members' notice, memory catching up, the admin's policy, turn off), and paying in the right
// place (store purchases as the Cloud workspace, then anonymous; web checkout watched).
import 'package:casama/core/billing.dart';
import 'package:casama/core/cloud_account.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/selfhost_api.dart';
import 'package:casama/features/billing/billing_screen.dart'
    show openUrlProvider, platformProvider;
import 'package:casama/features/cloud_models/cloud_models_api.dart';
import 'package:casama/features/cloud_models/cloud_models_flag.dart';
import 'package:casama/features/cloud_models/cloud_models_screen.dart';
import 'package:casama/features/cloud_models/cloud_models_setup.dart';
import 'package:casama/features/cloud_models/cloud_models_state.dart';
import 'package:casama/features/cloud_models/cloud_purchase.dart';
import 'package:casama/features/settings/model_keys_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'cloud_models_fakes.dart';
import 'fake_backend.dart';

const _licensed = ServerLicenseStatus(
  licensing: true,
  state: 'active',
  edition: 'personal',
  instanceId: 'inst-1',
  engineVersion: '2026.11.26',
);

class _Rig {
  _Rig({CloudModelsState? state})
    : models = FakeCloudModelsApi(
        state ?? const CloudModelsState(available: true, canManage: true),
      ) {
    backend.selfhost.current = _licensed;
  }
  final backend = FakeBackend();
  final cloud = FakeCloudApi();
  final FakeCloudModelsApi models;
  late final store = MemoryCloudAccountStore(
    cloudSessionFor('oliver@example.test'),
  );
  StorePurchases shop = const NoStore();
  TargetPlatform platform = TargetPlatform.linux;
  bool build = true;
  final opened = <String>[];

  List<dynamic> get overrides => [
    cloudModelsBuildProvider.overrideWithValue(build),
    cloudModelsApiProvider.overrideWithValue(models),
    cloudApiProvider.overrideWithValue(cloud),
    cloudAccountStoreProvider.overrideWithValue(store),
    storeProvider.overrideWithValue(shop),
    platformProvider.overrideWithValue(platform),
    cloudIsWebProvider.overrideWithValue(false),
    openUrlProvider.overrideWithValue((url) async => opened.add(url)),
  ];

  Widget wrap(Widget child) => harness(backend, child, overrides: overrides);
}

Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 8; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('the build switch', () {
    test('is off unless the build says so', () {
      expect(kCloudModels, isFalse);
      expect(ProviderContainer().read(cloudModelsBuildProvider), isFalse);
    });

    testWidgets(
      'off: the Models screen, the banner and the state show nothing',
      (tester) async {
        await setSize(tester, const Size(900, 1600));
        final rig = _Rig(
          state: connectedState(
            status: proStatus(modelsAllowed: false, paid: false),
          ),
        )..build = false;
        await tester.pumpWidget(rig.wrap(const ModelKeysScreen()));
        await settle(tester);
        expect(find.byKey(const Key('shCloudRow')), findsNothing);
        expect(find.text('Casama Cloud'), findsNothing);
        final container = ProviderScope.containerOf(
          tester.element(find.byType(ModelKeysScreen)),
        );
        expect(
          await container.read(cloudModelsStateProvider.future),
          isA<CloudModelsState>().having(
            (s) => s.available,
            'available',
            false,
          ),
        );
      },
    );

    testWidgets(
      'on, but the server offers nothing (older server, unlicensed): no row',
      (tester) async {
        await setSize(tester, const Size(900, 1600));
        final rig = _Rig(state: CloudModelsState.off);
        await tester.pumpWidget(rig.wrap(const ModelKeysScreen()));
        await settle(tester);
        expect(find.byKey(const Key('shCloudRow')), findsNothing);
      },
    );

    testWidgets(
      "the server's config says it can't offer them: no row, and the server isn't asked",
      (tester) async {
        await setSize(tester, const Size(900, 1600));
        final rig = _Rig()
          ..backend.cloudModelsConfig = (available: false, connected: false);
        await tester.pumpWidget(rig.wrap(const ModelKeysScreen()));
        await settle(tester);
        expect(find.byKey(const Key('shCloudRow')), findsNothing);
        expect(rig.models.stateReads, 0);
      },
    );

    testWidgets(
      "the config says it can, but the server's own answer decides (available: false)",
      (tester) async {
        await setSize(tester, const Size(900, 1600));
        final rig = _Rig(state: CloudModelsState.off)
          ..backend.cloudModelsConfig = (available: true, connected: false);
        await tester.pumpWidget(rig.wrap(const ModelKeysScreen()));
        await settle(tester);
        expect(find.byKey(const Key('shCloudRow')), findsNothing);
        expect(rig.models.stateReads, greaterThan(0));
      },
    );

    testWidgets('the config says it can: the row shows', (tester) async {
      await setSize(tester, const Size(900, 1600));
      final rig = _Rig()
        ..backend.cloudModelsConfig = (available: true, connected: false);
      await tester.pumpWidget(rig.wrap(const ModelKeysScreen()));
      await settle(tester);
      expect(find.byKey(const Key('shCloudRow')), findsOneWidget);
    });
  });

  group('the Casama Cloud row', () {
    testWidgets('admins see the pitch and Turn On at the top of Models', (
      tester,
    ) async {
      await setSize(tester, const Size(900, 1600));
      final rig = _Rig();
      await tester.pumpWidget(rig.wrap(const ModelKeysScreen()));
      await settle(tester);
      expect(find.byKey(const Key('shCloudRow')), findsOneWidget);
      expect(
        find.text(
          "Casama's models, no keys to manage. Paid by a Casama Cloud plan.",
        ),
        findsOneWidget,
      );
      expect(find.byKey(const Key('shCloudTurnOn')), findsOneWidget);
    });

    testWidgets('members see the state, never the switch', (tester) async {
      await setSize(tester, const Size(900, 1600));
      final rig = _Rig(state: const CloudModelsState(available: true));
      await tester.pumpWidget(rig.wrap(const ModelKeysScreen()));
      await settle(tester);
      expect(
        find.text('Not on. Only an admin of this server can turn it on.'),
        findsOneWidget,
      );
      expect(find.byKey(const Key('shCloudTurnOn')), findsNothing);
    });

    testWidgets('connected: who pays, and a stop in words on the row itself', (
      tester,
    ) async {
      await setSize(tester, const Size(900, 1600));
      final rig = _Rig(
        state: connectedState(
          canManage: false,
          status: proStatus(modelsAllowed: false, paid: false),
        ),
      );
      await tester.pumpWidget(rig.wrap(const ModelKeysScreen()));
      await settle(tester);
      expect(find.text('Casama Cloud, paid by Oliver HQ'), findsOneWidget);
      expect(
        find.text('Casama Cloud needs a plan on Oliver HQ.'),
        findsOneWidget,
      );
    });
  });

  group('§9: every stop has words and one action', () {
    final cases =
        <
          String,
          (CloudModelsState, CloudStop, String, CloudAction, CloudAction)
        >{
          'out of usage': (
            connectedState(status: proStatus(includedUsed: 20)),
            CloudStop.outOfCredits,
            'Casama Cloud is out of usage for this month.',
            CloudAction.topUp,
            CloudAction.askAdmin,
          ),
          'out of credits (refused)': (
            connectedState(status: proStatus(modelsAllowed: false)),
            CloudStop.outOfCredits,
            'Casama Cloud is out of usage for this month.',
            CloudAction.topUp,
            CloudAction.askAdmin,
          ),
          'daily cap': (
            connectedState(status: proStatus(todaySpend: 5)),
            CloudStop.dailyCap,
            "Today's Casama Cloud limit is used up. It resets at",
            CloudAction.useOwnKey,
            CloudAction.askAdmin,
          ),
          'no plan': (
            connectedState(
              status: proStatus(modelsAllowed: false, paid: false),
            ),
            CloudStop.planRequired,
            'Casama Cloud needs a plan on Oliver HQ.',
            CloudAction.seePlans,
            CloudAction.askAdmin,
          ),
          'plan ended': (
            connectedState(
              status: proStatus(
                modelsAllowed: false,
                paid: false,
                planEnded: true,
              ),
            ),
            CloudStop.planEnded,
            'The Casama Cloud plan on Oliver HQ ended.',
            CloudAction.renew,
            CloudAction.askAdmin,
          ),
          'seats': (
            connectedState(
              status: proStatus(
                modelsAllowed: false,
                seatsPlan: 3,
                seatsUsed: 5,
              ),
            ),
            CloudStop.seatsRequired,
            "The plan on Oliver HQ doesn't cover everyone using Casama Cloud here.",
            CloudAction.seePlans,
            CloudAction.askAdmin,
          ),
          'member over their limit': (
            connectedState(me: const CloudMe(todayUsd: 1, limitUsd: 1)),
            CloudStop.memberLimit,
            "You've reached today's Casama Cloud limit on this server.",
            CloudAction.askAdmin,
            CloudAction.askAdmin,
          ),
          'member not allowed': (
            connectedState(me: const CloudMe(allowed: false)),
            CloudStop.memberNotAllowed,
            "Your admin hasn't turned on Casama Cloud for you.",
            CloudAction.askAdmin,
            CloudAction.askAdmin,
          ),
          'key revoked': (
            connectedState(statusError: (code: 'key_revoked', message: 'x')),
            CloudStop.disconnected,
            'Casama Cloud was disconnected from this server.',
            CloudAction.reconnect,
            CloudAction.askAdmin,
          ),
          'models scope dropped': (
            connectedState(
              statusError: (code: 'models_unavailable', message: 'x'),
            ),
            CloudStop.disconnected,
            'Casama Cloud was disconnected from this server.',
            CloudAction.reconnect,
            CloudAction.askAdmin,
          ),
          'unreachable': (
            connectedState(
              statusError: (code: 'upstream_unreachable', message: 'x'),
            ),
            CloudStop.unreachable,
            "Casama Cloud can't be reached right now. Trying again.",
            CloudAction.useOwnKey,
            CloudAction.askAdmin,
          ),
        };

    for (final MapEntry(
          key: name,
          value: (state, stop, words, adminAction, memberAction),
        )
        in cases.entries) {
      testWidgets(name, (tester) async {
        expect(cloudStopOf(state), stop);
        expect(cloudActionFor(stop, admin: true), adminAction);
        expect(cloudActionFor(stop, admin: false), memberAction);
        await setSize(tester, const Size(900, 1200));
        final rig = _Rig(state: state);
        await tester.pumpWidget(
          rig.wrap(
            Scaffold(
              body: CloudStopCard(state: state, stop: stop),
            ),
          ),
        );
        await settle(tester);
        expect(find.textContaining(words), findsOneWidget);
        expect(
          find.byKey(Key('shCloudAction-${adminAction.name}')),
          findsOneWidget,
        );
        // No error code ever reaches the person.
        expect(find.textContaining('_'), findsNothing);
      });
    }

    test('nothing stops while Cloud answers, or before it is connected', () {
      expect(cloudStopOf(connectedState()), isNull);
      expect(
        cloudStopOf(const CloudModelsState(available: true, canManage: true)),
        isNull,
      );
    });

    test('top up and renew offer "Use my own key" second; members get nothing second', () {
      expect(
        cloudSecondActionFor(CloudStop.outOfCredits, admin: true),
        CloudAction.useOwnKey,
      );
      expect(
        cloudSecondActionFor(CloudStop.planEnded, admin: true),
        CloudAction.useOwnKey,
      );
      expect(
        cloudSecondActionFor(CloudStop.outOfCredits, admin: false),
        isNull,
      );
    });

    testWidgets('Ask an admin says who can fix it', (tester) async {
      await setSize(tester, const Size(900, 1200));
      final state = connectedState(
        canManage: false,
        me: const CloudMe(allowed: false),
      );
      final rig = _Rig(state: state);
      await tester.pumpWidget(
        rig.wrap(
          Scaffold(
            body: CloudStopCard(state: state, stop: CloudStop.memberNotAllowed),
          ),
        ),
      );
      await settle(tester);
      await tester.tap(find.byKey(const Key('shCloudAction-askAdmin')));
      await settle(tester);
      expect(find.byKey(const Key('shCloudAskAdminSheet')), findsOneWidget);
    });

    testWidgets(
      'Use my own key turns the fallback on after saying what it does',
      (tester) async {
        await setSize(tester, const Size(900, 1200));
        final state = connectedState(
          statusError: (code: 'upstream_unreachable', message: 'x'),
        );
        final rig = _Rig(state: state);
        await tester.pumpWidget(
          rig.wrap(
            Scaffold(
              body: CloudStopCard(state: state, stop: CloudStop.unreachable),
            ),
          ),
        );
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudAction-useOwnKey')));
        await settle(tester);
        expect(find.text('Use your own key meanwhile?'), findsOneWidget);
        await tester.tap(find.text('Use My Own Key').last);
        await settle(tester);
        expect(rig.models.updates.single.fallback?.toOwn, isTrue);
      },
    );

    testWidgets('Use my own key with no own key points to adding one', (
      tester,
    ) async {
      await setSize(tester, const Size(900, 1200));
      final state = connectedState(status: proStatus(todaySpend: 5));
      final rig = _Rig(state: state)
        ..models.previewAnswer = const CloudPreview(
          bots: [PreviewBot(id: 'b-2', name: 'Bo')],
        );
      await tester.pumpWidget(
        rig.wrap(
          Scaffold(
            body: CloudStopCard(state: state, stop: CloudStop.dailyCap),
          ),
        ),
      );
      await settle(tester);
      await tester.tap(find.byKey(const Key('shCloudAction-useOwnKey')));
      await settle(tester);
      expect(
        find.text('Add a key of your own on the Models screen first.'),
        findsOneWidget,
      );
      expect(rig.models.updates, isEmpty);
    });

    testWidgets(
      'with the fallback on, the stop says the own key is answering',
      (tester) async {
        await setSize(tester, const Size(900, 1200));
        final state = connectedState(
          status: proStatus(includedUsed: 20),
          fallback: const CloudFallback(toOwn: true),
        );
        final rig = _Rig(state: state);
        await tester.pumpWidget(
          rig.wrap(
            Scaffold(
              body: CloudStopCard(state: state, stop: CloudStop.outOfCredits),
            ),
          ),
        );
        await settle(tester);
        expect(
          find.text(
            'Your own key is answering meanwhile, and each answer says so.',
          ),
          findsOneWidget,
        );
        expect(find.byKey(const Key('shCloudAction-useOwnKey')), findsNothing);
      },
    );

    testWidgets(
      'Top up buys credits for the paying Cloud workspace on the web',
      (tester) async {
        await setSize(tester, const Size(900, 1400));
        CloudPurchaser.watchEvery = const Duration(milliseconds: 10);
        final state = connectedState(status: proStatus(includedUsed: 20));
        final rig = _Rig(state: state);
        await tester.pumpWidget(
          rig.wrap(
            Scaffold(
              body: CloudStopCard(state: state, stop: CloudStop.outOfCredits),
            ),
          ),
        );
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudAction-topUp')));
        await settle(tester);
        expect(find.byKey(const Key('shCloudBuySheet')), findsOneWidget);
        rig.cloud.billingAfter = (_) => const CloudBilling(
          planCode: 'pro',
          planName: 'Pro',
          creditsUsd: 10,
        );
        await tester.tap(find.byKey(const Key('shCloudBuyPack-credits_10')));
        await settle(tester);
        expect(rig.cloud.checkouts, ['credits_10@cw-1']);
        expect(rig.opened, ['https://checkout.test/credits_10']);
        expect(find.byKey(const Key('shCloudBuySheet')), findsNothing);
      },
    );
  });

  group('turning it on (§4.1)', () {
    testWidgets(
      'an existing subscriber: picked for them, covered, review, done',
      (tester) async {
        await setSize(tester, const Size(900, 3000));
        final rig = _Rig();
        await tester.pumpWidget(rig.wrap(const CloudModelsSetupScreen()));
        await settle(tester);
        // Signed in already (kept session): no sheet. One workspace, picked and shown.
        expect(
          find.text('Signed in to Casama Cloud as oliver@example.test'),
          findsOneWidget,
        );
        expect(find.text('Oliver HQ'), findsOneWidget);
        await tester.tap(find.byKey(const Key('shCloudPayerContinue')));
        await settle(tester);
        // The plan covers it: straight to the review, after connecting with a one-time code.
        expect(rig.cloud.connectCodes.single, (
          orgId: 'cw-1',
          instanceId: 'inst-1',
        ));
        expect(rig.models.connected, ['code-1']);
        expect(find.text('Check before turning on'), findsOneWidget);
        expect(
          find.text('Pro on Oliver HQ (oliver@example.test)'),
          findsOneWidget,
        );
        expect(find.text('Your Pro plan covers this.'), findsOneWidget);
        // Each bot from → to; the step down warns.
        expect(
          find.text(
            'Claude Opus 5.5 (your Anthropic key) → deepseek-v4.1-flash (Casama Cloud)',
          ),
          findsOneWidget,
        );
        expect(
          find.text('No working key → deepseek-v4.1-flash (Casama Cloud)'),
          findsOneWidget,
        );
        // Default: only bots without a working key (Bo), so Ada's step-down note isn't shown yet.
        expect(find.byKey(const Key('shCloudStepDown-b-1')), findsNothing);
        // Memory/images/voice per job; the fallback switch only because an own key exists.
        expect(find.byKey(const Key('shCloudJobImages')), findsOneWidget);
        expect(find.byKey(const Key('shCloudFallback')), findsOneWidget);
        expect(find.textContaining("aren't stored"), findsOneWidget);
        await tester.tap(find.byKey(const Key('shCloudChoiceAll')));
        await settle(tester);
        expect(find.byKey(const Key('shCloudStepDown-b-1')), findsOneWidget);
        await tester.tap(find.byKey(const Key('shCloudChoiceNoKey')));
        await settle(tester);
        // Nothing changed on the server until now.
        expect(rig.models.applied, isEmpty);
        await tester.ensureVisible(find.byKey(const Key('shCloudApply')));
        await tester.tap(find.byKey(const Key('shCloudApply')));
        await settle(tester);
        final apply = rig.models.applied.single;
        expect(apply.bots, ['b-2']);
        expect(apply.fallback.toOwn, isFalse);
        expect(apply.embedding, isTrue);
        expect(find.byKey(const Key('shCloudDoneTitle')), findsOneWidget);
        expect(find.text('Say Hi to Bo'), findsOneWidget);
      },
    );

    testWidgets('no Cloud workspace: Create One makes one named after them', (
      tester,
    ) async {
      await setSize(tester, const Size(900, 2000));
      final rig = _Rig()
        ..cloud.workspaceList = const [
          CloudWorkspace(id: 'cw-x', name: 'Someone else', role: 'member'),
        ];
      await tester.pumpWidget(rig.wrap(const CloudModelsSetupScreen()));
      await settle(tester);
      expect(find.byKey(const Key('shCloudNoWorkspace')), findsOneWidget);
      expect(find.text('Someone else'), findsNothing);
      await tester.tap(find.byKey(const Key('shCloudCreateWorkspace')));
      await settle(tester);
      expect(rig.cloud.created, ["Oliver's workspace"]);
      await tester.tap(find.byKey(const Key('shCloudPayerContinue')));
      await settle(tester);
      // A new workspace has no plan: the plan step, with free usage to try.
      expect(find.text('Choose a plan'), findsOneWidget);
      expect(find.byKey(const Key('shCloudTryFirst')), findsOneWidget);
      expect(
        find.textContaining('Free usage to try: about \$0.50'),
        findsOneWidget,
      );
      expect(find.textContaining('free trial'), findsNothing);
      expect(find.textContaining('Free trial'), findsNothing);
    });

    testWidgets(
      'Try it first connects; used up, it says so and shows the plans',
      (tester) async {
        await setSize(tester, const Size(900, 2000));
        final rig = _Rig()
          ..cloud.billingFor['cw-1'] = const CloudBilling(
            planCode: 'free',
            planName: 'Free',
          );
        rig.models.afterConnect = (_) => connectedState(
          status: proStatus(modelsAllowed: false, paid: false),
        );
        await tester.pumpWidget(rig.wrap(const CloudModelsSetupScreen()));
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudPayerContinue')));
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudTryFirst')));
        await settle(tester);
        expect(rig.models.connected, hasLength(1));
        expect(find.byKey(const Key('shCloudTrialUsed')), findsOneWidget);
        expect(find.byKey(const Key('shCloudTryFirst')), findsNothing);
        expect(rig.models.applied, isEmpty);
      },
    );

    testWidgets(
      'Try it first with allowance left goes to the review on the free usage',
      (tester) async {
        await setSize(tester, const Size(900, 3000));
        final rig = _Rig()
          ..cloud.billingFor['cw-1'] = const CloudBilling(
            planCode: 'free',
            planName: 'Free',
          );
        rig.models.afterConnect = (_) =>
            connectedState(status: proStatus(paid: false, trial: 0.5));
        await tester.pumpWidget(rig.wrap(const CloudModelsSetupScreen()));
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudPayerContinue')));
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudTryFirst')));
        await settle(tester);
        expect(
          find.text('Free usage to try on Oliver HQ (oliver@example.test)'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'desktop: web checkout opens, the screen watches and carries on by itself',
      (tester) async {
        await setSize(tester, const Size(900, 3000));
        CloudPurchaser.watchEvery = const Duration(milliseconds: 10);
        final rig = _Rig()
          ..cloud.billingFor['cw-1'] = const CloudBilling(
            planCode: 'free',
            planName: 'Free',
          );
        await tester.pumpWidget(rig.wrap(const CloudModelsSetupScreen()));
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudPayerContinue')));
        await settle(tester);
        expect(find.byKey(const Key('shCloudRestore')), findsNothing);
        // Direct desktop builds take gift codes.
        expect(find.byKey(const Key('shCloudGiftCode')), findsOneWidget);
        await tester.tap(find.byKey(const Key('shCloudPlan-plus-month')));
        await tester.pump();
        await tester.pump();
        expect(rig.opened, ['https://checkout.test/plus']);
        expect(find.byKey(const Key('shCloudWaitingOnWeb')), findsOneWidget);
        rig.cloud.billingAfter = (_) =>
            const CloudBilling(planCode: 'plus', planName: 'Plus');
        await settle(tester);
        expect(find.text('Check before turning on'), findsOneWidget);
      },
    );

    testWidgets(
      'App Store build: buys in the store for the Cloud workspace, no web, no gift codes',
      (tester) async {
        await setSize(tester, const Size(900, 3000));
        final shop = ReleasingStore('app_store');
        final rig = _Rig()
          ..shop = shop
          ..platform = TargetPlatform.iOS
          ..cloud.billingFor['cw-1'] = const CloudBilling(
            planCode: 'free',
            planName: 'Free',
          );
        await tester.pumpWidget(rig.wrap(const CloudModelsSetupScreen()));
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudPayerContinue')));
        await settle(tester);
        expect(find.byKey(const Key('shCloudGiftCode')), findsNothing);
        expect(find.byKey(const Key('shCloudRestore')), findsOneWidget);
        await tester.tap(find.byKey(const Key('shCloudPlan-plus-month')));
        await settle(tester);
        expect(shop.bought, ['casama_plus_monthly@cw-1']);
        expect(rig.cloud.verified, ['casama_plus_monthly@cw-1']);
        expect(rig.cloud.checkouts, isEmpty);
        expect(shop.log, ['buy:cw-1', 'release'], reason: '${shop.log}');
        expect(find.text('Check before turning on'), findsOneWidget);
      },
    );

    testWidgets(
      'a Play build with no Play product for a plan: nothing to buy here, no web link',
      (tester) async {
        await setSize(tester, const Size(900, 2000));
        final rig = _Rig()
          ..shop = ReleasingStore('google_play')
          ..platform = TargetPlatform.android
          ..cloud.billingFor['cw-1'] = const CloudBilling(
            planCode: 'free',
            planName: 'Free',
          )
          ..cloud.catalog = const CloudCatalog(
            plans: [
              CloudPlan(
                code: 'pro',
                name: 'Pro',
                interval: 'month',
                storeProductIds: {'app_store': 'x'},
              ),
            ],
          );
        await tester.pumpWidget(rig.wrap(const CloudModelsSetupScreen()));
        await settle(tester);
        await tester.tap(find.byKey(const Key('shCloudPayerContinue')));
        await settle(tester);
        expect(find.byKey(const Key('shCloudNoWayToBuy')), findsOneWidget);
      },
    );
  });

  group('paying in the right place (§7.4)', () {
    test('store purchases log in as the Cloud workspace, verify with Cloud, then go anonymous', () async {
      final shop = ReleasingStore('app_store');
      final cloud = FakeCloudApi();
      final c = ProviderContainer(
        overrides: [
          storeProvider.overrideWithValue(shop),
          cloudApiProvider.overrideWithValue(cloud),
        ],
      );
      addTearDown(c.dispose);
      final r = await c
          .read(cloudPurchaserProvider)
          .buyInStore(orgId: 'cw-1', productId: 'casama_plus_monthly');
      expect(r, CloudBuyResult.bought);
      expect(shop.log, ['buy:cw-1', 'release']);
      expect(cloud.verified, ['casama_plus_monthly@cw-1']);
      expect(shop.completed, ['casama_plus_monthly']);
    });

    test(
      'a cancelled store purchase still logs out and charges nothing',
      () async {
        final shop = ReleasingStore('google_play')
          ..next = PurchaseStatus.canceled;
        final cloud = FakeCloudApi();
        final c = ProviderContainer(
          overrides: [
            storeProvider.overrideWithValue(shop),
            cloudApiProvider.overrideWithValue(cloud),
          ],
        );
        addTearDown(c.dispose);
        expect(
          await c
              .read(cloudPurchaserProvider)
              .buyInStore(orgId: 'cw-1', productId: 'casama_plus:monthly'),
          CloudBuyResult.cancelled,
        );
        expect(shop.releases, 1);
        expect(cloud.verified, isEmpty);
      },
    );

    test(
      'Restore Purchases restores into the Cloud workspace, then logs out',
      () async {
        final shop = ReleasingStore('app_store');
        final cloud = FakeCloudApi();
        final c = ProviderContainer(
          overrides: [
            storeProvider.overrideWithValue(shop),
            cloudApiProvider.overrideWithValue(cloud),
          ],
        );
        addTearDown(c.dispose);
        expect(await c.read(cloudPurchaserProvider).restore('cw-1'), isTrue);
        expect(shop.log, ['restore:cw-1', 'release']);
        expect(cloud.verified, ['casama_plus_monthly@cw-1']);
      },
    );

    test('RevenueCat never starts as a self-hosted workspace', () async {
      final backend = FakeBackend();
      final c = ProviderContainer(
        overrides: [backendProvider.overrideWithValue(backend)],
      );
      addTearDown(c.dispose);
      final probe = Provider<String?>(storeCustomerFor);
      c.listen(currentOrgProvider, (_, _) {});
      c.listen(billingProvider, (_, _) {});
      await c.read(organizationsProvider.future);
      await c.read(billingProvider.future);
      // FakeBackend is a self-hosted server (localhost, billing off).
      expect(c.read(currentOrgProvider), isNotNull);
      expect(c.read(probe), isNull);
    });

    test(
      'RevenueCat starts as the open workspace where the server sells plans',
      () async {
        final backend = FakeBackend()..billingEnabled = true;
        final c = ProviderContainer(
          overrides: [
            backendProvider.overrideWithValue(backend),
            storeProvider.overrideWithValue(const NoStore()),
          ],
        );
        addTearDown(c.dispose);
        final probe = Provider<String?>(storeCustomerFor);
        c.listen(currentOrgProvider, (_, _) {});
        c.listen(billingProvider, (_, _) {});
        await c.read(organizationsProvider.future);
        await c.read(billingProvider.future);
        expect(c.read(probe), c.read(currentOrgProvider)!.id);
      },
    );

    test('the open workspace\'s verifier leaves a Cloud workspace\'s purchase alone', () async {
      final backend = FakeBackend()..billingEnabled = true;
      final shop = ReleasingStore('app_store');
      final c = ProviderContainer(
        overrides: [
          backendProvider.overrideWithValue(backend),
          storeProvider.overrideWithValue(shop),
        ],
      );
      addTearDown(c.dispose);
      c.listen(currentOrgProvider, (_, _) {});
      await c.read(organizationsProvider.future);
      c.read(purchaseVerifierProvider);
      final outcomes = <PurchaseOutcome>[];
      final sub = c
          .read(purchaseVerifierProvider)
          .outcomes
          .listen(outcomes.add);
      addTearDown(sub.cancel);
      await shop.buy(
        const StoreProduct(id: 'casama_plus_monthly', price: r'$15'),
        orgId: 'cw-somewhere-else',
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(outcomes, isEmpty);
    });

    test('buy ways follow purchaseChannels', () {
      const ids = {'app_store': 'a', 'google_play': 'g'};
      expect(
        cloudBuyWay(
          channels: const [PurchaseChannel.appStore],
          storeSource: 'app_store',
          storeProductIds: ids,
          web: true,
        ),
        CloudBuyWay.store,
      );
      expect(
        cloudBuyWay(
          channels: const [PurchaseChannel.appStore],
          storeSource: 'app_store',
          storeProductIds: const {},
          web: true,
        ),
        CloudBuyWay.none,
      );
      expect(
        cloudBuyWay(
          channels: const [PurchaseChannel.appStore, PurchaseChannel.web],
          storeSource: 'app_store',
          storeProductIds: const {},
          web: true,
        ),
        CloudBuyWay.web,
      );
      expect(
        cloudBuyWay(
          channels: const [PurchaseChannel.googlePlay],
          storeSource: 'google_play',
          storeProductIds: const {},
          web: true,
        ),
        CloudBuyWay.none,
      );
      expect(
        cloudBuyWay(
          channels: const [PurchaseChannel.web],
          storeSource: null,
          storeProductIds: ids,
          web: true,
        ),
        CloudBuyWay.web,
      );
      expect(
        cloudBuyWay(
          channels: const [PurchaseChannel.web],
          storeSource: null,
          storeProductIds: ids,
          web: false,
        ),
        CloudBuyWay.none,
      );
    });
  });

  group('living with it (§4.2, §4.3)', () {
    testWidgets(
      'usage: included left, today against the cap, credits, at Cloud\'s price',
      (tester) async {
        await setSize(tester, const Size(900, 2400));
        final state = connectedState(
          status: proStatus(credits: 3),
          me: const CloudMe(todayUsd: 0.2, limitUsd: 1),
        );
        final rig = _Rig(state: state);
        await tester.pumpWidget(rig.wrap(const CloudModelsScreen()));
        await settle(tester);
        expect(
          find.text('\$16.00 of included usage left this month'),
          findsOneWidget,
        );
        expect(find.text('Today: \$0.40 of \$5.00'), findsOneWidget);
        expect(find.text('\$3.00 in credits'), findsOneWidget);
        expect(find.text('You today: \$0.20 of \$1.00'), findsOneWidget);
        expect(
          find.textContaining('At the price Casama Cloud charges'),
          findsOneWidget,
        );
        expect(find.byKey(const Key('shCloudTurnOff')), findsOneWidget);
      },
    );

    testWidgets('the free usage to try shows what is left', (tester) async {
      await setSize(tester, const Size(900, 2400));
      final rig = _Rig(
        state: connectedState(
          status: proStatus(paid: false, trial: 0.3, includedLimit: 0),
        ),
      );
      await tester.pumpWidget(rig.wrap(const CloudModelsScreen()));
      await settle(tester);
      expect(find.text('\$0.30 of free usage to try left'), findsOneWidget);
    });

    testWidgets('80% warning with Top up; memory catching up', (tester) async {
      await setSize(tester, const Size(900, 2400));
      final rig = _Rig(
        state: connectedState(
          status: proStatus(includedUsed: 17),
          reindex: const MemoryReindex(done: 40, total: 100),
        ),
      );
      await tester.pumpWidget(rig.wrap(const CloudModelsScreen()));
      await settle(tester);
      expect(
        find.text("Casama Cloud has used 80% of this month's included usage."),
        findsOneWidget,
      );
      expect(find.byKey(const Key('shCloudAction-topUp')), findsOneWidget);
      expect(find.text('Memory is catching up: 40 of 100'), findsOneWidget);
    });

    testWidgets('members see usage but no admin controls', (tester) async {
      await setSize(tester, const Size(900, 2400));
      final rig = _Rig(state: connectedState(canManage: false));
      await tester.pumpWidget(rig.wrap(const CloudModelsScreen()));
      await settle(tester);
      expect(find.byKey(const Key('shCloudUsage')), findsOneWidget);
      expect(find.byKey(const Key('shCloudTurnOff')), findsNothing);
      expect(find.byKey(const Key('shCloudDailyLimit')), findsNothing);
      expect(find.byKey(const Key('shCloudChangePayer')), findsNothing);
    });

    testWidgets('admins set a daily limit per person and who may use it', (
      tester,
    ) async {
      await setSize(tester, const Size(900, 2400));
      final rig = _Rig(state: connectedState());
      await tester.pumpWidget(rig.wrap(const CloudModelsScreen()));
      await settle(tester);
      await tester.tap(find.byKey(const Key('shCloudDailyLimitPicker')));
      await settle(tester);
      await tester.tap(find.text('\$2.00 a day').last);
      await settle(tester);
      expect(rig.models.updates.last.policy?.dailyUsdPerMember, 2);
      expect(rig.models.updates.last.policy?.everyone, isTrue);
      await tester.tap(find.byKey(const Key('shCloudPolicyChosen')));
      await settle(tester);
      expect(find.byKey(const Key('shCloudPeoplePicker')), findsOneWidget);
      await tester.tap(find.byKey(const Key('shCloudPerson-u-ana')));
      await tester.pump();
      await tester.tap(find.text('Continue'));
      await settle(tester);
      expect(rig.models.updates.last.policy?.allowed, ['u-ana']);
      expect(rig.models.updates.last.policy?.toJson()['allowed'], ['u-ana']);
      expect(const CloudPolicy().toJson()['allowed'], 'all');
    });

    testWidgets('turn off: review the bots, then where each went back', (
      tester,
    ) async {
      await setSize(tester, const Size(900, 2400));
      final rig = _Rig(state: connectedState())
        ..models.previewAnswer = const CloudPreview(
          bots: [
            PreviewBot(
              id: 'b-1',
              name: 'Ada',
              fromCredentialId: casamaCloudModelsCredentialId,
              fromWorking: true,
            ),
            PreviewBot(
              id: 'b-2',
              name: 'Bo',
              fromCredentialId: casamaCloudModelsCredentialId,
              fromWorking: true,
            ),
          ],
        );
      await tester.pumpWidget(rig.wrap(const CloudModelsScreen()));
      await settle(tester);
      await tester.ensureVisible(find.byKey(const Key('shCloudTurnOff')));
      await tester.tap(find.byKey(const Key('shCloudTurnOff')));
      await settle(tester);
      expect(find.byKey(const Key('shCloudOffReview')), findsOneWidget);
      expect(find.byKey(const Key('shCloudOffBot-b-1')), findsOneWidget);
      expect(rig.models.offCalls, 0);
      await tester.tap(find.byKey(const Key('shCloudOffConfirm')));
      await settle(tester);
      expect(rig.models.offCalls, 1);
      expect(find.text('Back to Anthropic'), findsOneWidget);
      expect(find.text('Needs a key'), findsOneWidget);
      expect(find.text('Add a Key'), findsOneWidget);
    });

    testWidgets(
      'a bot on Casama Cloud shows "Casama Cloud" and who pays, nothing to pick',
      (tester) async {
        await setSize(tester, const Size(900, 800));
        final rig = _Rig(state: connectedState());
        await tester.pumpWidget(
          rig.wrap(const Scaffold(body: CloudModelChip())),
        );
        await settle(tester);
        expect(find.text('Casama Cloud'), findsOneWidget);
        expect(find.text('Paid by Oliver HQ'), findsOneWidget);
      },
    );

    testWidgets('banner: members get the one-time notice, once', (
      tester,
    ) async {
      await setSize(tester, const Size(900, 800));
      final rig = _Rig(state: connectedState(canManage: false));
      await tester.pumpWidget(rig.wrap(const _BannerProbe()));
      await settle(tester);
      expect(
        find.text(
          'Messages to the model now pass through Casama Cloud, paid by Oliver HQ.',
        ),
        findsOneWidget,
      );
      await tester.tap(find.byKey(const Key('shCloudMemberNoticeOk')));
      await settle(tester);
      expect(find.byKey(const Key('shCloudMemberNotice')), findsNothing);
      expect(
        (await SharedPreferences.getInstance()).getBool(
          'casama.cloudModels.noticeSeen.http://localhost:8787',
        ),
        isTrue,
      );
    });

    testWidgets(
      'banner: a stop for everyone, the warning for admins, nothing when off',
      (tester) async {
        await setSize(tester, const Size(900, 800));
        final rig = _Rig(
          state: connectedState(
            statusError: (code: 'key_revoked', message: 'x'),
          ),
        );
        await tester.pumpWidget(rig.wrap(const _BannerProbe()));
        await settle(tester);
        expect(
          find.byKey(const Key('shCloudBanner-disconnected')),
          findsOneWidget,
        );
        expect(find.text('Reconnect'), findsOneWidget);
      },
    );

    testWidgets('banner: nothing in a build without the switch', (
      tester,
    ) async {
      await setSize(tester, const Size(900, 800));
      final rig = _Rig(
        state: connectedState(statusError: (code: 'key_revoked', message: 'x')),
      )..build = false;
      await tester.pumpWidget(rig.wrap(const _BannerProbe()));
      await settle(tester);
      expect(find.byType(CloudBanner), findsNothing);
    });
  });

  group('the state from the server (§13.3)', () {
    test('parses the GET shape, status included', () {
      final s = CloudModelsState.fromJson({
        'available': true,
        'connected': true,
        'can_manage': true,
        'payer': {'org_id': 'cw-1', 'name': 'Oliver HQ'},
        'status': {
          'scopes': ['models', 'push'],
          'payer': {'org_id': 'cw-1', 'name': 'Oliver HQ'},
          'plan': {'code': 'pro', 'name': 'Pro', 'paid': true},
          'models_allowed': true,
          'credits_usd': 1.5,
          'included': {'used_usd': 2, 'limit_usd': 20},
          'today': {
            'spend_usd': 0.25,
            'cap_usd': 5,
            'resets_at': '2026-11-27T00:00:00Z',
          },
          'seats': {'plan': 3, 'used': 2},
          'trial': {'remaining_usd': 0},
          'jobs': {
            'chat': 'deepseek/deepseek-v4.1-flash',
            'background': 'deepseek/deepseek-v4.1-flash',
          },
        },
        'policy': {'allowed': 'all', 'daily_usd_per_member': null},
        'fallback': {'to_own': true, 'from_own': false},
        'embedding': true,
        'me': {'allowed': true, 'today_usd': 0.1, 'limit_usd': null},
        'memory_reindex': {'done': 5, 'total': 10},
      });
      expect(s.connected, isTrue);
      expect(s.status!.includedShare, 0.1);
      expect(s.status!.jobs['chat'], 'deepseek/deepseek-v4.1-flash');
      expect(s.policy.everyone, isTrue);
      expect(s.fallback.toOwn, isTrue);
      expect(s.memoryReindex!.running, isTrue);
      expect(cloudStopOf(s), isNull);
    });

    test(
      'reads status_error, has_own_key and plan.ended the way the server sends them',
      () {
        Map<String, dynamic> base({
          Object? statusError,
          bool ownKey = false,
          bool ended = false,
        }) => {
          'available': true,
          'connected': true,
          'can_manage': true,
          'payer': {'org_id': 'cw-1', 'name': 'Oliver HQ'},
          'status': {
            'scopes': ['models'],
            'plan': {
              'code': 'free',
              'name': 'Free',
              'paid': false,
              'ended': ended,
            },
            'models_allowed': false,
            'credits_usd': 0,
            'included': null,
            'today': {'spend_usd': 0, 'cap_usd': null, 'resets_at': null},
            'seats': {'plan': null, 'used': 1},
            'trial': {'remaining_usd': 0},
            'jobs': {},
          },
          'policy': {'allowed': 'all', 'daily_usd_per_member': null},
          'fallback': {'to_own': false, 'from_own': false},
          'embedding': false,
          'me': {'allowed': true, 'today_usd': 0, 'limit_usd': null},
          'memory_reindex': null,
          'status_error': statusError,
          'has_own_key': ownKey,
        };
        final fine = CloudModelsState.fromJson(base(ownKey: true));
        expect(fine.statusError, isNull);
        expect(fine.hasOwnKey, isTrue);
        expect(cloudStopOf(fine), CloudStop.planRequired);
        expect(
          cloudStopOf(CloudModelsState.fromJson(base(ended: true))),
          CloudStop.planEnded,
        );
        final down = CloudModelsState.fromJson(
          base(
            statusError: {
              'code': 'upstream_unreachable',
              'message': "Casama Cloud can't be reached right now. Trying again.",
            },
          ),
        );
        expect(down.statusError?.code, 'upstream_unreachable');
        expect(cloudStopOf(down), CloudStop.unreachable);
        expect(
          cloudStopOf(
            CloudModelsState.fromJson(
              base(statusError: {'code': 'key_revoked', 'message': 'x'}),
            ),
          ),
          CloudStop.disconnected,
        );
      },
    );

    test('the virtual credential is not Casama Cloud\'s own key', () {
      expect(casamaCloudModelsCredentialId, isNot(casamaCloudCredentialId));
    });
  });
}

/// The banner as the license gate shows it.
class _BannerProbe extends ConsumerWidget {
  const _BannerProbe();
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    body:
        cloudModelsBanner(context, ref, () => context) ??
        const SizedBox.shrink(),
  );
}
