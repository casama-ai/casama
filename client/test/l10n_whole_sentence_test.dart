// Messages that pick a whole sentence by a code (D-597): every code the app passes has its own
// branch, so a renamed enum value or a typo can't quietly fall back to the generic sentence.
import 'package:casama/core/list_format.dart';
import 'package:casama/l10n/generated/app_localizations_en.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  final l10n = AppLocalizationsEn();
  setUpAll(initializeDateFormatting);

  test('every kind of device data has its own sentences', () {
    final asks = <String>{};
    for (final kind in DeviceKind.values) {
      final ask = l10n.deviceAccessAsk(kind.name, 'Milo');
      expect(
        ask,
        startsWith('Milo would like to use your '),
        reason: kind.name,
      );
      expect(ask, isNot(contains('device data')), reason: kind.name);
      expect(
        l10n.deviceAccessGranted(kind.name),
        isNot(contains('device data')),
        reason: kind.name,
      );
      expect(
        l10n.deviceAccessNotShared(kind.name),
        isNot(contains('device data')),
        reason: kind.name,
      );
      expect(
        l10n.deviceAllowBotAsk(kind.name),
        isNot(contains('device data')),
        reason: kind.name,
      );
      asks.add(ask);
    }
    expect(asks, hasLength(DeviceKind.values.length));
    expect(
      l10n.deviceAccessAsk('browserTab', 'Milo'),
      'Milo would like to use your current browser tab',
    );
  });

  test('notification kinds, sensitive sites, gallery kinds and mail ages', () {
    expect(
      [
        for (final k in [
          'replies',
          'needsYou',
          'routines',
          'suggestions',
          'account',
        ])
          l10n.pushKindOff(k),
      ],
      [
        'Replies off',
        'Needs you off',
        'Routines and briefs off',
        'Suggestions and check-ins off',
        'Account off',
      ],
    );
    for (final k in ['banking', 'health', 'passwords', 'government']) {
      expect(
        l10n.appBrowserSiteKindAsks(k),
        isNot(startsWith('These sites')),
        reason: k,
      );
    }
    final titles = {
      for (final k in [
        'app',
        'bot',
        'routine',
        'plugin',
        'set',
        'theme',
        'scheme',
        'wallpaper',
        'skill',
      ])
        l10n.gallerySubmitKindTitle(k),
    };
    expect(titles, hasLength(9));
    expect(l10n.gallerySubmitKindTitle('app'), 'Submit an App');
    expect(
      l10n.botEmailDeleteOlderConfirm('days30'),
      'Delete all mail older than 30 days?',
    );
    expect(
      l10n.botEmailDeleteOlderConfirm('months6'),
      'Delete all mail older than 6 months?',
    );
    expect(
      l10n.botEmailDeleteOlderConfirm('year'),
      'Delete all mail older than a year?',
    );
  });

  test('store sentences and subscription fine print', () {
    expect(
      l10n.subscribedThroughStoreNote('app_store'),
      startsWith('You subscribe through the App Store.'),
    );
    expect(
      l10n.subscribedThroughStoreNote('google_play'),
      startsWith('You subscribe through Google Play.'),
    );
    expect(l10n.paywallPriceWithPeriod(r'$9.99', 'week'), r'$9.99 per week');
    expect(l10n.paywallPriceWithPeriod(r'$9.99', 'month'), r'$9.99 per month');
    expect(l10n.paywallPriceWithPeriod(r'$99', 'year'), r'$99 per year');
    expect(
      l10n.paywallStoreDisclosure(r'$9.99 per month', 'app_store'),
      r'$9.99 per month, renewing automatically until you cancel. Payment is charged to your Apple Account. '
      'Cancel anytime in your Apple Account settings at least 24 hours before it renews.',
    );
    expect(
      l10n.paywallStoreDisclosureTrial(7, r'$9.99 per month', 'google_play'),
      r'Free for 7 days, then $9.99 per month, renewing automatically until you cancel. '
      'Payment is charged to your Google Play account when the trial ends. '
      "Cancel in your Google Play account settings at least 24 hours before the trial ends and you won't be charged.",
    );
  });

  test('trial lengths take the singular', () {
    expect(
      l10n.paywallStoreDisclosureTrial(1, r'$9.99 per month', 'app_store'),
      startsWith(r'Free for 1 day, then $9.99 per month, renewing'),
    );
    expect(
      l10n.paywallDisclosureWebTrial(1, r'$9.99 per month'),
      startsWith(r'Free for 1 day, then $9.99 per month, renewing'),
    );
    expect(
      l10n.paywallDisclosureWebTrial(7, r'$9.99 per month'),
      startsWith(r'Free for 7 days, then $9.99 per month, renewing'),
    );
    expect(
      l10n.paywallTrialThenYearly(7, r'$99'),
      r'7 days free, then $99/yr',
    );
    expect(
      l10n.paywallTrialThenMonthly(1, r'$9.99'),
      r'1 day free, then $9.99/mo',
    );
  });

  test('every kind of pollen has its own label', () {
    // The codes the server sends (packages/agent/src/live-data/weather.ts).
    for (final kind in [
      'alder',
      'birch',
      'grass',
      'mugwort',
      'olive',
      'ragweed',
    ]) {
      expect(
        l10n.cardPollenKind(kind).toLowerCase(),
        '$kind pollen',
        reason: kind,
      );
    }
    expect(l10n.cardPollenKind('new'), 'Pollen');
  });

  test('lists are joined with the language’s own separator', () {
    expect(joinList('en', ['email', 'calendar']), 'email, calendar');
    expect(joinList('ja', ['メール', 'カレンダー']), 'メール、カレンダー');
    expect(joinList('zh_Hant', ['郵件', '行事曆']), '郵件、行事曆');
    expect(joinList('de', ['E-Mail']), 'E-Mail');
  });

  test('counts take the singular', () {
    expect(l10n.suggestionsTitle(1), 'Found 1 thing worth a look');
    expect(l10n.suggestionsTitle(3), 'Found 3 things worth a look');
    expect(l10n.replayRuns(1, 0), 'run 1 time, 0 needed help');
    expect(l10n.replayRuns(1200, 1), 'run 1,200 times, 1 needed help');
    expect(
      l10n.resetsPreviewMessage(1, r'$2.00', r'$1.00'),
      r'1 workspace. Maximum refill: $2.00. Estimated cost: $1.00.',
    );
  });
}
