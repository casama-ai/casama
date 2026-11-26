import AppIntents
import CoreTransferable
import Foundation
import GeoToolbox
import LinkPresentation

// MARK: - Phase 3: Apple's app schemas (docs/SIRI-AI-PLAN.md §6.7, iOS 27 and macOS 27)
//
// The Messages domain lets Siri send to a bot, or draft for one, in the person's own words, with
// no set phrase: "tell Research in Casama to check the launch list". Bots are the people one
// writes to (`.messages.messagePerson`); a chat is a conversation (`.messages.conversation`).
// Contacts from the address book are never a destination. `.system.searchInApp` opens Casama's
// search with the words, and `.system.open` opens a chat.
//
// Send hands the words to Dart (`send`, siri_bridge.dart), which sends them as the signed-in
// person with every check the app makes. Siri says it is sent; the bot's reply arrives as a
// notification, as after any message. Draft opens the chat or Quick ask with the words in the box.
// Text only: files, pictures, places and scheduled sends are added in the app.
//
// The schema's other types get the smallest honest conformance: messages carry no words back to
// Siri (§4.4), and Casama has no effects, reactions or custom attachments.

/// A bot as someone to write to.
@available(iOS 27.0, macOS 27.0, *)
@AppEntity(schema: .messages.messagePerson)
struct BotPersonEntity: IndexedEntity {
  static let defaultQuery = BotPersonQuery()

  /// The bot's id; `me` for the person using Casama (the author of what they send).
  var id: String

  var person: IntentPerson

  /// The bot's own name, which matching uses. Siri gets "Milo (Casama)" as the person's name
  /// (`person`), so a card that offers to send to a bot always says which app the bot is in.
  var name: String

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "\(name)", subtitle: "A bot in \(BotPersonEntity.appName)")
  }

  init(id: String, name: String, isMe: Bool = false) {
    self.id = id
    self.name = name
    let shown = isMe ? name : "\(name) (\(BotPersonEntity.appName))"
    self.person = IntentPerson(identifier: .applicationDefined(id), name: .displayName(shown), handle: nil, isMe: isMe)
  }

  /// "Casama" (a test build's own name, such as "Casama Dev", so Siri can tell them apart).
  static let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "Casama"

  static let me = BotPersonEntity(id: "me", name: "Me", isMe: true)

  static func bots() -> [BotPersonEntity] {
    ShortcutStore.items("bots").map { BotPersonEntity(id: $0.id, name: $0.name) }
  }
}

@available(iOS 27.0, macOS 27.0, *)
struct BotPersonQuery: EntityStringQuery {
  func entities(for identifiers: [String]) async throws -> [BotPersonEntity] {
    let r = BotPersonEntity.bots().filter { identifiers.contains($0.id) }
    SiriProbeLog.add("person ids \(identifiers.count) -> \(r.count)")
    return r
  }

  func entities(matching string: String) async throws -> [BotPersonEntity] {
    let bots = BotPersonEntity.bots()
    var r = bots.filter { string.localizedCaseInsensitiveContains($0.person.displayName) || $0.name.localizedCaseInsensitiveContains(string) }
    // Siri on the Mac hands over the whole phrase it heard ("Milo in Casama"): then the one bot
    // whose name is in it counts, the same rule as a contact's name below.
    if r.isEmpty { r = BotPersonQuery.closest(to: string, in: bots) }
    SiriProbeLog.add("person match '\(string)' -> \(r.count)")
    return r
  }

  func suggestedEntities() async throws -> [BotPersonEntity] {
    let r = BotPersonEntity.bots()
    SiriProbeLog.add("person suggested -> \(r.count)")
    return r
  }
}

/// A person Siri names ("tell Research…") is matched to a bot by name.
@available(iOS 27.0, macOS 27.0, *)
extension BotPersonQuery: IntentValueQuery {
  func values(for input: [IntentPerson]) async throws -> [BotPersonEntity] {
    let bots = BotPersonEntity.bots()
    let r = input.flatMap { person in BotPersonQuery.closest(to: person.displayName, in: bots) }
    SiriProbeLog.add("person values: \(input.count) name(s) -> \(r.count) of \(bots.count) bots")
    return r
  }

