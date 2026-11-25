import 'dart:convert';

import 'package:casama/features/admin/resets_tab.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

Map<String, Object?> _campaign(String state, {num? budget}) => {
  "id": "11111111-1111-4111-8111-111111111111",
  "name": "Recovery",
  "message": "Saved",
  "audience": {
    "plan_codes": ["pro", "pro_yearly", "plus"],
    "workspace_ids": [],
  },
  "starts_at": "2026-11-20T00:00:00Z",
  "expires_at": "2027-01-01T00:00:00Z",
  "budget_usd": budget,
  "state": state,
  "created_by": "11111111-1111-4111-8111-111111111111",
  "created_at": "2026-11-20T00:00:00Z",
  "given": 412,
  "used": 96,
  "expired": 0,
  "refilled_usd": 12.5,
};

class _AdminBackend extends FakeBackend {
  _AdminBackend({this.state, this.budget});
  final String? state;
  final num? budget;
  bool enabled = false;
  int perPeriod = 1;
  int settingsPuts = 0;
  final actions = <String>[];
  Map<String, dynamic>? saved;
  String? savedPath;
  int previews = 0;

  late final Dio transport = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          Map<String, dynamic> body() =>
              (request.data is String ? jsonDecode(request.data as String) : request.data) as Map<String, dynamic>;
          void ok(Object? data) => handler.resolve(Response(requestOptions: request, data: data, statusCode: 200));
          final path = request.path;
          if (path.endsWith('/settings')) {
            if (request.method == 'PUT') {
              settingsPuts++;
              enabled = body()['enabled'] as bool;
              perPeriod = body()['per_period'] as int;
            }
            ok({'enabled': enabled, 'per_period': perPeriod, 'max_held': 3, 'notify_owners': true});
          } else if (path.endsWith('/preview')) {
            previews++;
            ok({'workspaces': 12, 'by_plan': <String, int>{}, 'credits_usd': 30, 'cost_usd': 4.5});
          } else if (path.endsWith('/action')) {
            actions.add(body()['action'] as String);
            ok({'ok': true});
          } else if (path.contains('/events')) {
            ok(path.endsWith('.csv') ? 'a,b' : <Object>[]);
          } else if (request.method == 'POST' || request.method == 'PUT' || request.method == 'PATCH') {
            saved = body();
            savedPath = path;
            ok(_campaign('draft'));
          } else {
            ok(state == null ? <Object>[] : [_campaign(state!, budget: budget)]);
          }
        },
      ),
    );

  @override
  LimitResetsApi get limitResets => LimitResetsApi(transport);
}

