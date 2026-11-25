/// Owner alerts and live activity (D-527): what GET /v1/owner/activity and /v1/owner/alerts answer.
/// Read from JSON by hand so a newer server's kinds and fields never break an older app.
library;

/// One thing that happened: a waitlist join, a new account, a download click...
class LiveEvent {
  const LiveEvent({
    required this.id,
    required this.kind,
    required this.title,
    required this.body,
    required this.createdAt,
    this.label,
    this.detail = const {},
    this.journeyId,
    this.journey,
  });

  final int id;
  final String kind;

  /// The push's words for it, written by the server.
  final String title;
  final String body;

  /// The person's email address (D-531), when the event is about someone.
  final String? label;
  final Map<String, Object?> detail;
  final DateTime createdAt;

  /// The journey this event belongs to (D-537): one person's or device's path from click to paying.
  final String? journeyId;
  final LiveJourney? journey;

  /// A text fact from [detail], when it's a non-empty string.
  String? fact(String key) {
    final v = detail[key];
    return v is String && v.trim().isNotEmpty ? v.trim() : null;
  }

  factory LiveEvent.fromJson(Map<String, dynamic> j) => LiveEvent(
    id: (j['id'] as num).toInt(),
    kind: j['kind'] as String? ?? '',
    title: j['title'] as String? ?? '',
    body: j['body'] as String? ?? '',
    label: j['label'] as String?,
    detail: (j['detail'] as Map?)?.cast<String, Object?>() ?? const {},
    createdAt: DateTime.tryParse(j['created_at'] as String? ?? '')?.toLocal() ?? DateTime.now(),
    journeyId: j['journey_id'] as String?,
    journey: j['journey'] is Map ? LiveJourney.fromJson((j['journey'] as Map).cast<String, dynamic>()) : null,
  );
}

DateTime? _time(Object? v) => v is String ? DateTime.tryParse(v)?.toLocal() : null;
String? _text(Object? v) => v is String && v.trim().isNotEmpty ? v.trim() : null;

/// How far one person got: a click on casama.ai, the app opened, an account, a chat, paying.
class LiveJourneySteps {
  const LiveJourneySteps({this.click = false, this.open = false, this.signup = false, this.chat = false, this.paying = false});
  final bool click;
  final bool open;
  final bool signup;
  final bool chat;
  final bool paying;

  List<bool> get all => [click, open, signup, chat, paying];

  factory LiveJourneySteps.fromJson(Map<String, dynamic> j) => LiveJourneySteps(
    click: j['click'] == true,
    open: j['open'] == true,
    signup: j['signup'] == true,
    chat: j['chat'] == true,
    paying: j['paying'] == true,
  );
}

/// One person's or device's path from a website click to paying (D-537). [likely]: the click was
/// matched to the first open by platform, country and time, not by an id.
class LiveJourney {
  const LiveJourney({
    required this.id,
    this.likely = false,
    this.clickPlatform,
    this.platform,
    this.distribution,
    this.appVersion,
    this.country,
    this.source,
    this.medium,
    this.campaign,
    this.landing,
    this.page,
    this.firstClickAt,
    this.firstOpenAt,
    this.signinStartedAt,
    this.signupAt,
    this.steps = const LiveJourneySteps(),
  });

  final String id;
  final bool likely;
  final String? clickPlatform;
  final String? platform;
  final String? distribution;
  final String? appVersion;
  final String? country;
  final String? source;
  final String? medium;
  final String? campaign;
  final String? landing;
  final String? page;
  final DateTime? firstClickAt;
  final DateTime? firstOpenAt;
  final DateTime? signinStartedAt;
  final DateTime? signupAt;
  final LiveJourneySteps steps;

  /// Where they came from when it's somewhere other than casama.ai itself.
  String? get from {
    final s = source?.toLowerCase();
    if (s == null || s == 'casama.ai' || s == 'direct' || s == 'app.casama.ai') return null;
    final m = medium?.toLowerCase();
    return m != null && !const {'referral', 'website', 'organic'}.contains(m) ? '$s · $m' : s;
  }

