import AVFoundation
import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#endif
#if canImport(Speech)
import Speech
#endif

/// On-device SpeechAnalyzer bridge (docs/APPLE-INTEGRATIONS-PLAN.md §7.2).
/// Shared between iOS 26+ and macOS 26+. Streams partial and final transcription results to Dart
/// over `casama/speech_analyzer`; older OS versions fall back to `speech_to_text`.
final class SpeechAnalyzerBridge {
  static let shared = SpeechAnalyzerBridge()
  static let channelName = "casama/speech_analyzer"

  private var channel: FlutterMethodChannel?
  private var engine: AVAudioEngine?
  private var activeTask: Task<Void, Never>?

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
      #if canImport(Speech)
      if #available(iOS 26.0, macOS 26.0, *) {
        result(true)
        return
      }
      #endif
      result(false)
    case "start":
      let args = call.arguments as? [String: Any]
      let localeId = args?["locale"] as? String
      startListening(localeId: localeId, result: result)
    case "stop":
      stopListening(cancelled: false)
      result(nil)
    case "cancel":
      stopListening(cancelled: true)
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func startListening(localeId: String?, result: @escaping FlutterResult) {
    #if canImport(Speech)
    if #available(iOS 26.0, macOS 26.0, *) {
      stopListening(cancelled: true)
      let locale = localeId.map { Locale(identifier: $0) } ?? Locale.current

      activeTask = Task { [weak self] in
        guard let self = self else { return }
        do {
          let transcriber = SpeechTranscriber(
            locale: locale,
            transcriptionOptions: [],
            reportingOptions: [.volatileResults],
            attributeOptions: []
          )
          // Ensure the on-device language model is installed via AssetInventory.
          if let request = try await AssetInventory.assetInstallationRequest(supporting: [transcriber]) {
            try await request.downloadAndInstall()
          }

          let analyzer = SpeechAnalyzer(modules: [transcriber])
          let format = await SpeechAnalyzer.bestAvailableAudioFormat(compatibleWith: [transcriber])

          let (inputStream, inputBuilder) = AsyncStream<AnalyzerInput>.makeStream()
          let audioEngine = AVAudioEngine()
          self.engine = audioEngine

          #if os(iOS)
          let session = AVAudioSession.sharedInstance()
          try session.setCategory(.record, mode: .measurement, options: .duckOthers)
          try session.setActive(true, options: .notifyOthersOnDeactivation)
          #endif

          let inputNode = audioEngine.inputNode
          let recordingFormat = inputNode.outputFormat(forBus: 0)
          inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            let target = format ?? recordingFormat
            if target == recordingFormat {
              inputBuilder.yield(AnalyzerInput(buffer: buffer))
            } else if let converter = AVAudioConverter(from: recordingFormat, to: target),
                      let converted = AVAudioPCMBuffer(
                        pcmFormat: target,
                        frameCapacity: AVAudioFrameCount(
                          Double(buffer.frameLength) * target.sampleRate / recordingFormat.sampleRate
                        ) + 1
                      )
            {
              var error: NSError?
              converter.convert(to: converted, error: &error) { _, outStatus in
                outStatus.pointee = .haveData
                return buffer
              }
              if error == nil {
                inputBuilder.yield(AnalyzerInput(buffer: converted))
              }
            }
          }

          audioEngine.prepare()
          try audioEngine.start()
          await MainActor.run { result(true) }

          var heardAnything = false
          async let analysis: Void = {
            try await analyzer.start(inputSequence: inputStream)
          }()

          for try await res in transcriber.results {
            let text = String(res.text.characters).trimmingCharacters(in: .whitespacesAndNewlines)
            if !text.isEmpty {
              heardAnything = true
              await MainActor.run {
                self.channel?.invokeMethod("onWords", arguments: ["words": text])
              }
            }
          }
          inputBuilder.finish()
          try await analysis

          let didHear = heardAnything
          await MainActor.run {
            self.channel?.invokeMethod("onEnd", arguments: [
              "reason": didHear ? "done" : "nothingHeard"
            ])
          }
        } catch is CancellationError {
          // Stopped by caller.
        } catch {
          await MainActor.run {
            self.channel?.invokeMethod("onEnd", arguments: [
              "reason": "failed",
              "error": error.localizedDescription,
            ])
          }
        }
      }
      return
    }
    #endif
    result(false)
  }

  private func stopListening(cancelled: Bool) {
    activeTask?.cancel()
    activeTask = nil
    engine?.inputNode.removeTap(onBus: 0)
    engine?.stop()
    engine = nil
    if !cancelled {
      DispatchQueue.main.async { [weak self] in
        self?.channel?.invokeMethod("onEnd", arguments: ["reason": "done"])
      }
    }
  }
}
