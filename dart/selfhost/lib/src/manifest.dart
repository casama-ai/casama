import 'dart:convert';

import 'package:http/http.dart' as http;

import 'errors.dart';
import 'sizes.dart';

/// Where the newest self-host release's manifest lives (docs/SELF-HOSTING-PLAN.md §11.2).
final Uri latestManifestUrl = Uri.parse('https://github.com/casama-ai/casama/releases/download/selfhost-latest/manifest.json');

/// The manifest's image names, in `images.env` order, with their variable names.
const Map<String, String> imageVariables = {
  'server': 'CASAMA_IMAGE_SERVER',
  'supervisor': 'CASAMA_IMAGE_SUPERVISOR',
  'migrate': 'CASAMA_IMAGE_MIGRATE',
  'computer-headless': 'CASAMA_IMAGE_COMPUTER_HEADLESS',
  'computer-desktop': 'CASAMA_IMAGE_COMPUTER_DESKTOP',
  'egress-proxy': 'CASAMA_IMAGE_EGRESS_PROXY',
  'turn': 'CASAMA_IMAGE_TURN',
  'connector': 'CASAMA_IMAGE_CONNECTOR',
  'backup': 'CASAMA_IMAGE_BACKUP',
};

/// A self-host release: `manifest.json` (schema 1).
class SelfhostManifest {
  SelfhostManifest({
    required this.version,
    required this.released,
    required this.bundleUrl,
    required this.bundleSha256,
    required this.minAppBuild,
    required this.images,
    this.sizes,
    this.schema = 1,
  });

  factory SelfhostManifest.fromJson(Map<String, dynamic> j) {
    final schema = j['schema'];
    if (schema is! int || schema != 1) {
      throw SelfhostException('manifest_schema', 'This release uses manifest schema $schema; update the app or CLI to install it.');
    }
    String str(String k) {
      final v = j[k];
      if (v is! String || v.isEmpty) throw SelfhostException('manifest_invalid', 'The release manifest has no "$k".');
      return v;
    }

    final images = j['images'];
    if (images is! Map) throw SelfhostException('manifest_invalid', 'The release manifest has no "images".');
    final imageMap = {for (final e in images.entries) e.key as String: e.value as String};
    for (final name in imageVariables.keys) {
      if (!(imageMap[name]?.contains('@sha256:') ?? false)) {
        throw SelfhostException('manifest_invalid', 'The release manifest does not pin the "$name" image by digest.');
      }
    }
    final sha = str('bundle_sha256').toLowerCase();
    if (!RegExp(r'^[0-9a-f]{64}$').hasMatch(sha)) throw SelfhostException('manifest_invalid', 'The release manifest has a malformed bundle_sha256.');
    return SelfhostManifest(
      schema: schema,
      version: str('version'),
      released: DateTime.parse(str('released')),
      bundleUrl: Uri.parse(str('bundle_url')),
      bundleSha256: sha,
      minAppBuild: (j['min_app_build'] as num?)?.toInt() ?? 0,
      images: imageMap,
      sizes: ImageSizes.tryParse(j['download']),
    );
  }

  final int schema;

  /// Engine version, `YYYY.M.D-<7-char commit>`.
  final String version;
  final DateTime released;
  final Uri bundleUrl;
  final String bundleSha256;

  /// The oldest app build that can install this release.
  final int minAppBuild;

  /// Image name (`server`, `supervisor`, …) → `ghcr.io/casama-ai/…@sha256:…`.
  final Map<String, String> images;

  /// What the release's images weigh per CPU type (optional `download` field; releases before it
  /// have none, and the apps then show a fixed estimate).
  final ImageSizes? sizes;

  Map<String, dynamic> toJson() => {
    'schema': schema,
    'version': version,
    'released': released.toUtc().toIso8601String(),
    'bundle_url': bundleUrl.toString(),
    'bundle_sha256': bundleSha256,
    'min_app_build': minAppBuild,
    'images': images,
    if (sizes != null) 'download': sizes!.toJson(),
  };

  /// The release's `images.env`: one `CASAMA_IMAGE_*` line per image plus `CASAMA_ENGINE_VERSION`.
  String imagesEnv() {
    final b = StringBuffer('# Casama self-host images for engine $version, pinned by digest. Written by the installer.\n');
    for (final e in imageVariables.entries) {
      b.writeln('${e.value}=${images[e.key]}');
    }
    b.writeln('CASAMA_ENGINE_VERSION=$version');
    return b.toString();
  }
}

/// Reads a release manifest; [url] defaults to the newest release ([latestManifestUrl]).
Future<SelfhostManifest> fetchManifest({Uri? url, http.Client? client}) async {
  final c = client ?? http.Client();
  try {
    final r = await c.get(url ?? latestManifestUrl, headers: {'accept': 'application/json'});
    if (r.statusCode != 200) {
      throw SelfhostException('manifest_unavailable', 'Could not read the release manifest (HTTP ${r.statusCode}).');
    }
    final Object? body;
    try {
      body = jsonDecode(utf8.decode(r.bodyBytes));
    } on FormatException {
      throw SelfhostException('manifest_invalid', 'The release manifest is not JSON.');
    }
    if (body is! Map<String, dynamic>) throw SelfhostException('manifest_invalid', 'The release manifest is not a JSON object.');
    return SelfhostManifest.fromJson(body);
  } finally {
    if (client == null) c.close();
  }
}
