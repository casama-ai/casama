// Pictures of the phone chat header (Call, New Topic and More in one capsule), its bot sheet and
// More menu, and the in-app browser's resting cursor and done card, light and dark, for looking
// at. It runs only when told where to put them:
//
//   CHAT_HEADER_SHOTS=/some/folder flutter test test/chat_header_look_test.dart
import 'dart:io';

import 'package:casama/core/local_cache.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/app_browser/app_browser_controller.dart';
import 'package:casama/features/app_browser/app_browser_screen.dart';
import 'package:casama/features/app_browser/app_browser_service.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/l10n/delegates.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/theme/app_theme.dart';
import 'package:casama/theme/wallpaper.dart';
import 'package:casama/ui/bot_avatar.dart';
import 'package:casama/ui/shell_header.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_browser_fakes.dart';
import 'fake_backend.dart';
import 'fake_unlockers.dart';
import 'support/shots.dart';

/// A bot with a long name, so the pictures show how much of it the header keeps.
class _LookBackend extends FakeBackend {
  @override
  Bot bot({
    BotStatusEnum status = BotStatusEnum.idle,
    String id = botId,
    String name = 'Ada',
    DateTime? createdAt,
  }) => super.bot(
    status: status,
    id: id,
    name: id == botId ? 'Trixie the Travel Planner' : name,
    createdAt: createdAt,
  );
}

Widget _app(
  FakeBackend backend,
  Widget home, {
  required bool dark,
  List<dynamic> overrides = const [],
}) => ShotFrame(
  child: ProviderScope(
    overrides: [
      backendProvider.overrideWithValue(backend),
      localCacheProvider.overrideWithValue(const NoCache()),
      unlockersProvider.overrideWithValue(FakeUnlockers()),
      ...overrides,
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      localizationsDelegates: testLocalizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // The app draws its wallpaper behind every screen (app.dart); screens are see-through.
      builder: (context, child) => Wallpaper(child: child!),
      home: home,
    ),
  ),
);

Future<void> _settle(WidgetTester tester) async {
  for (var i = 0; i < 20; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  final dir = Platform.environment['CHAT_HEADER_SHOTS'];
  for (final dark in [false, true]) {
    final look = dark ? 'dark' : 'light';
    testWidgets('pictures: phone chat header $look', (tester) async {
      await loadAppFonts();
      SharedPreferences.setMockInitialValues({});
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final backend = _LookBackend()
        ..creationList = [
          for (var i = 0; i < 10; i++)
            fakeCreation('c$i', title: 'Trip plan ${i + 1}'),
        ];
      await tester.pumpWidget(
        _app(
          backend,
          const ChatScreen(botId: botId, conversationId: convId),
          dark: dark,
        ),
      );
      await _settle(tester);
      await shot(tester, dir!, 'chat-header-$look');

      await tester.tap(
        find.descendant(
          of: find.byType(ShellHeader),
          matching: find.byType(BotAvatar),
        ),
      );
      await _settle(tester);
      await shot(tester, dir, 'chat-bot-sheet-$look');
      Navigator.of(tester.element(find.byKey(const Key('chatBotSheet')))).pop();
      await _settle(tester);

      await tester.tap(find.byKey(const Key('chatMoreMenu')));
      await _settle(tester);
      await shot(tester, dir, 'chat-more-menu-$look');
    }, skip: dir == null);

    testWidgets('pictures: browser cursor and done card $look', (tester) async {
      await loadAppFonts();
      SharedPreferences.setMockInitialValues({});
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final backend = _LookBackend();
      await tester.pumpWidget(
        _app(
          backend,
          const AppBrowserScreen(),
          dark: dark,
          overrides: appBrowserOverrides(
            channel: FakeAppBrowserChannel(),
            focus: () => convId,
            tokens: MemoryAppBrowserTokenStore(),
            timings: const AppBrowserTimings(),
          ),
        ),
      );
      await _settle(tester);
      final browser = ProviderScope.containerOf(
        tester.element(find.byType(AppBrowserScreen)),
      ).read(appBrowserProvider.notifier);
      final r = await tester.runAsync(
        () => browser.handle(
          browserCall(
            'open',
            args: {'url': 'https://shop.example/'},
            conversation: convId,
          ),
        ),
      );
      expect(r?['ok'], isTrue);
      await _settle(tester);
      await shot(tester, dir!, 'browser-working-$look');

      browser.runOver(convId);
      await _settle(tester);
      await shot(tester, dir, 'browser-done-$look');
      await tester.pumpWidget(const SizedBox());
    }, skip: dir == null);
  }
}
