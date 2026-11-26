import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

import 'bundle.dart';
import 'env_file.dart';
import 'errors.dart';
import 'manifest.dart';
import 'process.dart';
import 'secrets.dart';
import 'sizes.dart';

/// What the installer is doing; every [InstallProgress] names one.
enum InstallStep { checkDocker, download, extract, configure, backup, pull, start, waitReady, rollback, done }

/// One line of progress from [install] or [update]. [fraction] (0..1) is set while downloading.
class InstallProgress {
  const InstallProgress(this.step, this.message, {this.fraction});
  final InstallStep step;
  final String message;
  final double? fraction;

  @override
  String toString() => '[${step.name}] $message';
}

/// How to install. A [domain] gives a public server with automatic HTTPS; without one the server
/// is for this machine only ([local]), on plain HTTP bound to loopback, or with [lan] for the
/// devices on the local network too (plain HTTP on every interface, at the machine's LAN address).
class InstallOptions {
  InstallOptions({
    String? domain,
    this.httpPort = 80,
    this.httpsPort = 443,
    this.instanceId,
    this.licenseKey,
    this.adminEmail,
    this.licenseServer,
    this.behindProxy = false,
    this.turnHost,
    this.search = false,
    this.withDesktop = false,
    this.backups = false,
    this.monitoring = false,
    this.start = true,
    this.settings = const {},
    this.adoptEnv,
    this.lan = false,
    String? lanAddress,
  }) : domain = (domain == null || domain.trim().isEmpty) ? null : domain.trim(),
       lanAddress = (lanAddress == null || lanAddress.trim().isEmpty) ? null : lanAddress.trim() {
    if (behindProxy && this.domain == null) {
      throw SelfhostException('domain_required', 'Behind a proxy the installer needs the public domain the proxy serves.');
    }
    if (lan && this.domain != null) {
      throw SelfhostException('lan_with_domain', 'A server with a domain is already reachable; the LAN option is for servers without one.');
    }
    if (this.lanAddress != null && !lan) {
      throw SelfhostException('lan_address_without_lan', 'A LAN address needs the LAN option (--lan).');
    }
    final a = this.lanAddress;
    if (a != null && !RegExp(r'^[A-Za-z0-9]([A-Za-z0-9.-]*[A-Za-z0-9])?$').hasMatch(a)) {
      throw SelfhostException('bad_lan_address', 'Not an address on the local network: $a (for example 192.168.1.20 or imac.local).');
    }
  }

  /// A server for this machine only.
  factory InstallOptions.local({
    int httpPort = 80,
    String? instanceId,
    String? licenseKey,
    String? adminEmail,
    bool search = false,
    bool withDesktop = false,
    bool start = true,
    bool lan = false,
    String? lanAddress,
  }) => InstallOptions(
    httpPort: httpPort,
    lan: lan,
    lanAddress: lanAddress,
    instanceId: instanceId,
    licenseKey: licenseKey,
    adminEmail: adminEmail,
    search: search,
    withDesktop: withDesktop,
    start: start,
  );

  final String? domain;
  bool get local => domain == null;
  final int httpPort;
  final int httpsPort;

  /// `CASAMA_INSTANCE_ID`; generated once when null and kept on every later run.
  final String? instanceId;

  /// The `.env` of an earlier install of the same stack in another folder (the desktop app's
  /// local server before the release bundle). When this folder has no `.env`, it is copied in, so
  /// the passwords and keys that the existing Docker volumes were made with carry over.
  final File? adoptEnv;

  /// `CASAMA_LICENSE_KEY` (the desktop app writes the personal key here).
  final String? licenseKey;

  /// `INSTANCE_ADMIN_EMAILS` (comma-separated).
  final String? adminEmail;

  /// `CASAMA_LICENSE_SERVER`; the engine's default (https://api.casama.ai) when null.
  final String? licenseServer;

  /// TLS ends at a proxy or tunnel; Caddy serves plain HTTP on [httpPort] (loopback only).
  final bool behindProxy;

  /// `TURN_PUBLIC_HOST` override for live view.
  final String? turnHost;

  /// SearXNG web search for bots (profile `search`).
  final bool search;

  /// Also pull the desktop computer image (larger).
  final bool withDesktop;

  /// Daily off-site backups (profile `backup`; set the BACKUP_* settings).
  final bool backups;

  /// Prometheus and Grafana (profile `monitoring`).
  final bool monitoring;

  /// False: pull images and stop before starting the stack.
  final bool start;

  /// Extra `KEY=VALUE` settings merged into `.env` (written verbatim).
  final Map<String, String> settings;

  /// Reachable from the local network: Caddy and TURN listen on every interface, and the public
  /// address is `http://<LAN address>[:port]`. Also applied when the installer runs again on an
  /// existing plain-HTTP install. Never with a [domain].
  final bool lan;

  /// The address other devices use with [lan] (an IP, or a name such as `imac.local`); found
  /// from this machine's network interfaces when null ([findLanAddress]).
  final String? lanAddress;
}

