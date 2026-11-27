// Finds user-facing string literals in the app's Dart code: text that should come from
// lib/l10n/app_en.arb instead (docs/LOCALIZATION-PLAN.md §4.1 and §5.8).
// test/hardcoded_strings_test.dart runs it over lib/ and compares the result with the baseline.
//
// A literal counts when it lands where a person reads it: the text of `Text(…)`, a toast, or a
// named argument such as `label:`, `title:`, `tooltip:`, `hintText:`, `semanticLabel:` or any
// `…Label:` / `…Title:`, including both sides of `a ? 'x' : 'y'` and switch expression results.
// It needs two letters in a row outside its interpolations.
//
// Deliberate exceptions, in order of preference: put the string in the ARB; mark its line (or the
// line above) with `// l10n-ok: why`; add an exact brand name to [allowedLiterals]; add a whole
// folder nobody but us reads to [excludedPaths].
//
// Plain Dart with its own small tokenizer, so it needs no analyzer package.

/// Folders and files nothing in them needs translating.
const excludedPaths = [
  'lib/l10n/', // the translations themselves
  'lib/features/admin/', // the owner console stays English (plan §1b, "Not translated")
];

/// Names that are the same in every language.
const allowedLiterals = {
  'Casama',
  'Casama Cloud',
  'Casama Link',
  'Anthropic',
  'Apple',
  'ChatGPT',
  'Chrome',
  'Claude',
  'Discord',
  'Firefox',
  'Gemini',
  'GitHub',
  'Google',
  'Linux',
  'Messenger',
  'Microsoft',
  'Ollama',
  'OpenAI',
  'OpenRouter',
  'Slack',
  'Telegram',
  'Windows',
};

/// Named arguments whose text a person reads, besides any name ending in `Label` or `Title`.
const _slotNames = {
  'label',
  'title',
  'subtitle',
  'tooltip',
  'hint',
  'hintText',
  'labelText',
  'helper',
  'helperText',
  'errorText',
  'counterText',
  'prefixText',
  'suffixText',
  'placeholder',
  'message',
  'text',
  'description',
  'emptyText',
};

/// Calls whose first argument is text on screen.
const _textCalls = {'Text', 'SelectableText'};

/// Calls whose second argument (after the context) is text on screen.
const _toastCalls = {'showToast', 'showMessage', 'showSuccess', 'showWarning', 'showFailure'};

class LiteralFinding {
  const LiteralFinding(this.file, this.line, this.text);
  final String file;
  final int line;

  /// The literal's own words, each interpolation written as `{}` and newlines as `\n`.
  final String text;

  /// What the baseline records: no line number, so unrelated edits don't move entries.
  String get key => '$file\t$text';
}

bool isExcluded(String file) => file.endsWith('.g.dart') || excludedPaths.any(file.startsWith);

/// The user-facing literals in [source]; [file] is its path from client/ (lib/…).
List<LiteralFinding> findLiterals(String file, String source) {
  if (isExcluded(file)) return const [];
  final scanner = _Scanner(source);
  final tokens = scanner.tokens(null);
  final found = <LiteralFinding>[];
  _scan(tokens, (t) {
    if (scanner.marked.contains(t.line) || scanner.marked.contains(t.line - 1)) return;
    if (_translatable(t.text)) found.add(LiteralFinding(file, t.line, t.text));
  });
  return found..sort((a, b) => a.line.compareTo(b.line));
}

bool _translatable(String text) {
  final words = text.replaceAll('{}', ' ').replaceAll(r'\n', ' ').trim();
  if (!RegExp(r'\p{L}{2}', unicode: true).hasMatch(words)) return false;
  if (allowedLiterals.contains(words)) return false;
  // Addresses, paths and ENVIRONMENT_NAMES are typed as they are in every language.
  if (RegExp(r'^[a-z][a-z0-9+.-]*://\S*$').hasMatch(words)) return false;
  if (RegExp(r'^[A-Z0-9]+(_[A-Z0-9]+)+$').hasMatch(words)) return false;
  if (RegExp(r'^(~|\.)?/[\w./-]*$').hasMatch(words)) return false;
  return true;
}

enum _Kind { word, string, punct }

class _Token {
  _Token(this.kind, this.text, this.line, [this.interpolations = const []]);
  final _Kind kind;
  String text;
  final int line;

