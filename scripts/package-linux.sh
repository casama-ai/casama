#!/usr/bin/env bash
# Builds the Linux desktop app as a tar.gz bundle (run on Linux with Flutter's Linux toolchain).
set -euo pipefail
cd "$(dirname "$0")/../client"
version=$(grep '^version:' pubspec.yaml | awk '{print $2}' | cut -d+ -f1)
defines=()
# Casama Cloud models screens (D-583): CASAMA_CLOUD_MODELS=1 or `scripts/cloud-models-switch.sh on`.
# Public store builds leave it off until their review notes describe it (docs/SELFHOST-CLOUD-MODELS-PLAN.md §7.4.1).
if [[ "${CASAMA_CLOUD_MODELS:-0}" == "1" || -f cloud-models.on ]]; then
  defines+=(--dart-define=CASAMA_CLOUD_MODELS=true)
fi
if [[ "${CASAMA_OFFICIAL_BUILD:-0}" == "1" && -f config/telemetry.json ]]; then
  defines+=(--dart-define-from-file=config/telemetry.json)
fi
# The MapTiler key for bots' map cards (D-310); without it maps use OpenStreetMap's own tiles.
if [[ "${CASAMA_OFFICIAL_BUILD:-0}" == "1" && -f config/maps.json ]]; then
  defines+=(--dart-define-from-file=config/maps.json)
fi
if [[ -f linux/app-browser.on || "${CASAMA_APP_BROWSER:-0}" == "1" ]]; then
  defines+=(--dart-define=CASAMA_APP_BROWSER=true)
fi
flutter build linux --release --dart-define=CASAMA_API_URL="${CASAMA_API_URL:-https://api.casama.ai}" "${defines[@]}"
case "$(uname -m)" in aarch64|arm64) arch=arm64 ;; *) arch=x64 ;; esac
cp ../packaging/linux/README.txt "build/linux/$arch/release/bundle/README.txt"
mkdir -p ../dist
tar -C "build/linux/$arch/release" -czf "../dist/casama-$version-linux-$arch.tar.gz" bundle
echo "../dist/casama-$version-linux-$arch.tar.gz"
