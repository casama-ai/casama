import 'package:material_ui/material_ui.dart';

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
      AppLocalizations.delegate,
      ...GlobalMaterialLocalizations.delegates,
    ];
