import AppIntents
import CoreImage
import Foundation
#if os(iOS) && canImport(VisualIntelligence)
import UIKit
import VisualIntelligence

/// Visual Intelligence integration (docs/APPLE-INTEGRATIONS-PLAN.md §6.2).
/// When the person takes a screenshot or uses Visual Intelligence camera, offers up to 4
/// "Ask <bot>" choices. Opening one saves the image in the App Group and opens Casama's
/// quick-ask / chat with that bot and the image attached.
@available(iOS 26.0, *)
struct AskBotVisualEntity: AppEntity {
  static var typeDisplayRepresentation: TypeDisplayRepresentation = "Ask Casama Bot"
  static var defaultQuery = AskBotVisualQuery()

  var id: String
  var botId: String
  var botName: String

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "Ask \(botName)")
  }
}

@available(iOS 26.0, *)
struct AskBotVisualQuery: EntityQuery, IntentValueQuery {
  func entities(for identifiers: [String]) async throws -> [AskBotVisualEntity] {
    let bots = ShortcutStore.loadBots()
    return bots.compactMap { b in
      let entityId = "vi:\(b.id)"
      guard identifiers.contains(entityId) else { return nil }
      return AskBotVisualEntity(id: entityId, botId: b.id, botName: b.name)
    }
  }

  func suggestedEntities() async throws -> [AskBotVisualEntity] {
    ShortcutStore.loadBots().prefix(4).map {
      AskBotVisualEntity(id: "vi:\($0.id)", botId: $0.id, botName: $0.name)
    }
  }

  func values(for input: SemanticContentDescriptor) async throws -> [AskBotVisualEntity] {
    // Save the screenshot/camera image into the shared App Group so opening a bot attaches it.
    if let imageData = input.jpegImageData() {
      VisualIntelligenceStore.savePendingImage(imageData)
    }
    let bots = ShortcutStore.loadBots().prefix(4)
    return bots.map {
      AskBotVisualEntity(id: "vi:\($0.id)", botId: $0.id, botName: $0.name)
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
    ShortcutBridge.shared.open("/quick-ask?shared=1&bot=\(target.botId)")
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

enum VisualIntelligenceStore {
  private static let groupId = "group.ai.casama.app"

  static func savePendingImage(_ data: Data) {
    guard let container = FileManager.default.containerURL(
      forSecurityApplicationGroupIdentifier: groupId
    ) else { return }
    let dir = container.appendingPathComponent("shared/vi-\(UUID().uuidString)", isDirectory: true)
    try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    let file = dir.appendingPathComponent("capture.jpg")
    try? data.write(to: file, options: .atomic)
    if let defaults = UserDefaults(suiteName: groupId),
       let json = try? JSONSerialization.data(withJSONObject: [
         ["path": file.path, "name": "capture.jpg", "mime": "image/jpeg"]
       ])
    {
      defaults.set(String(data: json, encoding: .utf8), forKey: "shared_files")
    }
  }
}
#endif
