import 'dart:convert';
import 'dart:io';

import 'package:casama_selfhost/casama_selfhost.dart' as sh;
import 'package:http/http.dart' as http;

import 'commands_selfhost_release.dart';
import 'runner.dart';

/// `casama selfhost cloud-models on|off|status`: run this server's bots on Casama Cloud's models,
/// paid by one of your Casama workspaces (docs/SELFHOST-CLOUD-MODELS-PLAN.md §7.2, §13.1, §13.3).
///
/// `on` asks Casama Cloud (with your saved Cloud session, cloud-session.json) for a one-time connect
/// code for this server and hands it to the server, so your Cloud session never reaches the server.
/// The server's routes are for its instance admin: the CLI must be signed in to the server too.
class SelfhostCloudModelsCommand extends KCommand {
  SelfhostCloudModelsCommand(super.ctx) {
    argParser
      ..addOption(
        'server',
        help: 'The self-hosted server (default: the install in --dir, else the CLI\'s API address).',
      )
      ..addOption('dir', help: 'Install folder (default ~/.casama/selfhost).');
    addSubcommand(_CloudModelsStatus(ctx));
    addSubcommand(_CloudModelsOn(ctx));
    addSubcommand(_CloudModelsOff(ctx));
  }
  @override
  String get name => 'cloud-models';
  @override
  String get description =>
      'Use Casama Cloud\'s models on this server, paid by one of your workspaces.';
}

String _trimUrl(String url) => url.replaceAll(RegExp(r'/+$'), '');

http.Client _client() => selfhostDeps.client ?? http.Client();

/// One JSON call; a problem answer becomes a CliError with the server's code and words.
Future<Map<String, dynamic>> _json(
  String method,
  Uri url, {
  String? token,
  Object? body,
}) async {
  final req = http.Request(method, url)
    ..headers.addAll({
      'accept': 'application/json',
      if (token != null) 'authorization': 'Bearer $token',
      if (body != null) 'content-type': 'application/json',
    });
  if (body != null) req.body = jsonEncode(body);
  final http.Response res;
  try {
    res = await http.Response.fromStream(await _client().send(req));
  } on SocketException catch (e) {
    throw CliError('network_error', '${url.origin}: ${e.message}');
  } on http.ClientException catch (e) {
    throw CliError('network_error', '${url.origin}: ${e.message}');
  }
  Object? decoded;
  try {
    decoded = res.body.isEmpty
        ? const <String, dynamic>{}
        : jsonDecode(res.body);
  } on FormatException {
    decoded = null;
  }
  final map = decoded is Map<String, dynamic> ? decoded : <String, dynamic>{};
  if (res.statusCode >= 400) {
    throw CliError(
      map['code'] as String? ?? 'http_${res.statusCode}',
      map['message'] as String? ??
          map['detail'] as String? ??
          'HTTP ${res.statusCode} from ${url.origin}',
    );
  }
  return map;
}

/// The CLI's session on the server; the routes need a signed-in person, `on` and `off` an admin.
Future<String> _serverToken(CliContext ctx, Uri server) async {
  final t = await selfhostLocalToken(ctx, server);
  if (t == null) {
    throw CliError(
      'not_logged_in',
      'Sign in to the server as its admin first: casama --api $server login',
    );
  }
  return t;
}

Uri _route(Uri server, String path) =>
    Uri.parse('$server/v1/selfhost/cloud-models$path');

String _usd(Object? v) => v is num ? '\$${v.toStringAsFixed(2)}' : '—';