  factory LiveJourney.fromJson(Map<String, dynamic> j) => LiveJourney(
    id: j['id'] as String? ?? '',
    likely: j['likely'] == true,
    clickPlatform: _text(j['click_platform']),
    platform: _text(j['platform']),
    distribution: _text(j['distribution']),
    appVersion: _text(j['app_version']),
    country: _text(j['country']),
    source: _text(j['source']),
    medium: _text(j['medium']),
    campaign: _text(j['campaign']),
    landing: _text(j['landing']),
    page: _text(j['page']),
    firstClickAt: _time(j['first_click_at']),
    firstOpenAt: _time(j['first_open_at']),
    signinStartedAt: _time(j['signin_started_at']),
    signupAt: _time(j['signup_at']),
    steps: j['steps'] is Map ? LiveJourneySteps.fromJson((j['steps'] as Map).cast<String, dynamic>()) : const LiveJourneySteps(),
  );
}

/// What the owner knows about the person behind a journey now.
class LiveJourneyPerson {
  const LiveJourneyPerson({
    this.email,
    this.name,
    this.createdAt,
    this.plan,
    this.planStatus,
    this.messages = 0,
    this.bots = 0,
    this.devices = const [],
    this.lastActiveAt,
  });
  final String? email;
  final String? name;
  final DateTime? createdAt;
  final String? plan;
  final String? planStatus;
  final int messages;
  final int bots;
  final List<String> devices;
  final DateTime? lastActiveAt;

  factory LiveJourneyPerson.fromJson(Map<String, dynamic> j) => LiveJourneyPerson(
    email: _text(j['email']),
    name: _text(j['name']),
    createdAt: _time(j['created_at']),
    plan: _text(j['plan']),
    planStatus: _text(j['plan_status']),
    messages: (j['messages'] as num?)?.toInt() ?? 0,
    bots: (j['bots'] as num?)?.toInt() ?? 0,
    devices: [for (final d in (j['devices'] as List? ?? const [])) '$d'],
    lastActiveAt: _time(j['last_active_at']),
  );
}

class LiveJourneyDetail {
  const LiveJourneyDetail({required this.journey, required this.events, this.person});
  final LiveJourney journey;

  /// Oldest first.
  final List<LiveEvent> events;
  final LiveJourneyPerson? person;

  factory LiveJourneyDetail.fromJson(Map<String, dynamic> j) => LiveJourneyDetail(
    journey: LiveJourney.fromJson((j['journey'] as Map).cast<String, dynamic>()),
    events: [for (final e in (j['events'] as List? ?? const [])) LiveEvent.fromJson((e as Map).cast<String, dynamic>())],
    person: j['person'] is Map ? LiveJourneyPerson.fromJson((j['person'] as Map).cast<String, dynamic>()) : null,
  );
}

class LiveActivity {
  const LiveActivity({required this.items, required this.today});
  final List<LiveEvent> items;

  /// Events of each kind since midnight in the owner's time zone.
  final Map<String, int> today;

  factory LiveActivity.fromJson(Map<String, dynamic> j) => LiveActivity(
    items: [for (final e in (j['items'] as List? ?? const [])) LiveEvent.fromJson((e as Map).cast<String, dynamic>())],
    today: {for (final e in ((j['today'] as Map?) ?? const {}).entries) '${e.key}': (e.value as num).toInt()},
  );
}

class LiveAlertKind {
  const LiveAlertKind({required this.kind, required this.on, required this.defaultOn});
  final String kind;
  final bool on;
  final bool defaultOn;

  factory LiveAlertKind.fromJson(Map<String, dynamic> j) =>
      LiveAlertKind(kind: j['kind'] as String? ?? '', on: j['on'] == true, defaultOn: j['default_on'] == true);
}

class LiveAlertSettings {
  const LiveAlertSettings({required this.paused, required this.kinds});
  final bool paused;
  final List<LiveAlertKind> kinds;

  bool isOn(String kind) => kinds.any((k) => k.kind == kind && k.on);

  LiveAlertSettings copyWith({bool? paused, Map<String, bool>? kinds}) => LiveAlertSettings(
    paused: paused ?? this.paused,
    kinds: [
      for (final k in this.kinds) LiveAlertKind(kind: k.kind, on: kinds?[k.kind] ?? k.on, defaultOn: k.defaultOn),
    ],
  );

  factory LiveAlertSettings.fromJson(Map<String, dynamic> j) => LiveAlertSettings(
    paused: j['paused'] == true,
    kinds: [for (final k in (j['kinds'] as List? ?? const [])) LiveAlertKind.fromJson((k as Map).cast<String, dynamic>())],
  );
}
