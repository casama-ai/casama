import FileProvider
import Foundation
import UniformTypeIdentifiers

/// Read-only File Provider extension (docs/APPLE-INTEGRATIONS-PLAN.md §8, D-405).
/// Lists Casama computers at the root and browses/downloads files from each computer using the
/// read-only `Authorization: FileKey <cfk_...>` key. Writes are disabled in v1 (§12.5).
@available(iOS 16.0, macOS 13.0, *)
final class CasamaFileProviderExtension: NSObject, NSFileProviderReplicatedExtension {
  private let domain: NSFileProviderDomain

  required init(domain: NSFileProviderDomain) {
    self.domain = domain
    super.init()
  }

  func invalidate() {}

  func item(
    for identifier: NSFileProviderItemIdentifier,
    request: NSFileProviderRequest,
    completionHandler: @escaping (NSFileProviderItem?, Error?) -> Void
  ) -> Progress {
    let progress = Progress(totalUnitCount: 1)
    if identifier == .rootContainer {
      completionHandler(CasamaFileItem.root(), nil)
      progress.completedUnitCount = 1
      return progress
    }
    if let parsed = CasamaItemId.parse(identifier.rawValue) {
      completionHandler(
        CasamaFileItem(
          id: identifier,
          parentId: parsed.parentIdentifier,
          name: parsed.displayName,
          isDir: parsed.isDir,
          size: 0,
          modified: nil
        ),
        nil
      )
    } else {
      completionHandler(nil, NSFileProviderError(.noSuchItem))
    }
    progress.completedUnitCount = 1
    return progress
  }

  func fetchContents(
    for itemIdentifier: NSFileProviderItemIdentifier,
    version requestedVersion: NSFileProviderItemVersion?,
    request: NSFileProviderRequest,
    completionHandler: @escaping (URL?, NSFileProviderItem?, Error?) -> Void
  ) -> Progress {
    let progress = Progress(totalUnitCount: 100)
    guard let creds = FileProviderKeyStore.load() else {
      completionHandler(nil, nil, NSFileProviderError(.notAuthenticated))
      return progress
    }
    guard let parsed = CasamaItemId.parse(itemIdentifier.rawValue),
          let path = parsed.path, !parsed.isDir
    else {
      completionHandler(nil, nil, NSFileProviderError(.noSuchItem))
      return progress
    }
    var comps = URLComponents(string: "\(creds.apiUrl)/v1/computers/\(parsed.computerId)/files")
    comps?.queryItems = [URLQueryItem(name: "path", value: path)]
    guard let url = comps?.url else {
      completionHandler(nil, nil, NSFileProviderError(.noSuchItem))
      return progress
    }
    var req = URLRequest(url: url)
    req.setValue("FileKey \(creds.key)", forHTTPHeaderField: "Authorization")
    let task = URLSession.shared.downloadTask(with: req) { tempUrl, response, error in
      if let error = error {
        completionHandler(nil, nil, error)
        return
      }
      // An error answer's body isn't the file.
      if let failure = fileProviderError(for: response) {
        completionHandler(nil, nil, failure)
        return
      }
      guard let tempUrl = tempUrl else {
        completionHandler(nil, nil, NSFileProviderError(.noSuchItem))
        return
      }
      let out = FileManager.default.temporaryDirectory
        .appendingPathComponent("\(UUID().uuidString)-\(parsed.displayName)")
      do {
        try FileManager.default.moveItem(at: tempUrl, to: out)
        let item = CasamaFileItem(
          id: itemIdentifier,
          parentId: parsed.parentIdentifier,
          name: parsed.displayName,
          isDir: false,
          size: 0,
          modified: nil
        )
        progress.completedUnitCount = 100
        completionHandler(out, item, nil)
      } catch {
        completionHandler(nil, nil, error)
      }
    }
    task.resume()
    return progress
  }

  func createItem(
    basedOn itemTemplate: NSFileProviderItem,
    fields: NSFileProviderItemFields,
    contents url: URL?,
    options: NSFileProviderCreateItemOptions = [],
    request: NSFileProviderRequest,
    completionHandler: @escaping (NSFileProviderItem?, NSFileProviderItemFields, Bool, Error?) -> Void
  ) -> Progress {
    // Read-only v1 (§12.5).
    completionHandler(nil, [], false, NSFileProviderError(.cannotSynchronize))
    return Progress()
  }

  func modifyItem(
    _ item: NSFileProviderItem,
    baseVersion version: NSFileProviderItemVersion,
    changedFields: NSFileProviderItemFields,
    contents newContents: URL?,
    options: NSFileProviderModifyItemOptions = [],
    request: NSFileProviderRequest,
    completionHandler: @escaping (NSFileProviderItem?, NSFileProviderItemFields, Bool, Error?) -> Void
  ) -> Progress {
    completionHandler(nil, [], false, NSFileProviderError(.cannotSynchronize))
    return Progress()
  }

