/// The ad labels a web visit arrived with (docs/ADS-ATTRIBUTION-PLAN.md §6.3, §6.10), read once from
/// the web app's first address and kept for the tab beside the D-533 first touch. They go with the
/// install record after sign-in as `landing` (the contract's LandingLabels).
library;

/// Casama's own sites: moving between them never counts as a referring site.
bool isCasamaHost(String host) {
  final h = host.toLowerCase();
  for (final own in const [
    'casama.ai',
    'casama.link',
    'casama.page',
    'casama.app',
  ]) {
    if (h == own || h.endsWith('.$own')) return true;
  }
  return false;
}

/// The landing labels in [uri], the app's first address, stored under their wire names. `fbt` is
/// when the click id was first seen (ms): casama.ai passes it on with `/get`, else [nowMs].
/// [referrer] is `document.referrer`; only its host is kept, and only for an outside site.
/// `ref_host` and `via` passed on by casama.ai win over the browser's referrer.
Map<String, String> landingLabelsFrom(
  Uri uri, {
  required String referrer,
  required int nowMs,
}) {
  final qp = uri.queryParameters;
  String? q(String key, int max) {
    final v = (qp[key] ?? '').trim();
    return v.isEmpty ? null : _clip(v, max);
  }

  final out = <String, String>{};
  void put(String key, String? value) {
    if (value != null && value.isNotEmpty) out[key] = value;
  }

  put('utm_source', q('utm_source', 100));
  put('utm_medium', q('utm_medium', 100));
  put('utm_campaign', q('utm_campaign', 150));
  put('utm_id', q('utm_id', 100));
  put('utm_term', q('utm_term', 100));
  put('utm_content', q('utm_content', 150));
  final fbclid = (qp['fbclid'] ?? '').trim();
  if (fbclid.isNotEmpty &&
      fbclid.length <= 500 &&
      RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(fbclid)) {
    out['fbclid'] = fbclid;
    final passed = int.tryParse((qp['fbt'] ?? '').trim());
    out['fbt'] = '${passed != null && passed > 0 ? passed : nowMs}';
  }
  var refHost = _host(q('ref_host', 253));
  if (refHost == null && referrer.isNotEmpty) {
    refHost = _host(Uri.tryParse(referrer)?.host);
  }
  if (refHost != null &&
      !isCasamaHost(refHost) &&
      refHost != uri.host.toLowerCase()) {
    put('ref_host', _clip(refHost, 253));
  }
  put('via', q('via', 100));
  return out;
}

/// The contract's LandingLabels from what [landingLabelsFrom] kept, plus the landing [path]
/// (D-533's `landing`). Null when nothing is known beyond the path.
Map<String, Object>? landingLabelsBody(Map<String, String>? kept) {
  if (kept == null) return null;
  final out = <String, Object>{
    for (final k in const [
      'utm_source',
      'utm_medium',
      'utm_campaign',
      'utm_id',
      'utm_term',
      'utm_content',
      'fbclid',
      'ref_host',
      'via',
    ])
      if ((kept[k] ?? '').isNotEmpty) k: kept[k]!,
  };
  final fbt = int.tryParse(kept['fbt'] ?? '');
  if (out.containsKey('fbclid') && fbt != null && fbt > 0) {
    out['fbclid_at'] = fbt;
  }
  if (out.isEmpty) return null;
  final landing = kept['landing'];
  if (landing != null && landing.isNotEmpty) {
    out['landing'] = _clip(landing, 120);
  }
  return out;
}

String? _host(String? raw) {
  if (raw == null) return null;
  final h = raw.trim().toLowerCase();
  if (h.isEmpty || !RegExp(r'^[a-z0-9.-]+$').hasMatch(h)) return null;
  return h;
}

String _clip(String s, int max) => s.length > max ? s.substring(0, max) : s;
