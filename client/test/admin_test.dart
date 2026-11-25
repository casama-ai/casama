import 'package:casama_sdk/casama_sdk.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:casama/features/admin/admin_screen.dart';
import 'package:casama/features/admin/pricing_tab.dart';
import 'package:casama/features/admin/services_tab.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';
import 'admin_test_helpers.dart';

void main() {
  testWidgets('the owner sees totals, an update notice, and can set quotas', (tester) async {
    await setSize(tester, const Size(900, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    expect(find.byKey(const Key('updateNotice')), findsOneWidget);
    expect(find.text('Casama 0.9.1 is available (you run 0.6.0)'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    await openAdminSection(tester, 'workspaces');
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('More actions'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Edit quotas'));
    await tester.pumpAndSettle();
    // No quotas yet: both start on "No limit".
    await tester.tap(find.byKey(const Key('noLimit-maxBots')));
    await tester.tap(find.byKey(const Key('noLimit-monthlyUsd')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('maxBots')), '3');
    await tester.enterText(find.byKey(const Key('monthlyUsd')), '25');
    await tester.tap(find.byKey(const Key('saveQuota')));
    await tester.pumpAndSettle();
    expect(backend.setLimits, {'max_bots': 3, 'monthly_usd': 25});

    await openAdminSection(tester, 'services');
    await tester.pumpAndSettle();
    // Health comes first, so the service list is in view without scrolling.
    expect(find.text('Postgres (Supabase)'), findsOneWidget);
    expect(tester.getRect(find.text('Postgres (Supabase)')).bottom, lessThan(1000));
  });

  testWidgets('services: health comes first, with the down service on top', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = _ServicesBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'services');
    await tester.pumpAndSettle();
    expect(find.text('1 service is down'), findsOneWidget);
    final health = find.byKey(const Key('servicesHealth'));
    expect(health, findsOneWidget);
    // Health sits above the models, connections and the rest.
    expect(tester.getTopLeft(health).dy, lessThan(tester.getTopLeft(find.byKey(const Key('cloudModels'))).dy));
    expect(tester.getTopLeft(find.byKey(const Key('cloudModels'))).dy, lessThan(tester.getTopLeft(find.byKey(const Key('connectionsServer'))).dy));
    // The counts: 1 OK, 1 down, 1 off.
    String stat(String key) => tester.widget<Text>(find.descendant(of: find.byKey(Key(key)), matching: find.text('1'))).data!;
    expect(stat('servicesOk'), '1');
    expect(stat('servicesDown'), '1');
    expect(stat('servicesOff'), '1');
    // Down first, then OK, then off, whatever order the server sent.
    final down = tester.getTopLeft(find.byKey(const Key('service-Mail'))).dy;
    final ok = tester.getTopLeft(find.byKey(const Key('service-Database'))).dy;
    final off = tester.getTopLeft(find.byKey(const Key('service-Search'))).dy;
    expect(down, lessThan(ok));
    expect(ok, lessThan(off));
    expect(find.descendant(of: find.byKey(const Key('service-Mail')), matching: find.text('Down')), findsOneWidget);
    // The cloud models row sums up the chat model and how many models run.
    expect(find.text('Chat on deepseek/deepseek-v4.1-flash-1017, 7 models in all'), findsOneWidget);
  });

  testWidgets('services: an empty model field says so instead of saving', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'services');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('cloudModels')));
    await tester.pumpAndSettle();
    expect(find.text('Chat & background'), findsOneWidget);
    expect(find.text('Voice'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('cloudChat')), '  ');
    await tester.tap(find.byKey(const Key('saveCloudModels')));
    await tester.pumpAndSettle();
    expect(find.text('Enter a model id.'), findsOneWidget);
    expect(backend.cloudModels.chat, 'deepseek/deepseek-v4.1-flash-1017');
    await tester.enterText(find.byKey(const Key('cloudChat')), 'acme/chat-2');
    await tester.pumpAndSettle();
    expect(find.text('Enter a model id.'), findsNothing);
    await tester.tap(find.byKey(const Key('saveCloudModels')));
    await tester.pumpAndSettle();
    expect(backend.cloudModels.chat, 'acme/chat-2');
  });

  testWidgets('services: each plan picks Default, On or Off on one control', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'services');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('adminModelAccess')));
    await tester.pumpAndSettle();
    final pro = find.byKey(const Key('adminCasamaModelsPlan-pro'));
    await tester.ensureVisible(pro);
    await tester.pumpAndSettle();
    await tester.tap(find.descendant(of: pro, matching: find.text('Off')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('saveModelAccess')));
    await tester.pumpAndSettle();
    expect(backend.modelAccess.casamaModels.plans['pro'], AdminModelAccessCasamaModelsPlansEnum.off);
    expect(backend.modelAccess.casamaModels.plans.containsKey('free'), isFalse);
  });

  for (final size in const [Size(360, 800), Size(1200, 900)]) {
    for (final tab in const ['services', 'pricing']) {
      testWidgets('$tab lays out without overflow at ${size.width.toInt()} wide', (tester) async {
        await setSize(tester, size);
        final backend = _ServicesBackend();
        await tester.pumpWidget(
          harness(backend, Scaffold(body: tab == 'services' ? const ServicesTab() : const PricingTab())),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(Key(tab == 'services' ? 'servicesHealth' : 'adminPlan-pro')), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('the owner chooses how apps without their own sign-in connect', (tester) async {
    await setSize(tester, const Size(900, 1200));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'services');
    await tester.pumpAndSettle();
    expect(find.text('App Connections'), findsOneWidget);
    expect(find.text("Casama's Composio Account"), findsOneWidget);
    await tester.tap(find.byKey(const Key('connectionsOwn')));
    await tester.pumpAndSettle();
    expect(backend.connectionSettings.composio.value, 'own');
    await tester.tap(find.byKey(const Key('connectionsServer')));
    await tester.pumpAndSettle();
    expect(backend.connectionSettings.composio.value, 'server');
    // Google's apps: Composio by default, Google's own servers on request (D-166).
    expect(backend.connectionSettings.google.value, 'composio');
    await tester.ensureVisible(find.byKey(const Key('connectionsGoogleDirect')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('connectionsGoogleDirect')));
    await tester.pumpAndSettle();
    expect(backend.connectionSettings.google.value, 'direct');
    expect(backend.connectionSettings.composio.value, 'server');
    await tester.tap(find.byKey(const Key('connectionsGoogleComposio')));
    await tester.pumpAndSettle();
    expect(backend.connectionSettings.google.value, 'composio');
  });

  testWidgets('the owner suspends a workspace, lifts it, and reviews abuse', (tester) async {
    await setSize(tester, const Size(900, 1000));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await openAdminSection(tester, 'workspaces');
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('More actions'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('suspend-$orgId')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('suspendReason')), 'Spam reports');
    await tester.tap(find.byKey(const Key('confirmSuspend')));
    await tester.pumpAndSettle();
    expect(backend.suspendedReason, 'Spam reports');
    expect(find.textContaining('Suspended: Spam reports'), findsOneWidget);
    await tester.tap(find.byTooltip('More actions'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('suspend-$orgId')));
    await tester.pumpAndSettle();
    // Lifting it asks first too.
    expect(backend.suspendedReason, 'Spam reports');
    await tester.tap(find.byKey(const Key('confirmUnsuspend')));
    await tester.pumpAndSettle();
    expect(backend.suspendedReason, isNull);

    // Abuse is the last tab, past Reports and Support (D-301, D-303).
    await tester.pumpAndSettle();
    await openAdminSection(tester, 'abuse');
    await tester.pumpAndSettle();
    expect(find.text('Crypto mining blocked'), findsOneWidget);
    expect(find.textContaining('xmr.nanopool.org:443'), findsOneWidget);
  });

  testWidgets('everyone else sees that the console is owner-only', (tester) async {
    final backend = FakeBackend()..isOwner = false;
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminPassword')), findsNothing);
    expect(find.text('Only the instance owner can open the admin console.'), findsOneWidget);
  });

  testWidgets('the mail tab pauses addresses and reserves names', (tester) async {
    await setSize(tester, const Size(1100, 1000));
    final backend = FakeBackend();
    backend.adminMailList = [
      AdminMailAddress(
        id: 'ma-1',
        address: 'ada@mail.test',
        orgId: orgId,
        orgName: 'Acme',
        botId: botId,
        botName: 'Ada',
        status: AdminMailAddressStatusEnum.active,
        autoPaused: false,
        sent30d: 12,
        bounced30d: 3,
        complained30d: 0,
        createdAt: '2026-11-01T00:00:00.000Z',
      ),
    ];
    backend.adminMailSent = (sent: 412, ceiling: 900);
    await tester.pumpWidget(harness(backend, const AdminScreen(tab: 'mail')));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    expect(find.text('ada@mail.test'), findsOneWidget);
    expect(find.text('Sent today: 412 of 900'), findsOneWidget);
    expect(find.textContaining('12 sent · 3 bounced · 0 complained'), findsOneWidget);
    // Pause sits in the row's menu and asks first.
    await tester.tap(find.byKey(const Key('adminMailMenu-ma-1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('adminMailStatus-ma-1')));
    await tester.pumpAndSettle();
    expect(backend.adminMailActions, isEmpty);
    await tester.tap(find.byKey(const Key('confirmMailStatus')));
    await tester.pumpAndSettle();
    expect(backend.adminMailActions, contains('status:ma-1:paused'));
    await tester.tap(find.byKey(const Key('mailReserved')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('mailReservedNames')), 'mayor\nsheriff');
    await tester.tap(find.byKey(const Key('saveMailReserved')));
    await tester.pumpAndSettle();
    expect(backend.adminMailActions, contains('reserved:mayor,sheriff'));
  });

  testWidgets('the mail tab searches addresses, and says when there are none', (tester) async {
    await setSize(tester, const Size(1100, 1200));
    AdminMailAddress address(String id, String address, String bot, String org) => AdminMailAddress(
      id: id,
      address: address,
      orgId: orgId,
      orgName: org,
      botId: botId,
      botName: bot,
      status: AdminMailAddressStatusEnum.active,
      autoPaused: false,
      sent30d: 1,
      bounced30d: 0,
      complained30d: 0,
      createdAt: '2026-11-01T00:00:00.000Z',
    );
    final backend = FakeBackend()
      ..adminMailList = [address('ma-1', 'ada@mail.test', 'Ada', 'Acme'), address('ma-2', 'max@mail.test', 'Max', 'Globex')];
    await tester.pumpWidget(harness(backend, const AdminScreen(tab: 'mail')));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    expect(find.byKey(const Key('adminMail-ma-1')), findsOneWidget);
    expect(find.byKey(const Key('adminMail-ma-2')), findsOneWidget);
    // By workspace name.
    await tester.enterText(find.byKey(const Key('adminMailSearch')), 'globex');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminMail-ma-1')), findsNothing);
    expect(find.byKey(const Key('adminMail-ma-2')), findsOneWidget);
    await tester.enterText(find.byKey(const Key('adminMailSearch')), 'nobody');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminMailNoMatch')), findsOneWidget);

    backend.adminMailList = [];
    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(harness(backend, const AdminScreen(tab: 'mail')));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    expect(find.byKey(const Key('adminMailEmpty')), findsOneWidget);
  });
}

/// Three services sent OK, down and off in a mixed order.
class _ServicesBackend extends FakeBackend {
  @override
  Future<List<AdminService>> adminServices() async => [
    AdminService(name: 'Database', configured: true, healthy: true, detail: 'Postgres (Supabase)'),
    AdminService(name: 'Search', configured: false, healthy: null, detail: 'Not set up'),
    AdminService(name: 'Mail', configured: true, healthy: false, detail: 'SMTP refused'),
  ];
}
