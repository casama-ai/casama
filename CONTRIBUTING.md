# Contributing to Casama

Thanks for helping. Bug reports, docs fixes, tests and features are welcome on the open folders in
this repo: the apps, `computerd`, the safety rules, the SDKs, the CLI, the MCP server and the docs.
[LICENSING.md](LICENSING.md) lists them.

- Found a bug? [Open an issue](https://github.com/casama-ai/casama/issues/new/choose) with steps to
  reproduce it.
- Have an idea? Start a [discussion](https://github.com/casama-ai/casama/discussions) before writing
  a large change, so we can agree on the approach.
- Found a security issue? Don't open an issue; follow [SECURITY.md](SECURITY.md).

The Casama Engine (the API, worker, agent and database behind Casama Cloud) is not in this repo, so
changes to it can't be sent here. Tell us what you need in an issue.

## How a pull request is handled

1. Open a pull request on `casama-ai/casama` from a fork.
2. The CLA bot checks it. Sign the [CLA](CLA.md) by commenting on the pull request.
3. A maintainer reviews it. If it is accepted, the maintainer copies it into Stackwares' private
   repository, keeping you as co-author, and runs the full checks there.
4. Your change appears in this repo in the next sync commit. We then close the pull request with a
   link to that commit.

So your pull request is closed, not merged, even when we take it. The change and your credit still
land here.

## Development setup

| Tool | Version | Used for |
|---|---|---|
| Node.js | 24 or newer | TypeScript packages |
| pnpm | 12 | JavaScript dependencies |
| Dart | 3 (stable) | CLI, SDK, computerd |
| Flutter | 3.50 (Dart 3.14) | The apps |

```sh
pnpm install
```

Run an app against Casama Cloud:

```sh
cd client
flutter run -d macos --dart-define=CASAMA_API_URL=https://api.casama.ai
```

Run the CLI:

```sh
cd dart/cli
dart run bin/casama.dart config --api-url https://api.casama.ai
dart run bin/casama.dart signup --email you@example.com
```

## Checks

Run what applies to your change before you push:

```sh
pnpm --filter @casama/client typecheck test        # TypeScript SDK
pnpm --filter @casama/mcp typecheck test          # MCP server
pnpm --filter @casama/plugin-check typecheck test # plugin checker
pnpm --filter @casama/safety typecheck test       # safety rules
(cd dart && dart analyze && dart test cli casama_sdk computerd)
(cd client && flutter analyze && flutter test)    # the apps
```

## Rules for every change

1. **Small, focused commits** with tests.
2. **No secrets** in code, logs, fixtures or test output.
3. **User-facing text in the app** lives in `client/lib/l10n/app_en.arb`.
4. **New dependencies** at their latest compatible version, and compatible with the folder's
   license.
5. **Format only what you touch.** Run `dart format` on your own Dart files, and
   `npx biome check --write <files>` on your TypeScript files. Don't reformat whole folders.
6. **Docs change with the behavior they describe.** Write for someone using Casama: plain words,
   short sentences, the app's exact labels in **bold**.

## Sign off your commits

Sign off every commit with the [Developer Certificate of Origin](https://developercertificate.org/):

```sh
git commit -s -m "Fix watch complication refresh"
```

## License

Your contribution is published under the license of the folder you change: AGPL-3.0 for the apps,
`computerd`, the safety rules, the computer image and the network guard, and Apache-2.0 for the
SDKs, CLI, MCP server, schemas, formats, kit and docs. You sign the one-time
[CLA](CLA.md) by commenting on your first pull request. You keep your copyright. The CLA lets
Stackwares import your change into its private repository and also offer it under other terms.
