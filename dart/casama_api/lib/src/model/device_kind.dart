//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
enum DeviceKind {
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'calendar')
      calendar(r'calendar'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'reminders')
      reminders(r'reminders'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'contacts')
      contacts(r'contacts'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'places')
      places(r'places'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'photos')
      photos(r'photos'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'health')
      health(r'health'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'notifications')
      notifications(r'notifications'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'activity')
      activity(r'activity'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'browser_tab')
      browserTab(r'browser_tab'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'browser_history')
      browserHistory(r'browser_history'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'alarm')
      alarm(r'alarm'),
          /// browser_tab and browser_history come from Casama for Chrome (platform web, D-323) and are live only: never stored. alarm (AlarmKit) and home (HomeKit) are live actions on Apple devices (docs/APPLE-INTEGRATIONS-PLAN.md).
      @JsonValue(r'home')
      home(r'home');

  const DeviceKind(this.value);

  final String value;

  @override
  String toString() => value;
}
