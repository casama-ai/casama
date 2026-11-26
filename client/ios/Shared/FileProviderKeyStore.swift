import Foundation
import Security

/// Shared Keychain & App Group store for the read-only File Provider key (`cfk_…`).
/// Pure Foundation + Security (no Flutter import) so both the Runner app and the
/// CasamaFileProvider extension targets compile it cleanly.
enum FileProviderKeyStore {
  private static let service = "ai.casama.app.file_provider"
  private static let accountKey = "file_key"
  private static let configDefaultsKey = "casama.file_provider.config"

  private static var accessGroup: String {
    "V8V5US964Z.ai.casama.app.widgets"
  }

  private static var defaults: UserDefaults {
    #if os(macOS)
    return UserDefaults(suiteName: "V8V5US964Z.ai.casama.app") ?? .standard
    #else
    return UserDefaults(suiteName: "group.ai.casama.app") ?? .standard
    #endif
  }

  /// The keychain item, in the group the app shares with its File Provider extension.
  private static func query() -> [String: Any] {
    var q: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: accountKey,
      kSecAttrAccessGroup as String: accessGroup,
    ]
    #if os(macOS)
    // Access groups only work in the data protection keychain on the Mac (as WidgetKey).
    q[kSecUseDataProtectionKeychain as String] = true
    #endif
    return q
  }

  /// Stores the key and where it works. Answers whether the keychain took the key (false where
  /// signing doesn't grant the shared keychain group); nothing is stored then.
  @discardableResult
  static func save(key: String, apiUrl: String, orgId: String) -> Bool {
    let q = query()
    let attributes: [String: Any] = [
      kSecValueData as String: Data(key.utf8),
      kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock,
    ]
    var status = SecItemUpdate(q as CFDictionary, attributes as CFDictionary)
    if status == errSecItemNotFound {
      status = SecItemAdd(q.merging(attributes) { $1 } as CFDictionary, nil)
    }
    guard status == errSecSuccess else {
      NSLog("Casama file provider: keychain refused the file key (OSStatus %d)", status)
      defaults.removeObject(forKey: configDefaultsKey)
      return false
    }
    defaults.set(["api_url": apiUrl, "org_id": orgId], forKey: configDefaultsKey)
    return true
  }

  static func load() -> (key: String, apiUrl: String, orgId: String)? {
    var q = query()
    q[kSecReturnData as String] = true
    q[kSecMatchLimit as String] = kSecMatchLimitOne
    var item: CFTypeRef?
    let status = SecItemCopyMatching(q as CFDictionary, &item)
    guard status == errSecSuccess,
          let data = item as? Data,
          let key = String(data: data, encoding: .utf8),
          let cfg = defaults.dictionary(forKey: configDefaultsKey) as? [String: String],
          let apiUrl = cfg["api_url"],
          let orgId = cfg["org_id"]
    else { return nil }
    return (key, apiUrl, orgId)
  }

  static func clear() {
    SecItemDelete(query() as CFDictionary)
    defaults.removeObject(forKey: configDefaultsKey)
  }
}
