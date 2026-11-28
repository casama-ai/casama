import AVFoundation
import AppIntents
import AppTrackingTransparency
import AuthenticationServices
import CoreLocation
import Flutter
import Photos
import PushKit
import Speech
import StoreKit
import UIKit
import UserNotifications
import flutter_callkit_incoming
import native_geofence
#if CASAMA_APP_BROWSER
import WebKit
#endif

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, PKPushRegistryDelegate {
  private var voipRegistry: PKPushRegistry?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // This app delegate answers the notification center before any plugin registers (Firebase
    // Messaging then leaves it in place and gets each callback forwarded), so inline replies reach
    // didReceive below, and it is set before launch finishes, as iOS needs for a cold-start tap.
    UNUserNotificationCenter.current().delegate = self
    // Phone-call voice (D-135): bots ring this phone with VoIP pushes.
    let registry = PKPushRegistry(queue: .main)
    registry.delegate = self
    registry.desiredPushTypes = [.voIP]
    voipRegistry = registry
    // Suggestion pushes (D-247, INBOX-TIDY-PLAN §4.4): one category per kind with fixed localized words.
    UNUserNotificationCenter.current().setNotificationCategories([
      UNNotificationCategory(
        identifier: "SUGGESTION",
        actions: [
          UNNotificationAction(identifier: "accept", title: NativeL10n.notifDoIt, options: [.foreground]),
          UNNotificationAction(identifier: "later", title: NativeL10n.notifNotNow, options: []),
        ],
        intentIdentifiers: [],
        options: []),
      UNNotificationCategory(
        identifier: "SUGGESTION_TURN_ON",
        actions: [
          UNNotificationAction(identifier: "accept", title: NativeL10n.notifTurnOn, options: [.foreground]),
          UNNotificationAction(identifier: "later", title: NativeL10n.notifNotNow, options: []),
        ],
        intentIdentifiers: [],
        options: []),
      UNNotificationCategory(
        identifier: "SUGGESTION_REMIND",
        actions: [
          UNNotificationAction(identifier: "accept", title: NativeL10n.notifRemindMe, options: [.foreground]),
          UNNotificationAction(identifier: "later", title: NativeL10n.notifNotNow, options: []),
        ],
        intentIdentifiers: [],
        options: []),
      UNNotificationCategory(
        identifier: "SUGGESTION_LOOK",
        actions: [
          UNNotificationAction(identifier: "accept", title: NativeL10n.notifOpen, options: [.foreground]),
          UNNotificationAction(identifier: "later", title: NativeL10n.notifGotIt, options: []),
        ],
        intentIdentifiers: [],
        options: []),
      UNNotificationCategory(
        identifier: "SUGGESTION_ANSWER",
        actions: [
          UNNotificationAction(identifier: "later", title: NativeL10n.notifNotNow, options: []),
        ],
        intentIdentifiers: [],
        options: []),
      // Approvals below high risk (D-325): both open the app, which answers, after Face ID or the
      // passcode. The server sends them with aps.category = APPROVAL.
      UNNotificationCategory(
        identifier: "APPROVAL",
        actions: [
          // "Allow", as the app and the watch say it (D-410); the id stays "approve".
          UNNotificationAction(identifier: "approve", title: NativeL10n.notifAllow, options: [.foreground, .authenticationRequired]),
          UNNotificationAction(identifier: "deny", title: NativeL10n.notifDeny, options: [.foreground, .authenticationRequired, .destructive]),
        ],
        intentIdentifiers: [],
        options: []),
      // Replies (D-410, APPLE-INTEGRATIONS-PLAN §5.3): text reply action lets Siri, AirPods,
      // CarPlay and Watch answer reply notifications directly.
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
        options: []),
    ])
    // The Apple Watch asks this phone to sign it in (D-410). Active before Flutter, so requests
    // that wake the app in the background are held for Dart.
    WatchBridge.shared.activate()
    // Phase 0 of docs/SIRI-AI-PLAN.md: whether this launch was in the background (Siri, a widget).
    SiriProbeLog.add("launch, state \(application.applicationState.rawValue), process age \(SiriProbeLog.processAge()) s")
    // Controls and small widgets that open Casama at a place (D-405, ControlIntents.swift) hand
    // the path over the way Siri's Ask a bot does, queued until Flutter is ready.
    if #available(iOS 17.0, *) {
      MainActor.assumeIsolated { WidgetOpen.open = { ShortcutBridge.shared.open($0) } }
    }
    // Device triggers (D-151): a geofence can wake the app in the background, without a UI scene.
    NativeGeofencePlugin.setPluginRegistrantCallback { registry in
      GeneratedPluginRegistrant.register(with: registry)
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  /// Handoff from Mac / iPad (docs/APPLE-INTEGRATIONS-PLAN.md §6.10). With scenes iOS sends it to
  /// SceneDelegate instead; this covers a launch without one.
  override func application(
    _ application: UIApplication,
    continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
  ) -> Bool {
    if Handoff.open(userActivity) { return true }
    return super.application(application, continue: userActivity, restorationHandler: restorationHandler)
  }

  /// A notification arriving with the app open. Flutter hands it to the plugins; Firebase Messaging
  /// answers its own pushes with the options Dart set (D-325: the badge, no banner). Anything nobody
  /// answers gets those same options, as when Firebase owned the notification center.
  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    var answered = false
    super.userNotificationCenter(center, willPresent: notification) { options in
      guard !answered else { return }
      answered = true
      completionHandler(options)
    }
    if !answered {
      answered = true
      completionHandler(Self.foregroundPresentationOptions())
    }
  }

  /// Inline text replies on REPLY notifications (Siri, AirPods, CarPlay, Lock Screen; §5.3): iOS
  /// keeps the app running until Dart has sent the reply, in a headless engine when Casama wasn't
  /// running (NotificationsBridge). Taps and buttons go to the plugins.
  override func userNotificationCenter(
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
      NotificationsBridge.shared.deliverReply(
        botId: botId,
        conversationId: convId,
        text: textResponse.userText,
        completion: completionHandler
      )
      return
    }
    var answered = false
    super.userNotificationCenter(center, didReceive: response) {
      guard !answered else { return }
      answered = true
      completionHandler()
    }
    if !answered {
      answered = true
      completionHandler()
    }
  }

  /// What Dart asked Firebase Messaging to show for a notification with the app open
  /// (setForegroundNotificationPresentationOptions, stored by the plugin under this key).
  private static func foregroundPresentationOptions() -> UNNotificationPresentationOptions {
    let saved = UserDefaults.standard.dictionary(forKey: "flutter_firebase_messaging_presentation_options") ?? [:]
    var options: UNNotificationPresentationOptions = []
    if saved["alert"] as? Bool == true { options.formUnion([.banner, .list]) }
    if saved["badge"] as? Bool == true { options.insert(.badge) }
    if saved["sound"] as? Bool == true { options.insert(.sound) }
    return options
  }

  func pushRegistry(_ registry: PKPushRegistry, didUpdate credentials: PKPushCredentials, for type: PKPushType) {
    let token = credentials.token.map { String(format: "%02x", $0) }.joined()
    SwiftFlutterCallkitIncomingPlugin.sharedInstance?.setDevicePushTokenVoIP(token)
  }

  func pushRegistry(_ registry: PKPushRegistry, didInvalidatePushTokenFor type: PKPushType) {
    SwiftFlutterCallkitIncomingPlugin.sharedInstance?.setDevicePushTokenVoIP("")
  }

  // Apple requires every VoIP push to report a call to CallKit right away.
  func pushRegistry(
    _ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType,
    completion: @escaping () -> Void
  ) {
    let p = payload.dictionaryPayload
    let id = (p["call_id"] as? String) ?? UUID().uuidString
    let reason = (p["reason"] as? String) ?? ""
    let data = flutter_callkit_incoming.Data(id: id, nameCaller: (p["bot_name"] as? String) ?? "Casama", handle: reason, type: 0)
    data.appName = "Casama"
    data.duration = 45000
    data.extra = [
      "call_id": id,
      "bot_id": (p["bot_id"] as? String) ?? "",
      "bot_name": (p["bot_name"] as? String) ?? "Casama",
      "reason": reason,
      "conversation_id": (p["conversation_id"] as? String) ?? "",
    ]
    SwiftFlutterCallkitIncomingPlugin.sharedInstance?.showCallkitIncoming(data, fromPushKit: true) { _ in completion() }
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaShortcuts") {
      ShortcutBridge.shared.attach(registrar.messenger())
    }
    // Siri acting through the app, Spotlight and what is on screen (docs/SIRI-AI-PLAN.md).
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaSiri") {
      SiriBridge.shared.attach(registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaSignInSheet") {
      SignInSheet.shared.attach(registrar.messenger())
    }
    // The browser a bot can use on this phone (docs/PHONE-BROWSER-PLAN.md): only in builds with
    // the CASAMA_APP_BROWSER flag (Flutter/AppBrowser.xcconfig, scripts/app-browser-switch.sh).
    #if CASAMA_APP_BROWSER
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaAppBrowser") {
      AppBrowser.shared.attach(registrar)
    }
    #endif
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaIsland") {
      IslandActivities.shared.attach(registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaNotifications") {
      NotificationsBridge.shared.attach(registrar.messenger())
    }
    // Live calls (D-327): the screen stays on while the call screen is in front.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaScreenAwake") {
      let channel = FlutterMethodChannel(name: "casama/screen_awake", binaryMessenger: registrar.messenger())
      channel.setMethodCallHandler { call, result in
        guard call.method == "set", let args = call.arguments as? [String: Any], let on = args["on"] as? Bool else {
          result(FlutterMethodNotImplemented)
          return
        }
        UIApplication.shared.isIdleTimerDisabled = on
        result(nil)
      }
    }
    // Billing > Manage Subscription (RETENTION-MESSAGING-PLAN §10.1): StoreKit's own sheet, whose
    // Cancel Subscription leads to Apple's Confirm Cancellation screen with our retention message.
    // Answers false when there's no window to show it in, so the app falls back to the URL.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaManageSubscriptions") {
      let channel = FlutterMethodChannel(name: "casama/manage_subscriptions", binaryMessenger: registrar.messenger())
      channel.setMethodCallHandler { call, result in
        guard call.method == "show" else {
          result(FlutterMethodNotImplemented)
          return
        }
        let scene = UIApplication.shared.connectedScenes
          .compactMap { $0 as? UIWindowScene }
          .first { $0.activationState == .foregroundActive }
        guard let scene else {
          result(false)
          return
        }
        Task { @MainActor in
          do {
            try await AppStore.showManageSubscriptions(in: scene)
            result(true)
          } catch {
            result(FlutterError(code: "manage_failed", message: error.localizedDescription, details: nil))
          }
        }
      }
    }
    // Live calls (D-327 §9): Mute and End Call on the call's Live Activity.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaCallGlance") {
      CallGlanceBridge.shared.attach(registrar.messenger())
    }
    // Widgets (D-405): the widget key, redraws, which widgets are placed.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaWidgets") {
      WidgetsBridge.shared.attach(registrar.messenger())
    }
    // Apple Watch sign-in and Open on iPhone (D-410).
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaWatch") {
      WatchBridge.shared.attach(registrar.messenger())
    }
    // System permissions a bot needs on this phone (D-376).
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaPermissions") {
      PermissionsBridge.shared.attach(registrar.messenger())
    }
    // A folding iPhone (D-411): its hinge, fold and status area, and files dropped from the app
    // beside this one.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaFold") {
      FoldBridge.shared.attach(registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaDrop") {
      DropBridge.shared.attach(registrar.messenger())
    }
    // Meta's SDK (docs/ADS-ATTRIBUTION-PLAN.md §6.5): configured only when Dart starts it.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaMeta") {
      MetaBridge.attach(registrar.messenger())
    }
    // Apple's tracking prompt and SKAdNetwork (D-589): asked by Dart after the first-run pages.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaTracking") {
      TrackingBridge.attach(registrar.messenger())
    }
    // Apple integrations (docs/APPLE-INTEGRATIONS-PLAN.md): Declared Age Range, Document Scanner,
    // AlarmKit, HomeKit, SpeechAnalyzer, Foundation Models and File Provider.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaAgeRange") {
      AgeRangeBridge.shared.attach(messenger: registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaDocumentScanner") {
      DocumentScannerBridge.shared.attach(messenger: registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaAlarmKit") {
      AlarmKitBridge.shared.attach(messenger: registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaHomeKit") {
      HomeKitBridge.shared.attach(messenger: registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaSpeechAnalyzer") {
      SpeechAnalyzerBridge.shared.attach(messenger: registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaOnDeviceModel") {
      OnDeviceModelBridge.shared.attach(messenger: registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaFileProvider") {
      FileProviderBridge.shared.attach(messenger: registrar.messenger())
    }
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CasamaHaptics") {
      HapticsBridge.shared.attach(registrar.messenger())
    }
  }
}

// MARK: - Meta's SDK (docs/ADS-ATTRIBUTION-PLAN.md §6.5). It never starts by itself
// (FacebookAutoInitEnabled is false in Info.plist) and the app id and client token aren't in
// Info.plist: they come from the build's dart-defines (META_APP_ID, META_CLIENT_TOKEN). Dart calls
// `configure` only once every gate is open (official build, Casama Cloud, signed in, the server
// allows it, and Allow in Apple's tracking prompt on this device, D-589); this initializes the SDK, then sets the id and token, which the SDK supports (it
// only logs a warning at init). Done through the Objective-C runtime so the Runner target doesn't
// need to link FBSDKCoreKit itself (it comes with the facebook_app_events plugin).

enum MetaBridge {
  static func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/meta", binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      guard call.method == "configure",
            let args = call.arguments as? [String: Any],
            let appId = args["appId"] as? String, !appId.isEmpty,
            let token = args["clientToken"] as? String, !token.isEmpty
      else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard let delegate = shared("FBSDKApplicationDelegate", "sharedInstance"),
            let settings = shared("FBSDKSettings", "sharedSettings")
      else {
        result(FlutterError(code: "unavailable", message: "Meta's SDK isn't in this build", details: nil))
        return
      }
      let initialize = NSSelectorFromString("initializeSDK")
      guard delegate.responds(to: initialize) else {
        result(FlutterError(code: "unavailable", message: "Meta's SDK can't be initialized", details: nil))
        return
      }
      // Idempotent in the SDK; the plugin's own initializeSdk() then just opens its channel.
      _ = delegate.perform(initialize)
      settings.setValue(appId, forKey: "appID")
      settings.setValue(token, forKey: "clientToken")
      // The link that opened the app before the SDK ran (aggregated measurement needs it); later
      // links reach the SDK through the plugin's own app and scene delegate hooks.
      if let link = args["url"] as? String, let url = URL(string: link) {
        typealias OpenURL = @convention(c) (AnyObject, Selector, AnyObject, AnyObject, AnyObject) -> Bool
        let open = NSSelectorFromString("application:openURL:options:")
        if delegate.responds(to: open), let imp = delegate.method(for: open) {
          _ = unsafeBitCast(imp, to: OpenURL.self)(delegate, open, UIApplication.shared, url as NSURL, NSDictionary())
        }
      }
      result(nil)
    }
  }

  /// A class's shared instance by name, or nil when the class isn't linked.
  private static func shared(_ className: String, _ selectorName: String) -> NSObject? {
    guard let cls = NSClassFromString(className) as? NSObject.Type else { return nil }
    let selector = NSSelectorFromString(selectorName)
    guard cls.responds(to: selector) else { return nil }
    return cls.perform(selector)?.takeUnretainedValue() as? NSObject
  }
}

