import FileProvider
import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#endif

/// File Provider bridge (docs/APPLE-INTEGRATIONS-PLAN.md §8).
/// Stores the read-only `cfk_` key and API base URL in the shared Keychain / App Group and
/// registers or removes the `NSFileProviderDomain` ("Casama Computers") in Files / Finder.
final class FileProviderBridge {
  static let shared = FileProviderBridge()
  static let channelName = "casama/file_provider"
  static let domainId = NSFileProviderDomainIdentifier(rawValue: "ai.casama.computers")

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
      if #available(iOS 16.0, macOS 13.0, *) {
        result(true)
      } else {
        result(false)
      }
    case "setKey":
      guard let args = call.arguments as? [String: Any],
            let key = args["key"] as? String,
            let apiUrl = args["api_url"] as? String,
            let orgId = args["org_id"] as? String
      else {
        result(FlutterError(code: "bad_args", message: "key, api_url and org_id are required", details: nil))
        return
      }
      guard FileProviderKeyStore.save(key: key, apiUrl: apiUrl, orgId: orgId) else {
        // This build's signing doesn't grant the keychain group the extension reads from.
        result(FlutterError(code: "keychain_failed", message: "The keychain didn't take the file key", details: nil))
        return
      }
      registerDomain(result: result)
    case "clearKey":
      FileProviderKeyStore.clear()
      removeDomain(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func registerDomain(result: @escaping FlutterResult) {
    if #available(iOS 16.0, macOS 13.0, *) {
      let domain = NSFileProviderDomain(identifier: Self.domainId, displayName: NativeL10n.nativeNameFileProvider)
      NSFileProviderManager.add(domain) { error in
        if let error = error {
          result(FlutterError(code: "domain_add_failed", message: error.localizedDescription, details: nil))
        } else {
          result(true)
        }
      }
    } else {
      result(false)
    }
  }

  private func removeDomain(result: @escaping FlutterResult) {
    if #available(iOS 16.0, macOS 13.0, *) {
      let domain = NSFileProviderDomain(identifier: Self.domainId, displayName: NativeL10n.nativeNameFileProvider)
      NSFileProviderManager.remove(domain) { _ in
        result(true)
      }
    } else {
      result(true)
    }
  }
}
