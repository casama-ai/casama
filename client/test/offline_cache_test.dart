import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:casama/core/backend.dart';
import 'package:casama/core/local_cache.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/core/server_reachability.dart';
import 'package:casama/core/theme.dart';
import 'package:casama/features/chat/chat_screen.dart';
import 'package:casama/l10n/delegates.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama/ui/server_reachability_bar.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

class _HeldMessagesBackend extends FakeBackend {
  Completer<void>? holdMessages;

  @override
  Future<List<ChatMessageView>> messages(String conversationId, {int? limit, String? before, String? around}) async {
    final gate = holdMessages;
    if (gate != null && !gate.isCompleted) await gate.future;
    return super.messages(conversationId, limit: limit, before: before, around: around);
  }
}

void main() {
  test('the drift cache keeps JSON snapshots by key', () async {
    final cache = DriftCache(NativeDatabase.memory());
    expect(await cache.read('bots:o1'), isNull);
    await cache.write('bots:o1', [
      {'id': 'b1', 'name': 'Ada'},
    ]);
    await cache.write('bots:o1', [
      {'id': 'b2', 'name': 'Bo'},
    ]);
    expect(await cache.read('bots:o1'), [
      {'id': 'b2', 'name': 'Bo'},
    ]);
    await cache.clear();
    expect(await cache.read('bots:o1'), isNull);
    await cache.close();
  });

  testWidgets('a chat opened once stays readable offline', (tester) async {
    await setSize(tester, const Size(700, 900));
    final cache = MemoryCache();
    final backend = FakeBackend()
      ..storedMessages = [
        ChatMessageView(id: 'm1', role: 'user', text: 'What is due today?', createdAt: DateTime(2026, 11, 1)),
        ChatMessageView(id: 'm2', role: 'assistant', text: 'Two invoices are due.', createdAt: DateTime(2026, 11, 1, 0, 1)),
      ];
    await tester.pumpWidget(harness(backend, const ChatScreen(botId: botId, conversationId: convId), cache: cache));
    await tester.pumpAndSettle();
    expect(find.text('Two invoices are due.'), findsOneWidget);
    expect(cache.data.keys, containsAll(['msgs:$convId', 'bots:$orgId']));

    backend.offline = true;
    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(harness(backend, const ChatScreen(botId: botId, conversationId: convId), cache: cache));
    await tester.pumpAndSettle();
    expect(find.text('Two invoices are due.'), findsOneWidget);
    expect(find.byKey(const Key('offlineNote')), findsOneWidget);
  });

  testWidgets('no second offline bar in chat while the top reachability bar is up, and no flash on reconnect', (tester) async {
    await setSize(tester, const Size(700, 900));
    addTearDown(() => serverReachability.value = Reachability.ok);
    final cache = MemoryCache();
    final backend = _HeldMessagesBackend()
      ..storedMessages = [
        ChatMessageView(id: 'm1', role: 'user', text: 'What is due today?', createdAt: DateTime(2026, 11, 1)),
        ChatMessageView(id: 'm2', role: 'assistant', text: 'Two invoices are due.', createdAt: DateTime(2026, 11, 1, 0, 1)),
      ];
    await tester.pumpWidget(
      harness(
        backend,
        const ServerReachabilityBar(child: ChatScreen(botId: botId, conversationId: convId)),
        cache: cache,
      ),
    );
    await tester.pumpAndSettle();

    // Server goes unreachable: top bar shows, chat keeps saved messages without stacking a second offline bar.
    backend.offline = true;
    serverReachability.value = Reachability.unreachable;
    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(
      harness(
        backend,
        const ServerReachabilityBar(child: ChatScreen(botId: botId, conversationId: convId)),
        cache: cache,
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Two invoices are due.'), findsOneWidget);
    expect(find.byKey(const Key('serverReachabilityBar')), findsOneWidget);
    expect(find.byKey(const Key('offlineNote')), findsNothing);

    // Self-hosted server offline: still only the top bar.
    serverReachability.value = Reachability.serverOffline;
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.byKey(const Key('serverReachabilityBar')), findsOneWidget);
    expect(find.byKey(const Key('offlineNote')), findsNothing);

    // Server returns while the thread reload is still in flight: offlineNote must not flash.
    final gate = Completer<void>();
    backend
      ..offline = false
      ..holdMessages = gate
      ..storedMessages = [
        ...backend.storedMessages,
        ChatMessageView(id: 'm3', role: 'assistant', text: 'Both are paid now.', createdAt: DateTime(2026, 11, 1, 0, 2)),
      ];
    serverReachability.value = Reachability.ok;
    await tester.pump();
    expect(find.byKey(const Key('offlineNote')), findsNothing);
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.byKey(const Key('serverReachabilityBar')), findsNothing);
    expect(find.byKey(const Key('offlineNote')), findsNothing);

    gate.complete();
    await tester.pumpAndSettle();
    expect(find.text('Both are paid now.'), findsOneWidget);
    expect(find.byKey(const Key('offlineNote')), findsNothing);
  });

  testWidgets('reachability bar sets contrasting status bar brightness for its inverse surface', (tester) async {
    await setSize(tester, const Size(500, 800));
    addTearDown(() => serverReachability.value = Reachability.ok);
    final backend = FakeBackend();
    serverReachability.value = Reachability.unreachable;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [backendProvider.overrideWithValue(backend)],
        child: MaterialApp(
          theme: AppTheme.dark(),
          localizationsDelegates: testLocalizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const ServerReachabilityBar(child: SizedBox()),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));
    final region = tester.widget<AnnotatedRegion<SystemUiOverlayStyle>>(
      find.ancestor(
        of: find.byKey(const Key('serverReachabilityBar')),
        matching: find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
      ),
    );
    // Dark theme uses a light inverseSurface, so status bar icons must be dark (iOS brightness: light).
    expect(region.value.statusBarBrightness, Brightness.light);
    expect(region.value.statusBarIconBrightness, Brightness.dark);

    serverReachability.value = Reachability.ok;
    await tester.pump(const Duration(milliseconds: 300));
  });
}
