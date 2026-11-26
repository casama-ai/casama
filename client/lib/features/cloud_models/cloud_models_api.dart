import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';

/// The virtual credential bots point at to use Casama Cloud's models from a self-hosted server
/// (`CASAMA_CLOUD_CREDENTIAL_ID`, packages/domain/src/selfhost-cloud.ts). Never a row in the key
/// list. Not the same as Casama Cloud's own shared key (`casamaCloudCredentialId`, …c1).
const casamaCloudModelsCredentialId = '00000000-0000-4000-8000-0000000000c2';

/// The one-time allowance to try Casama Cloud models (decision 4, `CLOUD_TRIAL_USD`).
const cloudTrialUsd = 0.5;

double _num(Object? v, [double fallback = 0]) =>
    v is num ? v.toDouble() : fallback;
double? _numOrNull(Object? v) => v is num ? v.toDouble() : null;
DateTime? _date(Object? v) => v is String ? DateTime.tryParse(v) : null;
Map<String, dynamic> _map(Object? v) =>
    v is Map ? Map<String, dynamic>.from(v) : const {};

/// Who pays: a Casama Cloud workspace.
class CloudPayer {
  const CloudPayer({required this.orgId, required this.name});
  factory CloudPayer.fromJson(Map<String, dynamic> j) =>
      CloudPayer(orgId: '${j['org_id'] ?? ''}', name: '${j['name'] ?? ''}');
  final String orgId;
  final String name;
}

/// Cloud's `GET /link/v1/status` for the server (§13.1), as the server passes it on.
class CloudStatus {
  const CloudStatus({
    this.scopes = const [],
    this.payer,
    this.planCode = 'free',
    this.planName = '',
    this.paid = false,
    this.planEnded = false,
    this.modelsAllowed = false,
    this.creditsUsd = 0,
    this.includedUsed,
    this.includedLimit,
    this.todaySpend = 0,
    this.todayCap,
    this.resetsAt,
    this.seatsPlan,
    this.seatsUsed,
    this.trialRemaining = 0,
    this.jobs = const {},
  });

  factory CloudStatus.fromJson(Map<String, dynamic> j) {
    final plan = _map(j['plan']);
    final included = j['included'] is Map ? _map(j['included']) : null;
    final today = _map(j['today']);
    final seats = _map(j['seats']);
    return CloudStatus(
      scopes: [for (final s in (j['scopes'] as List? ?? const [])) '$s'],
      payer: j['payer'] is Map ? CloudPayer.fromJson(_map(j['payer'])) : null,
      planCode: '${plan['code'] ?? 'free'}',
      planName: '${plan['name'] ?? ''}',
      paid: plan['paid'] == true,
      planEnded: plan['ended'] == true,
      modelsAllowed: j['models_allowed'] == true,
      creditsUsd: _num(j['credits_usd']),
      includedUsed: included == null ? null : _num(included['used_usd']),
      includedLimit: included == null
          ? null
          : _numOrNull(included['limit_usd']),
      todaySpend: _num(today['spend_usd']),
      todayCap: _numOrNull(today['cap_usd']),
      resetsAt: _date(today['resets_at']),
      seatsPlan: (seats['plan'] as num?)?.toInt(),
      seatsUsed: (seats['used'] as num?)?.toInt(),
      trialRemaining: _num(_map(j['trial'])['remaining_usd']),
      jobs: {
        for (final e in _map(j['jobs']).entries)
          if (e.value is String) e.key: e.value as String,
      },
    );
  }

  final List<String> scopes;
  final CloudPayer? payer;
  final String planCode;
  final String planName;
  final bool paid;

  /// The plan ran out (cancelled, or a store renewal failed) rather than never existing. Optional
  /// in the contract: absent means "no plan".
  final bool planEnded;
  final bool modelsAllowed;
  final double creditsUsd;
  final double? includedUsed;
  final double? includedLimit;
  final double todaySpend;
  final double? todayCap;
  final DateTime? resetsAt;
  final int? seatsPlan;
  final int? seatsUsed;
  final double trialRemaining;

