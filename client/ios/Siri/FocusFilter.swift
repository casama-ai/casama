import AppIntents
import Foundation

/// Focus Filter intent (docs/APPLE-INTEGRATIONS-PLAN.md §6.1).
/// Compiled into both iOS and macOS Runner targets. Lets a Focus (e.g. Work) limit visible bots
/// and optionally hold proactive check-ins on the server (`quiet_until`).
@available(iOS 16.0, macOS 13.0, *)
struct CasamaFocusFilter: SetFocusFilterIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriFocusTitle", defaultValue: "Set Casama Focus Filter", table: "Native")
  static var description = IntentDescription(
    LocalizedStringResource("siriFocusDescription", defaultValue: "Show only chosen bots and optionally hold proactive check-ins while this Focus is active.", table: "Native")
  )

  @Parameter(title: LocalizedStringResource("siriFocusBots", defaultValue: "Bots to show", table: "Native"))
  var bots: [BotEntity]?

  @Parameter(title: LocalizedStringResource("siriFocusHold", defaultValue: "Hold proactive check-ins", table: "Native"), default: false)
  var holdCheckIns: Bool

  var displayRepresentation: DisplayRepresentation {
    let count = bots?.count ?? 0
    if count > 0 {
      return DisplayRepresentation(
        title: count == 1
          ? LocalizedStringResource("siriFocusShowOne", defaultValue: "Show 1 bot", table: "Native")
          : LocalizedStringResource("siriFocusShowMany", defaultValue: "Show \(count) bots", table: "Native"),
        subtitle: holdCheckIns
          ? LocalizedStringResource("siriFocusHoldCheckIns", defaultValue: "Hold check-ins", table: "Native")
          : LocalizedStringResource("siriFocusAllowCheckIns", defaultValue: "Allow check-ins", table: "Native")
      )
    }
    return DisplayRepresentation(
      title: holdCheckIns
        ? LocalizedStringResource("siriFocusHoldCheckIns", defaultValue: "Hold check-ins", table: "Native")
        : LocalizedStringResource("siriFocusAllBots", defaultValue: "All bots", table: "Native"),
      subtitle: holdCheckIns ? LocalizedStringResource("siriFocusAllVisible", defaultValue: "All bots visible", table: "Native") : nil
    )
  }

  func perform() async throws -> some IntentResult {
    let botIds = bots?.map(\.id) ?? []
    let payload: [String: Any] = [
      "active": !botIds.isEmpty || holdCheckIns,
      "bot_ids": botIds,
      "hold_check_ins": holdCheckIns,
      "updated_at": ISO8601DateFormatter().string(from: Date()),
    ]
    FocusFilterStore.save(payload)
    await MainActor.run {
      SiriBridge.shared.notifyFocusFilter(payload)
    }
    return .result()
  }
}

enum FocusFilterStore {
  static let key = "casama.focus_filter"

  static var defaults: UserDefaults {
    #if os(macOS)
    return UserDefaults(suiteName: "V8V5US964Z.ai.casama.app") ?? .standard
    #else
    return UserDefaults(suiteName: "group.ai.casama.app") ?? .standard
    #endif
  }

  static func save(_ payload: [String: Any]) {
    if let data = try? JSONSerialization.data(withJSONObject: payload) {
      defaults.set(data, forKey: key)
    }
  }

  static func load() -> [String: Any]? {
    guard let data = defaults.data(forKey: key),
          let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    else { return nil }
    return obj
  }

  static func clear() {
    defaults.removeObject(forKey: key)
  }
}
