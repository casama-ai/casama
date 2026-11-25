#ifndef RUNNER_URL_SCHEME_H_
#define RUNNER_URL_SCHEME_H_

// Registers casama:// links for this copy of the app under HKCU\Software\Classes, so a link in
// an email, an invite or casama.ai's "Open in the app" button opens here (lib/core/open_links.dart).
// The Microsoft Store and MSIX builds skip it: their package declares the scheme
// (msix_config's protocol_activation in client/pubspec.yaml). A release build always claims the
// scheme; a debug build (flutter run) only when nothing else has it or the copy that had it is gone,
// so a dev run doesn't take links away from the installed app.
void RegisterUrlScheme();

#endif  // RUNNER_URL_SCHEME_H_
