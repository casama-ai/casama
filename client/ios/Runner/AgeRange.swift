import Flutter
import UIKit
#if canImport(DeclaredAgeRange)
import DeclaredAgeRange
#endif

/// Declared Age Range bridge (docs/APPLE-INTEGRATIONS-PLAN.md §5.2).
/// Asks iOS 26+'s AgeRangeService for the account's age band (never a birth date) and returns
/// one of: "under13", "13to15", "16to17", "18plus", "declined", or "unavailable".
final class AgeRangeBridge {
  static let shared = AgeRangeBridge()
  static let channelName = "casama/age_range"

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
      #if canImport(DeclaredAgeRange)
      if #available(iOS 26.0, *) {
        result(true)
        return
      }
      #endif
      result(false)
    case "requestAgeRange":
      requestAgeRange(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func requestAgeRange(result: @escaping FlutterResult) {
    #if canImport(DeclaredAgeRange)
    if #available(iOS 26.0, *) {
      Task { @MainActor in
        guard let vc = topViewController() else {
          result(["band": "unavailable"])
          return
        }
        do {
          let response = try await AgeRangeService.shared.requestAgeRange(
            ageGates: 13, 16, 18,
            in: vc
          )
          switch response {
          case .declinedSharing:
            result(["band": "declined"])
          case .sharing(let range):
            let band: String
            let lower = range.lowerBound ?? 0
            let upper = range.upperBound
            if let upper = upper, upper < 13 {
              band = "under13"
            } else if lower >= 18 {
              band = "18plus"
            } else if lower >= 16 {
              band = "16to17"
            } else if lower >= 13 {
              band = "13to15"
            } else {
              band = "under13"
            }
            result(["band": band])
          @unknown default:
            result(["band": "declined"])
          }
        } catch {
          result(["band": "unavailable", "error": error.localizedDescription])
        }
      }
      return
    }
    #endif
    result(["band": "unavailable"])
  }

  @MainActor
  private func topViewController() -> UIViewController? {
    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    let root = scenes.first(where: { $0.activationState == .foregroundActive })?.keyWindow?.rootViewController
      ?? scenes.first?.keyWindow?.rootViewController
    var current = root
    while let presented = current?.presentedViewController {
      current = presented
    }
    return current
  }
}
