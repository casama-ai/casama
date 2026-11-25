// A group chat whose run failed (a limit reached) keeps saying why: the reload after the run ends
// must not drop the notice, and opening the chat later finds the run through the message (D-118).
import 'package:casama/core/backend.dart';
import 'package:casama/core/providers.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_backend.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  FakeBackend failedGroup() => FakeBackend()
    ..runStatus = RunStatus.failed
    ..runError = RunError(
      code: 'cloud_daily_cap',
      message: 'This workspace reached its daily limit.',
    )
    ..runsByMessage['m-ask'] = 'r-failed'
    ..storedMessages = [
      // Group messages carry no run id; the run points back at them.
      ChatMessageView(
        id: 'm-ask',
        role: 'user',
        text: 'Hi there',
        createdAt: DateTime(2026, 11, 15),
      ),
    ];

  List<NoticeEntry> failures(ProviderContainer c) => [
    for (final e in c.read(chatControllerProvider(botId)).entries)
      if (e is NoticeEntry && e.kind == NoticeKind.failed) e,
  ];

  test('opening a group chat whose last run failed shows why', () async {
    final container = ProviderContainer(
      overrides: [backendProvider.overrideWithValue(failedGroup())],
    );
    addTearDown(container.dispose);
    final c = container.read(chatControllerProvider(botId).notifier)
      ..group = true;
    await c.open(convId);
    expect(failures(container).single.text, contains('daily limit'));
  });

  test(
    'the reload after a failed group run keeps the notice the whole time',
    () async {
      final container = ProviderContainer(
        overrides: [backendProvider.overrideWithValue(failedGroup())],
      );
      addTearDown(container.dispose);
      final c = container.read(chatControllerProvider(botId).notifier)
        ..group = true;
      await c.open(convId);
      final seen = <int>[];
      container.listen(chatControllerProvider(botId), (_, s) {
        seen.add(
          s.entries
              .whereType<NoticeEntry>()
              .where((e) => e.kind == NoticeKind.failed)
              .length,
        );
      });
      await c.open(convId);
      expect(
        seen.every((n) => n == 1),
        isTrue,
        reason: 'notice count over the reload: $seen',
      );
      expect(failures(container), hasLength(1));
    },
  );

  test('opening a chat whose last reply ran out of steps shows the notice again (D-505)', () async {
    final backend = FakeBackend()
      ..runStatus = RunStatus.failed
      ..runError = RunError(code: 'max_steps_exceeded', message: 'The run stopped after 60 steps.')
      ..storedMessages = [
        ChatMessageView(id: 'm-ask', role: 'user', text: 'Go through all 80 files', createdAt: DateTime(2026, 11, 22), runId: 'r-1'),
        ChatMessageView(id: 'm-wrap', role: 'assistant', text: 'I got through 50.', createdAt: DateTime(2026, 11, 22, 0, 5), runId: 'r-1', keepGoing: true),
      ];
    final container = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
    addTearDown(container.dispose);
    await container.read(chatControllerProvider(botId).notifier).open(convId);
    expect(failures(container).single.errorCode, 'max_steps_exceeded');
  });

  test('a finished reply without Keep going shows no failure', () async {
    final backend = FakeBackend()
      ..runStatus = RunStatus.failed
      ..runError = RunError(code: 'max_steps_exceeded', message: 'x')
      ..storedMessages = [
        ChatMessageView(id: 'm-wrap', role: 'assistant', text: 'Done.', createdAt: DateTime(2026, 11, 22), runId: 'r-1'),
      ];
    final container = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
    addTearDown(container.dispose);
    await container.read(chatControllerProvider(botId).notifier).open(convId);
    expect(failures(container), isEmpty);
  });

  test('a reply cut off by a provider error shows the failure on opening, as it did live', () async {
    final backend = FakeBackend()
      ..runStatus = RunStatus.failed
      ..runError = RunError(code: 'run_error', message: 'Something went wrong while the bot was working.')
      ..storedMessages = [
        ChatMessageView(id: 'm-ask', role: 'user', text: 'Open example.com', createdAt: DateTime(2026, 11, 23), runId: 'r-1'),
        ChatMessageView(id: 'm-on-it', role: 'assistant', text: 'Opening it now.', createdAt: DateTime(2026, 11, 23, 0, 1), runId: 'r-1'),
      ];
    final container = ProviderContainer(overrides: [backendProvider.overrideWithValue(backend)]);
    addTearDown(container.dispose);
    await container.read(chatControllerProvider(botId).notifier).open(convId);
    expect(failures(container).single.errorCode, 'run_error');
    expect(container.read(chatControllerProvider(botId)).rerunId, 'm-ask');
  });
}
