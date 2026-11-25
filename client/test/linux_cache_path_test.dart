import 'dart:io';

import 'package:casama/core/local_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory tmp;
  setUp(() => tmp = Directory.systemTemp.createTempSync('casama-cache'));
  tearDown(() => tmp.deleteSync(recursive: true));

  test('the cache is kept with the app\'s data, and one left in Documents is removed', () async {
    final support = Directory('${tmp.path}/support')..createSync();
    final documents = Directory('${tmp.path}/Documents')..createSync();
    final old = File('${documents.path}/casama_cache.sqlite')..writeAsStringSync('old');
    final wal = File('${documents.path}/casama_cache.sqlite-wal')..writeAsStringSync('old');
    final theirs = File('${documents.path}/notes.txt')..writeAsStringSync('mine');

    final path = await linuxCachePath(support: () async => support, documents: () async => documents);

    expect(path, '${support.path}/casama_cache.sqlite');
    expect(old.existsSync(), isFalse);
    expect(wal.existsSync(), isFalse);
    expect(theirs.readAsStringSync(), 'mine');
  });

  test('no Documents folder is not a problem', () async {
    final support = Directory('${tmp.path}/support')..createSync();
    final path = await linuxCachePath(support: () async => support, documents: () async => throw const FileSystemException('none'));
    expect(path, '${support.path}/casama_cache.sqlite');
  });
}