  /// The bot whose name is [name]. Siri hears a bot's name and often hands over the closest
  /// contact instead (a contact named like "Nilo" for "Milo"), so when no name is equal, a bot
  /// whose name is one letter off from a word Siri heard counts, but only when exactly one does.
  static func closest(to name: String, in bots: [BotPersonEntity]) -> [BotPersonEntity] {
    let exact = bots.filter {
      $0.name.localizedCaseInsensitiveCompare(name) == .orderedSame
        || $0.person.displayName.localizedCaseInsensitiveCompare(name) == .orderedSame
    }
    if !exact.isEmpty { return exact }
    let heard = words(name)
    let near = bots.filter { bot in
      let mine = words(bot.name)
      return !mine.isEmpty && mine.allSatisfy { w in heard.contains { h in w == h || (w.count >= 4 && oneOff(w, h)) } }
    }
    return near.count == 1 ? near : []
  }

  private static func words(_ s: String) -> [String] {
    s.folding(options: [.caseInsensitive, .diacriticInsensitive], locale: nil)
      .split(whereSeparator: { !$0.isLetter && !$0.isNumber }).map(String.init)
  }

  /// At most one letter changed, added or dropped.
  private static func oneOff(_ a: String, _ b: String) -> Bool {
    let x = Array(a), y = Array(b)
    if abs(x.count - y.count) > 1 { return false }
    var i = 0, j = 0, edits = 0
    while i < x.count && j < y.count {
      if x[i] == y[j] { i += 1; j += 1; continue }
      edits += 1
      if edits > 1 { return false }
      if x.count > y.count { i += 1 } else if y.count > x.count { j += 1 } else { i += 1; j += 1 }
    }
    return edits + (x.count - i) + (y.count - j) <= 1
  }
}

// No `Transferable` export to `IntentPerson`, and bots aren't put in Spotlight as people
// (SiriIndex): with either, Siri handed a bot to Apple's Messages as a plain person and Messages
// sent real iMessages (2026-11-26, plan §17). A bot stays an entity only Casama's intents take.

/// A chat with a bot: its title and the bot, never what was said in it (§4.4).
@available(iOS 27.0, macOS 27.0, *)
@AppEntity(schema: .messages.conversation)
struct BotConversationEntity: IndexedEntity {
  static let defaultQuery = BotConversationQuery()

  var id: String
  var recipients: [BotPersonEntity]
  var displayName: String
  /// Always empty: Siri gets chat titles, not their words.
  var previewText: AttributedString
  var conversationName: String?
  var isRead: Bool
  var attributes: Set<BotConversationAttribute>
  var dateLastActive: Date?

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "\(displayName)", subtitle: "A chat with \(recipients.first?.name ?? "a bot") in Casama")
  }

  init(item: ShortcutItem) {
    id = item.id
    recipients = [BotPersonEntity(id: item.bot_id ?? "", name: item.detail ?? "")]
    displayName = item.name
    previewText = AttributedString("")
    conversationName = item.name
    isRead = true
    attributes = []
  }

  var botId: String { recipients.first?.id ?? "" }

  static func chats() -> [BotConversationEntity] {
    ShortcutStore.items("chats").map(BotConversationEntity.init(item:))
  }
}

@available(iOS 27.0, macOS 27.0, *)
struct BotConversationQuery: EntityStringQuery {
  func entities(for identifiers: [String]) async throws -> [BotConversationEntity] {
    BotConversationEntity.chats().filter { identifiers.contains($0.id) }
  }

  func entities(matching string: String) async throws -> [BotConversationEntity] {
    BotConversationEntity.chats().filter {
      $0.displayName.localizedCaseInsensitiveContains(string)
        || ($0.recipients.first?.name.localizedCaseInsensitiveContains(string) ?? false)
    }
  }

  func suggestedEntities() async throws -> [BotConversationEntity] { Array(BotConversationEntity.chats().prefix(10)) }
}

@available(iOS 27.0, macOS 27.0, *)
@AppEnum(schema: .messages.conversationAttribute)
enum BotConversationAttribute: String, AppEnum {
  case favorited
  static let caseDisplayRepresentations: [BotConversationAttribute: DisplayRepresentation] = [.favorited: "Favorited"]
}