/// Installs, updates and checks a self-hosted server. The top-level [install], [update] and
/// [status] use one with the real Docker, network and clock; tests give their own.
class SelfhostInstaller {
  SelfhostInstaller({
    ProcessRunner? runner,
    http.Client? client,
    SecretSource? secrets,
    Future<void> Function(Duration)? delay,
    this.readyTimeout = const Duration(minutes: 3),
    this.pollInterval = const Duration(seconds: 2),
    bool? isLinux,
    bool? isWindows,
    Future<String?> Function()? lanAddress,
  }) : lanAddress = lanAddress ?? findLanAddress,
       runner = runner ?? const SystemProcessRunner(),
       _client = client, // ignore: prefer_initializing_formals
       secrets = secrets ?? SecretSource(),
       delay = delay ?? Future<void>.delayed,
       isLinux = isLinux ?? Platform.isLinux,
       isWindows = isWindows ?? Platform.isWindows;

  final ProcessRunner runner;
  final http.Client? _client;
  final SecretSource secrets;
  final Future<void> Function(Duration) delay;
  final Duration readyTimeout;
  final Duration pollInterval;
  final bool isLinux;
  final bool isWindows;

  /// This machine's address on the local network, for [InstallOptions.lan] without an address.
  final Future<String?> Function() lanAddress;

  Future<T> _withClient<T>(Future<T> Function(http.Client c) f) async {
    final c = _client ?? http.Client();
    try {
      return await f(c);
    } finally {
      if (_client == null) c.close();
    }
  }

  // ------------------------------------------------------------------ install

  /// Runs [body] and streams what it reports; an exception ends the stream with that error and
  /// nothing after it runs.
  Stream<InstallProgress> _stream(Future<void> Function(void Function(InstallProgress) emit) body) {
    late final StreamController<InstallProgress> c;
    c = StreamController<InstallProgress>(
      onListen: () async {
        try {
          await body(c.add);
        } catch (e, st) {
          c.addError(e, st);
        } finally {
          await c.close();
        }
      },
    );
    return c.stream;
  }

  Stream<InstallProgress> install({required SelfhostManifest manifest, required Directory dir, required InstallOptions options}) => _stream((emit) async {
    emit(const InstallProgress(InstallStep.checkDocker, 'Checking Docker'));
    await _checkDocker();
    dir.createSync(recursive: true);
    final envFile = File(p.join(dir.path, '.env'));
    final adopt = options.adoptEnv;
    final adopting = !envFile.existsSync() && adopt != null && adopt.existsSync();
    if (!envFile.existsSync() && !adopting) await _refuseOrphanData(options.settings['COMPOSE_PROJECT_NAME'] ?? defaultStackName, dir);

    final download = _downloadFile(dir, manifest);
    await _download(manifest, download, emit);
    emit(const InstallProgress(InstallStep.extract, 'Unpacking the release'));
    try {
      _recordBundleFiles(dir, extractBundle(download, dir, skip: const {'.env', 'images.env'}));
    } finally {
      download.deleteSync();
    }
    _writeImagesEnv(dir, manifest);

    if (adopting) {
      await _writePrivate(envFile, adopt.readAsStringSync());
      emit(InstallProgress(InstallStep.configure, 'Keeping the keys of the earlier install (${adopt.path})'));
    }
    final fresh = !envFile.existsSync();
    emit(InstallProgress(InstallStep.configure, fresh ? 'Generating secrets' : 'Keeping the existing .env'));
    final env = EnvFile.read(envFile);
    final runtime = await _sandboxRuntime();
    final memGb = await _hostMemoryGb();
    String? lanHost;
    if (options.lan) {
      lanHost = options.lanAddress ?? await lanAddress();
      if (lanHost == null) {
        throw SelfhostException('lan_address', 'Could not find this machine\'s address on the local network; pass it with --lan-address (for example 192.168.1.20).');
      }
    }
    configureEnv(
      env,
      options,
      secrets,
      fresh: fresh,
      sandboxRuntime: runtime,
      hostMemoryGb: memGb,
      internalSignupHook: hasInternalSignupHook(dir),
      lanHost: lanHost,
    );
    await _writePrivate(envFile, env.toString());

    await _pull(dir, emit, withDesktop: options.withDesktop || env['CASAMA_WITH_DESKTOP'] == 'on');
    if (!options.start) {
      emit(InstallProgress(InstallStep.done, 'Images ready; start with: docker ${selfhostComposeArgs(dir).join(' ')} up -d'));
      return;
    }
    emit(const InstallProgress(InstallStep.start, 'Starting the stack'));
    await _up(dir);
    emit(InstallProgress(InstallStep.waitReady, 'Waiting for ${readyUrl(dir)}/readyz'));
    if (!await _waitReady(dir)) {
      throw SelfhostException('not_ready', 'The server did not become ready; check: docker ${selfhostComposeArgs(dir).join(' ')} logs migrate api');
    }
    emit(InstallProgress(InstallStep.done, 'Casama ${manifest.version} is running at ${EnvFile.read(envFile)['CASAMA_PUBLIC_URL']}'));
  });

