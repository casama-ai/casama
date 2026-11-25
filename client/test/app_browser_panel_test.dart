import 'package:casama/features/app_browser/app_browser_chat.dart';
import 'package:casama/features/app_browser/app_browser_controller.dart';
import 'package:casama/features/app_browser/app_browser_panel.dart';
import 'package:casama/features/app_browser/app_browser_service.dart'
    show MemoryAppBrowserTokenStore;
import 'package:casama/features/app_browser/app_browser_view.dart';
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

/// The in-app browser in the side panel on wide windows (APP-BROWSER-PANEL-PLAN): the panel shows
/// the page while a bot from this chat uses it, the chat's floating card steps aside, "Show
/// computer" goes back to the computer until the next page, and the run ending brings the computer
/// back.
void main() {
  late FakeBackend backend;
  late FakeAppBrowserChannel channel;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    backend = FakeBackend();
    channel = FakeAppBrowserChannel();
  });

  const computer = SizedBox.expand(key: Key('computer'));

  /// The chat and the panel beside it, as the wide shell lays them out.
  Widget chatWithPanel({bool panelOpen = true}) => harness(
    backend,
    Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: AppBrowserChatOverlay(
              conversationId: 'conv1',
              layout: LayoutSize.desktop,
              running: true,
            ),
          ),
          if (panelOpen)
            const SizedBox(
              width: 420,
              child: AppBrowserSidePane(botId: 'bot1', computer: computer),
            ),
        ],
      ),
    ),
    overrides: appBrowserOverrides(
      channel: channel,
      focus: () => 'conv1',
      tokens: MemoryAppBrowserTokenStore(),
      timings: const AppBrowserTimings(),
    ),
  );

  Future<AppBrowserController> openChat(WidgetTester tester) async {
    final c = ProviderScope.containerOf(
      tester.element(find.byType(AppBrowserChatOverlay)),
    );
    await tester.runAsync(
      () => c.read(chatControllerProvider('bot1').notifier).open('conv1'),
    );
    await tester.pump();
    return c.read(appBrowserProvider.notifier);
  }

  testWidgets(
    'the panel shows the page during a run from this chat, and the computer after',
    (tester) async {
      await setSize(tester, const Size(1400, 900));
      await tester.pumpWidget(chatWithPanel());
      await tester.pumpAndSettle();
      final browser = await openChat(tester);
      expect(find.byKey(const Key('computer')), findsOneWidget);
      expect(find.byKey(const Key('appBrowserPanel')), findsNothing);

      await tester.runAsync(
        () => browser.handle(
          browserCall('open', args: {'url': 'https://shop.example/'}),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const Key('appBrowserPanel')), findsOneWidget);
      expect(find.byKey(const Key('computer')), findsNothing);
      expect(find.byKey(const Key('fakeWebArea')), findsOneWidget);
      expect(find.text('shop.example'), findsOneWidget);
      expect(find.text('Ada is working'), findsOneWidget);
      // The page is in the panel, so no floating card over the chat.
      expect(find.byKey(const Key('appBrowserTile')), findsNothing);

      // Dragging the panel's edge shows a picture of the page in its place, then the page again.
      final c = ProviderScope.containerOf(
        tester.element(find.byType(AppBrowserChatOverlay)),
      );
      c.read(sidePanelDraggingProvider.notifier).set(true);
      await tester.pump();
      expect(find.byKey(const Key('appBrowserFrozen')), findsOneWidget);
      expect(find.byKey(const Key('fakeWebArea')), findsNothing);
      c.read(sidePanelDraggingProvider.notifier).set(false);
      await tester.pump();
      expect(find.byKey(const Key('appBrowserFrozen')), findsNothing);
      expect(find.byKey(const Key('fakeWebArea')), findsOneWidget);

      // Take Over and Hand Back from the panel's header.
      await tester.tap(find.byKey(const Key('appBrowserTakeOver')));
      await tester.pump();
      expect(find.byKey(const Key('appBrowserPausedBanner')), findsOneWidget);
      await tester.tap(find.byKey(const Key('appBrowserHandBack')));
      await tester.pump();
      expect(find.byKey(const Key('appBrowserTakeOver')), findsOneWidget);

      // Stop ends the run: back to the computer.
      await tester.tap(find.byKey(const Key('appBrowserStop')));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const Key('appBrowserPanel')), findsNothing);
      expect(find.byKey(const Key('computer')), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    '"Show computer" holds until the next page; the run ending goes back too',
    (tester) async {
      await setSize(tester, const Size(1400, 900));
      await tester.pumpWidget(chatWithPanel());
      await tester.pumpAndSettle();
      final browser = await openChat(tester);
      await tester.runAsync(
        () => browser.handle(
          browserCall('open', args: {'url': 'https://shop.example/'}),
        ),
      );
      await tester.pump();
      await tester.pump();

      await tester.tap(find.byKey(const Key('appBrowserPanelComputer')));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const Key('computer')), findsOneWidget);
      expect(find.byKey(const Key('appBrowserPanel')), findsNothing);
      // With the page out of the panel, the floating card comes back.
      expect(find.byKey(const Key('appBrowserTile')), findsOneWidget);

      // One tap back to the page.
      await tester.tap(find.byKey(const Key('appBrowserPanelBack')));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const Key('appBrowserPanel')), findsOneWidget);

      // Chosen again, then the bot moves on to another page: the panel follows it.
      await tester.tap(find.byKey(const Key('appBrowserPanelComputer')));
      await tester.pump();
      expect(find.byKey(const Key('computer')), findsOneWidget);
      await tester.runAsync(
        () => browser.handle(
          browserCall('open', args: {'url': 'https://shop.example/cart'}),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const Key('appBrowserPanel')), findsOneWidget);

      // The run ends: the computer, with no way "back" to a page nobody uses.
      await tester.runAsync(() async => browser.runOver('conv1'));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const Key('computer')), findsOneWidget);
      expect(find.byKey(const Key('appBrowserPanelBack')), findsNothing);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'a hand-over keeps the page and Hand Back in the panel for as long as the run waits (D-571)',
    (tester) async {
      await setSize(tester, const Size(1400, 900));
      await tester.pumpWidget(chatWithPanel());
      await tester.pumpAndSettle();
      final browser = await openChat(tester);
      await tester.runAsync(
        () => browser.handle(
          browserCall('open', args: {'url': 'https://shop.example/'}),
        ),
      );
      await tester.pump();
      // The person was looking at the computer when the bot handed the page over.
      await tester.tap(find.byKey(const Key('appBrowserPanelComputer')));
      await tester.pump();
      expect(find.byKey(const Key('computer')), findsOneWidget);

      await tester.runAsync(
        () => browser.handle(
          browserCall('handoff', args: {'reason': 'Pick your seat'}),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const Key('appBrowserPanel')), findsOneWidget);
      expect(find.text('Pick your seat'), findsWidgets);
      expect(find.byKey(const Key('appBrowserHandBackBanner')), findsOneWidget);

      // The run's call waits on the page until Hand Back; the panel stays on the page meanwhile.
      var answer = <String, Object?>{};
      late Future<void> held;
      await tester.runAsync(() async {
        held = browser.handle(browserCall('url')).then((r) => answer = r);
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });
      await tester.pump();
      expect(answer, isEmpty);
      expect(find.byKey(const Key('appBrowserPanel')), findsOneWidget);

      await tester.tap(find.byKey(const Key('appBrowserHandBackBanner')));
      await tester.pump();
      await tester.runAsync(() => held);
      expect(answer['ok'], isTrue);
      // Handed back, the person's own "Show computer" holds again until the next page (§2.5).
      await tester.pump();
      expect(find.byKey(const Key('computer')), findsOneWidget);
      expect(find.byKey(const Key('appBrowserPanelBack')), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'a closed panel stays closed: the floating card shows the page as before',
    (tester) async {
      await setSize(tester, const Size(1400, 900));
      await tester.pumpWidget(chatWithPanel(panelOpen: false));
      await tester.pumpAndSettle();
      final browser = await openChat(tester);
      await tester.runAsync(
        () => browser.handle(
          browserCall('open', args: {'url': 'https://shop.example/'}),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(find.byKey(const Key('appBrowserPanel')), findsNothing);
      expect(find.byKey(const Key('appBrowserTile')), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets("another chat's run leaves the panel on the computer", (
    tester,
  ) async {
    await setSize(tester, const Size(1400, 900));
    await tester.pumpWidget(chatWithPanel());
    await tester.pumpAndSettle();
    final browser = await openChat(tester);
    await tester.runAsync(
      () => browser.handle(
        browserCall(
          'open',
          args: {'url': 'https://shop.example/'},
          run: 'run2',
          conversation: 'conv2',
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(find.byKey(const Key('computer')), findsOneWidget);
    expect(find.byKey(const Key('appBrowserPanel')), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'Linux: closing the full view puts the page back over the panel (§3)',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      await setSize(tester, const Size(1400, 900));
      final nav = GlobalKey<NavigatorState>();
      await tester.pumpWidget(
        harness(
          backend,
          Navigator(
            key: nav,
            onGenerateRoute: (_) => MaterialPageRoute<void>(
              builder: (_) => const Scaffold(
                body: Row(
                  children: [
                    Spacer(),
                    SizedBox(width: 420, child: AppBrowserWebArea()),
                  ],
                ),
              ),
            ),
          ),
          overrides: appBrowserOverrides(
            channel: channel,
            tokens: MemoryAppBrowserTokenStore(),
            timings: const AppBrowserTimings(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      Map<String, Object?> last() => channel.overlayBounds.last;
      expect(last()['visible'], true);
      expect(last()['width'], 420.0);

      nav.currentState!.push(
        MaterialPageRoute<void>(
          builder: (_) => const Scaffold(body: AppBrowserWebArea()),
        ),
      );
      await tester.pumpAndSettle();
      expect(last()['visible'], true);
      expect(last()['width'], 1400.0);

      nav.currentState!.pop();
      await tester.pumpAndSettle();
      // The full view's going away doesn't hide the page the panel shows.
      expect(last()['visible'], true);
      expect(last()['width'], 420.0);
      await tester.pumpWidget(const SizedBox());
      expect(last()['visible'], false);
      debugDefaultTargetPlatformOverride = null;
    },
  );
}
