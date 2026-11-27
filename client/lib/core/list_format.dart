/// A list of names or things inside a sentence, with the language's own separator: "email,
/// calendar" in English, "メール、カレンダー" in Japanese. It adds no "and", so the sentence around
/// it puts the list after a colon. [locale] is `l10n.localeName`.
String joinList(String locale, Iterable<String> items) {
  final language = locale.split(RegExp('[-_]')).first;
  return items.join(language == 'ja' || language == 'zh' ? '、' : ', ');
}
