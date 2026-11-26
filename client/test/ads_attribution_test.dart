import 'package:casama/core/ads_attribution.dart';
import 'package:casama/core/analytics.dart';
import 'package:casama/core/backend.dart';
import 'package:casama/core/install_tracker.dart';
import 'package:casama/core/landing_labels.dart';
import 'package:casama/core/meta_sdk.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/privacy/privacy_screen.dart';
import 'package:casama/features/welcome/heard_from_step.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama_sdk/casama_sdk.dart'
    show Acquisition, AttributionStatus, HeardFrom;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';
import 'fake_unlockers.dart';

/// Records what would reach Meta's native SDK.
class FakeMetaDriver implements MetaSdkDriver {
  final calls = <String>[];
  @override
  Future<void> start() async => calls.add('start');
  @override
  Future<void> stop() async => calls.add('stop');
  @override
  Future<String?> anonymousId() async {
    calls.add('anonymousId');
    return 'XZ1234-abcd';
  }
}

/// Ads attribution in the app (docs/ADS-ATTRIBUTION-PLAN.md, Phases 1 and 3).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeMetaDriver driver;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    PackageInfo.setMockInitialValues(
      appName: 'Casama',
      packageName: 'ai.casama.app',
      version: '0.1.0',
      buildNumber: '99',
      buildSignature: '',
    );
    MetaSdk.reset();
    driver = FakeMetaDriver();
    MetaSdk.driver = driver;
    InstallTracker.reset();
    AdsAttribution.cloud = false;
    AdsAttribution.backend = null;
    await Analytics.setConsentEnabled(true);
  });

  group('Meta SDK gate', () {
    bool gate({
      bool officialBuild = true,
      bool hasKeys = true,
      bool cloud = true,
      bool isWeb = false,
      TargetPlatform platform = TargetPlatform.iOS,
      bool signedIn = true,
      bool? serverAllows = true,
      bool analyticsConsent = true,
      bool trackingAllowed = true,
    }) => metaSdkMayStart(
      officialBuild: officialBuild,
      hasKeys: hasKeys,
      cloud: cloud,
      isWeb: isWeb,
      platform: platform,
      signedIn: signedIn,
      serverAllows: serverAllows,
      analyticsConsent: analyticsConsent,
      trackingAllowed: trackingAllowed,
    );

    test('opens only when every gate is open, on iOS and Android', () {
      expect(gate(), isTrue);
      expect(gate(platform: TargetPlatform.android), isTrue);
    });

    test('stays shut when any gate is closed', () {
      expect(gate(hasKeys: false), isFalse, reason: 'no keys');
      expect(gate(officialBuild: false), isFalse, reason: 'not official');
      expect(gate(cloud: false), isFalse, reason: 'self-hosted server');
      expect(gate(isWeb: true), isFalse, reason: 'web');
      for (final p in [
        TargetPlatform.macOS,
        TargetPlatform.windows,
        TargetPlatform.linux,
        TargetPlatform.fuchsia,
      ]) {
        expect(gate(platform: p), isFalse, reason: '$p');
      }
      expect(gate(signedIn: false), isFalse, reason: 'signed out');
      expect(
        gate(serverAllows: false),
        isFalse,
        reason: 'server says no (region, switch off)',
      );
      expect(gate(serverAllows: null), isFalse, reason: 'no answer yet');
      expect(gate(analyticsConsent: false), isFalse, reason: 'usage data off');
    });

    test('iPhone and iPad need Allow in Apple\'s tracking prompt; Android has no such prompt (D-589)', () {
      expect(gate(trackingAllowed: false), isFalse);
      expect(
        gate(platform: TargetPlatform.android, trackingAllowed: false),
        isTrue,
      );
    });

    test('this test build has no Meta keys, so it can never start', () {
      expect(MetaConfig.hasKeys, isFalse);
      expect(MetaConfig.officialBuild, isFalse);
    });
  });

  group('MetaSdk', () {
    test('a closed gate never reaches the native SDK', () async {
      expect(await MetaSdk.apply(false), isNull);
      expect(await MetaSdk.apply(false), isNull);
      expect(driver.calls, isEmpty);
      expect(MetaSdk.running, isFalse);
    });

    test(
      'starts once, answers the anonymous id, and stops when the gate closes',
      () async {
        expect(await MetaSdk.apply(true), 'XZ1234-abcd');
        expect(await MetaSdk.apply(true), 'XZ1234-abcd');
        expect(driver.calls.where((c) => c == 'start'), hasLength(1));
        expect(MetaSdk.running, isTrue);
        expect(await MetaSdk.apply(false), isNull);
        expect(driver.calls.last, 'stop');
        expect(MetaSdk.running, isFalse);
      },
    );
  });

  group('install record', () {
    test('carries Meta\'s anonymous id only while the SDK runs', () async {
      final off = await AdsAttribution.collectInstallRecord(
        'abcdefgh12345678',
        'XZ1234-abcd',
        null,
      );
      expect(off.containsKey('meta_anon_id'), isFalse);
      expect(off['install_id'], 'abcdefgh12345678');
      expect(off['app_version'], '0.1.0+99');
      expect(off['app_package'], 'ai.casama.app');

      await MetaSdk.apply(true);
      final on = await AdsAttribution.collectInstallRecord(
        'abcdefgh12345678',
        'XZ1234-abcd',
        null,
      );
      expect(on['meta_anon_id'], 'XZ1234-abcd');
    });

    test('leaves out empty and out-of-range values', () {
      final body = installRecordBody(
        installId: 'abcdefgh12345678',
        platform: 'android',
        distribution: '',
        screenWidth: 1080,
        screenHeight: 99999,
        screenDensity: 2.75,
        cpuCores: 0,
        ga4AppInstanceId: 'not valid!',
        playReferrer: 'utm_source=meta&utm_medium=paid_social',
      );
      expect(body, {
        'install_id': 'abcdefgh12345678',
        'platform': 'android',
        'screen_width': 1080,
        'screen_density': 2.75,
        'play_referrer': 'utm_source=meta&utm_medium=paid_social',
      });
    });

    Future<FakeBackend> started() async {
      final backend = FakeBackend();
      await InstallTracker.start(
        cloud: true,
        send: (_) async {},
        prefs: await SharedPreferences.getInstance(),
        keychain: false,
        playReferrer: () async => null,
      );
      AdsAttribution.backend = backend;
      return backend;
    }

    Future<Map<String, Object?>> collect(
      String id,
      String? anon,
      String? tracking,
    ) async => {
      'install_id': id,
      'meta_anon_id': ?anon,
      'ios_tracking': ?tracking,
    };

    test('carries the iPhone\'s tracking answer, only for iOS and only known values (D-589)', () {
      Map<String, Object?> body(String platform, String? tracking) =>
          installRecordBody(
            installId: 'abcdefgh12345678',
            platform: platform,
            iosTracking: tracking,
          );
      expect(body('ios', 'authorized')['ios_tracking'], 'authorized');
      expect(body('ios', 'denied')['ios_tracking'], 'denied');
      expect(body('ios', 'not_determined')['ios_tracking'], 'not_determined');
      expect(body('ios', null).containsKey('ios_tracking'), isFalse);
      expect(body('ios', 'maybe').containsKey('ios_tracking'), isFalse);
      expect(body('android', 'authorized').containsKey('ios_tracking'), isFalse);
    });

    test('posts again when the tracking answer changes (D-589)', () async {
      final backend = await started();
      AdsAttribution.cloud = true;
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: null,
        iosTracking: 'not_determined',
        collect: collect,
      );
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: null,
        iosTracking: 'not_determined',
        collect: collect,
      );
      expect(backend.attributionInstalls, hasLength(1));
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: null,
        iosTracking: 'denied',
        collect: collect,
      );
      expect(backend.attributionInstalls, hasLength(2));
      expect(backend.attributionInstalls.last['ios_tracking'], 'denied');
    });

    test('posts once per sign-in, again when Meta\'s id appears, and again after signing out', () async {
      final backend = await started();
      AdsAttribution.cloud = true;
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: null,
        collect: collect,
      );
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: null,
        collect: collect,
      );
      expect(backend.attributionInstalls, hasLength(1));
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: 'XZ1234-abcd',
        collect: collect,
      );
      expect(backend.attributionInstalls, hasLength(2));
      expect(backend.attributionInstalls.last['meta_anon_id'], 'XZ1234-abcd');
      await AdsAttribution.signedOut();
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: 'XZ1234-abcd',
        collect: collect,
      );
      expect(backend.attributionInstalls, hasLength(3));
    });

    test('sends nothing off Casama Cloud or with usage data off', () async {
      final backend = await started();
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: null,
        collect: collect,
      );
      expect(backend.attributionInstalls, isEmpty);
      AdsAttribution.cloud = true;
      await Analytics.setConsentEnabled(false);
      await AdsAttribution.postInstall(
        userId: 'u1',
        metaAnonId: null,
        collect: collect,
      );
      expect(backend.attributionInstalls, isEmpty);
    });
  });

  test(
    'the buyer goes to the server before a purchase, only on Casama Cloud',
    () async {
      final backend = FakeBackend();
      AdsAttribution.backend = backend;
      await AdsAttribution.checkoutIntent(
        orgId: '11111111-1111-4111-8111-111111111111',
        productId: 'pro_month',
      );
      expect(backend.checkoutIntents, isEmpty);
      AdsAttribution.cloud = true;
      await AdsAttribution.checkoutIntent(
        orgId: '11111111-1111-4111-8111-111111111111',
        productId: 'pro_month',
      );
      expect(backend.checkoutIntents.single.productId, 'pro_month');
    },
  );

  test(
    'RevenueCat source fields come from the acquisition, never a Meta id',
    () {
      final fields = revenueCatSourceFields(
        Acquisition(
          source_: 'meta',
          medium: 'paid_social',
          campaign: 'cas_ios_trial_us-broad_202701',
          adSet: '120200000000001',
          ad: null,
          network: 'meta',
          kind: 'ad_click',
        ),
      );
      expect(fields, {
        r'$mediaSource': 'meta',
        r'$campaign': 'cas_ios_trial_us-broad_202701',
        r'$adGroup': '120200000000001',
      });
      expect(fields.containsKey(r'$fbAnonId'), isFalse);
    },
  );

  group('web landing labels', () {
    test('keeps the ad labels, the click id with when it was seen, and an outside referrer host', () {
      final uri = Uri.parse(
        'https://app.casama.ai/?utm_source=meta&utm_medium=paid_social&utm_campaign=c1&utm_id=9&utm_term=8&utm_content=7&fbclid=Ab_C-1&via=%2Fget',
      );
      final kept = landingLabelsFrom(
        uri,
        referrer: 'https://l.facebook.com/x?y=1',
        nowMs: 1700000000000,
      );
      expect(kept, {
        'utm_source': 'meta',
        'utm_medium': 'paid_social',
        'utm_campaign': 'c1',
        'utm_id': '9',
        'utm_term': '8',
        'utm_content': '7',
        'fbclid': 'Ab_C-1',
        'fbt': '1700000000000',
        'ref_host': 'l.facebook.com',
        'via': '/get',
      });
      final body = landingLabelsBody({...kept, 'landing': '/'})!;
      expect(body['fbclid_at'], 1700000000000);
      expect(body['landing'], '/');
      expect(body.containsKey('fbt'), isFalse);
    });

    test('casama.ai passes the first-seen time on; our own sites are never a referrer', () {
      final uri = Uri.parse(
        'https://app.casama.ai/?fbclid=abc&fbt=1690000000000',
      );
      final kept = landingLabelsFrom(
        uri,
        referrer: 'https://casama.ai/download',
        nowMs: 1700000000000,
      );
      expect(kept['fbt'], '1690000000000');
      expect(kept.containsKey('ref_host'), isFalse);
    });

    test('a bad click id is dropped and a plain visit keeps nothing', () {
      expect(
        landingLabelsFrom(
          Uri.parse('https://app.casama.ai/?fbclid=a%20b'),
          referrer: '',
          nowMs: 1,
        ),
        isEmpty,
      );
      expect(landingLabelsBody({'landing': '/'}), isNull);
    });
  });

  test('signed in on a build without Meta keys: the record goes, Meta never starts, even if allowed', () async {
    await InstallTracker.start(
      cloud: true,
      send: (_) async {},
      prefs: await SharedPreferences.getInstance(),
      keychain: false,
      playReferrer: () async => null,
    );
    AdsAttribution.cloud = true;
    final backend = FakeBackend()
      ..attribution = AttributionStatus(
        offered: true,
        measureAds: true,
        metaSdkAllowed: true,
        heardFromAsked: true,
        acquisition: null,
      );
    AdsAttribution.backend = backend;
    final container = ProviderContainer(
      overrides: [backendProvider.overrideWithValue(backend)],
    );
    addTearDown(container.dispose);
    container.listen(adsAttributionSyncProvider, (_, _) {});
    await container.read(attributionStatusProvider.future);
    for (var i = 0; i < 20 && backend.attributionInstalls.isEmpty; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(backend.attributionInstalls, hasLength(1));
    expect(
      backend.attributionInstalls.single.containsKey('meta_anon_id'),
      isFalse,
    );
    expect(driver.calls, isEmpty);
    // The server's answer is remembered for the next launch.
    expect(await AdsAttribution.savedMetaAllowed('me'), isTrue);
  });

  group('How did you hear about us?', () {
    Future<FakeBackend> pump(WidgetTester tester) async {
      await setSize(tester, const Size(800, 1000));
      final backend = FakeBackend();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [backendProvider.overrideWithValue(backend)],
          child: const MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: HeardFromStep(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      return backend;
    }

    testWidgets('a tap sends the answer', (tester) async {
      final backend = await pump(tester);
      await tester.tap(find.byKey(const Key('heardFrom_ai_assistant')));
      await tester.pumpAndSettle();
      expect(backend.heardFromAnswers, [HeardFrom.aiAssistant]);
    });

    testWidgets('Skip sends a null answer', (tester) async {
      final backend = await pump(tester);
      await tester.tap(find.byKey(const Key('heardFromSkip')));
      await tester.pumpAndSettle();
      expect(backend.heardFromAnswers, [null]);
    });

    test('only shows on a new account\'s first run, on Casama Cloud, while never asked', () async {
      AdsAttribution.cloud = true;
      final backend = FakeBackend()
        ..attribution = AttributionStatus(
          offered: false,
          measureAds: false,
          metaSdkAllowed: false,
          heardFromAsked: false,
          acquisition: null,
        );
      final container = ProviderContainer(
        overrides: [backendProvider.overrideWithValue(backend)],
      );
      addTearDown(container.dispose);
      container.listen(heardFromNeededProvider, (_, _) {});
      container.listen(attributionStatusProvider, (_, _) {});
      for (
        var i = 0;
        i < 50 && container.read(attributionStatusProvider).value == null;
        i++
      ) {
        await Future<void>.delayed(Duration.zero);
      }
      expect(
        container.read(attributionStatusProvider).value?.heardFromAsked,
        isFalse,
      );
      // Not a first run (an existing account): never asked.
      expect(container.read(heardFromNeededProvider), isFalse);
    });
  });

  group('Help measure our ads switch', () {
    Future<void> pump(WidgetTester tester, Backend backend) async {
      await setSize(tester, const Size(800, 1000));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            backendProvider.overrideWithValue(backend),
            unlockersProvider.overrideWithValue(FakeUnlockers()),
          ],
          child: const MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: PrivacyScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    testWidgets('is hidden where it isn\'t offered', (tester) async {
      AdsAttribution.cloud = true;
      await pump(tester, FakeBackend());
      expect(find.byKey(const Key('shareAnalyticsSwitch')), findsOneWidget);
      expect(find.byKey(const Key('measureAdsTile')), findsNothing);
    });

    testWidgets(
      'is hidden on a self-hosted server even if the server offered it',
      (tester) async {
        final backend = FakeBackend()
          ..attribution = AttributionStatus(
            offered: true,
            measureAds: true,
            metaSdkAllowed: true,
            heardFromAsked: true,
            acquisition: null,
          );
        await pump(tester, backend);
        expect(find.byKey(const Key('measureAdsTile')), findsNothing);
      },
    );

    testWidgets(
      'where offered, turns off and on through the server, and follows usage data',
      (tester) async {
        AdsAttribution.cloud = true;
        final backend = FakeBackend()
          ..attribution = AttributionStatus(
            offered: true,
            measureAds: true,
            metaSdkAllowed: true,
            heardFromAsked: true,
            acquisition: null,
          );
        await pump(tester, backend);
        final ads = find.byKey(const Key('measureAdsSwitch'));
        expect(tester.widget<Switch>(ads).value, isTrue);
        await tester.tap(ads);
        await tester.pumpAndSettle();
        expect(backend.adsMeasurementSets, [false]);
        expect(tester.widget<Switch>(ads).value, isFalse);
        await tester.tap(ads);
        await tester.pumpAndSettle();
        expect(backend.adsMeasurementSets, [false, true]);

        // Usage data off: the ads switch shows off and can't be turned on.
        await tester.tap(find.byKey(const Key('shareAnalyticsSwitch')));
        await tester.pumpAndSettle();
        expect(tester.widget<Switch>(ads).value, isFalse);
        expect(tester.widget<Switch>(ads).onChanged, isNull);
        await Analytics.setConsentEnabled(true);
      },
    );
  });
}
