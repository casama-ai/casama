import 'package:casama/core/providers.dart';
import 'package:casama/features/inbox/for_you.dart';
import 'package:casama/features/inbox/inbox_screen.dart';
import 'package:casama/l10n/delegates.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/theme/app_theme.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_backend.dart';

Suggestion _suggestion({
  required String id,
  String bot = botId,
  String title = 'Idea',
  SuggestionKind kind = SuggestionKind.do_,
  String? label,
  List<String>? choices,
  String? url,
  DateTime? remindAt,
  SuggestionUrgencyEnum urgency = SuggestionUrgencyEnum.normal,
}) => Suggestion(
  id: id,
  botId: bot,
  title: title,
  bodyMd: 'Details for $title',
  kind: kind,
  label: label,
  choices: choices,
  url: url,
  remindAt: remindAt,
  proposedAction: null,
  sources: const [],
  urgency: urgency,
  expiresAt: DateTime.now().add(const Duration(hours: 36)),
  createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
);

Widget _wrap(FakeBackend backend, Widget child) => ProviderScope(
  overrides: [backendProvider.overrideWithValue(backend)],
  child: MaterialApp(
    theme: AppTheme.light(),
    localizationsDelegates: appLocalizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: child,
  ),
);

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('SuggestionCard renders custom label + Later for do kind', (tester) async {
    final backend = FakeBackend();
    final s = _suggestion(id: 's-do', title: 'Book a ride', kind: SuggestionKind.do_, label: 'Book it');
    await tester.pumpWidget(_wrap(
      backend,
      Scaffold(body: SingleChildScrollView(child: SuggestionCard(s: s, botName: 'Ada'))),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Book it'), findsOneWidget);
    expect(find.text('Later'), findsOneWidget);
    expect(find.byKey(const Key('dismiss-s-do')), findsOneWidget);

    await tester.tap(find.byKey(const Key('later-s-do')));
    await tester.pumpAndSettle();
    expect(backend.suggestionActions, contains('snooze:s-do'));
  });

  testWidgets('SuggestionCard renders choices + Something else for answer kind', (tester) async {
    final backend = FakeBackend();
    final s = _suggestion(
      id: 's-ans',
      title: 'Window or aisle?',
      kind: SuggestionKind.answer,
      choices: const ['Window', 'Aisle'],
    );
    await tester.pumpWidget(_wrap(
      backend,
      Scaffold(body: SingleChildScrollView(child: SuggestionCard(s: s, botName: 'Ada'))),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Window'), findsOneWidget);
    expect(find.text('Aisle'), findsOneWidget);
    expect(find.text('Something else'), findsOneWidget);

    await tester.tap(find.byKey(const Key('choice-s-ans-0')));
    await tester.pumpAndSettle();
    expect(backend.suggestionActions, contains('accept:s-ans:choice=Window'));
  });

  testWidgets('SuggestionCard renders Turn on for turn_on kind', (tester) async {
    final backend = FakeBackend();
    final s = _suggestion(id: 's-on', title: 'Daily flight check', kind: SuggestionKind.turnOn);
    await tester.pumpWidget(_wrap(
      backend,
      Scaffold(body: SingleChildScrollView(child: SuggestionCard(s: s, botName: 'Ada'))),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Turn on'), findsOneWidget);
    expect(find.text('Later'), findsOneWidget);
  });

  testWidgets('SuggestionCard renders Remind me + Pick a time for remind kind', (tester) async {
    final backend = FakeBackend();
    final when = DateTime.now().add(const Duration(days: 2));
    final s = _suggestion(id: 's-rem', title: 'Renew passport', kind: SuggestionKind.remind, remindAt: when);
    await tester.pumpWidget(_wrap(
      backend,
      Scaffold(body: SingleChildScrollView(child: SuggestionCard(s: s, botName: 'Ada'))),
    ));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('accept-s-rem')), findsOneWidget);
    expect(find.text('Pick a time'), findsOneWidget);
  });

  testWidgets('SuggestionCard renders Open + Got it for look kind and calls doneSuggestion', (tester) async {
    final backend = FakeBackend();
    final s = _suggestion(
      id: 's-look',
      title: 'Package delivered',
      kind: SuggestionKind.look,
      url: 'https://example.com/track',
    );
    await tester.pumpWidget(_wrap(
      backend,
      Scaffold(body: SingleChildScrollView(child: SuggestionCard(s: s, botName: 'Ada'))),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Open'), findsOneWidget);
    expect(find.text('Got it'), findsOneWidget);

    await tester.tap(find.byKey(const Key('gotIt-s-look')));
    await tester.pumpAndSettle();
    expect(backend.suggestionActions, contains('done:s-look'));
  });

  testWidgets('InboxScreen groups > 2 ideas per bot and puts look items in Updates', (tester) async {
    final backend = FakeBackend()
      ..forYouOverride = ForYou(
        briefs: const [],
        approvals: const [],
        suggestions: [
          _suggestion(id: 's1', title: 'Idea 1'),
          _suggestion(id: 's2', title: 'Idea 2'),
          _suggestion(id: 's3', title: 'Idea 3'),
          _suggestion(id: 's-look', title: 'FYI delivery', kind: SuggestionKind.look),
        ],
      );
    await tester.pumpWidget(_wrap(
      backend,
      const InboxScreen(initialFilter: InboxFilter.all),
    ));
    await tester.pumpAndSettle();

    // 3 ideas from same bot collapse into one grouped card.
    expect(find.byKey(const Key('botIdeasGroup-$botId')), findsOneWidget);
    // Look suggestion shows in Updates section.
    expect(find.text('FYI delivery'), findsOneWidget);
    expect(find.text('Got it'), findsOneWidget);

    // Expanding the grouped card reveals the 3 ideas in place.
    await tester.tap(find.byKey(const Key('botIdeasGroup-$botId')));
    await tester.pumpAndSettle();
    expect(find.text('Idea 1'), findsOneWidget);
    expect(find.text('Idea 2'), findsOneWidget);
    expect(find.text('Idea 3'), findsOneWidget);
  });
}