// MARK: - App Tracking Transparency and SKAdNetwork (D-589, docs/ADS-ATTRIBUTION-PLAN.md §6.5).
// Dart asks once, after the first-run pages and only while the app is active (iOS ignores a request
// otherwise and the status stays "not determined"). Meta's SDK starts only after Allow. Casama shows
// no screen of its own before Apple's prompt. `registerInstall` tells SKAdNetwork about the install
// once, whatever the answer: Apple's private ad measurement, which sends no identifiers.

enum TrackingBridge {
  private static let registeredKey = "casama.skan_registered"

  static func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/tracking", binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "status":
        result(name(ATTrackingManager.trackingAuthorizationStatus))
      case "request":
        guard UIApplication.shared.applicationState == .active else {
          result(name(ATTrackingManager.trackingAuthorizationStatus))
          return
        }
        ATTrackingManager.requestTrackingAuthorization { status in
          DispatchQueue.main.async { result(name(status)) }
        }
      case "openSettings":
        if let url = URL(string: UIApplication.openSettingsURLString) {
          UIApplication.shared.open(url)
        }
        result(nil)
      case "registerInstall":
        registerInstall()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  private static func name(_ status: ATTrackingManager.AuthorizationStatus) -> String {
    switch status {
    case .authorized: return "authorized"
    case .denied: return "denied"
    case .restricted: return "restricted"
    case .notDetermined: return "not_determined"
    @unknown default: return "denied"
    }
  }

