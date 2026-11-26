import CryptoKit
import Intents
import UIKit
import UserNotifications

/// Communication Notifications extension (docs/APPLE-INTEGRATIONS-PLAN.md §5.3).
/// Reads `casama_sender` from APNs payloads, downloads and caches the bot's avatar in the App
/// Group (or renders the bot's initials on its deterministic color per §12.2), and updates the
/// notification via `INSendMessageIntent` so Siri announces it on AirPods/CarPlay/Watch and
/// supports voice replies.
final class NotificationService: UNNotificationServiceExtension {
  private static let groupId = "group.ai.casama.app"
  private var contentHandler: ((UNNotificationContent) -> Void)?
  private var bestAttemptContent: UNMutableNotificationContent?

  override func didReceive(
    _ request: UNNotificationRequest,
    withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void
  ) {
    self.contentHandler = contentHandler
    guard let mutable = request.content.mutableCopy() as? UNMutableNotificationContent else {
      contentHandler(request.content)
      return
    }
    self.bestAttemptContent = mutable

    guard let sender = mutable.userInfo["casama_sender"] as? [String: Any],
          let botId = sender["bot_id"] as? String, !botId.isEmpty,
          let botName = sender["name"] as? String, !botName.isEmpty
    else {
      contentHandler(mutable)
      return
    }

    let avatarUrlString = sender["avatar_url"] as? String
    let avatarMark = sender["avatar_mark"] as? String
    let conversationId = (sender["conversation_id"] as? String) ?? botId

    resolveAvatarData(botId: botId, botName: botName, urlString: avatarUrlString, mark: avatarMark) {
      [weak self] imageData in
      guard let self = self else { return }
      let updated = self.applyCommunicationIntent(
        to: mutable,
        botId: botId,
        botName: botName,
        conversationId: conversationId,
        avatarData: imageData
      )
      contentHandler(updated)
    }
  }

  override func serviceExtensionTimeWillExpire() {
    if let contentHandler = contentHandler, let best = bestAttemptContent {
      contentHandler(best)
    }
  }

  private func applyCommunicationIntent(
    to content: UNMutableNotificationContent,
    botId: String,
    botName: String,
    conversationId: String,
    avatarData: Data?
  ) -> UNNotificationContent {
    let handle = INPersonHandle(value: "casama-bot:\(botId)", type: .unknown)
    let image = avatarData.map { INImage(imageData: $0) }
    let person = INPerson(
      personHandle: handle,
      nameComponents: nil,
      displayName: botName,
      image: image,
      contactIdentifier: nil,
      customIdentifier: botId,
      isMe: false,
      suggestionType: .instantMessageAddress
    )
    let intent = INSendMessageIntent(
      recipients: nil,
      outgoingMessageType: .outgoingMessageText,
      content: content.body,
      speakableGroupName: nil,
      conversationIdentifier: conversationId,
      serviceName: "Casama",
      sender: person,
      attachments: nil
    )
    if let image = image {
      intent.setImage(image, forParameterNamed: \.sender)
    }
    let interaction = INInteraction(intent: intent, response: nil)
    interaction.direction = .incoming
    interaction.donate(completion: nil)

    do {
      return try content.updating(from: intent)
    } catch {
      NSLog("CasamaNotify: content.updating(from: INSendMessageIntent) failed: %@", error.localizedDescription)
      return content
    }
  }

