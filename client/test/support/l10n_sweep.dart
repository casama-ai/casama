// The machinery of the pseudo-locale sweep (test/l10n_sweep_test.dart,
// docs/LOCALIZATION-PLAN.md §5.6 and §5.8): draws a screen in en-XA on a small phone, and collects
// the layouts that overflow and the words that don't come from the translations.
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:casama/core/app_language.dart';
import 'package:casama/core/local_cache.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/l10n/delegates.dart';
import 'package:casama/theme/app_theme.dart';
import 'package:casama/theme/bundled_font_loader.dart';
import 'package:casama/ui/mascot.dart';
import 'package:casama/ui/text_scale.dart';
import 'package:flutter/foundation.dart' show FlutterExceptionHandler;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../fake_backend.dart';
import '../fake_unlockers.dart';
import 'shots.dart';

/// A common small phone, in logical pixels, with its status bar and home indicator.
const sweepPhone = Size(360, 780);
const _pixelRatio = 3.0;
const _safeArea = FakeViewPadding(top: 24 * _pixelRatio, bottom: 24 * _pixelRatio);

/// The app's own fonts, so a line is as wide here as on a phone.
Future<void> loadSweepFonts() async {
  await loadAppFonts();
  for (final MapEntry(key: family, value: files) in lazyBundledFonts.entries) {
    final loader = FontLoader(family);
    for (final file in files) {
      loader.addFont(rootBundle.load(file));
    }
    await loader.load();
  }
}

/// Words no translation changes: brands, vendors, and the made-up data the fakes answer with.
/// Each screen adds its own data. Keep it to data: an app's own words never go here.
const sweepData = [
  // Brands and products.
  'Casama Cloud', 'Casama Link', 'Casama', 'Apple', 'Google Play', 'Google Gemini', 'Google', 'OpenRouter', 'OpenAI', 'Anthropic', 'ChatGPT', 'Brave Search', 'Telegram', 'Notion', 'xAI',
  // test/fake_backend.dart.
  'Test Org', 'Test Person', 'tester@example.com', 'Ada',
];

/// Text that is data by its shape: addresses, prices, and the dates and times `intl` formats (a
/// real language gets its own; the pseudo-locale borrows English's).
final _dataShapes = [
  RegExp(r'https?://\S+'),
  RegExp(r'[\w.+-]+@[\w-]+(\.[\w-]+)+'),
  RegExp(r'[$€£]\s?\d[\d.,]*(/\w+)?'),
  RegExp(r'\b(Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|June?|July?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)\.? \d{1,4}\b'),
  RegExp(r'\b(Mon|Tue|Wed|Thu|Fri|Sat|Sun)(day|sday|nesday|rsday|urday)?\b'),
  RegExp(r'\b\d{1,2}(:\d{2})?\s?(AM|PM)\b'),
];

final _letter = RegExp(r'\p{L}', unicode: true);
final _wholePseudo = RegExp('⟦[^⟦⟧]*⟧');

/// Whether [text], as shown, has words that didn't come from the translations: letters outside
/// every ⟦ ⟧ that aren't [data].
bool hasUnlocalizedWords(String text, List<String> data) {
  var rest = text;
  while (_wholePseudo.hasMatch(rest)) {
    rest = rest.replaceAll(_wholePseudo, ' ');
  }
  // A translated string shown in two pieces: its first half opens, its second closes.
  rest = rest.replaceFirst(RegExp(r'⟦[^⟦⟧]*$'), ' ').replaceFirst(RegExp(r'^[^⟦⟧]*⟧'), ' ');
  // Initials in an avatar.
  if (RegExp(r'^\s*\p{Lu}{1,2}\s*$', unicode: true).hasMatch(rest) && rest == text) return false;
  for (final shape in _dataShapes) {
    rest = rest.replaceAll(shape, ' ');
  }
  // Longest first, so "Casama Cloud" goes before "Casama".
  for (final word in [...data]..sort((a, b) => b.length - a.length)) {
    rest = rest.replaceAll(word, ' ');
  }
  return _letter.hasMatch(rest);
}

/// Icon fonts draw with private-use characters; they aren't words.
String _withoutIcons(String text) => String.fromCharCodes(text.runes.where((r) => !(r >= 0xE000 && r <= 0xF8FF) && r < 0xF0000));

/// The owner console's strings: never translated, so they show in English by design
/// (LOCALIZATION-PLAN §4.1) where the owner sees them in the app.
final _ownerOnly = {
  for (final MapEntry(:key, :value) in (jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync()) as Map<String, dynamic>).entries)
    if (key.startsWith('admin') && value is String) value,
};

/// One screen at one text scale.
class Sweep {
  Sweep(this.tester, this.scale, {this.data = const []});

  final WidgetTester tester;
  final double scale;

  /// This screen's own made-up data, on top of [sweepData].
  final List<String> data;

  /// Words on screen that aren't from the translations.
  final unlocalized = <String>{};

