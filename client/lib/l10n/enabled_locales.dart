/// The languages a release build offers: the build switch in `l10n/locales.json`
/// (docs/LOCALIZATION-PLAN.md §3, "A language ships whole"). A language can have its ARB file on
/// main and stay off here until every surface is translated.
///
/// This file will be generated from `l10n/locales.json` (every locale with `"enabled": true`, plus
/// English) by the localization kit's generator. Until that lands it is kept by hand, English only.
/// Debug builds ignore it and offer every language that has an ARB file (core/app_language.dart).
const enabledLocaleCodes = <String>['en'];
