import Flutter
import PDFKit
import UIKit
import VisionKit

/// Native VisionKit document scanner bridge (docs/APPLE-INTEGRATIONS-PLAN.md §6.4).
/// Presents `VNDocumentCameraViewController`, merges scanned pages into a single PDF in the
/// temporary directory, and returns its path to Dart. No third-party Flutter plugin required.
final class DocumentScannerBridge: NSObject, VNDocumentCameraViewControllerDelegate {
  static let shared = DocumentScannerBridge()
  static let channelName = "casama/document_scanner"

  private var channel: FlutterMethodChannel?
  private var pendingResult: FlutterResult?

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
      result(VNDocumentCameraViewController.isSupported)
    case "scan":
      guard VNDocumentCameraViewController.isSupported else {
        result(FlutterError(code: "unsupported", message: "Document scanning is not supported on this device", details: nil))
        return
      }
      if pendingResult != nil {
        result(FlutterError(code: "busy", message: "Scanner is already open", details: nil))
        return
      }
      DispatchQueue.main.async { [weak self] in
        guard let self = self, let vc = self.topViewController() else {
          result(FlutterError(code: "no_presenter", message: "No active view controller", details: nil))
          return
        }
        self.pendingResult = result
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = self
        vc.present(scanner, animated: true)
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
    controller.dismiss(animated: true)
    pendingResult?(nil)
    pendingResult = nil
  }

  func documentCameraViewController(
    _ controller: VNDocumentCameraViewController,
    didFailWithError error: Error
  ) {
    controller.dismiss(animated: true)
    pendingResult?(FlutterError(code: "scan_failed", message: error.localizedDescription, details: nil))
    pendingResult = nil
  }

  func documentCameraViewController(
    _ controller: VNDocumentCameraViewController,
    didFinishWith scan: VNDocumentCameraScan
  ) {
    controller.dismiss(animated: true)
    let res = pendingResult
    pendingResult = nil

    DispatchQueue.global(qos: .userInitiated).async {
      let pdf = PDFDocument()
      for i in 0..<scan.pageCount {
        let img = scan.imageOfPage(at: i)
        if let page = PDFPage(image: img) {
          pdf.insert(page, at: i)
        }
      }
      let filename = "scan-\(Int(Date().timeIntervalSince1970)).pdf"
      let outUrl = FileManager.default.temporaryDirectory.appendingPathComponent(filename)
      let ok = pdf.write(to: outUrl)
      DispatchQueue.main.async {
        if ok {
          res?(["path": outUrl.path, "name": filename, "pages": scan.pageCount])
        } else {
          res?(FlutterError(code: "pdf_write_failed", message: "Could not save scanned PDF", details: nil))
        }
      }
    }
  }

  private func topViewController() -> UIViewController? {
    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    let root = scenes.first(where: { $0.activationState == .foregroundActive })?.keyWindow?.rootViewController
      ?? scenes.first?.keyWindow?.rootViewController
    var current = root
    while let presented = current?.presentedViewController {
      current = presented
    }
    return current
  }
}
