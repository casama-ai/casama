import AppKit
import Foundation
import UniformTypeIdentifiers

/// macOS Share Extension (docs/APPLE-INTEGRATIONS-PLAN.md §6.7).
/// Collects shared text, URLs, or files from Safari, Finder, or Photos, saves them to the
/// shared App Group `V8V5US964Z.ai.casama.app`, and opens Casama's quick-ask panel. The app takes
/// them over `casama/mac` (takeSharedText, takeSharedFiles). Each share replaces the last one.
final class ShareViewController: NSViewController {
  private static let groupId = "V8V5US964Z.ai.casama.app"

  override func loadView() {
    self.view = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 120))
  }

  override func viewDidAppear() {
    super.viewDidAppear()
    handleShare()
  }

  private func handleShare() {
    guard let items = extensionContext?.inputItems as? [NSExtensionItem] else {
      extensionContext?.completeRequest(returningItems: nil)
      return
    }
    Self.clearPreviousShare()
    let group = DispatchGroup()
    var texts: [String] = []
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
              files.append(Self.describe(copied))
              lock.unlock()
            }
          }
        } else if provider.hasItemConformingToTypeIdentifier(UTType.url.identifier) {
          group.enter()
          provider.loadItem(forTypeIdentifier: UTType.url.identifier) { data, _ in
            defer { group.leave() }
            if let url = data as? URL {
              lock.lock()
              texts.append(url.absoluteString)
              lock.unlock()
            }
          }
        } else if provider.hasItemConformingToTypeIdentifier(UTType.plainText.identifier) {
          group.enter()
          provider.loadItem(forTypeIdentifier: UTType.plainText.identifier) { data, _ in
            defer { group.leave() }
            if let str = data as? String, !str.isEmpty {
              lock.lock()
              texts.append(str)
              lock.unlock()
            }
          }
        }
      }
    }

    group.notify(queue: .main) { [weak self] in
      let defaults = UserDefaults(suiteName: Self.groupId)
      if texts.isEmpty {
        defaults?.removeObject(forKey: "shared_text")
      } else {
        defaults?.set(texts.joined(separator: "\n"), forKey: "shared_text")
      }
      if !files.isEmpty,
         let data = try? JSONSerialization.data(withJSONObject: files),
         let json = String(data: data, encoding: .utf8)
      {
        defaults?.set(json, forKey: "shared_files")
      } else {
        defaults?.removeObject(forKey: "shared_files")
      }
      // A link of its own each time, so a running Casama opens a fresh quick ask for this share.
      let at = Int64(Date().timeIntervalSince1970 * 1000)
      if !texts.isEmpty || !files.isEmpty, let url = URL(string: "casama://app/quick-ask?shared=1&at=\(at)") {
        NSWorkspace.shared.open(url)
      }
      self?.extensionContext?.completeRequest(returningItems: nil)
    }
  }

  /// Removes the files the last share copied in; the app reads them only until the next share.
  private static func clearPreviousShare() {
    guard let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupId) else { return }
    try? FileManager.default.removeItem(at: container.appendingPathComponent("shared", isDirectory: true))
  }

  /// `{path, name, mime}`, as the app's parseSharedFiles reads it.
  private static func describe(_ file: URL) -> [String: String] {
    var out = ["path": file.path, "name": file.lastPathComponent]
    if let mime = UTType(filenameExtension: file.pathExtension)?.preferredMIMEType { out["mime"] = mime }
    return out
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
