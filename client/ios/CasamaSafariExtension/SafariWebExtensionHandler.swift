import Foundation
import SafariServices

/// Native message handler for the iOS/iPadOS Safari Web Extension (ai.casama.app.safari).
/// Reads one-time sign-in handoff links placed in the shared App Group by the host Casama app.
final class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {
  private static let appGroup = "group.ai.casama.app"
  private static let signInLinkKey = "casama.safari.signInLink"

  func beginRequest(with context: NSExtensionContext) {
    let request = context.inputItems.first as? NSExtensionItem
    let message = request?.userInfo?[SFExtensionMessageKey] as? [String: Any]
    let type = message?["type"] as? String ?? ""

    let payload: [String: Any]
    switch type {
    case "casama.ping":
      payload = ["ok": true, "platform": "ios"]
    case "casama.getSignInLink":
      let defaults = UserDefaults(suiteName: Self.appGroup)
      if let link = defaults?.string(forKey: Self.signInLinkKey), !link.isEmpty {
        defaults?.removeObject(forKey: Self.signInLinkKey)
        payload = ["ok": true, "link": link]
      } else {
        payload = [
          "ok": false,
          "error": "Open Casama on this device -> Settings -> Sign In on Another Device, or paste a sign-in link below.",
        ]
      }
    default:
      payload = ["ok": false, "error": "Unsupported message type"]
    }

    let response = NSExtensionItem()
    response.userInfo = [SFExtensionMessageKey: payload]
    context.completeRequest(returningItems: [response], completionHandler: nil)
  }
}
