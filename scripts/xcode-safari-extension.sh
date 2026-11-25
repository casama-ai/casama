#!/bin/sh
# Xcode build phase "Copy Safari Web Extension" of the iOS CasamaSafariExtension target: puts the
# web extension (apps/extension/dist/safari) into the .appex.
#
# A fresh checkout has no dist/safari, and an .appex without its manifest won't install. So when
# the build is missing or older than its sources, this builds it (scripts/build-extension.sh
# safari, after `pnpm install` for the extension if its packages aren't there yet). If it can't,
# the Xcode build fails with a message that says what to run, instead of a warning nobody reads.
# scripts/package-ios.sh builds the extension first, so this only copies there.
set -eu

: "${SRCROOT:?run from Xcode}"
root=$(cd "$SRCROOT/../.." && pwd)
ext="$root/apps/extension"
dist="$ext/dist/safari"
dest="${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

fail() {
  echo "error: Safari extension: $1" >&2
  echo "error: Fix: run 'pnpm install' and 'scripts/build-extension.sh safari' in $root, then build again." >&2
  exit 1
}

# Xcode runs build phases with a bare PATH; look where node and pnpm usually live.
PATH="$PATH:/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$HOME/Library/pnpm:$HOME/.local/share/pnpm:$HOME/.volta/bin"
export PATH

# build-extension.sh gives every file a 1980 time stamp (same zip from the same commit), so it
# leaves dist/.safari-built behind as the build time.
stamp="$ext/dist/.safari-built"
stale() {
  [ -f "$dist/manifest.json" ] && [ -f "$stamp" ] || return 0
  newer=$(find "$ext/src" "$ext/public" "$ext/vite.config.ts" "$ext/package.json" "$root/packages/client/src" \
    -newer "$stamp" -print 2>/dev/null | head -n 1)
  [ -n "$newer" ]
}

if stale; then
  command -v node >/dev/null 2>&1 || fail "apps/extension/dist/safari is missing or out of date, and node isn't on PATH."
  command -v pnpm >/dev/null 2>&1 || fail "apps/extension/dist/safari is missing or out of date, and pnpm isn't on PATH."
  if [ ! -d "$ext/node_modules" ]; then
    echo "note: Safari extension: installing its packages (pnpm install --filter @casama/extension...)"
    (cd "$root" && pnpm install --frozen-lockfile --prefer-offline --filter "@casama/extension...") \
      || fail "pnpm install failed."
  fi
  echo "note: Safari extension: building apps/extension/dist/safari (scripts/build-extension.sh safari)"
  "$root/scripts/build-extension.sh" safari >/dev/null || fail "scripts/build-extension.sh safari failed."
fi

[ -f "$dist/manifest.json" ] || fail "apps/extension/dist/safari/manifest.json is missing."
mkdir -p "$dest"
cp -R "$dist/." "$dest/"
