import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/analytics.dart';

/// SharedPreferences key for Settings -> Browser -> "Keep going when I leave the app" (Android).
/// On by default per D-633 (docs/PHONE-BROWSER-BACKGROUND-PLAN.md §3, §11).
const kAppBrowserKeepGoingPref = 'casama.app_browser.keep_going';

/// SharedPreferences marker written while Android background keep-going is running, cleared on
/// every clean stop or resume. If still true at next app launch, the OS killed the process
/// (`os_killed`, plan §9, §10).
const kAppBrowserBgActivePref = 'casama.app_browser.bg_active';

/// Whether Android keeps a phone-browser task going when the user leaves the app.
class AppBrowserKeepGoingNotifier extends Notifier<bool> {
  @override
  bool build() {
    unawaited(_load());
    return true;
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getBool(kAppBrowserKeepGoingPref);
      if (saved != null && ref.mounted) state = saved;
    } catch (_) {}
  }

  Future<void> set(bool value) async {
    if (state == value) return;
    state = value;
    Analytics.log('app_browser_keep_going_setting', {'on': value});
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kAppBrowserKeepGoingPref, value);
    } catch (_) {}
  }
}

final appBrowserKeepGoingProvider =
    NotifierProvider<AppBrowserKeepGoingNotifier, bool>(
      AppBrowserKeepGoingNotifier.new,
    );

/// Summary shown at the top of chat when the user returns after Android kept going in the
/// background ("{Bot} kept going while you were away · 6 steps", plan §3).
@immutable
class AppBrowserAwaySummary {
  const AppBrowserAwaySummary({
    required this.runId,
    required this.conversationId,
    required this.botName,
    required this.steps,
  });

  final String runId;
  final String conversationId;
  final String botName;
  final int steps;
}

class AppBrowserAwaySummaryNotifier extends Notifier<AppBrowserAwaySummary?> {
  @override
  AppBrowserAwaySummary? build() => null;

  void show(AppBrowserAwaySummary summary) => state = summary;

  void clear([String? conversationId]) {
    if (conversationId == null || state?.conversationId == conversationId) {
      state = null;
    }
  }
}

final appBrowserAwaySummaryProvider =
    NotifierProvider<AppBrowserAwaySummaryNotifier, AppBrowserAwaySummary?>(
      AppBrowserAwaySummaryNotifier.new,
    );

/// Plain-language step label for the Android ongoing notification (plan §3).
String appBrowserStepLabel(String action) => switch (action) {
  'open' || 'switch_tab' => 'Opening the page',
  'click' => 'Clicking on the page',
  'fill' || 'type' => 'Filling in the form',
  'press' => 'Pressing a key',
  'scroll' => 'Scrolling the page',
  'snapshot' || 'read' || 'extract' || 'probe' => 'Reading the page',
  'screenshot' => 'Looking at the page',
  'wait' => 'Waiting for the page',
  'ask' || 'handoff' => 'Waiting for you',
  _ => 'Working in your browser',
};

/// Tracks background timing, rate limits, battery stops, and analytics for
/// docs/PHONE-BROWSER-BACKGROUND-PLAN.md (§3, §6, §7, §9).
class AppBrowserBackgroundPolicy {
  AppBrowserBackgroundPolicy({
    DateTime Function()? now,
    this.recentStepWindow = const Duration(seconds: 60),
    this.reminderCooldown = const Duration(minutes: 2),
    this.reminderDelay = const Duration(seconds: 3),
    this.idleLimit = const Duration(seconds: 60),
    this.capLimit = const Duration(minutes: 10),
    this.notifyThrottle = const Duration(seconds: 5),
  }) : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final Duration recentStepWindow;
  final Duration reminderCooldown;
  final Duration reminderDelay;
  final Duration idleLimit;
  final Duration capLimit;
  final Duration notifyThrottle;

  DateTime? lastStepAt;
  DateTime? leftAt;
  DateTime? lastNotifyAt;
  final _lastReminderByRun = <String, DateTime>{};

  bool inBackground = false;
  bool keepGoingActive = false;
  bool notificationsEnabled = true;
  int bgSteps = 0;
  int? startBattery;
  String? activeRunId;
  String? activeBotName;
  String? activeConversationId;
  String? activeSite;
  String? openedVia;

