// Live computer pictures don't pile up in the image cache (the customer's build 117 report: the
// Windows app grew from 806 MB to 1,225 MB after four bots worked on their computers).
import 'dart:convert';
import 'dart:typed_data';

import 'package:casama/ui/live_frames.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

/// A 1 x 1 PNG; each call is a new byte list, like each screenshot fetched.
Uint8List _png() => base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=',
);

void main() {
  testWidgets(
    'a replaced frame leaves the image cache; the shown one stays until disposed',
    (tester) async {
      final cache = PaintingBinding.instance.imageCache..clear();
      final frames = LiveFrames();
      Widget show(Uint8List bytes) => Directionality(
        textDirection: TextDirection.ltr,
        child: Image(
          image: frames.track(MemoryImage(bytes)),
          gaplessPlayback: true,
        ),
      );
      Future<void> settle(Widget w) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(w);
          await Future<void>.delayed(const Duration(milliseconds: 50));
        });
        await tester.pump();
      }

      final first = _png(), second = _png(), third = _png();
      await settle(show(first));
      expect(cache.containsKey(MemoryImage(first)), isTrue);

      await settle(show(second));
      expect(
        cache.containsKey(MemoryImage(first)),
        isFalse,
        reason: 'the old frame is evicted',
      );
      expect(cache.containsKey(MemoryImage(second)), isTrue);

      // The same frame again (a rebuild) keeps it.
      await settle(show(second));
      expect(cache.containsKey(MemoryImage(second)), isTrue);

      await settle(show(third));
      expect(cache.containsKey(MemoryImage(second)), isFalse);
      expect(frames.tracked, 1);

      frames.dispose();
      expect(cache.containsKey(MemoryImage(third)), isFalse);
    },
  );
}
