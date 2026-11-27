import 'package:casama_sdk/casama_sdk.dart' show AcceptLanguage;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show Locale, WidgetsBinding, WidgetsBindingObserver, basicLocaleListResolution;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/enabled_locales.dart';
import '../l10n/generated/app_localizations.dart';

/// The app's language (docs/LOCALIZATION-PLAN.md §4.1): the device's, unless the person picked
/// another one in Settings. A pick is kept on this device and saved to `profiles.locale`
/// (features/settings/language_sheet.dart). Every request says the language as `Accept-Language`:
/// the pick, or in "Device language" mode the device's own, translated here or not, which the
/// server keeps for what bots start themselves.
///
/// This class is the plain, static half, for code with no widget or provider around it (the splash,
/// background wakes, native surfaces, HTTP clients). Widgets watch [appLocaleProvider].
abstract final class AppLanguage {
  static const _key = 'app.locale';
  static Locale? _chosen;

  /// Reads the saved choice and starts sending `Accept-Language`. Every entry point calls this
  /// before its first request: the app's startup and each background isolate.
  static Future<void> preload() async {
    AcceptLanguage.read = acceptLanguage;
    try {
      final saved = (await SharedPreferences.getInstance()).getString(_key);
      _chosen = saved == null ? null : parseTag(saved);
    } catch (_) {
      // No preferences: follow the device.
    }
  }

  /// Saves the choice on this device; null follows the device again.
  static Future<void> choose(Locale? locale) async {
    _chosen = locale;
    try {
      final prefs = await SharedPreferences.getInstance();
      if (locale == null) {
        await prefs.remove(_key);
      } else {
        await prefs.setString(_key, locale.toLanguageTag());
      }
    } catch (_) {}
  }

  @visibleForTesting
  static void debugSet(Locale? locale) => _chosen = locale;

  /// What the person picked, while this build still offers it; null follows the device.
  static Locale? get chosen => offered(_chosen, supported);

  /// [locale] when it's one of [supported]. A language a later build switched off again is ignored.
  static Locale? offered(Locale? locale, List<Locale> supported) => locale != null && supported.contains(locale) ? locale : null;

  /// The pseudo-locale for debug builds and the overflow sweep: accented, longer English in ⟦ ⟧
  /// (scripts/gen-pseudo-locale.mjs). It exists only where that script has made its ARB file.
  static const pseudo = Locale('en', 'XA');

  /// The languages this build shows. Release builds follow the build switch
  /// (l10n/enabled_locales.dart), which can never turn the pseudo-locale on; debug builds offer
  /// every language with an ARB file.
  static final List<Locale> supported = supportedFrom(
    generated: AppLocalizations.supportedLocales,
    enabled: kDebugMode ? null : enabledLocaleCodes,
  );

  /// The [generated] languages that [enabled] switches on (all of them when null). English is
  /// always there and always first, because Flutter falls back to the first one and gen-l10n lists
  /// them alphabetically.
  static List<Locale> supportedFrom({required List<Locale> generated, List<String>? enabled}) {
    const english = Locale('en');
    final wanted = <Locale>{};
    if (enabled == null) {
      wanted.addAll(generated);
    } else {
      for (final code in enabled) {
        final locale = parseTag(code);
        if (locale == null || locale == pseudo) continue;
        // Its own file when it has one (zh-Hant), otherwise its language's (pt for pt-BR).
        final match = generated.contains(locale) ? locale : Locale(locale.languageCode);
        if (generated.contains(match)) wanted.add(match);
      }
    }
    return List.unmodifiable([english, ...wanted.where((l) => l != english)]);
  }

  /// "de", "pt-BR", "zh-Hant-TW" (or with underscores) as a [Locale]; null for anything else.
  static Locale? parseTag(String tag) {
    final m = RegExp(r'^([A-Za-z]{2,3})(?:[-_]([A-Za-z]{4}))?(?:[-_]([A-Za-z]{2}|[0-9]{3}))?$').firstMatch(tag);
    if (m == null) return null;
    final script = m[2];
    return Locale.fromSubtags(
      languageCode: m[1]!.toLowerCase(),
      scriptCode: script == null ? null : '${script[0].toUpperCase()}${script.substring(1).toLowerCase()}',
      countryCode: m[3]?.toUpperCase(),
    );
  }

