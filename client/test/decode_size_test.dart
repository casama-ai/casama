import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:casama/ui/decode_size.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

Future<Uint8List> _png(int w, int h) async {
  final recorder = ui.PictureRecorder();
  Canvas(recorder).drawRect(
    Rect.fromLTWH(0, 0, w.toDouble(), h.toDouble()),
    Paint()..color = const Color(0xFF3366FF),
  );
  final image = await recorder.endRecording().toImage(w, h);
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  return data!.buffer.asUint8List();
}

void main() {
  group('coverTargetSize', () {
    test('a wide picture keeps its shape and its height matches the box', () {
      expect(coverTargetSize(4000, 1000, 100, 100), (400, 100));
    });

    test('a tall picture keeps its shape and its width matches the box', () {
      expect(coverTargetSize(1000, 3000, 120, 80), (120, 360));
    });

    test('never scaled up', () {
      expect(coverTargetSize(50, 40, 200, 200), (50, 40));
    });
  });

  testWidgets('a big picture in a small box is decoded at the box size', (
    tester,
  ) async {
    final bytes = (await tester.runAsync(() => _png(800, 400)))!;
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(devicePixelRatio: 2),
        child: Builder(
          builder: (context) => Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Image(
                key: const Key('img'),
                image: coverDecode(
                  context,
                  MemoryImage(bytes),
                  width: 40,
                  height: 40,
                ),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 200)),
    );
    await tester.pump();
    final raw = tester.widget<RawImage>(find.byType(RawImage));
    // 40 logical × 2 = 80 px tall, and twice as wide to keep the 2:1 shape.
    expect((raw.image!.width, raw.image!.height), (160, 80));
  });

  test('equal boxes give equal providers, so the cache is shared', () {
    final bytes = Uint8List(4);
    final image = MemoryImage(bytes);
    expect(
      CoverResizeImage(image, width: 10, height: 10),
      CoverResizeImage(image, width: 10, height: 10),
    );
    expect(
      CoverResizeImage(image, width: 10, height: 10),
      isNot(CoverResizeImage(image, width: 20, height: 10)),
    );
  });
}
