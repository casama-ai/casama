import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:casama_selfhost/casama_selfhost.dart' as sh;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

import 'runner.dart';
import 'store.dart';

/// What `casama selfhost install|update|license` talk to; tests swap them.
class SelfhostDeps {
  /// Docker, the network and the clock for installs and updates.
  sh.SelfhostInstaller? installer;

  /// HTTP for the manifest, the server's status and licenses.
  http.Client? client;

  /// The person's Casama Cloud access token for `license personal`.
  Future<String> Function(CliContext ctx, Uri cloud, ArgResults args) cloudToken = _cloudToken;
}

SelfhostDeps selfhostDeps = SelfhostDeps();

/// The folder `install` writes to: --dir (here or on `selfhost`), CASAMA_SELFHOST_DIR, or the
/// default (~/.casama/selfhost).
Directory installDir(Command<int> c) {
  for (Command<int>? x = c; x != null; x = x.parent) {
    final r = x.argResults;
    if (r != null && r.options.contains('dir') && r['dir'] != null) return Directory(r['dir'] as String);
  }
  final env = Platform.environment['CASAMA_SELFHOST_DIR'];
  return env != null && env.isNotEmpty ? Directory(env) : sh.defaultInstallDir();
}

/// True for a folder installed from the self-host release (compose file beside images.env).
bool isReleaseInstall(Directory d) => File(p.join(d.path, 'images.env')).existsSync() && File(p.join(d.path, sh.composeFileName)).existsSync();

Uri _manifestUrl(ArgResults a) {
  final url = a['manifest-url'] as String?;
  if (url != null) return Uri.parse(url);
  final v = a['version'] as String?;
  if (v != null) return Uri.parse('https://github.com/casama-ai/casama/releases/download/selfhost-v$v/manifest.json');
  return sh.latestManifestUrl;
}

void _addReleaseOptions(ArgParser parser) {
  parser
    ..addOption('dir', help: 'Install folder (default ~/.casama/selfhost, or CASAMA_SELFHOST_DIR).')
    ..addOption('version', help: 'A release version (YYYY.M.D-commit) instead of the newest.')
    ..addOption('manifest-url', help: 'Read the release from this manifest.json.', hide: true);
}

/// Says what the install downloads and the disk it needs, from the release's measured image sizes
/// (nothing for a release without them, or when Docker can't be asked).
Future<void> _sayDownload(CliContext ctx, sh.SelfhostManifest m, {Set<String> profiles = const {}, bool withDesktop = false}) async {
  final e = await (selfhostDeps.installer ?? sh.SelfhostInstaller()).estimateDownload(m, profiles: profiles, withDesktop: withDesktop);
  if (e == null) return;
  final say = ctx.json ? ctx.err : ctx.out;
  say.writeln('==> Download: ${e.downloadGb.toStringAsFixed(1)} GB; the images take about ${e.diskGb.ceil()} GB of disk');
}

/// Prints installer progress: a line per step, download progress every 10%.
Future<void> _follow(CliContext ctx, Stream<sh.InstallProgress> steps) async {
  final say = ctx.json ? ctx.err : ctx.out;
  var lastTenth = -1;
  try {
    await for (final s in steps) {
      if (s.step == sh.InstallStep.download && s.fraction != null) {
        final tenth = (s.fraction! * 10).floor();
        if (tenth == lastTenth) continue;
        lastTenth = tenth;
        if (s.fraction! > 0) {
          say.writeln('    ${(s.fraction! * 100).round()}%');
          continue;
        }
      }
      say.writeln('==> ${s.message}');
    }
  } on sh.SelfhostException catch (e) {
    throw CliError(e.code, e.message);
  }
}

Future<sh.SelfhostManifest> _manifest(ArgResults a) async {
  try {
    return await sh.fetchManifest(url: _manifestUrl(a), client: selfhostDeps.client);
  } on sh.SelfhostException catch (e) {
    throw CliError(e.code, e.message);
  }
}

