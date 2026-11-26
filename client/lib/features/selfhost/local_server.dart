import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:casama_selfhost/casama_selfhost.dart' as sh;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../core/distribution.dart';

/// One-click local server (D-147, D-216, docs/SELF-HOSTING-PLAN.md §6.4): on a Mac (direct
/// download, not the Mac App Store build), Linux or Windows desktop, the app checks for Docker,
/// reads the newest self-host release (`selfhost-latest/manifest.json`), and installs it with the
/// shared Dart installer (`casama_selfhost`: no bash, no OpenSSL, so Windows works through Docker
/// Desktop and WSL2), then connects to it. The free personal license from the person's Casama
/// Cloud account goes into the install as `CASAMA_LICENSE_KEY`; without one the server starts in
/// its setup state and asks for a license itself.
bool get localServerSupported => debugLocalServerOn ?? localServerPlatform;

/// Lets tests force the local server on or off; null (the app) leaves it to [localServerPlatform].
@visibleForTesting
bool? debugLocalServerOn;

/// The desktops a local server runs on: a Mac, Linux or Windows, not the web, phones or the Mac
/// App Store build (its sandbox can't run Docker).
bool get localServerPlatform =>
    !kIsWeb &&
    !isMacAppStoreBuild &&
    (defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.windows);

/// The Compose project and container prefix of a server this app installs (D-309), so it never
/// collides with another Casama stack on the same computer.
const appStackName = 'casama-app';

/// A build-time override for the release manifest (a test release); empty means `selfhost-latest`.
const selfhostManifestOverride = String.fromEnvironment('CASAMA_SELFHOST_MANIFEST');

enum LocalServerStep { checking, downloading, installing, starting, ready, failed }

class LocalServerProgress {
  const LocalServerProgress(this.step, {this.detail, this.fraction, this.bytes, this.code});
  final LocalServerStep step;
  final String? detail;

  /// How much of the download is done.
  final double? fraction;

  /// Bytes downloaded so far, when known.
  final int? bytes;

  /// A failure's stable code from the installer (`update_rolled_back`, `pull_failed`, …).
  final String? code;

  /// An update that didn't come up healthy and went back to the release before it.
  bool get rolledBack => code == 'update_rolled_back';
}

/// The host ports the stack publishes (all on loopback).
class LocalServerPorts {
  const LocalServerPorts({this.http = 8080, this.https = 8443, this.pages = 8790, this.turn = 3478});
  final int http;
  final int https;
  final int pages;
  final int turn;
}

/// Runs processes (a seam for tests).
abstract class ProcessRunner {
  Future<ProcessResult> run(String exe, List<String> args, {String? cwd});
  Future<Process> start(String exe, List<String> args, {String? cwd});
}

class SystemProcessRunner implements ProcessRunner {
  static String get _sep => Platform.isWindows ? ';' : ':';

  /// Apps opened from Finder or a desktop launcher get a bare PATH (/usr/bin:/bin:…), which misses
  /// `docker` and Docker Desktop's credential helper, so add the places they're installed.
  static Map<String, String> get environment {
    final env = Map<String, String>.of(Platform.environment);
    if (Platform.isWindows) {
      final key = env.keys.firstWhere((k) => k.toUpperCase() == 'PATH', orElse: () => 'Path');
      final path = (env[key] ?? '').split(';');
      final extra = [
        r'C:\Program Files\Docker\Docker\resources\bin',
        if ((env['ProgramFiles'] ?? '').isNotEmpty) '${env['ProgramFiles']}\\Docker\\Docker\\resources\\bin',
      ];
      env[key] = [...path, ...extra.where((p) => !path.contains(p))].join(';');
      return env;
    }
    final home = env['HOME'] ?? '';
    final extra = [
      '/usr/local/bin',
      '/opt/homebrew/bin',
      if (home.isNotEmpty) '$home/.docker/bin',
      '/Applications/Docker.app/Contents/Resources/bin',
      if (home.isNotEmpty) '$home/Applications/Docker.app/Contents/Resources/bin',
      '/snap/bin',
    ];
    final path = (env['PATH'] ?? '/usr/bin:/bin:/usr/sbin:/sbin').split(':');
    env['PATH'] = [...path, ...extra.where((p) => !path.contains(p))].join(':');
    return env;
  }

