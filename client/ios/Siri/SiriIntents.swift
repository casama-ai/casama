import AppIntents
import CoreSpotlight
import Foundation
import SwiftUI

// MARK: - What Siri, Spotlight and Shortcuts can do in Casama (D-111, docs/SIRI-AI-PLAN.md)
//
// Phase 1: Ask a bot, Run a routine and What needs me answer inside Siri, without opening the app,
// on any Siri (iOS 16+, macOS 13+). Phase 2: bots, routines and chats are findable in Spotlight and
// by Siri AI (iOS 18+, macOS 15+), and a tap opens them.
//
// Titles and phrases are literals Apple indexes ahead of time, so they stay here, in English.
// What Siri says back comes from Dart (app_en.arb); the English lines below are only for when Dart
// couldn't answer. Every intent asks for the phone to be unlocked first (decision 4).

/// What Siri says when the app must come forward (Dart didn't come up in time or couldn't act).
@available(iOS 16.0, macOS 13.0, *)
private var openToFinish: IntentDialog { "Opening Casama to finish." }

// MARK: Entities

@available(iOS 16.0, macOS 13.0, *)
struct BotEntity: AppEntity {
  static var typeDisplayRepresentation: TypeDisplayRepresentation = "Bot"
  static var defaultQuery = BotQuery()
  let id: String
  @Property(title: "Name") var name: String

