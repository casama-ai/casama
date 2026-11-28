import ApplicationServices
import AuthenticationServices
import AVFoundation
import Cocoa
import FlutterMacOS
import ServiceManagement
import Speech
import UserNotifications
import WidgetKit
#if CASAMA_APP_BROWSER
import WebKit
#endif

/// Keeps Flutter's accessibility tree on for the life of the app, so Accessibility clients that
/// aren't VoiceOver (System Events, Accessibility Inspector, Voice Control, test tools) see the
/// app's buttons and text instead of only the window's title-bar buttons.
///
/// The macOS embedder turns semantics on only when VoiceOver posts its private "enhanced user
/// interface" notification; until then it has no accessibility bridge and drops every semantics
/// update. The switch (`FlutterEngine.semanticsEnabled`) isn't in the public header, so it's set
/// through key-value coding, and only once the engine runs (it starts in `viewWillAppear`): set
/// earlier, the engine would never tell Dart. Dart must not hold its own semantics handle (see
/// `main.dart`): the framework would send its tree before the bridge exists and never again.
class CasamaFlutterViewController: FlutterViewController {
  private static let semanticsKey = "semanticsEnabled"
  private static let voiceOverNotification = Notification.Name(
    "NSApplicationDidChangeAccessibilityEnhancedUserInterfaceNotification")
  private var voiceOverObserver: NSObjectProtocol?

  override func viewWillAppear() {
    super.viewWillAppear()
    keepAccessibilityTreeOn()
    if voiceOverObserver == nil {
      // VoiceOver turning off turns semantics off in the engine; turn it back on right after.
      voiceOverObserver = NotificationCenter.default.addObserver(
        forName: Self.voiceOverNotification, object: nil, queue: .main
      ) { [weak self] _ in
        DispatchQueue.main.async { self?.keepAccessibilityTreeOn() }
      }
    }
  }

  deinit {
    if let voiceOverObserver { NotificationCenter.default.removeObserver(voiceOverObserver) }
  }

  private func keepAccessibilityTreeOn() {
    let engine = self.engine
    guard engine.responds(to: NSSelectorFromString("setSemanticsEnabled:")),
      (engine.value(forKey: Self.semanticsKey) as? Bool) == false
    else { return }
    engine.setValue(true, forKey: Self.semanticsKey)
  }
}

class MainFlutterWindow: NSWindow {
  private static let frameName = "CasamaMainWindow"

  override func awakeFromNib() {
    let flutterViewController = CasamaFlutterViewController()
    var windowFrame = self.frame
    // First launch: sized for the sidebar, chat and computer panel on this screen's usable area
    // (menu bar and dock excluded), centered. After that macOS restores where it was left, and
    // keeps it on a screen that's still connected.
    self.minSize = NSSize(width: 420, height: 560)
    if let area = NSScreen.main?.visibleFrame, !self.setFrameUsingName(Self.frameName) {
      let width = min(min(max(area.width - 80, 960), 1440), area.width)
      let height = min(min(max(area.height - 60, 640), 960), area.height)
      windowFrame = NSRect(x: area.midX - width / 2, y: area.midY - height / 2, width: width, height: height)
    } else if self.setFrameUsingName(Self.frameName) {
      windowFrame = self.frame
    }
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    self.setFrameAutosaveName(Self.frameName)

    RegisterGeneratedPlugins(registry: flutterViewController)
    ShortcutBridge.shared.attach(flutterViewController.engine.binaryMessenger)
    if #available(macOS 14.0, *) {
      MainActor.assumeIsolated { WidgetOpen.open = { ShortcutBridge.shared.open($0) } }
    }
    SiriBridge.shared.attach(flutterViewController.engine.binaryMessenger)
    MacBridge.shared.attach(flutterViewController.engine.binaryMessenger)
    WebAuthBridge.shared.attach(flutterViewController.engine.binaryMessenger)
    IslandController.shared.attach(flutterViewController.engine.binaryMessenger)
    NotificationsBridge.shared.attach(flutterViewController.engine.binaryMessenger)
    PermissionsBridge.shared.attach(flutterViewController.engine.binaryMessenger)
    SpeechAnalyzerBridge.shared.attach(messenger: flutterViewController.engine.binaryMessenger)
    OnDeviceModelBridge.shared.attach(messenger: flutterViewController.engine.binaryMessenger)
    FileProviderBridge.shared.attach(messenger: flutterViewController.engine.binaryMessenger)
    #if CASAMA_APP_BROWSER
    AppBrowser.shared.attach(flutterViewController, window: self)
    #endif

    super.awakeFromNib()
  }

  // The close button and Cmd+W hide the window instead of closing it, so the Flutter engine, the
  // live connection and the desktop companion keep running (D-324). The Dock icon, the menu bar
  // and the notch bring it back; Cmd+Q quits.
  override func performClose(_ sender: Any?) {
    #if CASAMA_APP_BROWSER
    AppBrowser.shared.windowHidden()
    #endif
    orderOut(sender)
  }

  #if CASAMA_APP_BROWSER
  /// Stops the side-panel web view from taking AppKit's keyboard unless the person clicked into it
  /// (or already has focus inside it). Overriding `becomeFirstResponder()` on the web view alone is
  /// too late: `NSWindow.makeFirstResponder` asks `FlutterView` to resign first, and when the web
  /// view then returns `false`, `NSWindow` makes itself first responder and leaves Flutter's
  /// message box disconnected from the keyboard (D-549 G1/G2).
  override func makeFirstResponder(_ responder: NSResponder?) -> Bool {
    if let view = responder as? NSView {
      var cur: NSView? = view
      while let v = cur {
        if let wv = v as? CasamaMacWebView {
          if !wv.allowsFocus(in: self) { return false }
          break
        }
        cur = v.superview
      }
    }
    return super.makeFirstResponder(responder)
  }
  #endif
}

// MARK: - casama/notifications (D-325): Approve / Deny on approval notifications, and clearing a
// chat's delivered notifications (aps.thread-id = the conversation) once it's open. The dock badge
// stays on casama/mac.