  /// Layouts that overflowed: "file Widget>RenderedWidget side" → what Flutter said, and where.
  final overflows = <String, String>{};

  FlutterExceptionHandler? _fail;

  var _looks = 0;
  var _seen = 0;

  /// The phone: size, safe area, text size and the pseudo-locale as the device's language.
  void phone() {
    tester.view.physicalSize = sweepPhone * _pixelRatio;
    tester.view.devicePixelRatio = _pixelRatio;
    tester.view.padding = _safeArea;
    tester.view.viewPadding = _safeArea;
    tester.platformDispatcher.textScaleFactorTestValue = scale;
    tester.platformDispatcher.localeTestValue = AppLanguage.pseudo;
    tester.platformDispatcher.localesTestValue = [AppLanguage.pseudo];
    // The microphone, which the wake word asks for as Settings draws.
    const recorder = MethodChannel('com.llfbandit.record/messages');
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(recorder, (_) async => null);
    addTearDown(() => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(recorder, null));
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearAllTestValues);
  }

  /// Shows [screen] the way the app would, in the pseudo-locale. Up to the app's largest text size
  /// ([kMaxTextScale]) it is limited as the app limits it; above that the limit is left off, to
  /// show how much room is left.
  Future<void> open(Widget screen, {FakeBackend? backend, List<dynamic> overrides = const []}) async {
    final router = GoRouter(
      routes: [GoRoute(path: '/', builder: (_, _) => screen)],
      errorBuilder: (_, _) => const SizedBox.shrink(),
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          backendProvider.overrideWithValue(backend ?? FakeBackend()),
          localCacheProvider.overrideWithValue(const NoCache()),
          unlockersProvider.overrideWithValue(FakeUnlockers()),
          ...overrides,
        ],
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          locale: AppLanguage.chosen ?? AppLanguage.pseudo,
          localizationsDelegates: appLocalizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: scale <= kMaxTextScale ? limitTextScale : null,
        ),
      ),
    );
    await settle();
  }

  /// Steps time forward: many screens never settle (moving mascots), so a fixed run of frames.
  Future<void> settle([int frames = 8]) async {
    for (var i = 0; i < frames; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 2)));
      await tester.pump(const Duration(milliseconds: 250));
    }
  }

  /// Taps [target], scrolling it into view first.
  Future<void> tap(Finder target) async {
    await tester.ensureVisible(target);
    await tester.pump();
    await tester.tap(target);
    await settle();
  }

  /// Reads what is on screen now.
  void look() {
    _looks++;
    for (final element in find.byType(RichText).evaluate()) {
      final render = element.renderObject;
      if (render is RenderParagraph) _read(render.text.toPlainText(includeSemanticsLabels: false, includePlaceholders: false));
    }
    // Text that can be selected is drawn by a read-only text field.
    for (final field in tester.widgetList<EditableText>(find.byType(EditableText))) {
      if (field.readOnly) _read(field.controller.text);
    }
    // Shown on a long press or hover.
    for (final element in find.byType(Tooltip).evaluate()) {
      final tip = element.widget as Tooltip;
      final message = tip.message ?? tip.richMessage?.toPlainText() ?? '';
      // Flutter's own buttons (Back, Close), which it translates itself.
      final flutter = MaterialLocalizations.of(element);
      if (message == flutter.backButtonTooltip || message == flutter.closeButtonTooltip) continue;
      _read(message);
    }
  }

  void _read(String raw) {
    final text = _withoutIcons(raw).replaceAll(RegExp(r'\s+'), ' ').trim();
    if (text.isEmpty) return;
    _seen++;
    // Each language is named in its own language, in the picker and beside it.
    final languages = [for (final locale in AppLanguage.supported) AppLanguage.nameOf(locale)];
    if (_ownerOnly.contains(text) || !hasUnlocalizedWords(text, [...sweepData, ...languages, ...data])) return;
    // A new bot gets a random mascot, so which names are on screen differs from run to run.
    if (Mascot.values.any((m) => m.label == text)) {
      unlocalized.add(_mascotNames);
      return;
    }
    unlocalized.add(text.length <= 120 ? text : '${text.substring(0, 119)}…');
  }

  static const _mascotNames = 'Mascot names, in English (lib/ui/mascot.dart)';

  /// Reads the screen, then scrolls every list and carousel on it to its end, reading on the way:
  /// what isn't drawn can't overflow or be read.
  Future<void> scrollThrough() async {
    look();
    for (final list in tester.stateList<ScrollableState>(find.byType(Scrollable)).toList()) {
      if (!list.mounted) continue;
      final position = list.position;
      if (!position.hasContentDimensions || !position.hasPixels || position.maxScrollExtent <= position.minScrollExtent) continue;
      final start = position.pixels;
      for (var i = 0; i < 80 && list.mounted && position.pixels < position.maxScrollExtent; i++) {
        position.jumpTo(math.min(position.pixels + position.viewportDimension * 0.7, position.maxScrollExtent));
        await tester.pump(const Duration(milliseconds: 100));
        look();
      }
      if (!list.mounted) continue;
      position.jumpTo(start);
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  /// Runs [body] while collecting what Flutter reports, then takes the screen down.
  Future<void> run(Future<void> Function() body) async {
    final before = _fail = FlutterError.onError;
    FlutterError.onError = _report;
    try {
      await body();
      // Close what it opened: a sheet torn down mid-air leaves its frame-rate request behind.
      if (find.byType(Navigator).evaluate().isNotEmpty) {
        tester.state<NavigatorState>(find.byType(Navigator).first).popUntil((route) => route.isFirst);
        await settle();
      }
      // Take it down and let its timers (toasts, resend countdowns) run out.
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(minutes: 2));
    } finally {
      FlutterError.onError = before;
    }
    // A screen that drew nothing would pass for clean.
    expect(_looks, greaterThan(0), reason: 'the sweep never looked at the screen');
    expect(_seen, greaterThan(0), reason: 'the sweep found no text on the screen');
  }

  void _report(FlutterErrorDetails details) {
    final message = details.exceptionAsString();
    // Widget tests have no plugins behind them; screens listen to their events anyway.
    if (details.exception is MissingPluginException && details.library == 'services library') return;
    // Anything but an overflow fails the test, as it would without the sweep.
    if (!message.contains('overflowed by')) return _fail?.call(details);
    final side = RegExp(r'on the (\w+)').firstMatch(message)?.group(1) ?? 'side';
    Element? element;
    for (final node in details.informationCollector?.call() ?? const <DiagnosticsNode>[]) {
      final value = node.value;
      if (value is DebugCreator) element = value.element;
    }
    final (key, line) = element == null ? ('unknown', '') : _where(element);
    overflows.putIfAbsent('$key $side', () => '${message.split('\n').first}$line');
  }

  /// The widget of this project an overflow came from: "lib/….dart Widget", with its line.
  (String, String) _where(Element element) {
    final inner = element.widget.runtimeType.toString();
    (String, String)? found;
    bool ours(Element e) {
      final json = e.toDiagnosticsNode().toJsonMap(InspectorSerializationDelegate(service: WidgetInspectorService.instance));
      final location = json['creationLocation'];
      if (location is! Map) return false;
      final file = location['file'] as String? ?? '';
      final root = Directory.current.uri.toString();
      if (!file.startsWith(root)) return false;
      final name = e.widget.runtimeType.toString();
      found = ('${file.substring(root.length)} ${name == inner ? name : '$name>$inner'}', ' (line ${location['line']})');
      return true;
    }

    if (!ours(element)) element.visitAncestorElements((e) => !ours(e));
    return found ?? ('framework $inner', '');
  }
}

