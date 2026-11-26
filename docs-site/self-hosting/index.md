# Self-hosting

::: warning Self-hosting is paused
Self-hosting is paused while the Casama Engine moves to a separate license. The install commands on this page are removed for now, and the rest is kept as a reference. Casama Cloud is the way to run Casama today.
:::

Self-hosted Casama ran on your own hardware. One machine with Docker ran the whole stack: Supabase (Postgres,
Auth, REST and Realtime), the Casama API and worker, the sandbox supervisor and egress proxy for bot
computers, the TURN relay for live view, and Caddy for HTTPS. 

This page is kept as a reference. It covers what the stack contains and what it needed. See
[Configuration](/self-hosting/configuration) for every setting and
[Operations](/self-hosting/operations) for upgrades, backups and monitoring.

## What you get

The installer started these services from `infra/compose/docker-compose.yml` (Compose project
`casama`):

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
| `web`        | The web app at the same address            | installer option `--web`                               |
| `monitoring` | Prometheus, node-exporter and Grafana      | installer option `--monitoring`                        |
| `search`     | SearXNG, free web search for bots          | installer option `--search`                            |
| `backup`     | Daily off-site backups                     | installer option `--backups`                           |
| `link`       | `connector`: Casama Link's tunnel, a public address with no domain | `casama selfhost remote on`, see [Use your server on your phone](/self-hosting/remote-access) |
| `pdf`        | Gotenberg, for **Export PDF** on pages     | See [Page PDFs](/self-hosting/configuration#page-pdfs) |
| `s3`         | SeaweedFS, S3-compatible object storage    | See [Object storage](/self-hosting/configuration#object-storage) |
| `images`     | Build-only services for the computer images | Used by the installer                             |

How a request flows:

```text
Apps, CLI, browser
        |
        v
  Caddy :80/:443 --- /v1, /hooks, /link, /oauth, /mcp, /a2a, ----> api :8787
        |      |     /links, /telephony, /healthz, /readyz, /.well-known/...
        |      \---- /auth/v1, /rest/v1, /realtime/v1 --------> kong ---> auth, rest, realtime
        |       \--- everything else ------------------------> web (profile "web")
  Caddy :8790 ------ Pages (bots' web pages, own origin) ------> api :8790

  worker ---> supervisor ---> computer containers (one private network each)
                                   |-- internet only through egress
                                   \-- live view media only through turn :3478
```

Bot computers are Docker containers named `casama-c-<id>`. They run as a non-root user with a
read-only root filesystem, no Linux capabilities, CPU, memory and process limits, and a private
network whose only way out is the egress proxy. See [Computer providers](/self-hosting/computers)
for details and for running computers on E2B, Daytona, Kubernetes and others.

## Requirements

| What        | Minimum                                                                                                    |
| ----------- | ---------------------------------------------------------------------------------------------------------- |
| OS          | Linux with Docker Engine. macOS with Docker Desktop works for trials.                                      |
| Docker      | Docker Engine with Docker Compose v2 (`docker compose`). Your user must be able to run `docker`.           |
| Tools       | `git`, `bash`, `openssl` and `curl`                                                                        |
| CPU and RAM | 4 vCPU and 8 GB RAM for a few computers at once. Plan on about 2 GB RAM per running computer.             |
| Disk        | 40 GB or more. The images take about 10 GB; home folders and snapshots take the rest.                      |
| Domain      | For a public server, a DNS name (for example `casama.example.com`) pointing at the machine.               |

The installer warns when the machine has less than about 8 GB of memory, because computers may not
start reliably.

### Ports

| Port            | Protocol  | Used for                                                              |
| --------------- | --------- | --------------------------------------------------------------------- |
| 80              | TCP       | HTTP, and Let's Encrypt certificate checks                            |
| 443             | TCP       | HTTPS: the API, Supabase and the web app                              |
| 3478            | UDP, TCP  | TURN relay for live view                                              |
| 8790            | TCP       | Pages, when you serve them on a port instead of their own domain      |
| 127.0.0.1:3001  | TCP       | Grafana (monitoring profile), on the loopback interface only          |

For a public server, open 80, 443 and 3478 (UDP and TCP) in your firewall. With `--local`, nothing
needs to be reachable from other machines. To use a `--local` server from your phone without a
domain or open ports, see [Use your server on your phone](/self-hosting/remote-access).

### Domain and TLS

With `--domain`, Caddy requests a certificate for that name the first time it starts. Before you
install, make sure:

- the domain's A (or AAAA) record points at the server, and
- ports 80 and 443 are reachable from the internet.

If another proxy already terminates TLS in front of the machine, see
[Behind another proxy](/self-hosting/configuration#behind-another-proxy).

## Install

The install steps are removed while self-hosting is paused. See the note at the top of this page.

## First sign-in and the instance owner

The first account created on a new server becomes the **instance owner**. Owners get the admin
console under Settings, where they can see the health of each service, manage workspaces and check
for updates.

<figure class="casama-shot"><img class="shot-light" src="/screens/admin-overview-v2-light.webp" alt="The admin console Overview: a Needs attention list, then tiles for users, workspaces, bots, spend and runs"><img class="shot-dark" src="/screens/admin-overview-v2-dark.webp" alt=""><figcaption>The Overview: what needs attention, then the numbers.</figcaption></figure>

The admin console locks after five minutes without activity, when the app goes into the
background, and when you leave it. **Lock now** locks it immediately. Unlock with your account
password or an emailed one-time code (emailed codes require SMTP); an account with two-step
sign-in also enters its authenticator code. The rest of the app stays signed in. Admin changes
ask you to confirm with a fresh sign-in, at most once every 45 seconds.

<figure class="casama-shot"><img class="shot-light" src="/screens/admin-lock-v2-light.webp" alt="The locked admin console: a Password and Email switcher, a password field and a Verify button"><img class="shot-dark" src="/screens/admin-lock-v2-dark.webp" alt=""><figcaption>The locked console. Unlock with your password or an emailed code.</figcaption></figure>

Besides your password, there are three ways to unlock the console and confirm a change:

- **Screen lock** in the iPhone, iPad and Android apps, and in the Mac app downloaded from
  casama.ai or the Mac App Store. After you unlock with a passkey or your password, the app
  offers to set it up (or use **Admin → Security**). The device makes a key in its secure chip
  that only works after Face ID, Touch ID, a fingerprint or the device's passcode or password; it
  signs a one-time challenge from your server, which checks it with the key's public half. The
  private key never leaves the device. Devices are listed, and can be removed, under
  **Admin → Security**. A Mac app you build yourself without Apple signing can't keep such a key,
  so it doesn't offer this.
- **Verify with a passkey** where the app can use your passkeys (the web, and the iPhone and
  Android apps on servers whose passkeys are for `casama.ai`): one Face ID, fingerprint or device
  passcode prompt.
- **An admin PIN** of 6 digits, set under **Admin → Security**. It is kept on your server as a
  salted hash, never on the device, and only confirms a device that is already signed in. Obvious
  PINs (000000, 123456, 121212 and the like) are refused. Five wrong PINs in a row turn it off and
  email you; set a new one afterwards. Setting, changing or removing the PIN, or adding a phone,
  takes Face ID on a phone that's already set up, a passkey or your password, never the PIN.

Each of these counts as both steps, also on an account with an authenticator. The server records
the check on the session you are signed in with (`POST /v1/admin/checks/device`,
`/v1/admin/checks/passkey` and `/v1/admin/checks/pin`), and it counts like a fresh sign-in for that
session only. Your password is the fallback, followed by the authenticator code when the account
has two-step sign-in.

The API independently requires a sign-in from the last five minutes for admin reads and the
last minute for changes, and the two-step code when the account has an authenticator. Token
refresh does not extend these windows, so even an active console occasionally asks you to verify
again. The same one-minute check applies to approving the admin bot's actions, to making a
scan-to-sign-in code as an instance owner, and to changing a gallery request. API and CLI callers
must authenticate again when receiving `admin_reauthentication_required` or
`admin_confirmation_required` (HTTP 403). Custom authentication hooks must preserve the signed
`amr` authentication methods and timestamps and the `aal` claim; missing proof is refused, even
when the token itself has just been issued. The owner-only overview used to discover the console
in Settings remains available with the ordinary session; its aggregate instance counts remain
visible without unlocking.

1. Open the Casama app and point it at your server (see the next section).
2. Create an account with email and password.
3. Add a model key (or a local model endpoint) and create your first bot.

A new server doesn't send email, so start with a password: emailed sign-in links need
[SMTP](/self-hosting/configuration#email). New accounts are confirmed automatically until you turn
email confirmation on.

To name the owners explicitly instead, set `INSTANCE_ADMIN_EMAILS` to a comma-separated list of
emails in `infra/compose/.env`, then run `casama selfhost up`.

## Connect the apps and the CLI

**In the app** (iOS, iPadOS, Android, macOS, Windows, Linux):

1. On the sign-in screen, tap **More options**.
2. Tap the **Server** chip, which shows the current server.
3. Enter your server's address, for example `https://casama.example.com`, and tap **Connect**.

The app remembers the address. If it can't reach a server, the error screen also offers **Use a
different server**. The web app (`--web`) always uses the address it's served from.

**With the CLI:**

```sh
casama config --api-url https://casama.example.com
casama signup --email you@example.com     # or: casama login --email you@example.com
```

You can also pass the address for a single command with the global `--api` option
(`casama --api https://casama.example.com login --email you@example.com`) or set `CASAMA_API_URL`.

## Production hardening

### Use gVisor for computers

gVisor (`runsc`) gives each computer its own kernel boundary. Install it on the Linux host and
register it with Docker (see the gVisor documentation), then check that Docker lists it:

```sh
docker info | grep -i runsc
```

A first install picks it up automatically. On an existing install, set it yourself:

1. In `infra/compose/.env`, set `SANDBOX_RUNTIME=runsc`.
2. Run `casama selfhost up`.

New computers start under gVisor. Running computers keep their runtime until they sleep and wake.

Without gVisor, computers use Docker's default runtime (runc) together with the other controls: a
non-root user, a read-only root filesystem, no capabilities, `no-new-privileges`, per-computer
networks, the egress proxy and resource limits.

### Run computers on a second host

For public servers, keep untrusted code and the Docker socket off the machine that holds your data.
Run the supervisor, egress proxy and TURN relay on a second host, and point the API and worker at it
over a private network or WireGuard. See
[Run computers on a separate host](/self-hosting/operations#run-computers-on-a-separate-host).

### Firewall

- Allow inbound 80/tcp, 443/tcp and 3478 (UDP and TCP) only. Allow 8790/tcp only if you serve Pages
  on a port.
- Keep Grafana on the loopback interface and reach it through an SSH tunnel.
- Never expose the supervisor (8788), the API's internal port (8787) or Postgres to the internet.
- Docker's published ports bypass some host firewalls (ufw, for example). Check from another
  machine that only the ports above answer.

### Other checks

- Serve Pages from their own domain, so bots' pages never share an origin with Casama. See
  [Pages](/self-hosting/configuration#core-and-urls).
- Turn on email confirmation and set up [SMTP](/self-hosting/configuration#email).
- Restrict who can sign up with `DISABLE_SIGNUP` or the
  [sign-up allowlist](/self-hosting/configuration#sign-ups-and-allowlists).
- Set up [encrypted backups](/self-hosting/operations#back-up-your-server) and copy them off the
  machine.
- Consider [encryption at rest](/self-hosting/configuration#encryption-keys) for workspace content.
- Keep `COMPUTER_HOST_MEMORY_GB` at a number the machine can hold. See
  [Server capacity](/self-hosting/operations#server-capacity).

## Related

- [Configuration](/self-hosting/configuration)
- [Operations](/self-hosting/operations)
- [Computer providers](/self-hosting/computers)
- [Use your server on your phone](/self-hosting/remote-access)
- [Troubleshooting](/self-hosting/troubleshooting)
- [Quick start](/quick-start)
- [CLI](/develop/cli)
- [Self-hosted AI agent with Docker, step by step](https://casama.ai/learn/how-to-self-host-an-ai-agent) (on casama.ai)
