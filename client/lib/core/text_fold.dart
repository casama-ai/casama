/// Text made ready for search matching: lower case with accents taken off, so "reglages" finds
/// "Réglages" and "réglages" finds "reglages". Fold both sides before comparing.
///
/// Covers the Latin letters of our languages and their neighbours, written as one code point or as
/// a letter followed by combining marks. Other scripts (Japanese voicing marks, Hangul) are left
/// as they are.
String foldForSearch(String text) {
  final out = StringBuffer();
  for (final rune in text.toLowerCase().runes) {
    // Combining marks: the accent in decomposed text ("e" followed by U+0301).
    if (rune >= 0x0300 && rune <= 0x036F) continue;
    if (rune < 0x00DF || rune > 0x1EF9) {
      out.writeCharCode(rune);
      continue;
    }
    final char = String.fromCharCode(rune);
    out.write(_folded[char] ?? char);
  }
  return out.toString();
}

/// Each plain spelling and the lower-case letters that fold to it.
const _letters = {
  'a': 'àáâãäåāăąǎảạấầẩẫậắằẳẵặ',
  'c': 'çćĉċč',
  'd': 'ďđð',
  'e': 'èéêëēĕėęěẻẽẹếềểễệ',
  'g': 'ĝğġģǧ',
  'h': 'ĥħ',
  'i': 'ìíîïĩīĭįıǐỉị',
  'j': 'ĵ',
  'k': 'ķ',
  'l': 'ĺļľŀł',
  'n': 'ñńņňŉ',
  'o': 'òóôõöøōŏőơǒọỏốồổỗộớờởỡợ',
  'r': 'ŕŗř',
  's': 'śŝşšș',
  't': 'ţťŧț',
  'u': 'ùúûüũūŭůűųưǔụủứừửữự',
  'w': 'ŵ',
  'y': 'ýÿŷỳỵỷỹ',
  'z': 'źżž',
  'ss': 'ß',
  'ae': 'æ',
  'oe': 'œ',
  'th': 'þ',
};

final Map<String, String> _folded = {
  for (final MapEntry(key: plain, value: accented) in _letters.entries)
    for (final rune in accented.runes) String.fromCharCode(rune): plain,
};
