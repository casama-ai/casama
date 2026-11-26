import Flutter
import Foundation
#if canImport(HomeKit)
import HomeKit
#endif

/// HomeKit bridge (docs/APPLE-INTEGRATIONS-PLAN.md §7.4).
/// iOS and iPadOS only (macOS AppKit has no HomeKit). Supports `home.list`, `home.read`, and
/// `home.set` through D-328 device requests; `home.set` is always approval-gated on the server.
final class HomeKitBridge: NSObject {
  static let shared = HomeKitBridge()
  static let channelName = "casama/home_kit"

  private var channel: FlutterMethodChannel?
  #if canImport(HomeKit)
  private lazy var manager: HMHomeManager = {
    let m = HMHomeManager()
    m.delegate = self
    return m
  }()
  private var readyContinuations: [() -> Void] = []
  private var homesLoaded = false
  #endif

  func attach(messenger: FlutterBinaryMessenger) {
    let ch = FlutterMethodChannel(name: Self.channelName, binaryMessenger: messenger)
    ch.setMethodCallHandler { [weak self] call, result in
      self?.handle(call, result: result)
    }
    channel = ch
  }

  private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isSupported":
      #if canImport(HomeKit)
      result(true)
      #else
      result(false)
      #endif
    case "requestPermission":
      #if canImport(HomeKit)
      whenReady { [weak self] in
        guard let self = self else { result(false); return }
        result(self.manager.authorizationStatus.contains(.authorized))
      }
      #else
      result(false)
      #endif
    case "list":
      listAccessories(args: call.arguments as? [String: Any] ?? [:], result: result)
    case "read":
      readAccessory(args: call.arguments as? [String: Any] ?? [:], result: result)
    case "set":
      setAccessory(args: call.arguments as? [String: Any] ?? [:], result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  #if canImport(HomeKit)
  private func whenReady(_ block: @escaping () -> Void) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      _ = self.manager // trigger initialization
      if self.homesLoaded || !self.manager.homes.isEmpty {
        block()
      } else {
        self.readyContinuations.append(block)
        // Fallback timeout if user has 0 homes or hasn't granted permission yet.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
          guard let self = self, !self.readyContinuations.isEmpty else { return }
          let list = self.readyContinuations
          self.readyContinuations.removeAll()
          list.forEach { $0() }
        }
      }
    }
  }

  private func listAccessories(args: [String: Any], result: @escaping FlutterResult) {
    let homeFilter = (args["home_name"] as? String)?.lowercased()
    let roomFilter = (args["room_name"] as? String)?.lowercased()
    whenReady { [weak self] in
      guard let self = self else { return }
      var items: [[String: Any]] = []
      for home in self.manager.homes {
        if let hf = homeFilter, !home.name.lowercased().contains(hf) { continue }
        for acc in home.accessories {
          let roomName = acc.room?.name ?? "Default Room"
          if let rf = roomFilter, !roomName.lowercased().contains(rf) { continue }
          items.append([
            "accessory_id": acc.uniqueIdentifier.uuidString,
            "name": acc.name,
            "home": home.name,
            "room": roomName,
            "category": acc.category.localizedDescription,
            "reachable": acc.isReachable,
          ])
        }
      }
      result(["accessories": items])
    }
  }

  private func findAccessory(id: String) -> HMAccessory? {
    for home in manager.homes {
      if let acc = home.accessories.first(where: { $0.uniqueIdentifier.uuidString == id }) {
        return acc
      }
    }
    return nil
  }

  private func readAccessory(args: [String: Any], result: @escaping FlutterResult) {
    guard let accId = args["accessory_id"] as? String else {
      result(FlutterError(code: "bad_args", message: "accessory_id is required", details: nil))
      return
    }
    whenReady { [weak self] in
      guard let self = self, let acc = self.findAccessory(id: accId) else {
        result(FlutterError(code: "not_found", message: "Accessory not found", details: nil))
        return
      }
      var state: [String: Any] = [
        "accessory_id": acc.uniqueIdentifier.uuidString,
        "name": acc.name,
        "reachable": acc.isReachable,
      ]
      var values: [String: Any] = [:]
      for service in acc.services {
        for ch in service.characteristics {
          if let key = Self.characteristicKey(ch.characteristicType), let val = ch.value {
            values[key] = val
          }
        }
      }
      state["values"] = values
      result(state)
    }
  }

  private func setAccessory(args: [String: Any], result: @escaping FlutterResult) {
    guard let accId = args["accessory_id"] as? String,
          let charName = args["characteristic"] as? String,
          let value = args["value"]
    else {
      result(FlutterError(code: "bad_args", message: "accessory_id, characteristic, and value are required", details: nil))
      return
    }
    whenReady { [weak self] in
      guard let self = self, let acc = self.findAccessory(id: accId) else {
        result(FlutterError(code: "not_found", message: "Accessory not found", details: nil))
        return
      }
      guard let targetType = Self.characteristicType(for: charName) else {
        result(FlutterError(code: "unsupported_characteristic", message: "Unsupported characteristic: \(charName)", details: nil))
        return
      }
      for service in acc.services {
        if let ch = service.characteristics.first(where: { $0.characteristicType == targetType }) {
          ch.writeValue(value) { error in
            if let error = error {
              result(FlutterError(code: "write_failed", message: error.localizedDescription, details: nil))
            } else {
              result(["ok": true, "accessory_id": accId, "characteristic": charName, "value": value])
            }
          }
          return
        }
      }
      result(FlutterError(code: "characteristic_not_found", message: "Characteristic not found on accessory", details: nil))
    }
  }

  private static func characteristicKey(_ type: String) -> String? {
    switch type {
    case HMCharacteristicTypePowerState: return "power"
    case HMCharacteristicTypeBrightness: return "brightness"
    case HMCharacteristicTypeCurrentTemperature: return "current_temperature"
    case HMCharacteristicTypeTargetTemperature: return "target_temperature"
    case HMCharacteristicTypeCurrentDoorState: return "door_state"
    case HMCharacteristicTypeTargetDoorState: return "target_door_state"
    case HMCharacteristicTypeCurrentLockMechanismState: return "lock_state"
    case HMCharacteristicTypeTargetLockMechanismState: return "lock_target_state"
    default: return nil
    }
  }

  private static func characteristicType(for key: String) -> String? {
    switch key.lowercased() {
    case "power": return HMCharacteristicTypePowerState
    case "brightness": return HMCharacteristicTypeBrightness
    case "target_temperature": return HMCharacteristicTypeTargetTemperature
    case "target_door_state": return HMCharacteristicTypeTargetDoorState
    case "lock_target_state": return HMCharacteristicTypeTargetLockMechanismState
    default: return nil
    }
  }
  #else
  private func listAccessories(args: [String: Any], result: @escaping FlutterResult) {
    result(FlutterError(code: "unsupported", message: "HomeKit is only available on iOS and iPadOS", details: nil))
  }
  private func readAccessory(args: [String: Any], result: @escaping FlutterResult) {
    result(FlutterError(code: "unsupported", message: "HomeKit is only available on iOS and iPadOS", details: nil))
  }
  private func setAccessory(args: [String: Any], result: @escaping FlutterResult) {
    result(FlutterError(code: "unsupported", message: "HomeKit is only available on iOS and iPadOS", details: nil))
  }
  #endif
}

#if canImport(HomeKit)
extension HomeKitBridge: HMHomeManagerDelegate {
  func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
    homesLoaded = true
    let list = readyContinuations
    readyContinuations.removeAll()
    list.forEach { $0() }
  }
}
#endif
