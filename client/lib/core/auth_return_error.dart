import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The error a sign-in page sent back to the web app, or null when [uri] isn't one.
///
/// When Auth refuses a sign-up (Casama Cloud's invite gate, D-427, or a cancelled Google sign-in),
/// it sends the browser to `app.casama.ai/#error=…&error_description=…`. The web app reads the
/// part after `#` as its route, so the router sees `/error=access_denied&error_description=…`,
/// which matches no page. Some returns put the same fields in the query instead.
String? authReturnError(Uri uri) {
  Map<String, String>? fields;
  final path = uri.path.replaceFirst(RegExp(r'^/+'), '');
  if (path.startsWith('error=') ||
      path.startsWith('error_description=') ||
      path.startsWith('error_code=')) {
    fields = _split([path, if (uri.hasQuery) uri.query].join('&'));
  } else if (uri.queryParameters.containsKey('error_description') ||
      (uri.queryParameters.containsKey('error') &&
          uri.queryParameters.containsKey('error_code'))) {
    fields = uri.queryParameters;
  }
  if (fields == null) return null;
  final message = _decodeAgain(fields['error_description'] ?? '').trim();
  if (message.isNotEmpty) return message;
  final code = (fields['error'] ?? '').trim();
  return code.isEmpty
      ? 'The sign-in did not finish.'
      : code.replaceAll('_', ' ');
}

Map<String, String> _split(String query) {
  try {
    return Uri.splitQueryString(query);
  } catch (_) {
    return const {};
  }
}

/// Auth encodes the description twice (`casama.ai%252Fwaitlist`), so one decode leaves `%2F`.
String _decodeAgain(String text) {
  if (!RegExp('%[0-9A-Fa-f]{2}').hasMatch(text)) return text;
  try {
    return Uri.decodeComponent(text);
  } catch (_) {
    return text;
  }
}

/// A sign-in error the router caught on the way back, waiting for the sign-in screen to show it.
class PendingAuthError extends Notifier<String?> {
  @override
  String? build() => null;

  void set(String? message) => state = message;
}

final pendingAuthErrorProvider = NotifierProvider<PendingAuthError, String?>(
  PendingAuthError.new,
);
