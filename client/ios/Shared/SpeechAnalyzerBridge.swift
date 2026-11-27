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

/// On-device SpeechAnalyzer bridge (docs/APPLE-INTEGRATIONS-PLAN.md §7.2), shared between iOS 26+
/// and macOS 26+ over `casama/speech_analyzer`; older systems use `speech_to_text`.
///
/// - `isSupported` → whether this system has the on-device transcriber.
/// - `start {locale?}` → true once the microphone is live, false when it can't start (no
///   language model for the locale, the microphone refused, an error); answered exactly once.
/// - `stop` ends the microphone and lets the analyzer finish the words it was still working on;
///   `onEnd` follows. `cancel` drops the session: no `onEnd`.
/// - To Dart: `onWords {words, final}`, everything heard so far (the settled words, then the ones
///   still being worked out; `final` when there are none of those), and `onEnd {reason: done |
///   nothingHeard | failed, error?}` once per started session.
final class SpeechAnalyzerBridge {
  static let shared = SpeechAnalyzerBridge()
  static let channelName = "casama/speech_analyzer"

  private var channel: FlutterMethodChannel?
  /// The SpeechAnalyzerSession in progress (typed AnyObject: the class needs iOS/macOS 26).
  private var session: AnyObject?

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
        result(SpeechTranscriber.isAvailable)
        return
      }
      #endif
      result(false)
    case "start":
      let localeId = (call.arguments as? [String: Any])?["locale"] as? String
      #if canImport(Speech)
      if #available(iOS 26.0, macOS 26.0, *) {
        MainActor.assumeIsolated { start(localeId: localeId, result: result) }
        return
      }
      #endif
      result(false)
    case "stop":
      #if canImport(Speech)
      if #available(iOS 26.0, macOS 26.0, *) {
        MainActor.assumeIsolated { (session as? SpeechAnalyzerSession)?.stop() }
      }
      #endif
      result(nil)
    case "cancel":
      #if canImport(Speech)
      if #available(iOS 26.0, macOS 26.0, *) {
        MainActor.assumeIsolated { (session as? SpeechAnalyzerSession)?.cancel() }
      }
      #endif
      session = nil
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  #if canImport(Speech)
  @available(iOS 26.0, macOS 26.0, *)
  @MainActor
  private func start(localeId: String?, result: @escaping FlutterResult) {
    // One session at a time: a new start drops the old one, which then says nothing more.
    (session as? SpeechAnalyzerSession)?.cancel()
    let next = SpeechAnalyzerSession()
    next.onWords = { [weak self, weak next] words, isFinal in
      guard let self, let next, self.session === next else { return }
      self.channel?.invokeMethod("onWords", arguments: ["words": words, "final": isFinal])
    }
    next.onEnd = { [weak self, weak next] reason, error in
      guard let self, let next, self.session === next else { return }
      self.session = nil
      var args: [String: Any] = ["reason": reason]
      if let error { args["error"] = error }
      self.channel?.invokeMethod("onEnd", arguments: args)
    }
    next.onStartFailed = { [weak self, weak next] in
      guard let self, let next, self.session === next else { return }
      self.session = nil
    }
    session = next
    next.start(localeId: localeId, result: result)
  }
  #endif
}

#if canImport(Speech)
/// One dictation: the microphone, the analyzer, and the transcript so far.
@available(iOS 26.0, macOS 26.0, *)
@MainActor
private final class SpeechAnalyzerSession {
  var onWords: ((String, Bool) -> Void)?
  var onEnd: ((String, String?) -> Void)?
  var onStartFailed: (() -> Void)?

  private var startResult: FlutterResult?
  private var started = false
  private var stopRequested = false
  private var cancelled = false
  private var ended = false
  private var heard = false
  private var task: Task<Void, Never>?
  private var engine: AVAudioEngine?
  private var input: AsyncStream<AnalyzerInput>.Continuation?
  private var analyzer: SpeechAnalyzer?
  #if os(iOS)
  private var savedAudioSession: (category: AVAudioSession.Category, mode: AVAudioSession.Mode, options: AVAudioSession.CategoryOptions)?
  #endif

  /// How long the analyzer gets to settle the last words after stop before the session ends anyway.
  private static let finishTimeout: Duration = .seconds(5)

  func start(localeId: String?, result: @escaping FlutterResult) {
    startResult = result
    task = Task { await self.run(localeId: localeId) }
  }