  func deleteItem(
    identifier: NSFileProviderItemIdentifier,
    baseVersion version: NSFileProviderItemVersion,
    options: NSFileProviderDeleteItemOptions = [],
    request: NSFileProviderRequest,
    completionHandler: @escaping (Error?) -> Void
  ) -> Progress {
    completionHandler(NSFileProviderError(.cannotSynchronize))
    return Progress()
  }

  func enumerator(
    for containerItemIdentifier: NSFileProviderItemIdentifier,
    request: NSFileProviderRequest
  ) throws -> NSFileProviderEnumerator {
    return CasamaFileEnumerator(containerId: containerItemIdentifier)
  }
}

@available(iOS 16.0, macOS 13.0, *)
private final class CasamaFileEnumerator: NSObject, NSFileProviderEnumerator {
  private let containerId: NSFileProviderItemIdentifier

  init(containerId: NSFileProviderItemIdentifier) {
    self.containerId = containerId
  }

  func invalidate() {}

  func enumerateItems(for observer: NSFileProviderEnumerationObserver, startingAt page: NSFileProviderPage) {
    guard let creds = FileProviderKeyStore.load() else {
      observer.finishEnumeratingWithError(NSFileProviderError(.notAuthenticated))
      return
    }
    if containerId == .rootContainer {
      listComputers(creds: creds, observer: observer)
    } else if let parsed = CasamaItemId.parse(containerId.rawValue) {
      listDirectory(creds: creds, computerId: parsed.computerId, path: parsed.path ?? "", observer: observer)
    } else {
      observer.finishEnumerating(upTo: nil)
    }
  }

  private func listComputers(
    creds: (key: String, apiUrl: String, orgId: String),
    observer: NSFileProviderEnumerationObserver
  ) {
    var comps = URLComponents(string: "\(creds.apiUrl)/v1/computers")
    comps?.queryItems = [URLQueryItem(name: "org_id", value: creds.orgId)]
    guard let url = comps?.url else {
      observer.finishEnumerating(upTo: nil)
      return
    }
    var req = URLRequest(url: url)
    req.setValue("FileKey \(creds.key)", forHTTPHeaderField: "Authorization")
    URLSession.shared.dataTask(with: req) { data, response, error in
      if let error = error {
        observer.finishEnumeratingWithError(error)
        return
      }
      if let failure = fileProviderError(for: response) {
        observer.finishEnumeratingWithError(failure)
        return
      }
      guard let data = data,
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let items = json["items"] as? [[String: Any]]
      else {
        observer.finishEnumerating(upTo: nil)
        return
      }
      let out: [NSFileProviderItem] = items.compactMap { c in
        guard let id = c["id"] as? String else { return nil }
        let name = (c["name"] as? String) ?? "Computer"
        return CasamaFileItem(
          id: NSFileProviderItemIdentifier("comp:\(id)"),
          parentId: .rootContainer,
          name: name,
          isDir: true,
          size: 0,
          modified: nil
        )
      }
      observer.didEnumerate(out)
      observer.finishEnumerating(upTo: nil)
    }.resume()
  }

  private func listDirectory(
    creds: (key: String, apiUrl: String, orgId: String),
    computerId: String,
    path: String,
    observer: NSFileProviderEnumerationObserver
  ) {
    var comps = URLComponents(string: "\(creds.apiUrl)/v1/computers/\(computerId)/files/list")
    if !path.isEmpty {
      comps?.queryItems = [URLQueryItem(name: "path", value: path)]
    }
    guard let url = comps?.url else {
      observer.finishEnumerating(upTo: nil)
      return
    }
    var req = URLRequest(url: url)
    req.setValue("FileKey \(creds.key)", forHTTPHeaderField: "Authorization")
    URLSession.shared.dataTask(with: req) { data, response, error in
      if let error = error {
        observer.finishEnumeratingWithError(error)
        return
      }
      if let http = response as? HTTPURLResponse, http.statusCode == 409 {
        // Computer is asleep: return empty list without waking it.
        observer.finishEnumerating(upTo: nil)
        return
      }
      if let failure = fileProviderError(for: response) {
        observer.finishEnumeratingWithError(failure)
        return
      }
      guard let data = data,
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let entries = json["entries"] as? [[String: Any]]
      else {
        observer.finishEnumerating(upTo: nil)
        return
      }
      // The server writes times with milliseconds (JavaScript's toISOString); accept both forms.
      let iso = ISO8601DateFormatter()
      let isoMs = ISO8601DateFormatter()
      isoMs.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
      let out: [NSFileProviderItem] = entries.compactMap { e in
        guard let name = e["name"] as? String,
              let fullPath = e["path"] as? String,
              let kind = e["type"] as? String
        else { return nil }
        let isDir = kind == "dir"
        let size = (e["size"] as? NSNumber)?.intValue ?? 0
        let mod = (e["modified"] as? String).flatMap { isoMs.date(from: $0) ?? iso.date(from: $0) }
        let prefix = isDir ? "dir" : "file"
        return CasamaFileItem(
          id: NSFileProviderItemIdentifier("\(prefix):\(computerId):\(fullPath)"),
          parentId: self.containerId,
          name: name,
          isDir: isDir,
          size: size,
          modified: mod
        )
      }
      observer.didEnumerate(out)
      observer.finishEnumerating(upTo: nil)
    }.resume()
  }
}

