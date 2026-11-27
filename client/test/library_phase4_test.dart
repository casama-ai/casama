// The Library, Phase 4 (LIBRARY-PLAN §5.2–5.4): sort and Mine/Workspace, select several, Pin from
// a chat card, page cards that say "Updated", Made here (sheet and side panel), what was made for
// a ticket, the mini player, and the dot on the tab.
import 'dart:async';

import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/media/attachment_view.dart';
import 'package:casama/features/library/creation_detail.dart';
import 'package:casama/features/library/library_providers.dart';
import 'package:casama/features/library/library_screen.dart';
import 'package:casama/features/library/made_here.dart';
import 'package:casama/features/library/now_playing.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';
import 'package:casama/l10n/delegates.dart';

FakeBackend _backend() => FakeBackend()
  ..creationList = [
    fakeCreation('c-zebra', title: 'Zebra game', label: 'Game'),
    fakeCreation(
      'c-apple',
      kind: CreationKind.image,
      title: 'Apple logo',
      mediaId: 'media-apple',
      mime: 'image/png',
      conversation: 'conv-other',
    ),
    fakeCreation(
      'c-mango',
      kind: CreationKind.audio,
      title: 'Mango jingle',
      mediaId: 'media-mango',
      mime: 'audio/mpeg',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

late GoRouter _router;

Widget _app(
  FakeBackend backend,
  String initial, {
  List<Override> overrides = const [],
  Widget Function(GoRouterState s)? extra,
}) {
  _router = GoRouter(
    initialLocation: initial,
    routes: [
      GoRoute(path: '/library', builder: (_, _) => const LibraryScreen()),
      GoRoute(
        path: '/library/:id',
        builder: (_, s) => Scaffold(
          body: Column(
            children: [
              Expanded(
                child: CreationDetailScreen(
                  creationId: s.pathParameters['id']!,
                ),
              ),
              const MiniPlayerBar(),
            ],
          ),
        ),
      ),
      if (extra != null) GoRoute(path: '/extra', builder: (_, s) => extra(s)),
    ],
  );
  return ProviderScope(
    overrides: [backendProvider.overrideWithValue(backend), ...overrides],
    child: MaterialApp.router(
      routerConfig: _router,
      localizationsDelegates: testLocalizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );
}

/// Stands in for the platform player.
class _FakeAudio implements MiniAudio {
  static final loaded = <Uri>[];
  static var disposed = 0;
  final _playing = StreamController<bool>.broadcast();

  @override
  Future<void> load(Uri url, Map<String, String> headers) async =>
      loaded.add(url);
  @override
  Future<void> play() async => _playing.add(true);
  @override
  Future<void> pause() async => _playing.add(false);
  @override
  Future<void> seek(Duration to) async {}
  @override
  Future<void> dispose() async => disposed++;
  @override
  Stream<bool> get playing => _playing.stream;
  @override
  Stream<bool> get completed => const Stream.empty();
  @override
  Stream<Duration> get position => const Stream.empty();
  @override
  Stream<Duration?> get duration => const Stream.empty();
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets(
    'Sort: Name lists A to Z without day headings; Recently opened asks for it',
    (tester) async {
      await setSize(tester, const Size(700, 1400));
      final backend = _backend();
      await tester.pumpWidget(_app(backend, '/library'));
      await tester.pumpAndSettle();
      expect(find.text('Today'), findsOneWidget);

      await tester.tap(find.byKey(const Key('libraryFilter')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('librarySort-name')));
      await tester.pumpAndSettle();
      expect(backend.lastCreationSort?.byName, isTrue);
      expect(find.text('Today'), findsNothing);
      double y(String id) =>
          tester.getTopLeft(find.byKey(Key('creation-$id'))).dy;
      double x(String id) =>
          tester.getTopLeft(find.byKey(Key('creation-$id'))).dx;
      // Apple, Mango, Zebra: reading order.
      expect(
        x('c-apple') < x('c-mango') || y('c-apple') < y('c-mango'),
        isTrue,
      );
      expect(y('c-mango') <= y('c-zebra'), isTrue);

      await tester.tap(find.byKey(const Key('libraryFilter')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('librarySort-opened')));
      await tester.pumpAndSettle();
      expect(backend.lastCreationSort?.recentlyOpened, isTrue);
      // Nothing was opened yet.
      expect(find.byKey(const Key('libraryNoMatch')), findsOneWidget);
    },
  );

  testWidgets('Mine or Workspace shows in a workspace of several people', (
    tester,
  ) async {
    await setSize(tester, const Size(700, 1400));
    final backend = _backend();
    await tester.pumpWidget(_app(backend, '/library'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('libraryFilter')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('libraryScope-mine')));
    await tester.pumpAndSettle();
    expect(backend.lastCreationSort?.mine, isTrue);

    // Alone in the workspace: no Mine or Workspace.
    final solo = _backend()
      ..workspaceMembers = [backend.workspaceMembers.first];
    await tester.pumpWidget(_app(solo, '/library'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('libraryFilter')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('libraryScope-mine')), findsNothing);
    expect(find.byKey(const Key('librarySort-name')), findsOneWidget);
  });

  testWidgets(
    'select several: long-press picks, then pin, move and delete with one Undo',
    (tester) async {
      await setSize(tester, const Size(700, 1400));
      final backend = _backend();
      await tester.pumpWidget(_app(backend, '/library'));
      await tester.pumpAndSettle();

      await tester.longPress(find.byKey(const Key('creation-c-zebra')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('librarySelectionBar')), findsOneWidget);
      // While picking, a tap picks instead of opening.
      await tester.tap(find.byKey(const Key('creation-c-apple')));
      await tester.pumpAndSettle();
      expect(find.text('2 selected'), findsOneWidget);
      expect(_router.state.uri.path, '/library');

      await tester.tap(find.byKey(const Key('libraryPinPicked')));
      await tester.pumpAndSettle();
      expect(
        {for (final u in backend.creationUpdates) u.$1: u.$2['pinned']},
        {'c-zebra': true, 'c-apple': true},
      );
      expect(find.byKey(const Key('librarySelectionBar')), findsNothing);
      expect(find.byKey(const Key('libraryHeading-pinned')), findsOneWidget);

      await tester.longPress(find.byKey(const Key('creation-c-zebra')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('libraryMovePicked')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('moveToProject-p1')));
      await tester.pumpAndSettle();
      expect(backend.creationMoves, [('c-zebra', 'p1')]);

      await tester.longPress(find.byKey(const Key('creation-c-zebra')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('creation-c-mango')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('libraryDeletePicked')));
      await tester.pumpAndSettle();
      expect(backend.deletedCreations.toSet(), {'c-zebra', 'c-mango'});
      expect(find.byKey(const Key('creation-c-zebra')), findsNothing);
      await tester.tap(find.byKey(const Key('undoDeletePicked')));
      await tester.pumpAndSettle();
      expect(backend.restoredCreations.toSet(), {'c-zebra', 'c-mango'});
      expect(find.byKey(const Key('creation-c-zebra')), findsOneWidget);
    },
  );

  testWidgets('with a mouse, a checkbox shows on hover and picks', (
    tester,
  ) async {
    await setSize(tester, const Size(1000, 1400));
    await tester.pumpWidget(_app(_backend(), '/library'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('pickCreation-c-apple')), findsNothing);
    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer(location: Offset.zero);
    addTearDown(mouse.removePointer);
    await mouse.moveTo(
      tester.getCenter(find.byKey(const Key('creation-c-apple'))),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('pickCreation-c-apple')));
    await tester.pumpAndSettle();
    expect(find.text('1 selected'), findsOneWidget);
  });

  testWidgets(
    'a page card says Updated with its version, and pins from its menu',
    (tester) async {
      await setSize(tester, const Size(700, 900));
      final backend = _backend();
      final parts = attachmentsOf([
        {'type': 'text', 'text': 'Done'},
        {
          'type': 'page',
          'page_id': 'page-c-zebra',
          'title': 'Zebra game',
          'version': 2,
          'updated': true,
          'creation_id': 'c-zebra',
        },
      ]);
      expect(parts.single.creationId, 'c-zebra');
      await tester.pumpWidget(
        _app(
          backend,
          '/extra',
          overrides: [currentOrgIdProvider.overrideWithValue(orgId)],
          extra: (_) => Scaffold(
            body: Center(child: AttachmentView(attachment: parts.single)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Updated · version 2'), findsOneWidget);

      await tester.longPress(find.byKey(const Key('pageCard-page-c-zebra')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('pinInLibrary')));
      await tester.pumpAndSettle();
      expect(backend.creationUpdates.last.$1, 'c-zebra');
      expect(backend.creationUpdates.last.$2['pinned'], isTrue);
      expect(find.text('Pinned “Zebra game”'), findsOneWidget);
    },
  );

  testWidgets('Made here lists this chat first, then the bot\'s other things', (
    tester,
  ) async {
    await setSize(tester, const Size(700, 1400));
    await tester.pumpWidget(
      _app(
        _backend(),
        '/extra',
        extra: (_) => Scaffold(
          appBar: AppBar(
            actions: const [
              MadeHereButton(botId: botId, conversationId: convId),
            ],
          ),
          body: MadeHereList(
            botId: botId,
            conversationId: convId,
            onOpen: (_) {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('madeHereCount')), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(
      tester.getTopLeft(find.byKey(const Key('madeHereHeading-here'))).dy,
      lessThan(
        tester.getTopLeft(find.byKey(const Key('madeHereHeading-others'))).dy,
      ),
    );
    // The Apple logo was made in another chat: under the others.
    expect(
      tester.getTopLeft(find.byKey(const Key('creation-c-apple'))).dy,
      greaterThan(
        tester.getTopLeft(find.byKey(const Key('madeHereHeading-others'))).dy,
      ),
    );
  });

  testWidgets('the side panel switches between the computer and Made here', (
    tester,
  ) async {
    await setSize(tester, const Size(500, 1200));
    await tester.pumpWidget(
      _app(
        _backend(),
        '/extra',
        extra: (_) => const Scaffold(
          body: SidePanelTabs(botId: botId, computer: Text('the computer')),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('the computer'), findsOneWidget);
    await tester.tap(find.byKey(const Key('sidePanelMadeHere')));
    await tester.pumpAndSettle();
    expect(find.text('the computer'), findsNothing);
    expect(find.byKey(const Key('madeHereList')), findsOneWidget);
    await tester.tap(find.byKey(const Key('creation-c-zebra')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('creationDetail-c-zebra')), findsOneWidget);
  });

  testWidgets('a ticket shows what was made in its thread', (tester) async {
    await setSize(tester, const Size(700, 900));
    await tester.pumpWidget(
      _app(
        _backend(),
        '/extra',
        extra: (_) =>
            const Scaffold(body: MadeForTicket(conversationId: 'conv-other')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Made for this ticket'), findsOneWidget);
    expect(find.byKey(const Key('creation-c-apple')), findsOneWidget);
    expect(find.byKey(const Key('creation-c-zebra')), findsNothing);
  });

  testWidgets('a sound plays in the mini player, which closes from its bar', (
    tester,
  ) async {
    await setSize(tester, const Size(700, 1200));
    _FakeAudio.loaded.clear();
    await tester.pumpWidget(
      _app(
        _backend(),
        '/library/c-mango',
        overrides: [miniAudioProvider.overrideWithValue(_FakeAudio.new)],
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('miniPlayer')), findsNothing);
    await tester.tap(find.byKey(const Key('creationOpen')));
    await tester.pumpAndSettle();
    expect(_FakeAudio.loaded.single.path, contains('media-mango'));
    // The bar under the page, and the same controls in the detail.
    expect(find.byKey(const Key('miniPlayer')), findsNWidgets(2));
    await tester.tap(find.byKey(const Key('miniPlayerClose')).first);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('miniPlayer')), findsNothing);
  });

  test('the dot: something made since the Library was last open', () async {
    final backend = _backend();
    final container = ProviderContainer(
      overrides: [
        backendProvider.overrideWithValue(backend),
        currentOrgIdProvider.overrideWithValue(orgId),
      ],
    );
    addTearDown(container.dispose);
    // Never opened: no dot.
    expect(await container.read(libraryHasNewProvider.future), isFalse);
    container.read(librarySeenProvider.notifier).markNow();
    expect(await container.read(libraryHasNewProvider.future), isFalse);
    backend.creationList = [
      fakeCreation(
        'c-new',
        createdAt: DateTime.now().add(const Duration(minutes: 1)),
      ),
      ...backend.creationList,
    ];
    container.invalidate(libraryHasNewProvider);
    expect(await container.read(libraryHasNewProvider.future), isTrue);
  });
}
