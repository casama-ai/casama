// The pseudo-locale sweep (docs/LOCALIZATION-PLAN.md §5.6 and §5.8): the screens reachable
// without a server, drawn in en-XA on a 360 dp phone at large text sizes. It fails on a layout
// that overflows and on words that don't come from the translations (nothing around them in ⟦ ⟧).
// What it finds today is listed in l10n_sweep_baseline.txt, and only new findings fail it.
//
//   scripts/l10n-sweep.sh            from the repository root: makes the pseudo-locale, runs this
//   scripts/l10n-sweep.sh --update   and rewrites the list, after fixing what's on it
//
// Run on its own, without the pseudo-locale, it is skipped.
import 'dart:io';

import 'package:casama/app.dart';
import 'package:casama/core/app_language.dart';
import 'package:casama/core/backend.dart';
import 'package:casama/core/billing.dart';
import 'package:casama/core/local_cache.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/widgets.dart';
import 'package:casama/features/app_lock/app_lock.dart';
import 'package:casama/features/auth/sign_in_screen.dart';
import 'package:casama/features/billing/billing_screen.dart';
import 'package:casama/features/billing/out_of_credits.dart';
import 'package:casama/features/billing/paywall.dart';
import 'package:casama/features/bots/bots_screen.dart';
import 'package:casama/features/bots/model_picker.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/notifications/notifications_primer.dart';
import 'package:casama/features/privacy/ai_consent_step.dart';
import 'package:casama/features/settings/language_sheet.dart';
import 'package:casama/features/settings/name_step.dart';
import 'package:casama/features/settings/settings_screen.dart';
import 'package:casama/features/welcome/gallery_picks_step.dart';
import 'package:casama/features/welcome/heard_from_step.dart';
import 'package:casama/features/welcome/welcome_screen.dart';
import 'package:casama/features/workspaces/onboarding_screen.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/ui/server_unreachable_view.dart';
import 'package:casama/ui/text_scale.dart';
import 'package:casama_sdk/casama_sdk.dart' show Bot, BotLastMessage, BotLastMessageFromEnum, CreditPack, WelcomeChat;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'billing_test.dart' show FakeStore, pricingPlans;
import 'fake_backend.dart';
import 'fake_unlockers.dart';
import 'support/l10n_sweep.dart';

const _baseline = 'test/l10n_sweep_baseline.txt';

/// 1.3 is the largest the app shows (kMaxTextScale); 2.0 goes past it, to show what has no room
/// to spare.
const _scales = [kMaxTextScale, 2.0];

const _chatData = ['A bot with a rather long name', 'Here is your plan for the week.'];

/// The plan names and limits are the server's data.
const _planData = ['Free', 'Plus (yearly)', 'Pro (yearly)', 'Max (yearly)', 'Plus', 'Pro', 'Max'];

class _SlowWelcome extends FakeBackend {
  @override
  Future<WelcomeChat> startWelcome({String? firstName}) => Future<WelcomeChat>.delayed(const Duration(minutes: 1), () => throw Exception('offline'));
}

class _NoBots extends FakeBackend {
  @override
  Future<List<Bot>> bots(String orgId) async => const [];
}

const _sets = [
  GalleryItem(id: 'founder-kit', type: 'set', name: 'Founder kit', authorName: 'Casama', license: 'CC0-1.0', icon: 'rocket', description: 'Investor updates, inbox triage and a weekly plan.'),
  GalleryItem(id: 'student-kit', type: 'set', name: 'Student kit', authorName: 'Casama', license: 'CC0-1.0', icon: 'graduation-cap', description: 'Study plans, flashcards and class notes.'),
];

class _Gallery extends FakeBackend {
  @override
  Future<GalleryPage> galleryEverything() async => const GalleryPage(available: true, items: []);
  @override
  Future<List<GalleryItem>> gallerySets() async => _sets;
}

FakeBackend _billing() => FakeBackend()
  ..billingEnabled = true
  ..catalogPlans = pricingPlans();

FakeBackend _chats() {
  final backend = FakeBackend()
    ..lastMessage = BotLastMessage(
      text: 'Here is your plan for the week.',
      from: BotLastMessageFromEnum.bot,
      fileName: null,
      fileMime: null,
      conversationId: convId,
      at: DateTime(2026, 11, 10, 9),
    );
  for (var i = 0; i < 3; i++) {
    backend.extraBots.add(backend.bot(id: 'bot-$i', name: 'A bot with a rather long name $i'));
  }
  return backend;
}

