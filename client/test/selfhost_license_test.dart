// Self-hosted licenses in the app (docs/SELF-HOSTING-PLAN.md §6.4, §6.5, §11.5, §11.6): the free
// personal license during the one-click install, the server's license states (setup page, grace and
// expired banners), license error messages, server updates, and the admin console's license tab and
// Growth section.
import 'dart:async';
import 'dart:io';

import 'package:casama/core/cloud_account.dart';
import 'package:casama/core/license_errors.dart';
import 'package:casama/core/selfhost_api.dart';
import 'package:casama/core/widgets.dart';
import 'package:casama/features/admin/growth_tab.dart';
import 'package:casama/features/admin/selfhost_licenses_tab.dart';
import 'package:casama/features/selfhost/guided_setup.dart';
import 'package:casama/features/selfhost/local_server.dart';
import 'package:casama/features/selfhost/local_updates.dart';
import 'package:casama/features/selfhost/server_license.dart';
import 'package:casama/features/selfhost/setup_screen.dart';
import 'package:casama_selfhost/casama_selfhost.dart' as sh;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';
import 'fake_selfhost_api.dart';
import 'local_server_test.dart' show FakeInstaller, manifestFor;

/// Casama Cloud's email-code sign-in, scripted.
class _CloudAuth implements CloudLicenseAuth {
  final sent = <String>[];
  @override
  Future<void> sendCode(String email) async => sent.add(email);
  @override
  Future<CloudSession> verify(String email, String code) async => CloudSession('cloud-token-$code', email: email);
}

/// The installer as the server step sees it: the test sends its progress.
class _Manager extends LocalServerManager {
  _Manager(Directory home) : super(home: () async => home);
  StreamController<LocalServerProgress>? run;
  LicenseFetcher? license;
  @override
  Future<sh.DownloadEstimate?> estimate() async => null;
  @override
  Stream<LocalServerProgress> start({LicenseFetcher? license}) {
    this.license = license;
    return (run = StreamController<LocalServerProgress>()).stream;
  }
}

