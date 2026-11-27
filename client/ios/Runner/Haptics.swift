import AVFoundation
import CoreHaptics
import Flutter
import UIKit

// MARK: - Haptics bridge (`casama/haptics`, docs/HAPTICS-PLAN.md §4, §7.2)
//
// Thirteen platform haptics through UIKit's feedback generators, and four Casama signature patterns
// (`attention`, `arrive`, `done`, `celebrate`) through Core Haptics (`CHHapticEngine`), started
// lazily, stopped in the background, and restarted after a reset. Devices without Core Haptics
// (every iPad) fall back to the system generators or stay silent.

final class HapticsBridge {
  static let shared = HapticsBridge()

  private var channel: FlutterMethodChannel?
  private var engine: CHHapticEngine?
  private var engineRunning = false
  private var observingLifecycle = false

  private let lightImpact = UIImpactFeedbackGenerator(style: .light)
  private let mediumImpact = UIImpactFeedbackGenerator(style: .medium)
  private let heavyImpact = UIImpactFeedbackGenerator(style: .heavy)
  private let softImpact = UIImpactFeedbackGenerator(style: .soft)
  private let rigidImpact = UIImpactFeedbackGenerator(style: .rigid)
  private let selectionGenerator = UISelectionFeedbackGenerator()
  private let notificationGenerator = UINotificationFeedbackGenerator()