  // ------------------------------------------------------------------ update

  Stream<InstallProgress> update({required Directory dir, required SelfhostManifest manifest, bool force = false}) => _stream((emit) async {
    final envFile = File(p.join(dir.path, '.env'));
    if (!envFile.existsSync() || !File(p.join(dir.path, composeFileName)).existsSync()) {
      throw SelfhostException('not_installed', 'No self-hosted Casama in ${dir.path}; install it first.');
    }
    final current = installedVersion(dir);
    if (!force && current == manifest.version) {
      emit(InstallProgress(InstallStep.done, 'Already on ${manifest.version}'));
      return;
    }
    emit(const InstallProgress(InstallStep.checkDocker, 'Checking Docker'));
    await _checkDocker();

    // Download first: a bad download changes nothing.
    final download = _downloadFile(dir, manifest);
    await _download(manifest, download, emit);

    // Backup: the database, and the files a rollback puts back.
    final stamp = DateTime.now().toUtc().toIso8601String().replaceAll(RegExp(r'[:.]'), '-').substring(0, 19);
    final backup = Directory(p.join(dir.path, 'backups', 'update-$stamp'))..createSync(recursive: true);
    emit(InstallProgress(InstallStep.backup, 'Backing up the database to ${backup.path}'));
    final dumpCode = await runner.runToFile(
      'docker',
      [...selfhostComposeArgs(dir), 'exec', '-T', 'db', 'pg_dump', '-U', 'postgres', '-Fc', 'postgres'],
      File(p.join(backup.path, 'postgres.dump')),
      workingDirectory: dir.path,
    );
    if (dumpCode != 0) {
      download.deleteSync();
      throw SelfhostException('backup_failed', 'Could not back up the database (is the server running?); nothing was changed.');
    }
    final previous = _snapshot(dir, backup);

    try {
      emit(const InstallProgress(InstallStep.extract, 'Unpacking the new release'));
      _recordBundleFiles(dir, extractBundle(download, dir, skip: const {'.env', 'images.env'}));
      _writeImagesEnv(dir, manifest);
      final env = EnvFile.read(envFile);
      configureEnv(env, InstallOptions(), secrets, fresh: false, internalSignupHook: hasInternalSignupHook(dir));
      await _writePrivate(envFile, env.toString());
      await _pull(dir, emit, withDesktop: env['CASAMA_WITH_DESKTOP'] == 'on');
    } catch (_) {
      // Nothing was started yet: the previous files go back and the running server is untouched.
      _restore(dir, previous);
      rethrow;
    } finally {
      if (download.existsSync()) download.deleteSync();
    }

    emit(InstallProgress(InstallStep.start, 'Starting Casama ${manifest.version}'));
    var ok = await _up(dir, throwOnError: false);
    if (ok) {
      emit(InstallProgress(InstallStep.waitReady, 'Waiting for ${readyUrl(dir)}/readyz'));
      ok = await _waitReady(dir);
    }
    if (ok) {
      emit(InstallProgress(InstallStep.done, 'Updated to ${manifest.version}${current == null ? '' : ' from $current'} (backup in ${backup.path})'));
      return;
    }

    emit(InstallProgress(InstallStep.rollback, 'The new release did not become healthy; going back to ${current ?? 'the previous images'}'));
    _restore(dir, previous);
    final back = await _up(dir, throwOnError: false) && await _waitReady(dir);
    throw SelfhostException(
      back ? 'update_rolled_back' : 'update_failed',
      back
          ? 'Casama ${manifest.version} did not start, so the server went back to ${current ?? 'the previous release'}. The database backup is in ${backup.path}.'
          : 'Casama ${manifest.version} did not start and the previous release did not come back either. The database backup is in ${backup.path}; check: docker ${selfhostComposeArgs(dir).join(' ')} logs migrate api',
    );
  });

  // ------------------------------------------------------------------ pieces

  File _downloadFile(Directory dir, SelfhostManifest m) =>
      File(p.join(dir.path, '.download', 'casama-selfhost-${m.version}.tar.gz'))..parent.createSync(recursive: true);

  Future<void> _download(SelfhostManifest m, File to, void Function(InstallProgress) emit) async {
    final what = 'Downloading Casama ${m.version}';
    emit(InstallProgress(InstallStep.download, what, fraction: 0));
    await _withClient(
      (c) => downloadBundle(
        m.bundleUrl,
        to,
        m.bundleSha256,
        client: c,
        onProgress: (f) => emit(InstallProgress(InstallStep.download, what, fraction: f)),
      ),
    );
  }

  void _writeImagesEnv(Directory dir, SelfhostManifest m) {
    File(p.join(dir.path, 'images.env')).writeAsStringSync(m.imagesEnv());
    File(p.join(dir.path, 'manifest.json')).writeAsStringSync(const JsonEncoder.withIndent('  ').convert(m.toJson()));
  }

