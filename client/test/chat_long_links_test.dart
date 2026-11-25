// A long address written as its own link text shows short: host and the start of the path (F5).
import 'package:casama/features/chat/widgets/chat_markdown.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

const _long =
    'https://www.example.com/reports/2026/q4/summary%20for%20the%20board%20meeting?ref=mail&utm_source=newsletter&utm_campaign=winter';

void main() {
  test('a long bare address shows host and the start of the path', () {
    final label = shortLinkLabel(_long, _long)!;
    expect(label, startsWith('example.com/reports/2026/q4/'));
    expect(label, endsWith('…'));
    expect(label.length, lessThan(45));
    // Written without the scheme (GFM autolinks www. addresses as http://).
    expect(shortLinkLabel(_long.substring(8), _long), isNotNull);
  });

  test('short addresses and words the author chose stay as they are', () {
    expect(
      shortLinkLabel('https://example.com/a', 'https://example.com/a'),
      isNull,
    );
    expect(
      shortLinkLabel(
        'the board summary for Q4 2026, with every chart in it, here',
        _long,
      ),
      isNull,
    );
  });

  testWidgets(
    'the link shows short, the tap and the tooltip keep the whole address',
    (tester) async {
      final launched = <String>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/url_launcher'),
            (call) async {
              if (call.method == 'launch' || call.method == 'launchUrl') {
                launched.add((call.arguments as Map)['url'] as String);
                return true;
              }
              return call.method == 'canLaunch' ? true : null;
            },
          );
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(
              const MethodChannel('plugins.flutter.io/url_launcher'),
              null,
            ),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChatMarkdown(
              selectable: false,
              data: 'See $_long\n\nAnd [$_long]($_long) too.',
            ),
          ),
        ),
      );
      expect(find.byKey(const Key('shortLink')), findsNWidgets(2));
      expect(
        find.textContaining('summary%20for', findRichText: true),
        findsNothing,
      );
      final tooltip = tester.widget<Tooltip>(
        find.ancestor(
          of: find.byKey(const Key('shortLink')).first,
          matching: find.byType(Tooltip),
        ),
      );
      expect(tooltip.message, _long);
      await tester.tap(find.byKey(const Key('shortLink')).first);
      await tester.pump();
      expect(launched.single, _long);
    },
  );
}