  private func resolveAvatarData(
    botId: String,
    botName: String,
    urlString: String?,
    mark: String?,
    completion: @escaping (Data?) -> Void
  ) {
    // 1. Check App Group cache first.
    if let cached = cachedAvatar(botId: botId, urlString: urlString) {
      completion(cached)
      return
    }
    // 2. Download signed/public avatar URL if present (10s timeout to stay well inside 30s budget).
    if let urlString = urlString, let url = URL(string: urlString), url.scheme == "https" {
      let config = URLSessionConfiguration.ephemeral
      config.timeoutIntervalForRequest = 8
      config.timeoutIntervalForResource = 10
      let session = URLSession(configuration: config)
      session.dataTask(with: url) { data, response, _ in
        if let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode),
           let data = data, !data.isEmpty, let resized = Self.resizePng(data: data, size: 64)
        {
          Self.cacheAvatar(botId: botId, urlString: urlString, data: resized)
          completion(resized)
          return
        }
        completion(Self.renderInitialsAvatar(name: botName, botId: botId, mark: mark))
      }.resume()
      return
    }
    // 3. Fallback: bot's initials on its color (§12.2).
    completion(Self.renderInitialsAvatar(name: botName, botId: botId, mark: mark))
  }

  /// Stable across process launches (never Swift's randomly-salted `hashValue`) and strips
  /// rotating `exp`/`sig` query params so 10-minute signed URLs still hit the 24-hour disk cache.
  private static func cacheKey(botId: String, urlString: String?) -> String {
    var stable = botId
    if let urlString, var comps = URLComponents(string: urlString) {
      comps.query = nil
      comps.fragment = nil
      stable += "|" + (comps.string ?? urlString)
    }
    let digest = SHA256.hash(data: Data(stable.utf8))
    return digest.prefix(12).map { String(format: "%02x", $0) }.joined()
  }

  private static func cacheURL(botId: String, urlString: String?) -> URL? {
    guard let base = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupId)
    else { return nil }
    let dir = base.appendingPathComponent("avatars", isDirectory: true)
    try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    let key = cacheKey(botId: botId, urlString: urlString)
    return dir.appendingPathComponent("\(botId)-\(key).png")
  }

  private func cachedAvatar(botId: String, urlString: String?) -> Data? {
    guard let url = Self.cacheURL(botId: botId, urlString: urlString),
          let attrs = try? FileManager.default.attributesOfItem(atPath: url.path),
          let mod = attrs[.modificationDate] as? Date,
          Date().timeIntervalSince(mod) < 86_400
    else { return nil }
    return try? Data(contentsOf: url)
  }

  private static func cacheAvatar(botId: String, urlString: String?, data: Data) {
    guard let url = cacheURL(botId: botId, urlString: urlString) else { return }
    try? data.write(to: url, options: .atomic)
  }

  private static func resizePng(data: Data, size: CGFloat) -> Data? {
    guard let img = UIImage(data: data) else { return nil }
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
    let out = renderer.image { _ in
      img.draw(in: CGRect(x: 0, y: 0, width: size, height: size))
    }
    return out.pngData()
  }

  /// Renders a 64x64 circular badge with the bot's initials on its color (§12.2).
  private static func renderInitialsAvatar(name: String, botId: String, mark: String?) -> Data? {
    let size: CGFloat = 64
    let palette: [UIColor] = [
      UIColor(red: 0.48, green: 0.56, blue: 1.00, alpha: 1.0),
      UIColor(red: 0.54, green: 0.42, blue: 0.96, alpha: 1.0),
      UIColor(red: 0.24, green: 0.75, blue: 0.82, alpha: 1.0),
      UIColor(red: 0.94, green: 0.40, blue: 0.42, alpha: 1.0),
      UIColor(red: 0.28, green: 0.72, blue: 0.52, alpha: 1.0),
      UIColor(red: 0.95, green: 0.62, blue: 0.26, alpha: 1.0),
    ]
    let color = colorFromMark(mark) ?? palette[abs(botId.hashValue) % palette.count]
    let words = name.split(separator: " ").prefix(2)
    let initials = words.compactMap { $0.first.map { String($0).uppercased() } }.joined()
    let text = initials.isEmpty ? "C" : initials

    let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
    let img = renderer.image { ctx in
      let rect = CGRect(x: 0, y: 0, width: size, height: size)
      color.setFill()
      ctx.cgContext.fillEllipse(in: rect)

      let attrs: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 26, weight: .semibold),
        .foregroundColor: UIColor.white,
      ]
      let attrStr = NSAttributedString(string: text, attributes: attrs)
      let textSize = attrStr.size()
      let drawRect = CGRect(
        x: (size - textSize.width) / 2,
        y: (size - textSize.height) / 2,
        width: textSize.width,
        height: textSize.height
      )
      attrStr.draw(in: drawRect)
    }
    return img.pngData()
  }

  private static func colorFromMark(_ mark: String?) -> UIColor? {
    guard let mark = mark, mark.hasPrefix("image:") else { return nil }
    let parts = mark.split(separator: ":")
    guard parts.count >= 3, parts[2].count >= 6 else { return nil }
    let hex = String(parts[2].prefix(6))
    guard let val = UInt32(hex, radix: 16) else { return nil }
    return UIColor(
      red: CGFloat((val >> 16) & 0xFF) / 255.0,
      green: CGFloat((val >> 8) & 0xFF) / 255.0,
      blue: CGFloat(val & 0xFF) / 255.0,
      alpha: 1.0
    )
  }
}
