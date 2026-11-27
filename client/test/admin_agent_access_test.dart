import 'package:casama/core/admin_device_key.dart';
import 'package:casama/core/admin_security.dart';
import 'package:casama/features/admin/agent_access.dart';
import 'package:casama/features/admin/security_tab.dart';
import 'package:casama_sdk/casama_sdk.dart'
    show
        AdminAgentLogEntry,
        AdminAgentRequest,
        AdminAgentRequestStatusEnum,
        AdminDeviceKey,
        AdminDeviceKeyScopeEnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness;
import 'fake_backend.dart';

/// D-598: an agent's request opened from its push, and the Agents section in Admin → Security.
void main() {
  AdminAgentRequest request({
    String id = 'r1',
    AdminAgentRequestStatusEnum status = AdminAgentRequestStatusEnum.pending,
    DateTime? validUntil,
    int changes = 0,
  }) => AdminAgentRequest(
    id: id,
    keyId: 'k1',
    keyName: 'Agent · Mac',
    reason: 'Raise the waitlist batch',
    minutes: 10,
    status: status,
    createdAt: DateTime.now(),
    expiresAt: DateTime.now().add(const Duration(minutes: 5)),
    answeredAt: null,
    validUntil: validUntil,
    endedAt: null,
    changes: changes,
  );

  tearDown(AdminSecurity.forgetVerification);

  testWidgets(
    'approving after Face ID or a passkey gives the agent its minutes',
    (tester) async {
      final backend = FakeBackend();
      backend.adminAgentRequestMap['r1'] = request();
      AdminSecurity.verified(backend.userId, method: 'passkey');
      await tester.pumpWidget(
        harness(backend, const AdminAgentApproveScreen(id: 'r1')),
      );
      await tester.pumpAndSettle();
      expect(
        find.text('Agent · Mac wants to change admin settings'),
        findsOneWidget,
      );
      expect(find.text('Raise the waitlist batch'), findsOneWidget);
      expect(find.text('For 10 minutes'), findsOneWidget);
      await tester.tap(find.byKey(const Key('adminAgentApprove')));
      await tester.pumpAndSettle();
      expect(backend.adminAgentAnswers, ['approve:r1']);
      expect(find.textContaining('Can make changes'), findsOneWidget);
      expect(find.byKey(const Key('adminAgentApprove')), findsNothing);
      // Stop right here ends it.
      await tester.tap(find.byKey(const Key('adminAgentStop')));
      await tester.pumpAndSettle();
      expect(backend.adminAgentAnswers, ['approve:r1', 'end:r1']);
      expect(find.text('This access has ended'), findsOneWidget);
    },
  );

  testWidgets(
    'a PIN unlock isn\'t enough: approving asks again, without the PIN',
    (tester) async {
      final backend = FakeBackend();
      backend.adminAgentRequestMap['r1'] = request();
      AdminSecurity.verified(backend.userId, method: 'pin');
      await tester.pumpWidget(
        harness(backend, const AdminAgentApproveScreen(id: 'r1')),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('adminAgentApprove')));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Approve agent access'), findsOneWidget);
      expect(backend.adminAgentAnswers, isEmpty);
    },
  );

  testWidgets('deny needs no extra check', (tester) async {
    final backend = FakeBackend();
    backend.adminAgentRequestMap['r1'] = request();
    await tester.pumpWidget(
      harness(backend, const AdminAgentApproveScreen(id: 'r1')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('adminAgentDeny')));
    await tester.pumpAndSettle();
    expect(backend.adminAgentAnswers, ['deny:r1']);
    expect(find.text('Denied'), findsOneWidget);
  });

  testWidgets(
    'Security lists an agent key as reads only, a live grant with Stop, and the log',
    (tester) async {
      tester.view.physicalSize = const Size(1000, 2400);
      addTearDown(tester.view.reset);
      final backend = FakeBackend()
        ..adminDeviceKeyList.add(
          AdminDeviceKey(
            id: 'k1',
            name: 'Agent · Mac',
            createdAt: DateTime(2026),
            lastUsedAt: null,
            scope: AdminDeviceKeyScopeEnum.read,
          ),
        )
        ..adminAgentLog.add(
          AdminAgentLogEntry(
            at: DateTime.now(),
            action: 'change',
            keyName: 'Agent · Mac',
            method: 'PUT',
            path: '/v1/admin/waitlist',
            status: 200,
          ),
        );
      backend.adminAgentRequestMap['r2'] = request(
        id: 'r2',
        status: AdminAgentRequestStatusEnum.approved,
        validUntil: DateTime.now().add(const Duration(minutes: 7, seconds: 30)),
        changes: 1,
      );
      await tester.pumpWidget(
        harness(
          backend,
          const Scaffold(body: AdminSecurityTab()),
          overrides: [adminDeviceKeysProvider.overrideWithValue(_NoChip())],
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Agent · reads only'), findsOneWidget);
      expect(
        find.textContaining('Can make changes · 8 min left · 1 change'),
        findsOneWidget,
      );
      expect(find.text('Changed · PUT waitlist'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('adminAgentStop-r2')));
      await tester.pumpAndSettle();
      expect(backend.adminAgentAnswers, ['end:r2']);
      // The grant is gone from the list.
      expect(find.byKey(const ValueKey('adminAgentStop-r2')), findsNothing);
      expect(find.text('Agent access stopped'), findsOneWidget);
    },
  );

  test('a grant is live until its end', () {
    final now = DateTime(2026, 11, 27, 12);
    final r = request(
      status: AdminAgentRequestStatusEnum.approved,
      validUntil: now.add(const Duration(seconds: 61)),
    );
    expect(agentGrantLive(r, now), isTrue);
    expect(agentMinutesLeft(r, now), 2);
    expect(agentGrantLive(r, now.add(const Duration(minutes: 2))), isFalse);
    expect(agentGrantLive(request(), now), isFalse);
  });
}

/// No secure chip in widget tests: this device isn't set up.
class _NoChip extends AdminDeviceKeys {
  @override
  Future<bool> available() async => false;
  @override
  Future<String?> keyId(String? userId) async => null;
}