  /// The language the app shows for this choice and these device languages.
  static Locale resolve({Locale? chosen, required List<Locale> device, required List<Locale> supported}) =>
      offered(chosen, supported) ?? basicLocaleListResolution(device, supported);

  /// The app's strings where there's no widget to ask: notifications, the call's system controls,
  /// the watch, widgets, the island and the tray.
  static AppLocalizations strings() => lookupAppLocalizations(
    resolve(chosen: chosen, device: PlatformDispatcher.instance.locales, supported: supported),
  );

  /// The `Accept-Language` value: the pick, or the device's languages in order. Empty when the
  /// device names none, so no header goes: guessing English would be saved as the person's.
  static String acceptLanguage() => acceptLanguageFor(chosen: chosen, device: PlatformDispatcher.instance.locales);

  static String acceptLanguageFor({Locale? chosen, required List<Locale> device}) {
    // Five languages keep the value short enough for the web to send it without a preflight.
    // "und" and a desktop's "C" locale name no language.
    final named = RegExp(r'^(?!und\b)[a-z]{2,3}(-[A-Za-z0-9]{2,8})*$');
    final tags = chosen != null ? [chosen.toLanguageTag()] : {for (final l in device) l.toLanguageTag()}.where(named.hasMatch).take(5).toList();
    return [
      for (final (i, tag) in tags.indexed) i == 0 ? tag : '$tag;q=${(10 - i) / 10}',
    ].join(',');
  }

  /// Each language's name written in that language, for the picker. Never translated.
  static String nameOf(Locale locale) {
    if (locale == pseudo) return 'Pseudo (en-XA)';
    if (locale.languageCode == 'zh') {
      final traditional = locale.scriptCode == 'Hant' || const {'TW', 'HK', 'MO'}.contains(locale.countryCode);
      return traditional ? '繁體中文' : '简体中文';
    }
    return switch (locale.languageCode) {
      'en' => 'English',
      'es' => 'Español',
      'pt' => 'Português (Brasil)',
      'fr' => 'Français',
      'de' => 'Deutsch',
      'ja' => '日本語',
      'ko' => '한국어',
      'it' => 'Italiano',
      'id' => 'Bahasa Indonesia',
      'tr' => 'Türkçe',
      'vi' => 'Tiếng Việt',
      'ar' => 'العربية',
      'hi' => 'हिन्दी',
      _ => locale.toLanguageTag(),
    };
  }
}

/// The languages this build shows; overridden in tests to try the picker with more than one.
final supportedAppLocalesProvider = Provider<List<Locale>>((ref) => AppLanguage.supported);

/// Whether Settings → Language opens the picker: once more than one language ships, and always in
/// debug builds.
final languagePickerShownProvider = Provider<bool>((ref) => kDebugMode || ref.watch(supportedAppLocalesProvider).length > 1);

/// The language picked on this device; null follows the device. `MaterialApp.locale`.
class AppLocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() => AppLanguage.offered(AppLanguage._chosen, ref.watch(supportedAppLocalesProvider));

  Future<void> set(Locale? locale) async {
    final saving = AppLanguage.choose(locale);
    state = AppLanguage.offered(locale, ref.read(supportedAppLocalesProvider));
    await saving;
  }
}

final appLocaleProvider = NotifierProvider<AppLocaleNotifier, Locale?>(AppLocaleNotifier.new);

/// The device's languages, kept up to date while the app runs.
class DeviceLocalesNotifier extends Notifier<List<Locale>> with WidgetsBindingObserver {
  @override
  List<Locale> build() {
    final WidgetsBinding binding;
    try {
      binding = WidgetsBinding.instance;
    } catch (_) {
      return PlatformDispatcher.instance.locales; // no app running: nothing to listen to
    }
    binding.addObserver(this);
    ref.onDispose(() => binding.removeObserver(this));
    return binding.platformDispatcher.locales;
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales != null && !listEquals(locales, state)) state = locales;
  }
}

final deviceLocalesProvider = NotifierProvider<DeviceLocalesNotifier, List<Locale>>(DeviceLocalesNotifier.new);

/// The app's strings for providers, rebuilt when the language changes.
final appStringsProvider = Provider<AppLocalizations>(
  (ref) => lookupAppLocalizations(
    AppLanguage.resolve(
      chosen: ref.watch(appLocaleProvider),
      device: ref.watch(deviceLocalesProvider),
      supported: ref.watch(supportedAppLocalesProvider),
    ),
  ),
);
