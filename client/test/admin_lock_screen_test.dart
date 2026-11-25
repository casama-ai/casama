import 'package:casama/core/admin_security.dart';
import 'package:casama/features/admin/admin_security_gate.dart';
import 'package:casama/ui/otp_code_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_quick_unlock_test.dart'
    show FakeDeviceKeys, passkeyBackend, pumpGate;
import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// The redesigned lock screen (docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §4): one way at a time.

class _TwoStepAfterPassword extends FakeBackend {
  @override
  Future<void> signIn(String email, String password) async {
    await super.signIn(email, password);
    twoStepCodeNeeded = true;
  }
}

class _WrongPassword extends FakeBackend {
  @override
  Future<void> signIn(String email, String password) async =>
      throw Exception('Invalid login credentials');
}

Finder _method(String name) => find.byKey(Key('adminMethod-$name'));

String _typed(WidgetTester tester, String key) => tester
    .widget<EditableText>(
      find.descendant(
        of: find.byKey(Key(key)),
        matching: find.byType(EditableText),
      ),
    )
    .controller
    .text;

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  tearDown(() {
    AdminSecurity.forgetVerification();
    AdminSecurity.codeSentTo = null;
    AdminSecurity.codeSentAt = null;
    AdminSecurity.systemSheets = 0;
    AdminAuthentication.lastAutoDevice = null;
    AdminAuthentication.tipDismissed = false;
  });

  testWidgets('a PIN shows dots, not its digits', (tester) async {
    final pin = TextEditingController(text: '4829');
    addTearDown(pin.dispose);
    await tester.pumpWidget(
      harness(
        FakeBackend(),
        Scaffold(body: OtpCodeField(controller: pin, obscure: true)),
      ),
    );
    await tester.pumpAndSettle();
    for (final d in ['4', '8', '2', '9']) {
      expect(find.text(d), findsNothing);
    }
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.autofillHints, isNull);
  });

  testWidgets('the switcher lists only the ways this account has here', (
    tester,
  ) async {
    await pumpGate(tester, FakeBackend());
    expect(_method('password'), findsOneWidget);
    expect(_method('email'), findsOneWidget);
    expect(_method('device'), findsNothing);
    expect(_method('passkey'), findsNothing);
    expect(_method('pin'), findsNothing);
    // Password is the way in when nothing stronger is set up.
    expect(find.byKey(const Key('adminPassword')), findsOneWidget);
    expect(find.text('Unlock the admin console'), findsOneWidget);
    expect(find.text('t•••@example.com'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());

    final backend = passkeyBackend()..adminPin = '482913';
    await pumpGate(tester, backend);
    for (final m in ['passkey', 'pin', 'password', 'email']) {
      expect(_method(m), findsOneWidget, reason: m);
    }
    expect(_method('device'), findsNothing);
    // The strongest opens first, alone.
    expect(find.byKey(const Key('adminPasskey')), findsOneWidget);
    expect(find.byKey(const Key('adminPin')), findsNothing);
    expect(find.byKey(const Key('adminPassword')), findsNothing);
    await tester.tap(_method('pin'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPin')), findsOneWidget);
    expect(find.byKey(const Key('adminPasskey')), findsNothing);
    // "Forgot it?" moves on to the password, and from there to an email code.
    await tester.tap(find.byKey(const Key('adminPinForgot')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPassword')), findsOneWidget);
    await tester.tap(find.byKey(const Key('adminPasswordForgot')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminSendCode')), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());

    final keys = FakeDeviceKeys(enrolledFor: backend.userId)..answer = null;
    await pumpGate(tester, FakeBackend(), keys: keys);
    expect(_method('device'), findsOneWidget);
    expect(find.byKey(const Key('adminUnlockDevice')), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('a confirmation that can\'t take the PIN leaves it out', (
    tester,
  ) async {
    late BuildContext screen;
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpWidget(
      harness(
        FakeBackend()..adminPin = '482913',
        Builder(
          builder: (context) {
            screen = context;
            return const Text('chat');
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    final answer = showAdminConfirmation(screen, allowPin: false);
    await tester.pumpAndSettle();
    expect(_method('pin'), findsNothing);
    expect(find.byKey(const Key('adminPassword')), findsOneWidget);
    // Compact: the dialog's title says it, so no big header.
    expect(find.text('Unlock the admin console'), findsNothing);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(await answer, isFalse);
  });

  testWidgets('the way this account used last opens first on this device', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      AdminAuthentication.methodPrefKey('me'): 'pin',
    });
    final backend = passkeyBackend()..adminPin = '482913';
    await pumpGate(tester, backend);
    // The passkey is stronger, but the PIN is what this account used here last.
    expect(find.byKey(const Key('adminPin')), findsOneWidget);
    expect(find.byKey(const Key('adminPasskey')), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());

    // A password unlock is remembered for next time.
    await pumpGate(tester, backend);
    await tester.tap(_method('password'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('adminPassword')), 'pw');
    await tester.tap(find.byKey(const Key('adminUnlockPassword')));
    await tester.pumpAndSettle();
    expect(find.text('private data'), findsOneWidget);
    final prefs = await SharedPreferences.getInstance();
    expect(
      prefs.getString(AdminAuthentication.methodPrefKey('me')),
      'password',
    );
    AdminSecurity.lock!();
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPassword')), findsOneWidget);
    expect(find.byKey(const Key('adminPasskey')), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());

    // A remembered way that's gone here falls back to the strongest.
    SharedPreferences.setMockInitialValues({
      AdminAuthentication.methodPrefKey('me'): 'device',
    });
    await pumpGate(tester, passkeyBackend());
    expect(find.byKey(const Key('adminPasskey')), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('the PIN boxes send themselves on the sixth digit', (
    tester,
  ) async {
    final backend = FakeBackend()..adminPin = '482913';
    await pumpGate(tester, backend);
    await tester.enterText(find.byKey(const Key('adminPin')), '4829');
    await tester.pumpAndSettle();
    expect(backend.adminPinChecks, isEmpty);
    await tester.enterText(find.byKey(const Key('adminPin')), '482913');
    await tester.pumpAndSettle();
    expect(backend.adminPinChecks, ['482913']);
    expect(find.text('private data'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('a wrong PIN says the tries left and clears the boxes', (
    tester,
  ) async {
    final backend = FakeBackend()..adminPin = '482913';
    await pumpGate(tester, backend);
    await tester.enterText(find.byKey(const Key('adminPin')), '111111');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPinNote')), findsOneWidget);
    expect(find.text('Wrong PIN. 4 tries left.'), findsOneWidget);
    expect(_typed(tester, 'adminPin'), isEmpty);
    // The next try goes through again.
    await tester.enterText(find.byKey(const Key('adminPin')), '222222');
    await tester.pumpAndSettle();
    expect(find.text('Wrong PIN. 3 tries left.'), findsOneWidget);
    expect(backend.adminPinChecks, ['111111', '222222']);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('a wrong password says so under the field', (tester) async {
    await pumpGate(tester, _WrongPassword());
    await tester.enterText(find.byKey(const Key('adminPassword')), 'nope');
    await tester.tap(find.byKey(const Key('adminUnlockPassword')));
    await tester.pumpAndSettle();
    expect(find.text("That password didn't work"), findsOneWidget);
    expect(_typed(tester, 'adminPassword'), isEmpty);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('an email code can be sent again after a minute', (tester) async {
    final backend = FakeBackend();
    await pumpGate(tester, backend);
    await tester.tap(_method('email'));
    await tester.pumpAndSettle();
    expect(find.text('Send a code to t•••@example.com'), findsOneWidget);
    await tester.tap(find.byKey(const Key('adminSendCode')));
    await tester.pumpAndSettle();
    expect(backend.magicLinkEmail, 'tester@example.com');
    expect(find.byKey(const Key('adminCode')), findsOneWidget);
    expect(find.text('Resend in 1:00'), findsOneWidget);
    expect(find.byKey(const Key('adminResendCode')), findsNothing);
    // The countdown runs on the wall clock: move the sending back instead of waiting.
    AdminSecurity.codeSentAt = DateTime.now().subtract(
      const Duration(seconds: 30),
    );
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Resend in 0:30'), findsOneWidget);
    AdminSecurity.codeSentAt = DateTime.now().subtract(
      const Duration(seconds: 61),
    );
    await tester.pump(const Duration(seconds: 1));
    expect(find.byKey(const Key('adminResendIn')), findsNothing);
    final first = AdminSecurity.codeSentAt;
    backend.magicLinkEmail = null;
    await tester.ensureVisible(find.byKey(const Key('adminResendCode')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('adminResendCode')));
    await tester.pumpAndSettle();
    expect(backend.magicLinkEmail, 'tester@example.com');
    expect(AdminSecurity.codeSentAt!.isAfter(first!), isTrue);
    expect(find.byKey(const Key('adminResendIn')), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('a code already on its way opens at the email code', (
    tester,
  ) async {
    AdminSecurity.codeSentTo = 'me';
    AdminSecurity.codeSentAt = DateTime.now();
    await pumpGate(tester, passkeyBackend());
    expect(find.byKey(const Key('adminCode')), findsOneWidget);
    await tester.enterText(find.byKey(const Key('adminCode')), '123456');
    await tester.pumpAndSettle();
    expect(find.text('private data'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('two-step shows its step and the trail', (tester) async {
    final backend = _TwoStepAfterPassword();
    await pumpGate(tester, backend);
    await tester.enterText(find.byKey(const Key('adminPassword')), 'pw');
    await tester.tap(find.byKey(const Key('adminUnlockPassword')));
    await tester.pumpAndSettle();
    expect(find.text('Step 2 of 2'), findsOneWidget);
    expect(find.byKey(const Key('adminTwoStepTrail')), findsOneWidget);
    expect(find.text('Authenticator code'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byKey(const Key('adminTwoStepTrail')),
        matching: find.text('Password'),
      ),
      findsOneWidget,
    );
    // A wrong code says so; the right one opens it, by itself on the sixth digit.
    await tester.enterText(find.byKey(const Key('adminTwoStepCode')), '000000');
    await tester.pumpAndSettle();
    expect(find.text("That code didn't work"), findsOneWidget);
    expect(find.text('private data'), findsNothing);
    await tester.enterText(find.byKey(const Key('adminTwoStepCode')), '123456');
    await tester.pumpAndSettle();
    expect(find.text('private data'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('the tip card closes for the rest of the session', (
    tester,
  ) async {
    await pumpGate(tester, FakeBackend());
    expect(find.byKey(const Key('adminTwoStepTip')), findsOneWidget);
    await tester.ensureVisible(find.byKey(const Key('adminTipDismiss')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('adminTipDismiss')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminTwoStepTip')), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    await pumpGate(tester, FakeBackend());
    expect(find.byKey(const Key('adminTwoStepTip')), findsNothing);
    expect(find.byKey(const Key('adminLockFooter')), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  for (final width in [320.0, 1200.0]) {
    testWidgets('no overflow at ${width.toInt()} wide', (tester) async {
      await setSize(tester, Size(width, 900));
      final backend = passkeyBackend()..adminPin = '482913';
      await pumpGate(
        tester,
        backend,
        keys: FakeDeviceKeys(enrolledFor: backend.userId)..answer = null,
      );
      expect(tester.takeException(), isNull);
      for (final m in ['device', 'passkey', 'pin', 'password', 'email']) {
        await tester.tap(_method(m));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: m);
      }
      await tester.tap(find.byKey(const Key('adminSendCode')));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }
}