  /// The model behind each job now (`chat`, `background`, `embedding`, `image`, `tts`, `stt`).
  final Map<String, String> jobs;

  /// Running on the free usage to try (no paid plan, no credits).
  bool get onTrial => !paid && creditsUsd <= 0 && trialRemaining > 0;

  /// Share of the month's included usage spent (0..1), or null with no allowance.
  double? get includedShare {
    final limit = includedLimit;
    if (limit == null || limit <= 0) return null;
    return ((includedUsed ?? 0) / limit).clamp(0, 1).toDouble();
  }

  /// Share of today's cap spent (0..1), or null with no cap.
  double? get todayShare {
    final cap = todayCap;
    if (cap == null || cap <= 0) return null;
    return (todaySpend / cap).clamp(0, 1).toDouble();
  }
}

/// Who may use Casama Cloud on this server, and how much a day each (§4.3).
class CloudPolicy {
  const CloudPolicy({this.allowed, this.dailyUsdPerMember});
  factory CloudPolicy.fromJson(Map<String, dynamic> j) {
    final a = j['allowed'];
    return CloudPolicy(
      allowed: a is List ? [for (final id in a) '$id'] : null,
      dailyUsdPerMember: _numOrNull(j['daily_usd_per_member']),
    );
  }

  /// Null = everyone; otherwise the user ids allowed.
  final List<String>? allowed;
  final double? dailyUsdPerMember;
  bool get everyone => allowed == null;

  Map<String, Object?> toJson() => {
    'allowed': allowed ?? 'all',
    'daily_usd_per_member': dailyUsdPerMember,
  };
}

/// Fallback both ways (decision 7). Never silent: every fallback answer says which key answered.
class CloudFallback {
  const CloudFallback({this.toOwn = false, this.fromOwn = false});
  factory CloudFallback.fromJson(Map<String, dynamic> j) =>
      CloudFallback(toOwn: j['to_own'] == true, fromOwn: j['from_own'] == true);
  final bool toOwn;
  final bool fromOwn;
  Map<String, Object?> toJson() => {'to_own': toOwn, 'from_own': fromOwn};
}

/// The signed-in person on this server: may they use Cloud, and how much today.
class CloudMe {
  const CloudMe({this.allowed = true, this.todayUsd = 0, this.limitUsd});
  factory CloudMe.fromJson(Map<String, dynamic> j) => CloudMe(
    allowed: j['allowed'] != false,
    todayUsd: _num(j['today_usd']),
    limitUsd: _numOrNull(j['limit_usd']),
  );
  final bool allowed;
  final double todayUsd;
  final double? limitUsd;
}

/// Memory being re-indexed after the embedding model changed (§7.2): search uses word search for
/// what isn't done yet, and the app says "Memory is catching up".
class MemoryReindex {
  const MemoryReindex({required this.done, required this.total});
  factory MemoryReindex.fromJson(Map<String, dynamic> j) => MemoryReindex(
    done: (j['done'] as num?)?.toInt() ?? 0,
    total: (j['total'] as num?)?.toInt() ?? 0,
  );
  final int done;
  final int total;
  bool get running => total > 0 && done < total;
  double get share => total <= 0 ? 1 : (done / total).clamp(0, 1).toDouble();
}

/// `GET /v1/selfhost/cloud-models` (§13.3).
class CloudModelsState {
  const CloudModelsState({
    this.available = false,
    this.connected = false,
    this.canManage = false,
    this.payer,
    this.status,
    this.statusError,
    this.policy = const CloudPolicy(),
    this.fallback = const CloudFallback(),
    this.embedding = false,
    this.me = const CloudMe(),
    this.memoryReindex,
    this.hasOwnKey = false,
  });

