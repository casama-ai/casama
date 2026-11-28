#!/usr/bin/env bash
# Builds the Linux desktop app as a tar.gz bundle (run on Linux with Flutter's Linux toolchain).
set -euo pipefail
script_dir="$(cd "$(dirname "$0")" && pwd)"
cd "$script_dir/../client"
version=$(grep '^version:' pubspec.yaml | awk '{print $2}' | cut -d+ -f1)
# shellcheck source=scripts/flutter-defines.sh
source "$script_dir/flutter-defines.sh"
casama_flutter_defines linux "."
defines=()
if (( ${#CASAMA_FLUTTER_DEFINES[@]} )); then
  defines=("${CASAMA_FLUTTER_DEFINES[@]}")
fi
flutter build linux --release --dart-define=CASAMA_API_URL="${CASAMA_API_URL:-https://api.casama.ai}" ${defines[@]+"${defines[@]}"}
case "$(uname -m)" in aarch64|arm64) arch=arm64 ;; *) arch=x64 ;; esac
cp ../packaging/linux/README.txt "build/linux/$arch/release/bundle/README.txt"
mkdir -p ../dist
tar -C "build/linux/$arch/release" -czf "../dist/casama-$version-linux-$arch.tar.gz" bundle
echo "../dist/casama-$version-linux-$arch.tar.gz"
