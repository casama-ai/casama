import AppIntents
import SwiftUI

// Siri AI Phase 4 (docs/SIRI-AI-PLAN.md §6.8, docs/APPLE-INTEGRATIONS-PLAN.md §5.1).
// Compiled when building with Xcode 27.3+ (`CASAMA_SIRI_AI_PHASE4` Swift compilation condition).
// Keeps Ask a bot, Run a routine (with confirmation), What needs me, Stop a bot and Call a bot
// as Siri AI tools with CardSnippets, while excluding Allow/Deny, billing, sharing and settings.
#if CASAMA_SIRI_AI_PHASE4

@available(iOS 27.3, macOS 27.3, *)
@AppIntent(.tool)
struct AskBotToolIntent: AppIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriToolAsk", defaultValue: "Ask a Casama bot", table: "Native")
  static var description = IntentDescription(
    LocalizedStringResource("siriToolAskDescription", defaultValue: "Ask one of the person's Casama bots a question and return its reply.", table: "Native"),
    categoryName: LocalizedStringResource("siriCategoryAssistants", defaultValue: "Assistants", table: "Native")
  )
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(
    title: LocalizedStringResource("siriBot", defaultValue: "Bot", table: "Native"),
    description: LocalizedStringResource("siriToolBotDescription", defaultValue: "Which Casama bot to ask.", table: "Native"))
  var bot: BotEntity

  @Parameter(
    title: LocalizedStringResource("siriQuestion", defaultValue: "Question", table: "Native"),
    description: LocalizedStringResource("siriToolQuestionDescription", defaultValue: "What to ask the bot.", table: "Native"))
  var question: String

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
    let args: [String: Any] = [
      "bot_id": bot.id,
      "text": question,
      "wait_ms": SiriBridge.askWaitMs,
      "request_id": UUID().uuidString,
    ]
    let answer = await SiriBridge.shared.call("ask", args)
    let say = (answer?["say"] as? String) ?? NativeL10n.siriOpeningToFinish
    let text = (answer?["text"] as? String) ?? say
    return .result(
      dialog: IntentDialog(stringLiteral: say),
      view: BotReplyCardSnippet(botName: bot.name, replyText: text)
    )
  }
}

@available(iOS 27.3, macOS 27.3, *)
@AppIntent(.tool)
struct RunRoutineToolIntent: AppIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriToolRun", defaultValue: "Run a Casama routine", table: "Native")
  static var description = IntentDescription(
    LocalizedStringResource("siriToolRunDescription", defaultValue: "Run a saved Casama routine after confirming with the person.", table: "Native"),
    categoryName: LocalizedStringResource("siriCategoryAutomation", defaultValue: "Automation", table: "Native")
  )
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(
    title: LocalizedStringResource("siriRoutine", defaultValue: "Routine", table: "Native"),
    description: LocalizedStringResource("siriToolRoutineDescription", defaultValue: "The routine to run.", table: "Native"))
  var routine: RoutineEntity

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
    try await requestConfirmation(
      result: .result(
        dialog: IntentDialog(LocalizedStringResource("siriRunWithConfirm", defaultValue: "Run \(routine.name) with \(routine.bot)?", table: "Native")))
    )
    let answer = await SiriBridge.shared.call("run", [
      "routine_id": routine.id,
      "name": routine.name,
      "request_id": UUID().uuidString,
    ])
    let say = (answer?["say"] as? String) ?? NativeL10n.siriRoutineStarted(routine.name)
    return .result(
      dialog: IntentDialog(stringLiteral: say),
      view: RoutineCardSnippet(routineName: routine.name, botName: routine.bot, status: say)
    )
  }
}

@available(iOS 27.3, macOS 27.3, *)
@AppIntent(.tool)
struct WhatNeedsMeToolIntent: AppIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriToolNeeds", defaultValue: "What needs me in Casama", table: "Native")
  static var description = IntentDescription(
    LocalizedStringResource("siriToolNeedsDescription", defaultValue: "Check how many approvals, takeovers or suggestions are waiting in Casama.", table: "Native"),
    categoryName: LocalizedStringResource("siriCategoryAssistants", defaultValue: "Assistants", table: "Native")
  )
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    let answer = await SiriBridge.shared.call("needs")
    let say = (answer?["say"] as? String) ?? NativeL10n.siriOpenToCheck
    return .result(dialog: IntentDialog(stringLiteral: say))
  }
}

@available(iOS 27.3, macOS 27.3, *)
@AppIntent(.tool)
struct StopBotToolIntent: AppIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriToolStop", defaultValue: "Stop a Casama bot", table: "Native")
  static var description = IntentDescription(
    LocalizedStringResource("siriToolStopDescription", defaultValue: "Stop a bot that is currently running a task in Casama.", table: "Native"),
    categoryName: LocalizedStringResource("siriCategoryAssistants", defaultValue: "Assistants", table: "Native")
  )
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(
    title: LocalizedStringResource("siriBot", defaultValue: "Bot", table: "Native"),
    description: LocalizedStringResource("siriToolStopBotDescription", defaultValue: "The bot to stop.", table: "Native"))
  var bot: BotEntity

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    let answer = await SiriBridge.shared.call("stop_bot", ["bot_id": bot.id])
    let say = (answer?["say"] as? String) ?? NativeL10n.siriStoppedBot(bot.name)
    return .result(dialog: IntentDialog(stringLiteral: say))
  }
}

@available(iOS 27.3, macOS 27.3, *)
@AppIntent(.tool)
struct CallBotToolIntent: AppIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriToolCall", defaultValue: "Call a Casama bot", table: "Native")
  static var description = IntentDescription(
    LocalizedStringResource("siriToolCallDescription", defaultValue: "Open Casama and start a live voice call with the chosen bot.", table: "Native"),
    categoryName: LocalizedStringResource("siriCategoryCommunication", defaultValue: "Communication", table: "Native")
  )
  static var openAppWhenRun = true
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(
    title: LocalizedStringResource("siriBot", defaultValue: "Bot", table: "Native"),
    description: LocalizedStringResource("siriToolCallBotDescription", defaultValue: "The bot to call.", table: "Native"))
  var bot: BotEntity

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    ShortcutBridge.shared.open("/bots/\(bot.id)/chat?call=1")
    return .result(dialog: IntentDialog(LocalizedStringResource("siriCalling", defaultValue: "Calling \(bot.name).", table: "Native")))
  }
}

@available(iOS 27.3, macOS 27.3, *)
struct BotReplyCardSnippet: View {
  let botName: String
  let replyText: String

  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text(botName)
        .font(.headline)
      Text(replyText)
        .font(.subheadline)
        .lineLimit(5)
    }
    .padding(12)
  }
}

@available(iOS 27.3, macOS 27.3, *)
struct RoutineCardSnippet: View {
  let routineName: String
  let botName: String
  let status: String

  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text(routineName)
        .font(.headline)
      Text(botName)
        .font(.caption)
        .foregroundStyle(.secondary)
      Text(status)
        .font(.subheadline)
        .lineLimit(3)
    }
    .padding(12)
  }
}

#endif
