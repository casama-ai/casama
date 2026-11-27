import 'package:casama_sdk/casama_sdk.dart' show AcceptLanguageInterceptor;
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/selfhost_api.dart' show casamaCloudApi;

/// Moving a workspace between servers (docs/SELFHOST-CLOUD-MODELS-PLAN.md §4.4, §4.5, §13.4),
/// hand-written here so the feature stays in one folder behind its build switch.
///
/// Two servers take part. The one receiving (the target: Casama Cloud, or someone's own server)
/// hands out a one-time move code for one of its workspaces; the one the workspace is on now (the
/// source) checks the code, copies the workspace there and makes its own copy read-only.
abstract class MoveApi {
  /// `POST /v1/moves` on the server the app is using: a code to bring a workspace into [orgId].
  Future<MoveCode> receiveHere(String orgId);

  /// `POST /v1/moves` on Casama Cloud with the person's Cloud session.
  Future<MoveCode> receiveOnCloud({
    required String cloudToken,
    required String orgId,
  });

  /// The person's workspaces on Casama Cloud (where they're an owner or admin).
  Future<List<CloudWorkspace>> cloudWorkspaces(String cloudToken);

  /// A new, empty workspace on Casama Cloud to move into.
  Future<CloudWorkspace> newCloudWorkspace({
    required String cloudToken,
    required String name,
  });

  /// `POST /v1/orgs/{id}/move/check`: what would move, whether it fits, how long it takes.
  Future<MoveCheck> check({
    required String orgId,
    required String targetUrl,
    required String code,
  });

  /// `POST /v1/orgs/{id}/move/start`. With the same code after a failure it resumes.
  Future<MoveProgress> start({
    required String orgId,
    required String targetUrl,
    required String code,
    required bool bringKeys,
  });

  /// `GET /v1/orgs/{id}/move`: the latest move of this workspace, null when it never moved.
  Future<MoveProgress?> progress(String orgId);
}

/// A one-time move code from the receiving server.
class MoveCode {
  const MoveCode({
    required this.moveId,
    required this.code,
    required this.expiresAt,
    required this.serverUrl,
  });
  final String moveId;
  final String code;
  final DateTime expiresAt;

  /// The receiving server's address (what the moving side connects to).
  final String serverUrl;

  factory MoveCode.fromJson(Map<String, dynamic> j, String serverUrl) =>
      MoveCode(
        moveId: j['move_id'] as String,
        code: j['token'] as String,
        expiresAt:
            DateTime.tryParse(j['expires_at'] as String? ?? '') ??
            DateTime.now().add(const Duration(hours: 24)),
        serverUrl: serverUrl,
      );
}

class CloudWorkspace {
  const CloudWorkspace({required this.id, required this.name});
  final String id;
  final String name;
}

/// Where a workspace went (`organizations.moved_to`).
class MovedTo {
  const MovedTo({
    required this.url,
    required this.at,
    required this.cloud,
    required this.message,
  });
  final String url;
  final DateTime at;
  final bool cloud;
  final String message;

  static MovedTo? fromJson(Object? j) {
    if (j is! Map) return null;
    return MovedTo(
      url: j['url'] as String? ?? '',
      at: DateTime.tryParse(j['at'] as String? ?? '') ?? DateTime.now(),
      cloud: j['target'] == 'cloud',
      message: j['message'] as String? ?? '',
    );
  }
}

class MoveOver {
  const MoveOver(this.what, this.have, this.limit);
  final String what;
  final num have;
  final num limit;
}

class MoveCheck {
  const MoveCheck({
    required this.sizeBytes,
    required this.estimateSeconds,
    required this.pauseSeconds,
    required this.longPause,
    required this.counts,
    required this.fits,
    required this.over,
    required this.planName,
    required this.needsPlanName,
    required this.targetName,
    required this.targetEmpty,
    required this.updateFirst,
    required this.reconnect,
    required this.invites,
    required this.modelKeys,
    required this.chatAppKeys,
    required this.secretKeys,
    required this.computers,
    required this.chatgptPlans,
    required this.toCloud,
  });

  final int sizeBytes;
  final int estimateSeconds;
  final int pauseSeconds;
  final bool longPause;
  final Map<String, num> counts;
  final bool fits;
  final List<MoveOver> over;
  final String? planName;
  final String? needsPlanName;
  final String targetName;
  final bool targetEmpty;

