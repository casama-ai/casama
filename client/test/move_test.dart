// Moving a workspace between servers (docs/SELFHOST-CLOUD-MODELS-PLAN.md §4.4, §4.5, §7.5): the
// Settings entry behind its switch, where it goes (Casama Cloud, my own server, bring one here),
// the check, the progress that resumes, the after checklist with the subscription reminder, and
// the "This workspace moved" screen.
import 'package:casama/core/backend.dart' show ChatMessageView;
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/features/chat/widgets/chat_widgets.dart' show UserBubble;
import 'package:casama/features/move/move_api.dart';
import 'package:casama/features/move/move_flow.dart';
import 'package:casama/features/move/move_screen.dart';
import 'package:casama/features/move/move_switch.dart';
import 'package:casama/features/move/moved_screen.dart';
import 'package:casama/features/selfhost/server_license.dart';
import 'package:casama/features/settings/settings_screen.dart';
import 'package:casama_sdk/casama_sdk.dart' show OrgRole;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

const _code = 'cmv_22222222-2222-4222-8222-222222222222.abcdefghijklmnop';

Map<String, dynamic> _check({
  bool fits = true,
  String? updateFirst,
  bool cloud = true,
  int keys = 2,
}) => {
  'size_bytes': 50 * 1024 * 1024,
  'estimate_seconds': 180,
  'pause_seconds': 45,
  'long_pause': false,
  'counts': {
    'bots': 3,
    'conversations': 12,
    'memories': 40,
    'routines': 2,
    'files': 5,
    'members': 2,
  },
  'fit': {
    'fits': fits,
    'plan': {'code': 'free', 'name': 'Free'},
    'over': fits
        ? []
        : [
            {'what': 'bots', 'have': 3, 'limit': 1},
          ],
    'needs_plan': fits ? null : {'code': 'plus', 'name': 'Plus'},
    'accepts': [1],
    'engine_version': '2026.11.26',
    'move_key': 'k',
    'target': {
      'org_id': '33333333-3333-4333-8333-333333333333',
      'name': 'Home',
      'empty': true,
    },
  },
  'update_first': updateFirst,
  'comes': ['bots'],
  'after': {
    'reconnect': [
      {'id': 'i1', 'name': 'Gmail', 'kind': 'gmail'},
    ],
    'invites': [
      {'name': 'Bea', 'email': 'bea@example.com'},
    ],
    'keys': {'models': keys, 'chat_apps': 0, 'secrets': 0},
    'computers': 1,
    'chatgpt_plans': 0,
  },
  'target': cloud ? 'cloud' : 'server',
  'already_moved': null,
};

Map<String, dynamic> _progress(
  String state, {
  String? step,
  Map<String, dynamic>? report,
  Map<String, dynamic>? error,
  Map<String, dynamic>? movedTo,
}) => {
  'move_id': '22222222-2222-4222-8222-222222222222',
  'role': 'source',
  'state': state,
  'step': step,
  'remote_url': 'https://api.casama.ai',
  'progress': {'done_bytes': 25 * 1024 * 1024, 'total_bytes': 50 * 1024 * 1024},
  'report': report ?? {},
  'error': error,
  'moved_to': movedTo,
};

class FakeMoveApi implements MoveApi {
  MoveProgress? current;
  final progressQueue = <MoveProgress?>[];
  final started = <({String url, String code, bool keys})>[];
  final checked = <({String url, String code})>[];
  MoveCheck nextCheck = MoveCheck.fromJson(_check());
  final cloudPlaces = <CloudWorkspace>[
    const CloudWorkspace(
      id: '44444444-4444-4444-8444-444444444444',
      name: 'Family',
    ),
  ];
  final cloudCalls = <String>[];

  @override
  Future<MoveCheck> check({
    required String orgId,
    required String targetUrl,
    required String code,
  }) async {
    checked.add((url: targetUrl, code: code));
    return nextCheck;
  }

  @override
  Future<List<CloudWorkspace>> cloudWorkspaces(String cloudToken) async {
    cloudCalls.add('list:$cloudToken');
    return cloudPlaces;
  }

  @override
  Future<CloudWorkspace> newCloudWorkspace({
    required String cloudToken,
    required String name,
  }) async {
    cloudCalls.add('new:$name');
    return CloudWorkspace(
      id: '55555555-5555-4555-8555-555555555555',
      name: name,
    );
  }