final class NotificationsBridge: NSObject, UNUserNotificationCenterDelegate {
  static let shared = NotificationsBridge()
  private var channel: FlutterMethodChannel?
  private var pendingReplies: [[String: String]] = []
  private weak var previousDelegate: UNUserNotificationCenterDelegate?

  func attach(_ messenger: FlutterBinaryMessenger) {
    let center = UNUserNotificationCenter.current()
    if center.delegate !== self {
      previousDelegate = center.delegate
      center.delegate = self
    }
    center.getNotificationCategories { existing in
      var categories = existing.filter { $0.identifier != "APPROVAL" && $0.identifier != "REPLY" }
      categories.insert(
        UNNotificationCategory(
          identifier: "APPROVAL",
          actions: [
            UNNotificationAction(identifier: "approve", title: NativeL10n.notifApprove, options: [.foreground, .authenticationRequired]),
            UNNotificationAction(identifier: "deny", title: NativeL10n.notifDeny, options: [.foreground, .authenticationRequired, .destructive]),
          ],
          intentIdentifiers: [],
          options: []))
      categories.insert(
        UNNotificationCategory(
          identifier: "REPLY",
          actions: [
            UNTextInputNotificationAction(
              identifier: "reply",
              title: NativeL10n.notifReply,
              options: [],
              textInputButtonTitle: NativeL10n.notifSend,
              textInputPlaceholder: NativeL10n.notifReplyPlaceholder
            ),
          ],
          intentIdentifiers: [],
          options: []))
      center.setNotificationCategories(categories)
    }
    let channel = FlutterMethodChannel(name: "casama/notifications", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      let args = call.arguments as? [String: Any] ?? [:]
      switch call.method {
      case "clear":
        guard let conversation = args["conversation_id"] as? String, !conversation.isEmpty else { return result(nil) }
        center.getDeliveredNotifications { delivered in
          let ids = delivered.filter { $0.request.content.threadIdentifier == conversation }.map { $0.request.identifier }
          if !ids.isEmpty { center.removeDeliveredNotifications(withIdentifiers: ids) }
        }
        result(nil)
      case "takeInlineReplies":
        let replies = self?.pendingReplies ?? []
        self?.pendingReplies.removeAll()
        result(replies)
      case "badge", "takeAction", "inlineReplyDone":
        // inlineReplyDone: the iPhone's confirmation of a queued reply; the Mac doesn't wait for one.
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  /// Forwards an inline text reply from macOS Notification Center to Dart (§5.3).
  func deliverReply(botId: String, conversationId: String, text: String) {
    let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty, !botId.isEmpty else { return }
    let payload: [String: String] = [
      "bot_id": botId,
      "conversation_id": conversationId,
      "text": trimmed,
    ]
    if let channel = channel {
      DispatchQueue.main.async {
        channel.invokeMethod("inlineReply", arguments: payload)
      }
    } else {
      pendingReplies.append(payload)
    }
  }

  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    if let prev = previousDelegate, prev.responds(to: #selector(UNUserNotificationCenterDelegate.userNotificationCenter(_:willPresent:withCompletionHandler:))) {
      prev.userNotificationCenter?(center, willPresent: notification, withCompletionHandler: completionHandler)
    } else {
      completionHandler([.badge])
    }
  }

  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    if response.actionIdentifier == "reply",
       let textResponse = response as? UNTextInputNotificationResponse
    {
      let userInfo = response.notification.request.content.userInfo
      let botId = (userInfo["bot_id"] as? String)
        ?? ((userInfo["casama_sender"] as? [String: Any])?["bot_id"] as? String)
        ?? ""
      let convId = (userInfo["conversation_id"] as? String)
        ?? ((userInfo["casama_sender"] as? [String: Any])?["conversation_id"] as? String)
        ?? ""
      deliverReply(botId: botId, conversationId: convId, text: textResponse.userText)
      completionHandler()
      return
    }
    if let prev = previousDelegate, prev.responds(to: #selector(UNUserNotificationCenterDelegate.userNotificationCenter(_:didReceive:withCompletionHandler:))) {
      prev.userNotificationCenter?(center, didReceive: response, withCompletionHandler: completionHandler)
    } else {
      completionHandler()
    }
  }
}

// MARK: - Mac integration over the casama/mac channel: the menu bar (File, Go, Settings…, Help)
// sends its actions to Flutter; Flutter sets the dock badge and launch at login.

final class MacBridge: NSObject {
  static let shared = MacBridge()
  private var channel: FlutterMethodChannel?

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/mac", binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "badge":
        let count = call.arguments as? Int ?? 0
        NSApp.dockTile.badgeLabel = count <= 0 ? nil : (count > 99 ? "99+" : "\(count)")
        result(nil)
      case "launchAtLogin":
        if #available(macOS 13.0, *) {
          result(SMAppService.mainApp.status == .enabled)
        } else {
          result(nil)
        }
      case "setLaunchAtLogin":
        guard #available(macOS 13.0, *) else { return result(nil) }
        do {
          if call.arguments as? Bool == true {
            try SMAppService.mainApp.register()
          } else {
            try SMAppService.mainApp.unregister()
          }
          result(SMAppService.mainApp.status == .enabled)
        } catch {
          result(FlutterError(code: "launch_at_login", message: error.localizedDescription, details: nil))
        }
      case "autoUpdateChecks":
        result(UserDefaults.standard.object(forKey: "SUEnableAutomaticChecks") as? Bool ?? true)
      case "setAutoUpdateChecks":
        // Sparkle reads this user default over the Info.plist value.
        UserDefaults.standard.set(call.arguments as? Bool ?? true, forKey: "SUEnableAutomaticChecks")
        result(nil)
      case "glance":
        result(Self.writeGlance(call.arguments as? [String: Any] ?? [:]))
      case "takeSharedText", "takeSharedFiles":
        // What the Share and Finder Quick Action extensions left in the app group (shared_text, or
        // shared_files: a JSON list of {path, name, mime}), taken once.
        let key = call.method == "takeSharedText" ? "shared_text" : "shared_files"
        let defaults = UserDefaults(suiteName: Self.widgetGroup)
        let value = defaults?.string(forKey: key)
        defaults?.removeObject(forKey: key)
        result(value)
      case "canvases":
        let args = call.arguments as? [String: Any] ?? [:]
        DispatchQueue.global(qos: .utility).async {
          Self.writeCanvases(args)
          DispatchQueue.main.async { result(nil) }
        }
      case "haptic":
        let args = call.arguments as? [String: Any] ?? [:]
        let pattern: NSHapticFeedbackManager.FeedbackPattern
        switch args["pattern"] as? String {
        case "alignment":
          pattern = .alignment
        case "levelChange":
          pattern = .levelChange
        default:
          pattern = .generic
        }
        NSHapticFeedbackManager.defaultPerformer.perform(pattern, performanceTime: .now)
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
    DispatchQueue.main.async { self.installMenus() }
  }

  /// The widgets' data (D-405 §8.3, §17): `glance {glance, words, server, signed_in, key,
  /// unsupported?, checked_at?}` writes
  /// the glance, its words and the server's address where the Mac widget extension reads them (the
  /// Team-ID-named app group, which a sandboxed extension can share with this unsandboxed app),
  /// keeps the widget key in the keychain group they share, and redraws the widgets. Signed out,
  /// it wipes all of it. Answers whether the key was stored (false where signing doesn't grant the
  /// keychain group; the widgets then show what this writes and don't fetch for themselves).
  private static let widgetGroup = "V8V5US964Z.ai.casama.app"

  private static func writeGlance(_ args: [String: Any]) -> Bool {
    let signedIn = args["signed_in"] as? Bool ?? false
    if let defaults = UserDefaults(suiteName: widgetGroup) {
      func put(_ key: String, _ value: String?) {
        if let value, !value.isEmpty, signedIn { defaults.set(value, forKey: key) } else { defaults.removeObject(forKey: key) }
      }
      put("glance", args["glance"] as? String)
      // The words stay when signed out: the signed-out widget still says "Open Casama to sign in".
      if let words = args["words"] as? String, !words.isEmpty { defaults.set(words, forKey: "glance_words") }
      put("glance_server", args["server"] as? String)
      put("glance_signed_in", signedIn ? "1" : nil)
      // Optional, as on Android and iPhone: `unsupported` (the server has no /v1/glance, §6.6)
      // and `checked_at` (epoch ms of the last 200 or 304, the data's age for the "as of" line).
      put("glance_unsupported", (args["unsupported"] as? Bool ?? false) ? "1" : nil)
      if let ms = args["checked_at"] as? NSNumber {
        put("glance_checked_at", ms.int64Value > 0 ? String(ms.int64Value) : nil)
      } else if let ms = args["checked_at"] as? String {
        put("glance_checked_at", ms)
      } else if args["glance"] as? String != nil {
        // The app calls this after each fetch (200 or 304), so the call itself is the check.
        put("glance_checked_at", String(Int64(Date().timeIntervalSince1970 * 1000)))
      }
      if !signedIn {
        for key in ["glance_checked_at", "glance_started", "glance_push_token_sent"] { defaults.removeObject(forKey: key) }
      }
    }
    let stored = WidgetKey.write(signedIn ? args["key"] as? String : nil)
    WidgetCenter.shared.reloadAllTimelines()
    return stored
  }

  /// The Canvas widget's data (docs/BOT-WIDGET-PLAN.md §10.1): `canvases {canvases: String?
  /// (CanvasList JSON, null when signed out), pictures: {hash: JPEG bytes}}` writes the list to
  /// `canvases.json` and each picture to `canvas-pictures/<hash>.jpg` in the app group the glance
  /// uses (the Mac widget doesn't fetch), deletes the pictures neither sent nor drawn by the list,
  /// and redraws the widgets. Null wipes all of it.
  private static func writeCanvases(_ args: [String: Any]) {
    let fm = FileManager.default
    guard let container = fm.containerURL(forSecurityApplicationGroupIdentifier: widgetGroup) else { return }
    let listFile = container.appendingPathComponent("canvases.json")
    let dir = container.appendingPathComponent("canvas-pictures", isDirectory: true)
    var keep = Set<String>()
    if let json = args["canvases"] as? String, !json.isEmpty, let data = json.data(using: .utf8) {
      try? data.write(to: listFile, options: .atomic)
      try? fm.createDirectory(at: dir, withIntermediateDirectories: true)
      keep = canvasPictureHashes(data)
      for (hash, value) in args["pictures"] as? [String: Any] ?? [:] {
        guard isSafeHash(hash), let bytes = (value as? FlutterStandardTypedData)?.data, !bytes.isEmpty else { continue }
        if (try? bytes.write(to: dir.appendingPathComponent("\(hash).jpg"), options: .atomic)) != nil { keep.insert(hash) }
      }
    } else {
      try? fm.removeItem(at: listFile)
    }
    // The widget extension never writes the list on the Mac; drop any copy so the file is the one.
    UserDefaults(suiteName: widgetGroup)?.removeObject(forKey: "canvases")
    if let files = try? fm.contentsOfDirectory(at: dir, includingPropertiesForKeys: nil) {
      for f in files where !keep.contains(f.deletingPathExtension().lastPathComponent) { try? fm.removeItem(at: f) }
    }
    WidgetCenter.shared.reloadTimelines(ofKind: "CanvasWidget")
  }

  /// A picture hash that is safe as a file name (`painting-night_sky`, hex digests).
  private static func isSafeHash(_ hash: String) -> Bool {
    !hash.isEmpty && hash.count <= 80
      && hash.unicodeScalars.allSatisfy { $0.isASCII && (CharacterSet.alphanumerics.contains($0) || $0 == "-" || $0 == "_") }
  }

  /// Every picture hash a CanvasList draws: entries' own pictures and picture backgrounds.
  private static func canvasPictureHashes(_ data: Data) -> Set<String> {
    guard let root = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return [] }
    var out = Set<String>()
    for item in root["items"] as? [[String: Any]] ?? [] {
      for entry in item["entries"] as? [[String: Any]] ?? [] {
        if let p = entry["picture"] as? String, isSafeHash(p) { out.insert(p) }
        let bg = (entry["look"] as? [String: Any])?["background"] as? [String: Any]
        if let p = bg?["picture"] as? String, isSafeHash(p) { out.insert(p) }
      }
    }
    return out
  }

  @objc private func menuAction(_ sender: NSMenuItem) {
    channel?.invokeMethod("menu", arguments: sender.representedObject as? String)
  }

  private func item(_ title: String, _ key: String, _ modifiers: NSEvent.ModifierFlags, _ action: String) -> NSMenuItem {
    let i = NSMenuItem(title: title, action: #selector(menuAction(_:)), keyEquivalent: key)
    i.keyEquivalentModifierMask = modifiers
    i.target = self
    i.representedObject = action
    return i
  }

  private func installMenus() {
    guard let main = NSApp.mainMenu, main.items.first(where: { $0.submenu?.title == NativeL10n.macMenuFile }) == nil else { return }
    // The template's "About APP_NAME", "Hide APP_NAME", "Quit APP_NAME" say Casama.
    for menuItem in main.items {
      if menuItem.title.contains("APP_NAME") { menuItem.title = menuItem.title.replacingOccurrences(of: "APP_NAME", with: "Casama") }
      for sub in menuItem.submenu?.items ?? [] where sub.title.contains("APP_NAME") {
        sub.title = sub.title.replacingOccurrences(of: "APP_NAME", with: "Casama")
      }
    }
    // Direct download only (the Mac App Store updates the app itself): Check for Updates….
    if Bundle.main.object(forInfoDictionaryKey: "CasamaDistribution") as? String != "appstore",
       let appMenu = main.items.first?.submenu, appMenu.items.first(where: { $0.representedObject as? String == "checkUpdates" }) == nil {
      appMenu.insertItem(item(NativeL10n.macMenuCheckForUpdates, "", [], "checkUpdates"), at: 1)
    }
    // "Preferences…" from the template becomes a working Settings… (⌘,).
    if let appMenu = main.items.first?.submenu, let prefs = appMenu.items.first(where: { $0.keyEquivalent == "," }) {
      prefs.title = NativeL10n.macMenuSettings
      prefs.target = self
      prefs.action = #selector(menuAction(_:))
      prefs.representedObject = "settings"
    }
    let file = NSMenu(title: NativeL10n.macMenuFile)
    file.addItem(item(NativeL10n.macMenuNewChat, "n", [.command], "newChat"))
    file.addItem(item(NativeL10n.macMenuNewBot, "n", [.command, .shift], "newBot"))
    file.addItem(item(NativeL10n.macMenuQuickAsk, "k", [.command, .shift], "quickAsk"))
    file.addItem(item(NativeL10n.macMenuSearch, "k", [.command], "search"))
    file.addItem(.separator())
    file.addItem(NSMenuItem(title: NativeL10n.macMenuCloseWindow, action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w"))
    let fileItem = NSMenuItem(title: NativeL10n.macMenuFile, action: nil, keyEquivalent: "")
    fileItem.submenu = file
    main.insertItem(fileItem, at: 1)

    let go = NSMenu(title: NativeL10n.macMenuGo)
    go.addItem(item(NativeL10n.macMenuBots, "1", [.command], "go:/bots"))
    go.addItem(item(NativeL10n.macMenuInbox, "2", [.command], "go:/inbox?tab=0"))  // Needs you (E2)
    go.addItem(item(NativeL10n.macMenuBoard, "3", [.command], "go:/tasks"))
    go.addItem(item(NativeL10n.macMenuComputer, "4", [.command], "go:/computer"))
    go.addItem(item(NativeL10n.macMenuPages, "5", [.command], "go:/pages"))
    let goItem = NSMenuItem(title: NativeL10n.macMenuGo, action: nil, keyEquivalent: "")
    goItem.submenu = go
    let viewIndex = main.items.firstIndex(where: { $0.submenu?.title == NativeL10n.macMenuView }) ?? 3
    main.insertItem(goItem, at: min(viewIndex + 1, main.items.count))

    if let help = main.items.first(where: { $0.submenu?.title == NativeL10n.macMenuHelp })?.submenu {
      help.removeAllItems()
      help.addItem(item(NativeL10n.macMenuCasamaHelp, "?", [.command], "help"))
      help.addItem(item(NativeL10n.macMenuSendFeedback, "", [], "feedback"))
    }
  }
}

// MARK: - Browser sign-in in the system's sign-in window (ASWebAuthenticationSession) over the
// casama/web_auth channel: opens over the app instead of switching to the browser, shares the
// browser's cookies and passkeys, and hands the casama:// link back here instead of to the app's
// URL handler.

final class WebAuthBridge: NSObject, ASWebAuthenticationPresentationContextProviding {
  static let shared = WebAuthBridge()
  private var channel: FlutterMethodChannel?
  private var session: ASWebAuthenticationSession?

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/web_auth", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "authenticate" else { return result(FlutterMethodNotImplemented) }
      guard let args = call.arguments as? [String: Any],
            let urlString = args["url"] as? String, let url = URL(string: urlString),
            let scheme = args["scheme"] as? String else {
        return result(FlutterError(code: "bad_args", message: "url and scheme are needed", details: nil))
      }
      self?.authenticate(url, scheme: scheme, result: result)
    }
    self.channel = channel
  }

  private func authenticate(_ url: URL, scheme: String, result: @escaping FlutterResult) {
    // A second tap replaces the window still open; its caller hears it was cancelled.
    session?.cancel()
    let session = ASWebAuthenticationSession(url: url, callbackURLScheme: scheme) { [weak self] callback, error in
      DispatchQueue.main.async {
        self?.session = nil
        if let callback = callback {
          result(callback.absoluteString)
        } else if let error = error as? ASWebAuthenticationSessionError, error.code == .canceledLogin {
          result(FlutterError(code: "canceled", message: nil, details: nil))
        } else {
          result(FlutterError(code: "failed", message: error?.localizedDescription, details: nil))
        }
      }
    }
    session.presentationContextProvider = self
    // Keep the browser's cookies, so someone already signed in there isn't asked again.
    session.prefersEphemeralWebBrowserSession = false
    self.session = session
    if !session.start() {
      self.session = nil
      result(FlutterError(code: "unavailable", message: "The sign-in window could not open.", details: nil))
    }
  }

  func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
    NSApp.mainWindow ?? NSApp.windows.first(where: { $0 is MainFlutterWindow }) ?? ASPresentationAnchor()
  }
}

