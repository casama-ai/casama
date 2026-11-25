import 'dart:async';

import 'package:casama/app.dart';
import 'package:casama/core/admin_device_key.dart';
import 'package:casama/core/admin_security.dart';
import 'package:casama/core/backend.dart'
    show AuthMethods, PasskeyInfo, TwoStepFactor;
import 'package:casama/core/providers.dart';
import 'package:casama/core/router.dart' show routerProvider;
import 'package:casama/features/admin/admin_security_gate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'admin_quick_unlock_test.dart' show FakeDeviceKeys;
import 'fake_backend.dart';

/// Like Supabase: listing two-step factors refreshes the session, which the auth stream reports,
/// and the router re-runs its redirects for it.
class _RefreshingBackend extends FakeBackend {
  final _events = StreamController<bool>.broadcast();
  var factorLists = 0;

  @override
  Stream<bool> get signedInChanges => _events.stream;

  void tokenRefreshed() => _events.add(true);

  @override
  Future<List<TwoStepFactor>> twoStepFactors() async {
    factorLists++;
    tokenRefreshed();
    return super.twoStepFactors();
  }
}

/// Phones open the console with a push (Settings' `pushOnce`), which leaves the router's address
/// on the page below. The console must judge "left the console" by the page on top, not by the
/// address, or every router refresh after unlocking locks it again (the loop on Android, 2026-11-22).
void main() {
  late _RefreshingBackend backend;
  late GoRouter router;

  Future<void> openConsole(WidgetTester tester) async {
    tester.view.physicalSize = const Size(412, 915);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    backend = _RefreshingBackend()
      ..isOwner = true
      ..authMethodsValue = const AuthMethods(passkeys: true)
      ..passkeyList.add(
        PasskeyInfo(id: 'p1', name: 'Phone', createdAt: DateTime(2026)),
      )
      ..twoStep.add(
        TwoStepFactor(
          id: 'f1',
          name: 'Authenticator',
          createdAt: DateTime(2026),
        ),
      );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          backendProvider.overrideWithValue(backend),
          adminDeviceKeysProvider.overrideWithValue(FakeDeviceKeys(on: false)),
        ],
        child: const CasamaApp(),
      ),
    );
    await tester.pumpAndSettle();
    router = ProviderScope.containerOf(tester.element(find.byType(CasamaApp)))
        .read(routerProvider);
    unawaited(router.push('/settings/admin'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPasskey')), findsOneWidget);
  }

  Future<void> unlockWithPasskey(WidgetTester tester) async {
    await tester.tap(find.byKey(const Key('adminPasskey')));
    await tester.pumpAndSettle();
  }

  tearDown(AdminSecurity.forgetVerification);

  test('an unsigned Mac build has no screen-lock check (D-507)', () async {
    // Signed Mac builds (CASAMA_SIGNED_MAC, with the provisioning profile) keep a Secure Enclave
    // key; a local unsigned build can't, so it never offers one.
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    expect(await AdminDeviceKeys().available(), isFalse);
  });

  testWidgets('a passkey unlock opened by a push stays open', (tester) async {
    await openConsole(tester);
    // The address stays on the page below the pushed console.
    expect(
      router.routeInformationProvider.value.uri.path,
      isNot('/settings/admin'),
    );
    await unlockWithPasskey(tester);
    expect(backend.adminPasskeyChecks, 1);
    expect(AdminSecurity.isUnlocked?.call(), isTrue);
    expect(find.byType(AdminAuthentication), findsNothing);
    // The lock screen wasn't built again (its factor list refreshes the session).
    expect(backend.factorLists, 1);
  });

  testWidgets('a token refresh while open doesn\'t lock', (tester) async {
    await openConsole(tester);
    await unlockWithPasskey(tester);
    backend.tokenRefreshed();
    await tester.pumpAndSettle();
    expect(AdminSecurity.isUnlocked?.call(), isTrue);
    expect(find.byType(AdminAuthentication), findsNothing);
  });

  testWidgets('another page over the console still locks it', (tester) async {
    await openConsole(tester);
    await unlockWithPasskey(tester);
    unawaited(router.push('/settings/fold'));
    await tester.pumpAndSettle();
    expect(AdminSecurity.isUnlocked?.call(), isFalse);
    router.pop();
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPasskey')), findsOneWidget);
  });
}
