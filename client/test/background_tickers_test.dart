// No endless animation runs while a desktop window is in the background (D-615): the customer's
// build 108 Mac used 61–67% CPU hidden with every bot idle.
import 'package:casama/core/background_tickers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  bool tickersOn(WidgetTester tester) =>
      TickerMode.valuesOf(tester.element(find.byKey(const Key('probe')))).enabled;

  testWidgets('a desktop window mutes animations while it is not in front', (
    tester,
  ) async {
    await tester.pumpWidget(
      const BackgroundTickers(
        desktop: true,
        child: SizedBox(key: Key('probe')),
      ),
    );
    expect(tickersOn(tester), isTrue);

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    await tester.pump();
    expect(tickersOn(tester), isFalse);

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    expect(tickersOn(tester), isTrue);
  });

  testWidgets(
    'a phone keeps its animations (it stops drawing when hidden anyway)',
    (tester) async {
      await tester.pumpWidget(
        const BackgroundTickers(
          desktop: false,
          child: SizedBox(key: Key('probe')),
        ),
      );
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      await tester.pump();
      expect(tickersOn(tester), isTrue);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();
    },
  );
}
