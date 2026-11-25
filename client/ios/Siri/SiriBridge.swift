import AppIntents
import CoreSpotlight
import Foundation
#if os(iOS)
import Flutter
import UIKit
#else
import FlutterMacOS
import AppKit
#endif

// MARK: - Siri acting through the app (docs/SIRI-AI-PLAN.md §6.1, decision 1)
//
// Compiled into the iPhone and the Mac app. An App Intent runs in the app's process (iOS starts
// the app in the background if it isn't running); it hands a small map to Dart over `casama/siri`
// and waits for the answer. Dart acts as the signed-in person with every check the app makes, so
// no key that can act lives in native code. Dart's side: client/lib/features/siri/siri_bridge.dart.
//
// Dart → native: `ready`, `index` (Spotlight, Phase 2), `screen` (what is on screen), `donate`.
// Native → Dart: `ask`, `run`, `needs`, `ping`.

final class SiriBridge {
  static let shared = SiriBridge()

  /// How long an intent waits for Dart to come up after iOS started the app for it (§6.1).
  static let readyTimeout: TimeInterval = 10

  /// How long Dart may wait for a bot's reply before Siri hears "still working" (§6.2). Phase 0
  /// measures Siri's real limit on a phone; this becomes that, less a margin.
  static let askWaitMs = 20_000

  private var channel: FlutterMethodChannel?
  /// Dart said `ready` since launch.
  private(set) var ready = false
  /// When Dart said `ready`, for Phase 0's timing.
  private(set) var readyAt: Date?

  func attach(_ messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "casama/siri", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      guard let self = self else { return result(nil) }
      let args = call.arguments as? [String: Any]
      switch call.method {
      case "ready":
        self.ready = true
        if self.readyAt == nil { self.readyAt = Date() }
        SiriProbeLog.add("dart ready after \(SiriProbeLog.processAge()) s of process time")
        result(nil)
      case "index":
        if #available(iOS 18.0, macOS 15.0, *) {
          Task { await SiriIndex.apply(args ?? [:]) }
        }
        result(nil)
      case "screen":
        SiriScreen.set(args)
        result(nil)
      case "donate":
        if let args = args { SiriDonations.donate(args) }
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  /// Waits for Dart (up to [readyTimeout]), then sends [method] and returns Dart's answer. Nil
  /// when Dart didn't come up in time or didn't answer: the intent then opens the app.
  @MainActor
  func call(_ method: String, _ args: [String: Any] = [:]) async -> [String: Any]? {
    let start = Date()
    while !ready && Date().timeIntervalSince(start) < Self.readyTimeout {
      try? await Task.sleep(nanoseconds: 100_000_000)
    }
    guard ready, let channel = channel else {
      SiriProbeLog.add("\(method): Dart not ready after \(Int(Date().timeIntervalSince(start))) s")
      return nil
    }
    return await withCheckedContinuation { c in
      channel.invokeMethod(method, arguments: args) { value in
        c.resume(returning: value as? [String: Any])
      }
    }
  }
}

/// The bots, routines and chats the app lists for the intents (`flutter.casama.shortcuts`,
/// written by client/lib/core/shortcuts.dart): ids, names, and for chats the bot. Read in the
/// app's process, so it stays in the app's own preferences.
struct ShortcutItem: Codable {
  let id: String
  let name: String
  let detail: String?
  let bot_id: String?
}

enum ShortcutStore {
  static func items(_ key: String) -> [ShortcutItem] {
    guard let raw = UserDefaults.standard.string(forKey: "flutter.casama.shortcuts"),
          let data = raw.data(using: .utf8),
          let all = try? JSONDecoder().decode([String: [ShortcutItem]].self, from: data) else { return [] }
    return all[key] ?? []
  }

