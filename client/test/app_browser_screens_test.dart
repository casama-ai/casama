import 'dart:io';

import 'package:casama/core/chat_focus.dart';
import 'package:casama/features/app_browser/app_browser_admin.dart';
import 'package:casama/features/app_browser/app_browser_ask.dart';
import 'package:casama/features/app_browser/app_browser_channel.dart';
import 'package:casama/features/app_browser/app_browser_chat.dart';
import 'package:casama/features/app_browser/app_browser_controller.dart';
import 'package:casama/features/app_browser/app_browser_flag.dart';
import 'package:casama/features/app_browser/app_browser_linux.dart';
import 'package:casama/features/app_browser/app_browser_linux_io.dart';
import 'package:casama/features/app_browser/app_browser_screen.dart';
import 'package:casama/features/app_browser/app_browser_service.dart';
import 'package:casama/features/app_browser/app_browser_sites.dart';
import 'package:casama/features/app_browser/app_browser_ws_io.dart' show windowsOsLabel;
import 'package:casama/features/app_browser/app_browser_settings.dart';
import 'package:casama/features/chat/chat_controller.dart'
    show BrowserChoiceEntry;
import 'package:casama/features/chat/widgets/chat_widgets.dart'
    show BrowserChoicePrompt;
import 'package:casama/features/workspaces/spaces.dart';
import 'package:casama/ui/shell_layout.dart';
import 'package:casama/ui/bot_cursor.dart';
import 'package:casama/ui/tool_words.dart';
import 'package:casama/l10n/generated/app_localizations_en.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_browser_fakes.dart';
import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// The phone browser's screens: the settings with the consent first, the full view, the chat's
/// card and asks, the workspace switch and the owner's panel; and none of it without the switch.
void main() {
  late FakeBackend backend;
  late FakeAppBrowserChannel channel;
  late MemoryAppBrowserTokenStore tokens;
  String? focus;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    backend = FakeBackend();
    channel = FakeAppBrowserChannel();
    tokens = MemoryAppBrowserTokenStore();
    focus = 'conv1';
  });

  Widget app(Widget child, {bool on = true}) => harness(
    backend,
    child,
    overrides: appBrowserOverrides(
      channel: channel,
      focus: () => focus,
      tokens: tokens,
      on: on,
      timings: const AppBrowserTimings(),
    ),
  );

  ProviderContainer containerOf(WidgetTester tester, Type type) =>
      ProviderScope.containerOf(tester.element(find.byType(type)));

  testWidgets('without the build switch none of the entry points show', (
    tester,
  ) async {
    await setSize(tester, const Size(400, 900));
    backend.appBrowserDevice = null;
    await tester.pumpWidget(
      app(
        const Scaffold(
          body: Column(
            children: [
              AppBrowserDeviceTile(),
              AppBrowserWorkspaceTile(orgId: orgId),
              AppBrowserAdminCard(),
              ChromeSwitches(orgId: orgId),
              Expanded(
                child: AppBrowserChatOverlay(
                  conversationId: 'conv1',
                  layout: LayoutSize.phone,
                  running: false,
                ),
              ),
            ],
          ),
        ),
        on: false,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Browser on This Phone'), findsNothing);
    expect(find.text("Bots in Members' In-App Browsers"), findsNothing);
    expect(find.text('In-App Browser'), findsNothing);
    expect(find.byKey(const Key('appBrowserWorkspaceSwitch')), findsNothing);
    // The Chrome switches are still there.
    expect(find.text("Bots in Members' Browsers"), findsOneWidget);
    // A bot's call doesn't bring up the card either.
    final c = containerOf(tester, AppBrowserChatOverlay);
    final pending = c
        .read(appBrowserProvider.notifier)
        .handle(browserCall('ask'));
    await tester.pump();
    expect(find.byKey(const Key('appBrowserTile')), findsNothing);
    expect(find.byKey(const Key('appBrowserAsk')), findsNothing);
    c.read(appBrowserProvider.notifier).answerStep(false);
    await pending;
  });

  testWidgets(
    "the chat's menu offers the browser only once it's on for this phone",
    (tester) async {
      await setSize(tester, const Size(400, 900));
      backend.appBrowserDevice = null;
      final ready = Consumer(
        builder: (_, ref, _) =>
            Text(ref.watch(appBrowserReadyProvider) ? 'ready' : 'not ready'),
      );
      await tester.pumpWidget(app(Scaffold(body: ready)));
      await tester.pumpAndSettle();
      expect(find.text('not ready'), findsOneWidget);

      await backend.pairAppBrowser(
        orgId,
        name: 'iPhone',
        system: 'ios',
        clientId: 'client-1',
      );
      final c = containerOf(tester, Consumer);
      c.invalidate(appBrowserStatusProvider);
      await tester.pumpAndSettle();
      expect(find.text('ready'), findsOneWidget);

      backend
        ..appBrowserAvailable = false
        ..appBrowserReason = 'not_a_tester';
      c.invalidate(appBrowserStatusProvider);
      await tester.pumpAndSettle();
      expect(find.text('not ready'), findsOneWidget);

      await tester.pumpWidget(app(Scaffold(body: ready), on: false));
      await tester.pumpAndSettle();
      expect(find.text('not ready'), findsOneWidget);
    },
  );

  testWidgets(
    'Device connections shows the row only when the server offers it or a device exists',
    (tester) async {
      await setSize(tester, const Size(400, 900));
      await tester.pumpWidget(
        app(const Scaffold(body: Column(children: [AppBrowserDeviceTile()]))),
      );
      await tester.pumpAndSettle();
      expect(find.text('Browser on This Phone'), findsOneWidget);
      expect(find.text('Off'), findsOneWidget);

      backend
        ..appBrowserAvailable = false
        ..appBrowserReason = 'not_a_tester';
      final c = containerOf(tester, AppBrowserDeviceTile);
      c.invalidate(appBrowserStatusProvider);
      await tester.pumpAndSettle();
      expect(find.text('Browser on This Phone'), findsNothing);

      await backend.pairAppBrowser(
        orgId,
        name: 'iPhone',
        system: 'ios',
        clientId: 'client-1',
      );
      c.invalidate(appBrowserStatusProvider);
      await tester.pumpAndSettle();
      expect(
        find.text('Switched off: only for testers for now.'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'turning it on pairs without a separate consent sheet, defaults to all bots, and sets browser mode',
    (tester) async {
      await setSize(tester, const Size(420, 2600));
      await tester.pumpWidget(app(const AppBrowserSettingsScreen()));
      await tester.pumpAndSettle();
      expect(
        tester.widget<Switch>(find.byKey(const Key('appBrowserSwitch'))).value,
        isFalse,
      );

      // Turning on pairs directly (consent moved to onboarding, §2).
      await tester.tap(find.byKey(const Key('appBrowserSwitch')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserPairs, [
        ('Android Phone', 'android', 'client-1'),
      ]);
      expect(tokens.tokens['phone1'], 'kdev_phone');
      expect(
        tester.widget<Switch>(find.byKey(const Key('appBrowserSwitch'))).value,
        isTrue,
      );

      // Browser mode setting (§3).
      expect(find.byKey(const Key('appBrowserMode-ask')), findsOneWidget);
      await tester.tap(find.byKey(const Key('appBrowserMode-device')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserUpdates.last, 'mode:device');

      // All bots is on by default (§1.4); turning it off reveals per-bot switches.
      expect(
        tester.widget<Switch>(find.byKey(const Key('appBrowserAllBots'))).value,
        isTrue,
      );
      expect(find.byKey(const Key('appBrowserBot-$botId')), findsNothing);
      await tester.tap(find.byKey(const Key('appBrowserAllBots')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserUpdates.last, 'allBots:false');
      await tester.tap(find.byKey(const Key('appBrowserBot-$botId')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserUpdates.last, 'bots:$botId');
      expect(
        tester
            .widget<Switch>(find.byKey(const Key('appBrowserBot-$botId')))
            .value,
        isTrue,
      );

      // A kind that stays off unless switched on.
      await tester.tap(find.byKey(const Key('appBrowserKind-banking')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserUpdates.last, 'kinds:banking');

      // Switching it off keeps the pairing.
      await tester.tap(find.byKey(const Key('appBrowserSwitch')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserUpdates.last, 'enabled:false');
      expect(backend.appBrowserDevice, isNotNull);
      // Back on: no second pairing.
      await tester.tap(find.byKey(const Key('appBrowserSwitch')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserUpdates.last, 'enabled:true');
      expect(backend.appBrowserPairs.length, 1);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'sites can be removed, browsing data cleared and the phone unpaired',
    (tester) async {
      await setSize(tester, const Size(420, 2200));
      await backend.pairAppBrowser(
        orgId,
        name: 'iPhone',
        system: 'ios',
        clientId: 'client-1',
      );
      await backend.updateAppBrowser(
        'phone1',
        allowedSites: ['shop.example'],
        blockedSites: ['ads.example'],
      );
      backend.appBrowserUpdates.clear();
      tokens.tokens['phone1'] = 'kdev_phone';
      await tester.pumpWidget(app(const AppBrowserSettingsScreen()));
      await tester.pumpAndSettle();
      expect(find.text('shop.example'), findsOneWidget);
      expect(find.text('ads.example'), findsOneWidget);
      await tester.tap(
        find.byKey(const Key('appBrowserRemoveSite-ads.example')),
      );
      await tester.pumpAndSettle();
      expect(backend.appBrowserUpdates.last, 'blocked:');
      expect(find.text('ads.example'), findsNothing);

      await tester.ensureVisible(find.byKey(const Key('appBrowserClearData')));
      await tester.tap(find.byKey(const Key('appBrowserClearData')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('appBrowserClearDataConfirm')));
      await tester.pumpAndSettle();
      expect(channel.cleared, [null]);

      await tester.ensureVisible(find.byKey(const Key('appBrowserUnpair')));
      await tester.tap(find.byKey(const Key('appBrowserUnpair')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('appBrowserUnpairConfirm')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserDevice, isNull);
      expect(tokens.tokens, isEmpty);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('the chat shows the live page and the ask, answerable in place', (
    tester,
  ) async {
    await setSize(tester, const Size(400, 800));
    await tester.pumpWidget(
      app(
        const Scaffold(
          body: AppBrowserChatOverlay(
            conversationId: 'conv1',
            layout: LayoutSize.phone,
            running: true,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('appBrowserTile')), findsNothing);
    final c = containerOf(tester, AppBrowserChatOverlay);
    final browser = c.read(appBrowserProvider.notifier);
    await tester.runAsync(() => browser.handle(browserCall('snapshot')));
    await tester.pump();
    expect(find.byKey(const Key('appBrowserTile')), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(channel.calls.where((c) => c.startsWith('screenshot')), isNotEmpty);

    final pending = browser.handle(
      browserCall(
        'ask',
        args: {
          'reason': 'This posts the comment',
          'step': 'click',
          'name': 'Post',
        },
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(find.byKey(const Key('appBrowserAsk')), findsOneWidget);
    expect(find.text('Allow Ada to do this?'), findsOneWidget);
    expect(find.text('This posts the comment'), findsOneWidget);
    await tester.tap(find.byKey(const Key('appBrowserAllow')));
    await tester.pump();
    expect((await pending)['text'], 'allow');
    await tester.pump();
    expect(find.byKey(const Key('appBrowserAsk')), findsNothing);

    // Another chat's run doesn't show here.
    focus = 'conv2';
    await tester.runAsync(
      () => browser.handle(
        browserCall('snapshot', run: 'run2', conversation: 'conv2'),
      ),
    );
    await tester.pump();
    expect(find.byKey(const Key('appBrowserTile')), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'the full view: the bot, Stop, Take Over and Hand Back, and the site ask',
    (tester) async {
      await setSize(tester, const Size(400, 800));
      await tester.pumpWidget(app(const AppBrowserScreen()));
      await tester.pumpAndSettle();
      final browser = containerOf(
        tester,
        AppBrowserScreen,
      ).read(appBrowserProvider.notifier);
      await tester.runAsync(
        () => browser.handle(
          browserCall('open', args: {'url': 'https://shop.example/'}),
        ),
      );
      await tester.pump();
      expect(find.text('shop.example'), findsOneWidget);
      expect(find.byKey(const Key('appBrowserLock')), findsOneWidget);
      expect(find.text('Ada is working'), findsOneWidget);
      expect(find.byKey(const Key('fakeWebArea')), findsOneWidget);

      await tester.tap(find.byKey(const Key('appBrowserTakeOver')));
      await tester.pump();
      expect(find.text('Ada is paused while you use the page'), findsOneWidget);
      await tester.tap(find.byKey(const Key('appBrowserHandBack')));
      await tester.pump();
      expect(find.byKey(const Key('appBrowserTakeOver')), findsOneWidget);

      // A new site asks over the page.
      // The gate's lists were loaded in real time above, so this runs in real time too.
      late Future<Map<String, Object?>> pending;
      await tester.runAsync(() async {
        pending = browser.handle(
          browserCall(
            'open',
            args: {'url': 'https://news.example/'},
            policy: const AppSitePolicy(),
          ),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });
      await tester.pump();
      expect(find.text('Ada wants to open news.example'), findsOneWidget);
      await tester.tap(find.byKey(const Key('appBrowserNever')));
      await tester.pump();
      final denied = await tester.runAsync(() => pending);
      expect(denied?['code'], 'asked_denied');

      // A handoff.
      await tester.runAsync(
        () => browser.handle(
          browserCall('handoff', args: {'reason': 'Type the code we sent you'}),
        ),
      );
      await tester.pump();
      expect(find.text('Your turn'), findsOneWidget);
      expect(find.text('Type the code we sent you'), findsOneWidget);

      await tester.tap(find.byKey(const Key('appBrowserStop')));
      await tester.pump();
      expect(find.text('Ada is working'), findsNothing);
      expect(find.byKey(const Key('appBrowserStop')), findsNothing);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('Sign In to a Site: an address, then Let My Bots Use This Site', (
    tester,
  ) async {
    await setSize(tester, const Size(400, 800));
    await backend.pairAppBrowser(
      orgId,
      name: 'iPhone',
      system: 'ios',
      clientId: 'client-1',
    );
    await tester.pumpWidget(app(const AppBrowserScreen(person: true)));
    await tester.pumpAndSettle();
    final browser = containerOf(
      tester,
      AppBrowserScreen,
    ).read(appBrowserProvider.notifier);
    browser.device = backend.appBrowserDevice;
    await tester.enterText(
      find.byKey(const Key('appBrowserAddress')),
      'mail.example',
    );
    await tester.testTextInput.receiveAction(TextInputAction.go);
    await tester.pump();
    await tester.pump();
    expect(channel.calls, contains('load https://mail.example'));
    await tester.tap(find.byKey(const Key('appBrowserAllowSite')));
    await tester.pumpAndSettle();
    expect(backend.appBrowserDevice!.allowedSites, ['mail.example']);
    expect(
      find.text('mail.example added. Your bots can use it here.'),
      findsOneWidget,
    );
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'workspace admins switch it off beside Bots in Members\' Browsers',
    (tester) async {
      await setSize(tester, const Size(900, 1200));
      await tester.pumpWidget(
        app(const Scaffold(body: ChromeSwitches(orgId: orgId))),
      );
      await tester.pumpAndSettle();
      expect(find.text("Bots in Members' In-App Browsers"), findsOneWidget);
      await tester.tap(find.byKey(const Key('appBrowserWorkspaceSwitch')));
      await tester.pumpAndSettle();
      expect(backend.appBrowserWorkspaceOn, isFalse);
    },
  );

  testWidgets(
    'the owner sets the stage, testers, reasons and systems, and sees the numbers',
    (tester) async {
      await setSize(tester, const Size(700, 1600));
      await tester.pumpWidget(
        app(const Scaffold(body: AppBrowserAdminSheet())),
      );
      await tester.pumpAndSettle();
      expect(find.text('Last 14 Days'), findsOneWidget);
      expect(find.text('Runs in the app'), findsOneWidget);
      await tester.tap(find.text('Testers').first);
      await tester.enterText(
        find.byKey(const Key('adminAppBrowserTesters')),
        'user-1\nuser-2',
      );
      await tester.tap(find.byKey(const Key('adminAppBrowserSystem-ios')));
      await tester.tap(find.byKey(const Key('adminAppBrowserSystem-macos')));
      await tester.tap(find.byKey(const Key('adminAppBrowserSystem-linux')));
      await tester.ensureVisible(find.byKey(const Key('adminAppBrowserSystem-windows')));
      await tester.tap(find.byKey(const Key('adminAppBrowserSystem-windows')));
      await tester.tap(find.byKey(const Key('adminAppBrowserBlocked')));
      await tester.pump();
      await tester.ensureVisible(find.byKey(const Key('adminAppBrowserSave')));
      await tester.tap(find.byKey(const Key('adminAppBrowserSave')));
      await tester.pumpAndSettle();
      final saved = backend.appBrowserSaves.single;
      expect(saved.stage, SaveAppBrowserRequestStageEnum.testers);
      expect(saved.testers, ['user-1', 'user-2']);
      expect(saved.reasons?.blocked, isTrue);
      expect([
        for (final s in saved.systems!) s.value,
      ], ['ios', 'android', 'macos', 'linux', 'windows']);
    },
  );

  testWidgets('BrowserChoicePrompt lists available browsers and remembers pick', (
    tester,
  ) async {
    await setSize(tester, const Size(400, 900));
    await tester.pumpWidget(
      app(
        const Scaffold(
          body: BrowserChoicePrompt(
            botName: 'Shopper',
            entry: BrowserChoiceEntry(
              choiceId: 'choice-1',
              host: 'booking.com',
              reason: 'sign_in',
              deviceSystem: 'macos',
              hasChrome: true,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Where should Shopper open booking.com?'), findsOneWidget);
    expect(find.text('On this Mac'), findsOneWidget);
    expect(find.text('In your Chrome'), findsOneWidget);
    expect(find.text("On Shopper's computer"), findsOneWidget);
    expect(find.text('Remember for booking.com'), findsOneWidget);

    await tester.tap(find.byKey(const Key('browserChoiceRemember')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('browserChoiceApp')));
    await tester.pumpAndSettle();
    expect(backend.answeredBrowserChoices, [('choice-1', 'app', true)]);
    expect(find.text('Opened booking.com on this Mac'), findsOneWidget);
  });

  testWidgets('AppBrowserService pairs automatically at sign-in and unpairs on sign-out', (
    tester,
  ) async {
    await setSize(tester, const Size(400, 800));
    await tester.pumpWidget(
      app(
        Consumer(
          builder: (context, ref, _) {
            ref.watch(appBrowserServiceProvider);
            return const SizedBox();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(backend.appBrowserPairs, hasLength(1));
    expect(backend.appBrowserDevice, isNotNull);
    expect(tokens.tokens['phone1'], 'kdev_phone');

    await backend.signOut();
    await tester.pumpAndSettle();
    expect(backend.appBrowserDevice, isNull);
    expect(tokens.tokens, isEmpty);
  });

  testWidgets('AppBrowserService pairs once the owner switches it on, without a restart', (
    tester,
  ) async {
    backend
      ..appBrowserAvailable = false
      ..appBrowserReason = 'system_off';
    await setSize(tester, const Size(400, 800));
    await tester.pumpWidget(
      app(
        Consumer(
          builder: (context, ref, _) {
            ref.watch(appBrowserServiceProvider);
            return const SizedBox();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(backend.appBrowserPairs, isEmpty);

    // The owner ticks this system while the app stays open: the next check pairs.
    backend.appBrowserAvailable = true;
    await tester.pump(AppBrowserService.recheckEvery);
    await tester.pumpAndSettle();
    expect(backend.appBrowserPairs, hasLength(1));
    await tester.pumpWidget(const SizedBox());
  });

  test('browser steps that ran on the phone say so', () {
    final l10n = AppLocalizationsEn();
    expect(
      toolWords(l10n, 'browser.open', {
        'url': 'https://shop.example/a',
        'where': 'phone',
      }).detail,
      endsWith('on this device'),
    );
    expect(
      toolWords(l10n, 'browser.click', {'where': 'phone'}).detail,
      'on this device',
    );
    expect(toolWords(l10n, 'browser.click', {}).detail, isNull);
  });

  testWidgets('BrowserChoicePrompt shows "On this computer" for Linux', (
    tester,
  ) async {
    await setSize(tester, const Size(400, 900));
    await tester.pumpWidget(
      app(
        const Scaffold(
          body: BrowserChoicePrompt(
            botName: 'Shopper',
            entry: BrowserChoiceEntry(
              choiceId: 'choice-linux',
              host: 'booking.com',
              reason: 'blocked',
              deviceSystem: 'linux',
              hasChrome: true,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('On this computer'), findsOneWidget);
    expect(find.text('In your Chrome'), findsOneWidget);
    expect(find.text("On Shopper's computer"), findsOneWidget);
    await tester.tap(find.byKey(const Key('browserChoiceApp')));
    await tester.pumpAndSettle();
    expect(find.text('Opened booking.com on this computer'), findsOneWidget);
  });

  testWidgets('the site ask names this computer on Linux, not a phone', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    await setSize(tester, const Size(400, 900));
    await tester.pumpWidget(
      app(
        const Scaffold(
          body: AppBrowserAskCard(
            ask: AppBrowserAsk.site(botName: 'Ada', host: 'shop.example'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Browser on This Computer'), findsOneWidget);
    expect(
      find.text(
        'On this computer, with your sign-ins. Always lets it open this site from now on.',
      ),
      findsOneWidget,
    );
    expect(find.textContaining('phone'), findsNothing);
  });

  testWidgets('BrowserChoicePrompt shows "On this PC" for Windows', (tester) async {
    await setSize(tester, const Size(400, 900));
    await tester.pumpWidget(
      app(
        const Scaffold(
          body: BrowserChoicePrompt(
            botName: 'Shopper',
            entry: BrowserChoiceEntry(
              choiceId: 'choice-windows',
              host: 'booking.com',
              reason: 'blocked',
              deviceSystem: 'windows',
              hasChrome: true,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('On this PC'), findsOneWidget);
    expect(find.text('In your Chrome'), findsOneWidget);
    await tester.tap(find.byKey(const Key('browserChoiceApp')));
    await tester.pumpAndSettle();
    expect(find.text('Opened booking.com on this PC'), findsOneWidget);
  });

  testWidgets('the site ask names this PC on Windows, not a phone', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    await setSize(tester, const Size(400, 900));
    await tester.pumpWidget(
      app(
        const Scaffold(
          body: AppBrowserAskCard(
            ask: AppBrowserAsk.site(botName: 'Ada', host: 'shop.example'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Browser on This PC'), findsOneWidget);
    expect(
      find.text('On this PC, with your sign-ins. Always lets it open this site from now on.'),
      findsOneWidget,
    );
    expect(find.textContaining('phone'), findsNothing);
  });

  test('Windows is a browser platform named "windows", with the WebView2 reason and OS label', () {
    final l10n = AppLocalizationsEn();
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    expect(appBrowserPlatform, isTrue);
    expect(appBrowserSystem, 'windows');
    expect(defaultAppBrowserDeviceName('windows'), 'Windows PC');
    expect(
      appBrowserReasonText(l10n, 'needs_webview2'),
      'Install or update Microsoft Edge WebView2 to use the browser here.',
    );
    expect(windowsOsLabel('"Windows 10 Pro" 10.0 (Build 26200)'), 'Windows 11 (26200)');
    expect(windowsOsLabel('"Windows 10 Pro" 10.0 (Build 19045)'), 'Windows 10 (19045)');
    expect(windowsOsLabel('Windows'), 'Windows');
  });

  testWidgets('ChatFocusReporter counts the chat open while the Windows window is open', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    final reporter = ChatFocusReporter(backend);
    addTearDown(reporter.dispose);
    reporter.open('conv-windows');
    await tester.pump();
    reporter.didChangeAppLifecycleState(AppLifecycleState.hidden);
    await tester.pump();
    expect(reporter.focus, isNull);
  });

  test('Linux WebKitGTK install command picks apt, dnf, pacman or zypper from os-release', () {
    expect(
      linuxWebKitInstallCommand(osRelease: 'ID=ubuntu\nID_LIKE=debian\n'),
      'sudo apt install libwebkit2gtk-4.1-0',
    );
    expect(
      linuxWebKitInstallCommand(osRelease: 'ID=fedora\nVERSION_ID=41\n'),
      'sudo dnf install webkit2gtk4.1',
    );
    expect(
      linuxWebKitInstallCommand(osRelease: 'ID=arch\n'),
      'sudo pacman -S webkit2gtk-4.1',
    );
    expect(
      linuxWebKitInstallCommand(osRelease: 'ID="opensuse-tumbleweed"\n'),
      'sudo zypper install libwebkit2gtk-4_1-0',
    );
    final l10n = AppLocalizationsEn();
    expect(
      appBrowserReasonText(
        l10n,
        'needs_webkitgtk',
        linuxInstallCmd: 'sudo dnf install webkit2gtk4.1',
      ),
      contains('sudo dnf install webkit2gtk4.1'),
    );
  });

  test('Linux token store falls back to 0600 file when Secret Service throws', () async {
    final dir = await Directory.systemTemp.createTemp('casama-linux-token-');
    addTearDown(() => dir.delete(recursive: true));
    final path = '${dir.path}/casama/app-browser-device';
    final store = FallbackAppBrowserTokenStore(
      primary: _ThrowingTokenStore(),
      fallback: FileAppBrowserTokenStore(path: path),
    );
    await store.write('dev-1', 'kdev_secret_token');
    expect(await store.read('dev-1'), 'kdev_secret_token');
    expect(File(path).existsSync(), isTrue);
    await store.delete('dev-1');
    expect(await store.read('dev-1'), isNull);
    expect(File(path).existsSync(), isFalse);
  });

  test('the Mac token file lives in Application Support (Keychain -34018 fallback)', () {
    expect(
      macTokenFilePath(environment: const {'HOME': '/Users/a'}),
      '/Users/a/Library/Application Support/casama/app-browser-device',
    );
  });

  test('AppBrowserOverlayGuard reference counts concurrent popups', () {
    AppBrowserOverlayGuard.resetForTesting();
    expect(AppBrowserOverlayGuard.hidden.value, isFalse);
    final r1 = AppBrowserOverlayGuard.suppress();
    final r2 = AppBrowserOverlayGuard.suppress();
    expect(AppBrowserOverlayGuard.hidden.value, isTrue);
    r1();
    r1(); // idempotent
    expect(AppBrowserOverlayGuard.hidden.value, isTrue);
    r2();
    expect(AppBrowserOverlayGuard.hidden.value, isFalse);
  });

  testWidgets('ChatFocusReporter keeps open_conversation_id while Linux window stays open behind another app', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    final reporter = ChatFocusReporter(backend);
    addTearDown(reporter.dispose);
    reporter.open('conv-linux');
    await tester.pump();
    reporter.didChangeAppLifecycleState(AppLifecycleState.inactive);
    await tester.pump();
    expect(reporter.focus, isNull);
    // Window still open behind another app: open_conversation_id stays set.
    reporter.didChangeAppLifecycleState(AppLifecycleState.hidden);
    await tester.pump();
    expect(reporter.focus, isNull);
  });

  testWidgets('ChatFocusReporter: a phone keeps the chat in focus behind Face ID or Control Center, not in the background (D-529)', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    final reporter = ChatFocusReporter(backend);
    addTearDown(reporter.dispose);
    reporter.open('conv-phone');
    await tester.pump();
    reporter.didChangeAppLifecycleState(AppLifecycleState.inactive);
    await tester.pump();
    expect(reporter.focus, 'conv-phone');
    reporter.didChangeAppLifecycleState(AppLifecycleState.paused);
    await tester.pump();
    expect(reporter.focus, isNull);
    reporter.didChangeAppLifecycleState(AppLifecycleState.resumed);
    await tester.pump();
    expect(reporter.focus, 'conv-phone');
  });

  testWidgets(
    'Linux: the bot cursor is drawn natively over the live page, by Flutter over its picture',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      addTearDown(() {
        debugDefaultTargetPlatformOverride = null;
        AppBrowserOverlayGuard.resetForTesting();
      });
      await setSize(tester, const Size(400, 800));
      await tester.pumpWidget(
        harness(
          backend,
          const AppBrowserScreen(),
          overrides: appBrowserOverrides(
            channel: channel,
            focus: () => focus,
            tokens: tokens,
            timings: const AppBrowserTimings(),
            realWebArea: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final browser = containerOf(
        tester,
        AppBrowserScreen,
      ).read(appBrowserProvider.notifier);
      await tester.runAsync(
        () => browser.handle(
          browserCall('open', args: {'url': 'https://shop.example/'}),
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(channel.overlayBounds.last['visible'], isTrue);
      expect(AppBrowserLinuxLive.showing.value, isTrue);

      browser.cursor.pointTo(
        const Offset(120, 80),
        of: Size.zero,
        act: BotCursorAct.click,
      );
      await tester.pump();
      expect(channel.cursorCalls.last, {
        'visible': true,
        'x': 120.0,
        'y': 80.0,
        'act': 'click',
        'step': 1,
        'label': 'Ada',
      });
      BotCursor flutterCursor() => tester.widget<BotCursor>(find.byType(BotCursor));
      expect(flutterCursor().visible, isFalse, reason: 'native draws it over the live page');

      // A popup over the page: its picture shows, so Flutter draws the cursor and native's goes.
      final release = AppBrowserOverlayGuard.suppress();
      await tester.pump();
      await tester.pump();
      expect(channel.cursorCalls.last['visible'], isFalse);
      expect(flutterCursor().visible, isTrue);
      release();
      await tester.pump();
      await tester.pump();
      expect(channel.cursorCalls.last['visible'], isTrue);
      expect(flutterCursor().visible, isFalse);

      // The bot stops driving: native's cursor leaves too.
      browser.cursor.leave();
      await tester.pump();
      expect(channel.cursorCalls.last['visible'], isFalse);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'Linux on Wayland: the page as a picture with the Flutter cursor, and its own window for typing',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      addTearDown(() {
        debugDefaultTargetPlatformOverride = null;
        AppBrowserOverlayGuard.resetForTesting();
      });
      channel.support = const AppBrowserSupport(
        supported: true,
        liveOverlay: false,
      );
      await setSize(tester, const Size(400, 800));
      await tester.pumpWidget(
        harness(
          backend,
          const AppBrowserScreen(),
          overrides: appBrowserOverrides(
            channel: channel,
            focus: () => focus,
            tokens: tokens,
            timings: const AppBrowserTimings(),
            realWebArea: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final browser = containerOf(
        tester,
        AppBrowserScreen,
      ).read(appBrowserProvider.notifier);
      await tester.runAsync(
        () => browser.handle(
          browserCall('open', args: {'url': 'https://shop.example/'}),
        ),
      );
      await tester.pump();
      await tester.pump();
      // Never laid over the window; parked at the area's size so the picture matches it.
      expect(channel.overlayBounds.where((b) => b['visible'] == true), isEmpty);
      expect(channel.overlayBounds.last['width'], greaterThan(100));
      expect(AppBrowserLinuxLive.showing.value, isFalse);
      browser.cursor.pointTo(const Offset(50, 60), of: Size.zero);
      await tester.pump();
      expect(tester.widget<BotCursor>(find.byType(BotCursor)).visible, isTrue);

      // Take Over: the live page opens in its own window; closing it is Hand Back.
      await tester.tap(find.byKey(const Key('appBrowserTakeOver')));
      await tester.pump();
      expect(channel.calls, contains(startsWith('pageWindow open')));
      channel.handler!.pageWindowClosed();
      await tester.pump();
      expect(
        containerOf(tester, AppBrowserScreen).read(appBrowserProvider).phase,
        isNot(AppBrowserPhase.tookOver),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpWidget(const SizedBox());
    },
  );
}

class _ThrowingTokenStore implements AppBrowserTokenStore {
  @override
  Future<String?> read(String deviceId) => throw StateError('no Secret Service');
  @override
  Future<void> write(String deviceId, String token) =>
      throw StateError('no Secret Service');
  @override
  Future<void> delete(String deviceId) => throw StateError('no Secret Service');
}
