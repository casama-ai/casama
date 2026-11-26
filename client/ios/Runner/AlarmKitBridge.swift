import Flutter
import Foundation
#if canImport(AlarmKit)
import AlarmKit
#endif

/// AlarmKit bridge (docs/APPLE-INTEGRATIONS-PLAN.md §7.1).
/// Lets bots set, list, and cancel real iOS 26+ alarms and timers that ring through silent mode
/// and Focus, gated by D-328 device access.
final class AlarmKitBridge {
  static let shared = AlarmKitBridge()
  static let channelName = "casama/alarm_kit"

  private var channel: FlutterMethodChannel?

  func attach(messenger: FlutterBinaryMessenger) {
    let ch = FlutterMethodChannel(name: Self.channelName, binaryMessenger: messenger)
    ch.setMethodCallHandler { [weak self] call, result in
      self?.handle(call, result: result)
    }
    channel = ch
  }

  private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isSupported":
      #if canImport(AlarmKit)
      if #available(iOS 26.0, *) {
        result(true)
        return
      }
      #endif
      result(false)
    case "requestPermission":
      #if canImport(AlarmKit)
      if #available(iOS 26.0, *) {
        Task {
          do {
            let state = try await AlarmManager.shared.requestAuthorization()
            result(state == .authorized)
          } catch {
            result(false)
          }
        }
        return
      }
      #endif
      result(false)
    case "set":
      setAlarm(args: call.arguments as? [String: Any] ?? [:], result: result)
    case "list":
      listAlarms(result: result)
    case "cancel":
      cancelAlarm(args: call.arguments as? [String: Any] ?? [:], result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func setAlarm(args: [String: Any], result: @escaping FlutterResult) {
    #if canImport(AlarmKit)
    if #available(iOS 26.0, *) {
      Task {
        do {
          let state = try await AlarmManager.shared.requestAuthorization()
          guard state == .authorized else {
            result(FlutterError(code: "denied", message: "Alarm permission not granted", details: nil))
            return
          }
          let id = UUID()
          let label = (args["label"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines)
          let title = (label?.isEmpty == false ? label! : "Casama Alarm")
          let alert: AlarmPresentation.Alert
          if #available(iOS 26.1, *) {
            alert = AlarmPresentation.Alert(title: LocalizedStringResource(stringLiteral: title))
          } else {
            alert = AlarmPresentation.Alert(
              title: LocalizedStringResource(stringLiteral: title),
              stopButton: AlarmButton(text: "Stop", textColor: .white, systemImageName: "stop.circle")
            )
          }
          let presentation = AlarmPresentation(alert: alert)
          let attributes = AlarmAttributes<EmptyAlarmMetadata>(
            presentation: presentation,
            tintColor: .purple
          )
          if let duration = args["duration_seconds"] as? Int, duration > 0 {
            let config = AlarmManager.AlarmConfiguration.timer(
              duration: TimeInterval(duration),
              attributes: attributes
            )
            _ = try await AlarmManager.shared.schedule(id: id, configuration: config)
            result(["ok": true, "alarm_id": id.uuidString, "kind": "timer", "duration_seconds": duration])
          } else if let atStr = args["at"] as? String,
                    let date = ISO8601DateFormatter().date(from: atStr)
          {
            let schedule = Alarm.Schedule.fixed(date)
            let config = AlarmManager.AlarmConfiguration.alarm(
              schedule: schedule,
              attributes: attributes
            )
            _ = try await AlarmManager.shared.schedule(id: id, configuration: config)
            result(["ok": true, "alarm_id": id.uuidString, "kind": "alarm", "at": atStr])
          } else {
            result(FlutterError(code: "bad_args", message: "Provide either 'at' or 'duration_seconds'", details: nil))
          }
        } catch {
          result(FlutterError(code: "alarm_failed", message: error.localizedDescription, details: nil))
        }
      }
      return
    }
    #endif
    result(FlutterError(code: "unsupported", message: "AlarmKit requires iOS 26 or later", details: nil))
  }

  private func listAlarms(result: @escaping FlutterResult) {
    #if canImport(AlarmKit)
    if #available(iOS 26.0, *) {
      do {
        let alarms = try AlarmManager.shared.alarms
        let items: [[String: Any]] = alarms.map { alarm in
          [
            "alarm_id": alarm.id.uuidString,
            "state": "\(alarm.state)",
          ]
        }
        result(["alarms": items])
      } catch {
        result(FlutterError(code: "alarm_failed", message: error.localizedDescription, details: nil))
      }
      return
    }
    #endif
    result(["alarms": []])
  }

  private func cancelAlarm(args: [String: Any], result: @escaping FlutterResult) {
    #if canImport(AlarmKit)
    if #available(iOS 26.0, *) {
      guard let idStr = args["alarm_id"] as? String, let uuid = UUID(uuidString: idStr) else {
        result(FlutterError(code: "bad_args", message: "Valid alarm_id is required", details: nil))
        return
      }
      do {
        try AlarmManager.shared.cancel(id: uuid)
        result(["ok": true, "alarm_id": idStr])
      } catch {
        result(FlutterError(code: "alarm_failed", message: error.localizedDescription, details: nil))
      }
      return
    }
    #endif
    result(FlutterError(code: "unsupported", message: "AlarmKit requires iOS 26 or later", details: nil))
  }
}

#if canImport(AlarmKit)
@available(iOS 26.0, *)
struct EmptyAlarmMetadata: AlarmMetadata {}
#endif
