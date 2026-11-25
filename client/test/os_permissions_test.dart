import 'dart:convert';
import 'dart:io';

import 'package:casama/features/permissions/os_permissions.dart';
import 'package:flutter_test/flutter_test.dart';

/// The Dart table is a copy of the server's (packages/domain/src/os-permissions.ts, D-376): the
/// server decides which rows a card shows, the app how to turn them on. test/fixtures/
/// os_permissions.json is the server's table as it writes it (`pnpm --filter @casama/domain
/// gen:os-permissions`, checked there), so this reads no server code. It checks the two agree on
/// ids, platforms, how each is asked for, and restarts.
void main() {
  test('the app\'s permission table matches the server\'s', () {
    final fixture = jsonDecode(File('test/fixtures/os_permissions.json').readAsStringSync()) as Map<String, dynamic>;
    final rows = (fixture['permissions'] as List).cast<Map<String, dynamic>>();
    expect(rows, isNotEmpty);
    final server = <String, (Map<String, String>, Set<String>)>{
      for (final r in rows)
        r['id'] as String: (
          (r['platforms'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v as String)),
          {for (final p in (r['relaunch'] as List?) ?? const []) p as String},
        ),
    };
    expect([for (final p in osPermissions) p.id], server.keys.toList(), reason: 'same ids in the same order');
    for (final p in osPermissions) {
      final (platforms, relaunch) = server[p.id]!;
      expect({for (final e in p.platforms.entries) e.key: e.value.name}, platforms, reason: '${p.id} platforms');
      expect(p.relaunch, relaunch, reason: '${p.id} relaunch');
    }
  });

  test('asks, platforms and states', () {
    expect(permissionAsk('screen_recording', 'macos'), PermissionAsk.prompt);
    expect(permissionAsk('screen_recording', 'ios'), isNull);
    expect(permissionAsk('full_disk', 'Darwin'), PermissionAsk.settings);
    expect(permissionAsk('shared_folders', 'windows'), PermissionAsk.casama);
    expect(permissionNeedsRelaunch('screen_recording', 'macos'), isTrue);
    expect(permissionNeedsRelaunch('accessibility', 'macos'), isFalse);
    expect(permissionIdsFor('android'), containsAll(['location', 'notification_access', 'calendar']));
    expect(permissionIdsFor('android'), isNot(contains('screen_recording')));
    expect(permissionIdsFor('toaster'), isEmpty);
    expect(permissionOn('limited'), isTrue);
    expect(permissionOn('not_asked'), isFalse);
    expect(osPermission('made_up'), isNull);
  });
}