/// What `status` prints, from the server's GET shape (§13.3).
String describeCloudModels(Map<String, dynamic> s, Uri server) {
  if (s['available'] != true) {
    return '$server can\'t use Casama Cloud models (Casama Cloud itself, or no license yet: casama selfhost license personal).';
  }
  final lines = <String>['Server:     $server'];
  final payer = s['payer'] as Map<String, dynamic>?;
  if (s['connected'] != true || payer == null) {
    lines
      ..add('Cloud models: off')
      ..add(
        '\nTurn on: casama selfhost cloud-models on (or in the Casama app: Settings, then Models).',
      );
    return lines.join('\n');
  }
  lines
    ..add('Cloud models: on')
    ..add('Paid by:    ${payer['name']}');
  final status = s['status'] as Map<String, dynamic>?;
  final plan = status?['plan'] as Map<String, dynamic>?;
  if (plan != null) lines.add('Plan:       ${plan['name'] ?? plan['code']}');
  final today = status?['today'] as Map<String, dynamic>?;
  if (today != null) {
    lines.add(
      'Today:      ${_usd(today['spend_usd'])}${today['cap_usd'] == null ? '' : ' of ${_usd(today['cap_usd'])}'}',
    );
  }
  if (status?['credits_usd'] is num) {
    lines.add('Credits:    ${_usd(status!['credits_usd'])}');
  }
  final policy = s['policy'] as Map<String, dynamic>?;
  if (policy != null) {
    final allowed = policy['allowed'];
    lines.add(
      'Who:        ${allowed == 'all' ? 'everyone on this server' : '${(allowed as List?)?.length ?? 0} people'}',
    );
    final limit = policy['daily_usd_per_member'];
    if (limit is num) lines.add('Per person: ${_usd(limit)} a day');
  }
  final fallback = s['fallback'] as Map<String, dynamic>?;
  if (fallback != null) {
    final ways = [
      if (fallback['to_own'] == true) 'Cloud to own keys',
      if (fallback['from_own'] == true) 'own keys to Cloud',
    ];
    lines.add('Fallback:   ${ways.isEmpty ? 'off' : ways.join(', ')}');
  }
  final reindex = s['memory_reindex'] as Map<String, dynamic>?;
  if (reindex != null) {
    lines.add(
      'Memory:     re-indexing, ${reindex['done']} of ${reindex['total']}',
    );
  }
  return lines.join('\n');
}

class _CloudModelsStatus extends KCommand {
  _CloudModelsStatus(super.ctx);
  @override
  String get name => 'status';
  @override
  String get description =>
      'Show whether this server uses Casama Cloud\'s models, and who pays.';
  @override
  Future<int> run() async {
    final server = selfhostServer(this);
    final s = await _json(
      'GET',
      _route(server, ''),
      token: await _serverToken(ctx, server),
    );
    return ctx.emit({
      'server': server.toString(),
      ...s,
    }, describeCloudModels(s, server));
  }
}

class _CloudModelsOn extends KCommand {
  _CloudModelsOn(super.ctx) {
    argParser
      ..addOption(
        'workspace',
        abbr: 'w',
        help: 'The Casama workspace that pays (its id or name; asked when you have several).',
      )
      ..addOption(
        'cloud',
        help: 'Casama Cloud (default https://api.casama.ai, or CASAMA_CLOUD_URL).',
      )
      ..addOption(
        'email',
        abbr: 'e',
        help: 'Your Casama account email, when not signed in to Casama Cloud yet.',
      )
      ..addOption(
        'password',
        help: 'Password (or CASAMA_PASSWORD; prompted when omitted).',
      );
  }
  @override
  String get name => 'on';
  @override
  String get description =>
      'Connect this server to Casama Cloud\'s models, paid by one of your workspaces.';
  @override
  Future<int> run() async {
    final a = argResults!;
    final server = selfhostServer(this);
    final local = await _serverToken(ctx, server);
    final before = await _json('GET', _route(server, ''), token: local);
    if (before['available'] != true) {
      throw CliError('not_available', describeCloudModels(before, server));
    }
    final status = await sh.status(server, client: selfhostDeps.client);
    final instanceId = status.instanceId;
    if (instanceId == null) {
      throw CliError('no_instance', '$server did not say its instance id.');
    }

    final cloud = Uri.parse(
      _trimUrl(
        a['cloud'] as String? ??
            Platform.environment['CASAMA_CLOUD_URL'] ??
            Platform.environment['CASAMA_LICENSE_SERVER'] ??
            sh.defaultLicenseServer.toString(),
      ),
    );
    final String cloudToken;
    try {
      cloudToken = await selfhostDeps.cloudToken(ctx, cloud, a);
    } on CliError catch (e) {
      if (e.code != 'not_logged_in') rethrow;
      throw CliError(
        'not_logged_in',
        'Sign in with your Casama account: casama selfhost cloud-models on --email you@example.com',
      );
    }
    final org = await _pickWorkspace(
      cloud,
      cloudToken,
      a['workspace'] as String?,
    );
    final code = await _json(
      'POST',
      Uri.parse('$cloud/v1/selfhost/cloud/connect-codes'),
      token: cloudToken,
      body: {
        'org_id': org.id,
        'instance_id': instanceId,
        'instance_name': server.host,
      },
    );
    final connected = await _json(
      'POST',
      _route(server, '/connect'),
      token: local,
      body: {'code': code['code']},
    );
    return ctx.emit(
      {'server': server.toString(), ...connected},
      'Casama Cloud models are on, paid by ${org.name}.\n'
      'Choose which bots use them in the Casama app (Settings, then Models).\n\n'
      '${describeCloudModels(connected, server)}',
    );
  }

