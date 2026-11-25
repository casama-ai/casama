import AppIntents
import Cocoa
import FlutterMacOS
import StoreKit
import app_links

@main
class AppDelegate: FlutterAppDelegate {
  // Closing the window keeps Casama running in the menu bar and the notch (D-324, decision 2);
  // Cmd+Q quits.
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }

  // Clicking the Dock icon brings the window back.
  override func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    if !flag { IslandController.shared.showMainWindow() }
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  // casama.ai links the App Store build opens (applinks:casama.ai, D-326). app_links catches
  // casama:// links itself but leaves universal links to the app delegate.
  override func application(
    _ application: NSApplication,
    continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([any NSUserActivityRestoring]) -> Void
  ) -> Bool {
    guard let url = AppLinks.shared.getUniversalLink(userActivity) else { return false }
    AppLinks.shared.handleLink(link: url.absoluteString)
    return true
  }
}

// MARK: - Shortcuts (D-111): a path handed to Flutter over the casama/shortcuts channel, queued until
// Flutter is ready. The intents, entities and phrases for Siri, Spotlight and Shortcuts live in
// client/ios/Siri/ (docs/SIRI-AI-PLAN.md), compiled into the iPhone and the Mac app.

final class ShortcutBridge {
  static let shared = ShortcutBridge()
  private var channel: FlutterMethodChannel?
  private var pending: String?

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/shortcuts", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      if call.method == "ready" {
        result(self?.pending)
        self?.pending = nil
      } else if call.method == "isTestInstall" {
        // TestFlight and development builds carry a sandbox transaction/receipt (D-532, D-533):
        // analytics leave GA4 off there so sandbox renewals never show as real revenue.
        let receiptSandbox = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
        if receiptSandbox {
          result(true)
        } else if #available(macOS 13.0, *) {
          Task {
            let envSandbox: Bool
            if let shared = try? await AppTransaction.shared {
              switch shared {
              case .verified(let tx), .unverified(let tx, _):
                envSandbox = tx.environment == .sandbox
              }
            } else {
              envSandbox = false
            }
            await MainActor.run { result(envSandbox) }
          }
        } else {
          result(false)
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  func open(_ path: String) {
    if let channel = channel {
      channel.invokeMethod("open", arguments: path)
    } else {
      pending = path
    }
  }
}

