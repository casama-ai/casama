// Windows and Linux take the Mac menu bar's File and Go shortcuts with Ctrl (the customer's build
// 108 round, L11): he tried Ctrl+N and Ctrl+1…5 on Windows and nothing happened.
import 'package:casama/core/providers.dart';
import 'package:casama/core/router.dart' show routerProvider;
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/l10n/delegates.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/core/local_cache.dart';
import 'package:casama/features/home/home_shell.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';
import 'fake_unlockers.dart';

void main() {
  GoRouter shellRouter() => GoRouter(
    initialLocation: '/settings/privacy',
    routes: [
      GoRoute(
        path: '/settings/privacy',
        builder: (_, _) => const HomeShell(
          location: '/settings/privacy',
          child: Text('screen'),
        ),
      ),
      for (final p in ['/bots', '/inbox', '/tasks', '/computer', '/pages'])
        GoRoute(path: p, builder: (_, s) => Text('at ${s.uri}')),
      GoRoute(
        path: '/bots/:id/chat',
        builder: (_, s) => Text('chat ${s.pathParameters['id']}'),
      ),
    ],
  );

  Future<GoRouter> open(WidgetTester tester, TargetPlatform platform) async {
    debugDefaultTargetPlatformOverride = platform;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    await setSize(tester, const Size(1400, 900));
    final router = shellRouter();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          backendProvider.overrideWithValue(FakeBackend()),
          localCacheProvider.overrideWithValue(const NoCache()),
          unlockersProvider.overrideWithValue(FakeUnlockers()),
          routerProvider.overrideWithValue(router),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: testLocalizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pumpAndSettle();
    return router;
  }

  Future<void> ctrl(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    await tester.sendKeyEvent(key);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
    await tester.pumpAndSettle();
  }

  for (final platform in [TargetPlatform.windows, TargetPlatform.linux]) {
    testWidgets('Ctrl+2 opens Needs you on ${platform.name}', (tester) async {
      await open(tester, platform);
      await ctrl(tester, LogicalKeyboardKey.digit2);
      expect(find.text('at /inbox?tab=0'), findsOneWidget);
    });
  }

  testWidgets('Ctrl+N starts a chat with a bot on Windows', (tester) async {
    await open(tester, TargetPlatform.windows);
    await ctrl(tester, LogicalKeyboardKey.keyN);
    expect(find.text('chat $botId'), findsOneWidget);
  });

  testWidgets(
    'the Mac leaves Ctrl+digits alone: its menu bar has the Cmd versions',
    (tester) async {
      await open(tester, TargetPlatform.macOS);
      await ctrl(tester, LogicalKeyboardKey.digit2);
      expect(find.text('screen'), findsOneWidget);
    },
  );
}