  void _recordBundleFiles(Directory dir, List<String> files) => File(p.join(dir.path, '.bundle-files')).writeAsStringSync('${files.join('\n')}\n');

  List<String> _bundleFiles(Directory dir) {
    final f = File(p.join(dir.path, '.bundle-files'));
    final listed = f.existsSync() ? f.readAsLinesSync().where((l) => l.trim().isNotEmpty).toList() : <String>[composeFileName];
    return [...listed, 'images.env', 'manifest.json', '.bundle-files'];
  }

  /// Copies the bundle's files, images.env and .env into [backup]/previous; returns that folder.
  Directory _snapshot(Directory dir, Directory backup) {
    final prev = Directory(p.join(backup.path, 'previous'))..createSync(recursive: true);
    for (final rel in {..._bundleFiles(dir), '.env'}) {
      final src = File(p.join(dir.path, rel));
      if (!src.existsSync()) continue;
      final dst = File(p.join(prev.path, rel))..parent.createSync(recursive: true);
      src.copySync(dst.path);
    }
    return prev;
  }

  void _restore(Directory dir, Directory previous) {
    for (final e in previous.listSync(recursive: true).whereType<File>()) {
      final rel = p.relative(e.path, from: previous.path);
      final dst = File(p.join(dir.path, rel))..parent.createSync(recursive: true);
      e.copySync(dst.path);
    }
  }

  /// A fresh `.env` would get new passwords, and Postgres keeps the ones its volume was made with:
  /// every service would then fail to sign in to the database. So a new install refuses to start
  /// over data an earlier install of the same stack left behind.
  Future<void> _refuseOrphanData(String project, Directory dir) async {
    final volume = '${project}_db-data';
    final r = await runner.run('docker', ['volume', 'ls', '-q', '--filter', 'name=^$volume\$']);
    if (r.exitCode != 0 || !LineSplitter.split('${r.stdout}').map((l) => l.trim()).contains(volume)) return;
    throw SelfhostException(
      'old_data',
      'Docker already has the data of an earlier Casama install (volume $volume), and ${dir.path} has no .env '
          'with its passwords. Copy that install\'s .env into ${dir.path} and run this again. If that data can go, '
          'remove its volumes first (docker volume ls --filter name=${project}_).',
    );
  }

  Future<void> _checkDocker() async {
    ProcessResult r;
    try {
      r = await runner.run('docker', ['info', '--format', '{{.ServerVersion}}']);
    } on ProcessException {
      throw SelfhostException('docker_missing', 'Docker is not installed. Install Docker Desktop (Mac, Windows) or Docker Engine (Linux) first.');
    }
    if (r.exitCode != 0) throw SelfhostException('docker_not_running', 'Docker is not running (or this user cannot use it). Start Docker and try again.');
    final c = await runner.run('docker', ['compose', 'version']);
    if (c.exitCode != 0) throw SelfhostException('compose_missing', 'Docker Compose v2 is needed (docker compose).');
  }

  /// What installing [m] on this machine still downloads and the disk its images need: only the
  /// images the install pulls (the [profiles] it turns on, the desktop computer with
  /// [withDesktop]), minus what Docker already has. Null when the release has no sizes or Docker
  /// can't be asked.
  Future<DownloadEstimate?> estimateDownload(SelfhostManifest m, {Set<String> profiles = const {}, bool withDesktop = false}) async {
    final sizes = m.sizes;
    if (sizes == null) return null;
    try {
      final info = await runner.run('docker', ['info', '--format', '{{.Architecture}}']);
      if (info.exitCode != 0) return null;
      final arch = dockerArch('${info.stdout}');
      if (arch == null) return null;
      // Each reference is asked about directly: a listing alone can miss the images compose pulled by
      // digest (untagged; the containerd image store lists them differently or hides them), and then
      // every Casama image counted as still to download.
      final present = await _presentImages({for (final i in sizes.images[arch] ?? const <SizedImage>[]) i.ref});
      return sizes.estimate(arch: arch, profiles: {...profiles, if (withDesktop) 'desktop'}, present: present);
    } on ProcessException {
      return null;
    }
  }

  /// The [refs] Docker already has (`docker image inspect` answers for both tags and digests, and
  /// for either image store). Also takes what `docker image ls` lists, for older Docker versions.
  Future<Set<String>> _presentImages(Set<String> refs) async {
    final out = <String>{};
    final ls = await runner.run('docker', ['image', 'ls', '--digests', '--format', '{{.Repository}}|{{.Tag}}|{{.Digest}}']);
    if (ls.exitCode == 0) out.addAll(presentRefs('${ls.stdout}').intersection(refs));
    final rest = refs.difference(out).toList();
    final found = await Future.wait([
      for (final ref in rest)
        runner.run('docker', ['image', 'inspect', '--format', '{{.Id}}', ref]).then((r) => r.exitCode == 0 && '${r.stdout}'.trim().isNotEmpty, onError: (_) => false),
    ]);
    for (var i = 0; i < rest.length; i++) {
      if (found[i]) out.add(rest[i]);
    }
    return out;
  }

