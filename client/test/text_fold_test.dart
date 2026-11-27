// Search matching ignores case and accents (settings search; docs/LOCALIZATION-PLAN.md).
import 'package:casama/core/text_fold.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('lower-cases and takes the accents off', () {
    expect(foldForSearch('Réglages À PROPOS'), 'reglages a propos');
    expect(
      foldForSearch('Configuración y Notificações'),
      'configuracion y notificacoes',
    );
    expect(foldForSearch('Straße Œuvre Ærø'), 'strasse oeuvre aero');
  });

  test('decomposed accents fold the same as composed ones', () {
    expect(foldForSearch('Réglages'), foldForSearch('Réglages'));
  });

  test('other scripts are left alone', () {
    // The voicing mark is part of the letter in Japanese.
    expect(foldForSearch('パスワード 설정'), 'パスワード 설정');
    expect(foldForSearch('が'), 'が');
  });
}
