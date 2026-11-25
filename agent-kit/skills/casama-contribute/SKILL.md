---
name: casama-contribute
description: "Work on the open Casama repository (casama-ai/casama): the Flutter apps, browser extension, Dart CLI/SDK/computerd, TypeScript SDK, MCP server, plugin checker, contracts, safety rules and docs; run the right checks and send a pull request. Use when editing client/, apps/extension, dart/, packages/*, infra/images/computer, infra/egress-proxy or docs-site/ in a Casama clone."
---

# Contribute to the Casama repo

`casama-ai/casama` holds Casama's open parts. The Casama Engine (API, worker, agent, database) is
closed and not in the repo; the apps and CLI run against Casama Cloud (`https://api.casama.ai`).
Licenses: AGPL-3.0 for the apps, extension, `computerd`, safety rules, computer image and network
guard; Apache-2.0 for the SDKs, CLI, MCP server, plugin checker, contracts, formats, kit and docs
(`LICENSING.md`).

Full page: https://docs.casama.ai/develop/contributing.md

## Where things live

| Folder | What |
| --- | --- |
| `client` | Flutter apps (iOS, Android, macOS, Windows, Linux, web), `client/ios/CasamaWatch`, `client/wear` |
| `apps/extension` | Browser extension (Chrome, Edge, Firefox, Safari) |
| `packages/contracts` | Every API route and schema (Zod). Source of `openapi.json` and the Dart client |
| `packages/client` | TypeScript SDK (`@casama/client`) |
| `packages/mcp`, `packages/plugin-check` | `@casama/mcp` (stdio MCP server), `casama-plugin-check` (also a GitHub Action) |
| `packages/formats` | Skill, pack, template, plugin and gallery file formats |
| `packages/safety` | When a bot must ask first, website rules, roles, quiet hours, secret redaction |
| `dart/casama_api` | Generated Dart REST client: **never edit by hand** |
| `dart/casama_sdk`, `dart/cli`, `dart/computerd` | Dart SDK, `casama` CLI, agent inside each computer |
| `infra/images/computer`, `infra/egress-proxy` | The bot's computer image; the network guard |
| `agent-kit`, `examples`, `packs`, `skills` | Build-on-Casama kit |
| `docs-site` | Public docs (VitePress) |

The root `package.json`, `pnpm-workspace.yaml`, `pnpm-lock.yaml`, `biome.json`, `turbo.json`,
`tsconfig.base.json` and `.gitignore` are written by the sync from Casama's private repo: don't
change them in a pull request; say what's needed instead.

## Run it

Needs Node.js 24+, pnpm 12, Dart 3, Flutter 3.50.

```sh
pnpm install
cd client && flutter run -d macos --dart-define=CASAMA_API_URL=https://api.casama.ai
cd dart/cli && dart run bin/casama.dart config --api-url https://api.casama.ai
pnpm --filter @casama/docs dev                # docs on http://localhost:5173
```

## Checks (run what applies; CI runs all on pull requests)

```sh
pnpm -r run typecheck                         # every TypeScript package
pnpm -r run test                              # their tests, incl. egress-proxy and extension
pnpm gen && git diff --exit-code              # after a packages/contracts change
(cd dart && dart pub get && dart analyze && dart test cli casama_sdk computerd)
(cd client && flutter pub get && flutter gen-l10n && flutter analyze && flutter test)
pnpm --filter @casama/docs build              # fails on broken links
```

One package: `pnpm --filter @casama/safety test`. One app test: `cd client && flutter test test/<file>_test.dart`.

## Rules for every change

1. **Open folders only**; the engine isn't here. Server-side needs go in an issue.
2. **Contracts first.** Change `packages/contracts`, run `pnpm gen`, commit its output. Never edit
   generated Dart.
3. **No secrets** in code, logs, fixtures or test output.
4. **Tests with every change.** Fix the cause; never skip a failing test.
5. **App text** goes in `client/lib/l10n/app_en.arb`.
6. **New dependencies** at their latest compatible version and compatible with the folder's
   license; upgrades in their own commit.
7. **Docs change with behavior** in `docs-site/`. Write for users: plain words, the app's exact
   labels in **bold**, real commands.
8. **Format only what you touch:** `npx biome check --write <files>` on TypeScript you changed,
   `dart format <files>` only on Dart files you created. Never reformat whole folders.

## Sending a change

1. Fork, branch from `main`, small focused commits with tests.
2. Sign off every commit (DCO): `git commit -s -m "Fix watch complication refresh"`.
3. Open a PR on `casama-ai/casama` with the template, and sign the one-time CLA (`CLA.md`) by
   commenting on the first PR.
4. If it's accepted, a maintainer copies it into Casama's private repo with the author as
   co-author; the next sync commit carries it back, and the PR is closed with a link to that
   commit (closed, not merged).
5. Big change: start a GitHub Discussion first. Security issue: follow `SECURITY.md`, not an issue.

## Checklist

- [ ] Only open folders changed; generated root files untouched
- [ ] Contract changed first and `pnpm gen` output committed
- [ ] Tests added; typecheck, tests, `dart analyze`/`dart test`, `flutter analyze`/`flutter test` pass as they apply
- [ ] Only touched files formatted; no secrets anywhere
- [ ] Docs page updated in `docs-site/` and docs build passes
- [ ] Commits signed off; CLA signed
