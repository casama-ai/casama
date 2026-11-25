import 'package:casama/features/admin/abuse_tab.dart';
import 'package:casama/features/admin/users_tab.dart';
import 'package:casama/features/admin/workspaces_tab.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

/// Admin → Workspaces, Users and Abuse (docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §6).
class _Backend extends FakeBackend {
  @override
  Future<List<AdminOrg>> adminOrgs() async => [
    _org('a', 'Acme', cost: 45, limits: {'max_bots': 10, 'monthly_usd': 50}),
    _org('b', 'Beta', cost: 60, limits: {'monthly_usd': 50}),
    _org('c', 'Gamma', cost: 2, suspended: 'Spam'),
    _org('d', 'Delta', cost: 1),
  ];

  @override
  Future<List<AdminUser>> adminUsers() async => [
    _user('u1', 'active@example.com', days: 1, state: AdminUserInactivityStateEnum.active),
    _user('u2', 'resting@example.com', days: 200, state: AdminUserInactivityStateEnum.resting),
    _user('u3', 'leaving@example.com', days: 340, state: AdminUserInactivityStateEnum.removalSoon),
    _user('u4', 'kept@example.com', days: 400, state: AdminUserInactivityStateEnum.resting, keep: true),
  ];

  @override
  Future<List<AbuseEvent>> adminAbuseEvents() async => [
    _event('e1', 'mining_pool', {'target': 'xmr.nanopool.org:443'}),
    _event('e2', 'blocked_port', {'target': 'smtp.example.com:25'}),
    _event('e3', 'unsuspended', {}),
  ];
}

AdminOrg _org(String id, String name, {num cost = 0, Map<String, num> limits = const {}, String? suspended}) =>
    AdminOrg(
      id: id,
      name: name,
      planCode: 'pro',
      limits: limits,
      members: 2,
      bots: 3,
      cost30dUsd: cost,
      suspendedAt: suspended == null ? null : '2026-11-10T00:00:00Z',
      suspendedReason: suspended,
    );

AdminUser _user(String id, String email, {required int days, AdminUserInactivityStateEnum? state, bool keep = false}) =>
    AdminUser(
      id: id,
      email: email,
      createdAt: DateTime(2026),
      lastSignInAt: null,
      orgs: 1,
      lastActiveAt: DateTime.now().subtract(Duration(days: days)),
      inactivityState: state,
      keep: keep,
    );

AbuseEvent _event(String id, String kind, Map<String, Object?> detail) => AbuseEvent(
  id: id,
  orgId: orgId,
  orgName: 'Test Org',
  computerId: null,
  kind: kind,
  action: 'logged',
  detail: detail,
  createdAt: DateTime.now().subtract(const Duration(hours: 3)).toUtc().toIso8601String(),
);

/// The section on its own, as the console draws it once unlocked (the lock and the side list are
/// covered by admin_test.dart).
Future<_Backend> _open(
  WidgetTester tester,
  String section, {
  Size size = const Size(1300, 900),
  bool billing = false,
}) async {
  await setSize(tester, size);
  final backend = _Backend()..billingEnabled = billing;
  final Widget tab = switch (section) {
    'workspaces' => const WorkspacesTab(),
    'users' => const UsersTab(),
    _ => const AbuseTab(),
  };
  await tester.pumpWidget(harness(backend, Scaffold(body: tab)));
  await tester.pumpAndSettle();
  return backend;
}

Finder _row(String id) => find.byKey(Key('adminOrg-$id'));