// MARK: - casama/permissions (D-376): system permissions a bot needs on this Mac, checked without
// prompting, asked for when the person taps Turn on, and a restart after Screen Recording.
// `check {ids}` → {id: state}; `request {id}` → state; `relaunch`. States: granted, denied,
// not_asked, restricted, unknown. Accessibility and Screen Recording can't tell "never asked" from
// "said no", so a prompt shown once is remembered in UserDefaults.

final class PermissionsBridge {
  static let shared = PermissionsBridge()
  private var channel: FlutterMethodChannel?
  private static let promptedKey = "casama.permissions.prompted."

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/permissions", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      guard let self = self else { return result(nil) }
      let args = call.arguments as? [String: Any] ?? [:]
      switch call.method {
      case "check":
        let ids = args["ids"] as? [String] ?? []
        // Automation's check talks to System Events: off the main thread.
        DispatchQueue.global(qos: .userInitiated).async {
          var out: [String: String] = [:]
          for id in ids { out[id] = self.state(id) }
          DispatchQueue.main.async { result(out) }
        }
      case "request":
        guard let id = args["id"] as? String else { return result(FlutterError(code: "bad_args", message: "id is needed", details: nil)) }
        self.request(id) { state in DispatchQueue.main.async { result(state) } }
      case "relaunch":
        self.relaunch()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  private func prompted(_ id: String) -> Bool { UserDefaults.standard.bool(forKey: Self.promptedKey + id) }
  private func markPrompted(_ id: String) { UserDefaults.standard.set(true, forKey: Self.promptedKey + id) }

  private func state(_ id: String) -> String {
    switch id {
    case "accessibility":
      return AXIsProcessTrusted() ? "granted" : (prompted(id) ? "denied" : "not_asked")
    case "screen_recording":
      return CGPreflightScreenCaptureAccess() ? "granted" : (prompted(id) ? "denied" : "not_asked")
    case "automation":
      return automation(ask: false)
    case "full_disk":
      return fullDisk()
    case "microphone":
      return Self.avState(AVCaptureDevice.authorizationStatus(for: .audio))
    case "speech":
      switch SFSpeechRecognizer.authorizationStatus() {
      case .authorized: return "granted"
      case .denied: return "denied"
      case .restricted: return "restricted"
      case .notDetermined: return "not_asked"
      @unknown default: return "unknown"
      }
    case "notifications":
      return notificationState()
    default:
      return "unknown"
    }
  }

  private func notificationState() -> String {
    let sem = DispatchSemaphore(value: 0)
    var out = "unknown"
    UNUserNotificationCenter.current().getNotificationSettings { settings in
      switch settings.authorizationStatus {
      case .authorized: out = "granted"
      case .provisional: out = "limited"
      case .denied: out = "denied"
      case .notDetermined: out = "not_asked"
      @unknown default: out = "unknown"
      }
      sem.signal()
    }
    _ = sem.wait(timeout: .now() + 2)
    return out
  }

  static func avState(_ s: AVAuthorizationStatus) -> String {
    switch s {
    case .authorized: return "granted"
    case .denied: return "denied"
    case .restricted: return "restricted"
    case .notDetermined: return "not_asked"
    @unknown default: return "unknown"
    }
  }

  private func request(_ id: String, done: @escaping (String) -> Void) {
    switch id {
    case "accessibility":
      markPrompted(id)
      // Shows "Casama would like to control this computer" with a button to the pane.
      let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary
      done(AXIsProcessTrustedWithOptions(options) ? "granted" : "denied")
    case "screen_recording":
      markPrompted(id)
      // The first call shows the system's prompt; it returns at once, before any answer.
      done(CGRequestScreenCaptureAccess() ? "granted" : "denied")
    case "automation":
      DispatchQueue.global(qos: .userInitiated).async { done(self.automation(ask: true)) }
    case "notifications":
      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
        DispatchQueue.global(qos: .userInitiated).async { done(self.notificationState()) }
      }
    default:
      done(state(id))
    }
  }

