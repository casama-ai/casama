// The pseudo-locale en-XA (docs/LOCALIZATION-PLAN.md §5.6): never in a release, and what the
// sweep (l10n_sweep_test.dart) counts as text that isn't localized.
import 'dart:io';

import 'package:casama/core/app_language.dart';
import 'package:casama/l10n/enabled_locales.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'support/l10n_sweep.dart';

const _en = Locale('en');

void main() {
  test('the build switch never turns the pseudo-locale on', () {
    const generated = [_en, AppLanguage.pseudo];
    expect(AppLanguage.supportedFrom(generated: generated, enabled: const ['en', 'en-XA']), [_en]);
    expect(AppLanguage.supportedFrom(generated: generated, enabled: enabledLocaleCodes), [_en]);
    // A debug build offers it, under a name of its own, after English.
    expect(AppLanguage.supportedFrom(generated: generated), generated);
    expect(AppLanguage.nameOf(AppLanguage.pseudo), 'Pseudo (en-XA)');
    // An English device stays in English.
    expect(AppLanguage.resolve(device: const [Locale('en', 'GB')], supported: generated), _en);
  });

  test(
    'the committed localizations leave it out',
    () {
      expect(File('lib/l10n/generated/app_localizations.dart').readAsStringSync(), isNot(contains('AppLocalizationsEnXa')), reason: "Run `flutter gen-l10n`: the generated files still carry the pseudo-locale.");
      expect(File('.gitignore').readAsStringSync(), contains('lib/l10n/app_en_XA.arb'));
    },
    // Turned on here (by the sweep, or by hand for a debug build).
    skip: File('lib/l10n/app_en_XA.arb').existsSync() ? 'The pseudo-locale is on' : false,
  );

  test('the sweep counts words outside ⟦ ⟧, and not data', () {
    bool flagged(String text) => hasUnlocalizedWords(text, const ['Ada', 'Casama']);
    expect(flagged('⟦Šávé óñ⟧'), isFalse);
    expect(flagged('⟦Ĥí ⟦ñáɱé⟧ óñ⟧ · ⟦Çĥáť⟧'), isFalse);
    expect(flagged('Save'), isTrue);
    expect(flagged('Plain · ⟦Šýšťém óñ⟧'), isTrue);
    expect(flagged('⟦Šýšťém⟧ default'), isTrue);
    // A translated string shown in two pieces.
    expect(flagged('⟦Ĝó ťó'), isFalse);
    expect(flagged('Šéťťíñĝš óñé⟧'), isFalse);
    // Data: names, addresses, prices, dates, initials, punctuation.
    for (final data in ['Ada', 'Casama · 12', 'a@b.co', 'https://casama.ai', r'$15/mo', 'Nov 10', 'Tuesday 9:00 AM', 'JD', '3 · 4']) {
      expect(flagged(data), isFalse, reason: data);
    }
    // Words that only start like a month or a day are still words.
    for (final word in ['Marketing', 'Decline', 'Monthly', 'Separate', 'Saturate']) {
      expect(flagged(word), isTrue, reason: word);
    }
  });
}
