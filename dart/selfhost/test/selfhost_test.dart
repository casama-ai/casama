import 'dart:convert';
import 'dart:io';

import 'package:casama_selfhost/casama_selfhost.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import 'helpers.dart';

void main() {
  late Directory tmp;
  setUp(() => tmp = Directory.systemTemp.createTempSync('casama-selfhost-test'));
  tearDown(() => tmp.deleteSync(recursive: true));

  group('manifest', () {
    test('parses, round-trips and writes images.env', () {
      final m = makeManifest('2026.11.26-c20edba', makeBundle('x'));
      final again = SelfhostManifest.fromJson(jsonDecode(jsonEncode(m.toJson())) as Map<String, dynamic>);
      expect(again.version, '2026.11.26-c20edba');
      expect(again.minAppBuild, 104);
      final env = EnvFile.parse(again.imagesEnv());
      expect(env['CASAMA_ENGINE_VERSION'], '2026.11.26-c20edba');
      for (final v in imageVariables.values) {
        expect(env[v], contains('@sha256:'), reason: v);
      }
      expect(env['CASAMA_IMAGE_SERVER'], startsWith('ghcr.io/casama-ai/engine-server@'));
    });

    test('refuses an image not pinned by digest and an unknown schema', () {
      final j = makeManifest('v', makeBundle('v')).toJson();
      (j['images'] as Map)['turn'] = 'ghcr.io/casama-ai/turn:latest';
      expect(() => SelfhostManifest.fromJson(j), throwsA(isA<SelfhostException>().having((e) => e.code, 'code', 'manifest_invalid')));
      final j2 = makeManifest('v', makeBundle('v')).toJson()..['schema'] = 2;
      expect(() => SelfhostManifest.fromJson(j2), throwsA(isA<SelfhostException>().having((e) => e.code, 'code', 'manifest_schema')));
    });

    test('fetchManifest reads the latest release by default', () async {
      Uri? asked;
      final m = makeManifest('2026.11.26-c20edba', makeBundle('x'));
      final client = MockClient((r) async {
        asked = r.url;
        return http.Response(jsonEncode(m.toJson()), 200);
      });
      final got = await fetchManifest(client: client);
      expect(asked, latestManifestUrl);
      expect(asked.toString(), 'https://github.com/casama-ai/casama/releases/download/selfhost-latest/manifest.json');
      expect(got.bundleSha256, m.bundleSha256);
      final missing = MockClient((r) async => http.Response('nope', 404));
      expect(fetchManifest(client: missing), throwsA(isA<SelfhostException>().having((e) => e.code, 'code', 'manifest_unavailable')));
    });
  });

  group('secrets', () {
    test('Supabase keys are HS256 JWTs signed with the secret', () {
      final s = SecretSource();
      final secret = s.hex(32);
      expect(secret, matches(RegExp(r'^[0-9a-f]{64}$')));
      final jwt = s.supabaseKey('anon', secret);
      final parts = jwt.split('.');
      expect(parts, hasLength(3));
      final claims = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))) as Map;
      expect(claims['role'], 'anon');
      expect(claims['iss'], 'supabase');
      expect((claims['exp'] as int) - (claims['iat'] as int), 10 * 365 * 24 * 3600);
      final sig = base64Url.encode(Hmac(sha256, utf8.encode(secret)).convert(utf8.encode('${parts[0]}.${parts[1]}')).bytes).replaceAll('=', '');
      expect(parts[2], sig);
    });

    test('instance ids are v4 UUIDs', () {
      final id = SecretSource().uuid();
      expect(id, matches(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$')));
    });

    test('the SAML key is an RSA 2048 PKCS#1 DER key', () {
      final der = base64.decode(SecretSource().samlKey());
      expect(der[0], 0x30); // SEQUENCE
      expect(der[1], 0x82); // two length bytes
      expect((der[2] << 8) + der[3], der.length - 4);
      expect(der.sublist(4, 7), [0x02, 0x01, 0x00]); // version 0
      final openssl = Process.runSync('which', ['openssl']);
      if (openssl.exitCode == 0) {
        final f = File(p.join(tmp.path, 'k.der'))..writeAsBytesSync(der);
        final r = Process.runSync('openssl', ['rsa', '-inform', 'DER', '-in', f.path, '-check', '-noout']);
        expect(r.exitCode, 0, reason: '${r.stderr}');
      }
    }, timeout: const Timeout(Duration(minutes: 2)));
  });

  group('configureEnv', () {
    test('a fresh local install gets every secret, loopback binds and an instance id', () {
      final env = EnvFile([]);
      configureEnv(env, InstallOptions.local(httpPort: 8080, adminEmail: 'me@example.com'), FastSecrets(), fresh: true, hostMemoryGb: 16);
      for (final k in [
        'POSTGRES_PASSWORD',
        'WORKER_DB_PASSWORD',
        'JWT_SECRET',
        'ANON_KEY',
        'SERVICE_ROLE_KEY',
        'SECRET_KEY_BASE',
        'REALTIME_ENC_KEY',
        'SUPERVISOR_TOKEN',
        'COMPUTER_TOKEN_SECRET',
        'SAML_PRIVATE_KEY',
        'EGRESS_CONTROL_TOKEN',
        'INTERNAL_TOKEN',
        'TURN_SECRET',
        'SEARXNG_SECRET',
        'METRICS_TOKEN',
        'GRAFANA_ADMIN_PASSWORD',
        'AUTH_HOOK_SECRET',
        'CONTENT_ENCRYPTION_KEY',
        'CASAMA_INSTANCE_ID',
      ]) {
        expect(env.value(k), isNotNull, reason: k);
      }
      expect(env['CASAMA_PUBLIC_URL'], 'http://localhost:8080');
      expect(env['CASAMA_SITE'], ':80');
      expect(env['HTTP_BIND'], '127.0.0.1');
      expect(env['TURN_BIND'], '127.0.0.1');
      // An older bundle without the signup-hook network: no hook (Auth would call nothing).
      expect(env['SIGNUP_HOOK_URI'], '');
      expect(env.has('SIGNUP_HOOK_ENABLED'), isFalse);
      expect(env['COMPUTER_HOST_MEMORY_GB'], '12');
      expect(env['INSTANCE_ADMIN_EMAILS'], 'me@example.com');
      expect(env['AUTH_HOOK_SECRET'], startsWith('v1,whsec_'));
      expect(base64.decode(env['CONTENT_ENCRYPTION_KEY']!), hasLength(32));
      expect(env['REALTIME_ENC_KEY'], hasLength(16));
    });

    test('a domain install uses https and the sign-up hook', () {
      final env = EnvFile([]);
      configureEnv(env, InstallOptions(domain: 'casama.example.com', licenseKey: 'lic', instanceId: 'id-1'), FastSecrets(), fresh: true);
      expect(env['CASAMA_SITE'], 'casama.example.com');
      expect(env['CASAMA_PUBLIC_URL'], 'https://casama.example.com');
      expect(env['SIGNUP_HOOK_URI'], 'https://casama.example.com/hooks/auth/before-user-created');
      expect(env.has('SIGNUP_HOOK_ENABLED'), isFalse); // unchanged for https installs
      expect(env.has('HTTP_BIND'), isFalse);
      expect(env['CASAMA_LICENSE_KEY'], 'lic');
      expect(env['CASAMA_INSTANCE_ID'], 'id-1');
    });

    test('an existing .env keeps its values and gains only missing ones', () {
      final env = EnvFile.parse('JWT_SECRET=keep\nCASAMA_PUBLIC_URL=https://x.example\nCASAMA_INSTANCE_ID=old-id\nCONTENT_ENCRYPTION_KEY=k\n');
      configureEnv(env, InstallOptions(instanceId: 'new-id', search: true), FastSecrets(), fresh: false);
      expect(env['JWT_SECRET'], 'keep');
      expect(env['CASAMA_INSTANCE_ID'], 'old-id');
      expect(env['CONTENT_ENCRYPTION_KEY'], 'k');
      expect(env['SIGNUP_HOOK_URI'], 'https://x.example/hooks/auth/before-user-created');
      expect(env.value('COMPUTER_TOKEN_SECRET'), isNotNull);
      expect(env['SEARXNG_URL'], 'http://searxng:8080');
      expect(profilesFor(env), ['search']);
    });
  });

  group('LAN option', () {
    test('a fresh LAN install binds every interface and uses the LAN address', () {
      final env = EnvFile([]);
      configureEnv(env, InstallOptions.local(httpPort: 8080, lan: true), FastSecrets(), fresh: true, internalSignupHook: true, lanHost: '192.168.1.20');
      expect(env['CASAMA_PUBLIC_URL'], 'http://192.168.1.20:8080');
      expect(env['HTTP_BIND'], '0.0.0.0');
      expect(env['TURN_BIND'], '0.0.0.0');
      expect(env['TURN_PUBLIC_HOST'], '192.168.1.20');
      expect(env['CASAMA_LOCAL_URL'], 'http://127.0.0.1:8080');
      // Plain HTTP: the sign-up hook still runs, over Docker's network.
      expect(env['SIGNUP_HOOK_URI'], internalSignupHookUri);
    });

    test('port 80 has no port in the address', () {
      final env = EnvFile([]);
      configureEnv(env, InstallOptions.local(lan: true), FastSecrets(), fresh: true, lanHost: 'imac.local');
      expect(env['CASAMA_PUBLIC_URL'], 'http://imac.local');
    });

    test('an existing local install opens up on a re-run, keeping its keys and pages port', () {
      final env = EnvFile.parse(
        'JWT_SECRET=keep\nCASAMA_PUBLIC_URL=http://localhost:8080\nHTTP_PORT=8080\nHTTP_BIND=127.0.0.1\nTURN_BIND=127.0.0.1\n'
        'CASAMA_PAGES_URL=http://localhost:8790\n',
      );
      configureEnv(env, InstallOptions(lan: true), FastSecrets(), fresh: false, lanHost: '10.0.0.5');
      expect(env['JWT_SECRET'], 'keep');
      expect(env['CASAMA_PUBLIC_URL'], 'http://10.0.0.5:8080');
      expect(env['HTTP_BIND'], '0.0.0.0');
      expect(env['TURN_BIND'], '0.0.0.0');
      expect(env['CASAMA_PAGES_URL'], 'http://10.0.0.5:8790');
      expect(env.lines.where((l) => l.startsWith('HTTP_BIND=')), hasLength(1));
    });

    test('a server with an https address is refused, and the options are checked', () {
      final env = EnvFile.parse('CASAMA_PUBLIC_URL=https://casama.example.com\n');
      expect(
        () => configureEnv(env, InstallOptions(lan: true), FastSecrets(), fresh: false, lanHost: '192.168.1.20'),
        throwsA(isA<SelfhostException>().having((e) => e.code, 'code', 'lan_with_https')),
      );
      expect(() => InstallOptions(domain: 'x.example.com', lan: true), throwsA(isA<SelfhostException>()));
      expect(() => InstallOptions(lanAddress: '192.168.1.20'), throwsA(isA<SelfhostException>()));
      expect(() => InstallOptions(lan: true, lanAddress: 'http://x'), throwsA(isA<SelfhostException>()));
    });

    test('picks the LAN address, skipping Docker, VPN and loopback adapters', () {
      expect(
        pickLanAddress([
          ('lo', '127.0.0.1'),
          ('docker0', '172.17.0.1'),
          ('vEthernet (WSL)', '172.25.0.1'),
          ('tailscale0', '100.64.0.2'),
          ('utun3', '10.8.0.2'),
          ('en1', '10.0.0.7'),
          ('en0', '192.168.1.20'),
        ]),
        '192.168.1.20',
      );
      expect(pickLanAddress([('eth0', '10.0.0.7')]), '10.0.0.7');
      expect(pickLanAddress([('eth0', '8.8.8.8'), ('docker0', '172.17.0.1')]), isNull);
    });

    test('install finds the address itself and refuses when there is none', () async {
      final dir = Directory.systemTemp.createTempSync('lan');
      addTearDown(() => dir.deleteSync(recursive: true));
      const v = '2026.11.26-c20edba';
      final bundle = makeBundle(v);
      final m = makeManifest(v, bundle);
      SelfhostInstaller make(String? ip) => SelfhostInstaller(
        runner: FakeRunner(),
        client: MockClient((r) async => r.url.path.endsWith('bundle.tar.gz') ? http.Response.bytes(bundle, 200) : http.Response('', 200)),
        secrets: FastSecrets(),
        delay: (_) async {},
        lanAddress: () async => ip,
      );
      await make('192.168.7.7').install(manifest: m, dir: dir, options: InstallOptions.local(lan: true, start: false)).drain<void>();
      expect(EnvFile.read(File(p.join(dir.path, '.env')))['CASAMA_PUBLIC_URL'], 'http://192.168.7.7');
      final none = Directory.systemTemp.createTempSync('lan');
      addTearDown(() => none.deleteSync(recursive: true));
      await expectLater(
        make(null).install(manifest: m, dir: none, options: InstallOptions.local(lan: true, start: false)).drain<void>(),
        throwsA(isA<SelfhostException>().having((e) => e.code, 'code', 'lan_address')),
      );
    });
  });

  group('sign-up hook on plain HTTP', () {
    test("a fresh local install calls the hook over Docker's network, turned on", () {
      final env = EnvFile([]);
      configureEnv(env, InstallOptions.local(httpPort: 8080), FastSecrets(), fresh: true, internalSignupHook: true);
      expect(env['SIGNUP_HOOK_URI'], 'http://host.docker.internal:8787/hooks/auth/before-user-created');
      expect(env['SIGNUP_HOOK_ENABLED'], 'true');
    });

    test("a domain install also calls the hook over Docker's network, turned on", () {
      final env = EnvFile([]);
      configureEnv(env, InstallOptions(domain: 'casama.example.com'), FastSecrets(), fresh: true, internalSignupHook: true);
      expect(env['SIGNUP_HOOK_URI'], internalSignupHookUri);
      expect(env['SIGNUP_HOOK_ENABLED'], 'true');
    });

    test("an existing domain install's own https hook moves to Docker's network on update", () {
      final env = EnvFile.parse('CASAMA_PUBLIC_URL=https://casama.example.com\nSIGNUP_HOOK_URI=https://casama.example.com/hooks/auth/before-user-created\n');
      configureEnv(env, InstallOptions(), FastSecrets(), fresh: false, internalSignupHook: true);
      expect(env['SIGNUP_HOOK_URI'], internalSignupHookUri);
      expect(env['SIGNUP_HOOK_ENABLED'], 'true');
      // An owner's own hook address stays.
      final own = EnvFile.parse('CASAMA_PUBLIC_URL=https://casama.example.com\nSIGNUP_HOOK_URI=https://hooks.example.com/x\n');
      configureEnv(own, InstallOptions(), FastSecrets(), fresh: false, internalSignupHook: true);
      expect(own['SIGNUP_HOOK_URI'], 'https://hooks.example.com/x');
      // An older bundle without the network: unchanged.
      final old = EnvFile.parse('CASAMA_PUBLIC_URL=https://casama.example.com\nSIGNUP_HOOK_URI=https://casama.example.com/hooks/auth/before-user-created\n');
      configureEnv(old, InstallOptions(), FastSecrets(), fresh: false);
      expect(old['SIGNUP_HOOK_URI'], 'https://casama.example.com/hooks/auth/before-user-created');
    });

    test('an existing plain-HTTP install gets the hook on update', () {
      final env = EnvFile.parse('CASAMA_PUBLIC_URL=http://localhost:8080\nSIGNUP_HOOK_URI=\n');
      configureEnv(env, InstallOptions(), FastSecrets(), fresh: false, internalSignupHook: true);
      expect(env['SIGNUP_HOOK_URI'], internalSignupHookUri);
      expect(env['SIGNUP_HOOK_ENABLED'], 'true');
      expect(env.lines.where((l) => l.startsWith('SIGNUP_HOOK_URI=')), hasLength(1));
    });

    test("an owner's own setting and a remote-access address stay", () {
      final off = EnvFile.parse('CASAMA_PUBLIC_URL=http://localhost\nSIGNUP_HOOK_URI=\nSIGNUP_HOOK_ENABLED=false\n');
      configureEnv(off, InstallOptions(), FastSecrets(), fresh: false, internalSignupHook: true);
      expect(off['SIGNUP_HOOK_ENABLED'], 'false');
      final remote = EnvFile.parse('CASAMA_REMOTE_ACCESS=on\nCASAMA_PUBLIC_URL=https://abc.casama.link\nSIGNUP_HOOK_URI=https://abc.casama.link/hooks/auth/before-user-created\n');
      configureEnv(remote, InstallOptions(), FastSecrets(), fresh: false, internalSignupHook: true);
      expect(remote['SIGNUP_HOOK_URI'], 'https://abc.casama.link/hooks/auth/before-user-created');
      expect(remote.has('SIGNUP_HOOK_ENABLED'), isFalse);
    });

    test("the bundle's compose decides whether the network is there", () {
      final dir = Directory.systemTemp.createTempSync('hook');
      addTearDown(() => dir.deleteSync(recursive: true));
      expect(hasInternalSignupHook(dir), isFalse);
      File('${dir.path}/docker-compose.yml').writeAsStringSync('networks:\n  signup-hook: { internal: true }\n');
      expect(hasInternalSignupHook(dir), isTrue);
      // And the real bundle compose has it. Found from the working directory upwards, since the
      // tests run from dart/selfhost locally but from dart/ in the public export's check.
      final real = _repoFile('selfhost/docker-compose.yml').readAsStringSync();
      expect(real, contains('signup-hook:'));
      expect(real, contains('aliases: [host.docker.internal]'));
    });
  });

  group('install', () {
    const v = '2026.11.26-c20edba';

    MockClient server(List<int> bundle, {int Function()? ready}) => MockClient((r) async {
      if (r.url.path.endsWith('bundle.tar.gz')) return http.Response.bytes(bundle, 200);
      if (r.url.path == '/readyz') return http.Response('', ready?.call() ?? 200);
      return http.Response('not found', 404);
    });

    SelfhostInstaller installer(FakeRunner runner, http.Client client) => SelfhostInstaller(
      runner: runner,
      client: client,
      secrets: FastSecrets(),
      delay: (_) async {},
      readyTimeout: const Duration(milliseconds: 5),
      pollInterval: const Duration(milliseconds: 1),
      isLinux: false,
      isWindows: false,
    );

    test('downloads, writes .env and images.env, pulls, starts and waits for /readyz', () async {
      final bundle = makeBundle(v);
      final runner = FakeRunner();
      final steps = await install(
        manifest: makeManifest(v, bundle),
        dir: tmp,
        options: InstallOptions.local(httpPort: 8080),
        installer: installer(runner, server(bundle)),
      ).toList();
      expect(steps.last.step, InstallStep.done);
      expect(steps.last.message, contains('http://localhost:8080'));
      expect(File(p.join(tmp.path, 'docker-compose.yml')).readAsStringSync(), contains(v));
      expect(File(p.join(tmp.path, 'searxng', 'settings.yml')).existsSync(), isTrue);
      expect(installedVersion(tmp), v);
      expect(installedManifest(tmp)?.version, v);
      final env = EnvFile.read(File(p.join(tmp.path, '.env')));
      expect(env.value('CASAMA_INSTANCE_ID'), isNotNull);
      expect(readyUrl(tmp), 'http://127.0.0.1:8080');
      expect(runner.matching(['chmod', '600']), isNotEmpty);
      expect(runner.matching(['docker', 'compose', '--env-file', '--env-file', 'pull']), isNotEmpty);
      expect(runner.matching(['docker', 'compose', '--profile', 'images', 'pull', '--quiet', 'computer-headless']), isNotEmpty);
      expect(runner.matching(['docker', 'compose', 'up', '-d', '--remove-orphans']), hasLength(1));
      expect(Directory(p.join(tmp.path, '.download')).listSync(), isEmpty);
    });

    test('running it again keeps .env, keys and the instance id', () async {
      final bundle = makeBundle(v);
      final m = makeManifest(v, bundle);
      await install(manifest: m, dir: tmp, options: InstallOptions.local(), installer: installer(FakeRunner(), server(bundle))).drain<void>();
      final first = EnvFile.read(File(p.join(tmp.path, '.env')));
      await install(
        manifest: m,
        dir: tmp,
        options: InstallOptions.local(licenseKey: 'key-2'),
        installer: installer(FakeRunner(), server(bundle)),
      ).drain<void>();
      final second = EnvFile.read(File(p.join(tmp.path, '.env')));
      for (final k in ['JWT_SECRET', 'ANON_KEY', 'POSTGRES_PASSWORD', 'CASAMA_INSTANCE_ID', 'CONTENT_ENCRYPTION_KEY']) {
        expect(second[k], first[k], reason: k);
      }
      expect(second['CASAMA_LICENSE_KEY'], 'key-2');
    });

    test('a new install refuses data left by an earlier install of the same stack', () async {
      final bundle = makeBundle(v);
      final runner = FakeRunner(
        answer: (exe, args) => args.length > 1 && args[0] == 'volume' && args[1] == 'ls' ? ProcessResult(0, 0, 'casama-app_db-data\n', '') : null,
      );
      final run = install(
        manifest: makeManifest(v, bundle),
        dir: tmp,
        options: InstallOptions(settings: const {'COMPOSE_PROJECT_NAME': 'casama-app'}),
        installer: installer(runner, server(bundle)),
      );
      await expectLater(run, emitsThrough(emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'old_data'))));
      expect(runner.matching(['docker', 'volume', 'ls', '-q', '--filter', r'name=^casama-app_db-data$']), hasLength(1));
      expect(File(p.join(tmp.path, '.env')).existsSync(), isFalse);
      expect(runner.matching(['docker', 'compose', 'up']), isEmpty);
    });

    test("adopts an earlier install's .env, so its passwords and keys carry over", () async {
      final bundle = makeBundle(v);
      final old = File(p.join(tmp.path, 'old', '.env'))
        ..parent.createSync(recursive: true)
        ..writeAsStringSync('POSTGRES_PASSWORD=old-pw\nJWT_SECRET=old-jwt\nCASAMA_PUBLIC_URL=http://localhost:8090\nHTTP_PORT=8090\n');
      final dir = Directory(p.join(tmp.path, 'new'));
      // The old volumes exist: adopting their .env is what makes that safe.
      final runner = FakeRunner(
        answer: (exe, args) => args.length > 1 && args[0] == 'volume' && args[1] == 'ls' ? ProcessResult(0, 0, 'casama-app_db-data\n', '') : null,
      );
      final steps = await install(
        manifest: makeManifest(v, bundle),
        dir: dir,
        options: InstallOptions(instanceId: 'id-1', licenseKey: 'key-1', adoptEnv: old, settings: const {'COMPOSE_PROJECT_NAME': 'casama-app'}),
        installer: installer(runner, server(bundle)),
      ).toList();
      expect(steps.last.step, InstallStep.done);
      expect(runner.matching(['docker', 'volume', 'ls']), isEmpty);
      final env = EnvFile.read(File(p.join(dir.path, '.env')));
      expect(env['POSTGRES_PASSWORD'], 'old-pw');
      expect(env['JWT_SECRET'], 'old-jwt');
      expect(env['HTTP_PORT'], '8090');
      expect(env['CASAMA_INSTANCE_ID'], 'id-1');
      expect(env['CASAMA_LICENSE_KEY'], 'key-1');
      expect(env['COMPOSE_PROJECT_NAME'], 'casama-app');
      expect(env.value('CONTENT_ENCRYPTION_KEY'), isNotNull);
    });

    test('a bundle that fails its checksum changes nothing', () async {
      final bundle = makeBundle(v);
      final m = makeManifest(v, makeBundle('other'));
      final run = install(manifest: m, dir: tmp, options: InstallOptions.local(), installer: installer(FakeRunner(), server(bundle)));
      await expectLater(run, emitsThrough(emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'checksum_mismatch'))));
      expect(File(p.join(tmp.path, '.env')).existsSync(), isFalse);
      expect(File(p.join(tmp.path, 'docker-compose.yml')).existsSync(), isFalse);
    });

    test('says so when Docker is missing or not running', () async {
      final bundle = makeBundle(v);
      final missing = FakeRunner(answer: (exe, args) => throw ProcessException(exe, args, 'not found'));
      await expectLater(
        install(manifest: makeManifest(v, bundle), dir: tmp, options: InstallOptions.local(), installer: installer(missing, server(bundle))),
        emitsThrough(emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'docker_missing'))),
      );
      final stopped = FakeRunner(answer: (exe, args) => args.first == 'info' ? ProcessResult(0, 1, '', 'Cannot connect') : null);
      await expectLater(
        install(manifest: makeManifest(v, bundle), dir: tmp, options: InstallOptions.local(), installer: installer(stopped, server(bundle))),
        emitsThrough(emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'docker_not_running'))),
      );
    });

    test('retries a failed pull, then gives up', () async {
      final bundle = makeBundle(v);
      var pulls = 0;
      final runner = FakeRunner(
        answer: (exe, args) {
          if (args.contains('pull')) {
            pulls++;
            return ProcessResult(0, 1, '', 'toomanyrequests');
          }
          return null;
        },
      );
      await expectLater(
        install(manifest: makeManifest(v, bundle), dir: tmp, options: InstallOptions.local(), installer: installer(runner, server(bundle))),
        emitsThrough(emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'pull_failed'))),
      );
      expect(pulls, 5);
    });

    test('a server that never answers /readyz fails with not_ready', () async {
      final bundle = makeBundle(v);
      await expectLater(
        install(
          manifest: makeManifest(v, bundle),
          dir: tmp,
          options: InstallOptions.local(),
          installer: installer(FakeRunner(), server(bundle, ready: () => 503)),
        ),
        emitsThrough(emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'not_ready'))),
      );
    });

    test('the API container being healthy also counts as ready', () async {
      final bundle = makeBundle(v);
      final runner = FakeRunner(answer: (exe, args) => args.contains('ps') ? ProcessResult(0, 0, '{"Service":"api","Health":"healthy"}\n', '') : null);
      final steps = await install(
        manifest: makeManifest(v, bundle),
        dir: tmp,
        options: InstallOptions(domain: 'casama.example.com'),
        installer: installer(runner, server(bundle, ready: () => 503)),
      ).toList();
      expect(steps.last.step, InstallStep.done);
    });
  });

  group('update', () {
    const v1 = '2026.11.20-aaaaaaa', v2 = '2026.11.26-c20edba';

    Future<void> installV1(List<int> bundle1) => install(
      manifest: makeManifest(v1, bundle1),
      dir: tmp,
      options: InstallOptions.local(),
      installer: SelfhostInstaller(
        runner: FakeRunner(),
        client: MockClient((r) async => r.url.path.endsWith('.tar.gz') ? http.Response.bytes(bundle1, 200) : http.Response('', 200)),
        secrets: FastSecrets(),
        delay: (_) async {},
        isWindows: false,
      ),
    ).drain<void>();

    SelfhostInstaller updater(FakeRunner runner, List<int> bundle2, {required bool newReady}) => SelfhostInstaller(
      runner: runner,
      secrets: FastSecrets(),
      delay: (_) async {},
      readyTimeout: const Duration(milliseconds: 3),
      pollInterval: const Duration(milliseconds: 1),
      isWindows: false,
      client: MockClient((r) async {
        if (r.url.path.endsWith('.tar.gz')) return http.Response.bytes(bundle2, 200);
        // Healthy unless the new release is running and shouldn't be.
        return http.Response('', installedVersion(tmp) == v2 && !newReady ? 503 : 200);
      }),
    );

    test('backs up, pulls, starts and moves to the new release', () async {
      await installV1(makeBundle(v1));
      final envBefore = File(p.join(tmp.path, '.env')).readAsStringSync();
      final bundle2 = makeBundle(v2);
      final runner = FakeRunner();
      final steps = await update(dir: tmp, manifest: makeManifest(v2, bundle2), installer: updater(runner, bundle2, newReady: true)).toList();
      expect(
        steps.map((s) => s.step),
        containsAllInOrder([
          InstallStep.download,
          InstallStep.backup,
          InstallStep.extract,
          InstallStep.pull,
          InstallStep.start,
          InstallStep.waitReady,
          InstallStep.done,
        ]),
      );
      expect(installedVersion(tmp), v2);
      expect(File(p.join(tmp.path, 'docker-compose.yml')).readAsStringSync(), contains(v2));
      expect(File(p.join(tmp.path, '.env')).readAsStringSync(), envBefore);
      expect(runner.matching(['docker', 'compose', 'exec', '-T', 'db', 'pg_dump']), hasLength(1));
      final backups = Directory(p.join(tmp.path, 'backups')).listSync().whereType<Directory>().toList();
      expect(backups, hasLength(1));
      expect(File(p.join(backups.single.path, 'postgres.dump')).existsSync(), isTrue);
      expect(EnvFile.read(File(p.join(backups.single.path, 'previous', 'images.env')))['CASAMA_ENGINE_VERSION'], v1);
    });

    test('rolls back to the previous images.env and files when the new release is unhealthy', () async {
      await installV1(makeBundle(v1));
      final bundle2 = makeBundle(v2);
      final runner = FakeRunner();
      final steps = <InstallProgress>[];
      Object? error;
      await update(
        dir: tmp,
        manifest: makeManifest(v2, bundle2),
        installer: updater(runner, bundle2, newReady: false),
      ).forEach(steps.add).catchError((Object e) => error = e);
      expect(steps.map((s) => s.step), contains(InstallStep.rollback));
      expect(error, isA<SelfhostException>().having((e) => e.code, 'code', 'update_rolled_back'));
      expect(installedVersion(tmp), v1);
      expect(File(p.join(tmp.path, 'docker-compose.yml')).readAsStringSync(), contains(v1));
      expect(runner.matching(['docker', 'compose', 'up', '-d']), hasLength(2));
    });

    test('a failed backup stops before anything changes', () async {
      await installV1(makeBundle(v1));
      final bundle2 = makeBundle(v2);
      final runner = FakeRunner()..dumpExit = 1;
      await expectLater(
        update(dir: tmp, manifest: makeManifest(v2, bundle2), installer: updater(runner, bundle2, newReady: true)),
        emitsThrough(emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'backup_failed'))),
      );
      expect(installedVersion(tmp), v1);
      expect(runner.matching(['up']), isEmpty);
    });

    test('a failed pull puts the previous files back and leaves the server alone', () async {
      await installV1(makeBundle(v1));
      final bundle2 = makeBundle(v2);
      final runner = FakeRunner(answer: (exe, args) => args.contains('pull') ? ProcessResult(0, 1, '', 'down') : null);
      await expectLater(
        update(dir: tmp, manifest: makeManifest(v2, bundle2), installer: updater(runner, bundle2, newReady: true)),
        emitsThrough(emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'pull_failed'))),
      );
      expect(installedVersion(tmp), v1);
      expect(File(p.join(tmp.path, 'docker-compose.yml')).readAsStringSync(), contains(v1));
      expect(runner.matching(['up']), isEmpty);
    });

    test('is a no-op on the same version and refuses a folder with no install', () async {
      await installV1(makeBundle(v1));
      final steps = await update(
        dir: tmp,
        manifest: makeManifest(v1, makeBundle(v1)),
        installer: updater(FakeRunner(), makeBundle(v1), newReady: true),
      ).toList();
      expect(steps.single.message, contains('Already on'));
      final empty = Directory(p.join(tmp.path, 'empty'))..createSync();
      await expectLater(
        update(dir: empty, manifest: makeManifest(v2, makeBundle(v2))),
        emitsError(isA<SelfhostException>().having((e) => e.code, 'code', 'not_installed')),
      );
    });
  });

  group('status and licenses', () {
    test('status reads §11.6', () async {
      final client = MockClient((r) async {
        expect(r.url.toString(), 'http://127.0.0.1:8080/v1/selfhost/status');
        return http.Response(
          jsonEncode({
            'licensing': true,
            'state': 'setup',
            'edition': null,
            'instance_id': 'i-1',
            'expires_at': null,
            'grace_until': null,
            'members': 0,
            'seats': null,
            'engine_version': '2026.11.26-c20edba',
          }),
          200,
        );
      });
      final s = await status(Uri.parse('http://127.0.0.1:8080'), client: client);
      expect(s.licensing, isTrue);
      expect(s.needsLicense, isTrue);
      expect(s.instanceId, 'i-1');
      expect(s.engineVersion, '2026.11.26-c20edba');
      final cloud = await status(Uri.parse('https://api.casama.ai/'), client: MockClient((r) async => http.Response('{"licensing":false}', 200)));
      expect(cloud.licensing, isFalse);
      expect(cloud.toJson(), {'licensing': false});
    });

    test('requestPersonalLicense and putLicense send the §11.5 and §11.6 bodies', () async {
      final seen = <http.Request>[];
      final client = MockClient((r) async {
        seen.add(r);
        if (r.url.path == '/v1/selfhost/licenses/personal') {
          return http.Response(jsonEncode({'license': 'jwt.lic.sig', 'expires_at': '2026-12-26T00:00:00Z'}), 200);
        }
        if (r.url.path == '/v1/selfhost/license') return http.Response('{}', 200);
        return http.Response('', 404);
      });
      final lic = await requestPersonalLicense(accessToken: 'tok', instanceId: 'i-1', engineVersion: 'v', client: client);
      expect(lic.license, 'jwt.lic.sig');
      expect(lic.expiresAt, DateTime.utc(2026, 12, 26));
      expect(seen.first.url.toString(), 'https://api.casama.ai/v1/selfhost/licenses/personal');
      expect(seen.first.headers['authorization'], 'Bearer tok');
      expect(jsonDecode(seen.first.body), {'instance_id': 'i-1', 'engine_version': 'v'});
      await putLicense(Uri.parse('http://127.0.0.1:8080'), lic.license, client: client);
      expect(seen.last.method, 'PUT');
      expect(jsonDecode(seen.last.body), {'license': 'jwt.lic.sig'});
      expect(seen.last.headers.containsKey('authorization'), isFalse);
    });

    test('errors carry the server problem code', () async {
      final client = MockClient((r) async => http.Response(jsonEncode({'code': 'license_moved', 'detail': 'Moved to another server'}), 409));
      await expectLater(
        putLicense(Uri.parse('http://x'), 'k', client: client),
        throwsA(isA<SelfhostException>().having((e) => e.code, 'code', 'license_moved').having((e) => e.message, 'message', 'Moved to another server')),
      );
    });
  });

  test('a bundle path outside the folder is refused', () {
    final f = File(p.join(tmp.path, 'evil.tar.gz'))..writeAsBytesSync(makeBundle('x', files: {'../escape.txt': 'no', 'ok.txt': 'yes'}));
    final out = Directory(p.join(tmp.path, 'out'))..createSync();
    expect(() => extractBundle(f, out), throwsA(isA<SelfhostException>()));
  });
}

/// A file at [relative] from the repository root, found by walking up from the working directory.
File _repoFile(String relative) {
  var dir = Directory.current.absolute;
  while (true) {
    final f = File(p.join(dir.path, relative));
    if (f.existsSync()) return f;
    final parent = dir.parent;
    if (parent.path == dir.path) throw StateError('$relative not found above ${Directory.current.path}');
    dir = parent;
  }
}