  init(id: String, name: String) {
    self.id = id
    self.name = name
  }

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "\(name)", subtitle: "A bot in Casama, an AI assistant you chat with")
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct BotQuery: EntityStringQuery {
  func entities(for identifiers: [String]) async throws -> [BotEntity] {
    ShortcutStore.items("bots").filter { identifiers.contains($0.id) }.map { BotEntity(id: $0.id, name: $0.name) }
  }
  func entities(matching string: String) async throws -> [BotEntity] {
    ShortcutStore.items("bots").filter { $0.name.localizedCaseInsensitiveContains(string) }.map { BotEntity(id: $0.id, name: $0.name) }
  }
  func suggestedEntities() async throws -> [BotEntity] {
    ShortcutStore.items("bots").map { BotEntity(id: $0.id, name: $0.name) }
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct RoutineEntity: AppEntity {
  static var typeDisplayRepresentation: TypeDisplayRepresentation = "Routine"
  static var defaultQuery = RoutineQuery()
  /// `<routine id>:<bot id>`, as the app's list writes it.
  let id: String
  @Property(title: "Name") var name: String
  @Property(title: "Bot") var bot: String

  init(id: String, name: String, bot: String) {
    self.id = id
    self.name = name
    self.bot = bot
  }

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "\(name)", subtitle: "A routine \(bot) runs in Casama")
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct RoutineQuery: EntityStringQuery {
  private func all() -> [RoutineEntity] {
    ShortcutStore.items("routines").map { RoutineEntity(id: $0.id, name: $0.name, bot: $0.detail ?? "") }
  }
  func entities(for identifiers: [String]) async throws -> [RoutineEntity] { all().filter { identifiers.contains($0.id) } }
  func entities(matching string: String) async throws -> [RoutineEntity] {
    all().filter { $0.name.localizedCaseInsensitiveContains(string) || $0.bot.localizedCaseInsensitiveContains(string) }
  }
  func suggestedEntities() async throws -> [RoutineEntity] { all() }
}

/// A chat with a bot: its title and the bot, never what was said in it (§4.4).
@available(iOS 16.0, macOS 13.0, *)
struct ChatEntity: AppEntity {
  static var typeDisplayRepresentation: TypeDisplayRepresentation = "Chat"
  static var defaultQuery = ChatQuery()
  let id: String
  @Property(title: "Title") var name: String
  @Property(title: "Bot") var bot: String
  let botId: String

  init(id: String, name: String, bot: String, botId: String) {
    self.id = id
    self.botId = botId
    self.name = name
    self.bot = bot
  }

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "\(name)", subtitle: "A chat with \(bot) in Casama")
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct ChatQuery: EntityStringQuery {
  private func all() -> [ChatEntity] {
    ShortcutStore.items("chats").map { ChatEntity(id: $0.id, name: $0.name, bot: $0.detail ?? "", botId: $0.bot_id ?? "") }
  }
  func entities(for identifiers: [String]) async throws -> [ChatEntity] { all().filter { identifiers.contains($0.id) } }
  func entities(matching string: String) async throws -> [ChatEntity] {
    all().filter { $0.name.localizedCaseInsensitiveContains(string) || $0.bot.localizedCaseInsensitiveContains(string) }
  }
  func suggestedEntities() async throws -> [ChatEntity] { Array(all().prefix(10)) }
}

// Spotlight (Phase 2): the three entities are indexed by SiriIndex (SiriBridge.swift).
@available(iOS 18.0, macOS 15.0, *)
extension BotEntity: IndexedEntity {
  var attributeSet: CSSearchableItemAttributeSet {
    let a = defaultAttributeSet
    a.displayName = name
    a.contentDescription = "Bot in Casama"
    a.keywords = ["bot", "Casama"]
    return a
  }
}

@available(iOS 18.0, macOS 15.0, *)
extension RoutineEntity: IndexedEntity {
  var attributeSet: CSSearchableItemAttributeSet {
    let a = defaultAttributeSet
    a.displayName = name
    a.contentDescription = "Routine · \(bot)"
    a.keywords = ["routine", bot]
    return a
  }
}

@available(iOS 18.0, macOS 15.0, *)
extension ChatEntity: IndexedEntity {
  var attributeSet: CSSearchableItemAttributeSet {
    let a = defaultAttributeSet
    a.displayName = name
    a.contentDescription = "Chat with \(bot)"
    a.keywords = ["chat", bot]
    return a
  }
}

// MARK: Ask a bot

@available(iOS 16.0, macOS 13.0, *)
struct AskBotIntent: AppIntent {
  static var title: LocalizedStringResource = "Ask a bot"
  static var description = IntentDescription(
    "Sends a question to one of your Casama bots (AI assistants) in a new chat and reads the reply back. With no bot named, the bot you talked to last answers.",
    categoryName: "Bots")
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Bot", description: "Which bot to ask. Leave empty for the bot you talked to last.")
  var bot: BotEntity?

  @Parameter(title: "Question", description: "What to ask the bot, in your own words.", requestValueDialog: "What should I ask?")
  var question: String

  static var parameterSummary: some ParameterSummary {
    Summary("Ask \(\.$bot) \(\.$question)")
  }

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
    // Nothing to ask (Shortcuts lets an empty question through): Siri asks for it again.
    if question.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
      throw $question.needsValueError("What should I ask?")
    }
    let requestId = UUID().uuidString
    let args: [String: Any] = ["bot_id": bot?.id ?? "", "text": question, "wait_ms": SiriBridge.askWaitMs, "request_id": requestId]
    let started = Date()
    let answer = await SiriBridge.shared.call("ask", args)
    SiriProbeLog.add("ask answered \(answer?["status"] as? String ?? "nil") after \(String(format: "%.1f", Date().timeIntervalSince(started))) s")
    guard let answer = answer, let say = answer["say"] as? String else {
      try openApp(askLink(), self)
      return .result(dialog: openToFinish, view: SiriReplyView(bot: nil, text: nil, note: nil))
    }
    let status = answer["status"] as? String ?? ""
    if ["opened_app", "limited", "signed_out"].contains(status), let link = answer["open"] as? String {
      try openApp(link, self)
    }
    let reply = answer["text"] as? String
    let note = answer["answered_by"] as? String
    let spoken = reply.map { [note, Self.forSpeech($0)].compactMap { $0 }.joined(separator: " ") } ?? say
    return .result(dialog: IntentDialog(full: "\(spoken)", supporting: "\(note ?? say)"),
                   view: SiriReplyView(bot: answer["bot"] as? String, text: reply ?? say, note: reply == nil ? nil : note))
  }

  private func askLink() -> String {
    var c = URLComponents()
    c.path = "/quick-ask"
    c.queryItems = [URLQueryItem(name: "text", value: question)] + (bot.map { [URLQueryItem(name: "bot", value: $0.id)] } ?? [])
    return c.string ?? "/quick-ask"
  }

  /// A long reply: the first part is spoken, all of it is shown (§5).
  static func forSpeech(_ text: String) -> String {
    guard text.count > 400 else { return text }
    let head = String(text.prefix(400))
    if let end = head.range(of: ". ", options: .backwards), head.distance(from: head.startIndex, to: end.lowerBound) > 150 {
      return String(head[..<end.upperBound]) + "The rest is on screen."
    }
    return head + "… The rest is on screen."
  }
}