  private static func registerInstall() {
    let defaults = UserDefaults.standard
    guard !defaults.bool(forKey: registeredKey) else { return }
    let done: (Error?) -> Void = { error in
      if error == nil { defaults.set(true, forKey: registeredKey) }
    }
    if #available(iOS 16.1, *) {
      SKAdNetwork.updatePostbackConversionValue(0, coarseValue: .low, lockWindow: false, completionHandler: done)
    } else if #available(iOS 15.4, *) {
      SKAdNetwork.updatePostbackConversionValue(0, completionHandler: done)
    } else {
      SKAdNetwork.registerAppForAdNetworkAttribution()
      defaults.set(true, forKey: registeredKey)
    }
  }
}

// MARK: - Call buttons on the lock screen (D-327 §9): the widget's CallActionIntent posts a Darwin
// notification (it runs in the widget's process); this passes it to Flutter as an `action`.

final class CallGlanceBridge {
  static let shared = CallGlanceBridge()
  static let actions = ["mute", "unmute", "end"]
  private var channel: FlutterMethodChannel?
  private var observing = false

  func attach(_ messenger: FlutterBinaryMessenger) {
    channel = FlutterMethodChannel(name: "casama/call_glance", binaryMessenger: messenger)
    guard !observing else { return }
    observing = true
    let center = CFNotificationCenterGetDarwinNotifyCenter()
    for action in CallGlanceBridge.actions {
      CFNotificationCenterAddObserver(
        center, Unmanaged.passUnretained(self).toOpaque(),
        { _, observer, name, _, _ in
          guard let observer, let raw = name?.rawValue as String? else { return }
          let bridge = Unmanaged<CallGlanceBridge>.fromOpaque(observer).takeUnretainedValue()
          let action = String(raw.dropFirst("ai.casama.app.call.".count))
          DispatchQueue.main.async { bridge.send(action) }
        },
        "ai.casama.app.call.\(action)" as CFString, nil, .deliverImmediately)
    }
  }

  private func send(_ action: String) {
    channel?.invokeMethod("action", arguments: ["action": action])
  }
}

// MARK: - Sign-in sheet (D-243): connecting an app signs in through ASWebAuthenticationSession,
// which shares Safari's sign-ins and closes itself when the server sends the browser to
// casama-auth://done. Answers the URL it ended on, nil when the person closed it, or an error.

final class SignInSheet: NSObject, ASWebAuthenticationPresentationContextProviding {
  static let shared = SignInSheet()
  private var session: ASWebAuthenticationSession?

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/sign_in_sheet", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "open", let args = call.arguments as? [String: Any],
            let raw = args["url"] as? String, let url = URL(string: raw),
            let scheme = args["scheme"] as? String else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.open(url, scheme: scheme, result: result)
    }
  }

  private func open(_ url: URL, scheme: String, result: @escaping FlutterResult) {
    session?.cancel()
    let done: ASWebAuthenticationSession.CompletionHandler = { [weak self] back, error in
      DispatchQueue.main.async {
        self?.session = nil
        if let back = back {
          result(back.absoluteString)
        } else if let e = error as? ASWebAuthenticationSessionError, e.code == .canceledLogin {
          result(nil)
        } else {
          result(FlutterError(code: "failed", message: error?.localizedDescription, details: nil))
        }
      }
    }
    let s: ASWebAuthenticationSession
    if #available(iOS 17.4, *) {
      s = ASWebAuthenticationSession(url: url, callback: .customScheme(scheme), completionHandler: done)
    } else {
      s = ASWebAuthenticationSession(url: url, callbackURLScheme: scheme, completionHandler: done)
    }
    s.presentationContextProvider = self
    session = s
    if !s.start() {
      session = nil
      result(FlutterError(code: "failed", message: "The sign-in sheet didn't open", details: nil))
    }
  }

  func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
    let windows = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.flatMap { $0.windows }
    return windows.first { $0.isKeyWindow } ?? windows.first ?? ASPresentationAnchor()
  }
}

