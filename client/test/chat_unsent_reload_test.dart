// A message that didn't reach the server stays in the chat when the thread reloads (Fix 11).
import 'dart:async';

import 'package:casama/core/backend.dart';
import 'package:casama/core/local_cache.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

void main() {
  (ProviderContainer, FakeBackend, ChatController) setUpChat() {
    final backend = FakeBackend()
      ..storedMessages = [ChatMessageView(id: 'm-1', role: 'assistant', text: 'Hello', createdAt: DateTime(2026))];
    final container = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
    addTearDown(container.dispose);
    container.listen(chatControllerProvider(botId), (_, _) {});
    return (container, backend, container.read(chatControllerProvider(botId).notifier));
  }

  List<MessageEntry> messages(ProviderContainer c) => c.read(chatControllerProvider(botId)).entries.whereType<MessageEntry>().toList();

  test('a failed message is still there, with Try Again, after the thread reloads', () async {
    final (container, backend, c) = setUpChat();
    await c.open(convId);
    backend.failNextSend = Exception('connection refused');
    await expectLater(c.send('Book the hotel', skills: ['travel']), throwsException);
    expect(messages(container).last.failed, isTrue);

    // Another device sent something, a routine posted: the chat reloads.
    await c.open(convId);
    final kept = messages(container).last;
    expect(kept.text, 'Book the hotel');
    expect(kept.failed, isTrue);

    await c.resend(kept.id);
    expect(backend.sent, ['Book the hotel']);
    expect(backend.sentSkills.last, ['travel']);
  });

  test('it is still there after looking at another chat and coming back', () async {
    final (container, backend, c) = setUpChat();
    await c.open(convId);
    backend.failNextSend = Exception('connection refused');
    await expectLater(c.send('Book the hotel'), throwsException);
    await c.open('other-chat');
    expect(messages(container).where((m) => m.failed), isEmpty);
    await c.open(convId);
    expect(messages(container).last.text, 'Book the hotel');
    expect(messages(container).last.failed, isTrue);
  });

  test('a message still waiting for its files stays through a reload', () async {
    final (container, _, c) = setUpChat();
    await c.open(convId);
    final uploads = Completer<bool>();
    const file = AttachmentRef(path: 'uploads/a.png', name: 'a.png', mimeType: 'image/png', size: 3);
    final sending = c.send('Look at this', attachments: [file], uploads: uploads.future);
    await Future<void>.delayed(Duration.zero);
    await c.open(convId);
    expect(messages(container).last.text, 'Look at this');
    expect(messages(container).last.uploading, isTrue);
    uploads.complete(true);
    await sending;
  });
  test('a Not sent message is still there, in its place, after the app is closed and opened again (117 Windows check 58)', () async {
    final cache = MemoryCache();
    ProviderContainer start(FakeBackend backend) {
      final c = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend), localCacheProvider.overrideWithValue(cache)]);
      addTearDown(c.dispose);
      c.listen(chatControllerProvider(botId), (_, _) {});
      return c;
    }

    final backend = FakeBackend()
      ..storedMessages = [ChatMessageView(id: 'm-1', role: 'assistant', text: 'Hello', createdAt: DateTime(2026))];
    final first = start(backend);
    final c1 = first.read(chatControllerProvider(botId).notifier);
    await c1.open(convId);
    backend.failNextSend = Exception('connection refused');
    await expectLater(c1.send('Book the hotel'), throwsException);
    await Future<void>.delayed(Duration.zero);
    first.dispose();

    // The app opens again.
    final again = FakeBackend()..storedMessages = backend.storedMessages;
    final second = start(again);
    final c2 = second.read(chatControllerProvider(botId).notifier);
    await c2.open(convId);
    final kept = messages(second).last;
    expect(kept.text, 'Book the hotel');
    expect(kept.failed, isTrue);
    expect(messages(second).first.text, 'Hello');

    // Try Again sends it and it's no longer saved as Not sent.
    await c2.resend(kept.id);
    expect(again.sent, ['Book the hotel']);
    await Future<void>.delayed(Duration.zero);
    expect(await cache.read('unsent:$convId'), isEmpty);
  });

  test("a discarded Not sent message doesn't come back after a restart", () async {
    final cache = MemoryCache();
    final backend = FakeBackend();
    final first = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend), localCacheProvider.overrideWithValue(cache)]);
    first.listen(chatControllerProvider(botId), (_, _) {});
    final c1 = first.read(chatControllerProvider(botId).notifier);
    await c1.open(convId);
    backend.failNextSend = Exception('connection refused');
    await expectLater(c1.send('Never mind'), throwsException);
    c1.discardUnsent(messages(first).last.id);
    await Future<void>.delayed(Duration.zero);
    first.dispose();
    final second = ProviderContainer(overrides: [backendProvider.overrideWithValue(FakeBackend()), localCacheProvider.overrideWithValue(cache)]);
    addTearDown(second.dispose);
    second.listen(chatControllerProvider(botId), (_, _) {});
    await second.read(chatControllerProvider(botId).notifier).open(convId);
    expect(messages(second).where((m) => m.failed), isEmpty);
  });
}