const _active = ServerLicenseStatus(licensing: true, state: 'active', edition: 'personal', instanceId: 'inst-1', engineVersion: '2026.11.26-c20edba');

Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 6; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('the free personal license during the install', () {
    late Directory home;
    setUp(() {
      home = Directory.systemTemp.createTempSync('casama-license');
      debugLocalServerOn = true;
    });
    tearDown(() {
      debugLocalServerOn = null;
      home.deleteSync(recursive: true);
    });

    Future<({_Manager manager, _CloudAuth auth, FakeBackend backend})> open(WidgetTester tester) async {
      await setSize(tester, const Size(900, 1000));
      final backend = FakeBackend()..signedIn = false;
      final manager = _Manager(home);
      final auth = _CloudAuth();
      await tester.pumpWidget(
        harness(
          backend,
          Scaffold(
            body: SingleChildScrollView(
              child: ServerStep(autoStart: false, onRunning: (_) {}, onDockerLost: () {}, onConnected: () {}),
            ),
          ),
          overrides: [localServerManagerProvider.overrideWithValue(manager), cloudLicenseAuthProvider.overrideWithValue(auth), cloudAccountStoreProvider.overrideWithValue(MemoryCloudAccountStore())],
        ),
      );
      await settle(tester);
      return (manager: manager, auth: auth, backend: backend);
    }

    testWidgets('signing in with Casama (admitted first) makes the personal key for the new install', (tester) async {
      final t = await open(tester);
      expect(find.byKey(const Key('setupLicense')), findsOneWidget);
      await tester.tap(find.byKey(const Key('setupLicenseSignIn')));
      await settle(tester);
      await tester.enterText(find.byKey(const Key('cloudSignInEmail')), 'ana@example.com');
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      // Cloud sign-up is invite-only: the address is let in before the code goes out.
      expect(t.backend.selfhost.admitted, ['ana@example.com']);
      expect(t.auth.sent, ['ana@example.com']);
      await tester.enterText(find.byKey(const Key('cloudSignInCode')), '123456');
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      expect(find.byKey(const Key('setupLicenseReady')), findsOneWidget);
      expect(find.textContaining('ana@example.com'), findsOneWidget);

      await tester.tap(find.byKey(const Key('setupStartServer')));
      await settle(tester);
      expect(t.manager.license, isNotNull);
      final key = await t.manager.license!('inst-9', '2026.11.26-c20edba');
      expect(key, 'personal-key-for-inst-9');
      expect(t.backend.selfhost.personalCalls.single, (token: 'cloud-token-123456', instanceId: 'inst-9', engineVersion: '2026.11.26-c20edba'));
      await t.manager.run!.close();
    });

    testWidgets('a disposable address is refused with the server\'s words and no code is sent', (tester) async {
      final t = await open(tester);
      t.backend.selfhost.admitError = 'disposable_email';
      await tester.tap(find.byKey(const Key('setupLicenseSignIn')));
      await settle(tester);
      await tester.enterText(find.byKey(const Key('cloudSignInEmail')), 'x@mailinator.com');
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      expect(find.text('That email address can\'t be used.'), findsOneWidget);
      expect(t.auth.sent, isEmpty);
      expect(find.byKey(const Key('cloudSignInCode')), findsNothing);
    });

    testWidgets('skipping installs without a key (the server starts in its setup state)', (tester) async {
      final t = await open(tester);
      await tester.tap(find.byKey(const Key('setupLicenseSkip')));
      await settle(tester);
      expect(find.byKey(const Key('setupLicenseSkipped')), findsOneWidget);
      await tester.tap(find.byKey(const Key('setupStartServer')));
      await settle(tester);
      expect(t.manager.license, isNull);
      await t.manager.run!.close();
    });
  });

  group('the server\'s license state', () {
    Future<FakeBackend> open(WidgetTester tester, ServerLicenseStatus status, {Size size = const Size(900, 900)}) async {
      await setSize(tester, size);
      final backend = FakeBackend()..selfhost.current = status;
      await tester.pumpWidget(harness(backend, const SelfhostLicenseGate(child: Scaffold(body: Text('the app')))));
      await settle(tester);
      return backend;
    }

    testWidgets('Casama Cloud and active servers show nothing new', (tester) async {
      await open(tester, ServerLicenseStatus.off);
      expect(find.text('the app'), findsOneWidget);
      expect(find.byKey(const Key('serverLicenseScreen')), findsNothing);
      await open(tester, _active);
      for (final k in ['serverLicenseScreen', 'licenseGraceBanner', 'licenseExpiredBanner', 'localUpdateBanner']) {
        expect(find.byKey(Key(k)), findsNothing, reason: k);
      }
    });

    testWidgets('setup: the personal license from a Casama account, set on the server', (tester) async {
      final backend = await open(tester, const ServerLicenseStatus(licensing: true, state: 'setup', instanceId: 'inst-1', engineVersion: '2026.11.26-c20edba'));
      final auth = _CloudAuth();
      await tester.pumpWidget(const SizedBox());
      await tester.pumpWidget(
        harness(
          backend,
          const SelfhostLicenseGate(child: Scaffold(body: Text('the app'))),
          overrides: [cloudLicenseAuthProvider.overrideWithValue(auth), cloudAccountStoreProvider.overrideWithValue(MemoryCloudAccountStore())],
        ),
      );
      await settle(tester);
      expect(find.byKey(const Key('serverLicenseScreen')), findsOneWidget);
      expect(find.text('Get your free personal license'), findsOneWidget);
      expect(find.textContaining('partners@casama.ai'), findsOneWidget);
      expect(find.textContaining(r'$29 per active user'), findsOneWidget);
      await tester.tap(find.byKey(const Key('licensePersonal')));
      await settle(tester);
      await tester.enterText(find.byKey(const Key('cloudSignInEmail')), 'ana@example.com');
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      await tester.enterText(find.byKey(const Key('cloudSignInCode')), '654321');
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      expect(backend.selfhost.personalCalls.single.instanceId, 'inst-1');
      expect(backend.selfhost.setKeys, ['personal-key-for-inst-1']);
      // Licensed: the cover goes away and the app is there.
      expect(find.byKey(const Key('serverLicenseScreen')), findsNothing);
      expect(find.text('the app'), findsOneWidget);
    });

    testWidgets('setup: the cover paints its own background, so the screen under it never shows through', (tester) async {
      await open(tester, const ServerLicenseStatus(licensing: true, state: 'setup', instanceId: 'inst-1'));
      final screen = find.byKey(const Key('serverLicenseScreen'));
      expect(screen, findsOneWidget);
      // The theme's pages are transparent; the wallpaper under the license screen is what hides
      // the app (on the one-click install, the setup steps) below the cover.
      expect(find.ancestor(of: screen, matching: find.byKey(const Key('serverLicenseCover'))), findsOneWidget);
      expect(find.descendant(of: find.byKey(const Key('serverLicenseCover')), matching: find.text('the app')), findsNothing);
    });

    testWidgets('setup: a pasted business key, and a refused one says why', (tester) async {
      final backend = await open(tester, const ServerLicenseStatus(licensing: true, state: 'setup', instanceId: 'inst-1'));
      backend.selfhost.setLicenseError = 'invalid_license';
      await tester.enterText(find.byKey(const Key('licenseBusinessKey')), 'eyJ.bad');
      await tester.pump();
      await tester.tap(find.byKey(const Key('licenseBusinessSave')));
      await settle(tester);
      expect(find.text('That key was refused.'), findsWidgets);
      expect(find.byKey(const Key('serverLicenseScreen')), findsOneWidget);
      backend.selfhost.setLicenseError = null;
      backend.selfhost.afterSet = (_) => const ServerLicenseStatus(licensing: true, state: 'active', edition: 'business', seats: 25);
      await tester.tap(find.byKey(const Key('licenseBusinessSave')));
      await settle(tester);
      expect(backend.selfhost.setKeys, ['eyJ.bad']);
      expect(find.byKey(const Key('serverLicenseScreen')), findsNothing);
    });

    testWidgets('grace: a banner with the date that can be hidden, and Renew', (tester) async {
      await open(
        tester,
        ServerLicenseStatus(licensing: true, state: 'grace', edition: 'personal', instanceId: 'inst-1', graceUntil: DateTime(2026, 12, 10, 12)),
      );
      expect(find.byKey(const Key('licenseGraceBanner')), findsOneWidget);
      expect(find.textContaining('Bots keep running until'), findsOneWidget);
      expect(find.textContaining('2026'), findsOneWidget);
      expect(find.text('the app'), findsOneWidget);
      await tester.tap(find.byKey(const Key('licenseRenew')));
      await settle(tester);
      expect(find.byKey(const Key('renewLicenseSheet')), findsOneWidget);
      await tester.tapAt(const Offset(5, 5));
      await settle(tester);
      await tester.tap(find.byKey(const Key('licenseGraceHide')));
      await settle(tester);
      expect(find.byKey(const Key('licenseGraceBanner')), findsNothing);
    });

    testWidgets('expired: new bot runs are paused, data is safe, Renew', (tester) async {
      await open(
        tester,
        const ServerLicenseStatus(licensing: true, state: 'expired', edition: 'personal', instanceId: 'inst-1'),
        size: const Size(390, 844),
      );
      expect(find.byKey(const Key('licenseExpiredBanner')), findsOneWidget);
      expect(find.textContaining('new bot runs are paused'), findsOneWidget);
      expect(find.textContaining('Your data is safe'), findsOneWidget);
      expect(find.byKey(const Key('licenseGraceHide')), findsNothing);
      expect(find.byKey(const Key('licenseRenew')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a license error reads the state again', (tester) async {
      final backend = await open(tester, _active);
      final before = backend.selfhost.statusCalls;
      licenseRecheck.value++;
      await settle(tester);
      expect(backend.selfhost.statusCalls, before + 1);
    });
  });

  group('license errors', () {
    Future<BuildContext> context(WidgetTester tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        harness(
          FakeBackend(),
          Scaffold(
            body: Builder(
              builder: (c) {
                ctx = c;
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      return ctx;
    }

    testWidgets('each code has plain words, and none opens the paywall', (tester) async {
      final c = await context(tester);
      expect(errorText(c, problem(402, 'license_required', 'x')), contains('needs a license first'));
      expect(errorText(c, problem(402, 'license_seats', 'x')), allOf(contains('Business license'), contains('partners@casama.ai')));
      expect(errorText(c, problem(402, 'license_expired', 'x')), allOf(contains('new bot runs are paused'), contains('data is safe')));
      expect(errorText(c, problem(402, 'plan_limit', 'Your plan allows 3 bots.')), 'Your plan allows 3 bots.');
      String? paywalled;
      onPaymentRequired = (_, message) async => paywalled = message;
      addTearDown(() => onPaymentRequired = null);
      await runGuarded(c, () async => throw problem(402, 'license_seats', 'x'));
      await tester.pump(const Duration(seconds: 5));
      expect(paywalled, isNull);
      await runGuarded(c, () async => throw problem(402, 'plan_limit', 'Your plan allows 3 bots.'));
      expect(paywalled, 'Your plan allows 3 bots.');
      await tester.pump(const Duration(seconds: 5));
    });
  });

  group('server updates', () {
    late Directory home;
    late FakeInstaller installer;
    setUp(() {
      home = Directory.systemTemp.createTempSync('casama-update');
      installer = FakeInstaller();
      debugLocalServerOn = true;
      selfhostAppBuild = () async => 104;
    });
    tearDown(() {
      debugLocalServerOn = null;
      updateClock = DateTime.now;
      home.deleteSync(recursive: true);
    });

    test('a newer release is newer by its day, and the same one never is', () {
      expect(isNewerRelease('2026.12.1-abcdef0', '2026.11.26-c20edba'), isTrue);
      expect(isNewerRelease('2026.11.26-c20edba', '2026.11.26-c20edba'), isFalse);
      expect(isNewerRelease('2026.11.25-abcdef0', '2026.11.26-c20edba'), isFalse);
      expect(isNewerRelease('2026.11.26-1111111', '2026.11.26-c20edba'), isTrue);
    });

    Future<({ProviderContainer c, LocalServerManager m, List<String> asked})> setUpInstall(String latest, {int minAppBuild = 0}) async {
      final asked = <String>[];
      var installing = true;
      final m = LocalServerManager(
        installer: installer,
        home: () async => home,
        manifestSource: () async {
          if (installing) return manifestFor('2026.11.26-c20edba');
          asked.add(latest);
          return manifestFor(latest, minAppBuild: minAppBuild);
        },
        portFree: (_) async => true,
        runner: _OkRunner(),
      );
      await m.start().toList();
      installing = false;
      final c = ProviderContainer(overrides: [localServerManagerProvider.overrideWithValue(m), usingLocalServerProvider.overrideWith((ref) async => true)]);
      addTearDown(c.dispose);
      return (c: c, m: m, asked: asked);
    }

    test('offered once a day when newer, not when "Later" or when the app is too old', () async {
      final t = await setUpInstall('2026.12.1-abcdef0');
      final offered = await t.c.read(localUpdateProvider.future);
      expect(offered?.version, '2026.12.1-abcdef0');
      expect(t.asked, hasLength(1));
      // Within the day the saved release is used, not the network.
      t.c.invalidate(localUpdateProvider);
      expect((await t.c.read(localUpdateProvider.future))?.version, '2026.12.1-abcdef0');
      expect(t.asked, hasLength(1));
      updateClock = () => DateTime.now().add(const Duration(days: 1, minutes: 1));
      t.c.invalidate(localUpdateProvider);
      await t.c.read(localUpdateProvider.future);
      expect(t.asked, hasLength(2));
      await t.c.read(localUpdateProvider.notifier).later('2026.12.1-abcdef0');
      t.c.invalidate(localUpdateProvider);
      expect(await t.c.read(localUpdateProvider.future), isNull);

      final old = await setUpInstall('2026.12.2-abcdef0', minAppBuild: 200);
      SharedPreferences.setMockInitialValues({});
      expect(await old.c.read(localUpdateProvider.future), isNull, reason: 'needs app build 200');
    });

    testWidgets('Update runs with progress; a failed one says it went back', (tester) async {
      final m = LocalServerManager(
        installer: installer,
        home: () async => home,
        manifestSource: () async => manifestFor('2026.11.26-c20edba'),
        portFree: (_) async => true,
        runner: _OkRunner(),
      );
      await tester.runAsync(() => m.start().toList());
      await setSize(tester, const Size(900, 900));
      Future<void> run(String version) async {
        await tester.pumpWidget(const SizedBox());
        await tester.pumpWidget(
          harness(
            FakeBackend(),
            Scaffold(body: LocalUpdateSheet(manifest: manifestFor(version))),
            overrides: [localServerManagerProvider.overrideWithValue(m)],
          ),
        );
        await tester.tap(find.byKey(const Key('localUpdateRun')));
        await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 200)));
        await settle(tester);
      }

      await run('2026.12.1-abcdef0');
      expect(find.byKey(const Key('localUpdateDone')), findsOneWidget);
      expect(installer.updates, ['2026.12.1-abcdef0']);

      installer.updateFails = 'update_rolled_back';
      await run('2026.12.2-1234567');
      expect(find.byKey(const Key('localUpdateRolledBack')), findsOneWidget);
      expect(find.textContaining('went back to the version it had'), findsOneWidget);
      expect(find.textContaining('database backup'), findsWidgets);
    });

    testWidgets('the banner offers the update for the server this app installed', (tester) async {
      final release = manifestFor('2026.12.1-abcdef0');
      await setSize(tester, const Size(900, 900));
      await tester.pumpWidget(
        harness(
          FakeBackend(),
          const SelfhostLicenseGate(child: Scaffold(body: Text('the app'))),
          overrides: [localUpdateProvider.overrideWith(() => _Offer(release))],
        ),
      );
      await settle(tester);
      expect(find.byKey(const Key('localUpdateBanner')), findsOneWidget);
      expect(find.textContaining('2026.12.1-abcdef0'), findsOneWidget);
      await tester.tap(find.byKey(const Key('localUpdateLater')));
      await settle(tester);
      expect(find.byKey(const Key('localUpdateBanner')), findsNothing);
    });
  });

  group('admin', () {
    final rows = [
      LicenseRecord(
        id: '11111111-1111-4111-8111-111111111111',
        edition: 'personal',
        email: 'ana@example.com',
        instanceId: 'aaaaaaaa-1111-4111-8111-111111111111',
        engineVersion: '2026.11.26-c20edba',
        lastCheckinAt: DateTime.now().subtract(const Duration(hours: 2)),
        members: 1,
        bots: 4,
      ),
      const LicenseRecord(
        id: '22222222-2222-4222-8222-222222222222',
        edition: 'business',
        customer: 'Acme',
        email: 'it@acme.test',
        seats: 25,
        members: 12,
        bots: 30,
      ),
      const LicenseRecord(id: '33333333-3333-4333-8333-333333333333', edition: 'trial', email: 'bo@example.com', revoked: true),
    ];

    testWidgets('the license list: search by email, filter by edition, revoke with a confirm', (tester) async {
      await setSize(tester, const Size(1300, 900));
      final backend = FakeBackend();
      backend.selfhost.rows = rows;
      await tester.pumpWidget(harness(backend, const Scaffold(body: SelfhostLicensesTab())));
      await tester.pumpAndSettle();
      expect(find.text('ana@example.com'), findsWidgets);
      expect(find.text('Acme'), findsWidgets);
      expect(find.text('2026.11.26-c20edba'), findsOneWidget);
      expect(find.text('Revoked'), findsWidgets);

      final search = find.descendant(of: find.byKey(const Key('adminSelfhostSearch')), matching: find.byType(TextField));
      await tester.enterText(search, 'acme');
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();
      expect(backend.selfhost.queries.last.query, 'acme');
      expect(find.text('ana@example.com'), findsNothing);
      expect(find.text('Acme'), findsWidgets);

      await tester.enterText(search, '');
      await tester.pump(const Duration(milliseconds: 400));
      await tester.tap(find.descendant(of: find.byKey(const Key('adminSelfhostEdition')), matching: find.text('Personal')).first);
      await tester.pumpAndSettle();
      expect(backend.selfhost.queries.last.edition, 'personal');
      expect(find.text('Acme'), findsNothing);

      await tester.tap(find.byType(PopupMenuButton<int>).first);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('revokeLicense-${rows.first.id}')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('confirmRevokeLicense')));
      await tester.pumpAndSettle();
      expect(backend.selfhost.revoked, [rows.first.id]);
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('a business key: customer, email, seats, features, offline; shown once with Copy', (tester) async {
      await setSize(tester, const Size(1300, 1000));
      final backend = FakeBackend();
      String? copied;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (call) async {
        if (call.method == 'Clipboard.setData') copied = (call.arguments as Map)['text'] as String?;
        return null;
      });
      addTearDown(() => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, null));
      await tester.pumpWidget(harness(backend, const Scaffold(body: SelfhostLicensesTab())));
      await tester.pumpAndSettle();
      expect(find.text('No licenses yet.'), findsOneWidget);
      await tester.tap(find.byKey(const Key('adminSelfhostCreate')));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('licenseCustomer')), 'Acme');
      await tester.enterText(find.byKey(const Key('licenseEmail')), 'it@acme.test');
      await tester.enterText(find.byKey(const Key('licenseSeats')), '25');
      await tester.tap(find.byKey(const Key('licenseFeature-sso')));
      await tester.tap(find.byKey(const Key('licenseOffline')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('adminSelfhostCreateSubmit')));
      await tester.pumpAndSettle();
      final made = backend.selfhost.created.single;
      expect((made.customer, made.email, made.seats, made.offline), ('Acme', 'it@acme.test', 25, true));
      expect(made.features, ['sso']);
      expect(made.expiresAt.isAfter(DateTime.now().add(const Duration(days: 360))), isTrue);
      expect(find.byKey(const Key('licenseKeyValue')), findsOneWidget);
      expect(find.text('eyJbusiness.key.1'), findsOneWidget);
      await tester.tap(find.byKey(const Key('copyLicenseKey')));
      await tester.pump();
      expect(copied, 'eyJbusiness.key.1');
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('Growth: daily active servers, editions, versions, installs, lapsed, members and bots', (tester) async {
      await setSize(tester, const Size(1200, 2400));
      final backend = FakeBackend();
      backend.selfhost.stats = SelfhostServerStats(
        dailyActive: [for (var d = 1; d <= 30; d++) LicenseDayCount('2026-11-${'$d'.padLeft(2, '0')}', d)],
        newInstalls: const [LicenseDayCount('2026-11-25', 3), LicenseDayCount('2026-11-26', 4)],
        active24h: 30,
        byEdition: const [LicenseEditionCount('personal', active: 25, total: 40), LicenseEditionCount('business', active: 5, total: 6)],
        byEngineVersion: const [(version: '2026.11.26-c20edba', servers: 28), (version: '2026.11.20-aaaaaaa', servers: 2)],
        lapsed: 7,
        members: 61,
        bots: 140,
      );
      await tester.pumpWidget(harness(backend, const Scaffold(body: SingleChildScrollView(child: SelfhostGrowthSection()))));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('growthSelfhost')), findsOneWidget);
      expect(find.byKey(const Key('growthSelfhostDaily')), findsOneWidget);
      for (final text in [
        'Active servers (24 h)',
        '30',
        'New installs (30 days)',
        '7',
        '61',
        '140',
        '25 active of 40',
        '5 active of 6',
        '2026.11.26-c20edba',
        '28 servers',
        '2 servers',
      ]) {
        expect(find.text(text), findsWidgets, reason: text);
      }
      expect(tester.takeException(), isNull);
    });

    testWidgets('Growth hides the section where Cloud issues no licenses', (tester) async {
      final backend = FakeBackend()..selfhost = _NoStats();
      await tester.pumpWidget(harness(backend, const Scaffold(body: SelfhostGrowthSection())));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('growthSelfhost')), findsNothing);
    });
  });
}

class _OkRunner implements ProcessRunner {
  @override
  Future<ProcessResult> run(String exe, List<String> args, {String? cwd}) async => ProcessResult(1, 0, '', '');
  @override
  Future<Process> start(String exe, List<String> args, {String? cwd}) => throw UnimplementedError();
}

class _Offer extends LocalUpdateNotifier {
  _Offer(this.release);
  final sh.SelfhostManifest release;
  @override
  Future<sh.SelfhostManifest?> build() async => release;
}

class _NoStats extends FakeSelfhostApi {
  @override
  Future<SelfhostServerStats> adminStats() async => throw problem(404, 'licensing_off', 'Licensing is off.');
}
