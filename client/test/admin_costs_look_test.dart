// Pictures of the admin's Costs tab for looking at: wide and phone, light and dark, the detail,
// and the awkward cases. Nothing is compared; the files are for people. It runs only when asked:
//
//   flutter test --update-goldens test/admin_costs_look_test.dart     (into test/goldens/costs)
//   COSTS_SHOTS=/some/folder flutter test test/admin_costs_look_test.dart
import 'dart:async';
import 'dart:io';

import 'package:casama/core/backend.dart';
import 'package:casama/core/local_cache.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/admin/admin_screen.dart';
import 'package:casama/features/admin/costs/cost_view.dart';
import 'package:casama/features/admin/costs/costs_tab.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/theme/app_theme.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_costs_fixtures.dart';
import 'admin_test_helpers.dart';
import 'fake_backend.dart';
import 'fake_unlockers.dart';
import 'support/shots.dart';

const _wide = Size(1400, 900);
const _phone = Size(390, 844);

class _Stuck extends FakeBackend {
  @override
  Future<AdminCosts> adminCosts(CostQuery query) =>
      Completer<AdminCosts>().future;
}

void main() {
  final dir =
      Platform.environment['COSTS_SHOTS'] ??
      (autoUpdateGoldenFiles ? 'test/goldens/costs' : null);

  /// The console on its Costs tab, unlocked, at [size].
  Future<FakeBackend> open(
    WidgetTester tester,
    Size size, {
    bool dark = false,
    AdminCosts Function(CostQuery)? costs,
    FakeBackend? backend,
    double textScale = 1,
    bool settle = true,
  }) async {
    await loadAppFonts();
    // The key's setting name is drawn in the code face, which the app loads on demand.
    final mono = FontLoader('JetBrains Mono')
      ..addFont(rootBundle.load('assets/fonts/JetBrainsMono-Regular.ttf'));
    await mono.load();
    SharedPreferences.setMockInitialValues({});
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    tester.platformDispatcher.textScaleFactorTestValue = textScale;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    final b = backend ?? FakeBackend();
    if (backend == null) {
      b
        ..costs = costs ?? everydayCosts
        ..costKeys = everydayKeys();
    }
    await tester.pumpWidget(
      ShotFrame(
        child: ProviderScope(
          overrides: [
            backendProvider.overrideWithValue(b),
            localCacheProvider.overrideWithValue(const NoCache()),
            unlockersProvider.overrideWithValue(FakeUnlockers()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: dark ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            // The app's shell paints the plain backdrop behind every page; here the page stands alone.
            builder: (context, child) => ColoredBox(
              color: Theme.of(context).colorScheme.surface,
              child: child,
            ),
            home: const AdminScreen(tab: 'costs'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    addTearDown(() async => tester.pumpWidget(const SizedBox.shrink()));
    await tester.enterText(
      find.byKey(const Key('adminPassword')),
      'test-password',
    );
    await tester.tap(find.byKey(const Key('adminUnlockPassword')));
    if (settle) {
      await tester.pumpAndSettle();
    } else {
      for (var i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
    }
    return b;
  }

  CostViewNotifier view(WidgetTester tester) =>
      ProviderScope.containerOf(tester.element(find.byType(CostsTab)))
          .read(costViewProvider.notifier);

  Future<void> settle(WidgetTester tester) async {
    await tester.pumpAndSettle();
    // Past the entrance fades and a tooltip's delay, so nothing is caught half drawn.
    await tester.pump(const Duration(milliseconds: 400));
  }

  void picture(String name, Future<void> Function(WidgetTester tester) body) {
    testWidgets('pictures: $name', (tester) async {
      await body(tester);
      await settle(tester);
      await shot(tester, dir!, name);
    }, skip: dir == null);
  }

  for (final dark in [false, true]) {
    final tone = dark ? 'dark' : 'light';
    picture('wide-$tone', (t) => open(t, _wide, dark: dark));
    picture('wide-detail-$tone', (t) async {
      await open(t, _wide, dark: dark);
      await t.tap(find.byKey(const Key('costRow-openrouter')));
    });
    picture(
      'wide-full-$tone',
      (t) => open(t, const Size(1400, 1500), dark: dark),
    );
    picture('phone-$tone', (t) => open(t, _phone, dark: dark));
    picture(
      'phone-full-$tone',
      (t) => open(t, const Size(390, 1500), dark: dark),
    );
    picture('phone-detail-$tone', (t) async {
      await open(t, const Size(390, 1500), dark: dark);
      await t.tap(find.byKey(const Key('costRow-openrouter')));
    });
  }

  picture('case-key-detail-wide', (t) async {
    await open(t, const Size(1400, 1200));
    view(t).setGroup(CostGroup.key);
    await t.pumpAndSettle();
    await t.tap(find.byKey(const Key('costRow-CLOUD_MODEL_UPSTREAM_KEY')));
  });
  picture('case-app-detail-phone', (t) async {
    await open(t, const Size(390, 1900));
    view(t).setGroup(CostGroup.app);
    await t.pumpAndSettle();
    await t.tap(find.byKey(const Key('costRow-github')));
  });
  picture('case-apps-wide', (t) async {
    await open(t, const Size(1400, 1700));
    view(t).setGroup(CostGroup.app);
    await t.pumpAndSettle();
    await t.tap(find.byKey(const Key('costRow-github')));
  });
  picture('case-apps-phone', (t) async {
    await open(t, const Size(390, 1300));
    view(t).setGroup(CostGroup.app);
  });
  picture('case-filtered-wide', (t) async {
    await open(t, _wide);
    view(t).showService('openrouter', 'OpenRouter');
  });
  picture('case-tablet-detail', (t) async {
    await open(t, const Size(1024, 1100));
    await t.tap(find.byKey(const Key('costRow-openrouter')));
  });
  picture('case-options-sheet-phone', (t) async {
    await open(t, _phone);
    view(t).showService('openrouter', 'OpenRouter');
    await t.pumpAndSettle();
    await t.tap(find.byKey(const Key('costOptions')));
  });
  picture('case-not-recorded-sheet-phone', (t) async {
    await open(t, _phone);
    await t.tap(find.byKey(const Key('costTile-notRecorded')));
  });
  picture(
    'case-giant-wide',
    (t) => open(t, const Size(1400, 1100), costs: giantCosts),
  );
  picture(
    'case-forty-rows-wide',
    (t) => open(t, const Size(1400, 2900), costs: fortyCosts),
  );
  picture(
    'case-forty-rows-phone',
    (t) => open(t, const Size(390, 3900), costs: fortyCosts),
  );
  picture('case-long-names-wide', (t) async {
    await open(t, const Size(1400, 1100), costs: longNameCosts);
    await t.tap(find.byKey(const Key('costRow-long-1')));
  });
  picture(
    'case-long-names-phone',
    (t) => open(t, const Size(390, 1300), costs: longNameCosts),
  );
  picture('case-all-zeros-wide', (t) => open(t, _wide, costs: zeroCosts));
  picture(
    'case-empty-phone',
    (t) =>
        open(t, _phone, costs: (q) => costsOf(q, const [], noPrevious: true)),
  );
  picture('case-no-vendor-figure-wide', (t) async {
    await open(t, _wide, costs: noFigureCosts);
    await t.tap(find.byKey(const Key('costRow-openrouter')));
  });
  picture(
    'case-large-text-phone',
    (t) => open(t, const Size(390, 2400), textScale: 1.6),
  );
  picture(
    'case-loading-wide',
    (t) => open(t, _wide, backend: _Stuck(), settle: false),
  );
  picture(
    'case-loading-phone',
    (t) => open(t, _phone, backend: _Stuck(), settle: false),
  );
  picture(
    'case-older-server-phone',
    (t) => open(
      t,
      _phone,
      backend: FakeBackend()..costsError = const CostsNotSupported(),
    ),
  );
  picture(
    'case-error-wide',
    (t) => open(
      t,
      _wide,
      backend: FakeBackend()
        ..costsError = StateError('The server took too long to answer'),
    ),
  );

  picture('overview-spend-card-phone', (t) async {
    await open(t, const Size(390, 1500));
    await t.tap(find.text('Overview'));
  });

  test('pictures are made only when asked for', () {
    expect(
      dir == null || Directory(dir).existsSync() || autoUpdateGoldenFiles,
      isTrue,
    );
    expect(unlockAdmin, isNotNull);
  });
}
