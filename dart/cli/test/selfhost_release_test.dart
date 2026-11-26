import 'dart:convert';
import 'dart:io';

import 'package:casama_cli/casama_cli.dart';
import 'package:casama_cli/src/commands_selfhost.dart' show composeArgs;
import 'package:casama_cli/src/commands_selfhost_release.dart';
import 'package:casama_selfhost/casama_selfhost.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import '../../selfhost/test/helpers.dart';

/// `casama selfhost install|update|license` (docs/SELF-HOSTING-PLAN.md §6.4) against a stand-in
/// GitHub release, Docker, self-hosted server and Casama Cloud.
void main() {
  const v1 = '2026.11.20-aaaaaaa', v2 = '2026.11.26-c20edba';
  late Directory tmp, dir;
  late StringBuffer out, err;
  late FakeRunner runner;
  late Map<String, List<int>> bundles;
  late String latest;
  late List<http.Request> seen;
  late Map<String, dynamic> serverStatus;
  late String? storedLicense;

  Future<int> cli(List<String> args, {bool json = false}) {
    out = StringBuffer();
    err = StringBuffer();
    return runCli([if (json) '--json', ...args], out: out, err: err, configDir: tmp);
  }

  setUp(() {
    tmp = Directory.systemTemp.createTempSync('casama-cli-selfhost');
    dir = Directory(p.join(tmp.path, 'install'));
    runner = FakeRunner();
    bundles = {v1: makeBundle(v1), v2: makeBundle(v2)};
    latest = v1;
    seen = [];
    storedLicense = null;
    serverStatus = {
      'licensing': true,
      'state': 'setup',
      'edition': null,
      'instance_id': '6f1c0b1e-0000-4000-8000-000000000001',
      'expires_at': null,
      'grace_until': null,
      'members': 0,
      'seats': null,
      'engine_version': v1,
    };
    final client = MockClient((r) async {
      seen.add(r);
      final path = r.url.path;
      if (path.endsWith('/selfhost-latest/manifest.json')) return http.Response(jsonEncode(makeManifest(latest, bundles[latest]!).toJson()), 200);
      if (path.endsWith('/selfhost-v$v2/manifest.json')) return http.Response(jsonEncode(makeManifest(v2, bundles[v2]!).toJson()), 200);
      if (path.endsWith('/sized/manifest.json')) {
        final ref = 'caddy:2.10.2-alpine';
        return http.Response(
          jsonEncode({
            ...makeManifest(v1, bundles[v1]!).toJson(),
            'download': {
              'layers': {
                'sha256:a': [2600000000, 9000000000],
              },
              'images': {
                'arm64': [
                  {'name': 'caddy', 'ref': ref, 'profile': null, 'layers': ['sha256:a']},
                ],
              },
            },
          }),
          200,
        );
      }
      if (path.endsWith('bundle.tar.gz')) {
        final v = bundles.keys.firstWhere((k) => path.contains(k));
        return http.Response.bytes(bundles[v]!, 200);
      }
      if (path == '/readyz') return http.Response('', 200);
      if (path == '/v1/selfhost/status') return http.Response(jsonEncode(serverStatus), 200);
      if (path == '/v1/selfhost/license' && r.method == 'PUT') {
        storedLicense = (jsonDecode(r.body) as Map)['license'] as String;
        serverStatus = {...serverStatus, 'state': 'active', 'edition': 'personal', 'seats': 1, 'expires_at': '2026-12-26T00:00:00Z'};
        return http.Response('{}', 200);
      }
      if (path == '/v1/selfhost/licenses/personal') {
        return http.Response(jsonEncode({'license': 'personal.jwt.sig', 'expires_at': '2026-12-26T00:00:00Z'}), 200);
      }
      return http.Response('not found', 404);
    });
    selfhostDeps = SelfhostDeps()
      ..client = client
      ..installer = SelfhostInstaller(
        runner: runner,
        client: client,
        secrets: FastSecrets(),
        delay: (_) async {},
        readyTimeout: const Duration(milliseconds: 3),
        pollInterval: const Duration(milliseconds: 1),
        isWindows: false,
      )
      ..cloudToken = ((ctx, cloud, args) async {
        expect(cloud.toString(), 'https://api.casama.ai');
        return 'cloud-token';
      });
  });
  tearDown(() {
    selfhostDeps = SelfhostDeps();
    tmp.deleteSync(recursive: true);
  });

  test('install downloads the newest release into --dir and starts it', () async {
    expect(await cli(['selfhost', 'install', '--local', '--http-port', '8080', '--dir', dir.path]), 0, reason: '$err');
    expect('$out', contains('==> Downloading Casama $v1'));
    expect('$out', contains('running at http://localhost:8080'));
    expect('$out', contains('casama selfhost license personal'));
    expect(installedVersion(dir), v1);
    final env = EnvFile.read(File(p.join(dir.path, '.env')));
    expect(env.value('CASAMA_INSTANCE_ID'), isNotNull);
    expect(env['HTTP_BIND'], '127.0.0.1');
    expect(seen.first.url, latestManifestUrl);
    expect(runner.matching(['docker', 'compose', 'up', '-d']), hasLength(1));
  });

  test('install says the download and disk size when the release measured them', () async {
    final sized = FakeRunner(answer: (exe, args) => args.contains('{{.Architecture}}') ? ProcessResult(0, 0, 'aarch64\n', '') : null);
    selfhostDeps.installer = SelfhostInstaller(
      runner: sized,
      client: selfhostDeps.client,
      secrets: FastSecrets(),
      delay: (_) async {},
      readyTimeout: const Duration(milliseconds: 3),
      pollInterval: const Duration(milliseconds: 1),
      isWindows: false,
    );
    final url = 'https://github.com/casama-ai/casama/releases/download/sized/manifest.json';
    expect(await cli(['selfhost', 'install', '--local', '--dir', dir.path, '--manifest-url', url, '--no-start']), 0, reason: '$err');
    expect('$out', contains('==> Download: 2.6 GB; the images take about 12 GB of disk'));
  });

  test('install --json prints the result as JSON and progress on stderr', () async {
    expect(await cli(['selfhost', 'install', '--domain', 'casama.example.com', '--dir', dir.path, '--no-start'], json: true), 0, reason: '$err');
    final j = jsonDecode('$out') as Map;
    expect(j['version'], v1);
    expect(j['url'], 'https://casama.example.com');
    expect(j['started'], isFalse);
    expect('$err', contains('==> Pulling images'));
    expect(runner.matching(['up']), isEmpty);
  });

  test('install --lan opens the server to the local network and says how to reach it', () async {
    expect(await cli(['selfhost', 'install', '--lan', '--lan-address', '192.168.1.20', '--http-port', '8080', '--dir', dir.path]), 0, reason: '$err');
    expect('$out', contains('running at http://192.168.1.20:8080'));
    expect('$out', contains('other devices (phones, laptops) use http://192.168.1.20:8080'));
    expect('$out', contains('plain HTTP on the local network'));
    final env = EnvFile.read(File(p.join(dir.path, '.env')));
    expect(env['CASAMA_PUBLIC_URL'], 'http://192.168.1.20:8080');
    expect(env['HTTP_BIND'], '0.0.0.0');
    expect(env['TURN_BIND'], '0.0.0.0');
    expect(env['TURN_PUBLIC_HOST'], '192.168.1.20');
    expect(env['CASAMA_LOCAL_URL'], 'http://127.0.0.1:8080');
  });

  test('install refuses --lan with --domain, and --lan-address without --lan', () async {
    expect(await cli(['selfhost', 'install', '--lan', '--domain', 'x.example', '--dir', dir.path]), 64);
    expect(await cli(['selfhost', 'install', '--lan-address', '192.168.1.20', '--dir', dir.path]), 64);
    expect(await cli(['selfhost', 'install', '--lan', '--lan-address', 'http://bad', '--dir', dir.path]), 1);
    expect('$err', contains('bad_lan_address'));
  });

  test('install refuses a source checkout and --local with --domain', () async {
    File(p.join(dir.path, 'infra', 'compose', 'docker-compose.yml')).createSync(recursive: true);
    expect(await cli(['selfhost', 'install', '--dir', dir.path]), 1);
    expect('$err', contains('is_a_checkout'));
    expect(await cli(['selfhost', 'install', '--local', '--domain', 'x.example', '--dir', dir.path]), 64);
  });

  test('update moves a release install to a newer version; --version picks one', () async {
    expect(await cli(['selfhost', 'install', '--local', '--dir', dir.path]), 0, reason: '$err');
    expect(await cli(['selfhost', '--dir', dir.path, 'update']), 0, reason: '$err');
    expect('$out', contains('up to date ($v1)'));
    expect(await cli(['selfhost', 'update', '--dir', dir.path, '--version', v2]), 0, reason: '$err');
    expect('$out', contains('Casama is on $v2'));
    expect(installedVersion(dir), v2);
    expect(runner.matching(['pg_dump']), hasLength(1));
  });

  test('update says what to do in a folder with no install or a checkout', () async {
    expect(await cli(['selfhost', 'update', '--dir', dir.path]), 1);
    expect('$err', contains('not_installed'));
    File(p.join(dir.path, 'install.sh')).createSync(recursive: true);
    expect(await cli(['selfhost', 'update', '--dir', dir.path]), 1);
    expect('$err', contains('upgrade'));
  });

  test('a release install works with the compose commands: .env and images.env both', () async {
    expect(await cli(['selfhost', 'install', '--local', '--dir', dir.path]), 0, reason: '$err');
    final args = composeArgs(dir);
    expect(
      args,
      containsAllInOrder([
        'compose',
        '-f',
        p.join(dir.path, 'docker-compose.yml'),
        '--env-file',
        p.join(dir.path, '.env'),
        '--env-file',
        p.join(dir.path, 'images.env'),
      ]),
    );
  });

  test('license status reads the install\'s server', () async {
    expect(await cli(['selfhost', 'install', '--local', '--http-port', '8080', '--dir', dir.path]), 0, reason: '$err');
    expect(await cli(['selfhost', 'license', '--dir', dir.path, 'status']), 0, reason: '$err');
    expect('$out', contains('State:    setup'));
    expect('$out', contains('casama selfhost license personal'));
    expect(seen.last.url.toString(), 'http://127.0.0.1:8080/v1/selfhost/status');
    serverStatus = {...serverStatus, 'state': 'active', 'edition': 'personal', 'seats': 1, 'last_checkin_at': '2026-11-26T03:00:00Z'};
    expect(await cli(['selfhost', 'license', '--dir', dir.path, 'status'], json: true), 0, reason: '$err');
    expect((jsonDecode('$out') as Map)['last_checkin_at'], '2026-11-26T03:00:00.000Z');
    expect(await cli(['selfhost', 'license', '--dir', dir.path, 'status']), 0, reason: '$err');
    expect('$out', contains('Checked in:'));
  });

  test('license set puts the key on the server', () async {
    expect(await cli(['selfhost', 'license', '--server', 'http://127.0.0.1:9000/', 'set', 'business.jwt.sig'], json: true), 0, reason: '$err');
    expect(storedLicense, 'business.jwt.sig');
    expect((jsonDecode('$out') as Map)['state'], 'active');
    expect(seen.firstWhere((r) => r.method == 'PUT').url.toString(), 'http://127.0.0.1:9000/v1/selfhost/license');
  });

  test('license personal gets the key from Casama Cloud for this instance and sets it', () async {
    expect(await cli(['selfhost', 'license', '--server', 'http://127.0.0.1:9000', 'personal']), 0, reason: '$err');
    final ask = seen.firstWhere((r) => r.url.path == '/v1/selfhost/licenses/personal');
    expect(ask.url.host, 'api.casama.ai');
    expect(ask.headers['authorization'], 'Bearer cloud-token');
    expect(jsonDecode(ask.body), {'instance_id': '6f1c0b1e-0000-4000-8000-000000000001', 'engine_version': v1});
    expect(storedLicense, 'personal.jwt.sig');
    expect('$out', contains('Personal license set'));
    expect('$out', contains('License:  personal, 1 seat'));
  });

  test('license personal refuses a server that does not use licenses', () async {
    serverStatus = {'licensing': false};
    expect(await cli(['selfhost', 'license', '--server', 'https://api.casama.ai', 'personal']), 1);
    expect('$err', contains('not_selfhosted'));
  });
}