/// What the sweep found when it was last accepted: one line per finding,
/// `screen ⇥ scale ⇥ overflow|text ⇥ what`.
class SweepBaseline {
  SweepBaseline(this.path);
  final String path;

  static String prefix(String screen, double scale) => '$screen\t$scale\t';

  Set<String> _lines() => File(path).existsSync() ? File(path).readAsLinesSync().where((l) => l.isNotEmpty && !l.startsWith('#')).toSet() : {};

  Set<String> of(String screen, double scale) => {
    for (final l in _lines())
      if (l.startsWith(prefix(screen, scale))) l.substring(prefix(screen, scale).length),
  };

  static Set<String> findings(Sweep sweep) => {
    for (final key in sweep.overflows.keys) 'overflow\t$key',
    for (final text in sweep.unlocalized) 'text\t$text',
  };

  /// Replaces one screen's lines at one scale and rewrites the counts at the top.
  void update(String screen, double scale, Set<String> found) {
    final lines = [
      ..._lines().where((l) => !l.startsWith(prefix(screen, scale))),
      for (final f in found) '${prefix(screen, scale)}$f',
    ]..sort();
    final counts = <String, (int, int)>{};
    for (final line in lines) {
      final [name, at, kind, ...] = line.split('\t');
      final (o, t) = counts['$name @ ${at}x'] ?? (0, 0);
      counts['$name @ ${at}x'] = kind == 'overflow' ? (o + 1, t) : (o, t + 1);
    }
    File(path).writeAsStringSync(
      [
        '# What the pseudo-locale sweep finds today (test/l10n_sweep_test.dart). Only ever shorter:',
        '# fix a finding, then run `scripts/l10n-sweep.sh --update`.',
        '#',
        '# Per screen and text scale: overflows / texts that are not localized.',
        for (final MapEntry(:key, :value) in counts.entries) '#   $key: ${value.$1} / ${value.$2}',
        '#',
        '# One finding per line: screen, scale, "overflow" or "text", and what, tab-separated.',
        ...lines,
        '',
      ].join('\n'),
    );
  }
}
