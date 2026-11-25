import 'package:casama/ui/tool_words.dart';
import 'package:flutter_test/flutter_test.dart';

// D-541: an inbox title doesn't repeat the bot's name.
void main() {
  test('summaries that name their bot are shown as they are', () {
    expect(
      approvalSummaryNamesBot('Ada asks to run add (risky): Count the files.'),
      isTrue,
    );
    expect(approvalSummaryNamesBot('Ada wants to run shell.exec: ls'), isTrue);
    expect(approvalSummaryNamesBot('Run a destructive shell command'), isFalse);
  });
}
