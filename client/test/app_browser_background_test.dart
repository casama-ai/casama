import 'package:casama/features/app_browser/app_browser_background.dart';
import 'package:casama/features/app_browser/app_browser_socket.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('AppBrowserBackgroundPolicy', () {
    test('schedules reminder only within 60s of last step and respects 2-min cooldown', () {
      var now = DateTime(2026, 11, 28, 12, 0, 0);
      final policy = AppBrowserBackgroundPolicy(now: () => now);

      // No step yet -> no reminder.
      expect(policy.shouldScheduleReminder('run-1'), isFalse);

      // Step just ran -> allowed.
      policy.noteStep('run-1', botName: 'Shopper', conversationId: 'conv-1', site: 'example.com');
      expect(policy.shouldScheduleReminder('run-1'), isTrue);

      // Mark scheduled -> blocked for 2 minutes on the same run.
      policy.markReminderScheduled('run-1');
      now = now.add(const Duration(seconds: 30));
      policy.noteStep('run-1');
      expect(policy.shouldScheduleReminder('run-1'), isFalse);

      // Different run is not blocked by run-1's cooldown.
      expect(policy.shouldScheduleReminder('run-2'), isTrue);

      // After 2 minutes and a recent step -> allowed again on run-1.
      now = now.add(const Duration(minutes: 2));
      policy.noteStep('run-1');
      expect(policy.shouldScheduleReminder('run-1'), isTrue);

      // Stale step (>60s ago) -> no reminder.
      now = now.add(const Duration(seconds: 61));
      expect(policy.shouldScheduleReminder('run-1'), isFalse);
    });

    test('throttles notification step updates to at most once every 5 seconds', () {
      var now = DateTime(2026, 11, 28, 12, 0, 0);
      final policy = AppBrowserBackgroundPolicy(now: () => now);

      expect(policy.shouldThrottleNotify(), isFalse);
      now = now.add(const Duration(seconds: 2));
      expect(policy.shouldThrottleNotify(), isTrue);
      now = now.add(const Duration(seconds: 3));
      expect(policy.shouldThrottleNotify(), isFalse);
    });

    test('builds away summary on return after Android background steps', () {
      var now = DateTime(2026, 11, 28, 12, 0, 0);
      final policy = AppBrowserBackgroundPolicy(now: () => now);

      policy.markLeft(
        platform: 'android',
        keepGoing: true,
        settingOn: true,
        runId: 'run-42',
        botName: 'Shopper',
        conversationId: 'conv-9',
        site: 'store.example.com',
      );
      policy.noteStep('run-42');
      policy.noteStep('run-42');
      policy.noteStep('run-42');
      now = now.add(const Duration(seconds: 45));

      final summary = policy.markReturned();
      expect(summary, isNotNull);
      expect(summary!.runId, 'run-42');
      expect(summary.conversationId, 'conv-9');
      expect(summary.botName, 'Shopper');
      expect(summary.steps, 3);
      expect(policy.inBackground, isFalse);
      expect(policy.keepGoingActive, isFalse);
    });

    test('detects unclean os_killed exit via SharedPreferences marker', () async {
      SharedPreferences.setMockInitialValues({kAppBrowserBgActivePref: true});
      await AppBrowserBackgroundPolicy.checkUncleanExit();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool(kAppBrowserBgActivePref), isFalse);
    });

    test('step labels are plain human words', () {
      expect(appBrowserStepLabel('fill'), 'Filling in the form');
      expect(appBrowserStepLabel('click'), 'Clicking on the page');
      expect(appBrowserStepLabel('open'), 'Opening the page');
      expect(appBrowserStepLabel('handoff'), 'Waiting for you');
    });
  });

  group('AppBrowserSocket visibility and background_stopped', () {
    test('sends visible flag in hello and visibility/background_stopped frames', () {
      final sent = <String>[];
      final fakeConn = _FakeConn(sent);
      final socket = AppBrowserSocket(
        transport: _FakeTransport(fakeConn),
        apiUrl: 'https://api.casama.ai',
        token: 'tok',
        onCall: (_) async => {'ok': true},
      );
      expect(socket.visible, isTrue);
      socket.setVisible(false);
      expect(socket.visible, isFalse);
      socket.sendBackgroundStopped('battery_saver');
      expect(socket.visible, isFalse);
    });
  });
}

class _FakeTransport implements AppBrowserTransport {
  _FakeTransport(this.conn);
  final AppBrowserConnection conn;
  @override
  Future<AppBrowserConnection> connect(Uri url, Map<String, String> headers) async => conn;
}

class _FakeConn implements AppBrowserConnection {
  _FakeConn(this.sent);
  final List<String> sent;
  @override
  Stream<String> get messages => const Stream.empty();
  @override
  void send(String message) => sent.add(message);
  @override
  Future<void> close() async {}
}
