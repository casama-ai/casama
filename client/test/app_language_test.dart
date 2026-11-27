// The app's language (docs/LOCALIZATION-PLAN.md §4.1): which languages a build offers, what each
// request says as Accept-Language, and the picker that saves a pick to the profile.
import 'package:casama/app.dart';
import 'package:casama/core/app_language.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/timeout_http_client.dart';
import 'package:casama/features/settings/settings_screen.dart';
import 'package:casama/l10n/enabled_locales.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

const _en = Locale('en');
const _de = Locale('de');
const _ptBr = Locale('pt', 'BR');
const _zhHant = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');

/// Answers every request itself and keeps the headers it was sent with.
class _Seen extends Interceptor {
  final headers = <Map<String, dynamic>>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    headers.add(Map.of(options.headers));
    handler.resolve(Response(requestOptions: options, statusCode: 200));
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    AppLanguage.debugSet(null);
  });
  tearDown(() {
    AppLanguage.debugSet(null);
    AcceptLanguage.read = null;
  });

  group('the languages a build offers', () {
    // gen-l10n lists them alphabetically.
    const generated = [_de, _en, Locale('pt'), Locale('zh'), _zhHant];

    test('a release build offers English and what the switch turns on', () {
      expect(AppLanguage.supportedFrom(generated: generated, enabled: const ['en']), [_en]);
      expect(AppLanguage.supportedFrom(generated: generated, enabled: const []), [_en]);
      // A tag with a region takes its language's file; a script with its own file takes that one.
      expect(AppLanguage.supportedFrom(generated: generated, enabled: const ['pt-BR', 'zh-Hant']), [_en, const Locale('pt'), _zhHant]);
      // No file yet: not offered.
      expect(AppLanguage.supportedFrom(generated: generated, enabled: const ['ko', 'not a tag']), [_en]);
    });

    test('English comes first, since Flutter falls back to the first', () {
      final all = AppLanguage.supportedFrom(generated: generated);
      expect(all.first, _en);
      expect(all.toSet(), generated.toSet());
      expect(AppLanguage.resolve(device: const [Locale('th')], supported: all), _en);
    });

    test('this build offers English first, then the shipped languages', () {
      // The full list is checked against l10n/locales.json by packages/domain/test/i18n.test.ts.
      expect(enabledLocaleCodes.first, 'en');
      expect(enabledLocaleCodes.toSet().length, enabledLocaleCodes.length);
    });

    test('a pick wins over the device only while the build offers it', () {
      expect(AppLanguage.resolve(chosen: _de, device: const [_en], supported: const [_en, _de]), _de);
      expect(AppLanguage.resolve(chosen: _de, device: const [_en], supported: const [_en]), _en);
      expect(AppLanguage.resolve(device: const [Locale('de', 'AT')], supported: const [_en, _de]), _de);
    });

    test('reads tags', () {
      expect(AppLanguage.parseTag('pt-br'), _ptBr);
      expect(AppLanguage.parseTag('zh_Hant_TW'), const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'));
      expect(AppLanguage.parseTag('es-419'), const Locale('es', '419'));
      expect(AppLanguage.parseTag(''), isNull);
      expect(AppLanguage.parseTag('German'), isNull);
    });
  });

  group('Accept-Language', () {
    test("follows the device, translated here or not, with no English added", () {
      expect(AppLanguage.acceptLanguageFor(device: const [Locale('th', 'TH')]), 'th-TH');
      expect(AppLanguage.acceptLanguageFor(device: const [Locale('de', 'DE'), Locale('de', 'DE'), Locale('fr')]), 'de-DE,fr;q=0.9');
    });

    test('is the pick when there is one', () {
      expect(AppLanguage.acceptLanguageFor(chosen: _ptBr, device: const [Locale('de')]), 'pt-BR');
    });

    test('is nothing when the device names no language', () {
      expect(AppLanguage.acceptLanguageFor(device: const [Locale('und'), Locale('C')]), '');
      AcceptLanguage.read = () => '';
      expect(AcceptLanguage.headers, isEmpty);
    });

    test('stays short enough for the web to send without a preflight', () {
      final value = AppLanguage.acceptLanguageFor(device: [for (var i = 0; i < 20; i++) Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'A${String.fromCharCode(65 + i)}')]);
      expect(value.split(','), hasLength(5));
      expect(value.length, lessThanOrEqualTo(128));
    });

    test('goes with Dio requests, unless one names its own', () async {
      AcceptLanguage.read = () => 'de-DE';
      final seen = _Seen();
      final dio = Dio()..interceptors.addAll([const AcceptLanguageInterceptor(), seen]);
      await dio.get<Object?>('https://api.example.test/v1/config');
      await dio.get<Object?>('https://api.example.test/v1/config', options: Options(headers: {'accept-language': 'fr'}));
      expect(seen.headers[0]['Accept-Language'], 'de-DE');
      expect(seen.headers[1]['accept-language'], 'fr');
      expect(seen.headers[1].containsKey('Accept-Language'), isFalse);
    });

    test('goes with Supabase requests', () async {
      AcceptLanguage.read = () => 'ja-JP';
      String? sent;
      final client = TimeoutHttpClient(
        inner: MockClient((r) async {
          sent = r.headers['Accept-Language'];
          return http.Response('', 200);
        }),
      );
      await client.get(Uri.parse('https://auth.example.test/auth/v1/settings'));
      expect(sent, 'ja-JP');
    });

    test('startup reads the saved pick and starts sending it', () async {
      SharedPreferences.setMockInitialValues({'app.locale': 'en'});
      await AppLanguage.preload();
      expect(AppLanguage.chosen, _en);
      expect(AcceptLanguage.headers, {'Accept-Language': 'en'});
      await AppLanguage.choose(null);
      expect(AppLanguage.chosen, isNull);
      expect((await SharedPreferences.getInstance()).getString('app.locale'), isNull);
    });
  });

  group('Settings → Language', () {
    Future<void> open(WidgetTester tester, FakeBackend backend, {List<dynamic> overrides = const []}) async {
      await setSize(tester, const Size(430, 3200));
      await tester.pumpWidget(harness(backend, const SettingsScreen(), overrides: overrides));
      await tester.pumpAndSettle();
    }

    final row = find.byKey(const Key('settingsLanguage'));
    final two = [supportedAppLocalesProvider.overrideWithValue(const [_en, _de])];

    testWidgets('only shows the current language while there is nothing to pick', (tester) async {
      await open(tester, FakeBackend(), overrides: [languagePickerShownProvider.overrideWithValue(false)]);
      expect(find.descendant(of: row, matching: find.text('English')), findsOneWidget);
      await tester.tap(row);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('language-')), findsNothing);
    });

    testWidgets('saves a pick, and null for the device language; nothing else writes it', (tester) async {
      final backend = FakeBackend();
      await open(tester, backend, overrides: two);
      expect(backend.savedLocales, isEmpty);

      await tester.tap(row);
      await tester.pumpAndSettle();
      expect(find.text('Device language'), findsOneWidget);
      expect(find.text('Deutsch'), findsOneWidget);
      await tester.tap(find.byKey(const Key('language-de')));
      await tester.pumpAndSettle();
      expect(backend.savedLocales, ['de']);
      expect(AppLanguage.acceptLanguageFor(chosen: _de, device: const [_en]), 'de');
      expect((await SharedPreferences.getInstance()).getString('app.locale'), 'de');

      await tester.tap(row);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('language-')));
      await tester.pumpAndSettle();
      expect(backend.savedLocales, ['de', null]);
      expect((await SharedPreferences.getInstance()).getString('app.locale'), isNull);
    });

    testWidgets('picking the same one again saves it again after a save that failed', (tester) async {
      final backend = FakeBackend()..localeSaveFails = true;
      await open(tester, backend, overrides: two);
      await tester.tap(row);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('language-de')));
      await tester.pumpAndSettle();
      // The app follows the pick even offline.
      expect((await SharedPreferences.getInstance()).getString('app.locale'), 'de');
      expect(backend.savedLocales, isEmpty);

      backend.localeSaveFails = false;
      await tester.tap(row);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('language-de')));
      await tester.pumpAndSettle();
      expect(backend.savedLocales, ['de']);
      await tester.pump(const Duration(seconds: 10)); // the failure's toast
      await tester.pumpAndSettle();
    });
  });

  testWidgets('the app takes its locale and languages from the providers, and saves nothing by itself', (tester) async {
    await setSize(tester, const Size(390, 844));
    // English, the only language with a file so far.
    AppLanguage.debugSet(_en);
    final backend = FakeBackend();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          backendProvider.overrideWithValue(backend),
          supportedAppLocalesProvider.overrideWithValue(const [_en]),
        ],
        child: const CasamaApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.locale, _en);
    expect(app.supportedLocales, const [_en]);
    // Signing in with a saved pick doesn't write the profile: only picking does.
    expect(backend.savedLocales, isEmpty);
  });
}
