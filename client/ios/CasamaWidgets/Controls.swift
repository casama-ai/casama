import AppIntents
import SwiftUI
import WidgetKit

// MARK: - Controls: Control Center, the Lock Screen's corners and the Action button (D-405 §6.3)
//
// Ask and Talk open Casama at the place (OpenCasamaIntent runs in the app, ControlIntents.swift);
// Run a routine runs it without opening Casama, after the phone is unlocked
// (RunRoutineWidgetIntent asks for that, decision 6).

@available(iOS 18.0, macOS 26.0, *)
struct AskCasamaControl: ControlWidget {
  var body: some ControlWidgetConfiguration {
    StaticControlConfiguration(kind: "AskCasamaControl") {
      ControlWidgetButton(action: OpenCasamaIntent(path: "/quick-ask")) {
        Label(NativeL10n.widgetAskCasama, systemImage: "bubble.left.fill")
      }
    }
    .displayName(LocalizedStringResource("widgetAskCasama", defaultValue: "Ask Casama", table: "Native"))
    .description(LocalizedStringResource("widgetControlAskDescription", defaultValue: "Open quick ask with the keyboard up.", table: "Native"))
  }
}

@available(iOS 18.0, macOS 26.0, *)
struct TalkToBotControl: ControlWidget {
  var body: some ControlWidgetConfiguration {
    AppIntentControlConfiguration(kind: "TalkToBotControl", intent: TalkToBotControlIntent.self) { config in
      ControlWidgetButton(action: OpenCasamaIntent(path: config.bot.map { "/bots/\($0.id)/call" } ?? "/quick-ask")) {
        Label(config.bot.map { NativeL10n.widgetTalkToName($0.name) } ?? NativeL10n.widgetTalkToBot, systemImage: "mic.fill")
      }
    }
    .displayName(LocalizedStringResource("widgetTalkToBot", defaultValue: "Talk to a bot", table: "Native"))
    .description(LocalizedStringResource("widgetControlTalkDescription", defaultValue: "Start a voice call with the bot you pick.", table: "Native"))
    .promptsForUserConfiguration()
  }
}

@available(iOS 18.0, macOS 26.0, *)
struct RunRoutineControl: ControlWidget {
  var body: some ControlWidgetConfiguration {
    AppIntentControlConfiguration(kind: "RunRoutineControl", intent: RunRoutineControlIntent.self) { config in
      #if os(macOS)
      let path = config.routine.map { "/run-routine/\($0.id):\($0.botId)" } ?? "/bots"
      ControlWidgetButton(action: OpenCasamaIntent(path: path)) {
        Label(config.routine?.name ?? NativeL10n.widgetRunRoutine, systemImage: "play.fill")
      }
      #else
      ControlWidgetButton(action: RunRoutineWidgetIntent(routineId: config.routine?.id ?? "", botId: config.routine?.botId ?? "")) {
        Label(config.routine?.name ?? NativeL10n.widgetRunRoutine, systemImage: "play.fill")
      }
      #endif
    }
    .displayName(LocalizedStringResource("widgetRunRoutine", defaultValue: "Run a routine", table: "Native"))
    .description(LocalizedStringResource("widgetControlRunDescription", defaultValue: "Run the routine you pick, without opening Casama.", table: "Native"))
    .promptsForUserConfiguration()
  }
}
