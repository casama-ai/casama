import 'package:casama/features/owner_live/owner_live_models.dart';
import 'package:casama/features/owner_live/owner_live_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// Settings → Live activity (D-527, docs/OWNER-ALERTS-PLAN.md).

LiveEvent _event(int id, String kind, String title, String body, {String? journeyId, LiveJourney? journey, String? label}) =>
    LiveEvent(id: id, kind: kind, title: title, body: body, createdAt: DateTime.now(), journeyId: journeyId, journey: journey, label: label);

void main() {
  testWidgets('shows today, the feed, and new events as they arrive', (tester) async {
    await setSize(tester, const Size(430, 1400));
    final backend = FakeBackend()
      ..liveToday = {'waitlist_joined': 12, 'signup': 3, 'download_click': 40, 'app_first_open': 10, 'purchase': 1}
      ..liveEvents = [
        _event(1, 'waitlist_joined', 'Joined the waitlist', 'jo•••@example.com · from the home page'),
        _event(2, 'download_click', 'Download: Mac (download)', 'from /download · PH'),
      ];
    await tester.pumpWidget(harness(backend, const OwnerLiveScreen(pollEvery: Duration(seconds: 1))));
    await tester.pumpAndSettle();

    expect(find.text('Live activity'), findsOneWidget);
    // Today's funnel, each step with its share of the one before (D-537).
    expect(find.descendant(of: find.byKey(const Key('liveFunnel-download_click')), matching: find.text('40')), findsOneWidget);
    expect(find.descendant(of: find.byKey(const Key('liveFunnel-app_first_open')), matching: find.text('First opens · 25%')), findsOneWidget);
    expect(find.descendant(of: find.byKey(const Key('liveFunnel-signup')), matching: find.text('Accounts · 30%')), findsOneWidget);
    expect(find.text('Download: Mac (download)'), findsOneWidget);
    // Newest first.
    expect(
      tester.getTopLeft(find.text('Download: Mac (download)')).dy,
      lessThan(tester.getTopLeft(find.text('Joined the waitlist')).dy),
    );

    backend.liveEvents = [...backend.liveEvents, _event(3, 'signup', 'New account', 'ne•••@example.com · google')];
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('New account'), findsOneWidget);
    expect(backend.liveQueries.last.after, 2);

    // A filter asks again for its kinds only.
    await tester.tap(find.byKey(const Key('adminFilter-LiveGroup.website')));
    await tester.pumpAndSettle();
    expect(backend.liveQueries.last.kinds, containsAll(['download_click', 'qr_open']));
    expect(find.text('New account'), findsNothing);
    expect(find.text('Download: Mac (download)'), findsOneWidget);
  });

  testWidgets('switches each kind of alert, pauses them all and sends a test', (tester) async {
    await setSize(tester, const Size(430, 1600));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const OwnerLiveScreen(pollEvery: Duration(hours: 1))));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Alerts'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('liveSwitch-qr_open')));
    await tester.pumpAndSettle();
    expect(backend.liveAlertChanges.last, {'kinds': {'qr_open': true}});
    expect(tester.widget<Switch>(find.byKey(const Key('liveSwitch-qr_open'))).value, isTrue);

    await tester.tap(find.byKey(const Key('liveTest')));
    await tester.pumpAndSettle();
    expect(backend.liveTests, 1);
    expect(find.text('Test alert sent to your devices'), findsOneWidget);

    await tester.tap(find.byKey(const Key('livePauseSwitch')));
    await tester.pumpAndSettle();
    expect(backend.liveAlertChanges.last, {'paused': true});
    // Paused: the kinds can't be switched until it's on again.
    expect(tester.widget<Switch>(find.byKey(const Key('liveSwitch-signup'))).onChanged, isNull);
  });

  testWidgets('groups a person\'s steps, opens their journey, and searches (D-537)', (tester) async {
    await setSize(tester, const Size(430, 1600));
    const steps = LiveJourneySteps(click: true, open: true, signup: true);
    const journey = LiveJourney(id: 'j-ana', platform: 'android', country: 'PH', source: 'reddit', distribution: 'google_play', steps: steps);
    final backend = FakeBackend()
      ..liveEvents = [
        _event(1, 'download_click', 'Download: Android', 'from /download', journeyId: 'j-ana', journey: journey),
        _event(2, 'app_first_open', 'Opened the app: Android', 'Google Play · clicked Android · 3 min before', journeyId: 'j-ana', journey: journey),
        _event(3, 'signup', 'New account', 'ana@example.com · google', journeyId: 'j-ana', journey: journey, label: 'ana@example.com'),
        _event(4, 'waitlist_joined', 'Joined the waitlist', 'bo@example.com', label: 'bo@example.com'),
      ];
    backend.liveJourneys['j-ana'] = LiveJourneyDetail(
      journey: journey,
      events: [backend.liveEvents[0], backend.liveEvents[1], backend.liveEvents[2]],
      person: const LiveJourneyPerson(email: 'ana@example.com', messages: 14, bots: 2, devices: ['android']),
    );
    await tester.pumpWidget(harness(backend, const OwnerLiveScreen(pollEvery: Duration(hours: 1))));
    await tester.pumpAndSettle();

    // By person: one row for Ana (her newest step), with how many steps and where she came from.
    expect(find.text('New account'), findsOneWidget);
    expect(find.text('Opened the app: Android'), findsNothing);
    expect(find.text('3 steps'), findsOneWidget);
    expect(find.text('reddit'), findsOneWidget);
    expect(find.text('🇵🇭 PH'), findsOneWidget);

    // Every event.
    await tester.tap(find.byKey(const Key('liveByPerson')));
    await tester.pumpAndSettle();
    expect(find.text('Opened the app: Android'), findsOneWidget);
    expect(find.text('Download: Android'), findsOneWidget);

    // Search by address.
    await tester.enterText(find.byKey(const Key('liveSearch')), 'bo@');
    await tester.pumpAndSettle();
    expect(find.text('Joined the waitlist'), findsOneWidget);
    expect(find.text('New account'), findsNothing);
    await tester.enterText(find.byKey(const Key('liveSearch')), '');
    await tester.pumpAndSettle();

    // Tap: the whole journey, oldest first, and what she has now.
    await tester.tap(find.text('New account'));
    await tester.pumpAndSettle();
    expect(backend.journeyQueries, ['j-ana']);
    final sheet = find.byKey(const Key('liveJourneySheet'));
    expect(sheet, findsOneWidget);
    expect(find.descendant(of: sheet, matching: find.text('ana@example.com')), findsWidgets);
    expect(find.descendant(of: sheet, matching: find.text('14')), findsOneWidget);
    expect(find.descendant(of: sheet, matching: find.text('Google Play')), findsOneWidget);
    expect(
      tester.getTopLeft(find.descendant(of: sheet, matching: find.text('Download: Android'))).dy,
      lessThan(tester.getTopLeft(find.descendant(of: sheet, matching: find.text('New account'))).dy),
    );
  });

  testWidgets('a push with a journey opens it at once (D-537)', (tester) async {
    await setSize(tester, const Size(430, 1400));
    const journey = LiveJourney(id: 'j-push', platform: 'ios', likely: true, steps: LiveJourneySteps(click: true, open: true));
    final backend = FakeBackend();
    backend.liveJourneys['j-push'] = LiveJourneyDetail(
      journey: journey,
      events: [_event(9, 'app_first_open', 'Opened the app: iPhone', 'App Store · likely a click 7 min before', journeyId: 'j-push', journey: journey)],
    );
    await tester.pumpWidget(harness(backend, const OwnerLiveScreen(pollEvery: Duration(hours: 1), journey: 'j-push')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('liveJourneySheet')), findsOneWidget);
    expect(find.text('Opened the app: iPhone'), findsOneWidget);
    // A guess says it's one.
    expect(find.textContaining('good guess'), findsOneWidget);
  });
}
