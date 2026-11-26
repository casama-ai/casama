# Contribute to Casama

Casama is open source, and bug reports, docs fixes, tests and features are all welcome. This page
gets a development machine running, shows how to run the checks, and explains how a change gets in.
For a map of the code, read [How Casama is built](/develop/architecture) first.

- Found a bug? [Open an issue](https://github.com/casama-ai/casama/issues/new/choose) with steps to
  reproduce it.
- Planning a large change? Start a [discussion](https://github.com/casama-ai/casama/discussions)
  first, so you agree on the approach before you write it.
- Found a security issue? Don't open an issue. Follow
  [SECURITY.md](https://github.com/casama-ai/casama/blob/main/SECURITY.md).
- Want something small to start with? Look for a
  [`good first issue`](https://github.com/casama-ai/casama/labels/good%20first%20issue) and say
  you're taking it.

## What's in the repository

[`casama-ai/casama`](https://github.com/casama-ai/casama) holds the open parts of Casama: the apps
(`client/`, with the Apple Watch and Wear OS apps), the browser extension (`apps/extension`),
`computerd`, the CLI and SDKs (`dart/`, `packages/client`), the MCP server and plugin checker, the
API schemas (`packages/contracts`), the safety rules (`packages/safety`), the bot's computer image
and network guard (`infra/`), the build-on-Casama kit and these docs.
[LICENSING.md](https://github.com/casama-ai/casama/blob/main/LICENSING.md) lists every folder.

The Casama Engine (the API, worker, agent and database behind Casama Cloud) isn't open source and
isn't in the repository, so changes to it can't be sent as pull requests. Tell us what you need in
an issue. The apps and the CLI run against Casama Cloud.

## What you need

| Tool    | Version                                  | Used for                                   |
| ------- | ---------------------------------------- | ------------------------------------------ |
| Node.js | 24 or newer (see `.nvmrc`)               | The TypeScript packages and the extension  |
| pnpm    | 12 (`packageManager` in `package.json`)  | JavaScript dependencies                    |
| Dart    | 3 (stable)                               | The CLI, SDKs and `computerd`              |
| Flutter | 3.50                                     | The apps                                   |

On macOS: `brew install node pnpm`, then install Flutter. On Ubuntu and Debian:
`npm install -g pnpm@12` (or `corepack enable`), then Flutter. For the Linux desktop app, also
install its build packages:

```sh
sudo apt install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev \
  libsecret-1-dev libjsoncpp-dev libcurl4-openssl-dev libx11-dev libxi-dev \
  libayatana-appindicator3-dev libpulse-dev
```

`libpulse-dev` is optional: without it, screen sharing from the Linux app has no system audio.

Then clone the repository and install the JavaScript dependencies:

```sh
git clone https://github.com/casama-ai/casama.git
cd casama
pnpm install
```

## Run the app

```sh
cd client
flutter run -d macos --dart-define=CASAMA_API_URL=https://api.casama.ai
```

Use `-d linux`, `-d chrome`, an iOS simulator or an Android emulator instead of `macos` if you
prefer. The app gets everything else it needs from the API, so the API address is the only setting.
Sign in with your Casama account. Official store builds are made by Stackwares.

### Map cards

Maps that bots draw in a chat load their tiles from one of four sources, tried in this order:
Google Map Tiles, MapTiler, HERE, then OpenStreetMap. A source without a key is skipped. When one
fails (refused, rate-limited, offline), every later map in that app session moves to the next.

Pass the keys when you build the app, with `--dart-define` or a file given to
`--dart-define-from-file`:

| Setting | Source |
| --- | --- |
| `CASAMA_GOOGLE_MAPS_KEY` | Google Map Tiles API |
| `CASAMA_MAPTILER_KEY` | MapTiler |
| `CASAMA_HERE_MAPS_KEY` | HERE |

With no keys, maps use OpenStreetMap's public tiles. Put a daily quota on a Google key so that
extra traffic gets a refusal, which falls through to the next source, and not a charge. HERE has
alerts but no hard spending cap, so leave its key empty unless you watch usage.

## Run the CLI

```sh
cd dart/cli
dart run bin/casama.dart config --api-url https://api.casama.ai
dart run bin/casama.dart signup --email you@example.com
dart run bin/casama.dart chat Anna "What can you do?"
```

See [CLI](/develop/cli) for every command.

## Run the docs

```sh
pnpm --filter @casama/docs dev      # http://localhost:5173
pnpm --filter @casama/docs build    # fails on broken links
```

## Run the checks

Run what applies to your change before you push. The repository's CI runs all of it on every pull
request.

```sh
pnpm -r run typecheck                                   # every TypeScript package
pnpm -r run test                                        # their tests, the network guard's and the extension's
pnpm gen && git diff --exit-code                        # after a change to packages/contracts
(cd dart && dart pub get && dart analyze && dart test cli casama_sdk computerd)
(cd client && flutter pub get && flutter gen-l10n && flutter analyze && flutter test)
```

For one package, use its name: `pnpm --filter @casama/safety test`. For one app test file:
`(cd client && flutter test test/<file>_test.dart)`.

- **No test calls a real model or Casama Cloud.** The app tests run against a fake backend, and
  the CLI's end-to-end tests are skipped unless `CASAMA_E2E_API` points at a server.
- **On Windows, the first `flutter test` takes minutes.** Flutter's native build hooks (sqlite3,
  flutter_soloud, cnativeapi and others) rebuild whenever `PATH` changes, so switching between
  PowerShell, Git Bash and another terminal costs about 2.5 minutes once. On top of that, the first
  compile sits at "loading" for 2–3 minutes while Windows Defender scans the package cache. After
  that a test file takes about 15 seconds. To make it faster, run tests from one kind of shell and
  add Defender exclusions (admin) for the checkout, `%LOCALAPPDATA%\Pub\Cache` and the Flutter
  SDK, or put them on a Dev Drive.
- **Android builds on Windows:** the JDK, SDK, emulators and release tooling are set up as in
  [Android builds on Windows](./android-windows.md).

## Rules for every change

1. **Open folders only.** Change the folders listed in `LICENSING.md`. The root `package.json`,
   `pnpm-workspace.yaml`, `pnpm-lock.yaml` and the other root config files are written by the
   sync; if your change needs one of them changed, say so in the pull request.
2. **Contracts first.** Change routes and schemas in `packages/contracts`, run `pnpm gen`, and
   commit what it writes. Never edit the generated Dart client (`dart/casama_api`) by hand.
3. **No secrets** in code, logs, fixtures or test output.
4. **Tests with every change.** If a test fails, fix the cause; don't skip the test.
5. **Text in the app** goes in `client/lib/l10n/app_en.arb`.
6. **New dependencies** at their latest compatible version, and compatible with the folder's
   license. Put upgrades in their own commit.
7. **Docs change with the behavior** they describe. User docs live in `docs-site/`.
8. **Format only what you touch.** Run `npx biome check --write <files>` on TypeScript you changed
   and `dart format <files>` on Dart files you created. Existing app code isn't at `dart format`'s
   width, so edit existing Dart files by hand. Don't reformat whole folders.

## Send a change

1. Fork the repository and create a branch from `main`.
2. Make your change in small, focused commits, with tests.
3. Sign off every commit:

   ```sh
   git commit -s -m "Fix watch complication refresh"
   ```

   This adds a `Signed-off-by` line certifying the
   [Developer Certificate of Origin](https://developercertificate.org/): that you wrote the change
   or have the right to submit it.
4. Open a pull request on `casama-ai/casama` and fill in the template: what changed, why, and how
   you tested it.
5. Sign the one-time
   [Contributor License Agreement](https://github.com/casama-ai/casama/blob/main/CLA.md) by
   commenting on your first pull request: "I have read the Casama CLA (CLA.md) and I agree to it."

A maintainer reviews it, usually within a few days. Small pull requests get reviewed fastest.

**What happens when we take it:** the public repository is a copy of Casama's private one, updated
by one sync commit at a time. A maintainer copies your pull request into the private repository,
with you as co-author, and runs the full checks there. Your change then arrives in the next sync
commit, and we close your pull request with a link to that commit. So the pull request shows as
closed, not merged, but the change and your credit land in the repository.

## Licenses

The apps, `computerd` and the safety rules (the rules for when a bot must ask first, what it may never do on websites, who may do what in a workspace, quiet hours and how secrets are hidden), the bot's computer image and the network guard are under AGPL-3.0. The SDKs, CLI, MCP server, plugin kit, examples and these docs are under Apache-2.0, so what you build on Casama can use any license. Casama Cloud runs on the Casama Engine, which is not open source. Your contribution is published under the license of the folder you change,
and every contribution needs the one-time
[Contributor License Agreement](https://github.com/casama-ai/casama/blob/main/CLA.md).
[LICENSING.md](https://github.com/casama-ai/casama/blob/main/LICENSING.md) has the details, and
[TRADEMARKS.md](https://github.com/casama-ai/casama/blob/main/TRADEMARKS.md) covers the Casama
name for forks.