void main() {
  testWidgets('search and filters narrow the workspaces, and caps show as pills', (tester) async {
    await _open(tester, 'workspaces');
    for (final id in ['a', 'b', 'c', 'd']) {
      expect(_row(id), findsOneWidget);
    }
    expect(find.textContaining(r'Near $50'), findsOneWidget);
    expect(find.text('Over cap'), findsOneWidget);
    expect(find.text('Suspended: Spam'), findsOneWidget);
    expect(find.textContaining('Max 10 bots'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('adminWsSearch')), 'acm');
    await tester.pumpAndSettle();
    expect(_row('a'), findsOneWidget);
    expect(_row('b'), findsNothing);

    await tester.enterText(find.byKey(const Key('adminWsSearch')), 'zzz');
    await tester.pumpAndSettle();
    expect(find.text('No workspaces match'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('adminWsSearch')), '');
    await tester.tap(find.byKey(const Key('adminFilter-_WsFilter.nearCap')));
    await tester.pumpAndSettle();
    expect(_row('a'), findsOneWidget);
    expect(_row('b'), findsOneWidget);
    expect(_row('c'), findsNothing);

    await tester.tap(find.byKey(const Key('adminFilter-_WsFilter.suspended')));
    await tester.pumpAndSettle();
    expect(_row('c'), findsOneWidget);
    expect(_row('a'), findsNothing);
  });

  testWidgets('a quota switched to No limit is left out, and bad numbers are refused', (tester) async {
    final backend = await _open(tester, 'workspaces');
    await tester.tap(find.descendant(of: _row('a'), matching: find.byTooltip('More actions')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('editQuotas-a')));
    await tester.pumpAndSettle();
    expect(find.text('Now: 3 bots'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('monthlyUsd')), '0');
    await tester.tap(find.byKey(const Key('saveQuota')));
    await tester.pumpAndSettle();
    expect(find.text('Enter a number above 0'), findsOneWidget);
    expect(backend.setLimits, isNull);

    await tester.enterText(find.byKey(const Key('monthlyUsd')), '75');
    await tester.tap(find.byKey(const Key('noLimit-maxBots')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('saveQuota')));
    await tester.pumpAndSettle();
    expect(backend.setLimits, {'monthly_usd': 75});
  });

  testWidgets('suspending and lifting both ask first', (tester) async {
    final backend = await _open(tester, 'workspaces');
    await tester.tap(find.descendant(of: _row('d'), matching: find.byTooltip('More actions')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('suspend-d')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('confirmSuspend')), findsOneWidget);
    await tester.tap(find.text('Cancel').last);
    await tester.pumpAndSettle();
    expect(backend.suspendedReason, isNull);

    await tester.tap(find.descendant(of: _row('c'), matching: find.byTooltip('More actions')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('suspend-c')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('confirmUnsuspend')), findsOneWidget);
    expect(find.text('Lift the suspension on Gamma?'), findsOneWidget);
  });

  testWidgets('a workspace row opens its details', (tester) async {
    await _open(tester, 'workspaces');
    await tester.tap(_row('a'));
    await tester.pumpAndSettle();
    final sheet = find.byKey(const Key('adminWorkspaceSheet'));
    expect(sheet, findsOneWidget);
    expect(find.descendant(of: sheet, matching: find.text('a')), findsOneWidget);
    expect(find.byKey(const Key('adminCopyId')), findsOneWidget);
    expect(find.byKey(const Key('sheetEditQuotas')), findsOneWidget);
    expect(find.byKey(const Key('sheetSuspend')), findsOneWidget);
  });

  testWidgets('saved resets are offered only when billing is on', (tester) async {
    await _open(tester, 'workspaces', billing: true);
    await tester.tap(find.descendant(of: _row('a'), matching: find.byTooltip('More actions')));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Give a saved reset'), findsOneWidget);
  });

  testWidgets('users filter by where the account is', (tester) async {
    await _open(tester, 'users');
    final list = find.byKey(const Key('adminUsersList'));
    expect(find.descendant(of: list, matching: find.text('active@example.com')), findsOneWidget);
    await tester.tap(find.byKey(const Key('adminFilter-_UserFilter.resting')));
    await tester.pumpAndSettle();
    expect(find.descendant(of: list, matching: find.text('resting@example.com')), findsOneWidget);
    expect(find.descendant(of: list, matching: find.text('active@example.com')), findsNothing);
    // A kept account is never rested, so it shows under Kept instead.
    expect(find.descendant(of: list, matching: find.text('kept@example.com')), findsNothing);
    await tester.tap(find.byKey(const Key('adminFilter-_UserFilter.kept')));
    await tester.pumpAndSettle();
    expect(find.descendant(of: list, matching: find.text('kept@example.com')), findsOneWidget);

    await tester.tap(find.byKey(const Key('adminFilter-_UserFilter.all')));
    await tester.enterText(find.byKey(const Key('adminUsersSearch')), 'leaving');
    await tester.pumpAndSettle();
    expect(find.descendant(of: list, matching: find.text('leaving@example.com')), findsOneWidget);
    expect(find.descendant(of: list, matching: find.text('kept@example.com')), findsNothing);

    await tester.tap(find.byKey(const Key('adminUser-u3')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('adminUserSheet')), findsOneWidget);
  });

  testWidgets('abuse filters by kind', (tester) async {
    await _open(tester, 'abuse');
    expect(find.text('Crypto mining blocked'), findsOneWidget);
    expect(find.text('Mail port blocked'), findsOneWidget);
    // Relative times, not raw ISO strings.
    expect(find.byWidgetPredicate((w) => w.runtimeType.toString() == 'TimeAgo'), findsNWidgets(3));
    await tester.tap(find.byKey(const Key('adminFilter-_AbuseFilter.ports')));
    await tester.pumpAndSettle();
    expect(find.text('Mail port blocked'), findsOneWidget);
    expect(find.text('Crypto mining blocked'), findsNothing);
    await tester.tap(find.byKey(const Key('adminFilter-_AbuseFilter.floods')));
    await tester.pumpAndSettle();
    expect(find.text('Nothing of this kind.'), findsOneWidget);
  });

  for (final size in const [Size(360, 800), Size(1300, 900)]) {
    for (final section in const ['workspaces', 'users']) {
      testWidgets('$section has no overflow at ${size.width.toInt()}x${size.height.toInt()}', (tester) async {
        await _open(tester, section, size: size);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
