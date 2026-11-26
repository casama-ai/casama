# Install on a server

Run Casama on a Linux server, a home server or a Mac with Docker. The self-host release on GitHub
holds everything the install needs: a compose file, the Caddy, gateway and search settings,
`install.sh`, and `images.env`, which pins every image. You don't need a GitHub account or a
registry login.

A server needs a license before it does any work. A personal license is free. See
[Licenses](/self-hosting/licenses).

## Requirements

| What        | Minimum                                                                                                    |
| ----------- | ---------------------------------------------------------------------------------------------------------- |
| OS          | Linux with Docker Engine. macOS with Docker Desktop works for trials.                                      |
| Docker      | Docker Engine with Docker Compose v2 (`docker compose`). Your user must be able to run `docker`.           |
| Tools       | `bash`, `openssl`, `curl` and `tar`                                                                        |
| CPU and RAM | 4 vCPU and 8 GB RAM for a few computers at once. Plan on about 2 GB RAM per running computer.             |
| Disk        | 40 GB or more. The images download as about 2.5 GB and take about 10 GB once unpacked; home folders and snapshots take the rest.                      |
| Domain      | For a public server, a DNS name (for example `casama.example.com`) pointing at the machine.               |
| Internet    | Outbound HTTPS to download images, and to renew the license at `api.casama.ai`.                           |

The installer warns when the machine has less than about 8 GB of memory, because computers may not
start reliably.

### Ports

| Port            | Protocol  | Used for                                                              |
| --------------- | --------- | --------------------------------------------------------------------- |
| 80              | TCP       | HTTP, and Let's Encrypt certificate checks                            |
| 443             | TCP       | HTTPS: the API and Supabase                                           |
| 3478            | UDP, TCP  | TURN relay for live view                                              |
| 8790            | TCP       | Pages, when you serve them on a port instead of their own domain      |
| 127.0.0.1:3001  | TCP       | Grafana (monitoring profile), on the loopback interface only          |

For a public server, open 80, 443 and 3478 (UDP and TCP) in your firewall. With `--local`, nothing
needs to be reachable from other machines. With `--lan`, open the HTTP port (and 3478 for live view)
to your local network only. To use a `--local` server from your phone without a
domain or open ports, see [Use your server on your phone](/self-hosting/remote-access).

### Domain and TLS

With `--domain`, Caddy requests a certificate for that name the first time it starts. Before you
install, make sure:

- the domain's A (or AAAA) record points at the server, and
- ports 80 and 443 are reachable from the internet.

