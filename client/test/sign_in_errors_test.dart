import 'dart:async';

import 'package:casama/features/auth/sign_in_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// Auth's answer to a wrong password: 400 "Invalid login credentials".
const _wrongPassword = sb.AuthApiException(
  'Invalid login credentials',
  statusCode: '400',
  code: 'invalid_credentials',
);

class _AuthBackend extends FakeBackend {
  Object? signInError;
  Object? magicLinkError;
  var signInCalls = 0;

  @override
  Future<void> signIn(String email, String password) async {
    signInCalls++;
    final e = signInError;
    if (e != null) throw e;
    await super.signIn(email, password);
  }

  @override
  Future<void> sendMagicLink(String email) async {
    final e = magicLinkError;
    if (e != null) throw e;
    await super.sendMagicLink(email);
  }
}

void main() {
  Future<void> openPassword(WidgetTester tester, FakeBackend backend) async {
    await setSize(tester, const Size(500, 1100));
    await tester.pumpWidget(harness(backend, const SignInScreen()));
    await tester.tap(find.byKey(const Key('openSignIn')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('continueWithEmail')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('usePassword')));
    await tester.pumpAndSettle();
  }

  // Found on a real iPhone (SIRI-AI-PLAN §17): the error toast went to the screen under the sheet,
  // so a wrong password looked like nothing happened.
  testWidgets('a wrong password says so on the sheet, keeps the email and stops the spinner', (tester) async {
    final backend = _AuthBackend()
      ..signedIn = false
      ..signInError = _wrongPassword;
    await openPassword(tester, backend);
    await tester.enterText(find.byKey(const Key('email')), 'ana@example.com');
    await tester.enterText(find.byKey(const Key('password')), 'wrong-pw');
    await tester.tap(find.byKey(const Key('submit')));
    await tester.pumpAndSettle();

    expect(backend.signInCalls, 1);
    final error = find.byKey(const Key('signInError'));
    expect(error.hitTestable(), findsOneWidget);
    expect(
      find.descendant(of: error, matching: find.textContaining("That email and password don't match")),
      findsOneWidget,
    );
    // The sheet is still up, with the address as typed and the button ready again.
    expect(find.byType(SignInOptions), findsOneWidget);
    expect(tester.widget<TextFormField>(find.byKey(const Key('email'))).controller!.text, 'ana@example.com');
    expect(find.descendant(of: find.byKey(const Key('submit')), matching: find.byType(CircularProgressIndicator)), findsNothing);

    // The next try clears the message; a right password signs in.
    backend.signInError = null;
    await tester.enterText(find.byKey(const Key('password')), 'right-pw');
    await tester.tap(find.byKey(const Key('submit')));
    await tester.pump();
    expect(find.byKey(const Key('signInError')), findsNothing);
    await tester.pump(const Duration(milliseconds: 100));
    expect(backend.signInCalls, 2);
    expect(backend.signedIn, isTrue);
  });

  testWidgets('the error goes when the password changes', (tester) async {
    final backend = _AuthBackend()
      ..signedIn = false
      ..signInError = _wrongPassword;
    await openPassword(tester, backend);
    await tester.enterText(find.byKey(const Key('email')), 'ana@example.com');
    await tester.enterText(find.byKey(const Key('password')), 'wrong-pw');
    await tester.tap(find.byKey(const Key('submit')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('signInError')), findsOneWidget);
    await tester.enterText(find.byKey(const Key('password')), 'wrong-pw2');
    await tester.pump();
    expect(find.byKey(const Key('signInError')), findsNothing);
  });

  testWidgets('a slow wrong password shows the spinner, then the message', (tester) async {
    final gate = Completer<void>();
    final backend = _SlowBackend(gate)..signedIn = false;
    await openPassword(tester, backend);
    await tester.enterText(find.byKey(const Key('email')), 'ana@example.com');
    await tester.enterText(find.byKey(const Key('password')), 'wrong-pw');
    await tester.tap(find.byKey(const Key('submit')));
    await tester.pump();
    expect(find.descendant(of: find.byKey(const Key('submit')), matching: find.byType(CircularProgressIndicator)), findsOneWidget);
    gate.completeError(_wrongPassword);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('signInError')).hitTestable(), findsOneWidget);
    expect(find.descendant(of: find.byKey(const Key('submit')), matching: find.byType(CircularProgressIndicator)), findsNothing);
  });

  testWidgets('a failed sign-in email shows its error on the sheet too', (tester) async {
    final backend = _AuthBackend()
      ..signedIn = false
      ..magicLinkError = const sb.AuthApiException(
        'For security purposes, you can only request this after 49 seconds',
        statusCode: '429',
        code: 'over_email_send_rate_limit',
      );
    await setSize(tester, const Size(500, 1100));
    await tester.pumpWidget(harness(backend, const SignInScreen()));
    await tester.tap(find.byKey(const Key('openSignIn')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('continueWithEmail')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('email')), 'ana@example.com');
    await tester.tap(find.byKey(const Key('sendMagicLink')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('signInError')).hitTestable(), findsOneWidget);
    expect(find.byKey(const Key('checkInbox')), findsNothing);
  });
}

class _SlowBackend extends FakeBackend {
  _SlowBackend(this.gate);
  final Completer<void> gate;

  @override
  Future<void> signIn(String email, String password) => gate.future;
}
