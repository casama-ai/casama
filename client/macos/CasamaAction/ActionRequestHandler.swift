import AppKit
import Foundation
import UniformTypeIdentifiers

/// macOS Finder Quick Action extension (docs/APPLE-INTEGRATIONS-PLAN.md §6.7).
/// Shows "Ask Casama" in Finder's Quick Actions and right-click menu for files, copies them into
/// the shared App Group, and hands off to the Casama app.
final class ActionRequestHandler: NSObject, NSExtensionRequestHandling {
  private static let groupId = "V8V5US964Z.ai.casama.app"

  func beginRequest(with context: NSExtensionContext) {
    guard let items = context.inputItems as? [NSExtensionItem] else {
      context.completeRequest(returningItems: nil)
      return
    }
    let group = DispatchGroup()
    var files: [[String: String]] = []
    let lock = NSLock()

    for item in items {
      for provider in item.attachments ?? [] {
        if provider.hasItemConformingToTypeIdentifier(UTType.fileURL.identifier) {
          group.enter()
          provider.loadItem(forTypeIdentifier: UTType.fileURL.identifier) { data, _ in
            defer { group.leave() }
            if let url = data as? URL, let copied = Self.copyIntoGroup(url: url) {
              lock.lock()
              files.append(["path": copied.path, "name": copied.lastPathComponent])
              lock.unlock()
            }
          }
        }
      }
    }

    group.notify(queue: .main) {
      if !files.isEmpty,
         let defaults = UserDefaults(suiteName: Self.groupId),
         let data = try? JSONSerialization.data(withJSONObject: files),
         let json = String(data: data, encoding: .utf8)
      {
        defaults.set(json, forKey: "shared_files")
      }
      if let url = URL(string: "casama://app/quick-ask?shared=1") {
        NSWorkspace.shared.open(url)
      }
      context.completeRequest(returningItems: nil)
    }
  }

  private static func copyIntoGroup(url: URL) -> URL? {
    guard let container = FileManager.default.containerURL(
      forSecurityApplicationGroupIdentifier: groupId
    ) else { return nil }
    let dir = container.appendingPathComponent("shared/\(UUID().uuidString)", isDirectory: true)
    try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    let dest = dir.appendingPathComponent(url.lastPathComponent)
    let scoped = url.startAccessingSecurityScopedResource()
    defer { if scoped { url.stopAccessingSecurityScopedResource() } }
    do {
      try FileManager.default.copyItem(at: url, to: dest)
      return dest
    } catch {
      return nil
    }
  }
}