List<dynamic> _store({StorePurchases? store, TargetPlatform platform = TargetPlatform.android}) => [
  storeProvider.overrideWithValue(store ?? FakeStore('google_play', country: 'USA', priced: true)),
  platformProvider.overrideWithValue(platform),
  openUrlProvider.overrideWithValue((url) async {}),
  manageSubscriptionsSheetProvider.overrideWithValue(() async => false),
];

/// A button that opens what a screen would, since sheets and dialogs need something under them.
class _Opener extends ConsumerWidget {
  const _Opener(this.open);
  final void Function(BuildContext context, WidgetRef ref) open;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    body: Center(
      child: IconButton(key: const Key('sweepOpen'), icon: const Icon(LucideIcons.play), onPressed: () => open(context, ref)),
    ),
  );
}

const _open = Key('sweepOpen');

typedef _Screen = ({List<String> data, Future<void> Function(Sweep s) visit});

_Screen _screen(Future<void> Function(Sweep s) visit, {List<String> data = const []}) => (data: data, visit: visit);

/// A screen that only needs opening and scrolling.
_Screen _page(Widget Function() page, {FakeBackend Function()? backend, List<dynamic> Function()? overrides, List<String> data = const []}) => _screen(data: data, (s) async {
  await s.open(page(), backend: backend?.call(), overrides: overrides?.call() ?? const []);
  await s.scrollThrough();
});

Future<void> _signInSheet(Sweep s) async {
  await s.open(const SignInScreen(), backend: FakeBackend()..signedIn = false);
  await s.tap(find.byKey(const Key('openSignIn')));
}

