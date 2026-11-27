// A message that wasn't sent keeps its place by time when the chat reloads (L15): the customer's
// Not sent messages moved below replies that came after them.
import 'package:casama/features/chat/chat_controller.dart';
import 'package:flutter_test/flutter_test.dart';

MessageEntry _m(
  String id,
  int minute, {
  String role = 'assistant',
  bool failed = false,
}) => MessageEntry(
  id: id,
  role: role,
  text: id,
  at: DateTime(2026, 11, 27, 10, minute),
  failed: failed,
);

List<String> _ids(List<ChatEntry> l) => [
  for (final e in l) (e as MessageEntry).id,
];

void main() {
  final saved = [
    _m('a', 0, role: 'user'),
    _m('b', 1),
    _m('c', 5, role: 'user'),
    _m('d', 6),
  ];

  test('a Not sent message goes back between the replies around it', () {
    final out = placeLocalByTime(saved, [
      _m('x', 3, role: 'user', failed: true),
    ]);
    expect(_ids(out), ['a', 'b', 'x', 'c', 'd']);
  });

  test('several keep their own order, and newer ones go last', () {
    final out = placeLocalByTime(saved, [
      _m('x', 2, role: 'user', failed: true),
      _m('y', 3, role: 'user', failed: true),
      _m('z', 9, role: 'user'),
    ]);
    expect(_ids(out), ['a', 'b', 'x', 'y', 'c', 'd', 'z']);
  });

  test('one with no time goes last', () {
    final out = placeLocalByTime(saved, [
      const MessageEntry(id: 'x', role: 'user', text: 'x', failed: true),
    ]);
    expect(_ids(out), ['a', 'b', 'c', 'd', 'x']);
  });
}
