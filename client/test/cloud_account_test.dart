// The Casama Cloud account kept on a device that uses a self-hosted server
// (docs/SELFHOST-CLOUD-MODELS-PLAN.md §7.2, §7.4.1): the license sign-in keeps the session, the
// session refreshes, and Settings shows who is signed in with sign out and delete account.
import 'package:casama/core/cloud_account.dart';
import 'package:casama/core/selfhost_api.dart';
import 'package:casama/features/selfhost/server_license.dart';
import 'package:casama/features/settings/settings_screen.dart';
import 'package:casama_sdk/casama_sdk.dart' show AuthException, AuthSession;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'cloud_models_fakes.dart';
import 'fake_backend.dart';

class _Auth implements CloudLicenseAuth {
  @override
  Future<void> sendCode(String email) async {}
  @override
  Future<CloudSession> verify(String email, String code) async {
    final s = cloudSessionFor(email);
    return CloudSession(s.accessToken, email: email, session: s);
  }
}

class _Refresher implements CloudSessionRefresher {
  _Refresher({this.refuse = false});
  final bool refuse;
  var calls = 0;
  @override
  Future<AuthSession> refresh(String refreshToken) async {
    calls++;
    if (refuse) throw AuthException('invalid refresh token', statusCode: 400);
    return cloudSessionFor('oliver@example.test');
  }
}

Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 8; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

class _SignInProbe extends ConsumerWidget {
  const _SignInProbe();
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    body: TextButton(
      key: const Key('go'),
      onPressed: () => cloudSession(context, ref),
      child: const Text('go'),
    ),
  );
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets(
    'the license sign-in keeps the Cloud session, so the next ask needs no code',
    (tester) async {
      await setSize(tester, const Size(900, 1200));
      final store = MemoryCloudAccountStore();
      final backend = FakeBackend()
        ..selfhost.current = const ServerLicenseStatus(
          licensing: true,
          state: 'setup',
          instanceId: 'i',
        );
      await tester.pumpWidget(
        harness(
          backend,
          const _SignInProbe(),
          overrides: [
            cloudAccountStoreProvider.overrideWithValue(store),
            cloudLicenseAuthProvider.overrideWithValue(_Auth()),
          ],
        ),
      );
      await tester.tap(find.byKey(const Key('go')));
      await settle(tester);
      await tester.enterText(
        find.byKey(const Key('cloudSignInEmail')),
        'oliver@example.test',
      );
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      await tester.enterText(
        find.byKey(const Key('cloudSignInCode')),
        '123456',
      );
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      expect((await store.load())?.email, 'oliver@example.test');
      // Asked again: no sheet.
      await tester.tap(find.byKey(const Key('go')));
      await settle(tester);
      expect(find.byKey(const Key('cloudSignInEmail')), findsNothing);
    },
  );

  test(
    'an expiring session refreshes once; a refused refresh forgets it',
    () async {
      final store = MemoryCloudAccountStore(
        cloudSessionFor('oliver@example.test', expired: true),
      );
      final ok = _Refresher();
      final c = ProviderContainer(
        overrides: [
          cloudAccountStoreProvider.overrideWithValue(store),
          cloudSessionRefresherProvider.overrideWithValue(ok),
        ],
      );
      addTearDown(c.dispose);
      final n = c.read(cloudAccountProvider.notifier);
      await c.read(cloudAccountProvider.future);
      final both = await Future.wait([n.fresh(), n.fresh()]);
      expect(ok.calls, 1);
      expect(both.every((s) => s != null && !s.isExpired), isTrue);

      final store2 = MemoryCloudAccountStore(
        cloudSessionFor('oliver@example.test', expired: true),
      );
      final c2 = ProviderContainer(
        overrides: [
          cloudAccountStoreProvider.overrideWithValue(store2),
          cloudSessionRefresherProvider.overrideWithValue(
            _Refresher(refuse: true),
          ),
        ],
      );
      addTearDown(c2.dispose);
      await c2.read(cloudAccountProvider.future);
      expect(await c2.read(cloudAccountProvider.notifier).fresh(), isNull);
      expect(await store2.load(), isNull);
    },
  );

  test('a Cloud refusal reads as words, never a code', () {
    expect(
      cloudErrorOf(
        const CloudError('plan_required', 'Casama Cloud needs a plan.'),
      )?.message,
      'Casama Cloud needs a plan.',
    );
    expect(cloudErrorOf(StateError('x')), isNull);
  });

  group('Settings → Casama Cloud account', () {
    Future<(MemoryCloudAccountStore, FakeCloudApi)> open(
      WidgetTester tester, {
      bool kept = true,
    }) async {
      await setSize(tester, const Size(500, 4000));
      final store = MemoryCloudAccountStore(
        kept ? cloudSessionFor('oliver@example.test') : null,
      );
      final cloud = FakeCloudApi();
      await tester.pumpWidget(
        harness(
          FakeBackend(),
          const SettingsScreen(),
          overrides: [
            cloudAccountStoreProvider.overrideWithValue(store),
            cloudApiProvider.overrideWithValue(cloud),
          ],
        ),
      );
      await settle(tester);
      return (store, cloud);
    }

    testWidgets('hidden when no Cloud session is kept', (tester) async {
      await open(tester, kept: false);
      expect(find.text('Casama Cloud account'), findsNothing);
      expect(find.byKey(const Key('cloudAccountRow')), findsNothing);
    });

    testWidgets('who is signed in, and sign out forgets it on this device', (
      tester,
    ) async {
      final (store, _) = await open(tester);
      expect(find.text('Casama Cloud account'), findsOneWidget);
      expect(find.text('Signed in as oliver@example.test'), findsOneWidget);
      await tester.ensureVisible(find.byKey(const Key('cloudAccountSignOut')));
      await tester.tap(find.byKey(const Key('cloudAccountSignOut')));
      await settle(tester);
      await tester.tap(find.text('Sign Out of Casama Cloud').last);
      await settle(tester);
      expect(await store.load(), isNull);
      expect(find.byKey(const Key('cloudAccountRow')), findsNothing);
    });

    testWidgets(
      'delete account: type the email, Cloud deletes it, the session goes',
      (tester) async {
        final (store, cloud) = await open(tester);
        await tester.ensureVisible(find.byKey(const Key('cloudAccountDelete')));
        await tester.tap(find.byKey(const Key('cloudAccountDelete')));
        await settle(tester);
        final confirm = find.byKey(const Key('cloudAccountConfirmDelete'));
        // Not before the email is typed.
        await tester.tap(confirm, warnIfMissed: false);
        await settle(tester);
        expect(cloud.deleted, isEmpty);
        await tester.enterText(
          find.byKey(const Key('cloudAccountConfirmEmail')),
          'oliver@example.test',
        );
        await tester.pump();
        await tester.tap(confirm);
        await settle(tester);
        expect(cloud.deleted, ['oliver@example.test']);
        expect(await store.load(), isNull);
        expect(find.byKey(const Key('cloudAccountDeleted')), findsOneWidget);
      },
    );
  });
}
