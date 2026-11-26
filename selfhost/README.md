# Casama self-host bundle

Everything needed to run Casama on your own computer or server with Docker: the compose file,
Caddy, the Supabase gateway (Kong), SearXNG, Prometheus and Grafana settings, and `install.sh`.
The Casama Engine itself ships as signed container images on `ghcr.io/casama-ai`, pinned by digest
in `images.env`. Nothing here is built from source.

## Install

The easy ways, no files to download by hand:

- **Desktop app** (Mac DMG, Windows, Linux): Settings > Run on this computer.
- **CLI**: `casama selfhost install --local` (this machine) or
  `casama selfhost install --domain casama.example.com` (a server with automatic HTTPS).

By hand on a server:

```sh
curl -fsSLO https://github.com/casama-ai/casama/releases/download/selfhost-latest/manifest.json
# manifest.json names the bundle and its sha256; download it, check it, unpack it:
tar xzf casama-selfhost-<version>.tar.gz && cd casama-selfhost-<version>
./install.sh --domain casama.example.com     # or: ./install.sh --local --http-port 8080
```

`install.sh --help` lists every option. Running it again keeps `.env`, so data, keys and the
instance id stay.

## What's in a release

Each release `selfhost-v<version>` on [casama-ai/casama](https://github.com/casama-ai/casama/releases)
has two files:

- `casama-selfhost-<version>.tar.gz`: this folder plus `images.env` (and the auth email templates).
- `manifest.json`: version, release date, the bundle's URL and sha256, the oldest app build that
  can install it, and every image digest.

`selfhost-latest` always holds the newest `manifest.json`. Versions are `YYYY.M.D-<commit>`, the
same build Casama Cloud runs.

Verify an image's signature with cosign (the public key is on each release):

```sh
cosign verify --key cosign.pub ghcr.io/casama-ai/engine-server@sha256:…
```

## Files

| File | What it is |
| --- | --- |
| `docker-compose.yml` | The stack. Reads `.env` (your settings and secrets) and `images.env` (the pinned images). |
| `install.sh` | Checks Docker, writes `.env` once, pulls the images, starts the stack, waits for `/readyz`. |
| `images.env` | Written by each release: `CASAMA_IMAGE_*` digests and `CASAMA_ENGINE_VERSION`. |
| `Caddyfile`, `sites-edge-*.caddy` | One public address for the API and Supabase; HTTPS for your domain. |
| `kong.yml` | The Supabase gateway's routes. |
| `db/` | Passwords and settings for the Supabase roles, run once when the database is created. |
| `searxng/` | Free web search for bots (`--search`). |
| `monitoring/` | Prometheus, alerts and a Grafana dashboard (`--monitoring`). |

## Licenses

This folder is Apache-2.0 (`LICENSE`). The Casama Engine images it pulls are not open source:
personal use is free with a personal license from your Casama account, business use needs a paid
license (partners@casama.ai; terms at https://casama.ai/terms, the full map in
[LICENSING.md](https://github.com/casama-ai/casama/blob/main/LICENSING.md)). The open images (computers, egress proxy, TURN, connector, backup) are built from this
repository.