  /// Apple Events to System Events, which agent-desktop and AppleScript use.
  private func automation(ask: Bool) -> String {
    let bundle = "com.apple.systemevents"
    var status = Self.automationStatus(bundle, ask: ask)
    // procNotFound: System Events isn't running, and only a running target can answer.
    if status == OSStatus(procNotFound) && ask {
      let open = Process()
      open.executableURL = URL(fileURLWithPath: "/usr/bin/open")
      open.arguments = ["-g", "-j", "-b", bundle]
      try? open.run()
      open.waitUntilExit()
      Thread.sleep(forTimeInterval: 1)
      status = Self.automationStatus(bundle, ask: ask)
    }
    switch status {
    case noErr: return "granted"
    case OSStatus(errAEEventNotPermitted): return "denied"
    case OSStatus(errAEEventWouldRequireUserConsent): return "not_asked"
    default: return "unknown"
    }
  }

  private static func automationStatus(_ bundle: String, ask: Bool) -> OSStatus {
    let target = NSAppleEventDescriptor(bundleIdentifier: bundle)
    guard let desc = target.aeDesc else { return OSStatus(procNotFound) }
    return AEDeterminePermissionToAutomateTarget(desc, AEEventClass(typeWildCard), AEEventID(typeWildCard), ask)
  }