  /// A string's `${…}` expressions, each as its own tokens.
  List<List<_Token>> interpolations;
  bool get isString => kind == _Kind.string;
  bool its(String s) => kind != _Kind.string && text == s;
}

/// Walks the tokens for slots, and reports each literal that is a slot's value.
void _scan(List<_Token> tokens, void Function(_Token) report) {
  final reported = <_Token>{};
  void once(_Token t) {
    if (reported.add(t)) report(t);
  }

  for (var i = 0; i < tokens.length; i++) {
    final t = tokens[i];
    // Slots can sit inside an interpolation too: '${tr(label: 'x')}'.
    for (final inner in t.interpolations) {
      _scan(inner, report);
    }
    if (t.kind != _Kind.word) continue;
    final before = i > 0 ? tokens[i - 1] : null;
    final after = i + 1 < tokens.length ? tokens[i + 1] : null;
    if (after == null) continue;
    if (after.its('(')) {
      if (_textCalls.contains(t.text)) _value(tokens, i + 2, once);
      if (_toastCalls.contains(t.text)) {
        final second = _skipArgument(tokens, i + 2);
        if (second != null) _value(tokens, second, once);
      }
    } else if (after.its(':') && before != null && (before.its('(') || before.its(','))) {
      if (_slotNames.contains(t.text) || t.text.endsWith('Label') || t.text.endsWith('Title')) _value(tokens, i + 2, once);
    }
  }
}

/// The index after the comma that ends the argument starting at [from]; null if it's the last.
int? _skipArgument(List<_Token> tokens, int from) {
  var depth = 0;
  for (var i = from; i < tokens.length; i++) {
    final t = tokens[i];
    if (t.its('(') || t.its('[') || t.its('{')) {
      depth++;
    } else if (t.its(')') || t.its(']') || t.its('}')) {
      if (depth == 0) return null;
      depth--;
    } else if (depth == 0 && t.its(',')) {
      return i + 1;
    }
  }
  return null;
}

/// Reports the literals that can be the value of the expression starting at [from]: not those
/// handed to another call, used as an index or key, or compared against.
void _value(List<_Token> tokens, int from, void Function(_Token) report) {
  // One entry per open bracket: whether literals inside it can still be the value.
  final open = <bool>[];
  var switchHead = false;
  for (var i = from; i < tokens.length; i++) {
    final t = tokens[i];
    final before = i > 0 ? tokens[i - 1] : null;
    final after = i + 1 < tokens.length ? tokens[i + 1] : null;
    if (t.its('(') || t.its('[') || t.its('{')) {
      final call = before != null && i > from && (before.kind == _Kind.word && !const {'switch', 'return', 'await'}.contains(before.text) || before.its(')') || before.its(']'));
      if (t.its('(') && before != null && before.its('switch')) {
        switchHead = true;
        open.add(false);
      } else if (t.its('{') && switchHead && before != null && before.its(')')) {
        switchHead = false;
        open.add(true); // a switch expression's arms are values
      } else {
        // Brackets that only group keep the value; lists, maps and arguments don't.
        open.add(t.its('(') && !call);
      }
    } else if (t.its(')') || t.its(']') || t.its('}')) {
      if (open.isEmpty) return;
      open.removeLast();
    } else if (open.isEmpty && (t.its(',') || t.its(';'))) {
      return;
    } else if (t.isString && !open.contains(false)) {
      final compared = (before != null && (before.its('==') || before.its('!=') || before.its('||'))) || (after != null && (after.its('==') || after.its('!=') || after.its('||')));
      // `'a' => …` inside a switch is the pattern, not the result.
      final pattern = open.isNotEmpty && after != null && after.its('=>') && before != null && (before.its('{') || before.its(','));
      if (compared || pattern) continue;
      report(t);
      // Words chosen inside the literal itself: '${one ? 'bot' : 'bots'}'.
      for (final inner in t.interpolations) {
        _value(inner, 0, report);
      }
    }
  }
}

class _Scanner {
  _Scanner(this.source);
  final String source;
  var _at = 0;
  var _line = 1;

  /// Lines carrying `l10n-ok`.
  final marked = <int>{};

  String _peek([int ahead = 0]) => _at + ahead < source.length ? source[_at + ahead] : '';

