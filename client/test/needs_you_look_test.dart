// Pictures of the Needs you list (every kind of card), light and dark, for looking at. It runs
// only when told where to put them:
//
//   NEEDS_YOU_SHOTS=/some/folder flutter test test/needs_you_look_test.dart
import 'dart:io';

import 'package:casama/core/local_cache.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/inbox/inbox_screen.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/theme/app_theme.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_backend.dart';
import 'fake_unlockers.dart';
import 'inbox_feed_test.dart' show busyBackend;
import 'support/shots.dart';
import 'package:casama/l10n/delegates.dart';

/// [busyBackend] with two suggestions: an everyday one with days left, and an urgent one about
/// to run out.
class _LookBackend extends FakeBackend {
  @override
  Future<ForYou> forYou(String orgId) async {
    final now = DateTime.now();
    return ForYou(
      briefs: const [],
      suggestions: [
        Suggestion(
          id: 's1',
          botId: botId,
          title: 'Reply to Ana about Friday',
          pushText: 'Ana asked twice whether Friday still works. Want me to draft a yes?',
          bodyMd: 'She wrote on Monday and again this morning.',
          proposedAction: null,
          sources: const [],
          urgency: SuggestionUrgencyEnum.urgent,
          expiresAt: now.add(const Duration(hours: 3, minutes: 10)),
          createdAt: now.subtract(const Duration(minutes: 40)),
        ),
        Suggestion(
          id: 's2',
          botId: botId,
          title: 'Tidy the shared drive',
          bodyMd: 'Twelve files named "Untitled" were added this week.',
          proposedAction: null,
          sources: const [],
          urgency: SuggestionUrgencyEnum.normal,
          expiresAt: now.add(const Duration(days: 2)),
          createdAt: now.subtract(const Duration(hours: 5)),
        ),
      ],
      approvals: const [],
    );
  }
}

void main() {
  final dir = Platform.environment['NEEDS_YOU_SHOTS'];
  for (final dark in [false, true]) {
    testWidgets('pictures: Needs you ${dark ? 'dark' : 'light'}', (
      tester,
    ) async {
      await loadAppFonts();
      SharedPreferences.setMockInitialValues({});
      tester.view.physicalSize = const Size(390, 2400);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final base = busyBackend();
      final backend = _LookBackend()
        ..openTakeovers = base.openTakeovers
        ..proposals.addAll(base.proposals);
      await tester.pumpWidget(
        ShotFrame(
          child: ProviderScope(
            overrides: [
              backendProvider.overrideWithValue(backend),
              localCacheProvider.overrideWithValue(const NoCache()),
              unlockersProvider.overrideWithValue(FakeUnlockers()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light(),
              darkTheme: AppTheme.dark(),
              themeMode: dark ? ThemeMode.dark : ThemeMode.light,
              localizationsDelegates: testLocalizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const InboxScreen(initialFilter: InboxFilter.needsYou),
            ),
          ),
        ),
      );
      for (var i = 0; i < 20; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await shot(tester, dir!, 'needs-you-${dark ? 'dark' : 'light'}');
    }, skip: dir == null);
  }
}