  @override
  Future<MoveProgress?> progress(String orgId) async =>
      progressQueue.isNotEmpty ? progressQueue.removeAt(0) : current;

  @override
  Future<MoveCode> receiveHere(String orgId) async => MoveCode(
    moveId: 'm1',
    code: _code,
    expiresAt: DateTime(2026, 11, 27, 9),
    serverUrl: 'https://casama.example.com',
  );

  @override
  Future<MoveCode> receiveOnCloud({
    required String cloudToken,
    required String orgId,
  }) async {
    cloudCalls.add('receive:$orgId');
    return MoveCode(
      moveId: 'm1',
      code: _code,
      expiresAt: DateTime(2026, 11, 27),
      serverUrl: 'https://api.casama.ai',
    );
  }

  @override
  Future<MoveProgress> start({
    required String orgId,
    required String targetUrl,
    required String code,
    required bool bringKeys,
  }) async {
    started.add((url: targetUrl, code: code, keys: bringKeys));
    return current = MoveProgress.fromJson(_progress('copying', step: 'files'));
  }
}

class _CloudAuth implements CloudLicenseAuth {
  @override
  Future<void> sendCode(String email) async {}
  @override
  Future<CloudSession> verify(String email, String code) async =>
      CloudSession('cloud-$code', email: email);
}

Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 6; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    debugMoveOn = true;
    movesWatched.value = const {};
  });
  tearDown(() => debugMoveOn = null);

  Widget app(FakeBackend backend, FakeMoveApi api, Widget child) => harness(
    backend,
    child,
    overrides: [
      moveApiProvider.overrideWithValue(api),
      cloudLicenseAuthProvider.overrideWithValue(_CloudAuth()),
    ],
  );

  testWidgets(
    'Settings offers the move only with the build switch on, and only to admins',
    (tester) async {
      await setSize(tester, const Size(500, 2400));
      await tester.pumpWidget(
        app(FakeBackend(), FakeMoveApi(), const SettingsScreen()),
      );
      await settle(tester);
      expect(find.byKey(const Key('settingsMove')), findsOneWidget);
      // This server isn't Casama Cloud: the move goes there.
      expect(find.text('Move to Casama Cloud'), findsOneWidget);

      debugMoveOn = false;
      await tester.pumpWidget(
        app(
          FakeBackend(),
          FakeMoveApi(),
          const SettingsScreen(key: Key('off')),
        ),
      );
      await settle(tester);
      expect(find.byKey(const Key('settingsMove')), findsNothing);

      debugMoveOn = true;
      await tester.pumpWidget(
        app(
          FakeBackend()..orgRole = OrgRole.member,
          FakeMoveApi(),
          const SettingsScreen(key: Key('member')),
        ),
      );
      await settle(tester);
      expect(find.byKey(const Key('settingsMove')), findsNothing);
    },
  );

  testWidgets(
    'moving to Casama Cloud: sign in, pick a new workspace there, then the check',
    (tester) async {
      await setSize(tester, const Size(500, 1400));
      final api = FakeMoveApi();
      await tester.pumpWidget(app(FakeBackend(), api, const MoveScreen()));
      await settle(tester);
      expect(find.byKey(const Key('moveToCloud')), findsOneWidget);
      expect(find.byKey(const Key('moveToServer')), findsOneWidget);
      expect(find.byKey(const Key('moveReceive')), findsOneWidget);
      // Installing a server is for direct-download desktop builds only (not in tests' platform).
      expect(find.byKey(const Key('moveInstallServer')), findsNothing);

      await tester.tap(find.byKey(const Key('moveToCloud')));
      await settle(tester);
      await tester.enterText(
        find.byKey(const Key('cloudSignInEmail')),
        'ana@example.com',
      );
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      await tester.enterText(
        find.byKey(const Key('cloudSignInCode')),
        '123456',
      );
      await tester.pump();
      await tester.tap(find.byKey(const Key('cloudSignInSubmit')));
      await settle(tester);
      // Where it goes: a new workspace, or alongside one already there.
      expect(find.byKey(const Key('moveCloudNew')), findsOneWidget);
      expect(find.text('Family'), findsOneWidget);
      await tester.tap(find.byKey(const Key('moveCloudNew')));
      await settle(tester);
      expect(api.cloudCalls, [
        'list:cloud-123456',
        'new:Test Org',
        'receive:55555555-5555-4555-8555-555555555555',
      ]);
      expect(api.checked.single, (url: 'https://api.casama.ai', code: _code));
      expect(find.text('Ready to Move'), findsOneWidget);
    },
  );

  testWidgets('a member sees why they cannot move the workspace', (
    tester,
  ) async {
    await setSize(tester, const Size(500, 1200));
    await tester.pumpWidget(
      app(
        FakeBackend()..orgRole = OrgRole.member,
        FakeMoveApi(),
        const MoveScreen(),
      ),
    );
    await settle(tester);
    expect(find.byKey(const Key('moveOwnerOnly')), findsOneWidget);
    await tester.tap(find.byKey(const Key('moveToServer')));
    await settle(tester);
    expect(find.byKey(const Key('moveServerAddress')), findsNothing);
  });

  testWidgets('moving to my own server: its address and code, then the check', (
    tester,
  ) async {
    await setSize(tester, const Size(500, 1200));
    final api = FakeMoveApi()
      ..nextCheck = MoveCheck.fromJson(_check(cloud: false));
    await tester.pumpWidget(app(FakeBackend(), api, const MoveScreen()));
    await settle(tester);
    await tester.tap(find.byKey(const Key('moveToServer')));
    await settle(tester);
    await tester.enterText(
      find.byKey(const Key('moveServerAddress')),
      'casama.example.com',
    );
    await tester.enterText(find.byKey(const Key('moveServerCode')), _code);
    await tester.pump();
    await tester.tap(find.byKey(const Key('moveServerCheck')));
    await settle(tester);
    expect(api.checked.single, (
      url: 'https://casama.example.com',
      code: _code,
    ));
    expect(find.text('To casama.example.com'), findsOneWidget);
  });

  testWidgets(
    'bring a workspace here shows this server\'s address and a one-time code',
    (tester) async {
      await setSize(tester, const Size(500, 1200));
      await tester.pumpWidget(
        app(
          FakeBackend(),
          FakeMoveApi(),
          const MoveReceiveScreen(orgId: orgId, orgName: 'Test Org'),
        ),
      );
      await settle(tester);
      expect(find.text('https://casama.example.com'), findsOneWidget);
      expect(find.text(_code), findsOneWidget);
      expect(find.textContaining('Test Org'), findsOneWidget);
    },
  );

  group('the check', () {
    const target = MoveTarget(url: 'https://api.casama.ai', code: _code);

    testWidgets(
      'says what comes, the pause and what needs you, then starts with or without keys',
      (tester) async {
        await setSize(tester, const Size(500, 1600));
        final api = FakeMoveApi();
        await tester.pumpWidget(
          app(
            FakeBackend(),
            api,
            const MoveCheckScreen(orgId: orgId, target: target),
          ),
        );
        await settle(tester);
        expect(find.textContaining('3 bots'), findsOneWidget);
        expect(find.textContaining('12 chats'), findsOneWidget);
        expect(find.textContaining('about 3 minutes'), findsOneWidget);
        expect(find.textContaining('Gmail'), findsOneWidget);
        expect(find.text('1 person gets an email invite'), findsOneWidget);
        expect(find.text('To Casama Cloud'), findsOneWidget);
        await tester.tap(find.byKey(const Key('moveBringKeys')));
        await tester.pump();
        expect(
          find.textContaining('add model and chat app keys again'),
          findsOneWidget,
        );
        await tester.tap(find.byKey(const Key('moveStart')));
        await settle(tester);
        expect(api.started.single, (
          url: 'https://api.casama.ai',
          code: _code,
          keys: false,
        ));
        expect(find.byKey(const Key('moveProgressBar')), findsOneWidget);
      },
    );

    testWidgets(
      'a workspace that does not fit names the plan that does, and cannot start',
      (tester) async {
        await setSize(tester, const Size(500, 1600));
        final api = FakeMoveApi()
          ..nextCheck = MoveCheck.fromJson(_check(fits: false));
        await tester.pumpWidget(
          app(
            FakeBackend(),
            api,
            const MoveCheckScreen(orgId: orgId, target: target),
          ),
        );
        await settle(tester);
        expect(find.byKey(const Key('moveDoesntFit')), findsOneWidget);
        expect(find.textContaining('Bots: 3 of 1'), findsOneWidget);
        expect(find.textContaining('Plus fits it'), findsOneWidget);
        expect(find.byKey(const Key('moveStart')), findsNothing);
        expect(find.byKey(const Key('moveCheckAgain')), findsOneWidget);
      },
    );

    testWidgets('an older server is asked to update first', (tester) async {
      await setSize(tester, const Size(500, 1600));
      final api = FakeMoveApi()
        ..nextCheck = MoveCheck.fromJson(_check(updateFirst: 'source'));
      await tester.pumpWidget(
        app(
          FakeBackend(),
          api,
          const MoveCheckScreen(orgId: orgId, target: target),
        ),
      );
      await settle(tester);
      expect(find.byKey(const Key('moveUpdateFirst')), findsOneWidget);
      expect(find.byKey(const Key('moveStart')), findsNothing);
    });
  });

  group('progress', () {
    testWidgets(
      'a move under way shows its step when Settings › Move opens again, then the checklist',
      (tester) async {
        await setSize(tester, const Size(500, 1600));
        final api = FakeMoveApi()
          ..current = MoveProgress.fromJson(_progress('pausing'));
        await tester.pumpWidget(app(FakeBackend(), api, const MoveScreen()));
        await settle(tester);
        expect(
          find.text('Pausing bots to copy the last changes'),
          findsOneWidget,
        );
        expect(
          find.textContaining(RegExp(r'^25(\.0)? MB of 50(\.0)? MB$')),
          findsOneWidget,
        );

        api.current = MoveProgress.fromJson(
          _progress(
            'done',
            report: {
              'reconnect': [
                {'id': 'i1', 'name': 'Gmail', 'kind': 'gmail'},
              ],
              'invited': [
                {'name': 'Bea', 'email': 'bea@example.com'},
              ],
              'chat_apps': {'repointed': [], 'needs_you': []},
              'webhooks': [
                {
                  'id': 'w1',
                  'name': 'On deploy',
                  'url': 'https://api.casama.ai/hooks/custom/w1',
                },
              ],
              'reset': {'bots': [], 'workspace': []},
              'keys': {'brought': true},
              'reindexing': true,
            },
            movedTo: {
              'url': 'https://api.casama.ai',
              'at': '2026-11-26T10:00:00Z',
              'move_id': 'm1',
              'target': 'cloud',
              'message': 'moved',
            },
          ),
        );
        await tester.pump(const Duration(seconds: 3));
        await settle(tester);
        expect(find.byKey(const Key('moveAfter')), findsOneWidget);
        expect(find.text('Sign in to Gmail again'), findsOneWidget);
        expect(find.text('1 person was invited by email'), findsOneWidget);
        expect(
          find.text("Give On deploy's sender the new webhook address"),
          findsOneWidget,
        );
        expect(find.textContaining('passed on for 30 days'), findsOneWidget);
        expect(
          find.text('Memory search catches up in a few minutes.'),
          findsOneWidget,
        );
        // Moving to Cloud: the reminder is about a license for the old server.
        expect(
          find.byKey(const Key('moveSubscriptionReminder')),
          findsOneWidget,
        );
        expect(find.textContaining('business license'), findsOneWidget);
        expect(find.byKey(const Key('moveOpenThere')), findsOneWidget);
      },
    );

    testWidgets(
      'a failed move says the workspace still works here, and tries again with the same code',
      (tester) async {
        await setSize(tester, const Size(500, 1200));
        final api = FakeMoveApi()
          ..current = MoveProgress.fromJson(
            _progress(
              'failed',
              error: {
                'code': 'target_unreachable',
                'message': "Can't reach the server you're moving to.",
              },
            ),
          );
        const target = MoveTarget(url: 'https://api.casama.ai', code: _code);
        await tester.pumpWidget(
          app(
            FakeBackend(),
            api,
            const MoveProgressScreen(orgId: orgId, target: target),
          ),
        );
        await settle(tester);
        expect(find.byKey(const Key('moveFailed')), findsOneWidget);
        expect(
          find.textContaining('this workspace keeps working'),
          findsOneWidget,
        );
        expect(find.textContaining("Can't reach the server"), findsOneWidget);
        await tester.tap(find.byKey(const Key('moveTryAgain')));
        await settle(tester);
        expect(api.started.single.code, _code);
        expect(find.byKey(const Key('moveStep')), findsOneWidget);
      },
    );

    testWidgets('a failed move opened later asks for a new code', (
      tester,
    ) async {
      await setSize(tester, const Size(500, 1200));
      final api = FakeMoveApi()
        ..current = MoveProgress.fromJson(
          _progress('failed', error: {'code': 'x', 'message': 'Stopped.'}),
        );
      await tester.pumpWidget(
        app(FakeBackend(), api, const MoveProgressScreen(orgId: orgId)),
      );
      await settle(tester);
      expect(find.byKey(const Key('moveNewCode')), findsOneWidget);
      expect(find.byKey(const Key('moveTryAgain')), findsNothing);
    });

    testWidgets('moving away from Cloud reminds about the Cloud plan', (
      tester,
    ) async {
      await setSize(tester, const Size(500, 1200));
      await tester.pumpWidget(
        app(
          FakeBackend(),
          FakeMoveApi(),
          const Scaffold(
            body: SubscriptionReminder(toCloud: false, fromCloud: true),
          ),
        ),
      );
      await settle(tester);
      expect(
        find.textContaining('Casama Cloud plan keeps renewing'),
        findsOneWidget,
      );
      expect(find.byKey(const Key('moveManagePlan')), findsOneWidget);
    });
  });

  testWidgets(
    'a workspace that moved is covered by "This workspace moved" until the old copy is chosen',
    (tester) async {
      await setSize(tester, const Size(500, 1000));
      final api = FakeMoveApi()
        ..current = MoveProgress.fromJson(
          _progress(
            'done',
            movedTo: {
              'url': 'https://casama.example.com',
              'at': '2026-11-26T10:00:00Z',
              'move_id': 'm1',
              'target': 'server',
              'message': 'This workspace moved to another server (casama.example.com).',
            },
          ),
        );
      await tester.pumpWidget(
        app(
          FakeBackend(),
          api,
          const MovedWorkspaceGate(child: Scaffold(body: Text('the app'))),
        ),
      );
      await settle(tester);
      expect(find.byKey(const Key('movedTitle')), findsOneWidget);
      expect(
        find.textContaining("It's on casama.example.com now"),
        findsOneWidget,
      );
      expect(find.text('Open casama.example.com'), findsOneWidget);
      await tester.tap(find.byKey(const Key('movedViewOld')));
      await settle(tester);
      expect(find.byKey(const Key('movedTitle')), findsNothing);
      expect(find.text('the app'), findsOneWidget);

      // Off without the build switch.
      debugMoveOn = false;
      await tester.pumpWidget(
        app(
          FakeBackend(),
          api,
          const MovedWorkspaceGate(
            key: Key('off'),
            child: Scaffold(body: Text('the app')),
          ),
        ),
      );
      await settle(tester);
      expect(find.byKey(const Key('movedTitle')), findsNothing);
    },
  );

  testWidgets(
    'a moved message from someone not joined yet shows "name (invited)"',
    (tester) async {
      await setSize(tester, const Size(1200, 900));
      final backend = FakeBackend()
        ..storedMessages = [
          ChatMessageView(
            id: 'u1',
            role: 'user',
            text: 'Book the trip',
            createdAt: DateTime(2026, 11, 1),
          ),
          ChatMessageView(
            id: 'u2',
            role: 'user',
            text: 'Window seat please',
            createdAt: DateTime(2026, 11, 1, 0, 1),
            movedAuthorName: 'Sam',
          ),
          ChatMessageView(
            id: 'a1',
            role: 'assistant',
            text: 'Booked.',
            createdAt: DateTime(2026, 11, 1, 0, 2),
          ),
        ];
      await tester.pumpWidget(
        harness(backend, const ChatScreen(botId: botId, conversationId: convId)),
      );
      await tester.pumpAndSettle();
      expect(find.text('Sam (invited)'), findsOneWidget);
      // Only over their message: the person's own message has no name.
      expect(find.byKey(const Key('movedAuthor')), findsOneWidget);
      final bubble = tester.widget<UserBubble>(
        find.ancestor(
          of: find.text('Sam (invited)'),
          matching: find.byType(UserBubble),
        ),
      );
      expect(bubble.text, 'Window seat please');

      // The offline cache keeps the name.
      final cached = ChatMessageView.fromJson(
        backend.storedMessages[1].toJson().cast<String, dynamic>(),
      );
      expect(cached.movedAuthorName, 'Sam');
      expect(
        ChatMessageView.fromJson(
          backend.storedMessages[0].toJson().cast<String, dynamic>(),
        ).movedAuthorName,
        isNull,
      );
    },
  );
}
