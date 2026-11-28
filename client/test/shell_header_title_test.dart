import 'package:casama/l10n/delegates.dart';
import 'package:casama/ui/shell_header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  Future<double> sizeOf(
    WidgetTester tester,
    String title, {
    bool shrink = true,
  }) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: testLocalizationsDelegates,
        home: Scaffold(
          appBar: ShellHeader(
            title: title,
            titleShrinkToFit: shrink,
            actions: [
              for (final i in [1, 2, 3])
                HeaderIconButton(
                  icon: Icons.add,
                  tooltip: '$i',
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
    return tester.widget<Text>(find.text(title)).style!.fontSize!;
  }

  testWidgets('a name that fits keeps its full size', (tester) async {
    expect(await sizeOf(tester, 'Ada'), 22);
  });

  testWidgets('a long name gets smaller, but not below the floor', (
    tester,
  ) async {
    final mid = await sizeOf(tester, 'Trixie the Travel');
    expect(mid, lessThan(22));
    expect(mid, greaterThanOrEqualTo(22 * ShellHeader.minTitleScale - 1));
    final long = await sizeOf(
      tester,
      'Trixie the Travel Planner of Many Places',
    );
    expect(long, (22 * ShellHeader.minTitleScale).floorToDouble());
  });

  testWidgets('without shrink-to-fit a long name stays full size', (
    tester,
  ) async {
    expect(
      await sizeOf(tester, 'Trixie the Travel Planner', shrink: false),
      22,
    );
  });
}