/// A message Siri sent. It carries no words back (§4.4); only who it went to and when.
@available(iOS 27.0, macOS 27.0, *)
@AppEntity(schema: .messages.message)
struct BotMessageEntity: AppEntity {
  static let defaultQuery = BotMessageQuery()

  var id: String
  var messageType: BotMessageType
  var author: BotPersonEntity
  var isRead: Bool
  var attributes: Set<BotMessageAttribute>
  var conversation: BotConversationEntity
  var date: Date
  var subject: AttributedString?
  var body: AttributedString?
  var attachments: [IntentFile]
  var audioMessage: IntentFile?
  var customAttachments: [BotCustomAttachment]
  var locations: [PlaceDescriptor]
  var links: [LinkPresentation.LinkMetadata]
  var messageEffect: BotMessageEffect?
  var reaction: BotMessageReaction?
  var referencedMessage: BotMessageEntity?
  var notificationIdentifier: String?

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "Sent to \(conversation.recipients.first?.name ?? "a bot")", subtitle: "\(conversation.displayName)")
  }

  init(id: String, conversation: BotConversationEntity) {
    self.id = id
    messageType = .unspecified
    author = .me
    isRead = true
    attributes = []
    self.conversation = conversation
    date = Date()
    attachments = []
    customAttachments = []
    locations = []
    links = []
  }
}

@available(iOS 27.0, macOS 27.0, *)
struct BotMessageQuery: EntityQuery {
  /// Messages aren't looked up again: Siri only gets the ones Send returns.
  func entities(for identifiers: [String]) async throws -> [BotMessageEntity] { [] }
}

@available(iOS 27.0, macOS 27.0, *)
@AppEntity(schema: .messages.customAttachment)
struct BotCustomAttachment: AppEntity {
  static let defaultQuery = BotCustomAttachmentQuery()
  var id: String
  var sourceName: AttributedString?
  var description: AttributedString?
  var displayRepresentation: DisplayRepresentation { DisplayRepresentation(title: "\(description ?? "")") }

  struct BotCustomAttachmentQuery: EntityQuery {
    /// Casama has no custom attachments.
    func entities(for identifiers: [String]) async throws -> [BotCustomAttachment] { [] }
  }
}

@available(iOS 27.0, macOS 27.0, *)
@AppEnum(schema: .messages.messageType)
enum BotMessageType: String, AppEnum {
  case unspecified
  static let caseDisplayRepresentations: [BotMessageType: DisplayRepresentation] = [.unspecified: "Message"]
}

@available(iOS 27.0, macOS 27.0, *)
@AppEnum(schema: .messages.messageAttribute)
enum BotMessageAttribute: String, AppEnum {
  case favorited
  static let caseDisplayRepresentations: [BotMessageAttribute: DisplayRepresentation] = [.favorited: "Favorited"]
}

@available(iOS 27.0, macOS 27.0, *)
@AppEnum(schema: .messages.messageEffect)
enum BotMessageEffect: String, AppEnum {
  case none
  static let caseDisplayRepresentations: [BotMessageEffect: DisplayRepresentation] = [.none: "None"]
}

@available(iOS 27.0, macOS 27.0, *)
@UnionValue
enum BotMessageReaction: Sendable {
  case customReaction(BotCustomReaction)
}

@available(iOS 27.0, macOS 27.0, *)
@AppEnum(schema: .messages.customReaction)
enum BotCustomReaction: String, AppEnum {
  case none
  static let caseDisplayRepresentations: [BotCustomReaction: DisplayRepresentation] = [.none: "None"]
}

// MARK: Where a message goes

/// One bot, or several (Casama sends to one at a time and says so).
@available(iOS 27.0, macOS 27.0, *)
@UnionValue
enum BotMessageDestination {
  case contact(BotPersonEntity)
  case recipients([BotPersonEntity])

  var bots: [BotPersonEntity] {
    switch self {
    case let .contact(bot): return [bot]
    case let .recipients(bots): return bots
    }
  }
}

/// Why Siri couldn't send or draft; each case is what Siri says.
@available(iOS 27.0, macOS 27.0, *)
enum SiriMessageError: Error, CustomLocalizedStringResourceConvertible {
  case oneBot
  case textOnly
  case noBot
  case notSent(String)

