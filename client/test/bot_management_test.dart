import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:casama/core/local_cache.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/backend.dart';
import 'package:casama/features/bots/bot_history_screen.dart';
import 'package:casama/features/bots/bots_screen.dart';
import 'package:casama/features/home/home_shell.dart';
import 'package:casama/features/bots/bot_profile_screen.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

void main() {
  testWidgets('settings history shows who changed what and restores it', (tester) async {
    await setSize(tester, const Size(1200, 900));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const BotHistoryScreen(botId: botId)));
    await tester.pumpAndSettle();
    expect(find.text('instructions, autonomy'), findsOneWidget);
    expect(find.textContaining('instructions: Be brief.'), findsOneWidget);
    expect(find.textContaining('Changed by a bot'), findsOneWidget);
    await tester.tap(find.byKey(const Key('restore-rev-1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirmRestore')));
    await tester.pumpAndSettle();
    expect(backend.restored?.id, 'rev-1');
  });

  testWidgets('a bot moves into a new folder and can be archived and brought back', (tester) async {
    await setSize(tester, const Size(1200, 1800));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const BotProfileScreen(botId: botId)));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('botFolder')));
    await tester.tap(find.byKey(const Key('botFolder')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('New folder…'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('folderName')), findsOneWidget);
    await tester.enterText(find.byKey(const Key('folderName')), 'Research');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(backend.botFolder, 'Research');

    // Archive sits alone at the very end, in sight without opening Advanced.
    await tester.ensureVisible(find.byKey(const Key('archiveBot')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('archiveBot')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirmArchive')));
    await tester.pump(const Duration(seconds: 1)); // the screen shows a spinner once its bot is gone
    expect(backend.archived, contains(botId));

    await tester.pumpWidget(harness(backend, const BotsScreen()));
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('archivedBots')));
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('unarchive-$botId')));
    await tester.pump(const Duration(seconds: 1));
    expect(backend.archived, isEmpty);
  });

  test('an archived bot leaves the saved list too, so the next chat opened is never the gone bot\'s (W-N9)', () async {
    final cache = MemoryCache();
    final backend = FakeBackend();
    backend.extraBots.add(backend.bot(id: 'b2', name: 'Bea'));
    final container = ProviderContainer(overrides: [
      backendProvider.overrideWithValue(backend),
      localCacheProvider.overrideWithValue(cache),
    ]);
    addTearDown(container.dispose);
    final sub = container.listen(botsProvider, (_, _) {});
    addTearDown(sub.close);
    // The workspace loads first.
    for (var i = 0; i < 20 && container.read(currentOrgIdProvider) == null; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect((await container.read(botsProvider.future)).map((b) => b.id), [botId, 'b2']);
    // Let the saved copy be written.
    await Future<void>.delayed(Duration.zero);
    await backend.setBotArchived(botId, true);
    await container.read(botsProvider.notifier).drop(botId);
    expect(container.read(botsProvider).value!.map((b) => b.id), ['b2']);
    // The list is read from the saved copy first after a reload: the bot must not come back.
    container.invalidate(botsProvider);
    expect((await container.read(botsProvider.future)).map((b) => b.id), ['b2']);
  });

  testWidgets('Delete bot in the profile deletes its chats and archives it, after a confirm that says so (W-N2)', (tester) async {
    await setSize(tester, const Size(1200, 1800));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const BotProfileScreen(botId: botId)));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.byKey(const Key('deleteBot')), 300, scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete Bot'));
    await tester.pumpAndSettle();
    expect(find.text('Delete Ada?'), findsOneWidget);
    expect(find.textContaining('deleted for good'), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirmDeleteBot')));
    await tester.pump(const Duration(seconds: 1));
    expect(backend.archived, contains(botId));
    expect(backend.clearedBots, contains(botId));
  });

  testWidgets('the first click on the words of Archive Bot opens its confirm (W-N9)', (tester) async {
    await setSize(tester, const Size(1200, 1800));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const BotProfileScreen(botId: botId)));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.byKey(const Key('archiveBot')), 300, scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Archive Bot'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('confirmArchive')), findsOneWidget);
  });

  test('bots group by folder, loose bots first, in order', () {
    final f = FakeBackend();
    final a = f.bot();
    final groups = groupBotsByFolder([a], const [BotFolder(id: 'x', name: 'X')]);
    expect(groups.single.$1, isNull);
    f.botFolder = 'x';
    final grouped = groupBotsByFolder([f.bot()], const [BotFolder(id: 'x', name: 'X')]);
    expect(grouped.single.$1?.name, 'X');
  });
}
