// The asks after a reply (rating, testimonial, star, invite) open only while the chat that earned
// them is still in front (L12): the customer's invite ask covered his Memory page.
import 'package:casama/features/chat/chat_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the bot chat is on screen only at its own address', () {
    expect(chatOnScreen(Uri.parse('/bots/b1/chat?c=c1'), botId: 'b1'), isTrue);
    expect(chatOnScreen(Uri.parse('/bots/b1/memory'), botId: 'b1'), isFalse);
    expect(chatOnScreen(Uri.parse('/bots/b2/chat'), botId: 'b1'), isFalse);
    expect(chatOnScreen(Uri.parse('/settings'), botId: 'b1'), isFalse);
  });

  test(
    "a group chat is on screen at the group's address, not its lead bot's chat",
    () {
      expect(
        chatOnScreen(Uri.parse('/groups/g1'), botId: 'b1', groupId: 'g1'),
        isTrue,
      );
      expect(
        chatOnScreen(Uri.parse('/bots/b1/chat'), botId: 'b1', groupId: 'g1'),
        isFalse,
      );
      expect(
        chatOnScreen(Uri.parse('/groups/g2'), botId: 'b1', groupId: 'g1'),
        isFalse,
      );
    },
  );
}
