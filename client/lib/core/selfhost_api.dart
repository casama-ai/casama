import 'package:casama_sdk/casama_sdk.dart' show AcceptLanguageInterceptor;
import 'package:dio/dio.dart';

/// Self-hosted licenses (docs/SELF-HOSTING-PLAN.md §11.5, §11.6), hand-written in this one place
/// until the generated client has these routes. Web-safe: no `dart:io`, no installer.
///
/// Three kinds of calls:
/// - the engine's own license state on the server the app is using ([status], [setLicense]);
/// - Casama Cloud's free personal key, with the person's Cloud session ([personalLicense]);
/// - the admin console on Casama Cloud ([adminLicenses], [adminCreateLicense], [adminRevoke],
///   [adminStats]).
abstract class SelfhostApi {
  /// `GET /v1/selfhost/status` on the server the app is using. On Casama Cloud it answers
  /// `licensing: false` and nothing else.
  Future<ServerLicenseStatus> status();

  /// `PUT /v1/selfhost/license`: gives the server a key. Before it has one anyone may set it;
  /// after that only its instance owner (the app sends the current sign-in).
  Future<ServerLicenseStatus> setLicense(String license);

  /// `POST /v1/selfhost/licenses/personal` on Casama Cloud with the person's Cloud session.
  Future<IssuedLicenseKey> personalLicense({required String cloudToken, required String instanceId, required String engineVersion});

  /// `POST /v1/selfhost/licenses/admit` on Casama Cloud (no sign-in, rate limited): lets [email]
  /// past Cloud's invite-only sign-up, so a new person can make the account the personal license
  /// comes from. Fails with 400 `bad_email` or `disposable_email`.
  Future<void> admit(String email);

  Future<List<LicenseRecord>> adminLicenses({String? query, String? edition});
  Future<CreatedBusinessLicense> adminCreateLicense(NewBusinessLicense request);
  Future<LicenseRecord> adminRevoke(String id);
  Future<SelfhostServerStats> adminStats();
}

/// Casama Cloud's address, where personal keys come from.
const casamaCloudApi = 'https://api.casama.ai';

/// Whether [apiUrl] is Casama Cloud (licensing is never on there, so the app doesn't ask).
bool isCasamaCloud(String apiUrl) => Uri.tryParse(apiUrl)?.host == Uri.parse(casamaCloudApi).host;

class HttpSelfhostApi implements SelfhostApi {
  /// [dio] talks to the server the app is using (its base URL set); [headers] is the current
  /// sign-in there. [cloud] talks to Casama Cloud for personal keys.
  HttpSelfhostApi({required this.dio, required this.headers, Dio? cloud})
    : cloud = cloud ?? (Dio(BaseOptions(baseUrl: casamaCloudApi, connectTimeout: const Duration(seconds: 10), receiveTimeout: const Duration(seconds: 30)))..interceptors.add(const AcceptLanguageInterceptor()));

  final Dio dio;
  final Dio cloud;
  final Map<String, String> Function() headers;

  Options get _authed => Options(headers: headers(), contentType: 'application/json');

  @override
  Future<ServerLicenseStatus> status() async {
    final r = await dio.get<Map<String, dynamic>>('/v1/selfhost/status', options: Options(receiveTimeout: const Duration(seconds: 10)));
    return ServerLicenseStatus.fromJson(r.data ?? const {});
  }

  @override
  Future<ServerLicenseStatus> setLicense(String license) async {
    final r = await dio.put<Map<String, dynamic>>('/v1/selfhost/license', data: {'license': license.trim()}, options: _authed);
    return ServerLicenseStatus.fromJson(r.data ?? const {});
  }

  @override
  Future<IssuedLicenseKey> personalLicense({required String cloudToken, required String instanceId, required String engineVersion}) async {
    final r = await cloud.post<Map<String, dynamic>>(
      '/v1/selfhost/licenses/personal',
      data: {'instance_id': instanceId, 'engine_version': engineVersion},
      options: Options(headers: {'Authorization': 'Bearer $cloudToken'}, contentType: 'application/json'),
    );
    return IssuedLicenseKey.fromJson(r.data!);
  }

  @override
  Future<void> admit(String email) async {
    await cloud.post<Object?>(
      '/v1/selfhost/licenses/admit',
      data: {'email': email.trim()},
      options: Options(contentType: 'application/json'),
    );
  }