// MARK: Run a routine

@available(iOS 16.0, macOS 13.0, *)
struct RunRoutineIntent: AppIntent {
  static var title: LocalizedStringResource = "Run a routine"
  static var description = IntentDescription(
    "Runs one of your Casama bots' routines now. The result arrives in the app and as a notification, as it does when the routine runs on its own.",
    categoryName: "Routines")
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Routine", description: "Which routine to run now.")
  var routine: RoutineEntity

  static var parameterSummary: some ParameterSummary {
    Summary("Run \(\.$routine)")
  }

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    let answer = await SiriBridge.shared.call("run", ["routine_id": routine.id, "name": routine.name, "request_id": UUID().uuidString])
    guard let answer = answer, let say = answer["say"] as? String else {
      try openApp("/run-routine/\(routine.id)", self)
      return .result(dialog: openToFinish)
    }
    let status = answer["status"] as? String ?? ""
    if ["opened_app", "signed_out"].contains(status), let link = answer["open"] as? String {
      try openApp(link, self)
    }
    return .result(dialog: IntentDialog(stringLiteral: say))
  }
}

// MARK: What needs me

@available(iOS 16.0, macOS 13.0, *)
struct WhatNeedsMeIntent: AppIntent {
  static var title: LocalizedStringResource = "What needs me"
  static var description = IntentDescription(
    "Says how many things in Casama are waiting for you: a bot's request for your OK, a takeover, a suggestion. Answer them in the app.",
    categoryName: "Bots")
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    guard let answer = await SiriBridge.shared.call("needs"), let say = answer["say"] as? String else {
      try openApp("/inbox", self)
      return .result(dialog: openToFinish)
    }
    return .result(dialog: IntentDialog(stringLiteral: say))
  }
}

// MARK: Opening from Spotlight (Phase 2)

@available(iOS 16.0, macOS 13.0, *)
struct OpenBotIntent: OpenIntent {
  static var title: LocalizedStringResource = "Open a bot"
  static var description = IntentDescription("Opens your chat with one of your Casama bots.")
  static var isDiscoverable = false
  @Parameter(title: "Bot") var target: BotEntity