  var localizedStringResource: LocalizedStringResource {
    switch self {
    case .oneBot: return "Casama sends to one bot at a time. Which bot?"
    case .textOnly: return "Siri can send words to a bot. Add files, pictures and places in Casama."
    case .noBot: return "I couldn't find that bot in Casama."
    case let .notSent(say): return "\(say)"
    }
  }
}

// MARK: Send

@available(iOS 27.0, macOS 27.0, *)
@AppIntent(schema: .messages.sendMessage)
struct SendMessageIntent: AppIntent {
  static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

  var destination: BotMessageDestination
  var subject: AttributedString?
  var content: AttributedString?
  @Parameter(supportedContentTypes: [.image]) var attachments: [IntentFile]
  @Parameter(supportedContentTypes: [.audio]) var audioMessage: IntentFile?
  var locations: [PlaceDescriptor]
  var links: [URL]
  var scheduledDate: Date?

  @MainActor
  func perform() async throws -> some ReturnsValue<[BotMessageEntity]> {
    let bots = destination.bots
    SiriProbeLog.add("send perform: \(bots.count) bot(s), text \(content.map { String($0.characters).count } ?? 0) chars")
    guard bots.count == 1, let bot = bots.first else { throw SiriMessageError.oneBot }
    guard attachments.isEmpty, audioMessage == nil, locations.isEmpty, scheduledDate == nil else { throw SiriMessageError.textOnly }
    guard BotPersonEntity.bots().contains(where: { $0.id == bot.id }) else { throw SiriMessageError.noBot }
    let text = SiriMessageText.join(subject: subject, content: content, links: links)
    guard !text.isEmpty else { throw $content.needsValueError("What should I send?") }

    let answer = await SiriBridge.shared.call("send", ["bot_id": bot.id, "text": text, "request_id": UUID().uuidString])
    SiriProbeLog.add("send answered \(answer?["status"] as? String ?? "nil")")
    guard let answer = answer, let status = answer["status"] as? String else {
      ShortcutBridge.shared.open(askLink(bot: bot.id, text: text))
      throw SiriMessageError.notSent("Opening Casama to finish.")
    }
    if status == "sent" { SiriMessageText.sent(text) }
    if status != "sent" {
      if let link = answer["open"] as? String { ShortcutBridge.shared.open(link) }
      throw SiriMessageError.notSent(answer["say"] as? String ?? "Opening Casama to finish.")
    }
    let conversationId = answer["conversation_id"] as? String ?? ""
    let chat = BotConversationEntity(item: ShortcutItem(id: conversationId, name: answer["title"] as? String ?? bot.name, detail: bot.name, bot_id: bot.id))
    chat.dateLastActive = Date()
    return .result(value: [BotMessageEntity(id: answer["message_id"] as? String ?? UUID().uuidString, conversation: chat)])
  }

  private func askLink(bot: String, text: String) -> String {
    var c = URLComponents()
    c.path = "/quick-ask"
    c.queryItems = [URLQueryItem(name: "text", value: text), URLQueryItem(name: "bot", value: bot)]
    return c.string ?? "/quick-ask"
  }
}

// MARK: Draft

@available(iOS 27.0, macOS 27.0, *)
@AppIntent(schema: .messages.draftMessage)
struct DraftMessageIntent: AppIntent {
  /// Background first, so a Draft that repeats a Send (below) opens nothing; otherwise it comes
  /// forward to show the chat with the words.
  static let supportedModes: IntentModes = [.background, .foreground(.dynamic)]

  var destination: BotMessageDestination?
  var subject: AttributedString?
  var content: AttributedString?
  @Parameter(supportedContentTypes: [.image]) var attachments: [IntentFile]
  @Parameter(supportedContentTypes: [.audio]) var audioMessage: IntentFile?
  var locations: [PlaceDescriptor]
  var links: [URL]
  var scheduledDate: Date?