  @override
  Future<List<LicenseRecord>> adminLicenses({String? query, String? edition}) async {
    final q = query?.trim();
    final r = await dio.get<Map<String, dynamic>>(
      '/v1/admin/selfhost/licenses',
      queryParameters: {if (q != null && q.isNotEmpty) 'q': q, 'edition': ?edition, 'limit': 500},
      options: _authed,
    );
    return [for (final row in (r.data?['items'] as List? ?? const [])) LicenseRecord.fromJson(row as Map<String, dynamic>)];
  }

  @override
  Future<CreatedBusinessLicense> adminCreateLicense(NewBusinessLicense request) async {
    final r = await dio.post<Map<String, dynamic>>('/v1/admin/selfhost/licenses', data: request.toJson(), options: _authed);
    return CreatedBusinessLicense.fromJson(r.data!);
  }

  @override
  Future<LicenseRecord> adminRevoke(String id) async {
    final r = await dio.post<Map<String, dynamic>>('/v1/admin/selfhost/licenses/$id/revoke', options: _authed);
    return LicenseRecord.fromJson(r.data!);
  }

  @override
  Future<SelfhostServerStats> adminStats() async {
    final r = await dio.get<Map<String, dynamic>>('/v1/admin/selfhost/stats', options: _authed);
    return SelfhostServerStats.fromJson(r.data ?? const {});
  }
}

DateTime? _date(Object? v) => v is String ? DateTime.tryParse(v) : null;
int? _int(Object? v) => v is num ? v.toInt() : null;

/// The engine's license state (§11.6).
class ServerLicenseStatus {
  const ServerLicenseStatus({
    required this.licensing,
    this.state,
    this.edition,
    this.instanceId,
    this.expiresAt,
    this.graceUntil,
    this.members,
    this.seats,
    this.engineVersion,
  });

  factory ServerLicenseStatus.fromJson(Map<String, dynamic> j) => ServerLicenseStatus(
    licensing: j['licensing'] == true,
    state: j['state'] as String?,
    edition: j['edition'] as String?,
    instanceId: j['instance_id'] as String?,
    expiresAt: _date(j['expires_at']),
    graceUntil: _date(j['grace_until']),
    members: _int(j['members']),
    seats: _int(j['seats']),
    engineVersion: j['engine_version'] as String?,
  );

  static const off = ServerLicenseStatus(licensing: false);

  final bool licensing;

  /// `setup` | `active` | `grace` | `expired`.
  final String? state;

  /// `personal` | `trial` | `business`.
  final String? edition;
  final String? instanceId;
  final DateTime? expiresAt;
  final DateTime? graceUntil;
  final int? members;
  final int? seats;
  final String? engineVersion;

  bool get needsLicense => licensing && state == 'setup';
  bool get inGrace => licensing && state == 'grace';
  bool get expired => licensing && state == 'expired';
}

class IssuedLicenseKey {
  const IssuedLicenseKey(this.license, this.expiresAt);
  factory IssuedLicenseKey.fromJson(Map<String, dynamic> j) => IssuedLicenseKey(j['license'] as String, _date(j['expires_at']));
  final String license;
  final DateTime? expiresAt;
}

/// The features a business key can turn on (`LicenseFeature`).
const businessLicenseFeatures = ['sso', 'audit_export', 'audit_forwarding', 'advanced_roles'];

class NewBusinessLicense {
  const NewBusinessLicense({
    required this.customer,
    required this.email,
    required this.seats,
    required this.expiresAt,
    this.features = const [],
    this.offline = false,
  });
  final String customer;
  final String email;
  final int seats;
  final DateTime expiresAt;
  final List<String> features;
  final bool offline;

  Map<String, Object?> toJson() => {
    'customer': customer,
    'email': email,
    'seats': seats,
    'expires_at': expiresAt.toUtc().toIso8601String(),
    'features': features,
    'offline': offline,
  };
}

class CreatedBusinessLicense {
  const CreatedBusinessLicense({required this.id, required this.license, this.expiresAt});
  factory CreatedBusinessLicense.fromJson(Map<String, dynamic> j) =>
      CreatedBusinessLicense(id: j['id'] as String, license: j['license'] as String, expiresAt: _date(j['expires_at']));
  final String id;

