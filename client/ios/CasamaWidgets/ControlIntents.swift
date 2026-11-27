import AppIntents
import Foundation

// MARK: - Opening Casama at a place, from a control or a small widget (D-405 §6.3, §8.4)
//
// Built into both the app and the widget extension: an intent that opens the app runs in the
// app's process only when the app has it too. There it hands the path to Flutter the way Siri's
// Ask a bot does (ShortcutBridge in AppDelegate.swift, queued until Flutter is ready); the app
// sets `WidgetOpen.open` at launch. In the extension it is never run.

enum WidgetOpen {
  @MainActor static var open: ((String) -> Void)?
}

@available(iOS 17.0, macOS 14.0, *)
struct OpenCasamaIntent: AppIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriOpenCasama", defaultValue: "Open Casama", table: "Native")
  static var isDiscoverable: Bool = false
  static var openAppWhenRun: Bool = true

  /// An app route ("/quick-ask", "/bots/<id>/call").
  @Parameter(title: LocalizedStringResource("siriWhere", defaultValue: "Where", table: "Native"))
  var path: String

  init() {}
  init(path: String) { self.path = path }

  @MainActor
  func perform() async throws -> some IntentResult {
    WidgetOpen.open?(path.isEmpty ? "/" : path)
    return .result()
  }
}

/// Talk to a bot: which bot. Left empty, quick ask opens instead.
@available(iOS 18.0, macOS 26.0, *)
struct TalkToBotControlIntent: ControlConfigurationIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriTalkToBot", defaultValue: "Talk to a bot", table: "Native")
  static var description = IntentDescription(LocalizedStringResource("siriTalkToBotDescription", defaultValue: "Starts a voice call with the bot you pick.", table: "Native"))

  @Parameter(title: LocalizedStringResource("siriBot", defaultValue: "Bot", table: "Native"))
  var bot: WidgetBotEntity?

  init() {}
}

/// Run a routine: which routine.
@available(iOS 18.0, macOS 26.0, *)
struct RunRoutineControlIntent: ControlConfigurationIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriRunRoutine", defaultValue: "Run a routine", table: "Native")
  static var description = IntentDescription(LocalizedStringResource("siriRunRoutineControlDescription", defaultValue: "Runs the routine you pick, without opening Casama.", table: "Native"))

  @Parameter(title: LocalizedStringResource("siriRoutine", defaultValue: "Routine", table: "Native"))
  var routine: WidgetRoutineEntity?

  init() {}
}
