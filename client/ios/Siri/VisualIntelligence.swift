import AppIntents
import CoreImage
import Foundation
#if os(iOS) && canImport(VisualIntelligence)
import UIKit
import VisualIntelligence

/// Visual Intelligence integration (docs/APPLE-INTEGRATIONS-PLAN.md §6.2).
/// When the person takes a screenshot or uses Visual Intelligence camera, offers up to 4
/// "Ask <bot>" choices. Offering them only stages the image (one slot, replaced by the next
/// search); opening one attaches the staged image to the shared files quick ask takes, next to
/// anything a share left there, and opens quick ask with that bot.
@available(iOS 26.0, *)
struct AskBotVisualEntity: AppEntity {
  static var typeDisplayRepresentation: TypeDisplayRepresentation = "Ask Casama Bot"
  static var defaultQuery = AskBotVisualQuery()

  /// `vi:<bot id>`, or `vi:<bot id>:<capture token>` when offered for a staged image.
  var id: String
  var botId: String
  var botName: String
  var captureToken: String?

  init(botId: String, botName: String, captureToken: String? = nil) {
    self.id = captureToken.map { "vi:\(botId):\($0)" } ?? "vi:\(botId)"
    self.botId = botId
    self.botName = botName
    self.captureToken = captureToken
  }

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "Ask \(botName)")
  }

  /// The bot id and capture token in an entity id, or nil when it isn't one of these.
  static func parse(_ id: String) -> (botId: String, token: String?)? {
    let parts = id.split(separator: ":", omittingEmptySubsequences: false).map(String.init)
    guard parts.count >= 2, parts[0] == "vi", !parts[1].isEmpty else { return nil }
    return (parts[1], parts.count > 2 && !parts[2].isEmpty ? parts[2] : nil)
  }
}

@available(iOS 26.0, *)
struct AskBotVisualQuery: EntityQuery, IntentValueQuery {
  func entities(for identifiers: [String]) async throws -> [AskBotVisualEntity] {
    let names = Dictionary(ShortcutStore.loadBots().map { ($0.id, $0.name) }, uniquingKeysWith: { a, _ in a })
    return identifiers.compactMap { id in
      guard let parsed = AskBotVisualEntity.parse(id), let name = names[parsed.botId] else { return nil }
      return AskBotVisualEntity(botId: parsed.botId, botName: name, captureToken: parsed.token)
    }
  }

  func suggestedEntities() async throws -> [AskBotVisualEntity] {
    ShortcutStore.loadBots().prefix(4).map { AskBotVisualEntity(botId: $0.id, botName: $0.name) }
  }

  func values(for input: SemanticContentDescriptor) async throws -> [AskBotVisualEntity] {
    // Only staged here: Visual Intelligence asks for choices on every search, and nothing should
    // reach quick ask until the person opens one.
    let token = input.jpegImageData().flatMap { VisualIntelligenceStore.stage($0) }
    return ShortcutStore.loadBots().prefix(4).map {
      AskBotVisualEntity(botId: $0.id, botName: $0.name, captureToken: token)
    }
  }
}

@available(iOS 26.0, *)
struct OpenVisualIntelligenceBotIntent: OpenIntent {
  static var title: LocalizedStringResource = "Ask Casama about this"
  static var openAppWhenRun = true

  @Parameter(title: "Bot")
  var target: AskBotVisualEntity

  @MainActor
  func perform() async throws -> some IntentResult {
    if let token = target.captureToken {
      VisualIntelligenceStore.attachStaged(token: token)
    }
    let bot = target.botId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? target.botId
    ShortcutBridge.shared.open("/quick-ask?shared=1&bot=\(bot)")
    return .result()
  }
}

@available(iOS 26.0, *)
private extension SemanticContentDescriptor {
  func jpegImageData() -> Data? {
    guard let readOnlyBuffer = pixelBuffer else { return nil }
    return readOnlyBuffer.withUnsafeBuffer { pb -> Data? in
      let ciImage = CIImage(cvPixelBuffer: pb)
      let context = CIContext()
      guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }
      return UIImage(cgImage: cgImage).jpegData(compressionQuality: 0.85)
    }
  }
}

/// The Visual Intelligence image between being offered and being opened, in the App Group.
enum VisualIntelligenceStore {
  private static let groupId = "group.ai.casama.app"

  private static var container: URL? {
    FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupId)
  }

  /// Keeps [data] as the one staged image (replacing an earlier one); answers its token.
  static func stage(_ data: Data) -> String? {
    guard let container else { return nil }
    let dir = container.appendingPathComponent("vi-staging", isDirectory: true)
    try? FileManager.default.removeItem(at: dir)
    try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    let token = UUID().uuidString.lowercased()
    do {
      try data.write(to: dir.appendingPathComponent("\(token).jpg"), options: .atomic)
      return token
    } catch {
      return nil
    }
  }

  /// Moves the staged image with [token] to where quick ask reads it and adds it to
  /// `shared_files` after whatever is already waiting there. Nothing when it was replaced since.
  static func attachStaged(token: String) {
    guard let container else { return }
    let fm = FileManager.default
    let staged = container.appendingPathComponent("vi-staging/\(token).jpg")
    guard fm.fileExists(atPath: staged.path) else { return }
    let capturesDir = container.appendingPathComponent("vi-captures", isDirectory: true)
    let dir = capturesDir.appendingPathComponent(token, isDirectory: true)
    let file = dir.appendingPathComponent("capture.jpg")
    do {
      try fm.createDirectory(at: dir, withIntermediateDirectories: true)
      try? fm.removeItem(at: file)
      try fm.moveItem(at: staged, to: file)
    } catch {
      return
    }
    let defaults = UserDefaults(suiteName: groupId)
    var files: [[String: Any]] = []
    if let json = defaults?.string(forKey: "shared_files"),
       let data = json.data(using: .utf8),
       let list = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
    {
      files = list
    }
    files.append(["path": file.path, "name": "capture.jpg", "mime": "image/jpeg"])
    if let data = try? JSONSerialization.data(withJSONObject: files),
       let json = String(data: data, encoding: .utf8)
    {
      defaults?.set(json, forKey: "shared_files")
    }
    // Earlier captures quick ask no longer lists are done with (matched by their token folder).
    var listed: Set<String> = [token]
    for path in files.compactMap({ $0["path"] as? String }) where path.contains("/vi-captures/") {
      listed.insert(URL(fileURLWithPath: path).deletingLastPathComponent().lastPathComponent)
    }
    for old in (try? fm.contentsOfDirectory(at: capturesDir, includingPropertiesForKeys: nil)) ?? []
    where !listed.contains(old.lastPathComponent) {
      try? fm.removeItem(at: old)
    }
  }
}
#endif
