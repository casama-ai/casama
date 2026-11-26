import 'dart:io';

/// A `KEY=VALUE` file (`.env`, `images.env`) edited in place: comments and order are kept, and
/// values are written verbatim, as install.sh does.
class EnvFile {
  EnvFile(this.lines);

  factory EnvFile.read(File f) => EnvFile(f.existsSync() ? f.readAsLinesSync() : <String>[]);

  factory EnvFile.parse(String text) => EnvFile(text.split(RegExp(r'\r?\n')));

  final List<String> lines;

  static final _line = RegExp(r'^([A-Za-z_][A-Za-z0-9_]*)=(.*)$');

  /// Whether a `KEY=` line exists, empty or not.
  bool has(String key) => lines.any((l) => l.startsWith('$key='));

  /// The last value of [key], or null when the line is missing.
  String? operator [](String key) {
    String? v;
    for (final l in lines) {
      final m = _line.firstMatch(l);
      if (m != null && m.group(1) == key) v = m.group(2);
    }
    return v;
  }

  /// A non-empty value, or null.
  String? value(String key) {
    final v = this[key];
    return v == null || v.isEmpty ? null : v;
  }

  /// Sets [key], replacing every existing line of it with one at the first one's place.
  void operator []=(String key, String value) {
    final i = lines.indexWhere((l) => l.startsWith('$key='));
    lines.removeWhere((l) => l.startsWith('$key='));
    if (i < 0 || i > lines.length) {
      if (lines.isNotEmpty && lines.last.isEmpty) {
        lines.insert(lines.length - 1, '$key=$value');
      } else {
        lines.add('$key=$value');
      }
    } else {
      lines.insert(i, '$key=$value');
    }
  }

  /// Adds `KEY=value` only when no line for [key] exists.
  void setIfMissing(String key, String Function() value) {
    if (!has(key)) this[key] = value();
  }

  Map<String, String> toMap() => {
    for (final l in lines)
      if (_line.firstMatch(l) case final m?) m.group(1)!: m.group(2)!,
  };

  @override
  String toString() {
    final text = lines.join('\n');
    return text.endsWith('\n') ? text : '$text\n';
  }
}