/// What `selfhost install --lan` prints about reaching the server from other devices.
String lanNote(String url) =>
    '''On the local network, other devices (phones, laptops) use $url
Note: this is plain HTTP on the local network. Anyone on the same network can reach the server's
sign-in page, and traffic isn't encrypted; use it on networks you trust, or set up a domain or
remote access (casama selfhost remote on) for anything else.''';

/// `casama selfhost install`: download the newest release and run it, no checkout needed.
class SelfhostInstallCommand extends KCommand {
  SelfhostInstallCommand(super.ctx) {
    _addReleaseOptions(argParser);
    argParser
      ..addFlag('local', negatable: false, help: 'This machine only, plain HTTP (the default without --domain).')
      ..addFlag('lan', negatable: false, help: "Without a domain: also reachable from devices on the local network (plain HTTP on every interface, at this machine's LAN address).")
      ..addOption('lan-address', help: "With --lan: the address other devices use (default: this machine's LAN IP).")
      ..addOption('domain', help: 'Public domain (automatic HTTPS).')
      ..addOption('http-port', defaultsTo: '80')
      ..addOption('https-port', defaultsTo: '443')
      ..addOption('admin-email', help: 'Instance admins (comma-separated).')
      ..addOption('license-key', help: 'A Casama license key (without one, get the free personal one with `selfhost license personal`).')
      ..addFlag('behind-proxy', negatable: false, help: 'TLS ends at a proxy or tunnel in front of this server (needs --domain).')
      ..addOption('turn-host', help: 'Name or IP that reaches this machine directly, for live view.')
      ..addFlag('with-desktop', negatable: false, help: 'Also pull the desktop computer image.')
      ..addFlag('search', negatable: false, help: 'SearXNG web search for bots.')
      ..addFlag('backups', negatable: false, help: 'Daily off-site backups (set the BACKUP_* settings).')
      ..addFlag('monitoring', negatable: false, help: 'Prometheus and Grafana.')
      ..addFlag('no-start', negatable: false, help: 'Pull the images but do not start.');
  }
  @override
  String get name => 'install';
  @override
  String get description => 'Install Casama from the newest public release (Docker is the only requirement).';
  @override
  Future<int> run() async {
    final a = argResults!;
    if ((a['local'] as bool) && a['domain'] != null) throw UsageException('Pass --local or --domain, not both.', usage);
    if ((a['lan'] as bool) && a['domain'] != null) throw UsageException('--lan is for servers without a domain.', usage);
    if (a['lan-address'] != null && !(a['lan'] as bool)) throw UsageException('--lan-address needs --lan.', usage);
    final dir = installDir(this);
    if (!isReleaseInstall(dir) && File(p.join(dir.path, 'infra', 'compose', 'docker-compose.yml')).existsSync()) {
      throw CliError('is_a_checkout', '${dir.path} is a source checkout; use `casama selfhost --dir ${dir.path} init` there.');
    }
    final int httpPort, httpsPort;
    try {
      httpPort = int.parse(a['http-port'] as String);
      httpsPort = int.parse(a['https-port'] as String);
    } on FormatException {
      throw UsageException('Ports are numbers.', usage);
    }
    final sh.InstallOptions options;
    try {
      options = sh.InstallOptions(
        domain: a['domain'] as String?,
        httpPort: httpPort,
        httpsPort: httpsPort,
        adminEmail: a['admin-email'] as String?,
        licenseKey: a['license-key'] as String?,
        behindProxy: a['behind-proxy'] as bool,
        turnHost: a['turn-host'] as String?,
        withDesktop: a['with-desktop'] as bool,
        search: a['search'] as bool,
        backups: a['backups'] as bool,
        monitoring: a['monitoring'] as bool,
        start: !(a['no-start'] as bool),
        lan: a['lan'] as bool,
        lanAddress: a['lan-address'] as String?,
      );
    } on sh.SelfhostException catch (e) {
      throw CliError(e.code, e.message);
    }
    final manifest = await _manifest(a);
    await _sayDownload(
      ctx,
      manifest,
      profiles: {if (options.search) 'search', if (options.backups) 'backup', if (options.monitoring) 'monitoring'},
      withDesktop: options.withDesktop,
    );
    await _follow(ctx, sh.install(manifest: manifest, dir: dir, options: options, installer: selfhostDeps.installer));
    final env = sh.EnvFile.read(File(p.join(dir.path, '.env')));
    final public = env['CASAMA_PUBLIC_URL'] ?? sh.readyUrl(dir);
    return ctx.emit(
      {'dir': dir.path, 'version': manifest.version, 'url': public, 'instance_id': env['CASAMA_INSTANCE_ID'], 'started': options.start, 'lan': options.lan},
      '''

Casama ${manifest.version} is installed in ${dir.path}${options.start ? ' and running at $public' : ''}.
${options.lan ? '\n${lanNote(public)}' : ''}

  1. Get this server's free personal license with your Casama account:
       casama selfhost license personal
     (or a business key: casama selfhost license set <key>)
  2. Open the Casama app, choose Sign in > More options > Server, enter $public and create
     your account. The first account is the instance owner.
  3. Back up ${p.join(dir.path, '.env')} and the database: casama selfhost backup

Update later with: casama selfhost update''',
    );
  }
}