  /// Null, "source" (this server needs updating) or "target".
  final String? updateFirst;
  final List<String> reconnect;
  final List<String> invites;
  final int modelKeys;
  final int chatAppKeys;
  final int secretKeys;
  final int computers;
  final int chatgptPlans;
  final bool toCloud;

  factory MoveCheck.fromJson(Map<String, dynamic> j) {
    final fit = (j['fit'] as Map?)?.cast<String, dynamic>() ?? const {};
    final after = (j['after'] as Map?)?.cast<String, dynamic>() ?? const {};
    final keys = (after['keys'] as Map?)?.cast<String, dynamic>() ?? const {};
    final target = (fit['target'] as Map?)?.cast<String, dynamic>() ?? const {};
    return MoveCheck(
      sizeBytes: (j['size_bytes'] as num? ?? 0).toInt(),
      estimateSeconds: (j['estimate_seconds'] as num? ?? 0).toInt(),
      pauseSeconds: (j['pause_seconds'] as num? ?? 0).toInt(),
      longPause: j['long_pause'] == true,
      counts: {
        for (final e in ((j['counts'] as Map?) ?? const {}).entries)
          '${e.key}': (e.value as num? ?? 0),
      },
      fits: fit['fits'] != false,
      over: [
        for (final o in (fit['over'] as List? ?? const []).whereType<Map>())
          MoveOver(
            '${o['what']}',
            o['have'] as num? ?? 0,
            o['limit'] as num? ?? 0,
          ),
      ],
      planName: (fit['plan'] as Map?)?['name'] as String?,
      needsPlanName: (fit['needs_plan'] as Map?)?['name'] as String?,
      targetName: target['name'] as String? ?? '',
      targetEmpty: target['empty'] == true,
      updateFirst: j['update_first'] as String?,
      reconnect: [
        for (final r
            in (after['reconnect'] as List? ?? const []).whereType<Map>())
          '${r['name']}',
      ],
      invites: [
        for (final r
            in (after['invites'] as List? ?? const []).whereType<Map>())
          '${r['email']}',
      ],
      modelKeys: (keys['models'] as num? ?? 0).toInt(),
      chatAppKeys: (keys['chat_apps'] as num? ?? 0).toInt(),
      secretKeys: (keys['secrets'] as num? ?? 0).toInt(),
      computers: (after['computers'] as num? ?? 0).toInt(),
      chatgptPlans: (after['chatgpt_plans'] as num? ?? 0).toInt(),
      toCloud: j['target'] == 'cloud',
    );
  }
}

enum MoveState {
  created,
  copying,
  pausing,
  finishing,
  importing,
  done,
  failed,
  cancelled,
}

class MoveProgress {
  const MoveProgress({
    required this.moveId,
    required this.state,
    required this.step,
    required this.doneBytes,
    required this.totalBytes,
    required this.remoteUrl,
    required this.report,
    required this.errorCode,
    required this.errorMessage,
    required this.movedTo,
  });

  final String moveId;
  final MoveState state;
  final String? step;
  final int doneBytes;
  final int totalBytes;
  final String? remoteUrl;
  final Map<String, dynamic> report;
  final String? errorCode;
  final String? errorMessage;
  final MovedTo? movedTo;

  bool get running => !const {
    MoveState.done,
    MoveState.failed,
    MoveState.cancelled,
  }.contains(state);
  double get fraction =>
      totalBytes <= 0 ? 0 : (doneBytes / totalBytes).clamp(0, 1).toDouble();

  factory MoveProgress.fromJson(Map<String, dynamic> j) {
    final p = (j['progress'] as Map?)?.cast<String, dynamic>() ?? const {};
    final e = (j['error'] as Map?)?.cast<String, dynamic>();
    return MoveProgress(
      moveId: j['move_id'] as String? ?? '',
      state: MoveState.values.firstWhere(
        (s) => s.name == j['state'],
        orElse: () => MoveState.created,
      ),
      step: j['step'] as String?,
      doneBytes: (p['done_bytes'] as num? ?? 0).toInt(),
      totalBytes: (p['total_bytes'] as num? ?? 0).toInt(),
      remoteUrl: j['remote_url'] as String?,
      report: (j['report'] as Map?)?.cast<String, dynamic>() ?? const {},
      errorCode: e?['code'] as String?,
      errorMessage: e?['message'] as String?,
      movedTo: MovedTo.fromJson(j['moved_to']),
    );
  }
}

