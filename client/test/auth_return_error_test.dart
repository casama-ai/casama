import 'package:casama/core/auth_return_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('reads the invite gate refusal Auth sends after #', () {
    final uri = Uri.parse(
      '/error=access_denied&error_description=Casama+Cloud+is+invite-only+for+now.+Join+the+waitlist+or+enter+an+invite+code+at+casama.ai%252Fwaitlist.&sb=',
    );
    expect(
      authReturnError(uri),
      'Casama Cloud is invite-only for now. Join the waitlist or enter an invite code at casama.ai/waitlist.',
    );
  });

  test('reads an error in the query', () {
    expect(
      authReturnError(
        Uri.parse(
          '/?error=access_denied&error_code=403&error_description=Nope',
        ),
      ),
      'Nope',
    );
  });

  test('falls back to the error code', () {
    expect(authReturnError(Uri.parse('/error=access_denied')), 'access denied');
  });

  test('leaves ordinary routes alone', () {
    expect(authReturnError(Uri.parse('/bots')), isNull);
    expect(authReturnError(Uri.parse('/sign-in?email=a@b.c')), isNull);
    expect(authReturnError(Uri.parse('/?code=abc')), isNull);
  });
}