  factory CloudModelsState.fromJson(Map<String, dynamic> j) {
    final err = j['status_error'];
    return CloudModelsState(
      available: j['available'] == true,
      connected: j['connected'] == true,
      canManage: j['can_manage'] == true,
      payer: j['payer'] is Map ? CloudPayer.fromJson(_map(j['payer'])) : null,
      status: j['status'] is Map
          ? CloudStatus.fromJson(_map(j['status']))
          : null,
      statusError: err is Map && err['code'] is String
          ? (code: err['code'] as String, message: '${err['message'] ?? ''}')
          : null,
      policy: CloudPolicy.fromJson(_map(j['policy'])),
      fallback: CloudFallback.fromJson(_map(j['fallback'])),
      embedding: j['embedding'] == true,
      me: CloudMe.fromJson(_map(j['me'])),
      memoryReindex: j['memory_reindex'] is Map
          ? MemoryReindex.fromJson(_map(j['memory_reindex']))
          : null,
      hasOwnKey: j['has_own_key'] == true,
    );
  }

  static const off = CloudModelsState();

  final bool available;
  final bool connected;
  final bool canManage;
  final CloudPayer? payer;
  final CloudStatus? status;

  /// Why [status] couldn't be read (`key_revoked`, `models_unavailable`, `upstream_unreachable`…).
  final ({String code, String message})? statusError;
  final CloudPolicy policy;
  final CloudFallback fallback;
  final bool embedding;
  final CloudMe me;
  final MemoryReindex? memoryReindex;

  /// The workspace has a working own chat key (optional; the preview says per bot).
  final bool hasOwnKey;

  CloudPayer? get payerOrStatus => payer ?? status?.payer;
}

/// A bot on the review screen: what it uses now and whether switching is a step down.
class PreviewBot {
  const PreviewBot({
    required this.id,
    required this.name,
    this.fromCredentialId,
    this.fromProvider,
    this.fromModel,
    this.fromLabel,
    this.fromWorking = false,
    this.suggested = false,
    this.stepDown = false,
  });

  factory PreviewBot.fromJson(Map<String, dynamic> j) {
    final from = _map(j['from']);
    return PreviewBot(
      id: '${j['id']}',
      name: '${j['name'] ?? ''}',
      fromCredentialId: from['credential_id'] as String?,
      fromProvider: from['provider'] as String?,
      fromModel: from['model'] as String?,
      fromLabel: from['label'] as String?,
      fromWorking: from['working'] == true,
      suggested: j['suggested'] == true,
      stepDown: j['step_down'] == true,
    );
  }

  final String id;
  final String name;
  final String? fromCredentialId;
  final String? fromProvider;
  final String? fromModel;
  final String? fromLabel;
  final bool fromWorking;
  final bool suggested;
  final bool stepDown;

  /// Already on Casama Cloud.
  bool get onCloud => fromCredentialId == casamaCloudModelsCredentialId;
}

/// `GET /v1/selfhost/cloud-models/preview` (§13.3).
class CloudPreview {
  const CloudPreview({
    this.bots = const [],
    this.ownEmbedding = false,
    this.ownImage = false,
    this.ownTts = false,
    this.ownStt = false,
  });
  factory CloudPreview.fromJson(Map<String, dynamic> j) {
    final jobs = _map(j['jobs']);
    bool own(String job) => _map(jobs[job])['has_own'] == true;
    return CloudPreview(
      bots: [
        for (final b in (j['bots'] as List? ?? const []))
          PreviewBot.fromJson(_map(b)),
      ],
      ownEmbedding: own('embedding'),
      ownImage: own('image'),
      ownTts: own('tts'),
      ownStt: own('stt'),
    );
  }
  final List<PreviewBot> bots;
  final bool ownEmbedding;
  final bool ownImage;
  final bool ownTts;
  final bool ownStt;

