import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:casama_selfhost/casama_selfhost.dart';
import 'package:crypto/crypto.dart';

/// Records every command and answers from [answer] (exit 0 and empty output by default).
class FakeRunner implements ProcessRunner {
  FakeRunner({this.answer});
  final ProcessResult? Function(String exe, List<String> args)? answer;
  final calls = <List<String>>[];
  int dumpExit = 0;

  @override
  Future<ProcessResult> run(String executable, List<String> arguments, {String? workingDirectory, Map<String, String>? environment}) async {
    calls.add([executable, ...arguments]);
    final a = answer?.call(executable, arguments);
    if (a != null) return a;
    if (executable == 'docker' && arguments.length > 2 && arguments[0] == 'info' && arguments[2] == '{{.MemTotal}}') {
      return ProcessResult(0, 0, '${16 * 1024 * 1024 * 1024}\n', '');
    }
    return ProcessResult(0, 0, '', '');
  }

  @override
  Future<int> runToFile(String executable, List<String> arguments, File out, {String? workingDirectory}) async {
    calls.add([executable, ...arguments]);
    out.writeAsStringSync('PGDMP fake dump');
    return dumpExit;
  }

  /// Calls whose arguments contain every one of [parts] in order.
  Iterable<List<String>> matching(List<String> parts) => calls.where((c) {
    var i = 0;
    for (final x in c) {
      if (i < parts.length && x == parts[i]) i++;
    }
    return i == parts.length;
  });
}

/// Skips the slow RSA key.
class FastSecrets extends SecretSource {
  @override
  String samlKey() => base64.encode(utf8.encode('fake-saml-key-${hex(4)}'));
}

/// A release bundle tar.gz (one top-level folder, as release-selfhost.sh makes it).
List<int> makeBundle(String version, {Map<String, String>? files}) {
  final a = Archive();
  final content =
      files ??
      {
        'docker-compose.yml': 'name: casama\n# $version\n',
        'Caddyfile': ':80 {}\n',
        'kong.yml': '_format_version: "2.1"\n',
        'searxng/settings.yml': 'use_default_settings: true\n',
        'install.sh': '#!/usr/bin/env bash\necho hi\n',
        'images.env': 'CASAMA_ENGINE_VERSION=$version\n',
        'README.md': '# Casama self-host $version\n',
      };
  for (final e in content.entries) {
    final bytes = utf8.encode(e.value);
    a.addFile(ArchiveFile('casama-selfhost-$version/${e.key}', bytes.length, bytes)..mode = e.key.endsWith('.sh') ? 0x1ed : 0x1a4);
  }
  return GZipEncoder().encode(TarEncoder().encode(a));
}

SelfhostManifest makeManifest(String version, List<int> bundle) => SelfhostManifest(
  version: version,
  released: DateTime.utc(2026, 11, 26, 12),
  bundleUrl: Uri.parse('https://example.test/releases/$version/bundle.tar.gz'),
  bundleSha256: sha256.convert(bundle).toString(),
  minAppBuild: 104,
  images: {
    for (final k in imageVariables.keys) k: 'ghcr.io/casama-ai/${k == 'server' || k == 'supervisor' || k == 'migrate' ? 'engine-$k' : k}@sha256:${'ab' * 32}',
  },
);
