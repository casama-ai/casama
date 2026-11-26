import 'dart:convert';
import 'dart:io';

import 'package:casama_cli/casama_cli.dart';
import 'package:casama_cli/src/commands_selfhost_release.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

/// `casama selfhost cloud-models on|off|status` (docs/SELFHOST-CLOUD-MODELS-PLAN.md §13.1, §13.3)
/// against a stand-in self-hosted server and Casama Cloud.
void main() {
  const server = 'http://127.0.0.1:9000';
  const instance = '6f1c0b1e-0000-4000-8000-000000000001';
  late Directory tmp;
  late StringBuffer out, err;
  late List<http.Request> seen;
  late List<Map<String, dynamic>> orgs;
  late Map<String, dynamic> state;
  late String? redeemed;

  Future<int> cli(List<String> args, {bool json = false}) {
    out = StringBuffer();
    err = StringBuffer();
    return runCli(
      ['--api', server, if (json) '--json', ...args],
      out: out,
      err: err,
      configDir: tmp,
    );
  }

  void signInToServer() {
    File(p.join(tmp.path, 'session.json')).writeAsStringSync(
      jsonEncode({
        'access_token': 'server-token',
        'refresh_token': 'r',
        'expires_at':
            DateTime.now()
                .add(const Duration(days: 1))
                .millisecondsSinceEpoch ~/
            1000,
        'user': {'id': 'u1', 'email': 'admin@example.com'},
      }),
    );
  }

  setUp(() {
    tmp = Directory.systemTemp.createTempSync('casama-cli-cloud-models');
    seen = [];
    redeemed = null;
    orgs = [
      {'id': 'o-home', 'name': 'Home', 'role': 'owner'},
      {'id': 'o-work', 'name': 'Work', 'role': 'admin'},
      {'id': 'o-club', 'name': 'Club', 'role': 'member'},
    ];
    state = {
      'available': true,
      'connected': false,
      'payer': null,
      'status': null,
      'policy': {'allowed': 'all', 'daily_usd_per_member': null},
      'fallback': {'to_own': false, 'from_own': false},
      'embedding': false,
      'memory_reindex': null,
      'can_manage': true,
    };
    selfhostDeps = SelfhostDeps()
      ..client = MockClient((r) async {
        seen.add(r);
        final path = r.url.path;
        final local = r.url.toString().startsWith(server);
        if (local && path == '/v1/selfhost/status') {
          return http.Response(
            jsonEncode({
              'licensing': true,
              'state': 'active',
              'instance_id': instance,
            }),
            200,
          );
        }
        if (local && path.startsWith('/v1/selfhost/cloud-models')) {
          if (r.headers['authorization'] != 'Bearer server-token') {
            return http.Response(
              jsonEncode({'code': 'unauthorized', 'message': 'Sign in.'}),
              401,
            );
          }
          if (path.endsWith('/connect')) {
            redeemed = (jsonDecode(r.body) as Map)['code'] as String;
            state = {
              ...state,
              'connected': true,
              'payer': {'org_id': 'o-work', 'name': 'Work'},
              'status': {
                'plan': {'code': 'pro', 'name': 'Pro', 'paid': true},
                'today': {'spend_usd': 0.25, 'cap_usd': 10},
                'credits_usd': 12,
              },
              'memory_reindex': {'done': 3, 'total': 40},
            };
            return http.Response(jsonEncode(state), 200);
          }
          if (path.endsWith('/off')) {
            return http.Response(
              jsonEncode({
                'bots': [
                  {
                    'id': 'b1',
                    'name': 'Helper',
                    'to': {'label': 'My OpenAI key'},
                  },
                  {'id': 'b2', 'name': 'Scout', 'to': null},
                ],
              }),
              200,
            );
          }
          return http.Response(jsonEncode(state), 200);
        }
        if (r.url.host == 'api.casama.ai' && path == '/v1/orgs') {
          return http.Response(jsonEncode({'items': orgs}), 200);
        }
        if (r.url.host == 'api.casama.ai' &&
            path == '/v1/selfhost/cloud/connect-codes') {
          return http.Response(
            jsonEncode({
              'code': 'ABCD-EFGH',
              'expires_at': '2026-11-26T10:10:00Z',
            }),
            200,
          );
        }
        return http.Response('not found', 404);
      })
      ..cloudToken = ((ctx, cloud, args) async {
        expect(cloud.toString(), 'https://api.casama.ai');
        return 'cloud-token';
      });
  });
  tearDown(() {
    selfhostDeps = SelfhostDeps();
    tmp.deleteSync(recursive: true);
  });

  test('needs the CLI signed in to the server', () async {
    expect(
      await cli(['selfhost', 'cloud-models', '--server', server, 'status']),
      1,
    );
    expect('$err', contains('not_logged_in'));
    expect('$err', contains('casama --api $server login'));
  });

  test('status says it is off, and how to turn it on', () async {
    signInToServer();
    expect(
      await cli(['selfhost', 'cloud-models', '--server', server, 'status']),
      0,
      reason: '$err',
    );
    expect('$out', contains('Cloud models: off'));
    expect('$out', contains('casama selfhost cloud-models on'));
    state = {...state, 'available': false};
    expect(
      await cli(['selfhost', 'cloud-models', '--server', server, 'status']),
      0,
      reason: '$err',
    );
    expect('$out', contains('can\'t use Casama Cloud models'));
  });

  test('on gets a connect code from Cloud for the chosen workspace and hands it to the server', () async {
    signInToServer();
    expect(
      await cli([
        'selfhost',
        'cloud-models',
        '--server',
        server,
        'on',
        '--workspace',
        'work',
      ]),
      0,
      reason: '$err',
    );
    final ask = seen.firstWhere(
      (r) => r.url.path == '/v1/selfhost/cloud/connect-codes',
    );
    expect(ask.headers['authorization'], 'Bearer cloud-token');
    expect(jsonDecode(ask.body), {
      'org_id': 'o-work',
      'instance_id': instance,
      'instance_name': '127.0.0.1',
    });
    expect(redeemed, 'ABCD-EFGH');
    final connect = seen.firstWhere((r) => r.url.path.endsWith('/connect'));
    expect(connect.url.toString(), '$server/v1/selfhost/cloud-models/connect');
    // The Cloud session never goes to the server.
    expect(
      seen
          .where((r) => r.url.toString().startsWith(server))
          .map((r) => r.headers['authorization']),
      everyElement(isNot('Bearer cloud-token')),
    );
    expect('$out', contains('paid by Work'));
    expect('$out', contains('Plan:       Pro'));
    expect('$out', contains('Today:      \$0.25 of \$10.00'));
    expect('$out', contains('Memory:     re-indexing, 3 of 40'));
  });

  test('on picks the only workspace you run, and asks for --workspace when there are several', () async {
    signInToServer();
    expect(
      await cli([
        'selfhost',
        'cloud-models',
        '--server',
        server,
        'on',
      ], json: true),
      1,
    );
    expect('$err', contains('choose_workspace'));
    expect('$err', contains('Home, Work'));
    expect('$err', isNot(contains('Club')));
    expect(redeemed, isNull);
    orgs = [orgs.first, orgs.last];
    expect(
      await cli([
        'selfhost',
        'cloud-models',
        '--server',
        server,
        'on',
      ], json: true),
      0,
      reason: '$err',
    );
    final ask = seen.lastWhere(
      (r) => r.url.path == '/v1/selfhost/cloud/connect-codes',
    );
    expect((jsonDecode(ask.body) as Map)['org_id'], 'o-home');
    expect((jsonDecode('$out') as Map)['connected'], true);
  });

  test(
    'on refuses an unknown workspace and a server that cannot use Cloud models',
    () async {
      signInToServer();
      expect(
        await cli([
          'selfhost',
          'cloud-models',
          '--server',
          server,
          'on',
          '--workspace',
          'Club',
        ]),
        1,
      );
      expect('$err', contains('no_workspace'));
      state = {...state, 'available': false};
      expect(
        await cli([
          'selfhost',
          'cloud-models',
          '--server',
          server,
          'on',
          '--workspace',
          'Home',
        ]),
        1,
      );
      expect('$err', contains('not_available'));
    },
  );

  test('off turns it off and says where each bot went', () async {
    signInToServer();
    expect(
      await cli(['selfhost', 'cloud-models', '--server', server, 'off']),
      0,
      reason: '$err',
    );
    expect(seen.last.method, 'POST');
    expect(seen.last.url.toString(), '$server/v1/selfhost/cloud-models/off');
    expect('$out', contains('Helper: now on My OpenAI key'));
    expect('$out', contains('Scout: needs a model'));
  });
}
