import 'dart:convert';

import 'package:http/http.dart' as http;

import 'errors.dart';

/// Default home of renewals and personal licenses (§11.3 `CASAMA_LICENSE_SERVER`).
final Uri defaultLicenseServer = Uri.parse('https://api.casama.ai');

/// `GET /v1/selfhost/status` on a server (docs/SELF-HOSTING-PLAN.md §11.6). On Casama Cloud
/// [licensing] is false and every other field is null.
class SelfhostStatus {
  const SelfhostStatus({
    required this.licensing,
    this.state,
    this.edition,
    this.instanceId,
    this.expiresAt,
    this.graceUntil,
    this.members,
    this.seats,
    this.engineVersion,
    this.lastCheckinAt,
  });

  factory SelfhostStatus.fromJson(Map<String, dynamic> j) {
    DateTime? date(String k) => j[k] is String ? DateTime.tryParse(j[k] as String) : null;
    return SelfhostStatus(
      licensing: j['licensing'] == true,
      state: j['state'] as String?,
      edition: j['edition'] as String?,
      instanceId: j['instance_id'] as String?,
      expiresAt: date('expires_at'),
      graceUntil: date('grace_until'),
      members: (j['members'] as num?)?.toInt(),
      seats: (j['seats'] as num?)?.toInt(),
      engineVersion: j['engine_version'] as String?,
      lastCheckinAt: date('last_checkin_at'),
    );
  }

  final bool licensing;

  /// `setup` | `active` | `grace` | `expired`.
  final String? state;

  /// `personal` | `trial` | `business`, or null without a license.
  final String? edition;
  final String? instanceId;
  final DateTime? expiresAt;
  final DateTime? graceUntil;
  final int? members;
  final int? seats;
  final String? engineVersion;

  /// The last daily license check-in with Casama Cloud, when the server reports it.
  final DateTime? lastCheckinAt;

  /// True when the server has no license yet and only signs in, answers status and takes a key.
  bool get needsLicense => licensing && state == 'setup';

  Map<String, dynamic> toJson() => {
    'licensing': licensing,
    if (licensing) ...{
      'state': state,
      'edition': edition,
      'instance_id': instanceId,
      'expires_at': expiresAt?.toUtc().toIso8601String(),
      'grace_until': graceUntil?.toUtc().toIso8601String(),
      'members': members,
      'seats': seats,
      'engine_version': engineVersion,
      if (lastCheckinAt != null) 'last_checkin_at': lastCheckinAt!.toUtc().toIso8601String(),
    },
  };
}

Uri _at(Uri base, String path) => base.replace(path: '${base.path.replaceAll(RegExp(r'/+$'), '')}$path');

Never _fail(http.Response r, String what) {
  String code = 'http_${r.statusCode}', detail = '$what failed (HTTP ${r.statusCode}).';
  try {
    final j = jsonDecode(r.body);
    if (j is Map) {
      code = (j['code'] ?? j['error'] ?? code).toString();
      detail = (j['detail'] ?? j['message'] ?? j['title'] ?? detail).toString();
    }
  } catch (_) {}
  throw SelfhostException(code, detail);
}

Future<T> _with<T>(http.Client? client, Future<T> Function(http.Client) f) async {
  final c = client ?? http.Client();
  try {
    return await f(c);
  } finally {
    if (client == null) c.close();
  }
}

/// Reads a server's license state (§11.6).
Future<SelfhostStatus> status(Uri server, {http.Client? client}) => _with(client, (c) async {
  final r = await c.get(_at(server, '/v1/selfhost/status'), headers: {'accept': 'application/json'});
  if (r.statusCode != 200) _fail(r, 'Reading the server status');
  return SelfhostStatus.fromJson(jsonDecode(r.body) as Map<String, dynamic>);
});

/// A license key with its expiry, as Casama Cloud returns it (§11.5).
class IssuedLicense {
  const IssuedLicense(this.license, this.expiresAt);
  final String license;
  final DateTime? expiresAt;
}

/// Asks Casama Cloud for the signed-in person's free personal license for [instanceId]
/// (`POST /v1/selfhost/licenses/personal`). [accessToken] is the person's Casama Cloud session.
/// A new instance id moves their one personal license here.
Future<IssuedLicense> requestPersonalLicense({
  required String accessToken,
  required String instanceId,
  required String engineVersion,
  Uri? licenseServer,
  http.Client? client,
}) => _with(client, (c) async {
  final r = await c.post(
    _at(licenseServer ?? defaultLicenseServer, '/v1/selfhost/licenses/personal'),
    headers: {'authorization': 'Bearer $accessToken', 'content-type': 'application/json', 'accept': 'application/json'},
    body: jsonEncode({'instance_id': instanceId, 'engine_version': engineVersion}),
  );
  if (r.statusCode != 200) _fail(r, 'Getting the personal license');
  final j = jsonDecode(r.body) as Map<String, dynamic>;
  return IssuedLicense(j['license'] as String, j['expires_at'] is String ? DateTime.tryParse(j['expires_at'] as String) : null);
});

/// Lets [email] past Casama Cloud's invite-only sign-up so its owner can make the account that a
/// personal license needs (`POST /v1/selfhost/licenses/admit`). Harmless for an address that could
/// already sign up; call it before the Cloud sign-in or sign-up.
Future<void> admitForSelfhost(String email, {Uri? licenseServer, http.Client? client}) => _with(client, (c) async {
  final r = await c.post(
    _at(licenseServer ?? defaultLicenseServer, '/v1/selfhost/licenses/admit'),
    headers: {'content-type': 'application/json', 'accept': 'application/json'},
    body: jsonEncode({'email': email}),
  );
  if (r.statusCode < 200 || r.statusCode >= 300) _fail(r, 'Letting your email address in');
});

/// Gives a server its license (`PUT /v1/selfhost/license`). A server without one takes it from
/// anyone; after that [accessToken] must be an instance admin's session on that server.
Future<void> putLicense(Uri server, String license, {String? accessToken, http.Client? client}) => _with(client, (c) async {
  final r = await c.put(
    _at(server, '/v1/selfhost/license'),
    headers: {'content-type': 'application/json', 'accept': 'application/json', if (accessToken != null) 'authorization': 'Bearer $accessToken'},
    body: jsonEncode({'license': license}),
  );
  if (r.statusCode < 200 || r.statusCode >= 300) _fail(r, 'Setting the license');
});