  private var supportsCoreHaptics: Bool {
    CHHapticEngine.capabilitiesForHardware().supportsHaptics
  }

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/haptics", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      guard let self else {
        result(nil)
        return
      }
      switch call.method {
      case "play":
        let args = call.arguments as? [String: Any] ?? [:]
        guard let kind = args["kind"] as? String else {
          result(FlutterMethodNotImplemented)
          return
        }
        self.play(kind: kind, args: args)
        result(nil)
      case "prepare":
        let args = call.arguments as? [String: Any] ?? [:]
        self.prepare(kind: args["kind"] as? String ?? "tap")
        result(nil)
      case "allowDuringRecording":
        try? AVAudioSession.sharedInstance().setAllowHapticsAndSystemSoundsDuringRecording(true)
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
    observeLifecycleIfNeeded()
  }

  private func observeLifecycleIfNeeded() {
    guard !observingLifecycle else { return }
    observingLifecycle = true
    NotificationCenter.default.addObserver(
      forName: UIApplication.didEnterBackgroundNotification,
      object: nil,
      queue: .main
    ) { [weak self] _ in
      self?.stopEngine()
    }
  }

  private func prepare(kind: String) {
    switch kind {
    case "tap", "toggleOn":
      lightImpact.prepare()
    case "press", "lift":
      mediumImpact.prepare()
    case "select":
      selectionGenerator.prepare()
    case "toggleOff", "thresholdBack", "drop":
      softImpact.prepare()
    case "threshold", "snap":
      rigidImpact.prepare()
    case "confirm", "reject", "warn":
      notificationGenerator.prepare()
    case "destroy":
      heavyImpact.prepare()
    default:
      break
    }
  }

  private func play(kind: String, args: [String: Any]) {
    switch kind {
    case "tap":
      lightImpact.impactOccurred()
    case "press":
      mediumImpact.impactOccurred()
    case "select":
      selectionGenerator.selectionChanged()
    case "toggleOn":
      lightImpact.impactOccurred(intensity: 0.85)
    case "toggleOff":
      softImpact.impactOccurred(intensity: 0.7)
    case "threshold":
      rigidImpact.impactOccurred()
    case "thresholdBack":
      softImpact.impactOccurred(intensity: 0.65)
    case "lift":
      mediumImpact.impactOccurred(intensity: 0.85)
    case "drop":
      softImpact.impactOccurred(intensity: 0.85)
    case "snap":
      rigidImpact.impactOccurred(intensity: 0.6)
    case "confirm":
      notificationGenerator.notificationOccurred(.success)
    case "reject":
      notificationGenerator.notificationOccurred(.error)
    case "warn":
      notificationGenerator.notificationOccurred(.warning)
    case "destroy":
      heavyImpact.impactOccurred()
    case "attention":
      playAttention(args: args)
    case "arrive":
      playArrive(args: args)
    case "done":
      playDone(args: args)
    case "celebrate":
      playCelebrate(args: args)
    default:
      break
    }
  }

  // MARK: - Core Haptics Signatures (§4)

  /// Two even taps, like the watch's `needsYou`.
  private func playAttention(args: [String: Any]) {
    let intensity = Float(args["attentionIntensity"] as? Double ?? 0.8)
    let gap = (args["attentionGapMs"] as? Double ?? 90.0) / 1000.0
    let events = [
      transient(at: 0, intensity: intensity, sharpness: 0.65),
      transient(at: gap, intensity: intensity, sharpness: 0.65),
    ]
    if !playPattern(events) {
      notificationGenerator.notificationOccurred(.warning)
    }
  }

  /// One soft, low pop when the first words of a reply you waited for show.
  private func playArrive(args: [String: Any]) {
    let intensity = Float(args["arriveIntensity"] as? Double ?? 0.7)
    let sharpness = Float(args["arriveSharpness"] as? Double ?? 0.25)
    let events = [
      transient(at: 0, intensity: intensity, sharpness: sharpness),
    ]
    if !playPattern(events) {
      softImpact.impactOccurred(intensity: CGFloat(intensity))
    }
  }

  /// Soft-then-strong rising pair, like the watch's `done`.
  private func playDone(args: [String: Any]) {
    let first = Float(args["doneFirstIntensity"] as? Double ?? 0.5)
    let second = Float(args["doneSecondIntensity"] as? Double ?? 1.0)
    let gap = (args["doneGapMs"] as? Double ?? 60.0) / 1000.0
    let events = [
      transient(at: 0, intensity: first, sharpness: 0.4),
      transient(at: gap, intensity: second, sharpness: 0.75),
    ]
    if !playPattern(events) {
      notificationGenerator.notificationOccurred(.success)
    }
  }

  /// Three rising taps and a short fade for rare milestones.
  private func playCelebrate(args: [String: Any]) {
    let peak = Float(args["celebrateIntensity"] as? Double ?? 0.9)
    let gap = (args["celebrateGapMs"] as? Double ?? 55.0) / 1000.0
    let events = [
      transient(at: 0, intensity: max(0.3, peak * 0.5), sharpness: 0.35),
      transient(at: gap, intensity: max(0.45, peak * 0.75), sharpness: 0.55),
      transient(at: gap * 2, intensity: peak, sharpness: 0.8),
      continuous(at: gap * 2 + 0.02, duration: 0.12, intensity: max(0.2, peak * 0.35), sharpness: 0.25),
    ]
    if !playPattern(events) {
      notificationGenerator.notificationOccurred(.success)
    }
  }

  private func transient(at time: TimeInterval, intensity: Float, sharpness: Float) -> CHHapticEvent {
    CHHapticEvent(
      eventType: .hapticTransient,
      parameters: [
        CHHapticEventParameter(parameterID: .hapticIntensity, value: min(1, max(0, intensity))),
        CHHapticEventParameter(parameterID: .hapticSharpness, value: min(1, max(0, sharpness))),
      ],
      relativeTime: max(0, time)
    )
  }

  private func continuous(
    at time: TimeInterval,
    duration: TimeInterval,
    intensity: Float,
    sharpness: Float
  ) -> CHHapticEvent {
    CHHapticEvent(
      eventType: .hapticContinuous,
      parameters: [
        CHHapticEventParameter(parameterID: .hapticIntensity, value: min(1, max(0, intensity))),
        CHHapticEventParameter(parameterID: .hapticSharpness, value: min(1, max(0, sharpness))),
      ],
      relativeTime: max(0, time),
      duration: duration
    )
  }

  private func playPattern(_ events: [CHHapticEvent]) -> Bool {
    guard supportsCoreHaptics else { return false }
    guard let engine = ensureEngine() else { return false }
    do {
      let pattern = try CHHapticPattern(events: events, parameters: [])
      let player = try engine.makePlayer(with: pattern)
      try player.start(atTime: CHHapticTimeImmediate)
      return true
    } catch {
      return false
    }
  }

  private func ensureEngine() -> CHHapticEngine? {
    if let engine, engineRunning {
      return engine
    }
    do {
      if engine == nil {
        let created = try CHHapticEngine()
        created.playsHapticsOnly = true
        created.isAutoShutdownEnabled = true
        created.stoppedHandler = { [weak self] _ in
          self?.engineRunning = false
        }
        created.resetHandler = { [weak self] in
          guard let self, let engine = self.engine else { return }
          do {
            try engine.start()
            self.engineRunning = true
          } catch {
            self.engineRunning = false
          }
        }
        engine = created
      }
      try engine?.start()
      engineRunning = true
      return engine
    } catch {
      engineRunning = false
      return nil
    }
  }

  private func stopEngine() {
    guard engineRunning else { return }
    engine?.stop(completionHandler: nil)
    engineRunning = false
  }
}
