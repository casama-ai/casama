import SwiftUI
import WidgetKit

// MARK: - The iPhone and iPad widgets (D-405 §6.1, §6.2)
//
// Each answers one question. The views are in WidgetViews/ (shared with the Mac); what a widget
// shows comes from the glance (Glance.swift, GlanceTimeline.swift). The gallery's descriptions
// start with a verb, as Apple asks.

/// Every Home Screen widget can lose its background in StandBy and on tinted or clear Home
/// Screens; the views draw nothing that needs it.
private extension WidgetConfiguration {
  func glanceDefaults() -> some WidgetConfiguration {
    containerBackgroundRemovable(true)
  }
}

struct NeedsYouWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "NeedsYouWidget", provider: GlanceProvider()) { entry in
      NeedsYouFamilyView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetNeedsYou)
    .description(NativeL10n.widgetIosNeedsYouDescription)
    .supportedFamilies([.systemSmall, .systemMedium, .accessoryCircular, .accessoryRectangular])
    .glanceDefaults()
  }
}

struct NeedsYouFamilyView: View {
  let entry: GlanceEntry
  @Environment(\.widgetFamily) private var family
  var body: some View {
    switch family {
    case .accessoryCircular, .accessoryRectangular: NeedsYouAccessory(entry: entry)
    default: NeedsYouView(entry: entry)
    }
  }
}

/// Took over from Bot status under the same kind, so widgets people placed become this one.
struct BotWidget: Widget {
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: "BotStatusWidget", intent: ChooseBotIntent.self, provider: BotProvider()) { entry in
      BotFamilyView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetNameBot)
    .description(NativeL10n.widgetIosBotDescription)
    .supportedFamilies([.systemSmall, .systemMedium, .accessoryCircular, .accessoryRectangular])
    .glanceDefaults()
  }
}

struct BotFamilyView: View {
  let entry: GlanceEntry
  @Environment(\.widgetFamily) private var family
  var body: some View {
    switch family {
    case .accessoryCircular, .accessoryRectangular: BotAccessory(entry: entry)
    default: BotView(entry: entry)
    }
  }
}

struct AskWidget: Widget {
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: "AskWidget", intent: ChooseBotIntent.self, provider: BotProvider()) { entry in
      AskView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetAsk)
    .description(NativeL10n.widgetIosAskDescription)
    .supportedFamilies([.systemSmall, .systemMedium])
    .glanceDefaults()
  }
}

struct RoutinesWidget: Widget {
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: "RoutinesWidget", intent: ChooseRoutinesIntent.self, provider: RoutinesProvider()) { entry in
      RoutinesFamilyView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetNameRoutines)
    .description(NativeL10n.widgetIosRoutinesDescription)
    .supportedFamilies([.systemSmall, .systemMedium, .accessoryRectangular])
    .glanceDefaults()
  }
}

struct RoutinesFamilyView: View {
  let entry: GlanceEntry
  @Environment(\.widgetFamily) private var family
  var body: some View {
    switch family {
    case .accessoryRectangular: RoutinesAccessory(entry: entry)
    default: RoutinesView(entry: entry)
    }
  }
}

struct TodayWidget: Widget {
  /// Extra large portrait arrives with iOS 27.
  private var families: [WidgetFamily] {
    var f: [WidgetFamily] = [.systemLarge, .systemExtraLarge]
    if #available(iOS 27.0, *) { f.append(.systemExtraLargePortrait) }
    return f
  }

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "TodayWidget", provider: GlanceProvider(covers: true)) { entry in
      TodayView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetToday)
    .description(NativeL10n.widgetIosTodayDescription)
    .supportedFamilies(families)
    .glanceDefaults()
  }
}

// Brief and Tasks come in no small size, the only one CarPlay shows, so they never reach CarPlay
// (§10) without a disfavoredLocations line.
struct BriefWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "BriefWidget", provider: GlanceProvider()) { entry in
      BriefView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetBrief)
    .description(NativeL10n.widgetIosBriefDescription)
    .supportedFamilies([.systemMedium, .systemLarge])
    .glanceDefaults()
  }
}

struct LibraryWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "LibraryWidget", provider: GlanceProvider(covers: true)) { entry in
      LibraryView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetLibrary)
    .description(NativeL10n.widgetIosLibraryDescription)
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    // A cover is the whole small widget: keep it in StandBy and on tinted Home Screens.
    .containerBackgroundRemovable(false)
  }
}

struct TasksWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "TasksWidget", provider: GlanceProvider()) { entry in
      TasksView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetTasks)
    .description(NativeL10n.widgetIosTasksDescription)
    .supportedFamilies([.systemMedium, .systemLarge])
    .glanceDefaults()
  }
}

struct CreditsWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "CreditsWidget", provider: GlanceProvider()) { entry in
      CreditsFamilyView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetCredits)
    .description(NativeL10n.widgetIosCreditsDescription)
    .supportedFamilies([.systemSmall, .accessoryCircular])
    .glanceDefaults()
  }
}

struct CreditsFamilyView: View {
  let entry: GlanceEntry
  @Environment(\.widgetFamily) private var family
  var body: some View {
    switch family {
    case .accessoryCircular: CreditsAccessory(entry: entry)
    default: CreditsView(entry: entry)
    }
  }
}

/// The line above the clock.
struct CasamaInlineWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "CasamaInlineWidget", provider: GlanceProvider()) { entry in
      CasamaInlineView(entry: entry)
    }
    .configurationDisplayName("Casama")
    .description(NativeL10n.widgetIosInlineDescription)
    .supportedFamilies([.accessoryInline])
  }
}

/// What a bot put here (docs/BOT-WIDGET-PLAN.md §10.1): Automatic or one canvas, on the Home
/// Screen and the Lock Screen. Views in WidgetViews/CanvasViews.swift.
struct CanvasWidget: Widget {
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: CanvasFetch.kind, intent: ChooseCanvasIntent.self, provider: CanvasProvider()) { entry in
      CanvasWidgetView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetNameCanvas)
    .description(NativeL10n.widgetIosCanvasDescription)
    .supportedFamilies([
      .systemSmall, .systemMedium, .systemLarge, .systemExtraLarge,
      .accessoryRectangular, .accessoryInline, .accessoryCircular,
    ])
    .glanceDefaults()
  }
}

/// The Canvas widget kept out of CarPlay (its small size would reach it; §10.1) and refreshed by
/// server pushes, on the systems that have both (iOS 26).
@available(iOS 26.0, *)
struct CanvasWidgetPushed: Widget {
  var body: some WidgetConfiguration {
    CanvasWidget().body
      .disfavoredLocations([.carPlay], for: [.systemSmall])
      .pushHandler(GlancePushHandler.self)
  }
}

enum CanvasBundle {
  /// The Canvas widget under one kind on every system, as GlanceBundle.refreshable does for the
  /// others; CarPlay only exists where pushes do.
  static func widget() -> some Widget {
    WidgetBundleBuilder.buildOptional(pick())
  }

  private static func pick() -> any Widget & _LimitedAvailabilityWidgetMarker {
    if #available(iOS 26.0, *) {
      return WidgetBundleBuilder.buildLimitedAvailability(CanvasWidgetPushed())
    }
    return WidgetBundleBuilder.buildLimitedAvailability(CanvasWidget())
  }
}
