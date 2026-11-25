import 'package:casama/features/app_browser/app_browser_chat.dart';
import 'package:casama/features/app_browser/app_browser_controller.dart';
import 'package:casama/features/app_browser/app_browser_glow.dart';
import 'package:casama/features/app_browser/app_browser_panel.dart';
import 'package:casama/features/app_browser/app_browser_service.dart'
    show MemoryAppBrowserTokenStore;
import 'package:casama/features/app_browser/app_browser_socket.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama/ui/shell_layout.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_browser_fakes.dart';
import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// The glow around the in-app browser's page while a bot drives it (APP-BROWSER-GLOW-PLAN).
void main() {
  group('appBrowserGlowFor', () {
    const run = AppBrowserRun(
      id: 'r1',
      botId: 'bot1',
      botName: 'Ada',
      conversationId: 'conv1',
    );
    AppBrowserGlow look(
      AppBrowserPhase phase, {
      bool withRun = true,
      bool person = false,
    }) => appBrowserGlowFor(
      AppBrowserSession(
        phase: phase,
        run: withRun ? run : null,
        person: person,
      ),
    );

    test('driving while the bot works', () {
      expect(look(AppBrowserPhase.working), AppBrowserGlow.driving);
    });
    test('waiting while it asks or hands the page over', () {
      expect(look(AppBrowserPhase.asking), AppBrowserGlow.waiting);
      expect(look(AppBrowserPhase.yourTurn), AppBrowserGlow.waiting);
    });
    test('off once the person has the page, or no bot uses it', () {
      expect(look(AppBrowserPhase.tookOver), AppBrowserGlow.off);
      expect(look(AppBrowserPhase.away), AppBrowserGlow.off);
      expect(look(AppBrowserPhase.idle), AppBrowserGlow.off);
      expect(look(AppBrowserPhase.working, withRun: false), AppBrowserGlow.off);
      expect(look(AppBrowserPhase.working, person: true), AppBrowserGlow.off);
    });
  });

  late FakeBackend backend;
  late FakeAppBrowserChannel channel;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    backend = FakeBackend();
    channel = FakeAppBrowserChannel();
  });

  Widget chatWithPanel({bool glowMotion = false}) {
    final Widget child = Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: AppBrowserChatOverlay(
              conversationId: 'conv1',
              layout: LayoutSize.desktop,
              running: true,
            ),
          ),
          SizedBox(
            width: 420,
            child: AppBrowserSidePane(
              botId: 'bot1',
              computer: const SizedBox.expand(key: Key('computer')),
            ),
          ),
        ],
      ),
    );
    return harness(
      backend,
      child,
      overrides: appBrowserOverrides(
        channel: channel,
        focus: () => 'conv1',
        tokens: MemoryAppBrowserTokenStore(),
        timings: const AppBrowserTimings(),
        glowMotion: glowMotion,
      ),
    );
  }

  Future<AppBrowserController> startRun(WidgetTester tester) async {
    final c = ProviderScope.containerOf(
      tester.element(find.byType(AppBrowserChatOverlay)),
    );
    await tester.runAsync(
      () => c.read(chatControllerProvider('bot1').notifier).open('conv1'),
    );
    await tester.pump();
    final browser = c.read(appBrowserProvider.notifier);
    await tester.runAsync(
      () => browser.handle(
        browserCall('open', args: {'url': 'https://shop.example/'}),
      ),
    );
    await tester.pump();
    await tester.pump();
    return browser;
  }

  final glow = find.byKey(const Key('appBrowserGlow'));

  testWidgets(
    'the frame shows while the bot drives, goes on Take Over, and comes back on Hand Back',
    (tester) async {
      await setSize(tester, const Size(1400, 900));
      await tester.pumpWidget(chatWithPanel());
      await tester.pumpAndSettle();
      expect(glow, findsNothing);

      await startRun(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('appBrowserPanel')), findsOneWidget);
      expect(glow, findsOneWidget);
      // The panel's header buttons are all icons with tooltips (no "Stop" label).
      expect(
        tester.widget(find.byKey(const Key('appBrowserStop'))),
        isA<IconButton>(),
      );
      expect(
        tester.widget(find.byKey(const Key('appBrowserTakeOver'))),
        isA<IconButton>(),
      );
      expect(
        find.descendant(
          of: find.byKey(const Key('appBrowserPanel')),
          matching: find.text('Stop'),
        ),
        findsNothing,
      );
      // The page moved in to make room for the frame.
      final page = tester.getRect(find.byKey(const Key('fakeWebArea')));
      final area = tester.getRect(find.byType(AppBrowserDriveGlow));
      expect(page.left - area.left, AppBrowserDriveGlow.margin);
      expect(area.bottom - page.bottom, AppBrowserDriveGlow.margin);
      // The frame takes no touches.
      expect(
        find.ancestor(of: glow, matching: find.byType(IgnorePointer)),
        findsWidgets,
      );

      await tester.tap(find.byKey(const Key('appBrowserTakeOver')));
      await tester.pumpAndSettle();
      expect(glow, findsNothing);
      expect(
        tester.getRect(find.byKey(const Key('fakeWebArea'))),
        tester.getRect(find.byType(AppBrowserDriveGlow)),
      );

      await tester.tap(find.byKey(const Key('appBrowserHandBack')));
      await tester.pumpAndSettle();
      expect(glow, findsOneWidget);

      await tester.tap(find.byKey(const Key('appBrowserStop')));
      await tester.pumpAndSettle();
      expect(glow, findsNothing);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'the wash over the page edge is drawn on iPhone and Android, not on a Mac',
    (tester) async {
      Future<bool> washOn(TargetPlatform platform) async {
        debugDefaultTargetPlatformOverride = platform;
        await setSize(tester, const Size(1400, 900));
        await tester.pumpWidget(chatWithPanel());
        await tester.pumpAndSettle();
        await startRun(tester);
        await tester.pumpAndSettle();
        expect(glow, findsOneWidget);
        final on = find
            .byKey(const Key('appBrowserGlowWash'))
            .evaluate()
            .isNotEmpty;
        await tester.pumpWidget(const SizedBox());
        debugDefaultTargetPlatformOverride = null;
        return on;
      }

      // On a Mac a layer over the page takes the mouse from it.
      expect(await washOn(TargetPlatform.macOS), isFalse);
      expect(await washOn(TargetPlatform.android), isTrue);
    },
  );

  testWidgets(
    'the band keeps moving while driving and stops when the run ends',
    (tester) async {
      await setSize(tester, const Size(1400, 900));
      await tester.pumpWidget(chatWithPanel(glowMotion: true));
      await tester.pumpAndSettle();
      final browser = await startRun(tester);
      await tester.pump(const Duration(milliseconds: 500));
      expect(glow, findsOneWidget);
      // The travelling band asks for frames for as long as the bot drives.
      await tester.pump(const Duration(seconds: 3));
      expect(tester.binding.hasScheduledFrame, isTrue);

      await tester.runAsync(() async => browser.runOver('conv1'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(glow, findsNothing);
      // No ticker left running once the frame is gone.
      expect(tester.binding.hasScheduledFrame, isFalse);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('with Reduce Motion the frame shows but stands still', (
    tester,
  ) async {
    await setSize(tester, const Size(800, 600));
    await tester.pumpWidget(
      harness(
        backend,
        Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(disableAnimations: true),
            child: const AppBrowserDriveGlow(child: SizedBox.expand()),
          ),
        ),
        overrides: appBrowserOverrides(
          channel: channel,
          focus: () => 'conv1',
          tokens: MemoryAppBrowserTokenStore(),
          timings: const AppBrowserTimings(),
          glowMotion: true,
        ),
      ),
    );
    await tester.pumpAndSettle();
    final c = ProviderScope.containerOf(
      tester.element(find.byType(AppBrowserDriveGlow)),
    );
    await tester.runAsync(
      () => c
          .read(appBrowserProvider.notifier)
          .handle(browserCall('open', args: {'url': 'https://shop.example/'})),
    );
    await tester.pump();
    // Settles: nothing repeats.
    await tester.pumpAndSettle();
    expect(c.read(appBrowserProvider).phase, AppBrowserPhase.working);
    expect(glow, findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
