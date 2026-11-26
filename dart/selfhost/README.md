# casama_selfhost

Installs, updates and checks a self-hosted Casama server from its public release. Pure Dart (no
Flutter, no bash, no OpenSSL): the desktop apps (Mac DMG, Windows, Linux) and the `casama` CLI use
it on every platform, with Docker as the only requirement. Apache-2.0.

The interface is fixed in `docs/SELF-HOSTING-PLAN.md` §11.7 (private repo); the release format in
§11.2 and the server's status and license API in §11.5 and §11.6.

## Quick start

```dart
import 'dart:io';
import 'package:casama_selfhost/casama_selfhost.dart';

final manifest = await fetchManifest(); // the newest release (selfhost-latest)
final dir = defaultInstallDir();        // ~/.casama/selfhost
await for (final step in install(
  manifest: manifest,
  dir: dir,
  options: InstallOptions.local(httpPort: 8080), // or InstallOptions(domain: 'casama.example.com')
)) {
  print('${step.step.name}: ${step.message} ${step.fraction ?? ''}');
}
// The server now answers at readyUrl(dir). Give it the free personal license:
final s = await status(Uri.parse(readyUrl(dir)));
final lic = await requestPersonalLicense(
  accessToken: cloudSession.accessToken, // the person's Casama Cloud session
  instanceId: s.instanceId!,
  engineVersion: s.engineVersion ?? manifest.version,
);
await putLicense(Uri.parse(readyUrl(dir)), lic.license);
```

`install` and `update` return a `Stream<InstallProgress>`; a failure ends the stream with a
`SelfhostException` (`code` for programs, `message` for people). Cancelling the subscription does
not stop work already started (a pull or `compose up` finishes on its own).

## API

### Releases

- `Future<SelfhostManifest> fetchManifest({Uri? url, http.Client? client})`: reads
  `manifest.json`; `url` defaults to `latestManifestUrl`
  (`https://github.com/casama-ai/casama/releases/download/selfhost-latest/manifest.json`).
  A pinned release: `https://github.com/casama-ai/casama/releases/download/selfhost-v<version>/manifest.json`.
- `SelfhostManifest`: `schema` (1), `version` (`YYYY.M.D-<commit>`), `released`, `bundleUrl`,
  `bundleSha256`, `minAppBuild` (compare with the app's build number before offering it),
  `images` (`server`, `supervisor`, `migrate`, `computer-headless`, `computer-desktop`,
  `egress-proxy`, `turn`, `connector`, `backup` → `ghcr.io/casama-ai/…@sha256:…`), `toJson()`,
  `imagesEnv()`. Refuses a manifest whose images aren't pinned by digest.

### Install and update

- `Stream<InstallProgress> install({required SelfhostManifest manifest, required Directory dir, required InstallOptions options, SelfhostInstaller? installer})`:
  checks Docker, downloads the bundle and checks its sha256, unpacks it, writes `images.env` and
  `manifest.json`, writes `.env` (every secret generated in Dart: Postgres and worker passwords,
  JWT secret, anon and service-role keys signed with it, realtime and Phoenix keys, supervisor,
  computer, egress, internal, TURN, SearXNG and metrics tokens, the SAML RSA key, the sign-up hook
  secret, the content encryption key, and `CASAMA_INSTANCE_ID`), runs `docker compose pull` (5
  tries) and `up -d`, and waits for `/readyz`. Running it again keeps `.env`: data, keys and the
  instance id stay; only missing settings are added.
- `Stream<InstallProgress> update({required Directory dir, required SelfhostManifest manifest, bool force = false, SelfhostInstaller? installer})`:
  downloads and checks the new bundle, backs up the database (`backups/update-<time>/postgres.dump`)
  and the current files, unpacks, pulls, `up -d`, waits for health, and on failure puts the
  previous `images.env` and files back and starts them again (`update_rolled_back`, or
  `update_failed` if the old release didn't come back either). A failed download, backup or pull
  changes nothing. Same version: a single `done` step unless `force`.
- `InstallOptions({String? domain, int httpPort = 80, int httpsPort = 443, String? instanceId, String? licenseKey, String? adminEmail, String? licenseServer, bool behindProxy = false, String? turnHost, bool search = false, bool withDesktop = false, bool backups = false, bool monitoring = false, bool start = true, Map<String, String> settings = const {}})`.
  No `domain` means `local` (this machine only, loopback, plain HTTP). `InstallOptions.local(...)`
  is the short form.
- `InstallProgress`: `step` (`InstallStep.checkDocker`, `download`, `extract`, `configure`,
  `backup`, `pull`, `start`, `waitReady`, `rollback`, `done`), `message`, `fraction` (0..1 while
  downloading).
- `SelfhostInstaller({ProcessRunner? runner, http.Client? client, SecretSource? secrets, delay, readyTimeout, pollInterval, isLinux, isWindows})`:
  the same `install`/`update` with your own process runner, HTTP client and clock (tests).

### Server status and licenses

- `Future<SelfhostStatus> status(Uri server, {http.Client? client})`: `GET /v1/selfhost/status`.
  `SelfhostStatus`: `licensing`, `state` (`setup`|`active`|`grace`|`expired`), `edition`,
  `instanceId`, `expiresAt`, `graceUntil`, `members`, `seats`, `engineVersion`, `needsLicense`.
- `Future<IssuedLicense> requestPersonalLicense({required String accessToken, required String instanceId, required String engineVersion, Uri? licenseServer, http.Client? client})`:
  `POST /v1/selfhost/licenses/personal` on Casama Cloud (`defaultLicenseServer`,
  https://api.casama.ai) with the person's Cloud session.
- `Future<void> putLicense(Uri server, String license, {String? accessToken, http.Client? client})`:
  `PUT /v1/selfhost/license`. A server without a license takes it from anyone; after that pass an
  instance admin's session on that server.

### Helpers

- `defaultInstallDir()`: `~/.casama/selfhost` (`%USERPROFILE%\.casama\selfhost`), or
  `$CASAMA_SELFHOST_HOME`.
- `readyUrl(dir)`: the address to reach the install from this machine. `installedVersion(dir)`,
  `installedManifest(dir)`.
- `selfhostComposeArgs(dir)`: `docker` arguments for the install (`compose -f … --env-file .env
  --env-file images.env` plus its profiles); append `ps`, `logs api`, `down`.
- `EnvFile`, `configureEnv`, `profilesFor`, `SecretSource`, `downloadBundle`, `extractBundle`,
  `ProcessRunner`, `SystemProcessRunner`.

## Install folder

```
docker-compose.yml  Caddyfile  kong.yml  db/  searxng/  monitoring/  install.sh  README.md
images.env          pinned images (rewritten by every install and update)
manifest.json       the release this folder runs
.env                settings and secrets (0600; written once, never replaced)
backups/            database dumps and previous files from updates
```

The folder is also a valid `casama selfhost --dir <folder> …` target, and `./install.sh` in it
does the same install with bash on a server.
