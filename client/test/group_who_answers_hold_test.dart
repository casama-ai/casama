// The group's "… will answer" line holds while bots are working (L7): it followed every bot that
// posted, so it kept switching in the customer's build 108 round.
import 'package:casama/features/chat/chat_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('holds while bots work, then moves to whoever spoke last', () {
    var held = holdSpeaker(
      held: null,
      conversationId: 'g1',
      lastSpeakerId: 'ada',
      running: false,
    );
    expect(held.id, 'ada');
    held = holdSpeaker(
      held: held,
      conversationId: 'g1',
      lastSpeakerId: 'bo',
      running: true,
    );
    expect(held.id, 'ada');
    held = holdSpeaker(
      held: held,
      conversationId: 'g1',
      lastSpeakerId: 'cy',
      running: true,
    );
    expect(held.id, 'ada');
    held = holdSpeaker(
      held: held,
      conversationId: 'g1',
      lastSpeakerId: 'cy',
      running: false,
    );
    expect(held.id, 'cy');
  });

  test(
    'another chat, or nobody held yet, takes the current speaker at once',
    () {
      final held = holdSpeaker(
        held: null,
        conversationId: 'g1',
        lastSpeakerId: 'ada',
        running: false,
      );
      expect(
        holdSpeaker(
          held: held,
          conversationId: 'g2',
          lastSpeakerId: 'bo',
          running: true,
        ).id,
        'bo',
      );
      final none = holdSpeaker(
        held: null,
        conversationId: 'g1',
        lastSpeakerId: null,
        running: false,
      );
      expect(
        holdSpeaker(
          held: none,
          conversationId: 'g1',
          lastSpeakerId: 'bo',
          running: true,
        ).id,
        'bo',
      );
    },
  );
}
