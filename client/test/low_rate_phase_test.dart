// A working bot's indicators redraw a few times a second, not on every display frame (D-549).
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:casama/ui/motion.dart';

Future<int> framesOver(WidgetTester tester, Widget child, {int ticks = 120}) async {
  await tester.pumpWidget(MaterialApp(home: Center(child: child)));
  var frames = 0;
  var counting = true;
  tester.binding.addPersistentFrameCallback((_) {
    if (counting) frames++;
  });
  // Drive like a 60 Hz display: draw only when a frame was asked for.
  for (var i = 0; i < ticks; i++) {
    await tester.binding.delayed(const Duration(milliseconds: 16));
    if (tester.binding.hasScheduledFrame) await tester.pump();
  }
  counting = false;
  return frames;
}

void main() {
  testWidgets('LowRatePhase redraws at its own rate, not every vsync', (tester) async {
    final frames = await framesOver(
      tester,
      LowRatePhase(
        period: const Duration(seconds: 1),
        builder: (_, t, _) => Opacity(opacity: 0.5 + t / 2, child: const SizedBox(width: 8, height: 8)),
      ),
    );
    // About 2 s at 12 fps; a vsync-driven animation would draw ~120.
    expect(frames, inInclusiveRange(15, 35));
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('Pulse with fps stays low-rate', (tester) async {
    final frames = await framesOver(tester, const Pulse(fps: 12, child: SizedBox(width: 8, height: 8)));
    expect(frames, lessThan(40));
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('LowRatePhase stops when animations are off', (tester) async {
    final frames = await framesOver(
      tester,
      MediaQuery(
        data: const MediaQueryData(disableAnimations: true),
        child: LowRatePhase(period: const Duration(seconds: 1), builder: (_, t, _) => const SizedBox()),
      ),
    );
    expect(frames, lessThanOrEqualTo(1)); // at most the first layout after pumpWidget
    await tester.pumpWidget(const SizedBox());
  });
}
