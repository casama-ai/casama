import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#endif
#if canImport(FoundationModels)
import FoundationModels
#endif

/// Apple Foundation Models on-device bridge (docs/APPLE-INTEGRATIONS-PLAN.md §7.3, §12.4).
/// Shared between iOS 26+ and macOS 26+. Runs chat title generation on-device when
/// `SystemLanguageModel.default.availability` is `.available`; falls back silently otherwise.
final class OnDeviceModelBridge {
  static let shared = OnDeviceModelBridge()
  static let channelName = "casama/on_device_model"

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
    case "isAvailable":
      result(Self.checkAvailability())
    case "generateTitle":
      let args = call.arguments as? [String: Any]
      let prompt = (args?["message"] as? String) ?? ""
      generateTitle(message: prompt, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private static func checkAvailability() -> Bool {
    #if canImport(FoundationModels)
    if #available(iOS 26.0, macOS 26.0, *) {
      if case .available = SystemLanguageModel.default.availability {
        return true
      }
    }
    #endif
    return false
  }

  private func generateTitle(message: String, result: @escaping FlutterResult) {
    let trimmed = message.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else {
      result(nil)
      return
    }
    #if canImport(FoundationModels)
    if #available(iOS 26.0, macOS 26.0, *) {
      guard case .available = SystemLanguageModel.default.availability else {
        result(nil)
        return
      }
      Task {
        do {
          let session = LanguageModelSession(
            instructions: "Write a short, plain 3-to-6 word title for this chat message. Return only the title with no quotes or trailing punctuation."
          )
          let response = try await session.respond(to: String(trimmed.prefix(500)))
          let clean = response.content
            .replacingOccurrences(of: "\"", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
          let capped = String(clean.prefix(60))
          await MainActor.run {
            result(capped.isEmpty ? nil : capped)
          }
        } catch {
          await MainActor.run { result(nil) }
        }
      }
      return
    }
    #endif
    result(nil)
  }
}
