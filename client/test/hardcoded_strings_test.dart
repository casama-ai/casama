// No new user-facing string literals (docs/LOCALIZATION-PLAN.md §4.1, §5.8): words people read come
// from lib/l10n/app_en.arb. The ones that were there when the check arrived are listed in
// hardcoded_strings_baseline.txt; the list only gets shorter.
//
// After fixing listed strings (or moving a file), rewrite the list:
//   UPDATE_L10N_BASELINE=1 flutter test test/hardcoded_strings_test.dart
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../tool/literal_lint.dart';

const _baselinePath = 'test/hardcoded_strings_baseline.txt';

List<LiteralFinding> _scanLib() {
  final files = Directory('lib').listSync(recursive: true).whereType<File>().map((f) => f.path.replaceAll(r'\', '/')).where((p) => p.endsWith('.dart')).toList()..sort();
  return [for (final p in files) ...findLiterals(p, File(p).readAsStringSync())];
}

/// How many times each key appears.
Map<String, int> _count(Iterable<String> keys) {
  final out = <String, int>{};
  for (final k in keys) {
    out[k] = (out[k] ?? 0) + 1;
  }
  return out;
}

List<String> _found(String source) => [for (final f in findLiterals('lib/x.dart', source)) f.text];

void main() {
  test('no new user-facing string literals in lib/', () {
    final found = _scanLib();
    final file = File(_baselinePath);
    if (Platform.environment['UPDATE_L10N_BASELINE'] == '1') {
      final keys = [for (final f in found) f.key]..sort();
      file.writeAsStringSync([
        '# User-facing literals still outside the ARB (test/hardcoded_strings_test.dart).',
        '# One per line: file, a tab, the literal. Only ever shorter: fix one, then update.',
        ...keys,
        '',
      ].join('\n'));
      return;
    }
    final baseline = _count(file.readAsLinesSync().where((l) => l.isNotEmpty && !l.startsWith('#')));
    final now = _count(found.map((f) => f.key));
    final added = [
      for (final e in now.entries)
        if (e.value > (baseline[e.key] ?? 0))
          for (final f in found.where((f) => f.key == e.key)) '${f.file}:${f.line}  ${f.text}',
    ];
    final gone = [
      for (final e in baseline.entries)
        if (e.value > (now[e.key] ?? 0)) e.key.replaceFirst('\t', '  '),
    ];
    expect(
      added,
      isEmpty,
      reason: 'New text outside the ARB. Add it to lib/l10n/app_en.arb and read it with context.l10n. '
          'Text no one translates (a model prompt, a brand, a code sample) takes `// l10n-ok: why` '
          'on its line.\n${added.join('\n')}',
    );
    expect(
      gone,
      isEmpty,
      reason: 'These are fixed or moved; shorten the baseline with '
          'UPDATE_L10N_BASELINE=1 flutter test test/hardcoded_strings_test.dart\n${gone.join('\n')}',
    );
  });

  group('the check', () {
    test('finds text in widgets, named slots and toasts', () {
      expect(
        _found('''
          Text('Hello there');
          const SelectableText("Copy me");
          ListTile(title: Text('Row'), subtitle: 'Second line');
          TextField(decoration: InputDecoration(hintText: 'Search', labelText: 'Name'));
          IconButton(tooltip: 'Close', semanticLabel: 'Close it');
          ShortcutItem(type: 'ask', localizedTitle: 'Quick ask');
          Dialog(confirmLabel: 'Delete', dialogTitle: 'Sure now?');
          showToast(context, 'Saved it');
          SnackBar(content: Text('Gone for good'));
        '''),
        ['Hello there', 'Copy me', 'Row', 'Second line', 'Search', 'Name', 'Close', 'Close it', 'Quick ask', 'Delete', 'Sure now?', 'Saved it', 'Gone for good'],
      );
    });

    test('finds both sides of a choice, switch results and joined or built strings', () {
      expect(_found("Text(done ? 'All done' : 'Working');"), ['All done', 'Working']);
      expect(_found("Text(name ?? 'Someone');"), ['Someone']);
      expect(_found("Text(switch (s) { 'a' => 'Alpha', _ => 'Other' });"), ['Alpha', 'Other']);
      expect(_found("Text('One part, ' 'and the next');"), ['One part, and the next']);
      expect(_found(r"Text('$n new ${n == 1 ? 'reply' : 'replies'}');"), ['{} new {}', 'reply', 'replies']);
      expect(_found("Text(\n  (busy ? 'Hold on' : label),\n);"), ['Hold on']);
      expect(_found("Chip(label: (i) => 'Item \$i');"), ['Item {}']);
    });

    test('leaves alone what nobody reads or translates', () {
      expect(
        _found(r'''
          final id = 'settings.language';
          Text(l10n.hello);
          Text(format(date, 'yyyy'));
          Text(row['title']);
          Text(kind == 'bot' ? l10n.bot : l10n.person);
          Text('$count');
          Text('${a} · ${b}');
          Text('×');
          Text('Casama Cloud');
          TextField(decoration: InputDecoration(hintText: 'https://example.com'));
          Field(hintText: 'OPENAI_API_KEY');
          Icon(icon, key: Key('closeButton'));
          http.post(url, body: 'raw words');
          // Text('commented out');
          /* Text('also commented') */
          Text('sk-demo value'); // l10n-ok: a sample key
          // l10n-ok: goes to the model
          send(text: 'Note from the app');
          final m = {'title': 'wire value'};
        '''),
        isEmpty,
      );
    });

    test('skips the translations and the owner console', () {
      expect(findLiterals('lib/features/admin/admin_screen.dart', "Text('Owner only');"), isEmpty);
      expect(findLiterals('lib/l10n/generated/app_localizations_en.dart', "Text('Source');"), isEmpty);
    });
  });
}
