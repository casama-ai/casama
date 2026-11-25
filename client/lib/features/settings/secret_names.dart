/// Which saved values are sign-in names rather than secrets, judged by the secret's name.
///
/// A username or an email is no secret on its own: its field shows what you type, with an email
/// keyboard for emails. Anything that mentions a password, token, key or code stays hidden.
library;

final _plainName = RegExp(
  r'(^|_)(USER|USERNAME|USER_NAME|EMAIL|E_MAIL|LOGIN|LOGIN_NAME|ACCOUNT|ACCOUNT_ID)$',
);
final _secretWord = RegExp(
  r'(PASS|PWD|TOKEN|KEY|SECRET|PIN|CODE|OTP|TOTP|2FA|SEED|COOKIE|SESSION)',
);

/// True when the secret called [name] is a username or email, so its field can show the value.
bool isPlainSecretName(String name) {
  final n = name.toUpperCase();
  return _plainName.hasMatch(n) && !_secretWord.hasMatch(n);
}

/// True when the secret called [name] holds an email address.
bool isEmailSecretName(String name) =>
    isPlainSecretName(name) && name.toUpperCase().contains('MAIL');