// MARK: - Shortcuts (D-111): a path handed to Flutter over the casama/shortcuts channel, queued until
// Flutter is ready. The intents, entities and phrases for Siri, Spotlight and Shortcuts live in
// client/ios/Siri/ (docs/SIRI-AI-PLAN.md), compiled into the iPhone and the Mac app.

/// `casama/notifications` (D-325): the app icon badge, and clearing a chat's delivered
/// notifications (the server sends replies with aps.thread-id = the conversation) once it's open.
///
/// Inline replies (§5.3): each gets an id and waits in UserDefaults until Dart confirms it, so one
/// typed while Casama wasn't running survives until Dart next starts. While Dart works on it a
/// background task keeps the app running and the notification's completion handler waits; both
/// end when Dart answers or when iOS's background time runs out (the reply then stays queued).
///
/// Typed while Casama isn't running, a reply starts the app in the background with no scene, so
/// the app's engine never starts. After a short wait for one, a headless engine runs
/// `inlineReplyMain` (lib/main.dart, lib/core/inline_replies.dart): Dart sends the queue with the
/// saved sign-in and this stops the engine once everything it took is answered. With no
/// connection it stops early and the replies wait for the next start. Native code never calls the
/// server or holds the sign-in itself.
///
/// The app's engine and the headless one can both listen (Casama opened while a reply is being
/// sent). Each reply is held by at most one engine at a time: a take hands over only replies no
/// engine holds, a new reply goes to one listening engine (the app's first), and replies a stopped
/// engine held go back to the queue, to an engine still listening. Only the overlap of an engine
/// stopped mid-send leans on the reply id being the server's idempotency key.
final class NotificationsBridge {
  static let shared = NotificationsBridge()
  private static let pendingKey = "casama.notifications.pending_inline_replies"
  /// How long a reply waits for the app's engine before a headless one starts.
  private static let headlessDelay: TimeInterval = 1.5
  /// The longest a headless engine runs, in case its Dart never answers.
  private static let headlessLimit: TimeInterval = 60

  /// One engine's end of the channel.
  private final class Listener {
    let channel: FlutterMethodChannel
    /// Its Dart has taken the queue, so its inlineReply handler is listening.
    var ready = false
    /// Ids handed to its Dart and not yet answered, so a second take doesn't repeat them.
    var inFlight = Set<String>()

    init(_ channel: FlutterMethodChannel) {
      self.channel = channel
    }
  }

  /// The app's engine (the one with the UI).
  private var app: Listener?
  /// The headless engine's, while it runs.
  private var headless: Listener?
  private var headlessEngine: FlutterEngine?
  /// Keeps the app running while the headless engine does.
  private var headlessTask = UIBackgroundTaskIdentifier.invalid
  private var headlessScheduled = false
  /// Counts headless engines, so the time limit of one never stops a later one.
  private var headlessRun = 0
  /// Replies Dart hasn't confirmed, oldest first.
  private var pending: [[String: String]]
  /// Finishes a reply's wait (its completion handler, its background task), by reply id.
  private var waiting: [String: () -> Void] = [:]

  private init() {
    pending = (UserDefaults.standard.array(forKey: Self.pendingKey) as? [[String: String]]) ?? []
  }

  /// The app's engine. A new one replaces the last: whatever that one held goes back to the queue.
  func attach(_ messenger: FlutterBinaryMessenger) {
    app = listen(on: messenger)
    dispatch()
  }

  private func listen(on messenger: FlutterBinaryMessenger) -> Listener {
    let channel = FlutterMethodChannel(name: "casama/notifications", binaryMessenger: messenger)
    let listener = Listener(channel)
    channel.setMethodCallHandler { [weak self, weak listener] call, result in
      guard let self else {
        result(nil)
        return
      }
      self.handle(call, result, from: listener)
    }
    return listener
  }