If another proxy already terminates TLS in front of the machine, see
[Behind another proxy](/self-hosting/configuration#behind-another-proxy).

## Install with the CLI

Install the [`casama` CLI](/develop/cli), then run one of these:

```sh
casama selfhost install --domain casama.example.com   # a public server with automatic HTTPS
casama selfhost install --local                       # this machine only, plain HTTP
casama selfhost install --lan                         # this machine and your local network, plain HTTP
```

The command downloads the newest release, checks it, writes `.env` with new secrets and
`images.env` with the pinned images, pulls the images, starts the stack and waits for it to answer.
You don't need a copy of any source code.

### Reach it from your local network (`--lan`)

A `--local` server answers only on the machine it runs on. To use it from other devices on the same
network (a phone, another computer), install with `--lan`, or run it again with `--lan` on an
existing `--local` install:

```sh
casama selfhost install --lan                              # finds this machine's LAN address
casama selfhost install --lan --lan-address 192.168.1.20   # or name it (an IP or imac.local)
```

The server then listens on every network interface, and its address becomes
`http://<LAN address>[:port]`, which the command prints when it's done. Enter that address in the app
on the other devices. Your keys and data stay as they were.

::: warning Plain HTTP
`--lan` serves plain HTTP on your local network: anyone on the same network can reach the sign-in
page, and traffic isn't encrypted. Use it on a network you trust. For anything else, use a domain
(`--domain`) or [remote access](/self-hosting/remote-access).
:::

`--lan` is a CLI option. It can't be combined with `--domain`, and it refuses a server that already
has an https address.

## Install with install.sh

The newest release is always listed in one file:
`https://github.com/casama-ai/casama/releases/download/selfhost-latest/manifest.json`. It names the
version, the bundle's address (`bundle_url`) and its SHA-256 (`bundle_sha256`).

1. Read the manifest:

   ```sh
   curl -fsSL https://github.com/casama-ai/casama/releases/download/selfhost-latest/manifest.json
   ```

2. Download the file at `bundle_url`, named `casama-selfhost-<version>.tar.gz`:

   ```sh
   curl -fLO "<bundle_url>"
   ```

3. Check that this prints the same value as `bundle_sha256`:

   ```sh
   sha256sum casama-selfhost-<version>.tar.gz      # macOS: shasum -a 256
   ```

4. Unpack it, go into the new folder and run the installer:

   ```sh
   tar -xzf casama-selfhost-<version>.tar.gz && cd casama-selfhost-<version>
   ./install.sh --domain casama.example.com        # or: ./install.sh --local
   ```

Keep that folder. Its `.env` holds your server's keys, and `images.env` records the version you run.

::: warning Back up `.env`
`.env` includes the server key for encryption at rest (`CONTENT_ENCRYPTION_KEY`, unless AWS KMS is
set) and your server's instance id. Encrypted data can't be read without the key.
:::

| Option | What it does |
| --- | --- |
| `--domain <name>` | A public server at `https://<name>` with automatic HTTPS |
| `--local` | This machine only, over plain HTTP |
| `--http-port <n>` | The host port for HTTP (default `80`) |
| `--license-key <key>` | A license key to start with. Without one the server starts in setup mode |
| `--with-desktop` | Also pulls the desktop computer image, needed for live view. Larger |
| `--monitoring` | Adds Prometheus and Grafana |
| `--search` | Adds SearXNG, so bots can search the web without a search key |
| `--backups` | Adds a daily encrypted off-site backup. See [Operations](/self-hosting/operations#off-site-backups) |
| `--behind-proxy` | TLS ends at a tunnel or another proxy. Needs `--domain` |
| `--turn-host <name>` | The name or IP used for live view, when it differs from `--domain` |
| `--admin-email <list>` | Comma-separated instance admin emails |
| `--settings <file>` | Merges `KEY=VALUE` lines from a file into `.env` |
| `--no-start` | Writes `.env` and pulls the images without starting |

`./install.sh --help` lists them too. Running it again keeps `.env`, so your data, keys and instance
id stay.

### `--local` versus `--domain`

|                     | `--local`                               | `--domain casama.example.com`                 |
| ------------------- | --------------------------------------- | --------------------------------------------- |
| Address             | `http://localhost[:port]`               | `https://casama.example.com`                  |
| TLS                 | None                                    | Automatic (Let's Encrypt through Caddy)       |
| Who can reach it    | This machine                            | Anyone who can reach the domain               |
| Sign-up allowlist   | Available (the hook runs over Docker's network) | Available                             |
| Live view TURN host | `localhost`                             | The domain                                    |

## Verify the images

Every image is signed with [cosign](https://docs.sigstore.dev). `images.env` pins each one by
digest, so the stack runs exactly what the release lists.

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
3. Get your license: see [Get your license](#get-your-license).
4. Add a model key (or a local model endpoint) and create your first bot.

A new server doesn't send email, so start with a password: emailed sign-in links need
[SMTP](/self-hosting/configuration#email). New accounts are confirmed automatically until you turn
email confirmation on.

To name the owners explicitly instead, set `INSTANCE_ADMIN_EMAILS` to a comma-separated list of
emails in `.env` in your install folder, then run `casama selfhost up`.

## Get your license

Until it has a license, a new server is in setup mode: you can sign in, check its status and enter
a license. Nothing else works yet.

- **Personal:** open the Casama app connected to your server and sign in with your Casama account
  when it asks for your free personal license, or run `casama selfhost license personal` on the
  server.
- **Business or trial:** enter the key you were sent.

See [Licenses](/self-hosting/licenses).

## Connect the apps and the CLI

**In the app** (iOS, iPadOS, Android, macOS, Windows, Linux):

1. On the sign-in screen, tap **More options**.
2. Tap the **Server** chip, which shows the current server.
3. Enter your server's address, for example `https://casama.example.com`, and tap **Connect**.

The app remembers the address. If it can't reach a server, the error screen also offers **Use a
different server**.

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

1. In `.env` in your install folder, set `SANDBOX_RUNTIME=runsc`.
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

## Not in this release

A Helm chart for Kubernetes is planned for a later release. Today the server install is Docker
Compose.

## Related

- [Self-hosting](/self-hosting/)
- [Licenses](/self-hosting/licenses)
- [Updates and rollback](/self-hosting/updates)
- [Configuration](/self-hosting/configuration)
- [Operations](/self-hosting/operations)
- [Troubleshooting](/self-hosting/troubleshooting)
