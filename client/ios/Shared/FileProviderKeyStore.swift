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

  static func save(key: String, apiUrl: String, orgId: String) {
    let data = Data(key.utf8)
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: accountKey,
      kSecAttrAccessGroup as String: accessGroup,
    ]
    SecItemDelete(query as CFDictionary)
    var add = query
    add[kSecValueData as String] = data
    add[kSecAttrAccessible as String] = kSecAttrAccessibleAfterFirstUnlock
    SecItemAdd(add as CFDictionary, nil)

    defaults.set(["api_url": apiUrl, "org_id": orgId], forKey: configDefaultsKey)
  }

  static func load() -> (key: String, apiUrl: String, orgId: String)? {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: accountKey,
      kSecAttrAccessGroup as String: accessGroup,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitOne,
    ]
    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
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
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: accountKey,
      kSecAttrAccessGroup as String: accessGroup,
    ]
    SecItemDelete(query as CFDictionary)
    defaults.removeObject(forKey: configDefaultsKey)
  }
}
