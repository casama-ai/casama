import 'package:casama/core/selfhost_api.dart';
import 'package:dio/dio.dart';

/// The self-host license API as the app sees it (lib/core/selfhost_api.dart); tests set its
/// answers. By default the server is Casama Cloud (`licensing: false`).
class FakeSelfhostApi implements SelfhostApi {
  ServerLicenseStatus current = ServerLicenseStatus.off;
  final setKeys = <String>[];
  final personalCalls = <({String token, String instanceId, String engineVersion})>[];
  final created = <NewBusinessLicense>[];
  final revoked = <String>[];
  final queries = <({String? query, String? edition})>[];
  List<LicenseRecord> rows = [];
  SelfhostServerStats stats = const SelfhostServerStats();
  var statusCalls = 0;

  /// The error code the next [setLicense] fails with (an RFC 9457 problem), if any.
  String? setLicenseError;

  /// What [setLicense] turns the state into.
  ServerLicenseStatus Function(String key)? afterSet;

  @override
  Future<ServerLicenseStatus> status() async {
    statusCalls++;
    return current;
  }

  @override
  Future<ServerLicenseStatus> setLicense(String license) async {
    final err = setLicenseError;
    if (err != null) throw problem(400, err, 'That key was refused.');
    setKeys.add(license);
    current =
        afterSet?.call(license) ??
        ServerLicenseStatus(licensing: true, state: 'active', edition: 'personal', instanceId: current.instanceId, engineVersion: current.engineVersion);
    return current;
  }

  @override
  Future<IssuedLicenseKey> personalLicense({required String cloudToken, required String instanceId, required String engineVersion}) async {
    personalCalls.add((token: cloudToken, instanceId: instanceId, engineVersion: engineVersion));
    return IssuedLicenseKey('personal-key-for-$instanceId', DateTime.utc(2027, 1, 1));
  }

  final admitted = <String>[];

  /// The error code [admit] fails with, if any.
  String? admitError;

  @override
  Future<void> admit(String email) async {
    if (admitError != null) throw problem(400, admitError!, 'That email address can\'t be used.');
    admitted.add(email);
  }

  @override
  Future<List<LicenseRecord>> adminLicenses({String? query, String? edition}) async {
    queries.add((query: query, edition: edition));
    return [
      for (final r in rows)
        if ((edition == null || r.edition == edition) &&
            (query == null || query.isEmpty || '${r.email} ${r.customer}'.toLowerCase().contains(query.toLowerCase())))
          r,
    ];
  }

  @override
  Future<CreatedBusinessLicense> adminCreateLicense(NewBusinessLicense request) async {
    created.add(request);
    return CreatedBusinessLicense(id: 'new-${created.length}', license: 'eyJbusiness.key.${created.length}', expiresAt: request.expiresAt);
  }

  @override
  Future<LicenseRecord> adminRevoke(String id) async {
    revoked.add(id);
    final row = rows.firstWhere((r) => r.id == id);
    final out = LicenseRecord(id: row.id, edition: row.edition, email: row.email, customer: row.customer, revoked: true, revokedAt: DateTime.now());
    rows = [for (final r in rows) r.id == id ? out : r];
    return out;
  }

  @override
  Future<SelfhostServerStats> adminStats() async => stats;
}

/// A server error with Casama's problem body.
DioException problem(int status, String code, String detail) {
  final req = RequestOptions(path: '/');
  return DioException(
    requestOptions: req,
    response: Response(
      requestOptions: req,
      statusCode: status,
      data: {'type': 'about:blank', 'title': detail, 'status': status, 'code': code, 'detail': detail},
    ),
    type: DioExceptionType.badResponse,
  );
}