final Map<String, _Screen> _screens = {
  // Sign-in.
  'sign-in': _page(SignInScreen.new, backend: () => FakeBackend()..signedIn = false),
  'sign-in ways': _screen((s) async {
    await _signInSheet(s);
    await s.scrollThrough();
  }),
  'sign-in email code': _screen(data: ['ana@example.com'], (s) async {
    await _signInSheet(s);
    await s.tap(find.byKey(const Key('continueWithEmail')));
    await s.scrollThrough();
    // The empty address first: the field's own complaint.
    await s.tap(find.byKey(const Key('sendMagicLink')));
    s.look();
    await s.tester.enterText(find.byKey(const Key('email')), 'ana@example.com');
    await s.tap(find.byKey(const Key('sendMagicLink')));
    await s.scrollThrough();
  }),
  'sign-in password': _screen((s) async {
    await _signInSheet(s);
    await s.tap(find.byKey(const Key('continueWithEmail')));
    await s.tap(find.byKey(const Key('usePassword')));
    await s.tap(find.byKey(const Key('submit')));
    await s.scrollThrough();
    await s.tap(find.byKey(const Key('toggleMode')));
    await s.scrollThrough();
  }),

  // Onboarding.
  'ai consent': _page(AiConsentStep.new, overrides: () => [platformProvider.overrideWithValue(TargetPlatform.iOS)]),
  'name step': _page(NameStep.new),
  'heard from': _page(HeardFromStep.new),
  'gallery picks': _page(GalleryPicksStep.new, backend: _Gallery.new, data: [for (final s in _sets) ...[s.name, s.description!]]),
  'notifications primer': _page(() => NotificationsPrimer(onEnable: () {}, onLater: () {})),
  'notifications blocked': _page(() => NotificationsPrimer(onEnable: () {}, onLater: () {}, blocked: true)),
  'welcome loading': _page(WelcomeScreen.new, backend: () => _SlowWelcome()..hasOrg = false),
  'onboarding workspace': _page(OnboardingScreen.new, backend: () => FakeBackend()..hasOrg = false),
  'onboarding model key': _page(OnboardingScreen.new, backend: () => FakeBackend()..noKeys = true),
  // The templates are the server's.
  'onboarding first bot': _page(OnboardingScreen.new, data: ['Daily briefing', 'Writer']),

  // Settings.
  'settings': _page(SettingsScreen.new, data: ['Test']),
  'settings cloud': _page(SettingsScreen.new, backend: _billing, overrides: _store, data: ['Test', ..._planData]),

  // Chats.
  'chat list': _page(BotsScreen.new, backend: _chats, data: _chatData),
  'chat list empty': _page(BotsScreen.new, backend: _NoBots.new),
  'app shell': _screen(data: _chatData, (s) async {
    // The real app around the chat list: its tab bar and banners.
    final backend = _chats()..about = const AboutYouView(displayName: 'Test Person', nameAsked: true);
    await s.tester.pumpWidget(
      ProviderScope(
        overrides: [backendProvider.overrideWithValue(backend), localCacheProvider.overrideWithValue(const NoCache()), unlockersProvider.overrideWithValue(FakeUnlockers())],
        child: const CasamaApp(),
      ),
    );
    await s.settle();
    await s.scrollThrough();
  }),
  'empty chat': _page(() => const ChatScreen(botId: botId, conversationId: convId)),

  // Paywall and billing.
  'paywall': _screen(data: _planData, (s) async {
    await s.open(_Opener((context, _) => openPaywall(context)), backend: _billing(), overrides: _store());
    await s.tap(find.byKey(_open));
    await s.scrollThrough();
    final yearly = find.byKey(const Key('paywallInterval-year'));
    final list = find.descendant(of: find.byType(PaywallScreen), matching: find.byType(Scrollable)).first;
    await s.tester.scrollUntilVisible(yearly, 120, scrollable: list);
    await s.tap(yearly);
    await s.scrollThrough();
  }),
  'paywall not sold': _screen((s) async {
    await s.open(_Opener((context, _) => openPaywall(context)), backend: FakeBackend()..catalogPlans = const [], overrides: _store(store: const NoStore()));
    await s.tap(find.byKey(_open));
    await s.scrollThrough();
  }),
  'billing': _page(BillingScreen.new, backend: _billing, overrides: _store, data: _planData),
  'out of credits': _screen(data: [..._planData, 'of credits'], (s) async {
    // A paying workspace gets the credit packs; a free one would see the paywall.
    final backend = _billing()
      ..planCode = 'pro'
      ..catalogPacks = [CreditPack(code: 'credits_10', name: r'$10 of credits', creditsUsd: 10, web: true, priceLabel: r'$10')];
    await s.open(_Opener((context, _) => openOutOfCredits(context)), backend: backend, overrides: _store(store: const NoStore(), platform: TargetPlatform.macOS));
    await s.tap(find.byKey(_open));
    await s.scrollThrough();
  }),

  // Pickers.
  'language picker': _screen((s) async {
    await s.open(_Opener(chooseLanguage));
    await s.tap(find.byKey(_open));
    await s.scrollThrough();
  }),
  'model picker': _screen(data: ['DeepSeek: DeepSeek V4.1 Flash 1017', 'Anthropic: Claude Sonnet 5.5', 'Acme: Other', 'Meta: Muse Ember', 'OpenAI: GPT-6 Luna'], (s) async {
    await s.open(Scaffold(body: ModelPickerField(credentialId: 'cred', value: 'anthropic/claude-sonnet-5.5', onChanged: (_) {})));
    s.look();
    await s.tap(find.byKey(const Key('modelPicker')));
    await s.scrollThrough();
  }),

  // Widgets many screens share.
  'common states': _page(
    () => Builder(
      builder: (context) => Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 520,
              child: AsyncView<int>(value: AsyncValue.error(Exception('offline'), StackTrace.empty), onRetry: () {}, data: (_) => const SizedBox.shrink()),
            ),
            InlineError(error: Exception('offline'), onRetry: () {}),
          ],
        ),
      ),
    ),
    data: ['Exception: offline', 'offline'],
  ),
  'server unreachable': _page(
    () => Scaffold(
      body: ServerUnreachableView(apiUrl: 'https://casama.example.com', retrying: false, nextRetryAt: null, onRetry: () {}, onChangeServer: () {}),
    ),
    data: ['casama.example.com'],
  ),
};