  /// Full Disk Access has no API: the usual probe is opening the user's TCC database, which only
  /// an app with Full Disk Access may read. It always exists, and without access even looking it up
  /// can fail, so a failed open is the answer (no existence check first).
  private func fullDisk() -> String {
    let path = NSHomeDirectory() + "/Library/Application Support/com.apple.TCC/TCC.db"
    if let handle = FileHandle(forReadingAtPath: path) {
      handle.closeFile()
      return "granted"
    }
    return "denied"
  }

  /// Quits and opens Casama again a second later (Screen Recording applies from the next launch).
  private func relaunch() {
    let task = Process()
    task.executableURL = URL(fileURLWithPath: "/bin/sh")
    task.arguments = ["-c", "sleep 1; /usr/bin/open -n \"$0\"", Bundle.main.bundlePath]
    do {
      try task.run()
    } catch {
      return
    }
    NSApp.terminate(nil)
  }
}

// MARK: - The Mac in-app browser (docs/IN-APP-BROWSER-PLAN.md §4, D-508): one WKWebView a bot can
// drive while the person watches, with its own macOS 14+ data store, isolated `casama` script
// world, App Nap prevention while active, and the same `casama/app_browser` contract as iOS.

#if CASAMA_APP_BROWSER
final class AppBrowser: NSObject, WKNavigationDelegate, WKUIDelegate, FlutterPlatformViewFactory {
  static let shared = AppBrowser()
  /// Fixed identifier for the bots' separate cookie store (requires macOS 14+).
  private static let store = UUID(uuidString: "6B0F4C1E-5C0A-4A7E-9C2B-CA5A3A0B0751")!
  private var channel: FlutterMethodChannel?
  private var registrar: FlutterPluginRegistrar?
  private weak var mainWindow: NSWindow?
  private var web: CasamaMacWebView?

