import 'dart:convert';

import 'package:web/web.dart' as web;

import 'landing_labels.dart';

const _storageKey = 'casama.first_attribution';

/// Captures first-touch UTM params, external referrer host, landing path and the ad labels
/// ([landingLabelsFrom]) from the initial
/// browser URL before GoRouter rewrites it (D-533). Persists in cookie-free `sessionStorage` so
/// redirects during OAuth sign-in keep the original source.
Map<String, String>? readInitialWebAttribution() {
  try {
    final existing = web.window.sessionStorage.getItem(_storageKey);
    if (existing != null && existing.isNotEmpty) {
      final decoded = jsonDecode(existing);
      if (decoded is Map) {
        return {
          for (final e in decoded.entries)
            if (e.key is String &&
                e.value is String &&
                (e.value as String).isNotEmpty)
              e.key as String: e.value as String,
        };
      }
    }
    final uri = Uri.tryParse(web.window.location.href);
    if (uri == null) return null;
    final qp = uri.queryParameters;
    var source = (qp['utm_source'] ?? '').trim().toLowerCase();
    var medium = (qp['utm_medium'] ?? '').trim().toLowerCase();
    final campaign = (qp['utm_campaign'] ?? '').trim().toLowerCase();
    final landing = uri.path.isEmpty ? '/' : uri.path;
    // The casama.ai click this visit came from (D-537), passed on by /get links.
    final click = (qp['cv'] ?? '').trim();
    if (source.isEmpty) {
      final ref = web.document.referrer;
      if (ref.isNotEmpty) {
        final refHost =
            Uri.tryParse(ref)?.host
                .toLowerCase()
                .replaceFirst(RegExp(r'^www\.'), '') ??
            '';
        if (refHost.isNotEmpty && refHost != uri.host.toLowerCase()) {
          source = refHost;
          if (medium.isEmpty) medium = 'referral';
        }
      }
    }
    final out = <String, String>{
      'source': source.isNotEmpty ? _clip(source, 80) : 'direct',
      if (medium.isNotEmpty) 'medium': _clip(medium, 60),
      if (campaign.isNotEmpty) 'campaign': _clip(campaign, 100),
      'landing': _clip(landing, 120),
      if (RegExp(r'^[A-Za-z0-9_-]{8,64}$').hasMatch(click)) 'click': click,
      // The ad labels as they came (utm_id/term/content, fbclid and when it was first seen, the
      // referring host, casama.ai's hand-off page), for the install record (ADS-ATTRIBUTION-PLAN §6.3).
      ...landingLabelsFrom(uri, referrer: web.document.referrer, nowMs: DateTime.now().millisecondsSinceEpoch),
    };
    web.window.sessionStorage.setItem(_storageKey, jsonEncode(out));
    return out;
  } catch (_) {
    return null;
  }
}

String _clip(String s, int max) => s.length > max ? s.substring(0, max) : s;

/// A creator's code (D-543) the web app was opened with: `?partner=<code>` on the address, else the
/// `casama_partner` cookie casama.ai/c/<code> sets for a week on .casama.ai. Null when neither.
String? readInitialWebPartner() {
  try {
    final uri = Uri.tryParse(web.window.location.href);
    final fromQuery = uri?.queryParameters['partner']?.trim();
    if (fromQuery != null && fromQuery.isNotEmpty) return fromQuery;
    for (final part in web.document.cookie.split(';')) {
      final i = part.indexOf('=');
      if (i < 0) continue;
      if (part.substring(0, i).trim() == 'casama_partner') {
        final v = Uri.decodeComponent(part.substring(i + 1).trim());
        if (v.isNotEmpty) return v;
      }
    }
  } catch (_) {}
  return null;
}

const _planStorageKey = 'casama.pending_plan';
const _validPlans = {'plus', 'pro', 'max'};

/// Reads `?plan=plus|pro|max` from the initial browser URL (docs/CONVERSION-FUNNEL-PLAN.md §3.1)
/// and keeps it in sessionStorage across OAuth redirects until the paywall consumes it.
String? readInitialWebPlan() {
  try {
    final uri = Uri.tryParse(web.window.location.href);
    final fromQuery = uri?.queryParameters['plan']?.trim().toLowerCase();
    if (fromQuery != null && _validPlans.contains(fromQuery)) {
      web.window.sessionStorage.setItem(_planStorageKey, fromQuery);
      return fromQuery;
    }
    final stored = web.window.sessionStorage.getItem(_planStorageKey)?.trim().toLowerCase();
    if (stored != null && _validPlans.contains(stored)) return stored;
  } catch (_) {}
  return null;
}

/// Clears any stored pricing-page plan tier once the paywall has opened for it.
void clearInitialWebPlan() {
  try {
    web.window.sessionStorage.removeItem(_planStorageKey);
  } catch (_) {}
}