/// `casama selfhost update`: move an install to the newest release, rolling back on failure.
class SelfhostUpdateCommand extends KCommand {
  SelfhostUpdateCommand(super.ctx) {
    _addReleaseOptions(argParser);
    argParser.addFlag('force', negatable: false, help: 'Reinstall even when already on that version.');
  }
  @override
  String get name => 'update';
  @override
  String get description => 'Update to the newest release: back up, pull, restart, and roll back if it fails.';
  @override
  Future<int> run() async {
    final a = argResults!;
    final dir = installDir(this);
    if (!isReleaseInstall(dir)) {
      if (File(p.join(dir.path, 'install.sh')).existsSync()) {
        throw CliError('is_a_checkout', '${dir.path} is a source checkout; use `casama selfhost --dir ${dir.path} upgrade` there.');
      }
      throw CliError('not_installed', 'No Casama install in ${dir.path}. Install with `casama selfhost install`, or pass --dir.');
    }
    final before = sh.installedVersion(dir);
    final manifest = await _manifest(a);
    await _follow(ctx, sh.update(dir: dir, manifest: manifest, force: a['force'] as bool, installer: selfhostDeps.installer));
    return ctx.emit({
      'dir': dir.path,
      'from': before,
      'version': manifest.version,
    }, before == manifest.version && !(a['force'] as bool) ? 'Casama is up to date (${manifest.version}).' : 'Casama is on ${manifest.version}.');
  }
}

/// `casama selfhost license status|set|personal` (docs/SELF-HOSTING-PLAN.md §11.5, §11.6).
class SelfhostLicenseCommand extends KCommand {
  SelfhostLicenseCommand(super.ctx) {
    argParser
      ..addOption('server', help: 'The self-hosted server (default: the install in --dir, else the CLI\'s API address).')
      ..addOption('dir', help: 'Install folder (default ~/.casama/selfhost).');
    addSubcommand(_LicenseStatus(ctx));
    addSubcommand(_LicenseSet(ctx));
    addSubcommand(_LicensePersonal(ctx));
  }
  @override
  String get name => 'license';
  @override
  String get description => 'Show or set this server\'s Casama license, or get the free personal one.';
}

String _trim(String url) => url.replaceAll(RegExp(r'/+$'), '');

/// The self-hosted server a license command talks to.
Uri _server(KCommand c) {
  for (Command<int>? x = c; x != null; x = x.parent) {
    final r = x.argResults;
    if (r != null && r.options.contains('server') && r['server'] != null) return Uri.parse(_trim(r['server'] as String));
  }
  final dir = installDir(c);
  if (isReleaseInstall(dir)) return Uri.parse(sh.readyUrl(dir));
  final checkout = sh.EnvFile.read(File(p.join(dir.path, 'infra', 'compose', '.env')));
  final fromCheckout = checkout.value('CASAMA_LOCAL_URL') ?? checkout.value('CASAMA_PUBLIC_URL');
  if (fromCheckout != null) return Uri.parse(_trim(fromCheckout));
  return Uri.parse(_trim(c.ctx.apiUrl));
}

