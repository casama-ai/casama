import AppIntents
import Foundation

// MARK: - Which canvas a Canvas widget shows (docs/BOT-WIDGET-PLAN.md §10.1, §11.3)
//
// Automatic (the canvas set most recently) or one named canvas, from the list stored in the app
// group (Canvas.swift). Shared by the iPhone and Mac widget extensions.

@available(iOS 17.0, macOS 14.0, *)
struct WidgetCanvasEntity: AppEntity {
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: LocalizedStringResource("siriCanvas", defaultValue: "Canvas", table: "Native"))
  static var defaultQuery = WidgetCanvasQuery()
  /// The id that stands for Automatic.
  static let automaticId = "automatic"

  let id: String
  let name: String
  let bot: String

  var isAutomatic: Bool { id == Self.automaticId }

  var displayRepresentation: DisplayRepresentation {
    if isAutomatic {
      return DisplayRepresentation(
        title: LocalizedStringResource("siriAutomatic", defaultValue: "Automatic", table: "Native"),
        subtitle: LocalizedStringResource("siriAutomaticSubtitle", defaultValue: "What a bot set most recently", table: "Native"))
    }
    return DisplayRepresentation(title: "\(bot.isEmpty ? name : "\(name) · \(bot)")")
  }

  init(id: String, name: String, bot: String) {
    self.id = id
    self.name = name
    self.bot = bot
  }

  init(_ canvas: BotCanvas) { self.init(id: canvas.id, name: canvas.name, bot: canvas.bot) }

  static let automatic = WidgetCanvasEntity(id: automaticId, name: NativeL10n.siriAutomatic, bot: "")
}

@available(iOS 17.0, macOS 14.0, *)
struct WidgetCanvasQuery: EntityQuery {
  private var canvases: [WidgetCanvasEntity] {
    let shown = (CanvasStore.load()?.items ?? []).filter { $0.status == "shown" }
    return [WidgetCanvasEntity.automatic] + shown.map(WidgetCanvasEntity.init)
  }

  func entities(for identifiers: [String]) async throws -> [WidgetCanvasEntity] {
    let all = canvases
    // A picked canvas that's gone keeps its id: the widget shows "no canvas yet" (plan §6.5).
    return identifiers.map { id in all.first { $0.id == id } ?? WidgetCanvasEntity(id: id, name: NativeL10n.siriCanvas, bot: "") }
  }
  func suggestedEntities() async throws -> [WidgetCanvasEntity] { canvases }
  /// A new widget shows Automatic.
  func defaultResult() async -> WidgetCanvasEntity? { .automatic }
}

/// The Canvas widget's setting.
@available(iOS 17.0, macOS 14.0, *)
struct ChooseCanvasIntent: WidgetConfigurationIntent {
  static var title: LocalizedStringResource = LocalizedStringResource("siriChooseCanvas", defaultValue: "Choose a canvas", table: "Native")
  static var description = IntentDescription(LocalizedStringResource("siriChooseCanvasDescription", defaultValue: "Show what a bot set most recently, or one canvas.", table: "Native"))

  @Parameter(title: LocalizedStringResource("siriCanvas", defaultValue: "Canvas", table: "Native"))
  var canvas: WidgetCanvasEntity?

  init() {}
  init(canvas: WidgetCanvasEntity?) { self.canvas = canvas }

  /// The picked canvas's id, or nil for Automatic.
  var canvasId: String? {
    guard let c = canvas, !c.isAutomatic else { return nil }
    return c.id
  }
}