class HttpMoveApi implements MoveApi {
  HttpMoveApi({
    required this.dio,
    required this.headers,
    required this.serverUrl,
    Dio? cloud,
  }) : cloud =
           cloud ??
           (Dio(
             BaseOptions(
               baseUrl: casamaCloudApi,
               connectTimeout: const Duration(seconds: 10),
               receiveTimeout: const Duration(seconds: 30),
             ),
           )..interceptors.add(const AcceptLanguageInterceptor()));

  final Dio dio;
  final Dio cloud;
  final String serverUrl;
  final Map<String, String> Function() headers;

  Options get _authed =>
      Options(headers: headers(), contentType: 'application/json');
  Options _cloudAuthed(String token) => Options(
    headers: {'Authorization': 'Bearer $token'},
    contentType: 'application/json',
  );

  @override
  Future<MoveCode> receiveHere(String orgId) async {
    final r = await dio.post<Map<String, dynamic>>(
      '/v1/moves',
      data: {'org_id': orgId},
      options: _authed,
    );
    return MoveCode.fromJson(r.data!, serverUrl);
  }

  @override
  Future<MoveCode> receiveOnCloud({
    required String cloudToken,
    required String orgId,
  }) async {
    final r = await cloud.post<Map<String, dynamic>>(
      '/v1/moves',
      data: {'org_id': orgId},
      options: _cloudAuthed(cloudToken),
    );
    return MoveCode.fromJson(r.data!, casamaCloudApi);
  }

  @override
  Future<List<CloudWorkspace>> cloudWorkspaces(String cloudToken) async {
    final r = await cloud.get<Map<String, dynamic>>(
      '/v1/orgs',
      options: _cloudAuthed(cloudToken),
    );
    return [
      for (final o in (r.data?['items'] as List? ?? const []).whereType<Map>())
        if (o['role'] == 'owner' || o['role'] == 'admin')
          CloudWorkspace(
            id: o['id'] as String,
            name: o['name'] as String? ?? '',
          ),
    ];
  }

  @override
  Future<CloudWorkspace> newCloudWorkspace({
    required String cloudToken,
    required String name,
  }) async {
    final r = await cloud.post<Map<String, dynamic>>(
      '/v1/orgs',
      data: {'name': name},
      options: _cloudAuthed(cloudToken),
    );
    return CloudWorkspace(
      id: r.data!['id'] as String,
      name: r.data!['name'] as String? ?? name,
    );
  }

  @override
  Future<MoveCheck> check({
    required String orgId,
    required String targetUrl,
    required String code,
  }) async {
    final r = await dio.post<Map<String, dynamic>>(
      '/v1/orgs/$orgId/move/check',
      data: {'target_url': targetUrl, 'token': code.trim()},
      options: _authed.copyWith(receiveTimeout: const Duration(seconds: 60)),
    );
    return MoveCheck.fromJson(r.data!);
  }

  @override
  Future<MoveProgress> start({
    required String orgId,
    required String targetUrl,
    required String code,
    required bool bringKeys,
  }) async {
    final r = await dio.post<Map<String, dynamic>>(
      '/v1/orgs/$orgId/move/start',
      data: {
        'target_url': targetUrl,
        'token': code.trim(),
        'bring_keys': bringKeys,
      },
      options: _authed.copyWith(receiveTimeout: const Duration(seconds: 60)),
    );
    return MoveProgress.fromJson(r.data!);
  }

  @override
  Future<MoveProgress?> progress(String orgId) async {
    try {
      final r = await dio.get<Map<String, dynamic>>(
        '/v1/orgs/$orgId/move',
        options: _authed,
      );
      return MoveProgress.fromJson(r.data!);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }
}

final moveApiProvider = Provider<MoveApi>((ref) {
  final backend = ref.watch(backendProvider);
  return HttpMoveApi(
    dio: Dio(
      BaseOptions(
        baseUrl: backend.apiUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      ),
    )..interceptors.add(const AcceptLanguageInterceptor()),
    headers: () => backend.authHeaders,
    serverUrl: backend.apiUrl,
  );
});

/// The selected workspace's latest move, for the "This workspace moved" screen and resuming.
final workspaceMoveProvider = FutureProvider.family<MoveProgress?, String>((
  ref,
  orgId,
) async {
  try {
    return await ref.watch(moveApiProvider).progress(orgId);
  } catch (_) {
    return null;
  }
});
