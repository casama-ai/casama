import 'package:web/web.dart' as web;

/// Sets `location.href`, so the next page sees where the person came from. Not url_launcher's
/// `window.open(url, '_self', 'noopener,noreferrer')`: that drops the referrer, and Gemini's
/// account linking then never redeemed the code ("Account linking is required", D-567).
bool goInSameTab(String url) {
  web.window.location.href = url;
  return true;
}
