import AppIntents
import Foundation

/// Focus Filter intent (docs/APPLE-INTEGRATIONS-PLAN.md §6.1).
/// Compiled into both iOS and macOS Runner targets. Lets a Focus (e.g. Work) limit visible bots
/// and optionally hold proactive check-ins on the server (`quiet_until`).
@available(iOS 16.0, macOS 13.0, *)
struct CasamaFocusFilter: SetFocusFilterIntent {
  static var title: LocalizedStringResource = "Set Casama Focus Filter"
  static var description = IntentDescription(
    "Show only chosen bots and optionally hold proactive check-ins while this Focus is active."
  )

  @Parameter(title: "Bots to show")
  var bots: [BotEntity]?

  @Parameter(title: "Hold proactive check-ins", default: false)
  var holdCheckIns: Bool

  var displayRepresentation: DisplayRepresentation {
    let count = bots?.count ?? 0
    if count > 0 {
      return DisplayRepresentation(
        title: "Show \(count) bot\(count == 1 ? "" : "s")",
        subtitle: holdCheckIns ? "Hold check-ins" : "Allow check-ins"
      )
    }
    return DisplayRepresentation(
      title: holdCheckIns ? "Hold check-ins" : "All bots",
      subtitle: holdCheckIns ? "All bots visible" : nil
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