  static func from(_ list: Any?) -> [ShortcutItem] {
    guard let rows = list as? [[String: Any]] else { return [] }
    return rows.compactMap { r in
      guard let id = r["id"] as? String, let name = r["name"] as? String else { return nil }
      return ShortcutItem(id: id, name: name, detail: r["detail"] as? String, bot_id: r["bot_id"] as? String)
    }
  }
}

// MARK: - Spotlight (Phase 2, §6.4): names and titles only, on this device.

@available(iOS 18.0, macOS 15.0, *)
enum SiriIndex {
  /// Replaces what Spotlight holds with [list] (`bots`, `routines`, `chats`); empty lists clear it.
  static func apply(_ list: [String: Any]) async {
    let index = CSSearchableIndex.default()
    let bots = ShortcutStore.from(list["bots"]).map { BotEntity(id: $0.id, name: $0.name) }
    let routines = ShortcutStore.from(list["routines"]).map { RoutineEntity(id: $0.id, name: $0.name, bot: $0.detail ?? "") }
    let chats = ShortcutStore.from(list["chats"]).map { ChatEntity(id: $0.id, name: $0.name, bot: $0.detail ?? "", botId: $0.bot_id ?? "") }
    // From iOS 27 bots and chats go in as Messages people and conversations (below) instead, so
    // each shows once in Spotlight.
    var schemas = false
    if #available(iOS 27.0, macOS 27.0, *) { schemas = true }
    do {
      try await index.deleteAppEntities(ofType: BotEntity.self)
      try await index.deleteAppEntities(ofType: RoutineEntity.self)
      try await index.deleteAppEntities(ofType: ChatEntity.self)
      if !bots.isEmpty && !schemas { try await index.indexAppEntities(bots) }
      if !routines.isEmpty { try await index.indexAppEntities(routines) }
      if !chats.isEmpty && !schemas { try await index.indexAppEntities(chats) }
      if #available(iOS 27.0, macOS 27.0, *) {
        // Phase 3: bots and chats as Messages people and conversations, so Siri knows a bot's
        // name as someone in Casama instead of reaching for the closest contact.
        let people = ShortcutStore.from(list["bots"]).map { BotPersonEntity(id: $0.id, name: $0.name) }
        let conversations = ShortcutStore.from(list["chats"]).map(BotConversationEntity.init(item:))
        try await index.deleteAppEntities(ofType: BotPersonEntity.self)
        try await index.deleteAppEntities(ofType: BotConversationEntity.self)
        if !people.isEmpty { try await index.indexAppEntities(people) }
        if !conversations.isEmpty { try await index.indexAppEntities(conversations) }
        SiriProbeLog.add("indexed \(people.count) bot people, \(conversations.count) conversations")
      }
    } catch {
      SiriProbeLog.add("index failed: \(error.localizedDescription)")
    }
  }
}

// MARK: - What is on screen (Phase 2, §6.5): one entity on an NSUserActivity.

enum SiriScreen {
  private static var activity: NSUserActivity?

  /// [screen]: `kind` (`bot` or `chat`), `id`, `bot_id`; nil when neither is open.
  static func set(_ screen: [String: Any]?) {
    guard #available(iOS 18.2, macOS 15.2, *) else { return }
    activity?.invalidate()
    activity = nil
    guard let screen = screen, let kind = screen["kind"] as? String, let id = screen["id"] as? String else {
      attach(nil)
      return
    }
    let a = NSUserActivity(activityType: "ai.casama.app.viewing")
    switch kind {
    case "chat":
      let item = ShortcutStore.items("chats").first { $0.id == id }
      a.title = item?.name
      a.appEntityIdentifier = EntityIdentifier(for: ChatEntity.self, identifier: id)
    case "bot":
      let item = ShortcutStore.items("bots").first { $0.id == id }
      a.title = item?.name
      a.appEntityIdentifier = EntityIdentifier(for: BotEntity.self, identifier: id)
    default:
      attach(nil)
      return
    }
    a.isEligibleForSearch = false
    #if os(iOS)
    a.isEligibleForPrediction = false
    #endif
    activity = a
    attach(a)
  }

  private static func attach(_ a: NSUserActivity?) {
    #if os(iOS)
    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    for scene in scenes {
      scene.windows.first { $0.isKeyWindow }?.rootViewController?.userActivity = a
    }
    #else
    NSApplication.shared.mainWindow?.contentViewController?.userActivity = a
    #endif
    a?.becomeCurrent()
  }
}

// MARK: - Donations (Phase 2, §6.6): what the person did by hand, so Siri can suggest it.

enum SiriDonations {
  static func donate(_ what: [String: Any]) {
    guard #available(iOS 16.0, macOS 13.0, *) else { return }
    switch what["kind"] as? String {
    case "ask":
      guard let botId = what["bot_id"] as? String,
            let item = ShortcutStore.items("bots").first(where: { $0.id == botId }) else { return }
      let intent = AskBotIntent()
      intent.bot = BotEntity(id: item.id, name: item.name)
      Task { _ = try? await intent.donate() }
    case "run":
      guard let id = what["routine_id"] as? String,
            let item = ShortcutStore.items("routines").first(where: { $0.id == id }) else { return }
      let intent = RunRoutineIntent()
      intent.routine = RoutineEntity(id: item.id, name: item.name, bot: item.detail ?? "")
      Task { _ = try? await intent.donate() }
    default:
      return
    }
  }
}