  String _take() {
    final c = source[_at++];
    if (c == '\n') _line++;
    return c;
  }

  /// Tokens up to the end of the file, or (inside an interpolation) up to the `}` that closes it.
  List<_Token> tokens(String? until) {
    final out = <_Token>[];
    var braces = 0;
    while (_at < source.length) {
      final c = _peek();
      if (c.trim().isEmpty) {
        _take();
      } else if (c == '/' && _peek(1) == '/') {
        final line = _line;
        final start = _at;
        while (_at < source.length && _peek() != '\n') {
          _take();
        }
        if (source.substring(start, _at).contains('l10n-ok')) marked.add(line);
      } else if (c == '/' && _peek(1) == '*') {
        var depth = 0;
        do {
          if (_peek() == '/' && _peek(1) == '*') {
            depth++;
            _take();
          } else if (_peek() == '*' && _peek(1) == '/') {
            depth--;
            _take();
          }
          _take();
        } while (depth > 0 && _at < source.length);
      } else if (c == "'" || c == '"') {
        _string(out, raw: false);
      } else if (c == 'r' && (_peek(1) == "'" || _peek(1) == '"')) {
        _take();
        _string(out, raw: true);
      } else if (_isWord(c)) {
        final line = _line;
        final start = _at;
        while (_at < source.length && _isWord(_peek())) {
          _take();
        }
        out.add(_Token(_Kind.word, source.substring(start, _at), line));
      } else {
        if (c == '{') braces++;
        if (c == '}') {
          if (until == '}' && braces == 0) {
            _take();
            return out;
          }
          braces--;
        }
        final line = _line;
        final two = '$c${_peek(1)}';
        if (const {'==', '!=', '=>', '||', '&&', '??', '?.', '<=', '>='}.contains(two)) {
          _take();
          _take();
          out.add(_Token(_Kind.punct, two, line));
        } else {
          out.add(_Token(_Kind.punct, _take(), line));
        }
      }
    }
    return out;
  }

  static bool _isWord(String c) => c.isNotEmpty && RegExp(r'[A-Za-z0-9_$]').hasMatch(c);

  /// Reads one literal; one that follows another ('a' 'b') is joined to it.
  void _string(List<_Token> out, {required bool raw}) {
    final line = _line;
    final quote = _peek();
    final triple = _peek(1) == quote && _peek(2) == quote;
    final width = triple ? 3 : 1;
    for (var i = 0; i < width; i++) {
      _take();
    }
    final text = StringBuffer();
    final interpolations = <List<_Token>>[];
    while (_at < source.length) {
      if (_peek() == quote && (!triple || (_peek(1) == quote && _peek(2) == quote))) {
        for (var i = 0; i < width; i++) {
          _take();
        }
        break;
      }
      final c = _take();
      if (!raw && c == r'\') {
        if (_at >= source.length) break;
        final escaped = _take();
        text.write(escaped == 'n' ? r'\n' : (const {'t', 'r'}.contains(escaped) ? ' ' : escaped));
        // — and \x41 name a character, not words.
        if (escaped == 'u' || escaped == 'x') {
          if (_peek() == '{') {
            while (_at < source.length && _take() != '}') {}
          } else {
            for (var i = 0; i < (escaped == 'u' ? 4 : 2) && _at < source.length; i++) {
              _take();
            }
          }
          final s = text.toString();
          text
            ..clear()
            ..write('${s.substring(0, s.length - 1)}·');
        }
      } else if (!raw && c == r'$' && _peek() == '{') {
        _take();
        interpolations.add(tokens('}'));
        text.write('{}');
      } else if (!raw && c == r'$' && RegExp(r'[A-Za-z_]').hasMatch(_peek())) {
        while (_at < source.length && RegExp(r'[A-Za-z0-9_]').hasMatch(_peek())) {
          _take();
        }
        text.write('{}');
      } else {
        text.write(c == '\n' ? r'\n' : (c == '\t' ? ' ' : c));
      }
    }
    final previous = out.isEmpty ? null : out.last;
    if (previous != null && previous.isString) {
      previous.text += text.toString();
      previous.interpolations = [...previous.interpolations, ...interpolations];
    } else {
      out.add(_Token(_Kind.string, text.toString(), line, interpolations));
    }
  }
}