  /// gVisor when the Linux Docker has it (computers then run under runsc).
  Future<String> _sandboxRuntime() async {
    if (!isLinux) return '';
    try {
      final r = await runner.run('docker', ['info', '--format', '{{json .Runtimes}}']);
      return r.exitCode == 0 && '${r.stdout}'.contains('runsc') ? 'runsc' : '';
    } on ProcessException {
      return '';
    }
  }

  /// The memory Docker can use, in GB (Docker Desktop's VM on Mac and Windows).
  Future<int?> _hostMemoryGb() async {
    try {
      final r = await runner.run('docker', ['info', '--format', '{{.MemTotal}}']);
      final bytes = int.tryParse('${r.stdout}'.trim());
      return r.exitCode == 0 && bytes != null && bytes > 0 ? bytes ~/ (1024 * 1024 * 1024) : null;
    } on ProcessException {
      return null;
    }
  }

  Future<void> _writePrivate(File f, String text) async {
    f.parent.createSync(recursive: true);
    if (!isWindows && !f.existsSync()) {
      f.writeAsStringSync('');
      await runner.run('chmod', ['600', f.path]);
    }
    f.writeAsStringSync(text);
    if (!isWindows) await runner.run('chmod', ['600', f.path]);
  }

  Future<void> _pull(Directory dir, void Function(InstallProgress) emit, {required bool withDesktop}) async {
    emit(const InstallProgress(InstallStep.pull, 'Pulling images (the first time takes a few minutes)'));
    final base = selfhostComposeArgs(dir);
    final jobs = [
      [...base, 'pull', '--quiet'],
      [...base, '--profile', 'images', 'pull', '--quiet', 'computer-headless', if (withDesktop) 'computer-desktop'],
    ];
    for (final args in jobs) {
      var done = false;
      for (var attempt = 1; attempt <= 5 && !done; attempt++) {
        // Public registries rate-limit anonymous pulls: a few at a time, retried with a growing wait.
        final r = await runner.run('docker', args, workingDirectory: dir.path, environment: const {'COMPOSE_PARALLEL_LIMIT': '2'});
        if (r.exitCode == 0) {
          done = true;
        } else if (attempt < 5) {
          emit(InstallProgress(InstallStep.pull, 'Image pull failed (attempt $attempt of 5); retrying in ${attempt * 15}s'));
          await delay(Duration(seconds: attempt * 15));
        }
      }
      if (!done) throw SelfhostException('pull_failed', "Couldn't pull the images. Check the internet connection (or registry rate limits) and try again.");
    }
  }

  Future<bool> _up(Directory dir, {bool throwOnError = true}) async {
    final r = await runner.run('docker', [...selfhostComposeArgs(dir), 'up', '-d', '--remove-orphans'], workingDirectory: dir.path);
    if (r.exitCode != 0 && throwOnError) {
      throw SelfhostException('start_failed', 'docker compose up failed: ${'${r.stderr}'.trim()}');
    }
    return r.exitCode == 0;
  }

  Future<bool> _waitReady(Directory dir) async {
    final url = Uri.parse('${readyUrl(dir)}/readyz');
    final step = pollInterval.inMicroseconds <= 0 ? 1 : pollInterval.inMicroseconds;
    final attempts = (readyTimeout.inMicroseconds ~/ step).clamp(1, 100000);
    for (var i = 0; i < attempts; i++) {
      if (await _readyOverHttp(url) || await _apiHealthy(dir)) return true;
      if (i < attempts - 1) await delay(pollInterval);
    }
    return false;
  }

  Future<bool> _readyOverHttp(Uri url) async {
    try {
      return await _withClient((c) async => (await c.get(url).timeout(const Duration(seconds: 5))).statusCode == 200);
    } catch (_) {
      return false;
    }
  }

  /// The API container's own health check calls /readyz inside the stack; a domain whose
  /// certificate isn't issued yet still counts as ready this way.
  Future<bool> _apiHealthy(Directory dir) async {
    try {
      final r = await runner.run('docker', [...selfhostComposeArgs(dir), 'ps', '--format', 'json', 'api'], workingDirectory: dir.path);
      if (r.exitCode != 0) return false;
      final text = '${r.stdout}'.trim();
      if (text.isEmpty) return false;
      final rows = text.startsWith('[') ? (jsonDecode(text) as List) : text.split('\n').where((l) => l.trim().isNotEmpty).map(jsonDecode).toList();
      return rows.any((row) => row is Map && row['Health'] == 'healthy');
    } catch (_) {
      return false;
    }
  }
}

/// The compose file's name inside an install folder.
const composeFileName = 'docker-compose.yml';

/// The sign-up hook over Docker's own network, for every server whose bundle has it. Supabase
/// Auth takes plain-http hooks only for localhost and `host.docker.internal`, so the bundle's
/// compose gives the API that name on a network only Auth shares with it (`signup-hook`).
const internalSignupHookUri = 'http://host.docker.internal:8787/hooks/auth/before-user-created';

