import 'package:casama/features/settings/secret_names.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('usernames and emails show; passwords, keys and codes stay hidden', () {
    for (final n in [
      'PAGES_DEV_USERNAME',
      'OPENRC_EMAIL',
      'GITHUB_USER',
      'ACME_LOGIN',
      'EMAIL',
    ]) {
      expect(isPlainSecretName(n), isTrue, reason: n);
    }
    for (final n in [
      'PAGES_DEV_PASSWORD',
      'GITHUB_TOKEN',
      'STRIPE_KEY',
      'PAGES_DEV_TOTP',
      'EMAIL_PASSWORD',
      'API_KEY_USER',
      'SUPERUSER_PIN',
      'USERNAMES_FILE',
    ]) {
      expect(isPlainSecretName(n), isFalse, reason: n);
    }
    expect(isEmailSecretName('OPENRC_EMAIL'), isTrue);
    expect(isEmailSecretName('PAGES_DEV_USERNAME'), isFalse);
  });
}