/// The same screens in a real translation (`L10N_SWEEP_LOCALE=de`, set by
/// `scripts/l10n-sweep.sh --locale de`): fails on an overflow the pseudo-locale run doesn't already
/// list. Texts are not checked, since a real translation may keep a word in English.
void _realLocaleSweep(String code) {
  final locale = AppLanguage.parseTag(code) ?? (throw ArgumentError('Not a language tag: $code'));
  TestWidgetsFlutterBinding.ensureInitialized();
  final baseline = SweepBaseline(_baseline);
  setUpAll(loadSweepFonts);
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    AppLanguage.debugSet(locale);
  });
  tearDown(() => AppLanguage.debugSet(null));
  test('$code is a translation the app has', () {
    expect(AppLocalizations.supportedLocales.map((l) => l.languageCode), contains(locale.languageCode));
  });
  // The screens really draw this language, Material's own labels included.
  testWidgets('screens are drawn in $code', (tester) async {
    final sweep = Sweep(tester, 1.0)..phone();
    late String language, save, cancel;
    await sweep.run(() async {
      await sweep.open(
        Builder(
          builder: (context) {
            language = Localizations.localeOf(context).languageCode;
            save = context.l10n.save;
            cancel = MaterialLocalizations.of(context).cancelButtonLabel;
            return Scaffold(body: Text(save));
          },
        ),
      );
      sweep.look();
    });
    expect(language, locale.languageCode);
    expect(save, lookupAppLocalizations(locale).save);
    expect(cancel.toLowerCase(), isNot('cancel'));
  });
  for (final MapEntry(key: name, value: screen) in _screens.entries) {
    for (final scale in _scales) {
      testWidgets('$name in $code at ${scale}x', (tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        final sweep = Sweep(tester, scale, data: screen.data)..phone();
        try {
          await sweep.run(() => screen.visit(sweep));
        } finally {
          debugDefaultTargetPlatformOverride = null;
        }
        final known = baseline.of(name, scale);
        final added = [
          for (final MapEntry(:key, :value) in sweep.overflows.entries)
            if (!known.contains('overflow\t$key')) '$key: $value',
        ]..sort();
        expect(added, isEmpty, reason: 'Overflow in "$name" in $code at ${scale}x. Give the row room (Flexible, Expanded, Wrap or an ellipsis), or shorten the translation.\n${added.join('\n')}');
      });
    }
  }
}

void main() {
  final realLocale = Platform.environment['L10N_SWEEP_LOCALE'];
  if (realLocale != null && realLocale.isNotEmpty) return _realLocaleSweep(realLocale);
  final on = AppLocalizations.supportedLocales.contains(AppLanguage.pseudo);
  if (!on) {
    // scripts/l10n-sweep.sh sets this, so that a missing pseudo-locale can't pass as a clean run.
    final wanted = Platform.environment['L10N_SWEEP'] == '1';
    test('pseudo-locale sweep', () => fail('The pseudo-locale was not generated.'), skip: wanted ? false : 'The pseudo-locale is off: run scripts/l10n-sweep.sh');
    return;
  }

  TestWidgetsFlutterBinding.ensureInitialized();
  final update = Platform.environment['UPDATE_L10N_BASELINE'] == '1';
  final baseline = SweepBaseline(_baseline);

  setUpAll(loadSweepFonts);
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    AppLanguage.debugSet(AppLanguage.pseudo);
  });
  tearDown(() => AppLanguage.debugSet(null));

  // The sweep's own check: a screen with both faults must not come out clean.
  testWidgets('the sweep catches an overflow and a word outside the translations', (tester) async {
    final sweep = Sweep(tester, kMaxTextScale)..phone();
    await sweep.run(() async {
      await sweep.open(
        Builder(
          builder: (context) => Scaffold(body: Row(children: [Text(context.l10n.save), const SizedBox(width: 400, child: Text('Typed in by hand'))])),
        ),
      );
      sweep.look();
    });
    expect(sweep.unlocalized, {'Typed in by hand'});
    expect(sweep.overflows.keys.single, 'test/l10n_sweep_test.dart Row right');
  });

  for (final MapEntry(key: name, value: screen) in _screens.entries) {
    for (final scale in _scales) {
      testWidgets('$name at ${scale}x', (tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        final sweep = Sweep(tester, scale, data: screen.data)..phone();
        try {
          await sweep.run(() => screen.visit(sweep));
        } finally {
          debugDefaultTargetPlatformOverride = null;
        }
        final found = SweepBaseline.findings(sweep);
        if (update) {
          // The pixels and the line, for whoever fixes them; the list keeps neither.
          for (final MapEntry(:key, :value) in sweep.overflows.entries) {
            // ignore: avoid_print
            print('$name at ${scale}x: $key: $value');
          }
          baseline.update(name, scale, found);
          return;
        }
        final known = baseline.of(name, scale);
        final added = found.difference(known).toList()..sort();
        final gone = known.difference(found).toList()..sort();
        expect(
          added,
          isEmpty,
          reason: 'New in "$name" at ${scale}x. A text: put it in lib/l10n/app_en.arb (made-up test data goes in the '
              "screen's `data` list). An overflow: give the row room (Flexible, Expanded, Wrap or an ellipsis).\n"
              '${[for (final a in added) a.startsWith('overflow\t') ? '$a: ${sweep.overflows[a.substring(9)]}' : a].join('\n')}',
        );
        expect(gone, isEmpty, reason: 'Fixed, or moved: shorten the list with `scripts/l10n-sweep.sh --update`.\n${gone.join('\n')}');
      });
    }
  }
}
