# Licensing

DRAFT for legal review.

Casama's apps, `computerd`, SDKs, CLI and MCP server are open source (AGPL-3.0 and Apache-2.0), and
so is everything that decides what a bot may do: the safety rules, the bot's computer and its
network guard. Casama Cloud runs on the Casama Engine, which is not open source.

You can read exactly when a Casama bot must ask you first, what it may never do, what's on its
computer and what its network allows.

## What is open

| Folder | License |
|---|---|
| `client/` (apps for iOS, Android, macOS, Windows, Linux and the web; `client/ios/CasamaWatch`; `client/wear`) | [AGPL-3.0-only](LICENSES/AGPL-3.0.txt) |
| `apps/extension` (browser extension) | AGPL-3.0-only |
| `dart/computerd` (the agent inside each computer) | AGPL-3.0-only |
| `packages/safety` (when a bot must ask first, what it may never do on websites, roles, quiet hours, hiding secrets) | AGPL-3.0-only |
| `infra/images/computer` (what is installed on a bot's computer) | AGPL-3.0-only |
| `infra/egress-proxy` (the network guard every computer goes through) | AGPL-3.0-only |
| `packages/client`, `dart/casama_api`, `dart/casama_sdk` (SDKs) | [Apache-2.0](LICENSES/Apache-2.0.txt) |
| `dart/cli` (the `casama` command) | Apache-2.0 |
| `packages/mcp`, `packages/plugin-check` | Apache-2.0 |
| `packages/contracts` (API schemas and the OpenAPI document) | Apache-2.0 |
| `packages/formats` (skill, pack, template and plugin file formats) | Apache-2.0 |
| `agent-kit/`, `examples/`, `packs/`, `skills/` | Apache-2.0 (adapted skills keep their own license file) |
| `docs-site/` | Apache-2.0 |

Each folder has its own `LICENSE` file. Third-party code keeps its own license.

## What AGPL-3.0 means for the apps

- Using the apps, for yourself, your family, your company or your customers, costs nothing and
  needs no key.
- If you change an app and let other people use it, over a network or by giving them a copy, you
  must offer them your changed source under AGPL-3.0.
- If you ship a changed copy, keep [NOTICE](NOTICE) and use your own name and logo.

## What Apache-2.0 means for the kit

Use the SDKs, CLI, MCP server, schemas and formats in anything, open or closed. Plugins, bots and
apps you build on Casama through its API are your own work, under any license you like.

## What is not in this repo

The **Casama Engine** is not open source and is not in this repo. It is the API, the worker, the
agent, the supervisor, the database and the rest of what runs on Casama's servers. Casama Cloud runs
on it. The open apps call the engine's API, and the schemas for that API are in
`packages/contracts`, so you can see what it accepts and returns.

Self-hosting the engine is not offered for now. Stackwares may later offer a free license for one
person or household for non-commercial use, and paid licenses for businesses. Write to
hello@casama.ai.

## Name and logo

"Casama", the logo and the mascots are trademarks of Stackwares. No license here covers them. See
[TRADEMARKS.md](TRADEMARKS.md).

## Contributing

Every contribution needs the [CLA](CLA.md). See [CONTRIBUTING.md](CONTRIBUTING.md).

## Questions

Licensing, commercial licenses or partnerships: hello@casama.ai.