  /// The key itself: shown once.
  final String license;
  final DateTime? expiresAt;
}

/// One license Casama Cloud issued (`LicenseRecord`); the key itself is never listed.
class LicenseRecord {
  const LicenseRecord({
    required this.id,
    required this.edition,
    this.accountId,
    this.customer,
    this.email,
    this.instanceId,
    this.seats = 1,
    this.features = const [],
    this.offline = false,
    this.issuedAt,
    this.expiresAt,
    this.engineVersion,
    this.lastCheckinAt,
    this.members,
    this.bots,
    this.revoked = false,
    this.revokedAt,
  });

  factory LicenseRecord.fromJson(Map<String, dynamic> j) => LicenseRecord(
    id: j['id'] as String,
    edition: j['edition'] as String? ?? 'personal',
    accountId: j['account_id'] as String?,
    customer: j['customer'] as String?,
    email: j['email'] as String?,
    instanceId: j['instance_id'] as String?,
    seats: _int(j['seats']) ?? 1,
    features: [for (final f in (j['features'] as List? ?? const [])) '$f'],
    offline: j['offline'] == true,
    issuedAt: _date(j['issued_at']),
    expiresAt: _date(j['expires_at']),
    engineVersion: j['engine_version'] as String?,
    lastCheckinAt: _date(j['last_checkin_at']),
    members: _int(j['members']),
    bots: _int(j['bots']),
    revoked: j['revoked'] == true,
    revokedAt: _date(j['revoked_at']),
  );

  final String id;
  final String edition;
  final String? accountId;
  final String? customer;
  final String? email;
  final String? instanceId;
  final int seats;
  final List<String> features;
  final bool offline;
  final DateTime? issuedAt;
  final DateTime? expiresAt;
  final String? engineVersion;
  final DateTime? lastCheckinAt;
  final int? members;
  final int? bots;
  final bool revoked;
  final DateTime? revokedAt;
}

class LicenseDayCount {
  const LicenseDayCount(this.day, this.count);
  final String day;
  final int count;
}

class LicenseEditionCount {
  const LicenseEditionCount(this.edition, {required this.active, required this.total});
  final String edition;
  final int active;
  final int total;
}

/// Admin Growth's "Self-host" section (`SelfhostServerStats`).
class SelfhostServerStats {
  const SelfhostServerStats({
    this.dailyActive = const [],
    this.newInstalls = const [],
    this.active24h = 0,
    this.byEdition = const [],
    this.byEngineVersion = const [],
    this.lapsed = 0,
    this.members = 0,
    this.bots = 0,
  });

  factory SelfhostServerStats.fromJson(Map<String, dynamic> j) {
    List<LicenseDayCount> days(String k) => [
      for (final d in (j[k] as List? ?? const []))
        if (d is Map) LicenseDayCount('${d['day']}', _int(d['count']) ?? 0),
    ];
    return SelfhostServerStats(
      dailyActive: days('daily_active'),
      newInstalls: days('new_installs'),
      active24h: _int(j['active_24h']) ?? 0,
      byEdition: [
        for (final e in (j['by_edition'] as List? ?? const []))
          if (e is Map) LicenseEditionCount('${e['edition']}', active: _int(e['active']) ?? 0, total: _int(e['total']) ?? 0),
      ],
      byEngineVersion: [
        for (final v in (j['by_engine_version'] as List? ?? const []))
          if (v is Map) (version: '${v['engine_version']}', servers: _int(v['servers']) ?? 0),
      ],
      lapsed: _int(j['lapsed']) ?? 0,
      members: _int(j['members']) ?? 0,
      bots: _int(j['bots']) ?? 0,
    );
  }

  /// Servers that checked in each UTC day, the last 30 days, oldest first.
  final List<LicenseDayCount> dailyActive;

  /// New licenses each UTC day, the last 30 days, oldest first.
  final List<LicenseDayCount> newInstalls;
  final int active24h;
  final List<LicenseEditionCount> byEdition;
  final List<({String version, int servers})> byEngineVersion;

  /// Licenses not revoked whose server hasn't checked in for more than 7 days.
  final int lapsed;
  final int members;
  final int bots;

  int get newInstallsTotal => newInstalls.fold(0, (a, d) => a + d.count);
}
