import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/generated/app_localizations.dart';

/// The in-app browser's build switch (docs/PHONE-BROWSER-PLAN.md §8.7, PROTOCOL.md §4). On by
/// default in every release and profile build, a plain `flutter build` or `flutter run --release`
/// included (D-633); the package scripts pass `--dart-define=CASAMA_APP_BROWSER=false` only when
/// `scripts/app-browser-switch.sh off` took the native half out. Debug runs and tests stay off
/// unless they pass the define (tests override [appBrowserBuildProvider]).
const kAppBrowser = bool.fromEnvironment(
  'CASAMA_APP_BROWSER',
  defaultValue: kReleaseMode || kProfileMode,
);

/// Whether the phone browser's code is in this build at all. Every entry point checks this first,
/// as a constant, so a release build without [kAppBrowser] drops the whole folder. Debug builds
/// (and so tests) keep the code; [appBrowserBuildProvider] still says no unless a test overrides it.
const kAppBrowserCode = kAppBrowser || kDebugMode;

/// Android background keep-going (`AppBrowserKeepAlive` `specialUse` FGS, PHONE-BROWSER-BACKGROUND-PLAN).
/// Off by default until we're ready to submit Play's foreground service declaration + demo video;
/// enable with `CASAMA_APP_BROWSER_BG=1` (Gradle) and `--dart-define=CASAMA_APP_BROWSER_BG=true`.
const kAppBrowserBg = bool.fromEnvironment(
  'CASAMA_APP_BROWSER_BG',
  defaultValue: false,
);

/// iPhone, iPad, Android, Mac (macOS 14+), Linux (WebKitGTK 4.1, 2.40+) and Windows (WebView2 120+):
/// the places the in-app browser exists.
bool get appBrowserPlatform =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.windows);

/// "ios", "android", "macos", "linux" or "windows", as the server names this device's system; null
/// elsewhere.
String? get appBrowserSystem => kIsWeb
    ? null
    : switch (defaultTargetPlatform) {
        TargetPlatform.iOS => 'ios',
        TargetPlatform.android => 'android',
        TargetPlatform.macOS => 'macos',
        TargetPlatform.linux => 'linux',
        TargetPlatform.windows => 'windows',
        _ => null,
      };

/// Whether this build has the phone browser ([kAppBrowser]); tests override it.
final appBrowserBuildProvider = Provider<bool>((ref) => kAppBrowser);

/// Whether the phone browser can exist here: a build with it, on a phone or tablet. The workspace
/// switch and the owner's panel need only [appBrowserBuildProvider]; everything on the phone itself
/// needs this.
final appBrowserOnProvider = Provider<bool>(
  (ref) => ref.watch(appBrowserBuildProvider) && appBrowserPlatform,
);

/// "Browser on This Phone", "… This Mac" or "… This Computer", for this device.
String appBrowserTitleFor(AppLocalizations l10n) => switch (appBrowserSystem) {
  'macos' => l10n.appBrowserTitleMac,
  'linux' => l10n.appBrowserTitleLinux,
  'windows' => l10n.appBrowserTitleWindows,
  _ => l10n.appBrowserTitle,
};