  private func handle(_ call: FlutterMethodCall, _ result: @escaping FlutterResult, from listener: Listener?) {
    let args = call.arguments as? [String: Any] ?? [:]
    switch call.method {
    case "badge":
      let count = max(0, (args["count"] as? Int) ?? 0)
      if #available(iOS 16.0, *) {
        UNUserNotificationCenter.current().setBadgeCount(count) { _ in }
      } else {
        UIApplication.shared.applicationIconBadgeNumber = count
      }
      result(nil)
    case "clear":
      guard let conversation = args["conversation_id"] as? String, !conversation.isEmpty else {
        result(nil)
        return
      }
      let center = UNUserNotificationCenter.current()
      center.getDeliveredNotifications { delivered in
        let ids = delivered.filter { $0.request.content.threadIdentifier == conversation }.map { $0.request.identifier }
        if !ids.isEmpty { center.removeDeliveredNotifications(withIdentifiers: ids) }
      }
      result(nil)
    case "takeAction":
      // iOS buttons arrive through Firebase Messaging's tap handler.
      result(nil)
    case "takeInlineReplies":
      // An engine already replaced (or stopped) gets nothing: another one holds the queue now.
      result(listener.map { take(for: $0) } ?? [])
    case "inlineReplyDone":
      if let id = args["id"] as? String { finish(id) }
      result(nil)
    case "stopInlineReplies":
      // The headless engine has no connection: it stops, and what it hadn't answered waits for
      // the next start.
      result(nil)
      if let listener, listener === headless {
        DispatchQueue.main.async { self.stopHeadless() }
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  /// Hands an inline notification text reply to Dart, and calls [completion] once Dart has sent it
  /// (or iOS's background time runs out). Queued until an engine listens; with no app engine on
  /// its way (Casama wasn't running, so iOS connected no scene), a headless one is started for it.
  func deliverReply(botId: String, conversationId: String, text: String, completion: @escaping () -> Void) {
    guard Thread.isMainThread else {
      DispatchQueue.main.async { self.deliverReply(botId: botId, conversationId: conversationId, text: text, completion: completion) }
      return
    }
    let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty, !botId.isEmpty else {
      completion()
      return
    }
    let id = UUID().uuidString.lowercased()
    let payload: [String: String] = [
      "id": id,
      "bot_id": botId,
      "conversation_id": conversationId,
      "text": trimmed,
    ]
    pending.append(payload)
    save()
    var task = UIBackgroundTaskIdentifier.invalid
    var done = false
    let end = { [weak self] in
      guard !done else { return }
      done = true
      self?.waiting[id] = nil
      completion()
      if task != .invalid {
        UIApplication.shared.endBackgroundTask(task)
        task = .invalid
      }
    }
    waiting[id] = end
    task = UIApplication.shared.beginBackgroundTask(withName: "casama.inline-reply") { end() }
    dispatch()
    if !held(id) { scheduleHeadless() }
  }

  /// Whether an engine's Dart has the reply and hasn't answered yet.
  private func held(_ id: String) -> Bool {
    app?.inFlight.contains(id) == true || headless?.inFlight.contains(id) == true
  }

  /// Hands every queued reply no engine holds to a listening engine, the app's before the headless
  /// one. With none listening they wait for the next take.
  private func dispatch() {
    guard let target = [app, headless].compactMap({ $0 }).first(where: { $0.ready }) else { return }
    for reply in pending where !held(reply["id"] ?? "") {
      send(reply, to: target)
    }
  }

  private func send(_ payload: [String: String], to listener: Listener) {
    guard let id = payload["id"] else { return }
    listener.inFlight.insert(id)
    listener.channel.invokeMethod("inlineReply", arguments: payload) { [weak self, weak listener] answer in
      guard let self else { return }
      if (answer as? NSObject) === FlutterMethodNotImplemented {
        // That engine's Dart handler is gone (its Dart restarted): the reply goes back for the
        // next take, or to the other engine if it listens.
        listener?.inFlight.remove(id)
        listener?.ready = false
        self.dispatch()
        return
      }
      if (answer as? String) == "later" {
        // The headless engine has no connection: the reply stays queued for the next start and
        // that engine stops (it asks to as well, with stopInlineReplies).
        listener?.inFlight.remove(id)
        listener?.ready = false
        if let listener, listener === self.headless {
          DispatchQueue.main.async { self.stopHeadless() }
        }
        return
      }
      // Sent, or Dart gave up on it (signed out, refused): either way it's done.
      self.finish(id)
    }
  }

  /// A take: the replies no engine holds go to this one, which now listens for new ones.
  private func take(for listener: Listener) -> [[String: String]] {
    listener.ready = true
    let fresh = pending.filter { !held($0["id"] ?? "") }
    for reply in fresh { if let id = reply["id"] { listener.inFlight.insert(id) } }
    // A headless engine that found nothing to send (the app's engine took it all) stops.
    if listener === headless {
      DispatchQueue.main.async { self.stopHeadlessIfIdle() }
    }
    return fresh
  }

  private func finish(_ id: String) {
    app?.inFlight.remove(id)
    headless?.inFlight.remove(id)
    pending.removeAll { $0["id"] == id }
    save()
    waiting[id]?()
    if headless != nil {
      // After this call has returned to Dart: the engine isn't stopped inside its own call.
      DispatchQueue.main.async { self.stopHeadlessIfIdle() }
    }
  }

  // MARK: The headless engine

  /// Gives an app engine that may be starting (the person opened Casama right after replying) a
  /// moment to take the reply, then starts the headless engine if it's still needed.
  private func scheduleHeadless() {
    guard headlessEngine == nil, !headlessScheduled else { return }
    headlessScheduled = true
    DispatchQueue.main.asyncAfter(deadline: .now() + Self.headlessDelay) { [weak self] in
      guard let self else { return }
      self.headlessScheduled = false
      self.startHeadless()
    }
  }

  /// Starts the headless engine when a reply waits with nobody to send it: no engine listening
  /// and no scene connected, so no app engine running or on its way. Never while an app engine
  /// runs: registering the plugins on a second engine moves channels some of them keep once per
  /// app (Firebase Messaging's) to it, and the app's engine would lose them when it stops.
  private func startHeadless() {
    guard headlessEngine == nil,
          pending.contains(where: { !held($0["id"] ?? "") }),
          app?.ready != true,
          UIApplication.shared.connectedScenes.isEmpty
    else { return }
    let engine = FlutterEngine(name: "casama-inline-replies", project: nil, allowHeadlessExecution: true)
    guard engine.run(withEntrypoint: "inlineReplyMain") else { return }
    // Before Dart can call anything: its first message reaches this thread after this returns.
    GeneratedPluginRegistrant.register(with: engine)
    guard let registrar = engine.registrar(forPlugin: "CasamaNotifications") else {
      engine.destroyContext()
      return
    }
    headless = listen(on: registrar.messenger())
    headlessEngine = engine
    headlessRun += 1
    let run = headlessRun
    headlessTask = UIApplication.shared.beginBackgroundTask(withName: "casama.inline-reply-engine") { [weak self] in
      self?.stopHeadless()
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + Self.headlessLimit) { [weak self] in
      guard let self, self.headlessRun == run else { return }
      self.stopHeadless()
    }
  }

  /// Stops the headless engine once its Dart has taken the queue and answered everything it held.
  private func stopHeadlessIfIdle() {
    guard let listener = headless, listener.ready else { return }
    // A reply nobody holds goes to an engine first (none should be left, but never strand one).
    dispatch()
    if listener.inFlight.isEmpty { stopHeadless() }
  }

  /// Stops the headless engine (idle, out of time, or no connection). Replies it hadn't answered
  /// stay queued: they go to the app's engine if that one listens, else they wait for the next
  /// start, and their waits end so iOS can suspend the app.
  private func stopHeadless() {
    if let engine = headlessEngine {
      headless?.channel.setMethodCallHandler(nil)
      headless = nil
      headlessEngine = nil
      engine.destroyContext()
    }
    if headlessTask != .invalid {
      UIApplication.shared.endBackgroundTask(headlessTask)
      headlessTask = .invalid
    }
    dispatch()
    guard app?.ready != true else { return }
    for reply in pending {
      if let id = reply["id"], !held(id) { waiting[id]?() }
    }
  }

  private func save() {
    if pending.isEmpty {
      UserDefaults.standard.removeObject(forKey: Self.pendingKey)
    } else {
      UserDefaults.standard.set(pending, forKey: Self.pendingKey)
    }
  }
}

/// Handoff from a Mac or iPad viewing a bot or chat (docs/APPLE-INTEGRATIONS-PLAN.md §6.10): opens
/// the same place here. Answers whether the activity was Casama's.
enum Handoff {
  static let viewingType = "ai.casama.app.viewing"

  static func open(_ activity: NSUserActivity) -> Bool {
    guard let path = path(for: activity) else { return false }
    ShortcutBridge.shared.open(path)
    return true
  }

  static func path(for activity: NSUserActivity) -> String? {
    guard activity.activityType == viewingType,
          let info = activity.userInfo,
          let kind = info["kind"] as? String,
          let id = info["id"] as? String
    else { return nil }
    let botId = (info["bot_id"] as? String) ?? (kind == "bot" ? id : "")
    if kind == "chat" && !botId.isEmpty { return "/bots/\(botId)/chat?c=\(id)" }
    return botId.isEmpty ? "/bots" : "/bots/\(botId)/chat"
  }
}

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
        } else if #available(iOS 16.0, *) {
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

// MARK: - casama/permissions (D-376): what no plugin the app uses covers on iOS: the camera,
// photos, the microphone, speech recognition and "Always" location, checked without prompting and
// asked for when the person taps Turn on. `check {ids}` → {id: state}; `request {id}` → state afterwards.

final class PermissionsBridge {
  static let shared = PermissionsBridge()
  private var channel: FlutterMethodChannel?

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/permissions", binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      let args = call.arguments as? [String: Any] ?? [:]
      switch call.method {
      case "check":
        let ids = args["ids"] as? [String] ?? []
        var out: [String: String] = [:]
        for id in ids { out[id] = PermissionsBridge.state(id) }
        result(out)
      case "request":
        guard let id = args["id"] as? String else {
          return result(FlutterError(code: "bad_args", message: "id is needed", details: nil))
        }
        PermissionsBridge.request(id) { state in DispatchQueue.main.async { result(state) } }
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  private static func av(_ s: AVAuthorizationStatus) -> String {
    switch s {
    case .authorized: return "granted"
    case .denied: return "denied"
    case .restricted: return "restricted"
    case .notDetermined: return "not_asked"
    @unknown default: return "unknown"
    }
  }

  static func state(_ id: String) -> String {
    switch id {
    case "camera":
      return av(AVCaptureDevice.authorizationStatus(for: .video))
    case "microphone":
      return av(AVCaptureDevice.authorizationStatus(for: .audio))
    case "photos":
      switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
      case .authorized: return "granted"
      case .limited: return "limited"
      case .denied: return "denied"
      case .restricted: return "restricted"
      case .notDetermined: return "not_asked"
      @unknown default: return "unknown"
      }
    case "speech":
      switch SFSpeechRecognizer.authorizationStatus() {
      case .authorized: return "granted"
      case .denied: return "denied"
      case .restricted: return "restricted"
      case .notDetermined: return "not_asked"
      @unknown default: return "unknown"
      }
    case "location_always":
      return AlwaysLocationAsk.state()
    default:
      return "unknown"
    }
  }

