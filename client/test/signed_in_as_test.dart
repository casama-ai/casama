import 'package:casama/ui/signed_in_as.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness;
import 'fake_backend.dart';

class _Backend extends FakeBackend {
  _Backend({required this.url, this.email});
  final String url;
  final String? email;

  @override
  String get apiUrl => url;

  @override
  String? get userEmail => email;
}

void main() {
  testWidgets('names Casama Cloud, and a self-hosted server by its host', (
    tester,
  ) async {
    await tester.pumpWidget(
      harness(
        _Backend(url: 'https://api.casama.ai', email: 'robin@example.com'),
        const SignedInAs(label: 'Signing in as'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Signing in as'), findsOneWidget);
    expect(find.text('robin@example.com'), findsOneWidget);
    expect(find.text('Casama Cloud'), findsOneWidget);

    await tester.pumpWidget(
      harness(
        _Backend(
          url: 'https://casama.example.org/',
          email: 'robin@example.com',
        ),
        const SignedInAs(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('casama.example.org'), findsOneWidget);
    expect(find.text('Casama Cloud'), findsNothing);
  });

  testWidgets('shows just the server when the email is not known', (
    tester,
  ) async {
    await tester.pumpWidget(
      harness(_Backend(url: 'http://localhost:8787'), const SignedInAs()),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('signedInAsEmail')), findsNothing);
    expect(find.text('localhost'), findsOneWidget);
  });
}
