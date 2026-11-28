import 'package:casama/features/app_browser/app_browser_done.dart';
import 'package:casama/features/app_browser/app_browser_socket.dart';
import 'package:casama/features/chat/chat_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const run = AppBrowserRun(
    id: 'run1',
    botId: 'bot1',
    botName: 'Ada',
    conversationId: 'conv1',
  );
  MessageEntry msg(String role, String text) =>
      MessageEntry(id: '$role$text', role: role, text: text);

  test('the preview is the bot\'s last reply after the person\'s message', () {
    final o = appBrowserDoneOutcome(
      ChatState(
        conversationId: 'conv1',
        entries: [
          msg('assistant', 'An older answer'),
          msg('user', 'Book it'),
          msg('assistant', 'Looking now'),
          msg(
            'assistant',
            '## Booked\n\n**Table for 2** at [Nori](https://x.example) at 7pm.',
          ),
        ],
      ),
      run,
    );
    expect(o.failed, isFalse);
    expect(o.preview, 'Booked Table for 2 at Nori at 7pm.');
  });

  test('a failure notice after the person\'s message makes it failed', () {
    final o = appBrowserDoneOutcome(
      ChatState(
        conversationId: 'conv1',
        entries: [
          msg('user', 'Book it'),
          const NoticeEntry(kind: NoticeKind.failed, text: 'Limit reached'),
        ],
      ),
      run,
    );
    expect(o.failed, isTrue);
    expect(o.preview, isNull);
  });

  test('another chat says nothing', () {
    final o = appBrowserDoneOutcome(
      ChatState(conversationId: 'conv2', entries: [msg('assistant', 'Hi')]),
      run,
    );
    expect(o.failed, isFalse);
    expect(o.preview, isNull);
  });

  test('a long reply is cut short; an empty one has no preview', () {
    expect(plainPreview('a' * 400)!.length, 281);
    expect(plainPreview('```\ncode only\n```'), isNull);
  });
}