  void noteStep(String runId, {String? botName, String? conversationId, String? site}) {
    lastStepAt = _now();
    activeRunId = runId;
    if (botName != null && botName.isNotEmpty) activeBotName = botName;
    if (conversationId != null) activeConversationId = conversationId;
    if (site != null && site.isNotEmpty) activeSite = site;
    if (keepGoingActive) bgSteps += 1;
  }

  /// Whether a local reminder should be scheduled when leaving mid-task (plan §3):
  /// only if a bot step ran in the last 60s and no reminder was sent for this run in the last 2 min.
  bool shouldScheduleReminder(String runId) {
    final step = lastStepAt;
    if (step == null || _now().difference(step) > recentStepWindow) {
      return false;
    }
    final prev = _lastReminderByRun[runId];
    if (prev != null && _now().difference(prev) < reminderCooldown) {
      return false;
    }
    return true;
  }

  void markReminderScheduled(String runId) {
    _lastReminderByRun[runId] = _now();
  }

  bool shouldThrottleNotify() {
    final prev = lastNotifyAt;
    if (prev != null && _now().difference(prev) < notifyThrottle) return true;
    lastNotifyAt = _now();
    return false;
  }

  /// Records that the person left the app mid-task.
  void markLeft({
    required String platform,
    required bool keepGoing,
    required bool settingOn,
    required String runId,
    required String botName,
    String? conversationId,
    String? site,
  }) {
    inBackground = true;
    keepGoingActive = keepGoing;
    leftAt = _now();
    bgSteps = 0;
    startBattery = null;
    openedVia = null;
    activeRunId = runId;
    activeBotName = botName;
    activeConversationId = conversationId;
    activeSite = site;
    Analytics.log('app_browser_left_mid_task', {
      'platform': platform,
      'mode': keepGoing ? 'keep_going' : 'reminder',
      'setting_on': settingOn,
    });
  }

  void markReminderShown(String source) {
    Analytics.log('app_browser_reminder_shown', {'source': source});
  }

  void markReminderOpened(String source) {
    openedVia = source == 'local' ? 'reminder' : 'notification';
    final afterS = leftAt == null ? 0 : _now().difference(leftAt!).inSeconds;
    Analytics.log('app_browser_reminder_opened', {
      'source': source,
      'after_s': afterS,
    });
  }

  /// Returns an away summary if Android completed steps while the user was away.
  AppBrowserAwaySummary? markReturned() {
    if (!inBackground) return null;
    final afterS = leftAt == null ? 0 : _now().difference(leftAt!).inSeconds;
    final via = openedVia ?? 'on_own';
    Analytics.log('app_browser_returned', {'after_s': afterS, 'via': via});
    AppBrowserAwaySummary? summary;
    if (keepGoingActive &&
        bgSteps > 0 &&
        activeRunId != null &&
        activeConversationId != null &&
        activeBotName != null) {
      summary = AppBrowserAwaySummary(
        runId: activeRunId!,
        conversationId: activeConversationId!,
        botName: activeBotName!,
        steps: bgSteps,
      );
    }
    inBackground = false;
    keepGoingActive = false;
    leftAt = null;
    openedVia = null;
    bgSteps = 0;
    startBattery = null;
    return summary;
  }

  void markBackgroundDone({int? endBattery}) {
    final minutes = leftAt == null
        ? 0
        : double.parse((_now().difference(leftAt!).inSeconds / 60).toStringAsFixed(2));
    final drop = (startBattery != null && endBattery != null && startBattery! >= 0 && endBattery >= 0)
        ? (startBattery! - endBattery).clamp(0, 100)
        : 0;
    Analytics.log('app_browser_background_done', {
      'steps': bgSteps,
      'minutes': minutes,
      'battery_drop': drop,
    });
    keepGoingActive = false;
  }

  void markBackgroundStopped(String reason) {
    Analytics.log('app_browser_background_stopped', {'reason': reason});
    keepGoingActive = false;
  }

  /// Checks whether a previous process was killed by the OS while running in the background.
  static Future<void> checkUncleanExit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(kAppBrowserBgActivePref) == true) {
        await prefs.setBool(kAppBrowserBgActivePref, false);
        Analytics.log('app_browser_background_stopped', {'reason': 'os_killed'});
      }
    } catch (_) {}
  }

  static Future<void> setBgActiveMarker(bool active) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kAppBrowserBgActivePref, active);
    } catch (_) {}
  }
}