/// Whether the release unpacked in [dir] has the `signup-hook` network that
/// [internalSignupHookUri] needs (older bundles don't: Auth would then call nothing).
bool hasInternalSignupHook(Directory dir) {
  final f = File(p.join(dir.path, composeFileName));
  return f.existsSync() && f.readAsStringSync().contains('signup-hook:');
}

/// Opens a plain-HTTP server to the local network at [host] ([InstallOptions.lan]): Caddy and TURN
/// on every interface, and the addresses others use (sign-in links, pages, live view) on [host].
/// A server with an https address is left alone: it is already reachable, and going to plain
/// HTTP would break it.
void _applyLan(EnvFile env, String host) {
  if ((env['CASAMA_PUBLIC_URL'] ?? '').startsWith('https://')) {
    throw SelfhostException('lan_with_https', 'This server already has an https address (${env['CASAMA_PUBLIC_URL']}); the LAN option is for local servers.');
  }
  final port = env.value('HTTP_PORT') ?? '80';
  env['HTTP_BIND'] = '0.0.0.0';
  env['TURN_BIND'] = '0.0.0.0';
  env['CASAMA_PUBLIC_URL'] = 'http://$host${port == '80' ? '' : ':$port'}';
  env['TURN_PUBLIC_HOST'] = host;
  // The installer still checks the server on this machine.
  env['CASAMA_LOCAL_URL'] = 'http://127.0.0.1:$port';
  final pages = Uri.tryParse(env.value('CASAMA_PAGES_URL') ?? '');
  if (pages != null && pages.hasScheme && (pages.host == 'localhost' || pages.host.startsWith('127.'))) {
    env['CASAMA_PAGES_URL'] = pages.replace(host: host).toString();
  }
}

/// This machine's IPv4 address on the local network (192.168.x, 10.x, 172.16-31.x), skipping
/// Docker's, VPNs' and virtual machines' own adapters. Null when there is none.
Future<String?> findLanAddress() async {
  try {
    final ifaces = await NetworkInterface.list(type: InternetAddressType.IPv4);
    return pickLanAddress([
      for (final i in ifaces)
        for (final a in i.addresses) (i.name, a.address),
    ]);
  } catch (_) {
    return null;
  }
}

/// The address [findLanAddress] picks from (interface name, IPv4) pairs.
String? pickLanAddress(List<(String, String)> addresses) {
  final virtual = RegExp(r'^(docker|br-|veth|virbr|vboxnet|vmnet|utun|tun|tap|wg|tailscale|zt|lo)|vethernet|virtual|wsl|hyper-v|loopback', caseSensitive: false);
  bool private(String a) {
    final o = a.split('.').map(int.tryParse).toList();
    if (o.length != 4 || o.any((x) => x == null)) return false;
    return o[0] == 192 && o[1] == 168 || o[0] == 10 || o[0] == 172 && o[1]! >= 16 && o[1]! <= 31;
  }

  final candidates = [for (final (name, a) in addresses) if (!virtual.hasMatch(name) && private(a)) a];
  // Home networks are usually 192.168.x; 10.x and 172.x are more often a VPN or a container net.
  candidates.sort((a, b) => (a.startsWith('192.168.') ? 0 : 1).compareTo(b.startsWith('192.168.') ? 0 : 1));
  return candidates.isEmpty ? null : candidates.first;
}

/// The sign-up hook address for a server at [public]: over Docker's network when the bundle has
/// it ([internal]), for https servers too, so sign-up never depends on the server reaching its
/// own public address; else through an https address; else none.
String signupHookFor(String public, {required bool internal}) {
  if (internal) return internalSignupHookUri;
  return public.startsWith('https://') ? '$public/hooks/auth/before-user-created' : '';
}

/// The Compose project of a self-host install (selfhost/docker-compose.yml's `name:`), unless its
/// `.env` sets `COMPOSE_PROJECT_NAME` (the desktop app's `casama-app`).
const defaultStackName = 'casama-selfhost';

/// `docker` arguments for the stack in [dir] (`compose -f … --env-file .env --env-file images.env`
/// and the profiles its `.env` turns on). Append `up -d`, `ps`, `logs …`.
List<String> selfhostComposeArgs(Directory dir) {
  final env = EnvFile.read(File(p.join(dir.path, '.env')));
  return [
    'compose',
    '--project-directory',
    dir.path,
    '-f',
    p.join(dir.path, composeFileName),
    '--env-file',
    p.join(dir.path, '.env'),
    '--env-file',
    p.join(dir.path, 'images.env'),
    ...profilesFor(env).expand((x) => ['--profile', x]),
  ];
}

/// Compose profiles an install's settings turn on (remembered in `.env`, so updates keep them).
List<String> profilesFor(EnvFile env) => [
  if (env['CASAMA_REMOTE_ACCESS'] == 'on') 'link',
  if (env['CASAMA_BACKUPS'] == 'on') 'backup',
  if (env.value('SEARXNG_URL') == 'http://searxng:8080') 'search',
  if (env['CASAMA_MONITORING'] == 'on') 'monitoring',
];

