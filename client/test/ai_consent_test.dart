import 'package:casama/core/backend.dart';
import 'package:casama/features/app_browser/app_browser_flag.dart'
    show appBrowserBuildProvider;
import 'package:casama/features/billing/billing_screen.dart'
    show platformProvider;
import 'package:casama/features/privacy/ai_consent_step.dart';
import 'package:casama/features/settings/name_step.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

void main() {
  testWidgets(
    'consent comes before the name step, and nothing waits once agreed',
    (tester) async {
      await setSize(tester, const Size(400, 800));
      final backend = FakeBackend()
        ..aiConsent = null
        ..about = const AboutYouView(
          displayName: 'Robin Park',
          nameAsked: false,
        );
      await tester.pumpWidget(
        harness(
          backend,
          const _Steps(),
          overrides: [platformProvider.overrideWithValue(TargetPlatform.iOS)],
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('aiConsentStep')), findsOneWidget);
      expect(find.byKey(const Key('nameStep')), findsNothing);
      expect(find.textContaining('OpenRouter'), findsOneWidget);

      await tester.tap(find.byKey(const Key('aiConsentAgree')));
      await tester.pumpAndSettle();
      expect(backend.aiConsent, isNotNull);
      expect(find.byKey(const Key('aiConsentStep')), findsNothing);
      expect(find.byKey(const Key('nameStep')), findsOneWidget);
    },
  );

  testWidgets(
    'only the App Store apps ask: never on Android, web or the Mac download',
    (tester) async {
      await setSize(tester, const Size(400, 800));
      for (final platform in [
        TargetPlatform.android,
        TargetPlatform.macOS,
        TargetPlatform.windows,
      ]) {
        final backend = FakeBackend()..aiConsent = null;
        await tester.pumpWidget(
          harness(
            backend,
            const _Steps(),
            overrides: [platformProvider.overrideWithValue(platform)],
          ),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(const Key('aiConsentStep')),
          findsNothing,
          reason: '$platform',
        );
      }
    },
  );

  testWidgets('people who agreed never see the consent step', (tester) async {
    await setSize(tester, const Size(400, 800));
    final backend = FakeBackend();
    await tester.pumpWidget(
      harness(
        backend,
        const _Steps(),
        overrides: [platformProvider.overrideWithValue(TargetPlatform.iOS)],
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('aiConsentStep')), findsNothing);
  });

  testWidgets('withdrawing brings the step back', (tester) async {
    SharedPreferences.setMockInitialValues({'voice.aiConsent.v1': true});
    await setSize(tester, const Size(400, 800));
    final backend = FakeBackend();
    await tester.pumpWidget(
      harness(
        backend,
        const _Steps(),
        overrides: [platformProvider.overrideWithValue(TargetPlatform.iOS)],
      ),
    );
    await tester.pumpAndSettle();
    final container = ProviderScope.containerOf(
      tester.element(find.byType(_Steps)),
    );
    await container.read(aiConsentProvider.notifier).set(false);
    await tester.pumpAndSettle();
    expect(backend.aiConsent, isNull);
    expect(find.byKey(const Key('aiConsentStep')), findsOneWidget);
    // The call screen's own yes for voice goes too, so the next call asks again.
    final prefs = await tester.runAsync(SharedPreferences.getInstance);
    expect(prefs!.containsKey('voice.aiConsent.v1'), isFalse);
  });

  testWidgets(
    'version 1 users see the updated consent once with the web-pages notice',
    (tester) async {
      await setSize(tester, const Size(400, 800));
      final backend = FakeBackend()
        ..aiConsent = DateTime.utc(2026, 1, 1)
        ..aiConsentVer = 1;
      await tester.pumpWidget(
        harness(
          backend,
          const _Steps(),
          overrides: [platformProvider.overrideWithValue(TargetPlatform.iOS)],
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('aiConsentStep')), findsOneWidget);
      expect(find.byKey(const Key('aiConsentUpdatedNotice')), findsOneWidget);
      expect(find.text('We added web pages to this list.'), findsOneWidget);
      expect(find.textContaining('web pages your bots open'), findsOneWidget);

      await tester.tap(find.byKey(const Key('aiConsentAgree')));
      await tester.pumpAndSettle();
      expect(backend.aiConsentVersion, kAiConsentVersion);
      expect(find.byKey(const Key('aiConsentStep')), findsNothing);
    },
  );

  testWidgets('Android and Linux never ask, even with the in-app browser', (
    tester,
  ) async {
    await setSize(tester, const Size(400, 800));
    for (final platform in [TargetPlatform.android, TargetPlatform.linux]) {
      final backend = FakeBackend()..aiConsent = null;
      await tester.pumpWidget(
        harness(
          backend,
          const _Steps(),
          overrides: [
            platformProvider.overrideWithValue(platform),
            appBrowserBuildProvider.overrideWithValue(true),
          ],
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.byKey(const Key('aiConsentStep')),
        findsNothing,
        reason: '$platform with appBrowserBuildProvider=true',
      );
    }
  });
}

class _Steps extends ConsumerWidget {
  const _Steps();

  @override
  Widget build(BuildContext context, WidgetRef ref) => Stack(
    children: [
      const Scaffold(body: Text('app')),
      if (ref.watch(aiConsentNeededProvider))
        const Positioned.fill(child: AiConsentStep())
      else if (ref.watch(nameStepNeededProvider) ?? false)
        const Positioned.fill(child: NameStep()),
    ],
  );
}