  @MainActor
  func perform() async throws -> some IntentResult {
    let bots = destination?.bots ?? []
    guard bots.count <= 1 else { throw SiriMessageError.oneBot }
    let text = SiriMessageText.join(subject: subject, content: content, links: links)
    let echo = bots.isEmpty && SiriMessageText.isEcho(text)
    SiriProbeLog.add("draft perform: \(bots.count) bot(s), \(text.count) chars\(echo ? ", already sent: not opened" : "")")
    if echo { return .result() }
    try await continueInForeground(alwaysConfirm: false)
    var c = URLComponents()
    if let bot = bots.first, !bot.id.isEmpty {
      c.path = "/bots/\(bot.id)/chat"
      c.queryItems = text.isEmpty ? nil : [URLQueryItem(name: "draft", value: text)]
    } else {
      c.path = "/quick-ask"
      c.queryItems = [URLQueryItem(name: "text", value: text)]
    }
    ShortcutBridge.shared.open(c.string ?? "/quick-ask")
    return .result()
  }
}

// MARK: Search and open

@available(iOS 27.0, macOS 27.0, *)
@AppIntent(schema: .system.searchInApp)
struct SearchCasamaIntent: AppIntent {
  static let openAppWhenRun = true

  var criteria: StringSearchCriteria

  @MainActor
  func perform() async throws -> some IntentResult {
    SiriProbeLog.add("search perform: \(criteria.term.count) chars")
    var c = URLComponents()
    c.path = "/search"
    c.queryItems = [URLQueryItem(name: "q", value: criteria.term)]
    ShortcutBridge.shared.open(c.string ?? "/search")
    return .result()
  }
}

@available(iOS 27.0, macOS 27.0, *)
@AppIntent(schema: .system.open)
struct OpenBotConversationIntent: OpenIntent {
  static let title: LocalizedStringResource = "Open a chat"
  static let description: IntentDescription = "Opens one of your chats with a Casama bot."

  @Parameter var target: BotConversationEntity

  @MainActor
  func perform() async throws -> some IntentResult {
    ShortcutBridge.shared.open(target.botId.isEmpty ? "/bots" : "/bots/\(target.botId)/chat?c=\(target.id)")
    return .result()
  }
}

/// Opens a bot's chat: what a bot found in Spotlight opens (from iOS 27 Spotlight holds bots as
/// Messages people, so this is the bot result there).
@available(iOS 27.0, macOS 27.0, *)
struct OpenBotPersonIntent: OpenIntent {
  static let title: LocalizedStringResource = "Open a bot"
  static let description: IntentDescription = "Opens a Casama bot's chat."
  static var isDiscoverable = false

  @Parameter var target: BotPersonEntity

  @MainActor
  func perform() async throws -> some IntentResult {
    ShortcutBridge.shared.open(target.id.isEmpty || target.id == "me" ? "/bots" : "/bots/\(target.id)/chat")
    return .result()
  }
}

@available(iOS 16.0, macOS 13.0, *)
extension IntentPerson {
  /// The name as one string (a bot's name; Siri's own spelling for a person it heard).
  var displayName: String {
    switch name {
    case let .displayName(name): return name
    case let .components(parts): return parts.formatted(.name(style: .long))
    case .unknown: return ""
    @unknown default: return ""
    }
  }
}

/// The words Siri passes, as one message: a subject goes first, links last.
enum SiriMessageText {
  @available(iOS 15.0, macOS 12.0, *)
  static func join(subject: AttributedString?, content: AttributedString?, links: [URL]) -> String {
    let parts = [subject.map { String($0.characters) }, content.map { String($0.characters) }]
      .compactMap { $0?.trimmingCharacters(in: .whitespacesAndNewlines) }
      .filter { !$0.isEmpty }
      + links.map(\.absoluteString)
    return parts.joined(separator: "\n\n")
  }

  /// What Send just sent and when. On iOS 27 Siri's draft preview sends with Send, then may also
  /// run Draft with no bot and the same words (seen on the iPhone, 2026-11-25); that Draft would
  /// open Quick ask with words already sent.
  private static var lastSent: (text: String, at: Date)?

  static func sent(_ text: String, at: Date = Date()) { lastSent = (text, at) }

  /// True when a Draft with no bot repeats what Send sent in the last 30 seconds (or has no words).
  static func isEcho(_ text: String, now: Date = Date()) -> Bool {
    if text.isEmpty { return true }
    guard let last = lastSent, now.timeIntervalSince(last.at) < 30 else { return false }
    return last.text.trimmingCharacters(in: .whitespacesAndNewlines).caseInsensitiveCompare(text.trimmingCharacters(in: .whitespacesAndNewlines)) == .orderedSame
  }
}
