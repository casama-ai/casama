import 'package:dio/dio.dart';

/// The `Accept-Language` header every call to a Casama server carries, so the server can answer in
/// the person's language before it knows their profile (sign-up, waitlist, email sign-up).
///
/// A program sets [read] once, before its first call. The app does; the `casama` CLI leaves it
/// unset and sends no header.
abstract final class AcceptLanguage {
  static const header = 'Accept-Language';

  /// The header's value now ("de-DE,de;q=0.9,en;q=0.8"), or null to send none.
  static String? Function()? read;

  /// What to add to a request's headers: nothing while there's no value.
  static Map<String, String> get headers {
    final value = read?.call();
    return value == null || value.isEmpty ? const {} : {header: value};
  }
}

/// Adds [AcceptLanguage] to a Dio client's requests, unless a request already names a language.
class AcceptLanguageInterceptor extends Interceptor {
  const AcceptLanguageInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final named = options.headers.keys.any((k) => k.toLowerCase() == 'accept-language');
    if (!named) options.headers.addAll(AcceptLanguage.headers);
    handler.next(options);
  }
}