  @MainActor
  func perform() async throws -> some IntentResult {
    ShortcutBridge.shared.open("/bots/\(target.id)/chat")
    return .result()
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct OpenChatIntent: OpenIntent {
  static var title: LocalizedStringResource = "Open a chat"
  static var description = IntentDescription("Opens one of your chats with a Casama bot.")
  static var isDiscoverable = false
  @Parameter(title: "Chat") var target: ChatEntity

  @MainActor
  func perform() async throws -> some IntentResult {
    ShortcutBridge.shared.open(target.botId.isEmpty ? "/bots" : "/bots/\(target.botId)/chat?c=\(target.id)")
    return .result()
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct OpenRoutineIntent: OpenIntent {
  static var title: LocalizedStringResource = "Open a routine's bot"
  static var description = IntentDescription("Opens the bot that runs one of your Casama routines.")
  static var isDiscoverable = false
  @Parameter(title: "Routine") var target: RoutineEntity

  @MainActor
  func perform() async throws -> some IntentResult {
    let botId = target.id.split(separator: ":").last.map(String.init) ?? ""
    ShortcutBridge.shared.open(botId.isEmpty ? "/bots" : "/bots/\(botId)/routines")
    return .result()
  }
}

// MARK: Action button and additional Shortcuts actions (docs/APPLE-INTEGRATIONS-PLAN.md §6.3)

@available(iOS 16.0, macOS 13.0, *)
struct TalkToBotIntent: AppIntent {
  static var title: LocalizedStringResource = "Talk to a bot"
  static var description = IntentDescription("Opens voice mode with one of your Casama bots. Available on the Action button.")
  static var openAppWhenRun = true
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Bot") var bot: BotEntity?

  @MainActor
  func perform() async throws -> some IntentResult {
    let path = bot.map { "/bots/\($0.id)/chat?call=1" } ?? "/quick-ask?voice=1"
    ShortcutBridge.shared.open(path)
    return .result()
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct AskBotAndGetReplyIntent: AppIntent {
  static var title: LocalizedStringResource = "Ask a bot and get the reply"
  static var description = IntentDescription("Sends a question to a Casama bot and returns its reply text for chaining in Shortcuts.")
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Bot") var bot: BotEntity
  @Parameter(title: "Question") var question: String

  @MainActor
  func perform() async throws -> some IntentResult & ReturnsValue<String> {
    let args: [String: Any] = [
      "bot_id": bot.id,
      "text": question,
      "wait_ms": 20_000,
      "request_id": UUID().uuidString,
    ]
    guard let answer = await SiriBridge.shared.call("ask", args) else {
      return .result(value: "")
    }
    let text = (answer["text"] as? String) ?? (answer["say"] as? String) ?? ""
    return .result(value: text)
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct GetLastReplyIntent: AppIntent {
  static var title: LocalizedStringResource = "Get the last reply"
  static var description = IntentDescription("Returns the latest reply text from a Casama bot chat.")
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Bot") var bot: BotEntity

  @MainActor
  func perform() async throws -> some IntentResult & ReturnsValue<String> {
    guard let answer = await SiriBridge.shared.call("last_reply", ["bot_id": bot.id]),
          let text = answer["text"] as? String
    else {
      return .result(value: "")
    }
    return .result(value: text)
  }
}

@available(iOS 16.0, macOS 13.0, *)
struct StartComputerIntent: AppIntent {
  static var title: LocalizedStringResource = "Start a computer"
  static var description = IntentDescription("Wakes up a Casama computer after confirmation.")
  static var openAppWhenRun = false
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  @Parameter(title: "Computer name") var computerName: String?

  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    let label = (computerName?.isEmpty == false) ? computerName! : "your Casama computer"
    try await requestConfirmation(result: .result(dialog: "Start \(label)?"))
    guard let answer = await SiriBridge.shared.call("start_computer", ["name": computerName ?? ""]),
          let say = answer["say"] as? String
    else {
      return .result(dialog: "Open Casama to start your computer.")
    }
    return .result(dialog: IntentDialog(stringLiteral: say))
  }
}

// MARK: Phrases

@available(iOS 16.0, macOS 13.0, *)
struct CasamaShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: AskBotIntent(),
      phrases: ["Ask \(.applicationName)", "Ask a bot in \(.applicationName)", "Ask \(\.$bot) in \(.applicationName)"],
      shortTitle: "Ask a bot", systemImageName: "bubble.left")
    AppShortcut(
      intent: TalkToBotIntent(),
      phrases: ["Talk to a bot in \(.applicationName)", "Talk to \(\.$bot) in \(.applicationName)"],
      shortTitle: "Talk to a bot", systemImageName: "waveform")
    AppShortcut(
      intent: RunRoutineIntent(),
      phrases: ["Run a routine in \(.applicationName)", "Run \(\.$routine) in \(.applicationName)"],
      shortTitle: "Run a routine", systemImageName: "clock")
    AppShortcut(
      intent: WhatNeedsMeIntent(),
      phrases: ["What needs me in \(.applicationName)", "What's waiting in \(.applicationName)"],
      shortTitle: "What needs me", systemImageName: "tray")
  }
}

// MARK: Opening the app to finish

/// Has the system bring the app forward and open [link] there (Dart opens it once it is up).
@available(iOS 16.0, macOS 13.0, *)
@MainActor
func openApp(_ link: String, _ intent: some AppIntent) throws {
  ShortcutBridge.shared.open(link)
  if #available(iOS 16.4, macOS 13.3, *), let i = intent as? any ForegroundContinuableIntent {
    throw i.needsToContinueInForegroundError(openToFinish)
  }
}

@available(iOS 16.4, macOS 13.3, *)
extension AskBotIntent: ForegroundContinuableIntent {}
@available(iOS 16.4, macOS 13.3, *)
extension RunRoutineIntent: ForegroundContinuableIntent {}
@available(iOS 16.4, macOS 13.3, *)
extension WhatNeedsMeIntent: ForegroundContinuableIntent {}

// MARK: The reply as Siri shows it

struct SiriReplyView: View {
  let bot: String?
  let text: String?
  let note: String?

  var body: some View {
    if let text = text, !text.isEmpty {
      VStack(alignment: .leading, spacing: 6) {
        if let bot = bot {
          Text(bot).font(.headline)
        }
        Text(text).font(.body).lineLimit(14)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding()
    }
  }
}
