import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:casama/core/mobile_extras.dart';

// The Mac's Share and Finder Quick Action extensions leave what was shared in the app group; the
// app takes it over casama/mac when quick ask opens with shared=1.
const _mac = MethodChannel('casama/mac');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  late List<String> calls;

  void answer(Map<String, Object? Function()> replies) {
    messenger.setMockMethodCallHandler(_mac, (call) async {
      calls.add(call.method);
      final reply = replies[call.method];
      return reply == null ? null : reply();
    });
  }

  setUp(() => calls = []);

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    messenger.setMockMethodCallHandler(_mac, null);
  });

  test('the Mac takes shared text and files from casama/mac', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    answer({
      'takeSharedText': () => 'Hello from Safari',
      'takeSharedFiles': () => jsonEncode([
        {
          'path': '/tmp/share/report.pdf',
          'name': 'report.pdf',
          'mime': 'application/pdf',
        },
        {'path': '/tmp/share/photo.heic'},
      ]),
    });

    expect(await takeSharedText(), 'Hello from Safari');
    final files = await takeSharedFiles();
    expect(files.map((f) => f.name), ['report.pdf', 'photo.heic']);
    expect(files.map((f) => f.mimeType), ['application/pdf', null]);
    expect(calls, ['takeSharedText', 'takeSharedFiles']);
  });

  test('nothing waiting, or no native side, is empty on the Mac', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    answer({});
    expect(await takeSharedText(), '');
    expect(await takeSharedFiles(), isEmpty);

    answer({
      'takeSharedText': () => throw MissingPluginException(),
      'takeSharedFiles': () => throw PlatformException(code: 'gone'),
    });
    expect(await takeSharedText(), '');
    expect(await takeSharedFiles(), isEmpty);
  });

  test('other desktops never ask casama/mac', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    answer({'takeSharedText': () => 'not here'});
    expect(await takeSharedText(), '');
    expect(await takeSharedFiles(), isEmpty);
    expect(calls, isEmpty);
  });
}
