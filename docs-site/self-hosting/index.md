# Self-hosting

::: info Available from the next release
Self-hosting returns with the next release. Until it ships, the downloads, commands and app buttons in these pages aren't available yet.
:::

Casama runs on Casama Cloud, or on your own computer or server. Self-hosted, one machine with Docker
runs the whole stack: Supabase (Postgres, Auth, REST and Realtime), the Casama API and worker, the
sandbox supervisor and egress proxy for bot computers, the TURN relay for live view, and Caddy for
HTTPS. You bring your own model keys or a model you run yourself.

## Personal and business

| | Personal | Business |
| --- | --- | --- |
| **For** | One person, personal use. Not for work or a business | Work and companies |
| **Price** | Free | $29 per active user a month, or $24 a month billed yearly. [Contact us](mailto:partners@casama.ai) |
| **How you get it** | Sign in with your Casama account | A business key. A 30-day trial key comes from [casama.ai/self-hosted](https://casama.ai/self-hosted) |
| **People** | One member | Active users up to the seats on the license |
| **Bots** | As many as your machine runs | As many as your machine runs |
| **Models** | Your own provider keys and OpenAI-compatible endpoints, local ones included, free. Or [Casama Cloud models](/self-hosting/casama-link-cloud) with any Cloud plan | Your own provider keys and OpenAI-compatible endpoints, free. Or [Casama Cloud models](/self-hosting/casama-link-cloud) with any Cloud plan |
| **Workspace sharing, SSO, audit export** | No | Business. SSO and audit forwarding come with annual licenses |

A personal license includes a [Casama Link](/self-hosting/remote-access) address for your phone.
A license renews itself online. When one runs out, your data stays yours to read and export. See
[Licenses](/self-hosting/licenses).

## What is open and what is closed

Casama's apps, `computerd`, SDKs, CLI and MCP server are open source (AGPL-3.0 and Apache-2.0), and
so is everything that decides what a bot may do: the safety rules, the bot's computer and its
network guard. Casama Cloud runs on the Casama Engine, which is not open source.

To run the engine yourself, you install it as signed container images under a license. The images
need no registry login. The open parts, including the computer images and the egress proxy, are
built from the public source. See
[LICENSING.md](https://github.com/casama-ai/casama/blob/main/LICENSING.md).

## Two ways to install

- **[On your computer](/self-hosting/desktop):** one click in the Mac app downloaded from casama.ai,
  or in the Windows or Linux desktop app.
- **[On a server](/self-hosting/server):** the self-host release from GitHub, installed with
  `install.sh` or `casama selfhost install`.

Then see [Updates and rollback](/self-hosting/updates), [What goes home](/self-hosting/what-goes-home),
[Configuration](/self-hosting/configuration) and [Operations](/self-hosting/operations).

## What you get

The install starts these services with Docker Compose (project `casama-selfhost`, so it never collides with another Casama stack on the same machine):

| Service         | What it does                                                                                                 |
| --------------- | ------------------------------------------------------------------------------------------------------------ |
| `caddy`         | The one public address. Gets TLS certificates automatically and routes requests to the API, Supabase or the web app. |
| `api`           | The Casama API (port 8787 inside the stack), plus Pages on port 8790.                                         |
| `worker`        | Runs bots: chats, routines, memory, connections and scheduled jobs.                                          |
| `db`            | Supabase Postgres 17. Holds all data, including encrypted secrets in Supabase Vault.                         |
| `auth`          | Supabase Auth (accounts, sign-in, two-step sign-in, SAML SSO).                                               |
| `rest`          | PostgREST, used by the apps for reads.                                                                       |
| `realtime`      | Supabase Realtime, which streams chat and run updates to the apps.                                           |
| `kong`          | The Supabase gateway in front of Auth, REST and Realtime.                                                    |
| `migrate`       | Runs once at each start. Waits for Auth and Realtime, then applies Casama's database migrations.             |
| `supervisor`    | Creates, sleeps and wakes bot computers. The only service with access to the Docker socket.                   |
| `egress`        | The only route from computers to the internet. Blocks private, loopback and cloud metadata addresses.        |
| `turn`          | A coturn relay for live view of desktop computers.                                                           |

Optional Compose profiles add more:

| Profile      | Services                                   | Turn it on with                                    |
| ------------ | ------------------------------------------ | -------------------------------------------------- |
| `monitoring` | Prometheus, node-exporter and Grafana      | The installer option `--monitoring`                |
| `search`     | SearXNG, free web search for bots          | The installer option `--search`                            |
| `backup`     | Daily off-site backups                     | The installer option `--backups`                           |
| `link`       | `connector`: Casama Link's tunnel, a public address with no domain | `casama selfhost remote on`, see [Use your server on your phone](/self-hosting/remote-access) |
| `pdf`        | Gotenberg, for **Export PDF** on pages     | See [Page PDFs](/self-hosting/configuration#page-pdfs) |
| `s3`         | SeaweedFS, S3-compatible object storage    | See [Object storage](/self-hosting/configuration#object-storage) |

How a request flows:

```text
Apps, CLI, browser
        |
        v
  Caddy :80/:443 --- /v1, /hooks, /link, /oauth, /mcp, /a2a, ----> api :8787
        |      |     /links, /telephony, /healthz, /readyz, /.well-known/...
        |      \---- /auth/v1, /rest/v1, /realtime/v1 --------> kong ---> auth, rest, realtime
  Caddy :8790 ------ Pages (bots' web pages, own origin) ------> api :8790

  worker ---> supervisor ---> computer containers (one private network each)
                                   |-- internet only through egress
                                   \-- live view media only through turn :3478
```

Bot computers are Docker containers named `casama-c-<id>`. They run as a non-root user with a
read-only root filesystem, no Linux capabilities, CPU, memory and process limits, and a private
network whose only way out is the egress proxy. See [Computer providers](/self-hosting/computers)
for details and for running computers on E2B, Daytona, Kubernetes and others.

## Related

- [Install on your computer](/self-hosting/desktop)
- [Install on a server](/self-hosting/server)
- [Licenses](/self-hosting/licenses)
- [Updates and rollback](/self-hosting/updates)
- [What goes home](/self-hosting/what-goes-home)
- [Configuration](/self-hosting/configuration)
- [Operations](/self-hosting/operations)
- [Computer providers](/self-hosting/computers)
- [Use your server on your phone](/self-hosting/remote-access)
- [Casama Cloud models, computers and credits](/self-hosting/casama-link-cloud)
- [Move to Casama Cloud](/self-hosting/move-to-cloud)
- [Troubleshooting](/self-hosting/troubleshooting)
- [Quick start](/quick-start)
- [CLI](/develop/cli)
- [Self-hosted AI agent with Docker, step by step](https://casama.ai/learn/how-to-self-host-an-ai-agent) (on casama.ai)