/// The self-hosted server a `selfhost` subcommand talks to (--server, the install in --dir, else
/// the CLI's API address).
Uri selfhostServer(KCommand c) => _server(c);

/// The CLI's own session token for [server], when it is signed in there.
Future<String?> selfhostLocalToken(CliContext ctx, Uri server) => _localToken(ctx, server);

/// The CLI's own session token when it is signed in to [server] (an instance admin can then
/// replace a license), else null.
Future<String?> _localToken(CliContext ctx, Uri server) async {
  if (_trim(ctx.apiUrl) != server.toString()) return null;
  final s = await ctx.sessions.load();
  return s?.accessToken;
}

String _describe(sh.SelfhostStatus s, Uri server) {
  if (!s.licensing) return '$server does not use licenses (Casama Cloud, or an older engine).';
  final lines = <String>['Server:   $server', 'State:    ${s.state}'];
  if (s.edition != null) lines.add('License:  ${s.edition}${s.seats == null ? '' : ', ${s.seats} seat${s.seats == 1 ? '' : 's'}'}');
  if (s.expiresAt != null) lines.add('Expires:  ${s.expiresAt!.toLocal()}');
  if (s.graceUntil != null && s.state != 'active') lines.add('Grace to: ${s.graceUntil!.toLocal()}');
  lines.add('Members:  ${s.members ?? 0}');
  lines.add('Instance: ${s.instanceId}');
  if (s.engineVersion != null) lines.add('Engine:   ${s.engineVersion}');
  if (s.lastCheckinAt != null) lines.add('Checked in: ${s.lastCheckinAt!.toLocal()}');
  if (s.state == 'setup') {
    lines.add('\nNo license yet. Get the free personal one: casama selfhost license personal');
    lines.add('For business use, a license from partners@casama.ai: casama selfhost license set <key>');
  }
  if (s.state == 'grace' || s.state == 'expired') lines.add('\nRenew: casama selfhost license personal (or set a business key).');
  return lines.join('\n');
}

Future<T> _sh<T>(Future<T> Function() f) async {
  try {
    return await f();
  } on sh.SelfhostException catch (e) {
    throw CliError(e.code, e.message);
  } on SocketException catch (e) {
    throw CliError('network_error', e.message);
  } on http.ClientException catch (e) {
    throw CliError('network_error', e.message);
  }
}

class _LicenseStatus extends KCommand {
  _LicenseStatus(super.ctx);
  @override
  String get name => 'status';
  @override
  String get description => 'Show the server\'s license state.';
  @override
  Future<int> run() async {
    final server = _server(this);
    final s = await _sh(() => sh.status(server, client: selfhostDeps.client));
    return ctx.emit({'server': server.toString(), ...s.toJson()}, _describe(s, server));
  }
}

class _LicenseSet extends KCommand {
  _LicenseSet(super.ctx);
  @override
  String get name => 'set';
  @override
  String get description => 'Give the server a license key (business, trial or personal).';
  @override
  String get invocation => 'casama selfhost license set <key>';
  @override
  Future<int> run() async {
    final rest = argResults!.rest;
    if (rest.length != 1) throw UsageException('Give the license key.', usage);
    final server = _server(this);
    try {
      await _sh(() async => sh.putLicense(server, rest.single.trim(), accessToken: await _localToken(ctx, server), client: selfhostDeps.client));
    } on CliError catch (e) {
      if (e.code == 'http_401' || e.code == 'http_403' || e.code == 'forbidden' || e.code == 'unauthorized') {
        throw CliError(
          e.code,
          '${e.message} This server already has a license, so only an instance admin can replace it: sign in with `casama --api $server login` first.',
        );
      }
      rethrow;
    }
    final s = await _sh(() => sh.status(server, client: selfhostDeps.client));
    return ctx.emit({'server': server.toString(), ...s.toJson()}, 'License set.\n\n${_describe(s, server)}');
  }
}

