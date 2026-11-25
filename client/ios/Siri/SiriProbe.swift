import AppIntents
import Darwin
import Foundation

// MARK: - Phase 0: proof on a device (docs/SIRI-AI-PLAN.md §11)
//
// Measures the one path everything rests on: (a) whether Dart comes up when Siri starts the app
// in the background, and how long it takes; (b) how long Siri waits for an intent. The log is
// kept in every build (a few lines, no words from a chat); the probe intents exist only in debug
// and profile builds (`CASAMA_PROBE`, set on the Profile configuration: a debug build on a real
// iPhone can't start without Xcode, so Siri can't start it), never in a release build.

enum SiriProbeLog {
  private static let key = "casama.siri.probe"
  private static let launchedAt = Date()

  /// Seconds since this process started (sysctl's start time, so a background launch counts from
  /// the moment iOS started the app, not from when this code first ran).
  static func processAge() -> String {
    var info = kinfo_proc()
    var size = MemoryLayout<kinfo_proc>.stride
    var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
    let started: Date
    if sysctl(&mib, u_int(mib.count), &info, &size, nil, 0) == 0 {
      let t = info.kp_proc.p_starttime
      started = Date(timeIntervalSince1970: TimeInterval(t.tv_sec) + TimeInterval(t.tv_usec) / 1_000_000)
    } else {
      started = launchedAt
    }
    return String(format: "%.2f", Date().timeIntervalSince(started))
  }

  static func add(_ line: String) {
    let stamp = ISO8601DateFormatter().string(from: Date())
    var lines = UserDefaults.standard.stringArray(forKey: key) ?? []
    lines.append("\(stamp) \(line)")
    UserDefaults.standard.set(Array(lines.suffix(80)), forKey: key)
    NSLog("[casama.siri] %@", line)
  }

  static func read() -> [String] { UserDefaults.standard.stringArray(forKey: key) ?? [] }
  static func clear() { UserDefaults.standard.removeObject(forKey: key) }
}

#if DEBUG || CASAMA_PROBE
/// (a) Does Dart come up in a background start, and when? Run from Siri or Shortcuts with the app
/// closed (swiped away).
@available(iOS 16.0, macOS 13.0, *)
struct ProbeDartIntent: AppIntent {
  static var title: LocalizedStringResource = "Casama probe: Dart"
  static var description = IntentDescription("Debug builds only: times how long Dart takes to answer.")
  static var openAppWhenRun = false

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    let age = SiriProbeLog.processAge()
    let wasReady = SiriBridge.shared.ready
    let start = Date()
    SiriProbeLog.add("probe dart: start, process age \(age) s, dart ready already: \(wasReady)")
    let answer = await SiriBridge.shared.call("ping")
    let took = String(format: "%.2f", Date().timeIntervalSince(start))
    let line = answer == nil
      ? "Dart did not answer within \(Int(SiriBridge.readyTimeout)) s. Process age \(age) s."
      : "Dart answered after \(took) s. Process age at start \(age) s, ready before: \(wasReady)."
    SiriProbeLog.add("probe dart: \(line)")
    return .result(dialog: IntentDialog(stringLiteral: line))
  }
}

/// (b) How long does Siri wait? Waits [seconds], logging the start and the end: a run Siri gave up
/// on logs a start without an end (or an end after Siri said it failed).
@available(iOS 16.0, macOS 13.0, *)
struct ProbeWaitIntent: AppIntent {
  static var title: LocalizedStringResource = "Casama probe: wait"
  static var description = IntentDescription("Debug builds only: waits a set number of seconds, then answers.")
  static var openAppWhenRun = false

  @Parameter(title: "Seconds", default: 10, inclusiveRange: (1, 120))
  var seconds: Int

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    SiriProbeLog.add("probe wait \(seconds) s: start, process age \(SiriProbeLog.processAge()) s")
    try? await Task.sleep(nanoseconds: UInt64(seconds) * 1_000_000_000)
    SiriProbeLog.add("probe wait \(seconds) s: done")
    return .result(dialog: "Waited \(seconds) seconds.")
  }
}

/// Reads the probe log back (and clears it with "clear" on).
@available(iOS 16.0, macOS 13.0, *)
struct ProbeLogIntent: AppIntent {
  static var title: LocalizedStringResource = "Casama probe: log"
  static var description = IntentDescription("Debug builds only: shows the Siri timing log.")
  static var openAppWhenRun = false

  @Parameter(title: "Clear after reading", default: false)
  var clear: Bool

  @MainActor
  func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog {
    let text = SiriProbeLog.read().suffix(30).joined(separator: "\n")
    if clear { SiriProbeLog.clear() }
    return .result(value: text, dialog: IntentDialog(stringLiteral: text.isEmpty ? "The log is empty." : text))
  }
}
#endif