  /// The address or title changed without a page load (a site that changes its address in place,
  /// or a #fragment): Dart's address bar and the bots' page facts follow it.
  private var addressWatch: [NSKeyValueObservation] = []
  private func watchAddress(_ w: WKWebView) {
    let report: (WKWebView) -> Void = { [weak self] wv in
      DispatchQueue.main.async {
        guard let self, wv === self.web else { return }
        let raw = wv.url?.absoluteString ?? ""
        if raw.isEmpty || raw == "about:blank" { return }
        self.channel?.invokeMethod("urlChanged", arguments: ["url": raw, "title": wv.title ?? ""])
      }
    }
    addressWatch = [
      w.observe(\.url, options: [.new]) { wv, _ in report(wv) },
      w.observe(\.title, options: [.new]) { wv, _ in report(wv) },
    ]
  }
  /// The frames that can show the page, oldest first; the newest has it. When it closes, the page
  /// goes back to the one under it if that one is still there (the side panel under the full
  /// view, APP-BROWSER-PANEL-PLAN §3), else it waits off screen.
  private var holders: [WeakHolder] = []
  private var holder: NSView? { holders.last?.view }
  private var dialog: ((Bool, String?) -> Void)?
  private var napToken: NSObjectProtocol?

  private var world: WKContentWorld { WKContentWorld.world(name: "casama") }

  func attach(_ controller: FlutterViewController, window: NSWindow) {
    self.mainWindow = window
    let reg = controller.registrar(forPlugin: "CasamaAppBrowser")
    self.registrar = reg
    let channel = FlutterMethodChannel(name: "casama/app_browser", binaryMessenger: reg.messenger)
    channel.setMethodCallHandler { [weak self] call, result in self?.handle(call, result) }
    self.channel = channel
    reg.register(self, withId: "casama/app_browser_view")
    // Cmd+W only orders the window out (see `performClose`), so the app's lifecycle may not change
    // when it comes back; say so, or the browser would stay off after `windowHidden`.
    NotificationCenter.default.addObserver(
      forName: NSWindow.didChangeOcclusionStateNotification, object: window, queue: .main
    ) { [weak self, weak window] _ in
      guard let window = window, window.isVisible, window.occlusionState.contains(.visible) else { return }
      self?.channel?.invokeMethod("windowShown", arguments: nil)
    }
  }

  func windowHidden() {
    endNapPrevention()
    channel?.invokeMethod("windowHidden", arguments: nil)
  }

  private var unsupported: String? {
    if #available(macOS 14.0, *) { return nil }
    return "needs_macos_14"
  }

  /// Ends the activity once the bot has sent no page command for a while (D-615): it used to last
  /// for the rest of the session after one load, so macOS could never nap the idle app.
  private var napIdleEnd: DispatchWorkItem?

  private func beginNapPrevention() {
    napIdleEnd?.cancel()
    let end = DispatchWorkItem { [weak self] in self?.endNapPrevention() }
    napIdleEnd = end
    DispatchQueue.main.asyncAfter(deadline: .now() + 120, execute: end)
    if napToken != nil { return }
    napToken = ProcessInfo.processInfo.beginActivity(
      options: [.userInitiatedAllowingIdleSystemSleep, .latencyCritical],
      reason: "Bot is working in the Casama in-app browser")
  }

  private func endNapPrevention() {
    napIdleEnd?.cancel()
    napIdleEnd = nil
    if let token = napToken {
      ProcessInfo.processInfo.endActivity(token)
      napToken = nil
    }
  }

