import 'package:casama/core/tracking_permission.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show AppLifecycleState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Records what would reach iOS's tracking prompt and SKAdNetwork.
class FakeTrackingDriver implements TrackingDriver {
  FakeTrackingDriver(this.current, {this.answer = TrackingStatus.denied});

  TrackingStatus current;
  TrackingStatus answer;
  final calls = <String>[];

  @override
  Future<TrackingStatus> status() async {
    calls.add('status');
    return current;
  }

  @override
  Future<TrackingStatus> request() async {
    calls.add('request');
    current = answer;
    return current;
  }

  @override
  Future<void> openSettings() async => calls.add('openSettings');

  @override
  Future<void> registerInstall() async => calls.add('registerInstall');
}

/// Apple's tracking prompt (D-589).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeTrackingDriver driver;
  late bool inFront;

  setUp(() {
    TrackingPermissionNotifier.reset();
    driver = FakeTrackingDriver(TrackingStatus.notDetermined);
    TrackingPermissionNotifier.driver = driver;
    TrackingPermissionNotifier.appliesOverride = true;
    inFront = true;
    TrackingPermissionNotifier.inFrontOverride = () => inFront;
  });

  tearDown(TrackingPermissionNotifier.reset);

  ProviderContainer container() {
    final c = ProviderContainer();
    addTearDown(c.dispose);
    return c;
  }

  Future<void> settle(WidgetTester tester) async {
    await tester.pump(
      TrackingPermissionNotifier.settleTime + const Duration(milliseconds: 1),
    );
    await tester.pump();
  }

  group('who is asked', () {
    test('only the official iPhone and iPad app on Casama Cloud', () {
      bool applies({
        bool officialBuild = true,
        bool cloud = true,
        bool isWeb = false,
        TargetPlatform platform = TargetPlatform.iOS,
      }) => trackingPromptApplies(
        officialBuild: officialBuild,
        cloud: cloud,
        isWeb: isWeb,
        platform: platform,
      );
      expect(applies(), isTrue);
      expect(applies(officialBuild: false), isFalse, reason: 'no Meta keys');
      expect(applies(cloud: false), isFalse, reason: 'self-hosted server');
      expect(applies(isWeb: true), isFalse);
      for (final p in [
        TargetPlatform.android,
        TargetPlatform.macOS,
        TargetPlatform.windows,
        TargetPlatform.linux,
      ]) {
        expect(applies(platform: p), isFalse, reason: '$p');
      }
    });

    testWidgets('elsewhere it never reaches iOS and says unavailable', (
      tester,
    ) async {
      TrackingPermissionNotifier.appliesOverride = false;
      final c = container();
      expect(c.read(trackingPermissionProvider), TrackingStatus.unavailable);
      c.read(trackingPermissionProvider.notifier).firstRunClear(true);
      await settle(tester);
      expect(driver.calls, isEmpty);
    });
  });

  group('the ask', () {
    testWidgets('comes once, after nothing has covered the app for a moment', (
      tester,
    ) async {
      final c = container();
      c.read(trackingPermissionProvider);
      await tester.pump();
      expect(c.read(trackingPermissionProvider), TrackingStatus.notDetermined);
      final n = c.read(trackingPermissionProvider.notifier);
      n.firstRunClear(true);
      await tester.pump(const Duration(seconds: 1));
      expect(driver.calls, isNot(contains('request')));
      await settle(tester);
      expect(driver.calls.where((x) => x == 'request'), hasLength(1));
      expect(c.read(trackingPermissionProvider), TrackingStatus.denied);
      expect(driver.calls.last, 'registerInstall');
      n.firstRunClear(true);
      await settle(tester);
      expect(driver.calls.where((x) => x == 'request'), hasLength(1));
    });

    testWidgets('waits while a first-run page comes back up', (tester) async {
      final c = container();
      final n = c.read(trackingPermissionProvider.notifier);
      n.firstRunClear(true);
      await tester.pump(const Duration(seconds: 2));
      n.firstRunClear(false);
      await settle(tester);
      expect(driver.calls, isNot(contains('request')));
      n.firstRunClear(true);
      await settle(tester);
      expect(driver.calls, contains('request'));
    });

    testWidgets('waits for the app to be in front, then asks on resume', (
      tester,
    ) async {
      inFront = false;
      final c = container();
      c.read(trackingPermissionProvider.notifier).firstRunClear(true);
      await settle(tester);
      expect(driver.calls, isNot(contains('request')));
      inFront = true;
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();
      await tester.pump();
      expect(driver.calls, contains('request'));
    });

    testWidgets('an answer already given is never asked again', (tester) async {
      driver.current = TrackingStatus.authorized;
      final c = container();
      c.read(trackingPermissionProvider.notifier).firstRunClear(true);
      await settle(tester);
      expect(driver.calls, isNot(contains('request')));
      expect(c.read(trackingPermissionProvider), TrackingStatus.authorized);
      expect(driver.calls, contains('registerInstall'));
    });

    testWidgets('a change in the Settings app shows on resume', (tester) async {
      driver.current = TrackingStatus.authorized;
      final c = container();
      c.read(trackingPermissionProvider);
      await tester.pump();
      expect(c.read(trackingPermissionProvider), TrackingStatus.authorized);
      driver.current = TrackingStatus.denied;
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();
      expect(c.read(trackingPermissionProvider), TrackingStatus.denied);
    });
  });

  test('wire values match the install record contract', () {
    expect(
      TrackingStatus.values.map((s) => s.wire).whereType<String>().toSet(),
      {'authorized', 'denied', 'restricted', 'not_determined'},
    );
    expect(TrackingStatus.unavailable.wire, isNull);
    expect(TrackingStatus.fromNative('authorized'), TrackingStatus.authorized);
    expect(TrackingStatus.fromNative(null), TrackingStatus.unavailable);
  });
}
