// A very long bot reply folds with "Show more" (the customer's build 117 report): a 1,000-word essay
// filled the chat. A reply seen streaming stays open (no jump when it ends) and offers "Show less".
import 'package:casama/features/chat/chat_controller.dart';
import 'package:casama/features/chat/widgets/chat_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

void main() {
  final essay = List.filled(
    120,
    'The valley had eleven dry weeks before the rain came back to the hills.',
  ).join('\n\n');

  Widget reply(String text, {bool streaming = false}) => harness(
    FakeBackend(),
    Scaffold(
      body: SingleChildScrollView(
        child: AssistantMessage(
          entry: MessageEntry(
            id: 'm',
            role: 'assistant',
            text: text,
            streaming: streaming,
          ),
        ),
      ),
    ),
  );

  double bubbleHeight(WidgetTester tester) =>
      tester.getSize(find.byType(AssistantMessage)).height;

  testWidgets('a long finished reply shows folded, opens and folds again', (
    tester,
  ) async {
    await setSize(tester, const Size(900, 900));
    await tester.pumpWidget(reply(essay));
    await tester.pumpAndSettle();
    final toggle = find.byKey(const Key('replyFoldToggle'));
    expect(find.text('Show more'), findsOneWidget);
    final folded = bubbleHeight(tester);
    expect(folded, lessThan(replyFoldHeight + 150));

    await tester.tap(toggle);
    await tester.pumpAndSettle();
    expect(find.text('Show less'), findsOneWidget);
    expect(bubbleHeight(tester), greaterThan(folded * 3));

    await tester.ensureVisible(toggle);
    await tester.pumpAndSettle();
    await tester.tap(toggle);
    await tester.pumpAndSettle();
    expect(bubbleHeight(tester), folded);
  });

  testWidgets('a short reply has no fold', (tester) async {
    await setSize(tester, const Size(900, 900));
    await tester.pumpWidget(reply('Short and done.'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('replyFoldToggle')), findsNothing);
  });

  testWidgets('a long reply that streamed in stays open, then can be folded', (
    tester,
  ) async {
    await setSize(tester, const Size(900, 900));
    await tester.pumpWidget(reply(essay.substring(0, 2000), streaming: true));
    await tester.pump(const Duration(milliseconds: 300));
    // No toggle while it's still coming.
    expect(find.byKey(const Key('replyFoldToggle')), findsNothing);
    await tester.pumpWidget(reply(essay));
    await tester.pumpAndSettle();
    expect(find.text('Show less'), findsOneWidget);
    expect(bubbleHeight(tester), greaterThan(replyFoldHeight * 3));
    await tester.ensureVisible(find.byKey(const Key('replyFoldToggle')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('replyFoldToggle')));
    await tester.pumpAndSettle();
    expect(find.text('Show more'), findsOneWidget);
  });
}