  static func request(_ id: String, done: @escaping (String) -> Void) {
    switch id {
    case "camera":
      AVCaptureDevice.requestAccess(for: .video) { _ in done(state(id)) }
    case "microphone":
      AVCaptureDevice.requestAccess(for: .audio) { _ in done(state(id)) }
    case "photos":
      PHPhotoLibrary.requestAuthorization(for: .readWrite) { _ in done(state(id)) }
    case "speech":
      SFSpeechRecognizer.requestAuthorization { _ in done(state(id)) }
    case "location_always":
      DispatchQueue.main.async { AlwaysLocationAsk.start { done(state(id)) } }
    default:
      done(state(id))
    }
  }
}

/// "Always" location. The geolocator plugin returns at once when any location access exists, so it
/// never asks to go from "While using" to "Always"; this does. iOS shows that upgrade prompt once:
/// after it, "While using" means the person kept it, and the switch is in Casama's Settings page.
final class AlwaysLocationAsk: NSObject, CLLocationManagerDelegate {
  private static let askedKey = "casama.permissions.locationAlwaysAsked"
  private static var current: AlwaysLocationAsk?

  private let manager = CLLocationManager()
  private var done: (() -> Void)?
  private var promptShown = false
  private var observers: [NSObjectProtocol] = []

  static func state() -> String {
    switch CLLocationManager().authorizationStatus {
    case .authorizedAlways: return "granted"
    case .authorizedWhenInUse: return UserDefaults.standard.bool(forKey: askedKey) ? "denied" : "not_asked"
    case .denied: return "denied"
    case .restricted: return "restricted"
    case .notDetermined: return "not_asked"
    @unknown default: return "unknown"
    }
  }

  /// Asks, then calls [done] once the prompt is answered, or soon when iOS shows none.
  static func start(_ done: @escaping () -> Void) {
    current?.finish()
    let ask = AlwaysLocationAsk()
    current = ask
    ask.run(done)
  }

  private func run(_ done: @escaping () -> Void) {
    self.done = done
    // Only the upgrade from "While using" uses up iOS's one prompt; a first ask gets "While using"
    // (with provisional "Always") and may still be upgraded later.
    if manager.authorizationStatus == .authorizedWhenInUse {
      UserDefaults.standard.set(true, forKey: AlwaysLocationAsk.askedKey)
    }
    let center = NotificationCenter.default
    observers.append(center.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { [weak self] _ in
      self?.promptShown = true
    })
    observers.append(center.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { [weak self] _ in
      guard let self, self.promptShown else { return }
      // The status change lands just after the prompt closes.
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { self.finish() }
    })
    manager.delegate = self
    manager.requestAlwaysAuthorization()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
      guard let self, !self.promptShown else { return }
      self.finish()
    }
  }

  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {}

  private func finish() {
    guard let done else { return }
    self.done = nil
    for o in observers { NotificationCenter.default.removeObserver(o) }
    observers = []
    manager.delegate = nil
    if AlwaysLocationAsk.current === self { AlwaysLocationAsk.current = nil }
    done()
  }
}

// MARK: - The fold (D-411): an iPhone Duo's hinge, fold and status area, for lib/core/fold/fold.dart.
// Flutter doesn't report them on iOS yet (flutter/flutter#193025). Everything here is iOS 27.1 and
// later; before that, and on an iPhone without a hinge, the stream stays silent and the app lays
// itself out as on any iPhone.

final class FoldBridge: NSObject, FlutterStreamHandler {
  static let shared = FoldBridge()

  private var sink: FlutterEventSink?
  private var last: [String: Any]?
  private weak var probe: UIView?

  func attach(_ messenger: FlutterBinaryMessenger) {
    FlutterEventChannel(name: "casama/fold", binaryMessenger: messenger).setStreamHandler(self)
  }

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    sink = events
    last = nil
    install(tries: 40)
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    sink = nil
    return nil
  }

  /// The view Flutter draws in. It may not be on screen yet when Dart first listens.
  static var flutterView: UIView? {
    for scene in UIApplication.shared.connectedScenes {
      guard let windowScene = scene as? UIWindowScene else { continue }
      for window in windowScene.windows {
        if let controller = window.rootViewController as? FlutterViewController, controller.isViewLoaded {
          return controller.view
        }
      }
    }
    return nil
  }

  private func install(tries: Int) {
    guard #available(iOS 27.1, *) else { return }
    if let probe {
      probe.setNeedsLayout()
      return
    }
    guard let host = FoldBridge.flutterView else {
      if tries > 0 {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in self?.install(tries: tries - 1) }
      }
      return
    }
    let view = FoldProbe(frame: host.bounds)
    view.report = { [weak self] values in self?.send(values) }
    host.addSubview(view)
    probe = view
  }

  private func send(_ values: [String: Any]) {
    guard let sink else { return }
    if let last {
      // The hinge reports its angle many times a second while it moves. Only the angle changing
      // by less than two degrees is not news.
      var a = last, b = values
      let moved = abs(((a.removeValue(forKey: "angle") as? Double) ?? 0) - ((b.removeValue(forKey: "angle") as? Double) ?? 0))
      if moved < 2, NSDictionary(dictionary: a).isEqual(to: b) { return }
    }
    last = values
    sink(values)
  }
}

/// An invisible view over Flutter's that reads the hinge, the regions iOS reserves and the side of
/// the vertical bar. The fold lags the hinge by up to a second, and UIKit lays a view out again
/// when a region it read during layout changes, so the regions are read in `layoutSubviews`.
@available(iOS 27.1, *)
private final class FoldProbe: UIView {
  var report: (([String: Any]) -> Void)?
  private var hinge: UIHinge?