  private func handle(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any] ?? [:]
    switch call.method {
    case "supported":
      result(["supported": unsupported == nil, "reason": unsupported as Any, "realTaps": false])
    case "load":
      guard let raw = args["url"] as? String, let url = URL(string: raw) else {
        return result(FlutterError(code: "bad_args", message: "url", details: nil))
      }
      guard let w = view() else {
        return result(FlutterError(code: "unsupported", message: unsupported, details: nil))
      }
      beginNapPrevention()
      approved.insert(raw)
      w.load(URLRequest(url: url))
      result(nil)
    case "command":
      beginNapPrevention()
      command(args["json"] as? String ?? "{}", timeoutMs: args["timeout_ms"] as? Int ?? 30_000, result)
    case "screenshot":
      guard let w = web else {
        return result(FlutterError(code: "no_page", message: "No page is open", details: nil))
      }
      if w.window == nil { park(w) }
      let quality = CGFloat(min(95, max(30, args["quality"] as? Int ?? 70))) / 100
      let config = WKSnapshotConfiguration()
      config.snapshotWidth = NSNumber(value: Double(max(1, w.bounds.width / 2)))
      w.takeSnapshot(with: config) { image, error in
        guard let image,
              let tiff = image.tiffRepresentation,
              let rep = NSBitmapImageRep(data: tiff),
              let data = rep.representation(using: .jpeg, properties: [.compressionFactor: quality]) else {
          return result(FlutterError(code: "failed", message: error?.localizedDescription, details: nil))
        }
        result(["data": data.base64EncodedString()])
      }
    case "url":
      result([
        "url": web?.url?.absoluteString ?? "about:blank",
        "title": web?.title ?? "",
        "loading": web?.isLoading ?? false,
        "canGoBack": web?.canGoBack ?? false,
        "canGoForward": web?.canGoForward ?? false,
      ])
    case "back": web?.goBack(); result(nil)
    case "forward": web?.goForward(); result(nil)
    case "reload": web?.reload(); result(nil)
    case "stop":
      endNapPrevention()
      web?.stopLoading()
      result(nil)
    case "answerDialog":
      let done = dialog
      dialog = nil
      done?(args["accept"] as? Bool ?? false, args["text"] as? String)
      result(nil)
    case "clearData":
      clearData(args["host"] as? String) { result(nil) }
    case "dispose":
      dispose()
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  /// The single WKWebView, created on first use. Nil before macOS 14.
  private func view() -> CasamaMacWebView? {
    if let web = web { return web }
    guard #available(macOS 14.0, *), let registrar = registrar else { return nil }
    let config = WKWebViewConfiguration()
    config.websiteDataStore = WKWebsiteDataStore(forIdentifier: AppBrowser.store)
    config.mediaTypesRequiringUserActionForPlayback = .all
    config.preferences.javaScriptCanOpenWindowsAutomatically = false
    // On macOS the asset key is a path from the app bundle's root
    // ("Contents/Frameworks/App.framework/Resources/flutter_assets/…"), not a
    // resource name as on iOS, so `Bundle.main.path(forResource:)` never finds
    // it. Without the script every read, click and fill fails "not ready".
    let key = registrar.lookupKey(forAsset: "assets/app_browser/page_agent.js")
    let path = Bundle.main.bundleURL.appendingPathComponent(key).path
    if let source = try? String(contentsOfFile: path, encoding: .utf8) {
      let secret = "globalThis.__casamaPageAgentConfig={secret:\"\(UUID().uuidString)\"};\n"
      config.userContentController.addUserScript(
        WKUserScript(source: secret + source, injectionTime: .atDocumentStart, forMainFrameOnly: false, in: world))
    } else {
      NSLog("app browser: page script missing at %@", path)
    }
    let bounds = holder?.bounds ?? mainWindow?.contentView?.bounds ?? NSRect(x: 0, y: 0, width: 1024, height: 768)
    let w = CasamaMacWebView(frame: bounds, configuration: config)
    w.navigationDelegate = self
    w.uiDelegate = self
    w.allowsBackForwardNavigationGestures = true
    w.onUserInput = { [weak self] in self?.channel?.invokeMethod("userTouched", arguments: nil) }
    #if DEBUG
    w.isInspectable = true
    #endif
    web = w
    watchAddress(w)
    if let holder = holder { put(w, into: holder) } else { park(w) }
    return w
  }

  /// Keeps the WKWebView attached behind the Flutter content view when no full view is open, so
  /// layout and snapshots work while the chat card shows previews.
  private func park(_ w: WKWebView) {
    guard let root = mainWindow?.contentView else { return }
    w.removeFromSuperview()
    w.frame = root.bounds
    w.autoresizingMask = [.width, .height]
    // A parked page keeps rendering (bots still read it and the preview card
    // still snapshots it) but must never take the window's clicks or keys:
    // it sits inside the Flutter view, so hit-testing would otherwise hand it
    // every click in the app.
    (w as? CasamaMacWebView)?.parked = true
    root.addSubview(w, positioned: .below, relativeTo: root.subviews.first)
    if let fr = mainWindow?.firstResponder as? NSView, fr.isDescendant(of: w) {
      mainWindow?.makeFirstResponder(root)
    }
  }

  /// A frame joined the window. A page parked while its newest frame wasn't in a window yet (a
  /// screenshot can't wait for that) goes back into it.
  fileprivate func boxShown(_ container: NSView) {
    guard let w = web, container === holder, w.superview !== container else { return }
    put(w, into: container)
  }

  fileprivate func boxClosed(_ container: NSView) {
    // Called from the frame's deinit, when weak references to it already read nil.
    holders.removeAll { $0.view == nil || $0.view === container }
    guard let w = web, w.superview === container else { return }
    if let next = holder { put(w, into: next) } else { park(w) }
  }

  private func put(_ w: NSView, into holder: NSView) {
    w.removeFromSuperview()
    (w as? CasamaMacWebView)?.parked = false
    w.frame = holder.bounds
    w.autoresizingMask = [.width, .height]
    holder.addSubview(w)
  }

  // MARK: Page script

  private func command(_ json: String, timeoutMs: Int, _ result: @escaping FlutterResult) {
    guard let w = web else {
      return result("{\"ok\":false,\"code\":\"error\",\"message\":\"No page is open\"}")
    }
    var answered = false
    let finish: (String) -> Void = { text in
      if answered { return }
      answered = true
      result(text)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(timeoutMs)) {
      finish("{\"ok\":false,\"code\":\"error\",\"message\":\"The page didn't answer in time\"}")
    }
    let body = "const a = globalThis.__casamaPageAgent; if (!a) return JSON.stringify({ok:false,code:'error',message:'The page is not ready yet'}); return JSON.stringify(await a.handle(JSON.parse(cmd)));"
    w.callAsyncJavaScript(body, arguments: ["cmd": json], in: nil, in: world) { outcome in
      switch outcome {
      case .success(let value):
        finish(value as? String ?? "{\"ok\":false,\"code\":\"error\",\"message\":\"The page gave no answer\"}")
      case .failure(let error):
        let message = error.localizedDescription.replacingOccurrences(of: "\\", with: " ").replacingOccurrences(of: "\"", with: "'")
        finish("{\"ok\":false,\"code\":\"error\",\"message\":\"\(message)\"}")
      }
    }
  }

  // MARK: Navigation

  private var approved = Set<String>()

  private func ask(_ method: String, _ args: [String: Any], _ done: @escaping (Bool) -> Void) {
    guard let channel = channel else { return done(false) }
    channel.invokeMethod(method, arguments: args) { answer in done((answer as? Bool) == true) }
  }

  func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    guard action.targetFrame?.isMainFrame ?? true, let url = action.request.url else { return decisionHandler(.allow) }
    let raw = url.absoluteString
    if raw == "about:blank" || approved.remove(raw) != nil { return decisionHandler(.allow) }
    let user = action.navigationType == .linkActivated || action.navigationType == .formSubmitted
    ask("navigate", ["url": raw, "redirect": action.navigationType == .other, "user": user]) { ok in
      decisionHandler(ok ? .allow : .cancel)
    }
  }