/// The engine version installed in [dir] (`CASAMA_ENGINE_VERSION` in images.env), or null.
String? installedVersion(Directory dir) => EnvFile.read(File(p.join(dir.path, 'images.env'))).value('CASAMA_ENGINE_VERSION');

/// The address the installer checks on this machine: CASAMA_LOCAL_URL, else the local port for a
/// local install, else the public address.
String readyUrl(Directory dir) {
  final env = EnvFile.read(File(p.join(dir.path, '.env')));
  final local = env.value('CASAMA_LOCAL_URL');
  if (local != null) return local;
  // Loopback-only or plain-HTTP Caddy (--local, behind a proxy): ask it on this machine.
  if (env.value('HTTP_BIND') == '127.0.0.1' || env['CASAMA_SITE'] == ':80') return 'http://127.0.0.1:${env.value('HTTP_PORT') ?? '80'}';
  return env.value('CASAMA_PUBLIC_URL') ?? 'http://127.0.0.1';
}

/// Fills in `.env` the way selfhost/install.sh does: on a [fresh] file every secret and address;
/// on an existing one only settings that are missing (nothing existing changes, so data and keys
/// stay), plus what [options] asks for.
///
/// [internalSignupHook]: the bundle has the `signup-hook` network ([hasInternalSignupHook]), so a
/// plain-HTTP server gets the sign-up hook (seats, the allowlist, invited only) too.
void configureEnv(
  EnvFile env,
  InstallOptions options,
  SecretSource s, {
  required bool fresh,
  String sandboxRuntime = '',
  int? hostMemoryGb,
  bool internalSignupHook = false,
  String? lanHost,
}) {
  if (fresh) {
    final String site, public, turnHost;
    final port = options.httpPort;
    if (options.local) {
      site = ':80';
      public = 'http://localhost${port == 80 ? '' : ':$port'}';
      turnHost = 'localhost';
    } else if (options.behindProxy) {
      site = ':80';
      public = 'https://${options.domain}';
      turnHost = options.turnHost ?? options.domain!;
    } else {
      site = options.domain!;
      public = 'https://${options.domain}';
      turnHost = options.domain!;
    }
    final jwtSecret = s.hex(32);
    env.lines
      ..clear()
      ..addAll([
        '# Casama self-host settings, generated by the Casama installer on ${DateTime.now().toUtc().toIso8601String().split('.').first}Z.',
        '# Keep this file private and backed up: it holds every key for this installation.',
        'CASAMA_SITE=$site',
        'CASAMA_PUBLIC_URL=$public',
        'SIGNUP_HOOK_URI=${signupHookFor(public, internal: internalSignupHook)}',
        'HTTP_PORT=$port',
        'HTTPS_PORT=${options.httpsPort}',
        'TURN_PUBLIC_HOST=$turnHost',
        '',
        'POSTGRES_PASSWORD=${s.hex(24)}',
        'WORKER_DB_PASSWORD=${s.hex(24)}',
        'JWT_SECRET=$jwtSecret',
        'ANON_KEY=${s.supabaseKey('anon', jwtSecret)}',
        'SERVICE_ROLE_KEY=${s.supabaseKey('service_role', jwtSecret)}',
        'SECRET_KEY_BASE=${s.hex(32)}',
        'REALTIME_ENC_KEY=${s.hex(8)}',
        '',
        'SUPERVISOR_TOKEN=${s.hex(24)}',
        'COMPUTER_TOKEN_SECRET=${s.hex(32)}',
        'SAML_PRIVATE_KEY=${s.samlKey()}',
        'EGRESS_CONTROL_TOKEN=${s.hex(24)}',
        'INTERNAL_TOKEN=${s.hex(24)}',
        'TURN_SECRET=${s.hex(24)}',
        'SEARXNG_SECRET=${s.hex(32)}',
        'METRICS_TOKEN=${s.hex(24)}',
        'GRAFANA_ADMIN_PASSWORD=${s.hex(12)}',
        'SANDBOX_RUNTIME=$sandboxRuntime',
        '',
        '# This installation (docs/SELF-HOSTING-PLAN.md §11.3). The id is made once and never changes.',
        'CASAMA_INSTANCE_ID=${options.instanceId ?? s.uuid()}',
        'CASAMA_LICENSE_KEY=${options.licenseKey ?? ''}',
        '',
        '# Optional (see the self-hosting docs): email, error reporting, telemetry, Casama Link.',
        '# Continue with Apple and Google. Off until set.',
        'APPLE_AUTH_ENABLED=false',
        'APPLE_AUTH_CLIENT_IDS=',
        'APPLE_AUTH_SECRET=',
        'GOOGLE_AUTH_ENABLED=false',
        'GOOGLE_AUTH_CLIENT_ID=',
        'GOOGLE_AUTH_SECRET=',
        '# Passkeys. Off until set. RP id is the domain without https://. Origins are the web app addresses.',
        'PASSKEYS_ENABLED=false',
        'PASSKEY_RP_ID=',
        'PASSKEY_RP_ORIGINS=',
        'EMAIL_AUTOCONFIRM=true',
        'INSTANCE_ADMIN_EMAILS=',
        'RESEND_API_KEY=',
        'SMTP_HOST=',
        'TELEMETRY=off',
        'CASAMA_CLOUD_URL=',
        'CASAMA_CLOUD_KEY=',
        '',
      ]);
  } else {
    // Settings added by newer releases get generated values; nothing existing is changed.
    env.setIfMissing('COMPUTER_TOKEN_SECRET', () => s.hex(32));
    // Empty on plain-HTTP installs before the signup-hook network: filled in now that it exists.
    // A domain install's own https hook (which no installer turned on, so seats didn't hold at
    // sign-up) moves to Docker's network too. Remote access manages its own hook and stays.
    final public = env['CASAMA_PUBLIC_URL'] ?? '';
    final ownHttpsHook = public.startsWith('https://') &&
        env['SIGNUP_HOOK_URI'] == '$public/hooks/auth/before-user-created' &&
        env['CASAMA_REMOTE_ACCESS'] != 'on';
    if (env.value('SIGNUP_HOOK_URI') == null || (internalSignupHook && ownHttpsHook)) {
      env['SIGNUP_HOOK_URI'] = signupHookFor(public, internal: internalSignupHook);
    }
    env.setIfMissing('SAML_PRIVATE_KEY', s.samlKey);
    env.setIfMissing('WORKER_DB_PASSWORD', () => s.hex(24));
    for (final k in ['APPLE_AUTH_ENABLED', 'GOOGLE_AUTH_ENABLED', 'PASSKEYS_ENABLED']) {
      env.setIfMissing(k, () => 'false');
    }
    if (env.value('CASAMA_INSTANCE_ID') == null) env['CASAMA_INSTANCE_ID'] = options.instanceId ?? s.uuid();
    env.setIfMissing('CASAMA_LICENSE_KEY', () => '');
  }
  if (options.licenseKey != null) env['CASAMA_LICENSE_KEY'] = options.licenseKey!;
  if (options.licenseServer != null) env['CASAMA_LICENSE_SERVER'] = options.licenseServer!;
  // Sign-up hook secret (Standard Webhooks): the same value on Auth and the API.
  if (env.value('AUTH_HOOK_SECRET') == null) env['AUTH_HOOK_SECRET'] = 'v1,whsec_${s.base64Bytes(32)}';
  // The hook over Docker's network is on: without it a server let anyone make an account, and
  // only refused them afterwards (license_seats). An owner's own `false` stays.
  if (env['SIGNUP_HOOK_URI'] == internalSignupHookUri && env.value('SIGNUP_HOOK_ENABLED') == null) {
    env['SIGNUP_HOOK_ENABLED'] = 'true';
  }
  // Encryption at rest: never replaced once set (losing it makes encrypted data unreadable).
  if (env.value('CONTENT_ENCRYPTION_KEY') == null && env.value('CONTENT_KMS_KEY_ID') == null) {
    env['CONTENT_ENCRYPTION_KEY'] = s.base64Bytes(32);
  }
  // Room for bot computers: Docker's memory less 4 GB for Casama itself, at least 2 GB.
  if (env.value('COMPUTER_HOST_MEMORY_GB') == null && hostMemoryGb != null) {
    env['COMPUTER_HOST_MEMORY_GB'] = '${hostMemoryGb - 4 < 2 ? 2 : hostMemoryGb - 4}';
  }
  if (options.turnHost != null) env['TURN_PUBLIC_HOST'] = options.turnHost!;
  // Behind a proxy, or for this machine only, Caddy listens on loopback (Docker skips ufw).
  if (options.behindProxy) env['HTTP_BIND'] = '127.0.0.1';
  if (fresh && options.local && lanHost == null) {
    env['HTTP_BIND'] = '127.0.0.1';
    env['TURN_BIND'] = '127.0.0.1';
  }
  if (lanHost != null) _applyLan(env, lanHost);
  if (options.adminEmail != null && options.adminEmail!.isNotEmpty) env['INSTANCE_ADMIN_EMAILS'] = options.adminEmail!;
  for (final e in options.settings.entries) {
    if (!RegExp(r'^[A-Z_][A-Z0-9_]*$').hasMatch(e.key)) throw SelfhostException('bad_setting', 'Not a setting name: ${e.key}');
    env[e.key] = e.value;
  }
  if (options.backups) env['CASAMA_BACKUPS'] = 'on';
  if (options.monitoring) env['CASAMA_MONITORING'] = 'on';
  if (options.withDesktop) env['CASAMA_WITH_DESKTOP'] = 'on';
  if (options.search && env.value('SEARXNG_URL') == null) {
    if (env.value('SEARXNG_SECRET') == null) env['SEARXNG_SECRET'] = s.hex(32);
    env['SEARXNG_URL'] = 'http://searxng:8080';
  }
}
