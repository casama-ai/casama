// The `casama/app_browser` calls native makes on Dart reach the controller (PROTOCOL.md §3).
import 'package:casama/features/app_browser/app_browser_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class _Recorder implements AppBrowserNativeEvents {
  final calls = <String>[];

  @override
  void windowHidden() => calls.add('hidden');

  @override
  void windowShown() => calls.add('shown');

  @override
  void urlChanged(String url, String title) => calls.add('url $url $title');

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> fromNative(String method) => TestDefaultBinaryMessengerBinding
      .instance
      .defaultBinaryMessenger
      .handlePlatformMessage(
        MethodAppBrowserChannel.name,
        const StandardMethodCodec().encodeMethodCall(MethodCall(method)),
        (_) {},
      );

  test(
    'the Mac window hiding and coming back both reach the controller',
    () async {
      final channel = MethodAppBrowserChannel();
      final recorder = _Recorder();
      channel.setHandler(recorder);
      addTearDown(() => channel.setHandler(null));
      await fromNative('windowHidden');
      await fromNative('windowShown');
      expect(recorder.calls, ['hidden', 'shown']);
    },
  );

  test('an address changed in place reaches the controller', () async {
    final channel = MethodAppBrowserChannel();
    final recorder = _Recorder();
    channel.setHandler(recorder);
    addTearDown(() => channel.setHandler(null));
    await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage(
          MethodAppBrowserChannel.name,
          const StandardMethodCodec().encodeMethodCall(
            MethodCall('urlChanged', {
              'url': 'https://shop.example/item/42',
              'title': 'Item',
            }),
          ),
          (_) {},
        );
    expect(recorder.calls, ['url https://shop.example/item/42 Item']);
  });
}