  override init(frame: CGRect) {
    super.init(frame: frame)
    isUserInteractionEnabled = false
    isAccessibilityElement = false
    backgroundColor = .clear
    isOpaque = false
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addInteraction(
      UIHingeInteraction { [weak self] _, update in
        self?.hinge = update.hinge
        self?.setNeedsLayout()
        self?.read()
      })
    registerForTraitChanges(UITraitCollection.systemTraitsAffectingVerticalBarEdge) { (view: FoldProbe, _: UITraitCollection) in
      view.read()
    }
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    return nil
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    read()
  }

  override func safeAreaInsetsDidChange() {
    super.safeAreaInsetsDidChange()
    read()
  }

  private func numbers(_ r: CGRect) -> [Double] {
    [Double(r.minX), Double(r.minY), Double(r.width), Double(r.height)]
  }

  private func word(_ status: UIHinge.Status) -> String {
    switch status {
    case .closed: return "closed"
    case .partiallyOpen: return "partlyOpen"
    case .fullyOpen: return "open"
    default: return "unknown"
    }
  }

  /// The vertical bar follows the hardware, so it is reported as a side of the screen.
  private var barSide: String {
    let rightToLeft = effectiveUserInterfaceLayoutDirection == .rightToLeft
    switch traitCollection.verticalBarEdge {
    case .leading: return rightToLeft ? "right" : "left"
    case .trailing: return rightToLeft ? "left" : "right"
    default: return "none"
    }
  }

  func read() {
    // No hinge: an ordinary iPhone. Nothing is sent, and Dart keeps "no fold".
    guard let hinge else { return }
    var values: [String: Any] = [
      "hinge": word(hinge.status),
      "angle": Double(hinge.angle) * 180 / Double.pi,
      "bar": barSide,
      "foldActive": false,
    ]
    if let fold = reservedRegions(kind: .division, options: [.includeInactive]).first {
      values["fold"] = numbers(fold.frame)
      values["foldActive"] = fold.isActive
    }
    values["cameras"] = reservedRegions(kind: .occlusion).filter { $0.isActive }.map { numbers($0.frame) }
    if let scene = window?.windowScene {
      values["fullScreen"] = scene.isFullScreen
      if let status = scene.statusBarManager?.statusBarFrame, !status.isEmpty {
        values["status"] = numbers(convert(status, from: nil))
      }
    }
    report?(values)
  }
}

// MARK: - Dropped files (D-411): beside another app (Split View on an iPhone Duo or an iPad), a
// file, a photo or text dragged onto Casama goes to the chat on screen. Dart says when there is
// one (lib/core/dropped_files.dart); without one the drop is refused.

final class DropBridge: NSObject, UIDropInteractionDelegate {
  static let shared = DropBridge()

  private var channel: FlutterMethodChannel?
  private var accepting = false
  private var installed = false

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/drop", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "accept", let on = call.arguments as? Bool else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.accepting = on
      self?.install()
      result(nil)
    }
    self.channel = channel
  }

  private func install() {
    guard !installed, let host = FoldBridge.flutterView else { return }
    host.addInteraction(UIDropInteraction(delegate: self))
    installed = true
  }

  func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
    accepting
  }

  func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
    UIDropProposal(operation: accepting ? .copy : .forbidden)
  }

  func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
    let folder = FileManager.default.temporaryDirectory.appendingPathComponent("dropped/\(UUID().uuidString)", isDirectory: true)
    try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let group = DispatchGroup()
    let lock = NSLock()
    var files: [String] = []
    var texts: [String] = []
    for item in session.items {
      let provider = item.itemProvider
      // Plain text and links become text in the message; everything else is a file.
      let isText = provider.hasItemConformingToTypeIdentifier("public.plain-text") || provider.hasItemConformingToTypeIdentifier("public.url")
      let isFile = provider.hasItemConformingToTypeIdentifier("public.file-url") || !isText
      if isFile, let type = provider.registeredTypeIdentifiers.first(where: { $0 != "public.file-url" }) ?? provider.registeredTypeIdentifiers.first {
        group.enter()
        provider.loadFileRepresentation(forTypeIdentifier: type) { url, _ in
          defer { group.leave() }
          guard let url else { return }
          var name = provider.suggestedName ?? url.lastPathComponent
          if !name.contains("."), !url.pathExtension.isEmpty { name += ".\(url.pathExtension)" }
          let to = folder.appendingPathComponent(name)
          // The file iOS hands over is deleted when this block returns, so it is copied now.
          if (try? FileManager.default.copyItem(at: url, to: to)) != nil {
            lock.lock()
            files.append(to.path)
            lock.unlock()
          }
        }
      } else if provider.canLoadObject(ofClass: NSString.self) {
        group.enter()
        _ = provider.loadObject(ofClass: NSString.self) { text, _ in
          defer { group.leave() }
          if let text = text as? String {
            lock.lock()
            texts.append(text)
            lock.unlock()
          }
        }
      }
    }
    group.notify(queue: .main) { [weak self] in
      self?.channel?.invokeMethod("dropped", arguments: ["files": files, "text": texts.joined(separator: "\n")])
    }
  }
}

// MARK: - The phone browser (docs/PHONE-BROWSER-PLAN.md): one WKWebView a bot can drive while the
// person watches. The contract with Dart is client/lib/features/app_browser/PROTOCOL.md §3.
//
// - Its own data store, so its cookies and storage are apart from everything else (iOS 17+).
// - The page script (assets/app_browser/page_agent.js) runs in its own content world, in every
//   frame, from document start; commands go to it with callAsyncJavaScript in that world.
// - Dart decides every main-frame navigation before it loads, and again where it lands.
// - Script-made clicks only: iOS has no public way to send a real touch into a web view.

#if CASAMA_APP_BROWSER
final class AppBrowser: NSObject, WKNavigationDelegate, WKUIDelegate, FlutterPlatformViewFactory, UIGestureRecognizerDelegate {
  static let shared = AppBrowser()
  /// A fixed id for the bots' own cookie jar.
  private static let store = UUID(uuidString: "6B0F4C1E-5C0A-4A7E-9C2B-CA5A3A0B0751")!
  private var channel: FlutterMethodChannel?
  private var registrar: FlutterPluginRegistrar?
  private var web: WKWebView?

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
  /// view on an iPad, APP-BROWSER-PANEL-PLAN §3), else it waits behind the app.
  private var holders: [WeakHolder] = []
  private var holder: UIView? { holders.last?.view }
  private var dialog: ((Bool, String?) -> Void)?

  private var world: WKContentWorld { WKContentWorld.world(name: "casama") }

  func attach(_ registrar: FlutterPluginRegistrar) {
    self.registrar = registrar
    let channel = FlutterMethodChannel(name: "casama/app_browser", binaryMessenger: registrar.messenger())
    channel.setMethodCallHandler { [weak self] call, result in self?.handle(call, result) }
    self.channel = channel
    registrar.register(self, withId: "casama/app_browser_view")
  }