/// The File Provider error for a server answer that isn't a success, or nil for a 2xx.
@available(iOS 16.0, macOS 13.0, *)
private func fileProviderError(for response: URLResponse?) -> Error? {
  guard let http = response as? HTTPURLResponse else { return NSFileProviderError(.serverUnreachable) }
  switch http.statusCode {
  case 200..<300: return nil
  case 401, 403: return NSFileProviderError(.notAuthenticated)
  case 404, 410: return NSFileProviderError(.noSuchItem)
  case 408, 429, 500...599: return NSFileProviderError(.serverUnreachable)
  default: return NSFileProviderError(.cannotSynchronize)
  }
}

private struct CasamaItemId {
  let computerId: String
  let path: String?
  let isDir: Bool

  var displayName: String {
    if let p = path, !p.isEmpty {
      return (p as NSString).lastPathComponent
    }
    return "Computer"
  }

  var parentIdentifier: NSFileProviderItemIdentifier {
    guard let p = path, !p.isEmpty else { return .rootContainer }
    let parent = (p as NSString).deletingLastPathComponent
    if parent.isEmpty || parent == "/" || parent == "." {
      return NSFileProviderItemIdentifier("comp:\(computerId)")
    }
    return NSFileProviderItemIdentifier("dir:\(computerId):\(parent)")
  }

  static func parse(_ raw: String) -> CasamaItemId? {
    if raw.hasPrefix("comp:") {
      return CasamaItemId(computerId: String(raw.dropFirst(5)), path: nil, isDir: true)
    }
    if raw.hasPrefix("dir:") {
      let rest = String(raw.dropFirst(4))
      guard let idx = rest.firstIndex(of: ":") else { return nil }
      return CasamaItemId(
        computerId: String(rest[..<idx]),
        path: String(rest[rest.index(after: idx)...]),
        isDir: true
      )
    }
    if raw.hasPrefix("file:") {
      let rest = String(raw.dropFirst(5))
      guard let idx = rest.firstIndex(of: ":") else { return nil }
      return CasamaItemId(
        computerId: String(rest[..<idx]),
        path: String(rest[rest.index(after: idx)...]),
        isDir: false
      )
    }
    return nil
  }
}

@available(iOS 16.0, macOS 13.0, *)
private final class CasamaFileItem: NSObject, NSFileProviderItem {
  let itemIdentifier: NSFileProviderItemIdentifier
  let parentItemIdentifier: NSFileProviderItemIdentifier
  let filename: String
  let contentType: UTType
  let documentSize: NSNumber?
  let contentModificationDate: Date?
  let capabilities: NSFileProviderItemCapabilities

  init(
    id: NSFileProviderItemIdentifier,
    parentId: NSFileProviderItemIdentifier,
    name: String,
    isDir: Bool,
    size: Int,
    modified: Date?
  ) {
    self.itemIdentifier = id
    self.parentItemIdentifier = parentId
    self.filename = name
    self.contentType = isDir
      ? .folder
      : (UTType(filenameExtension: (name as NSString).pathExtension) ?? .data)
    self.documentSize = isDir ? nil : NSNumber(value: size)
    self.contentModificationDate = modified
    // Strictly read-only (§12.5).
    self.capabilities = isDir ? [.allowsReading] : [.allowsReading]
  }

  static func root() -> CasamaFileItem {
    CasamaFileItem(
      id: .rootContainer,
      parentId: .rootContainer,
      name: "Casama Computers",
      isDir: true,
      size: 0,
      modified: nil
    )
  }

  var itemVersion: NSFileProviderItemVersion {
    let tag = Data("\(contentModificationDate?.timeIntervalSince1970 ?? 0)".utf8)
    return NSFileProviderItemVersion(contentVersion: tag, metadataVersion: tag)
  }
}