  /// The workspace that pays: one you own or run. --workspace by id or name, the only one, or asked.
  Future<({String id, String name})> _pickWorkspace(
    Uri cloud,
    String token,
    String? wanted,
  ) async {
    final list = await _json('GET', Uri.parse('$cloud/v1/orgs'), token: token);
    final orgs = [
      for (final o
          in (list['items'] as List? ?? const []).cast<Map<String, dynamic>>())
        if (o['role'] == 'owner' || o['role'] == 'admin')
          (
            id: o['id'] as String,
            name: o['name'] as String? ?? o['id'] as String,
          ),
    ];
    if (orgs.isEmpty) {
      throw CliError(
        'no_workspace',
        'You don\'t own or run a Casama workspace to pay for this server\'s models.',
      );
    }
    if (wanted != null) {
      final w = wanted.trim().toLowerCase();
      final hit = orgs
          .where((o) => o.id == wanted.trim() || o.name.toLowerCase() == w)
          .toList();
      if (hit.length == 1) return hit.single;
      throw CliError(
        'no_workspace',
        'No workspace you own or run is called "$wanted". Yours: ${orgs.map((o) => o.name).join(', ')}.',
      );
    }
    if (orgs.length == 1) return orgs.single;
    if (ctx.json || !stdin.hasTerminal) {
      throw CliError(
        'choose_workspace',
        'Choose the workspace that pays with --workspace: ${orgs.map((o) => o.name).join(', ')}.',
      );
    }
    final say = ctx.err;
    say.writeln('Which workspace pays for this server\'s models?');
    for (var i = 0; i < orgs.length; i++) {
      say.writeln('  ${i + 1}. ${orgs[i].name}');
    }
    say.write('Number: ');
    final n = int.tryParse(stdin.readLineSync()?.trim() ?? '');
    if (n == null || n < 1 || n > orgs.length) {
      throw CliError(
        'choose_workspace',
        'Give a number from 1 to ${orgs.length}.',
      );
    }
    return orgs[n - 1];
  }
}

class _CloudModelsOff extends KCommand {
  _CloudModelsOff(super.ctx);
  @override
  String get name => 'off';
  @override
  String get description =>
      'Stop using Casama Cloud\'s models; each bot goes back to the key it used before.';
  @override
  Future<int> run() async {
    final server = selfhostServer(this);
    final res = await _json(
      'POST',
      _route(server, '/off'),
      token: await _serverToken(ctx, server),
    );
    final bots = (res['bots'] as List? ?? const [])
        .cast<Map<String, dynamic>>();
    final lines = <String>['Casama Cloud models are off on $server.'];
    if (bots.isNotEmpty) {
      lines.add('');
      for (final b in bots) {
        final to = (b['to'] as Map<String, dynamic>?)?['label'];
        lines.add(
          '${b['name']}: ${to == null ? 'needs a model (add a key in the Casama app)' : 'now on $to'}',
        );
      }
    }
    return ctx.emit({'server': server.toString(), ...res}, lines.join('\n'));
  }
}