  func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for action: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
    if action.targetFrame == nil { webView.load(action.request) }
    return nil
  }

  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    channel?.invokeMethod("pageStarted", arguments: ["url": webView.url?.absoluteString ?? ""])
  }

  func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    let raw = webView.url?.absoluteString ?? ""
    if raw.isEmpty || raw == "about:blank" { return }
    ask("landed", ["url": raw]) { ok in
      if !ok, let blank = URL(string: "about:blank") {
        webView.stopLoading()
        webView.load(URLRequest(url: blank))
      }
    }
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    channel?.invokeMethod("pageFinished", arguments: ["url": webView.url?.absoluteString ?? "", "title": webView.title ?? ""])
  }

  func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
    endNapPrevention()
    channel?.invokeMethod("gone", arguments: ["reason": "killed"])
  }

  // MARK: Dialogs

  private func hold(_ kind: String, _ message: String, _ done: @escaping (Bool, String?) -> Void) {
    dialog?(false, nil)
    var finished = false
    let once: (Bool, String?) -> Void = { accept, text in
      if finished { return }
      finished = true
      done(accept, text)
    }
    dialog = once
    channel?.invokeMethod("dialog", arguments: ["kind": kind, "message": message])
    DispatchQueue.main.asyncAfter(deadline: .now() + 60) { once(false, nil) }
  }

  func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
    hold("alert", message) { _, _ in completionHandler() }
  }

  func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
    hold("confirm", message) { accept, _ in completionHandler(accept) }
  }

  func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
    hold("prompt", prompt) { accept, text in completionHandler(accept ? (text ?? "") : nil) }
  }

  // MARK: Data

  private func clearData(_ host: String?, _ done: @escaping () -> Void) {
    guard #available(macOS 14.0, *) else { return done() }
    let store = WKWebsiteDataStore(forIdentifier: AppBrowser.store)
    let types = WKWebsiteDataStore.allWebsiteDataTypes()
    guard let host = host else {
      return store.removeData(ofTypes: types, modifiedSince: .distantPast, completionHandler: done)
    }
    store.fetchDataRecords(ofTypes: types) { records in
      let mine = records.filter { host == $0.displayName || host.hasSuffix("." + $0.displayName) || $0.displayName.hasSuffix("." + host) }
      store.removeData(ofTypes: types, for: mine, completionHandler: done)
    }
  }

  private func dispose() {
    endNapPrevention()
    dialog?(false, nil)
    dialog = nil
    approved.removeAll()
    web?.stopLoading()
    web?.removeFromSuperview()
    addressWatch = []
    web = nil
  }

  // MARK: Platform view (AppKitView)

  func create(withViewIdentifier viewId: Int64, arguments args: Any?) -> NSView {
    let box = AppBrowserMacContainer(frame: mainWindow?.contentView?.bounds ?? .zero)
    holders.removeAll { $0.view == nil }
    holders.append(WeakHolder(box))
    if let w = view() { put(w, into: box) }
    return box
  }
}

private final class WeakHolder {
  weak var view: NSView?
  init(_ view: NSView) { self.view = view }
}

private final class AppBrowserMacContainer: NSView {
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    wantsLayer = true
    layer?.masksToBounds = true
  }
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  override func viewDidMoveToWindow() {
    super.viewDidMoveToWindow()
    if window != nil { AppBrowser.shared.boxShown(self) }
  }
  deinit { AppBrowser.shared.boxClosed(self) }
}

private final class CasamaMacWebView: WKWebView {
  var onUserInput: (() -> Void)?
  /// True while the page waits off screen (see `park`): it then ignores the
  /// mouse and keyboard.
  var parked = false {
    didSet { setAccessibilityElement(!parked) }
  }
  override func hitTest(_ point: NSPoint) -> NSView? {
    parked ? nil : super.hitTest(point)
  }
  override var acceptsFirstResponder: Bool { parked ? false : super.acceptsFirstResponder }
  /// True when the person already focused the page or is clicking into it now. The page itself
  /// (`autofocus` on load, script `focus()`, or a bot click) never takes the keyboard from
  /// Flutter's message box (checked from `MainFlutterWindow.makeFirstResponder`, before AppKit
  /// asks `FlutterView` to resign; D-549 G1/G2).
  func allowsFocus(in win: NSWindow) -> Bool {
    guard !parked else { return false }
    if let fr = win.firstResponder as? NSView, fr.isDescendant(of: self) { return true }
    guard let event = NSApp.currentEvent, event.window === win,
          [.leftMouseDown, .rightMouseDown, .otherMouseDown].contains(event.type),
          bounds.contains(convert(event.locationInWindow, from: nil)) else { return false }
    return true
  }
  override func mouseDown(with event: NSEvent) {
    onUserInput?()
    super.mouseDown(with: event)
  }
  override func keyDown(with event: NSEvent) {
    onUserInput?()
    super.keyDown(with: event)
  }
}
#endif
