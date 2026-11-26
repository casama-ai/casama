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

  // After Siri or Shortcuts runs one of our intents (docs/SIRI-AI-PLAN.md), the App Intents daemon
  // (linkd) sends a Quit Apple Event once its idle grace period ends, as if it had launched us for
  // that one intent. Casama lives in the menu bar and the notch, so it stays; every other quit
  // (Cmd+Q, the Dock, logging out) goes through Flutter's own handler as before.
  override func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
    if Self.quitSentByAppIntents() { return .terminateCancel }
    return super.applicationShouldTerminate(sender)
  }

  private static func quitSentByAppIntents() -> Bool {
    guard let event = NSAppleEventManager.shared().currentAppleEvent,
          event.eventClass == AEEventClass(kCoreEventClass), event.eventID == AEEventID(kAEQuitApplication),
          let pid = event.attributeDescriptor(forKeyword: AEKeyword(keySenderPIDAttr))?.int32Value,
          pid > 0 else { return false }
    var name = [CChar](repeating: 0, count: 256)
    guard proc_name(pid, &name, UInt32(name.count)) > 0 else { return false }
    return String(cString: name) == "linkd"
  }

  // Mac Services menu (docs/APPLE-INTEGRATIONS-PLAN.md §6.6): select text anywhere → Ask Casama.
  // FlutterAppDelegate on macOS does not implement applicationDidFinishLaunching(_:), so do not
  // call super here (calling super throws an unrecognized selector exception at launch).
  override func applicationDidFinishLaunching(_ notification: Notification) {
    NSApp.servicesProvider = self
  }

  @objc func askCasama(
    _ pboard: NSPasteboard,
    userData: String,
    error: AutoreleasingUnsafeMutablePointer<NSString>
  ) {
    guard let text = pboard.string(forType: .string)?.trimmingCharacters(in: .whitespacesAndNewlines),
          !text.isEmpty
    else { return }
    let encoded = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    IslandController.shared.showMainWindow()
    ShortcutBridge.shared.open("/quick-ask?text=\(encoded)")
  }

  // A share from the Share or Finder Quick Action extension (casama://app/quick-ask?shared=1)
  // brings the window back, which closing it hid, so its quick ask shows. app_links still gets every
  // link: with this override it catches them itself and passes them on here.
  override func application(_ application: NSApplication, open urls: [URL]) {
    if urls.contains(where: { $0.scheme == "casama" && $0.host == "app" && $0.path == "/quick-ask" }) {
      IslandController.shared.showMainWindow()
    }
    super.application(application, open: urls)
  }

  // casama.ai links the App Store build opens (applinks:casama.ai, D-326). app_links catches
  // casama:// links itself but leaves universal links to the app delegate.
  override func application(
    _ application: NSApplication,
    continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([any NSUserActivityRestoring]) -> Void
  ) -> Bool {
    // Handoff from iPhone/iPad (docs/APPLE-INTEGRATIONS-PLAN.md §6.10).
    if userActivity.activityType == "ai.casama.app.viewing",
       let info = userActivity.userInfo,
       let kind = info["kind"] as? String,
       let id = info["id"] as? String
    {
      let botId = (info["bot_id"] as? String) ?? (kind == "bot" ? id : "")
      let path = kind == "chat" && !botId.isEmpty
        ? "/bots/\(botId)/chat?c=\(id)"
        : (!botId.isEmpty ? "/bots/\(botId)/chat" : "/bots")
      IslandController.shared.showMainWindow()
      ShortcutBridge.shared.open(path)
      return true
    }
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
    // Siri, Spotlight and Shortcuts open a place in the app (docs/SIRI-AI-PLAN.md): with the window
    // closed to the menu bar the route changed out of sight, so bring the window forward too.
    DispatchQueue.main.async { IslandController.shared.showMainWindow() }
    if let channel = channel {
      channel.invokeMethod("open", arguments: path)
    } else {
      pending = path
    }
  }
}

