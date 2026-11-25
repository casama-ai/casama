import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/analytics.dart';
import '../../core/providers.dart';
import '../siri/siri_bridge.dart';

/// Gemini on Android 16+ through Casama's AppFunctions (docs/ANDROID-APPFUNCTIONS-PLAN.md §7.2–7.3,
/// D-567). The Kotlin functions (`client/android/app/src/appFunctions/`) read the glance themselves
/// and hand asks and routine runs to Dart over [appFunctionsChannelName], where the Siri bridge
/// acts as the signed-in person (one vocabulary, plan §5). Dart tells native code whether the
/// functions may be on (`setEnabled`).
///
/// Compiled in only with `--dart-define=CASAMA_APP_FUNCTIONS=true`, which follows the Android build
/// switch (scripts/app-functions-switch.sh); store builds stay without it until the release that
/// describes the feature (plan §7.4).
const kAppFunctions = bool.fromEnvironment('CASAMA_APP_FUNCTIONS');

const appFunctionsChannelName = 'casama/app_functions';

/// The longest reply handed to Gemini (plan §6).
const geminiReplyMax = 4000;

/// Whether this build and device have the functions: the switch, and Android.
bool get appFunctionsAvailable =>
    kAppFunctions && !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

/// **Let Gemini use Casama** (Settings → Privacy; decision 6): on by default, kept on this device.
class GeminiSwitch extends Notifier<bool> {
  static const prefKey = 'casama.gemini.enabled';

  @override
  bool build() {
    SharedPreferences.getInstance()
        .then((p) {
          final saved = p.getBool(prefKey) ?? true;
          // A choice made meanwhile wins over the one read late.
          if (ref.mounted && !_changed && saved != state) state = saved;
        })
        .catchError((_) {});
    return true;
  }

  /// The saved choice, read fresh: a headless start may get Gemini's call before [build] has read it.
  static Future<bool> saved() async {
    try {
      return (await SharedPreferences.getInstance()).getBool(prefKey) ?? true;
    } catch (_) {
      return true;
    }
  }

  var _changed = false;

  Future<void> set(bool on) async {
    _changed = true;
    state = on;
    try {
      await (await SharedPreferences.getInstance()).setBool(prefKey, on);
    } catch (_) {}
  }
}

final geminiSwitchProvider = NotifierProvider<GeminiSwitch, bool>(
  GeminiSwitch.new,
);

/// Whether Gemini may use Casama on this phone now: signed in and the switch on (plan §7.3). The
/// app lock and a private workspace don't turn the functions off; they make their answers quiet.
final appFunctionsAllowedProvider = Provider<bool>((ref) {
  if (ref.watch(signedInProvider).value != true) return false;
  return ref.watch(geminiSwitchProvider);
});

/// The live bridge on Android builds with the switch on; null elsewhere.
final appFunctionsBridgeProvider = Provider<SiriBridge?>((ref) {
  if (!appFunctionsAvailable) return null;
  const channel = MethodChannel(appFunctionsChannelName);
  final bridge = SiriBridge(
    ref,
    channel,
    onAction: Analytics.geminiAction,
    replyMax: geminiReplyMax,
    // Signed out is the bridge's own answer (signed_out); this is the switch, read from storage so
    // a call that starts the app cold never acts against a choice not loaded yet.
    allowed: GeminiSwitch.saved,
  )..start();
  ref.onDispose(bridge.dispose);
  // Native code turns the functions on or off for Gemini as this changes (setAppFunctionEnabled),
  // once the sign-in has loaded: a cold start doesn't turn them off for a moment.
  void tell(bool on) => unawaited(
    channel
        .invokeMethod<void>('setEnabled', {'enabled': on})
        .catchError((_) {}),
  );
  followGeminiAccess(ref, tell);
  return bridge;
});

/// Tells [tell] whether Gemini may use Casama now (plan §7.3) each time sign-in or the switch
/// changes, once the sign-in has loaded. Worked out from the new value each listener gets, never by
/// reading [appFunctionsAllowedProvider] here: inside a listener it still holds the value from
/// before the change, so on build 101 signing in sent "off" and turning the switch off sent "on".
/// Public for tests.
void followGeminiAccess(Ref ref, void Function(bool on) tell) {
  ref.listen<AsyncValue<bool>>(signedInProvider, (_, signedIn) {
    if (signedIn.hasValue) tell(signedIn.value == true && ref.read(geminiSwitchProvider));
  }, fireImmediately: true);
  ref.listen<bool>(geminiSwitchProvider, (_, on) {
    final signedIn = ref.read(signedInProvider);
    if (signedIn.hasValue) tell(signedIn.value == true && on);
  });
}
