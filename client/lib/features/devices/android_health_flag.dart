/// Health Connect on Android (D-494). Play rejected 0.1.0 (77) over its permissions, so Android
/// builds offer Health only when made with `--dart-define=CASAMA_ANDROID_HEALTH=true` and
/// `CASAMA_ANDROID_HEALTH=1` (which merges the permissions into the manifest). iOS keeps HealthKit.
const kAndroidHealth = bool.fromEnvironment('CASAMA_ANDROID_HEALTH');
