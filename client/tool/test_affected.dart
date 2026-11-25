// Finds Flutter test files affected by a list of changed files (relative to client/ or repo root)
// by following Dart import/export/part directives across lib/ and test/.
//
// Usage (from client/):
//   dart run tool/test_affected.dart <changed-file-1> [changed-file-2 ...]
import 'dart:io';

final _directiveRe = RegExp(
  r'''^\s*(?:import|export|part)\s+['"]([^'"]+)['"]''',
  multiLine: true,
);

void main(List<String> args) {
  if (args.isEmpty) return;

  final changed = <String>{};
  for (final raw in args) {
    var p = raw.replaceAll('\\', '/').trim();
    if (p.startsWith('client/')) p = p.substring('client/'.length);
    if (p.isNotEmpty) changed.add(p);
  }

  // Build reverse dependency graph: target file -> set of files that import/export/part it.
  final reverseDeps = <String, Set<String>>{};
  final allTests = <String>{};

  for (final dirName in ['lib', 'test']) {
    final dir = Directory(dirName);
    if (!dir.existsSync()) continue;
    for (final entity in dir.listSync(recursive: true, followLinks: false)) {
      if (entity is! File) continue;
      final path = entity.path.replaceAll('\\', '/');
      if (!path.endsWith('.dart')) continue;
      if (path.startsWith('test/.generated/')) continue;
      if (path.startsWith('test/') && path.endsWith('_test.dart')) {
        allTests.add(path);
      }
      final content = entity.readAsStringSync();
      for (final match in _directiveRe.allMatches(content)) {
        final uri = match.group(1)!;
        final resolved = _resolveUri(path, uri);
        if (resolved != null) {
          reverseDeps.putIfAbsent(resolved, () => <String>{}).add(path);
        }
      }
    }
  }

  // BFS from changed files through reverse dependencies.
  final visited = <String>{};
  final queue = <String>[];
  for (final c in changed) {
    if (visited.add(c)) queue.add(c);
  }

  const hubFiles = {
    'lib/core/router.dart',
    'lib/app.dart',
    'lib/features/home/home_shell.dart',
    'lib/features/settings/settings_screen.dart',
  };
  final affectedTests = <String>{};
  while (queue.isNotEmpty) {
    final cur = queue.removeAt(0);
    if (allTests.contains(cur)) {
      affectedTests.add(cur);
      // Do not traverse further from a *_test.dart file unless it was directly edited:
      // many tests import shared helpers (e.g. `harness` from app_test.dart) without
      // testing every screen that app_test.dart transitively imports.
      if (!changed.contains(cur)) continue;
    }
    // Do not fan out through top-level app/router hubs unless they were directly edited,
    // otherwise editing any single screen would pull in almost every test in the repo.
    if (hubFiles.contains(cur) && !changed.contains(cur)) continue;
    final dependents = reverseDeps[cur];
    if (dependents == null) continue;
    for (final dep in dependents) {
      if (visited.add(dep)) queue.add(dep);
    }
  }

  final sorted = affectedTests.toList()..sort();
  for (final t in sorted) {
    stdout.writeln(t);
  }
}

String? _resolveUri(String fromPath, String uri) {
  if (uri.startsWith('dart:')) return null;
  if (uri.startsWith('package:casama/')) {
    return 'lib/${uri.substring('package:casama/'.length)}';
  }
  if (uri.startsWith('package:')) return null;
  // Relative URI
  final slash = fromPath.lastIndexOf('/');
  final baseDir = slash >= 0 ? fromPath.substring(0, slash) : '';
  final parts = <String>[
    if (baseDir.isNotEmpty) ...baseDir.split('/'),
    ...uri.split('/'),
  ];
  final norm = <String>[];
  for (final p in parts) {
    if (p.isEmpty || p == '.') continue;
    if (p == '..') {
      if (norm.isNotEmpty) norm.removeLast();
    } else {
      norm.add(p);
    }
  }
  return norm.join('/');
}
