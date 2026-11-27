import 'package:flutter/foundation.dart' show SynchronousFuture, visibleForTesting;
import 'package:flutter_localizations/flutter_localizations.dart' as fl;
import 'package:material_ui/material_ui.dart';

import '../core/app_language.dart' show AppStrings;
import 'generated/app_localizations.dart';

/// The app's translations plus Material's, Cupertino's and the widgets' own, from the
/// `material_ui` and `cupertino_ui` packages.
///
/// Use this, not `AppLocalizations.localizationsDelegates`: gen-l10n still lists the old
/// `flutter_localizations` delegates there, and since Flutter 3.47 the `material_ui` widgets don't
/// recognise those. English hides it (Material falls back to its built-in US English), but in any
/// other language every AppBar, dialog and text field throws "No MaterialLocalizations found".
const List<LocalizationsDelegate<dynamic>> appLocalizationsDelegates =
    <LocalizationsDelegate<dynamic>>[
      _AppStringsDelegate(),
      ...GlobalMaterialLocalizations.delegates,
    ];

/// For tests: gen-l10n's own list (with Flutter's Material, Cupertino and widgets delegates, which
/// the SDK Material widgets in some tests need), with the app's delegate in place of gen-l10n's so a
/// test's first frame doesn't wait on a deferred library.
@visibleForTesting
const List<LocalizationsDelegate<dynamic>> testLocalizationsDelegates = <LocalizationsDelegate<dynamic>>[
  _AppStringsDelegate(),
  // ignore: deprecated_member_use
  fl.GlobalMaterialLocalizations.delegate,
  // ignore: deprecated_member_use
  fl.GlobalCupertinoLocalizations.delegate,
  // ignore: deprecated_member_use
  fl.GlobalWidgetsLocalizations.delegate,
];

/// gen-l10n's delegate, answering at once for a language already loaded (English always is), so
/// the first frame doesn't wait a turn for a deferred library that's already there.
class _AppStringsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppStringsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.delegate.isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) {
    final hit = AppStrings.cached(locale);
    return hit != null ? SynchronousFuture(hit) : AppStrings.load(locale);
  }

  @override
  bool shouldReload(_AppStringsDelegate old) => false;
}
