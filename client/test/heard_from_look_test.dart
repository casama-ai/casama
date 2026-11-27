// Pictures of "How did you hear about us?" on a small and a large phone and a desktop window, in
// light and dark mode, in English and German (long labels), with one card picked. It runs only
// when told where to put them:
//
//   HEARD_FROM_SHOTS=/some/folder flutter test test/heard_from_look_test.dart
import 'dart:io';

import 'package:casama/core/providers.dart';
import 'package:casama/features/welcome/heard_from_step.dart';
import 'package:casama/l10n/delegates.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'fake_backend.dart';
import 'support/shots.dart';

void main() {
  final dir = Platform.environment['HEARD_FROM_SHOTS'];
  const sizes = <(String, Size, FakeViewPadding)>[
    ('phone', Size(393, 852), FakeViewPadding(top: 59, bottom: 34)),
    ('phone-small', Size(320, 568), FakeViewPadding(top: 20)),
    ('desktop', Size(1280, 820), FakeViewPadding.zero),
  ];

  for (final (name, size, padding) in sizes) {
    for (final mode in [ThemeMode.dark, ThemeMode.light]) {
      for (final locale in const [Locale('en'), Locale('de')]) {
        testWidgets('pictures: $name ${mode.name} ${locale.languageCode}', (
          tester,
        ) async {
          await loadAppFonts();
          tester.view.physicalSize = size * 2;
          tester.view.devicePixelRatio = 2;
          tester.view.padding = FakeViewPadding(
            left: padding.left * 2,
            top: padding.top * 2,
            right: padding.right * 2,
            bottom: padding.bottom * 2,
          );
          addTearDown(tester.view.reset);
          await tester.pumpWidget(
            ShotFrame(
              child: ProviderScope(
                overrides: [backendProvider.overrideWithValue(FakeBackend())],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.light(),
                  darkTheme: AppTheme.dark(),
                  themeMode: mode,
                  locale: locale,
                  localizationsDelegates: appLocalizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const HeardFromStep(),
                ),
              ),
            ),
          );
          Future<void> settle() async {
            for (var i = 0; i < 10; i++) {
              await tester.runAsync(
                () => Future<void>.delayed(const Duration(milliseconds: 5)),
              );
              await tester.pump(const Duration(milliseconds: 100));
            }
          }

          await settle();
          await shot(
            tester,
            dir!,
            '${name}_${mode.name}_${locale.languageCode}',
          );
          await tester.tap(find.byKey(const Key('heardFrom_youtube')));
          await settle();
          await shot(
            tester,
            dir,
            '${name}_${mode.name}_${locale.languageCode}_picked',
          );
        }, skip: dir == null);
      }
    }
  }
}