class _LicensePersonal extends KCommand {
  _LicensePersonal(super.ctx) {
    argParser
      ..addOption('cloud', help: 'Casama Cloud (default https://api.casama.ai, or CASAMA_LICENSE_SERVER).')
      ..addOption('email', abbr: 'e', help: 'Your Casama account email, when not signed in yet.')
      ..addOption('password', help: 'Password (or CASAMA_PASSWORD; prompted when omitted).');
  }
  @override
  String get name => 'personal';
  @override
  String get description => 'Get the free personal license with your Casama account and give it to this server.';
  @override
  Future<int> run() async {
    final server = _server(this);
    final before = await _sh(() => sh.status(server, client: selfhostDeps.client));
    if (!before.licensing) throw CliError('not_selfhosted', '$server does not use licenses (Casama Cloud, or an older engine).');
    if (before.instanceId == null) throw CliError('no_instance', '$server did not say its instance id.');
    final cloud = Uri.parse(_trim(argResults!['cloud'] as String? ?? Platform.environment['CASAMA_LICENSE_SERVER'] ?? sh.defaultLicenseServer.toString()));
    final token = await selfhostDeps.cloudToken(ctx, cloud, argResults!);
    final issued = await _sh(
      () => sh.requestPersonalLicense(
        accessToken: token,
        instanceId: before.instanceId!,
        engineVersion: before.engineVersion ?? 'unknown',
        licenseServer: cloud,
        client: selfhostDeps.client,
      ),
    );
    await _sh(() async => sh.putLicense(server, issued.license, accessToken: await _localToken(ctx, server), client: selfhostDeps.client));
    final after = await _sh(() => sh.status(server, client: selfhostDeps.client));
    return ctx.emit({
      'server': server.toString(),
      'expires_at': issued.expiresAt?.toUtc().toIso8601String(),
      ...after.toJson(),
    }, 'Personal license set (it renews itself online every 30 days).\n\n${_describe(after, server)}');
  }
}

/// The signed-in Casama Cloud session: the CLI's own when it points at Cloud, otherwise a
/// separate Cloud session kept in cloud-session.json (signing in once with --email).
Future<String> _cloudToken(CliContext ctx, Uri cloud, ArgResults a) async {
  if (_trim(ctx.apiUrl) == cloud.toString()) {
    // The CLI's own Cloud session when it has one; otherwise sign in with --email below.
    try {
      final s = await (await ctx.authedClient()).currentSession();
      if (s != null) return s.accessToken;
    } on CliError catch (_) {}
  }
  final store = FileSessionStore(File(p.join(ctx.dir.path, 'cloud-session.json')));
  final c = await CasamaClient.connect(cloud.toString(), sessions: store);
  final existing = await c.currentSession();
  if (existing != null) return existing.accessToken;
  final email = a['email'] as String? ?? Platform.environment['CASAMA_EMAIL'];
  if (email == null || email.isEmpty) {
    throw CliError('not_logged_in', 'Sign in with your Casama account: casama selfhost license personal --email you@example.com');
  }
  // Sign-up is invite-only on Casama Cloud for now: asking for a personal license lets the address in.
  try {
    await sh.admitForSelfhost(email, licenseServer: cloud, client: selfhostDeps.client);
  } on Object catch (_) {
    // Not fatal: an existing account signs in either way.
  }
  final password = a['password'] as String? ?? readSecret('Casama password for $email: ', env: 'CASAMA_PASSWORD');
  try {
    return (await c.signIn(email, password)).accessToken;
  } on Object catch (e) {
    throw CliError(
      'cloud_sign_in_failed',
      'Signing in to Casama Cloud as $email failed ($e). No account yet? Your address is now let in: '
          'create the account in the Casama app or at https://app.casama.ai, then run this again.',
    );
  }
}
