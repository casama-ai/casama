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
  static var title: LocalizedStringResource = "Ask a Casama bot"
  static var description = IntentDescription(
    "Ask one of the person's Casama bots a question and return its reply.",
    categoryName: "Assistants"
  )
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Bot", description: "Which Casama bot to ask.")
  var bot: BotEntity

  @Parameter(title: "Question", description: "What to ask the bot.")
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
    let say = (answer?["say"] as? String) ?? "Opening Casama to finish."
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
  static var title: LocalizedStringResource = "Run a Casama routine"
  static var description = IntentDescription(
    "Run a saved Casama routine after confirming with the person.",
    categoryName: "Automation"
  )
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Routine", description: "The routine to run.")
  var routine: RoutineEntity

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
    try await requestConfirmation(
      result: .result(dialog: "Run \(routine.name) with \(routine.bot)?")
    )
    let answer = await SiriBridge.shared.call("run", [
      "routine_id": routine.id,
      "name": routine.name,
      "request_id": UUID().uuidString,
    ])
    let say = (answer?["say"] as? String) ?? "Started \(routine.name)."
    return .result(
      dialog: IntentDialog(stringLiteral: say),
      view: RoutineCardSnippet(routineName: routine.name, botName: routine.bot, status: say)
    )
  }
}

@available(iOS 27.3, macOS 27.3, *)
@AppIntent(.tool)
struct WhatNeedsMeToolIntent: AppIntent {
  static var title: LocalizedStringResource = "What needs me in Casama"
  static var description = IntentDescription(
    "Check how many approvals, takeovers or suggestions are waiting in Casama.",
    categoryName: "Assistants"
  )
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    let answer = await SiriBridge.shared.call("needs")
    let say = (answer?["say"] as? String) ?? "Open Casama to check what needs you."
    return .result(dialog: IntentDialog(stringLiteral: say))
  }
}

@available(iOS 27.3, macOS 27.3, *)
@AppIntent(.tool)
struct StopBotToolIntent: AppIntent {
  static var title: LocalizedStringResource = "Stop a Casama bot"
  static var description = IntentDescription(
    "Stop a bot that is currently running a task in Casama.",
    categoryName: "Assistants"
  )
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Bot", description: "The bot to stop.")
  var bot: BotEntity

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    let answer = await SiriBridge.shared.call("stop_bot", ["bot_id": bot.id])
    let say = (answer?["say"] as? String) ?? "Stopped \(bot.name)."
    return .result(dialog: IntentDialog(stringLiteral: say))
  }
}

@available(iOS 27.3, macOS 27.3, *)
@AppIntent(.tool)
struct CallBotToolIntent: AppIntent {
  static var title: LocalizedStringResource = "Call a Casama bot"
  static var description = IntentDescription(
    "Open Casama and start a live voice call with the chosen bot.",
    categoryName: "Communication"
  )
  static var openAppWhenRun = true
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Bot", description: "The bot to call.")
  var bot: BotEntity

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    ShortcutBridge.shared.open("/bots/\(bot.id)/chat?call=1")
    return .result(dialog: "Calling \(bot.name).")
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