  /// Some bot has a working own key: then the fallback switch shows (§4.1 step 5).
  bool get hasOwnKey => bots.any((b) => b.fromWorking && !b.onCloud);
}

/// What `POST …/apply` takes.
class CloudApply {
  const CloudApply({
    required this.bots,
    this.workspaceDefault = false,
    this.embedding = false,
    this.fallback = const CloudFallback(),
    this.policy = const CloudPolicy(),
  });
  final List<String> bots;
  final bool workspaceDefault;
  final bool embedding;
  final CloudFallback fallback;
  final CloudPolicy policy;
  Map<String, Object?> toJson() => {
    'bots': bots,
    'workspace_default': workspaceDefault,
    'embedding': embedding,
    'fallback': fallback.toJson(),
    'policy': policy.toJson(),
  };
}

/// A bot after turning off: the key it went back to, or none ("needs a key").
class OffBot {
  const OffBot({required this.id, required this.name, this.toLabel});
  factory OffBot.fromJson(Map<String, dynamic> j) => OffBot(
    id: '${j['id']}',
    name: '${j['name'] ?? ''}',
    toLabel: j['to'] is Map ? '${_map(j['to'])['label'] ?? ''}' : null,
  );
  final String id;
  final String name;
  final String? toLabel;
}

/// The engine's Cloud models routes on the server the app is using (§13.3). Tests replace it.
abstract class CloudModelsApi {
  Future<CloudModelsState> state();
  Future<CloudModelsState> connect(String code);
  Future<CloudPreview> preview();
  Future<CloudModelsState> apply(CloudApply request);

  /// Changes who may use it, the daily limit per person, or the fallback, without touching bots.
  Future<CloudModelsState> update({
    CloudPolicy? policy,
    CloudFallback? fallback,
  });
  Future<List<OffBot>> off();
}

class HttpCloudModelsApi implements CloudModelsApi {
  HttpCloudModelsApi(this.dio, this.headers);
  final Dio dio;
  final Map<String, String> Function() headers;

  Options get _authed =>
      Options(headers: headers(), contentType: 'application/json');
  static const _base = '/v1/selfhost/cloud-models';

  CloudModelsState _state(Response<Map<String, dynamic>> r) =>
      CloudModelsState.fromJson(r.data ?? const {});

  @override
  Future<CloudModelsState> state() async =>
      _state(await dio.get<Map<String, dynamic>>(_base, options: _authed));

  @override
  Future<CloudModelsState> connect(String code) async => _state(
    await dio.post<Map<String, dynamic>>(
      '$_base/connect',
      data: {'code': code},
      options: _authed,
    ),
  );

  @override
  Future<CloudPreview> preview() async => CloudPreview.fromJson(
    (await dio.get<Map<String, dynamic>>(
          '$_base/preview',
          options: _authed,
        )).data ??
        const {},
  );

  @override
  Future<CloudModelsState> apply(CloudApply request) async => _state(
    await dio.post<Map<String, dynamic>>(
      '$_base/apply',
      data: request.toJson(),
      options: _authed,
    ),
  );

  @override
  Future<CloudModelsState> update({
    CloudPolicy? policy,
    CloudFallback? fallback,
  }) async => _state(
    await dio.patch<Map<String, dynamic>>(
      _base,
      data: {'policy': ?policy?.toJson(), 'fallback': ?fallback?.toJson()},
      options: _authed,
    ),
  );

  @override
  Future<List<OffBot>> off() async {
    final r = await dio.post<Map<String, dynamic>>(
      '$_base/off',
      options: _authed,
    );
    return [
      for (final b in (r.data?['bots'] as List? ?? const []))
        OffBot.fromJson(_map(b)),
    ];
  }
}

final cloudModelsApiProvider = Provider<CloudModelsApi>((ref) {
  final backend = ref.watch(backendProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: backend.apiUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  return HttpCloudModelsApi(dio, () => backend.authHeaders);
});
