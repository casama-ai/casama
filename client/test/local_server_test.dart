// One-click local server (D-147, docs/SELF-HOSTING-PLAN.md §6.4): the app installs and updates
// the server on this computer with the shared Dart installer (casama_selfhost), faked here.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:casama/features/selfhost/local_server.dart';
import 'package:casama_selfhost/casama_selfhost.dart' as sh;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class FakeRunner implements ProcessRunner {
  FakeRunner({this.docker = true});
  final bool docker;
  final calls = <String>[];
  @override
  Future<ProcessResult> run(String exe, List<String> args, {String? cwd}) async {
    calls.add('$exe ${args.join(' ')}');
    if (exe == 'docker' && !docker) throw const ProcessException('docker', [], 'not found');
    return ProcessResult(1, 0, '', '');
  }

  @override
  Future<Process> start(String exe, List<String> args, {String? cwd}) => throw UnimplementedError();
}

sh.SelfhostManifest manifestFor(String version, {int minAppBuild = 0}) => sh.SelfhostManifest(
  version: version,
  released: DateTime.utc(2026, 11, 26),
  bundleUrl: Uri.parse('https://example.test/casama-selfhost-$version.tar.gz'),
  bundleSha256: 'a' * 64,
  minAppBuild: minAppBuild,
  images: {for (final k in sh.imageVariables.keys) k: 'ghcr.io/casama-ai/$k@sha256:${'b' * 64}'},
);

/// The installer as the app drives it: records what it was asked and writes the files a real
/// install leaves (.env, images.env, manifest.json).
class FakeInstaller extends sh.SelfhostInstaller {
  final installs = <({String version, sh.InstallOptions options})>[];
  final updates = <String>[];

  /// The code the next update fails with (`update_rolled_back`, …), if any.
  String? updateFails;

  /// The code the next install fails with, if any.
  String? installFails;

  void _write(Directory dir, sh.SelfhostManifest m, {sh.InstallOptions? o}) {
    dir.createSync(recursive: true);
    final env = File('${dir.path}/.env');
    if (!env.existsSync()) {
      env.writeAsStringSync(
        'CASAMA_PUBLIC_URL=http://localhost:${o?.httpPort ?? 80}\nHTTP_PORT=${o?.httpPort ?? 80}\nCASAMA_INSTANCE_ID=${o?.instanceId}\nCASAMA_LICENSE_KEY=${o?.licenseKey ?? ''}\n',
      );
    }
    File('${dir.path}/images.env').writeAsStringSync(m.imagesEnv());
    File('${dir.path}/manifest.json').writeAsStringSync(jsonEncode(m.toJson()));
  }

  @override
  Stream<sh.InstallProgress> install({required sh.SelfhostManifest manifest, required Directory dir, required sh.InstallOptions options}) async* {
    installs.add((version: manifest.version, options: options));
    yield const sh.InstallProgress(sh.InstallStep.checkDocker, 'Checking Docker');
    yield sh.InstallProgress(sh.InstallStep.download, 'Downloading', fraction: 0.5);
    yield const sh.InstallProgress(sh.InstallStep.configure, 'Generating secrets');
    yield const sh.InstallProgress(sh.InstallStep.pull, 'Pulling images');
    if (installFails != null) throw sh.SelfhostException(installFails!, 'Couldn\'t pull the images.');
    _write(dir, manifest, o: options);
    yield const sh.InstallProgress(sh.InstallStep.start, 'Starting the stack');
    yield const sh.InstallProgress(sh.InstallStep.waitReady, 'Waiting for /readyz');
    yield sh.InstallProgress(sh.InstallStep.done, 'Casama ${manifest.version} is running');
  }

