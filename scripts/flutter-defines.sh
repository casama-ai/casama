#!/usr/bin/env bash
# Shared --dart-define builder for scripts/run-app.sh and the package/build scripts.
# Keeps local `flutter run` and release packaging on one source of truth for feature switches
# and config files. Source this file and call:
#   casama_flutter_defines <android|ios|macos|linux|web|auto> [client_dir]
# Populates the global array CASAMA_FLUTTER_DEFINES.
#
# Environment knobs:
#   CASAMA_OFFICIAL_BUILD=1   include config/telemetry.json and config/maps.json (and web firebase)
#   CASAMA_INCLUDE_MAPS=1     include config/maps.json when present (used by scripts/run-app.sh)
#   CASAMA_INCLUDE_FIREBASE=1 include config/firebase.json on web when present (used by run-app.sh)
#   CASAMA_CLOUD_MODELS=1     override client/cloud-models.on
#   CASAMA_APP_BROWSER=1      override platform app-browser switch file
#   CASAMA_APP_FUNCTIONS=1    override client/android/app-functions.on
#   CASAMA_ANDROID_HEALTH=1   enable Health Connect on Android (non-Play distributions, D-494)

casama_flutter_defines() {
  local platform="${1:-auto}"
  local client_dir="${2:-.}"
  CASAMA_FLUTTER_DEFINES=()

  # Casama Cloud models screens (D-583): CASAMA_CLOUD_MODELS=1 or `scripts/cloud-models-switch.sh on`.
  # On by default in every build, store builds too (D-633): client/cloud-models.on is committed.
  if [[ "${CASAMA_CLOUD_MODELS:-0}" == "1" || -f "$client_dir/cloud-models.on" ]]; then
    CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_CLOUD_MODELS=true)
  else
    CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_CLOUD_MODELS=false)
  fi

  # Firebase config (FCM/push, web push): always on mobile/desktop apps when present; on web only
  # for official or local dev runs (self-host Docker builds stay without Casama's Firebase ids).
  case "$platform" in
    android|ios|macos|auto)
      if [[ -f "$client_dir/config/firebase.json" ]]; then
        CASAMA_FLUTTER_DEFINES+=(--dart-define-from-file="$client_dir/config/firebase.json")
      fi
      ;;
    web)
      if [[ ( "${CASAMA_OFFICIAL_BUILD:-0}" == "1" || "${CASAMA_INCLUDE_FIREBASE:-0}" == "1" ) && -f "$client_dir/config/firebase.json" ]]; then
        CASAMA_FLUTTER_DEFINES+=(--dart-define-from-file="$client_dir/config/firebase.json")
      fi
      ;;
  esac

  # Telemetry (PostHog, Sentry, GA4): official builds only so local dev runs don't pollute prod.
  if [[ "$platform" != "web" && "${CASAMA_OFFICIAL_BUILD:-0}" == "1" && -f "$client_dir/config/telemetry.json" ]]; then
    CASAMA_FLUTTER_DEFINES+=(--dart-define-from-file="$client_dir/config/telemetry.json")
  fi

  # MapTiler / Google Maps keys for bots' map cards (D-310); without them maps use OpenStreetMap.
  if [[ ( "${CASAMA_OFFICIAL_BUILD:-0}" == "1" || "${CASAMA_INCLUDE_MAPS:-0}" == "1" ) && -f "$client_dir/config/maps.json" ]]; then
    CASAMA_FLUTTER_DEFINES+=(--dart-define-from-file="$client_dir/config/maps.json")
  fi

  # The in-app browser (D-476, D-508, D-509, D-547, D-632, D-633): the Dart half follows each
  # platform's native switch file so a build never has one half without the other.
  case "$platform" in
    macos)
      # Always on in every Mac build (D-632); macos/Flutter/Flutter-*.xcconfig is committed.
      CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=true)
      ;;
    android)
      if [[ "${CASAMA_APP_BROWSER:-0}" == "1" || -f "$client_dir/android/app-browser.on" ]]; then
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=true)
      else
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=false)
      fi
      ;;
    ios)
      if [[ -f "$client_dir/ios/Flutter/AppBrowser.xcconfig" ]]; then
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=true)
      else
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=false)
      fi
      ;;
    linux)
      if [[ "${CASAMA_APP_BROWSER:-0}" == "1" || -f "$client_dir/linux/app-browser.on" ]]; then
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=true)
      else
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=false)
      fi
      ;;
    auto)
      if [[ "${CASAMA_APP_BROWSER:-0}" == "1" \
        || -f "$client_dir/android/app-browser.on" \
        || -f "$client_dir/ios/Flutter/AppBrowser.xcconfig" \
        || -f "$client_dir/linux/app-browser.on" ]]; then
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=true)
      else
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_BROWSER=false)
      fi
      ;;
  esac

  # AppFunctions for Gemini on Android 16+ (D-567, D-633). Safe to pass in auto mode because Dart
  # also checks TargetPlatform.android.
  case "$platform" in
    android|auto)
      if [[ "${CASAMA_APP_FUNCTIONS:-0}" == "1" || -f "$client_dir/android/app-functions.on" ]]; then
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_FUNCTIONS=true)
      else
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_APP_FUNCTIONS=false)
      fi
      ;;
  esac

  # Health Connect on Android (D-494): off on Play, on for direct APK / Galaxy or when requested.
  case "$platform" in
    android|auto)
      if [[ "${CASAMA_ANDROID_HEALTH:-0}" == "1" ]]; then
        CASAMA_FLUTTER_DEFINES+=(--dart-define=CASAMA_ANDROID_HEALTH=true)
      fi
      ;;
  esac
}