  /// The full path of [exe] on [environment]'s PATH. Dart looks a bare name up on this app's own
  /// PATH, not on the one passed in `environment`, so an app opened from Finder never found
  /// `docker` and the guided setup said "Starting Docker…" forever while Docker ran.
  static String resolve(String exe, {Map<String, String>? env, bool Function(String path)? isFile, bool? windows}) {
    final win = windows ?? Platform.isWindows;
    if (exe.contains('/') || (win && exe.contains(r'\'))) return exe;
    final found = isFile ?? (p) => File(p).existsSync();
    final e = env ?? environment;
    final path = win ? (e.entries.firstWhere((x) => x.key.toUpperCase() == 'PATH', orElse: () => const MapEntry('PATH', '')).value) : (e['PATH'] ?? '');
    for (final dir in path.split(win ? ';' : _sep)) {
      if (dir.isEmpty) continue;
      if (win) {
        for (final ext in const ['.exe', '.cmd', '']) {
          if (found('$dir\\$exe$ext')) return '$dir\\$exe$ext';
        }
      } else if (found('$dir/$exe')) {
        return '$dir/$exe';
      }
    }
    return exe;
  }

  @override
  Future<ProcessResult> run(String exe, List<String> args, {String? cwd}) {
    final env = environment;
    return Process.run(
      resolve(exe, env: env),
      args,
      workingDirectory: cwd,
      environment: env,
    );
  }

  @override
  Future<Process> start(String exe, List<String> args, {String? cwd}) {
    final env = environment;
    return Process.start(
      resolve(exe, env: env),
      args,
      workingDirectory: cwd,
      environment: env,
    );
  }
}

/// The installer's process runner with the app's PATH (see [SystemProcessRunner.environment]):
/// the package's own runner uses this app's bare PATH, which misses `docker` when opened from Finder.
class AppInstallerRunner implements sh.ProcessRunner {
  const AppInstallerRunner();

  @override
  Future<ProcessResult> run(String executable, List<String> arguments, {String? workingDirectory, Map<String, String>? environment}) {
    final env = {...SystemProcessRunner.environment, ...?environment};
    return Process.run(
      SystemProcessRunner.resolve(executable, env: env),
      arguments,
      workingDirectory: workingDirectory,
      environment: env,
    );
  }

  @override
  Future<int> runToFile(String executable, List<String> arguments, File out, {String? workingDirectory}) async {
    final env = SystemProcessRunner.environment;
    final proc = await Process.start(
      SystemProcessRunner.resolve(executable, env: env),
      arguments,
      workingDirectory: workingDirectory,
      environment: env,
    );
    final sink = out.openWrite();
    await Future.wait([proc.stdout.pipe(sink), proc.stderr.drain<void>()]);
    return proc.exitCode;
  }
}

/// Whether nothing listens on [port] (TCP and UDP, on loopback and on every interface).
Future<bool> systemPortFree(int port) async {
  for (final a in [InternetAddress.loopbackIPv4, InternetAddress.anyIPv4]) {
    try {
      await (await ServerSocket.bind(a, port)).close();
      (await RawDatagramSocket.bind(a, port)).close();
    } on SocketException {
      return false;
    }
  }
  return true;
}

/// A random UUID v4 (the server's `CASAMA_INSTANCE_ID`).
String newInstanceId([Random? random]) {
  final r = random ?? Random.secure();
  final b = List<int>.generate(16, (_) => r.nextInt(256));
  b[6] = (b[6] & 0x0f) | 0x40;
  b[8] = (b[8] & 0x3f) | 0x80;
  final h = b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
  return '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}-${h.substring(16, 20)}-${h.substring(20)}';
}

/// Gets the license key for a new install's [instanceId] and release [engineVersion], or null.
typedef LicenseFetcher = Future<String?> Function(String instanceId, String engineVersion);

/// Installs, starts and updates the server on this computer with `casama_selfhost`.
class LocalServerManager {
  LocalServerManager({
    ProcessRunner? runner,
    sh.SelfhostInstaller? installer,
    this.manifestSource,
    Future<Directory> Function()? home,
    Future<bool> Function(int port)? portFree,
    http.Client? client,
    Future<File?> Function()? legacyEnv,
  }) : runner = runner ?? SystemProcessRunner(),
       client = client ?? http.Client(),
       installer = installer ?? sh.SelfhostInstaller(runner: const AppInstallerRunner(), client: client),
       portFree = portFree ?? systemPortFree,
       home = home ?? (() async => sh.defaultInstallDir()),
       legacyEnv = legacyEnv ?? findLegacyEnv;

  final ProcessRunner runner;
  final http.Client client;
  final sh.SelfhostInstaller installer;

  /// Where the newest release comes from (tests); null reads `selfhost-latest`.
  final Future<sh.SelfhostManifest> Function()? manifestSource;

  /// The install folder (`~/.casama/selfhost`, shared with `casama selfhost`).
  final Future<Directory> Function() home;
  final Future<bool> Function(int port) portFree;

  /// The `.env` of this app's local server from before the release bundle, if there is one.
  final Future<File?> Function() legacyEnv;

  /// Before 2026-11-26 the app installed its server (also the `casama-app` stack) from a source
  /// checkout under `<app support>/local-server/casama-<commit>/`, keys in `infra/compose/.env`.
  /// Its Docker volumes still hold that server's data, made with those passwords.
  static Future<File?> findLegacyEnv() async {
    try {
      final root = Directory('${(await getApplicationSupportDirectory()).path}${Platform.pathSeparator}local-server');
      if (!root.existsSync()) return null;
      final envs = [
        for (final d in root.listSync().whereType<Directory>())
          if (d.uri.pathSegments.where((s) => s.isNotEmpty).last.startsWith('casama-'))
            File([d.path, 'infra', 'compose', '.env'].join(Platform.pathSeparator)),
      ].where((f) => f.existsSync()).toList()
        ..sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));
      return envs.isEmpty ? null : envs.first;
    } catch (_) {
      return null;
    }
  }

  String? _url;

  /// The address of the server this app installed, once known.
  String get url => _url ?? 'http://localhost:8080';

  /// Why Docker can't be used, or null when it's ready.
  Future<String?> dockerProblem() async {
    try {
      final info = await runner.run('docker', ['info', '--format', '{{.ServerVersion}}']);
      if (info.exitCode != 0) return 'Docker is installed but not running. Start Docker Desktop and try again.';
      final compose = await runner.run('docker', ['compose', 'version']);
      if (compose.exitCode != 0) return 'Docker Compose v2 is needed (it comes with Docker Desktop).';
      return null;
    } on ProcessException {
      return 'Docker isn\'t installed. Install Docker Desktop, start it, then try again.';
    }
  }

  /// The newest release (or the build's override).
  Future<sh.SelfhostManifest> latest() {
    final f = manifestSource;
    if (f != null) return f();
    return sh.fetchManifest(url: selfhostManifestOverride.isEmpty ? null : Uri.parse(selfhostManifestOverride), client: client);
  }

  /// What starting the server still downloads, and the disk its images need, for the setup page:
  /// the images this install pulls on this computer's CPU type, minus what Docker already has.
  /// Null when the release has no sizes (releases before they were measured) or Docker can't say.
  Future<sh.DownloadEstimate?> estimate() async {
    try {
      final dir = await home();
      final existing = _isInstall(dir);
      final manifest = existing ? (sh.installedManifest(dir) ?? await latest()) : await latest();
      if (!existing) return await installer.estimateDownload(manifest);
      final env = sh.EnvFile.read(File('${dir.path}${Platform.pathSeparator}.env'));
      return await installer.estimateDownload(manifest, profiles: sh.profilesFor(env).toSet(), withDesktop: env['CASAMA_WITH_DESKTOP'] == 'on');
    } catch (_) {
      return null;
    }
  }

  static bool _isInstall(Directory dir) =>
      File('${dir.path}${Platform.pathSeparator}.env').existsSync() && File('${dir.path}${Platform.pathSeparator}images.env').existsSync();

  /// The address a person (and this app) uses for the install in [dir]: its public URL, which is
  /// `http://localhost:<port>` for a server on this computer.
  static String addressOf(Directory dir) {
    final env = sh.EnvFile.read(File('${dir.path}${Platform.pathSeparator}.env'));
    return env['CASAMA_PUBLIC_URL'] ?? sh.readyUrl(dir);
  }

  /// The folder of the server this app installed, and the address it answers on. Null when there
  /// is none. Casama Link (D-296) switches that server's settings and runs the installer again.
  Future<({Directory dir, String url})?> installed() async {
    final dir = await home();
    if (!_isInstall(dir)) return null;
    return (dir: dir, url: _url = addressOf(dir));
  }

  /// The release the install in [dir] runs (`CASAMA_ENGINE_VERSION`), or null.
  String? installedVersion(Directory dir) => sh.installedVersion(dir);

  /// The instance id the next install uses: the existing one when there's an install, else a new
  /// one (asked for before installing, so the personal license can be made for it).
  Future<String> instanceId() async {
    final dir = await home();
    final existing = sh.EnvFile.read(File('${dir.path}${Platform.pathSeparator}.env')).value('CASAMA_INSTANCE_ID');
    return existing ?? (_pendingId ??= newInstanceId());
  }

  String? _pendingId;

  /// Runs the installer again on the install in [dir] (it keeps `.env` and restarts what
  /// changed). Each progress line goes to [onLine]; returns 0 when it worked.
  Future<int> rerunInstaller(Directory dir, void Function(String line) onLine) async {
    final manifest = sh.installedManifest(dir);
    if (manifest == null) {
      onLine('No release recorded in ${dir.path}; install it again from the app.');
      return 1;
    }
    try {
      await for (final s in installer.install(manifest: manifest, dir: dir, options: sh.InstallOptions())) {
        if (s.step != sh.InstallStep.download || s.fraction == 0) onLine(s.message);
      }
      return 0;
    } on sh.SelfhostException catch (e) {
      onLine(e.message);
      return 1;
    } catch (e) {
      onLine('$e');
      return 1;
    }
  }

  /// The first free port from [from], skipping [taken].
  Future<int> _free(int from, Set<int> taken) async {
    for (var p = from; p < from + 100; p++) {
      if (!taken.contains(p) && await portFree(p)) return p;
    }
    throw StateError('No free port near $from');
  }

  Future<LocalServerPorts> _pickPorts() async {
    final taken = <int>{};
    Future<int> pick(int from) async {
      final p = await _free(from, taken);
      taken.add(p);
      return p;
    }

    return LocalServerPorts(http: await pick(8080), https: await pick(8443), pages: await pick(8790), turn: await pick(3478));
  }

  /// Whether a server already answers on [address] (a second start just reconnects).
  Future<bool> _ready(String address) async {
    try {
      final r = await client.get(Uri.parse('$address/readyz')).timeout(const Duration(seconds: 5));
      return r.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  /// Installs (or starts again) and connects; ends with [LocalServerStep.ready] and the server's
  /// address, or [LocalServerStep.failed]. On a new install [license] is asked for the key for its
  /// instance id and release (the free personal license from Casama Cloud); without one (null, or
  /// no [license]) the server starts in its setup state and asks for a license itself.
  Stream<LocalServerProgress> start({LicenseFetcher? license}) async* {
    yield const LocalServerProgress(LocalServerStep.checking);
    final dir = await home();
    final existing = _isInstall(dir);
    if (existing) {
      final address = addressOf(dir);
      _url = address;
      if (await _ready(address)) {
        yield LocalServerProgress(LocalServerStep.ready, detail: address);
        return;
      }
    }
    final problem = await dockerProblem();
    if (problem != null) {
      yield LocalServerProgress(LocalServerStep.failed, detail: problem);
      return;
    }
    final sh.SelfhostManifest manifest;
    try {
      manifest = existing ? (sh.installedManifest(dir) ?? await latest()) : await latest();
    } on sh.SelfhostException catch (e) {
      yield LocalServerProgress(LocalServerStep.failed, detail: e.message, code: e.code);
      return;
    } catch (e) {
      yield LocalServerProgress(LocalServerStep.failed, detail: 'The release list could not be read: $e');
      return;
    }
    sh.InstallOptions options;
    if (existing) {
      options = sh.InstallOptions();
    } else {
      final LocalServerPorts ports;
      try {
        ports = await _pickPorts();
      } catch (e) {
        yield LocalServerProgress(LocalServerStep.failed, detail: '$e');
        return;
      }
      final id = await instanceId();
      String? key;
      if (license != null) key = await license(id, manifest.version);
      options = sh.InstallOptions(
        httpPort: ports.http,
        httpsPort: ports.https,
        instanceId: id,
        licenseKey: key,
        adoptEnv: await legacyEnv(),
        settings: {
          'PAGES_PORT': '${ports.pages}',
          'CASAMA_PAGES_URL': 'http://localhost:${ports.pages}',
          'TURN_HOST_PORT': '${ports.turn}',
          'COMPOSE_PROJECT_NAME': appStackName,
          'CASAMA_CONTAINER_PREFIX': appStackName,
        },
      );
    }
    yield* _follow(installer.install(manifest: manifest, dir: dir, options: options), dir);
  }

  /// Moves the install to [manifest]: backup, pull, start, health check, and back to the release
  /// before it when the new one isn't healthy (then the last progress is failed with
  /// [LocalServerProgress.rolledBack]).
  Stream<LocalServerProgress> update(sh.SelfhostManifest manifest) async* {
    yield const LocalServerProgress(LocalServerStep.checking);
    final dir = await home();
    yield* _follow(installer.update(dir: dir, manifest: manifest), dir);
  }

  /// The installer's steps as the setup page shows them.
  Stream<LocalServerProgress> _follow(Stream<sh.InstallProgress> steps, Directory dir) async* {
    try {
      await for (final s in steps) {
        switch (s.step) {
          case sh.InstallStep.checkDocker:
            yield LocalServerProgress(LocalServerStep.checking, detail: s.message);
          case sh.InstallStep.download:
            yield LocalServerProgress(LocalServerStep.downloading, fraction: s.fraction, detail: s.message);
          case sh.InstallStep.extract ||
              sh.InstallStep.configure ||
              sh.InstallStep.backup ||
              sh.InstallStep.pull ||
              sh.InstallStep.start ||
              sh.InstallStep.rollback:
            yield LocalServerProgress(LocalServerStep.installing, detail: '==> ${_heading(s)}');
          case sh.InstallStep.waitReady:
            yield LocalServerProgress(LocalServerStep.starting, detail: s.message);
          case sh.InstallStep.done:
            final address = addressOf(dir);
            _url = address;
            yield LocalServerProgress(LocalServerStep.ready, detail: address);
            return;
        }
      }
      // The stream ended without `done` (nothing more to do): the server is there.
      yield LocalServerProgress(LocalServerStep.ready, detail: _url = addressOf(dir));
    } on sh.SelfhostException catch (e) {
      yield LocalServerProgress(LocalServerStep.failed, detail: e.message, code: e.code);
    } catch (e) {
      yield LocalServerProgress(LocalServerStep.failed, detail: '$e');
    }
  }

  /// The installer's message with the words the setup page reads its parts from.
  static String _heading(sh.InstallProgress s) => switch (s.step) {
    sh.InstallStep.pull => 'Pulling: ${s.message}',
    sh.InstallStep.start => 'Starting the stack: ${s.message}',
    _ => s.message,
  };
}