  /// Ends the microphone and lets the analyzer settle what it heard; onEnd follows.
  func stop() {
    guard !ended, !cancelled, !stopRequested else { return }
    stopRequested = true
    // Still starting (the language model downloading, say): run() finishes once it's up.
    guard started else { return }
    finishInput()
  }

  /// Drops the session: the microphone stops, what was heard is discarded, no onEnd.
  func cancel() {
    guard !ended, !cancelled else { return }
    cancelled = true
    task?.cancel()
    stopAudio()
    answerStart(false)
    if let analyzer {
      Task { await analyzer.cancelAndFinishNow() }
    }
    release()
  }

  private func run(localeId: String?) async {
    do {
      let wanted = localeId.map { Locale(identifier: $0) } ?? Locale.current
      guard SpeechTranscriber.isAvailable,
            let locale = await SpeechTranscriber.supportedLocale(equivalentTo: wanted)
      else { return failStart() }
      guard await AVAudioApplication.requestRecordPermission() else { return failStart() }
      let transcriber = SpeechTranscriber(
        locale: locale,
        transcriptionOptions: [],
        reportingOptions: [.volatileResults],
        attributeOptions: []
      )
      // The on-device language model for this locale, downloaded the first time.
      if let request = try await AssetInventory.assetInstallationRequest(supporting: [transcriber]) {
        try await request.downloadAndInstall()
      }
      try Task.checkCancellation()

      #if os(iOS)
      try beginAudioSession()
      #endif
      let engine = AVAudioEngine()
      self.engine = engine
      let micFormat = engine.inputNode.outputFormat(forBus: 0)
      guard micFormat.sampleRate > 0, micFormat.channelCount > 0 else { return failStart() }
      let format = await SpeechAnalyzer.bestAvailableAudioFormat(
        compatibleWith: [transcriber],
        considering: micFormat
      ) ?? micFormat
      let analyzer = SpeechAnalyzer(modules: [transcriber])
      self.analyzer = analyzer
      try await analyzer.prepareToAnalyze(in: format)
      try Task.checkCancellation()

      let (stream, continuation) = AsyncStream<AnalyzerInput>.makeStream()
      input = continuation
      engine.inputNode.installTap(
        onBus: 0,
        bufferSize: 4096,
        format: micFormat,
        block: Self.tap(converter: TapConverter(from: micFormat, to: format), into: continuation)
      )
      engine.prepare()
      try engine.start()
      // Returns at once; the analysis runs until the input ends or the session is cancelled.
      try await analyzer.start(inputSequence: stream)
      try Task.checkCancellation()

      started = true
      answerStart(true)
      if stopRequested { finishInput() }

      var settled = ""
      var pending = ""
      for try await result in transcriber.results {
        let text = String(result.text.characters)
        if result.isFinal {
          settled = Self.join(settled, text)
          pending = ""
        } else {
          pending = text
        }
        let words = Self.join(settled, pending).trimmingCharacters(in: .whitespacesAndNewlines)
        if !words.isEmpty, !cancelled {
          heard = true
          onWords?(words, pending.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
      }
      end(heard ? "done" : "nothingHeard", error: nil)
    } catch {
      if cancelled || error is CancellationError {
        stopAudio()
        answerStart(false)
        if let analyzer {
          Task { await analyzer.cancelAndFinishNow() }
        }
        release()
      } else if !started {
        failStart()
      } else {
        end("failed", error: error.localizedDescription)
      }
    }
  }

  /// No more microphone: the analyzer settles the words still in progress, then results end.
  private func finishInput() {
    stopAudio()
    guard let analyzer else { return end(heard ? "done" : "nothingHeard", error: nil) }
    Task {
      do {
        try await analyzer.finalizeAndFinishThroughEndOfInput()
      } catch {
        self.end("failed", error: error.localizedDescription)
      }
    }
    // Don't wait forever for the last words.
    Task {
      try? await Task.sleep(for: Self.finishTimeout)
      guard !self.ended, !self.cancelled else { return }
      await analyzer.cancelAndFinishNow()
      self.end(self.heard ? "done" : "nothingHeard", error: nil)
    }
  }

  private func failStart() {
    stopAudio()
    answerStart(false)
    onStartFailed?()
    release()
  }

  /// The start call's answer, exactly once.
  private func answerStart(_ ok: Bool) {
    guard let result = startResult else { return }
    startResult = nil
    result(ok)
  }

  /// onEnd, exactly once per started session.
  private func end(_ reason: String, error: String?) {
    guard !ended, !cancelled else { return }
    ended = true
    stopAudio()
    answerStart(false)
    onEnd?(reason, error)
    release()
  }

  private func stopAudio() {
    if let engine {
      engine.inputNode.removeTap(onBus: 0)
      engine.stop()
      self.engine = nil
    }
    input?.finish()
    input = nil
    #if os(iOS)
    endAudioSession()
    #endif
  }

  private func release() {
    onWords = nil
    onEnd = nil
    onStartFailed = nil
    task = nil
    analyzer = nil
  }

  #if os(iOS)
  private func beginAudioSession() throws {
    let audio = AVAudioSession.sharedInstance()
    savedAudioSession = (audio.category, audio.mode, audio.categoryOptions)
    try audio.setCategory(.record, mode: .measurement, options: .duckOthers)
    try? audio.setAllowHapticsAndSystemSoundsDuringRecording(true)
    try audio.setActive(true, options: .notifyOthersOnDeactivation)
  }

  /// Puts back the audio setup from before dictation, so other audio comes back up.
  private func endAudioSession() {
    guard let saved = savedAudioSession else { return }
    savedAudioSession = nil
    let audio = AVAudioSession.sharedInstance()
    try? audio.setActive(false, options: .notifyOthersOnDeactivation)
    try? audio.setCategory(saved.category, mode: saved.mode, options: saved.options)
  }
  #endif

  /// The microphone tap, made outside the main actor: it runs on the audio thread.
  nonisolated private static func tap(
    converter: TapConverter,
    into input: AsyncStream<AnalyzerInput>.Continuation
  ) -> AVAudioNodeTapBlock {
    return { buffer, _ in
      if let converted = converter.convert(buffer) {
        input.yield(AnalyzerInput(buffer: converted))
      }
    }
  }

  /// Joins two stretches of transcript with a space, except where either side already has one,
  /// the second starts with punctuation, or the script writes without spaces (Chinese, Japanese,
  /// Thai, Lao, Khmer, Burmese).
  nonisolated static func join(_ a: String, _ b: String) -> String {
    guard let last = a.last, let first = b.first else { return a + b }
    if last.isWhitespace || first.isWhitespace || first.isPunctuation { return a + b }
    if writesWithoutSpaces(last) || writesWithoutSpaces(first) { return a + b }
    return a + " " + b
  }

  nonisolated private static func writesWithoutSpaces(_ c: Character) -> Bool {
    guard let scalar = c.unicodeScalars.first else { return false }
    switch scalar.value {
    case 0x0E00...0x0EFF, // Thai, Lao
         0x1000...0x109F, // Myanmar
         0x1780...0x17FF, // Khmer
         0x3000...0x30FF, // CJK punctuation, Hiragana, Katakana
         0x3400...0x4DBF, 0x4E00...0x9FFF, 0xF900...0xFAFF, // Han
         0xFF00...0xFFEF: // full-width forms
      return true
    default:
      return false
    }
  }
}

/// Converts microphone buffers to the analyzer's format with one converter for the whole session
/// (it carries resampling state from one buffer to the next).
@available(iOS 26.0, macOS 26.0, *)
private final class TapConverter: @unchecked Sendable {
  private let converter: AVAudioConverter?
  private let target: AVAudioFormat

  init(from source: AVAudioFormat, to target: AVAudioFormat) {
    self.target = target
    if source == target {
      converter = nil
    } else {
      converter = AVAudioConverter(from: source, to: target)
      // Skip priming, so no time drifts between the audio and the analyzer's clock.
      converter?.primeMethod = .none
    }
  }

  func convert(_ buffer: AVAudioPCMBuffer) -> AVAudioPCMBuffer? {
    guard let converter else { return buffer }
    let ratio = target.sampleRate / buffer.format.sampleRate
    let capacity = AVAudioFrameCount((Double(buffer.frameLength) * ratio).rounded(.up)) + 1
    guard let out = AVAudioPCMBuffer(pcmFormat: target, frameCapacity: capacity) else { return nil }
    var handedOver = false
    var error: NSError?
    let status = converter.convert(to: out, error: &error) { _, inputStatus in
      // This buffer once, then "nothing yet": the converter keeps its state for the next one.
      if handedOver {
        inputStatus.pointee = .noDataNow
        return nil
      }
      handedOver = true
      inputStatus.pointee = .haveData
      return buffer
    }
    guard status != .error, error == nil, out.frameLength > 0 else { return nil }
    return out
  }
}
#endif