  private var unsupported: String? {
    if #available(iOS 17.0, *) { return nil }
    return "needs_ios_17"
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
      guard let w = view() else { return result(FlutterError(code: "unsupported", message: unsupported, details: nil)) }
      approved.insert(raw)
      w.load(URLRequest(url: url))
      result(nil)
    case "command":
      command(args["json"] as? String ?? "{}", timeoutMs: args["timeout_ms"] as? Int ?? 30_000, result)
    case "screenshot":
      guard let w = web else { return result(FlutterError(code: "no_page", message: "No page is open", details: nil)) }
      if w.window == nil { park(w) }
      let quality = CGFloat(min(95, max(30, args["quality"] as? Int ?? 70))) / 100
      let config = WKSnapshotConfiguration()
      // Half size is plenty for a model and for the small card.
      config.snapshotWidth = NSNumber(value: Double(max(1, w.bounds.width / 2)))
      w.takeSnapshot(with: config) { image, error in
        guard let data = image?.jpegData(compressionQuality: quality) else {
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
    case "stop": web?.stopLoading(); result(nil)
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
      // "tap" included: there are no real taps on iOS (supported says realTaps false).
      result(FlutterMethodNotImplemented)
    }
  }

  /// The one web view, made on first use. Nil before iOS 17.
  private func view() -> WKWebView? {
    if let web = web { return web }
    guard #available(iOS 17.0, *), let registrar = registrar else { return nil }
    let config = WKWebViewConfiguration()
    config.websiteDataStore = WKWebsiteDataStore(forIdentifier: AppBrowser.store)
    config.mediaTypesRequiringUserActionForPlayback = .all
    config.preferences.javaScriptCanOpenWindowsAutomatically = false
    let key = registrar.lookupKey(forAsset: "assets/app_browser/page_agent.js")
    if let path = Bundle.main.path(forResource: key, ofType: nil), let source = try? String(contentsOfFile: path, encoding: .utf8) {
      // A secret the frames of one page share, so only our script (never the page's) can connect
      // a frame's part of the script to the top one. New for every web view.
      let secret = "globalThis.__casamaPageAgentConfig={secret:\"\(UUID().uuidString)\"};\n"
      config.userContentController.addUserScript(
        WKUserScript(source: secret + source, injectionTime: .atDocumentStart, forMainFrameOnly: false, in: world))
    }
    let w = WKWebView(frame: holder?.bounds ?? UIScreen.main.bounds, configuration: config)
    w.navigationDelegate = self
    w.uiDelegate = self
    w.allowsBackForwardNavigationGestures = true
    #if DEBUG
    if #available(iOS 16.4, *) { w.isInspectable = true }
    #endif
    // Says when a real finger touches the page (so the bot pauses); it never takes the touch.
    let touch = TouchWatcher(target: self, action: #selector(touched))
    touch.cancelsTouchesInView = false
    touch.delaysTouchesBegan = false
    touch.delaysTouchesEnded = false
    touch.delegate = self
    w.addGestureRecognizer(touch)
    web = w
    watchAddress(w)
    if let holder = holder { put(w, into: holder) } else { park(w) }
    return w
  }

  /// With no screen showing it, the page waits behind the app's own view at full size. A web view
  /// outside a window has no size, lays pages out at 0 x 0 and can't be pictured for the chat card.
  private func park(_ w: WKWebView) {
    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    let windows = scenes.flatMap { $0.windows }
    guard let window = windows.first(where: { $0.isKeyWindow }) ?? windows.first else { return }
    w.removeFromSuperview()
    w.frame = window.bounds
    w.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    w.accessibilityElementsHidden = true
    window.insertSubview(w, at: 0)
  }

  /// The screen that showed the page closed: the page goes back behind the app.
  /// A frame joined the window. A page parked while its newest frame wasn't in a window yet (a
  /// screenshot can't wait for that) goes back into it.
  fileprivate func boxShown(_ container: UIView) {
    guard let w = web, container === holder, w.superview !== container else { return }
    put(w, into: container)
  }

  fileprivate func boxClosed(_ container: UIView) {
    holders.removeAll { $0.view == nil || $0.view === container }
    guard let w = web, w.superview === container else { return }
    if let next = holder { put(w, into: next) } else { park(w) }
  }

  @objc private func touched() {}

  func gestureRecognizer(_ g: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith other: UIGestureRecognizer) -> Bool { true }

  fileprivate func fingerDown() { channel?.invokeMethod("userTouched", arguments: nil) }

  private func put(_ w: UIView, into holder: UIView) {
    w.removeFromSuperview()
    w.frame = holder.bounds
    w.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    w.accessibilityElementsHidden = false
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

  /// Addresses Dart already allowed, each good for one load.
  private var approved = Set<String>()

  private func ask(_ method: String, _ args: [String: Any], _ done: @escaping (Bool) -> Void) {
    guard let channel = channel else { return done(false) }
    channel.invokeMethod(method, arguments: args) { answer in done((answer as? Bool) == true) }
  }

  func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    // Frames inside a page follow the page; only the page's own address is decided.
    guard action.targetFrame?.isMainFrame ?? true, let url = action.request.url else { return decisionHandler(.allow) }
    let raw = url.absoluteString
    if raw == "about:blank" || approved.remove(raw) != nil { return decisionHandler(.allow) }
    let user = action.navigationType == .linkActivated || action.navigationType == .formSubmitted
    ask("navigate", ["url": raw, "redirect": action.navigationType == .other, "user": user]) { ok in
      decisionHandler(ok ? .allow : .cancel)
    }
  }

  /// A link that wants a new window loads in this one: there is one page.
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
    // Where the page really landed, after redirects.
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
    channel?.invokeMethod("gone", arguments: ["reason": "killed"])
  }

  // MARK: Dialogs (Dart answers with answerDialog, or dismisses after 30 seconds)

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
    // The backstop: a completion handler that is never called crashes the web view.
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
    guard #available(iOS 17.0, *) else { return done() }
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
    dialog?(false, nil)
    dialog = nil
    approved.removeAll()
    web?.stopLoading()
    web?.removeFromSuperview()
    addressWatch = []
    web = nil
  }

  // MARK: The view

  func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
    let box = AppBrowserBox(frame: frame)
    holders.removeAll { $0.view == nil }
    holders.append(WeakHolder(box.container))
    if let w = view() { put(w, into: box.container) }
    return box
  }
}

private final class WeakHolder {
  weak var view: UIView?
  init(_ view: UIView) { self.view = view }
}

private final class AppBrowserIOSContainer: UIView {
  override func didMoveToWindow() {
    super.didMoveToWindow()
    if window != nil { AppBrowser.shared.boxShown(self) }
  }
}

/// The frame a screen shows the page in. The page outlives it: the web view moves to the next one.
private final class AppBrowserBox: NSObject, FlutterPlatformView {
  let container: UIView
  init(frame: CGRect) {
    container = AppBrowserIOSContainer(frame: frame)
    container.clipsToBounds = true
  }
  deinit { AppBrowser.shared.boxClosed(container) }
  func view() -> UIView { container }
}

/// Notices a finger going down on the page, then steps aside so the page gets the touch.
private final class TouchWatcher: UIGestureRecognizer {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
    AppBrowser.shared.fingerDown()
    state = .failed
  }
}
#endif