  @override
  Stream<sh.InstallProgress> update({required Directory dir, required sh.SelfhostManifest manifest, bool force = false}) async* {
    updates.add(manifest.version);
    yield const sh.InstallProgress(sh.InstallStep.backup, 'Backing up the database');
    yield const sh.InstallProgress(sh.InstallStep.pull, 'Pulling images');
    if (updateFails != null) {
      yield const sh.InstallProgress(sh.InstallStep.rollback, 'Going back');
      throw sh.SelfhostException(updateFails!, 'Casama ${manifest.version} did not start, so the server went back. The database backup is in backups/.');
    }
    _write(dir, manifest);
    yield sh.InstallProgress(sh.InstallStep.done, 'Updated to ${manifest.version}');
  }
}

void main() {
  test('a bare program name is found on the added PATH, not this app\'s own', () {
    final env = {'PATH': '/usr/bin:/bin:/usr/local/bin:/opt/homebrew/bin'};
    bool isFile(String p) => p == '/usr/local/bin/docker' || p == '/opt/homebrew/bin/docker';
    expect(SystemProcessRunner.resolve('docker', env: env, isFile: isFile, windows: false), '/usr/local/bin/docker');
    expect(SystemProcessRunner.resolve('/bin/sh', env: env, isFile: isFile, windows: false), '/bin/sh');
    expect(SystemProcessRunner.resolve('nope', env: env, isFile: isFile, windows: false), 'nope');
    if (!Platform.isWindows) expect(SystemProcessRunner.environment['PATH'], contains('/usr/local/bin'));
  });

  test('on Windows a program is found with its .exe on the semicolon PATH', () {
    final env = {'Path': r'C:\Windows;C:\Program Files\Docker\Docker\resources\bin'};
    bool isFile(String p) => p == r'C:\Program Files\Docker\Docker\resources\bin\docker.exe';
    expect(SystemProcessRunner.resolve('docker', env: env, isFile: isFile, windows: true), r'C:\Program Files\Docker\Docker\resources\bin\docker.exe');
  });

  test('instance ids are random UUID v4s', () {
    final id = newInstanceId();
    expect(id, matches(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$')));
    expect(newInstanceId(), isNot(id));
  });

  late Directory tmp;
  late FakeInstaller installer;
  setUp(() {
    tmp = Directory.systemTemp.createTempSync('kls');
    installer = FakeInstaller();
  });
  tearDown(() => tmp.deleteSync(recursive: true));

  LocalServerManager manager({FakeRunner? runner, bool up = false, Set<int> busy = const {}, String version = '2026.11.26-c20edba', File? legacy}) => LocalServerManager(
    legacyEnv: () async => legacy,
    runner: runner ?? FakeRunner(),
    installer: installer,
    manifestSource: () async => manifestFor(version),
    client: MockClient((r) async => http.Response('', up ? 200 : 503)),
    home: () async => tmp,
    portFree: (p) async => !busy.contains(p),
  );

  test('installs the newest release on free ports with its own stack name, and connects', () async {
    final steps = await manager(busy: {8080, 8443, 3478}).start().toList();
    expect(steps.first.step, LocalServerStep.checking);
    expect(
      steps.map((s) => s.step),
      containsAllInOrder([LocalServerStep.downloading, LocalServerStep.installing, LocalServerStep.starting, LocalServerStep.ready]),
    );
    expect(steps.where((s) => s.step == LocalServerStep.downloading).first.fraction, 0.5);
    // The setup page reads its parts from these headings.
    expect(steps.map((s) => s.detail), containsAll(['==> Pulling: Pulling images', '==> Starting the stack: Starting the stack']));
    expect(steps.last.detail, 'http://localhost:8081');
    final o = installer.installs.single.options;
    expect(o.local, isTrue);
    expect((o.httpPort, o.httpsPort), (8081, 8444));
    expect(o.settings, containsPair('COMPOSE_PROJECT_NAME', appStackName));
    expect(o.settings, containsPair('TURN_HOST_PORT', '3479'));
    expect(o.licenseKey, isNull, reason: 'no license asked for: the server starts in its setup state');
    expect((await manager().installed())!.url, 'http://localhost:8081');
  });

  test('the personal license is asked for with the instance id and release, and goes into the install', () async {
    final m = manager();
    final id = await m.instanceId();
    String? askedId, askedVersion;
    final steps = await m
        .start(
          license: (i, v) async {
            askedId = i;
            askedVersion = v;
            return 'personal-key';
          },
        )
        .toList();
    expect(steps.last.step, LocalServerStep.ready);
    expect((askedId, askedVersion), (id, '2026.11.26-c20edba'));
    final o = installer.installs.single.options;
    expect(o.instanceId, id);
    expect(o.licenseKey, 'personal-key');
    // The id stays the install's own afterwards.
    expect(await m.instanceId(), id);
  });

  test("a new install keeps the keys of the app's earlier local server, whose data is still in Docker", () async {
    final legacy = File('${tmp.path}/old/infra/compose/.env')
      ..parent.createSync(recursive: true)
      ..writeAsStringSync('POSTGRES_PASSWORD=old\n');
    await manager(legacy: legacy).start().drain<void>();
    expect(installer.installs.single.options.adoptEnv?.path, legacy.path);
    // Without one there is nothing to adopt.
    installer.installs.clear();
    tmp.listSync().where((e) => e.path.endsWith('.env')).forEach((e) => e.deleteSync());
    await manager().start().drain<void>();
    expect(installer.installs.single.options.adoptEnv, isNull);
  });

  test('says what to do when Docker is missing, and reconnects when the server already runs', () async {
    final missing = await manager(runner: FakeRunner(docker: false)).start().toList();
    expect(missing.last.step, LocalServerStep.failed);
    expect(missing.last.detail, contains('Install Docker Desktop'));
    expect(installer.installs, isEmpty);
    await manager().start().toList();
    installer.installs.clear();
    final again = await manager(up: true).start().toList();
    expect(again.last.step, LocalServerStep.ready);
    expect(installer.installs, isEmpty, reason: 'a running server is only reconnected');
  });

  test('a stopped install starts again as it is, with no new license or ports', () async {
    await manager().start().toList();
    final steps = await manager(busy: {8080}).start(license: (_, _) async => fail('not asked again')).toList();
    expect(steps.last.detail, 'http://localhost:8080');
    expect(installer.installs.last.options.settings, isEmpty);
    expect(installer.installs.last.options.licenseKey, isNull);
  });

  test('a failed install says why, with its code', () async {
    installer.installFails = 'pull_failed';
    final steps = await manager().start().toList();
    expect(steps.last.step, LocalServerStep.failed);
    expect(steps.last.code, 'pull_failed');
    expect(steps.last.detail, contains('pull the images'));
  });

  test('an update runs the installer\'s update and reports a rollback clearly', () async {
    await manager().start().toList();
    final ok = await manager().update(manifestFor('2026.12.1-abcdef0')).toList();
    expect(ok.last.step, LocalServerStep.ready);
    expect(installer.updates, ['2026.12.1-abcdef0']);
    expect(manager().installedVersion(tmp), '2026.12.1-abcdef0');

    installer.updateFails = 'update_rolled_back';
    final back = await manager().update(manifestFor('2026.12.2-1234567')).toList();
    expect(back.last.step, LocalServerStep.failed);
    expect(back.last.rolledBack, isTrue);
    expect(manager().installedVersion(tmp), '2026.12.1-abcdef0');
  });

  test('Casama Link runs the installer again on the recorded release', () async {
    await manager().start().toList();
    final lines = <String>[];
    final code = await manager().rerunInstaller(tmp, lines.add);
    expect(code, 0);
    expect(installer.installs.last.version, '2026.11.26-c20edba');
    expect(installer.installs.last.options.settings, isEmpty, reason: '.env is kept as it is');
    expect(lines, contains('Starting the stack'));
  });
}