/// Opens a sheet from a button, the way the Workspaces section's row menu does.
class _GiveButton extends StatelessWidget {
  const _GiveButton();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: TextButton(
        onPressed: () => showGiveWorkspaceReset(context, workspaceId: orgId, workspaceName: 'Test Org'),
        child: const Text('give'),
      ),
    ),
  );
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('instance owner can switch resets on without creating a campaign', (tester) async {
    final backend = _AdminBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: ResetsTab())));
    await tester.pumpAndSettle();
    expect(find.text('Enable saved resets'), findsOneWidget);
    expect(find.text('Off: nobody gets saved resets.'), findsOneWidget);
    expect(backend.enabled, isFalse);
    await tester.tap(find.byType(Switch).first);
    await tester.pumpAndSettle();
    expect(backend.enabled, isTrue);
    expect(find.text('Off: nobody gets saved resets.'), findsNothing);
  });

  testWidgets('the stepper saves a moment after the last tap', (tester) async {
    final backend = _AdminBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: ResetsTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resetsPerPeriod-plus')));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.byKey(const Key('resetsPerPeriod-plus')));
    await tester.pump(const Duration(milliseconds: 300));
    // Shown at once, not sent yet.
    expect(tester.widget<Text>(find.byKey(const Key('resetsPerPeriod-value'))).data, '3');
    expect(backend.settingsPuts, 0);
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
    expect(backend.settingsPuts, 1);
    expect(backend.perPeriod, 3);
    expect(tester.widget<Text>(find.byKey(const Key('resetsPerPeriod-value'))).data, '3');
  });

  for (final state in ['draft', 'scheduled', 'live', 'paused', 'ended', 'cancelled']) {
    testWidgets('campaign $state exposes only valid lifecycle actions', (tester) async {
      await setSize(tester, const Size(800, 1600));
      await tester.pumpWidget(harness(_AdminBackend(state: state), const Scaffold(body: ResetsTab())));
      await tester.pumpAndSettle();
      final ended = state == 'ended' || state == 'cancelled';
      if (ended) {
        // Ended campaigns sit behind their filter.
        expect(find.text('Recovery'), findsNothing);
        await tester.tap(find.byKey(const Key('adminFilter-_Filter.ended')));
        await tester.pumpAndSettle();
        expect(find.text('Recovery'), findsOneWidget);
      }
      expect(find.text('Pause'), state == 'live' ? findsOneWidget : findsNothing);
      expect(find.text('Resume'), state == 'paused' ? findsOneWidget : findsNothing);
      expect(find.text('Schedule'), state == 'draft' ? findsOneWidget : findsNothing);
      expect(find.text('Edit'), ended ? findsNothing : findsOneWidget);
      final menu = find.byTooltip('More actions');
      expect(menu, ended ? findsNothing : findsOneWidget);
      if (!ended) {
        await tester.tap(menu);
        await tester.pumpAndSettle();
        expect(find.text('Cancel campaign'), findsOneWidget);
        expect(find.text('Delete'), state == 'draft' ? findsOneWidget : findsNothing);
      }
    });
  }

  testWidgets('a campaign card shows its budget meter, counts and audience', (tester) async {
    await setSize(tester, const Size(800, 1600));
    await tester.pumpWidget(harness(_AdminBackend(state: 'live', budget: 50), const Scaffold(body: ResetsTab())));
    await tester.pumpAndSettle();
    expect(find.text(r'$12.50 of $50.00 budget'), findsOneWidget);
    expect(find.text('412 given'), findsOneWidget);
    expect(find.text('96 used'), findsOneWidget);
    expect(find.text('Pro, Plus'), findsOneWidget);
    expect(find.text('“Saved”'), findsOneWidget);
  });

  testWidgets('Delete asks first, and Cancel there keeps the campaign', (tester) async {
    await setSize(tester, const Size(800, 1600));
    final backend = _AdminBackend(state: 'draft');
    await tester.pumpWidget(harness(backend, const Scaffold(body: ResetsTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('More actions'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Delete this campaign?'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(backend.actions, isEmpty);

    await tester.tap(find.byTooltip('More actions'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resetsConfirm-delete')));
    await tester.pumpAndSettle();
    expect(backend.actions, ['delete']);
  });

  testWidgets('the workspace picker puts a workspace in the audience', (tester) async {
    await setSize(tester, const Size(1300, 1000));
    final backend = _AdminBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: ResetsTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resetsNewCampaign')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('resetsName')), 'Winter');
    final editor = find.byKey(const Key('resetsEditorList'));
    final search = find.descendant(of: editor, matching: find.byKey(const Key('resetsWorkspaceSearch')));
    await tester.ensureVisible(search);
    await tester.enterText(find.descendant(of: search, matching: find.byType(TextField)), 'test');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resetsWorkspaceOption-$orgId')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('resetsWorkspaceChip-$orgId')), findsOneWidget);
    // The reach is worked out a moment after the last change.
    await tester.pump(const Duration(milliseconds: 900));
    await tester.pumpAndSettle();
    expect(find.textContaining('Reaches about 12 workspaces'), findsOneWidget);
    await tester.tap(find.byKey(const Key('resetsSave')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resetsConfirmSave')));
    await tester.pumpAndSettle();
    expect(backend.savedPath, '/v1/admin/limit-resets');
    expect((backend.saved!['audience'] as Map)['workspace_ids'], [orgId]);
    expect(backend.saved!['name'], 'Winter');
    expect(find.text('Campaign saved'), findsOneWidget);
  });

  testWidgets('an empty name shows on its field instead of failing', (tester) async {
    await setSize(tester, const Size(1300, 1000));
    final backend = _AdminBackend();
    await tester.pumpWidget(harness(backend, const Scaffold(body: ResetsTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resetsNewCampaign')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resetsSave')));
    await tester.pumpAndSettle();
    expect(find.text('Required.'), findsOneWidget);
    expect(backend.saved, isNull);
  });

  testWidgets('showGiveWorkspaceReset opens the editor for that workspace', (tester) async {
    await setSize(tester, const Size(1300, 1000));
    final backend = _AdminBackend();
    await tester.pumpWidget(harness(backend, const _GiveButton()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('give'));
    await tester.pumpAndSettle();
    expect(find.text('Give a saved reset'), findsOneWidget);
    expect(find.text('Only Test Org'), findsOneWidget);
    expect(find.byKey(const Key('resetsWorkspaceSearch')), findsNothing);
    await tester.tap(find.byKey(const Key('resetsSave')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('resetsConfirmSave')));
    await tester.pumpAndSettle();
    expect(backend.savedPath, '/v1/admin/limit-resets/workspaces/$orgId');
    expect((backend.saved!['audience'] as Map)['workspace_ids'], [orgId]);
    expect(find.text('Saved reset given to Test Org'), findsOneWidget);
  });

  for (final width in [360.0, 1300.0]) {
    testWidgets('no overflow at ${width.toInt()} wide, page and editor', (tester) async {
      await setSize(tester, Size(width, 900));
      await tester.pumpWidget(harness(_AdminBackend(state: 'live', budget: 50), const Scaffold(body: ResetsTab())));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.ensureVisible(find.byKey(const Key('resetsEdit')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('resetsEdit')));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      // Running: the audience can't change, the message can.
      expect(find.text('This campaign is running: only the message, expiry, budget and reminder can change.'), findsOneWidget);
      expect(tester.widget<TextField>(find.byKey(const Key('resetsName'))).enabled, isFalse);
      expect(tester.widget<TextField>(find.byKey(const Key('resetsMessage'))).enabled, isNot(false));
    });
  }
}
