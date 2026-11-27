import SwiftUI
import WidgetKit

// MARK: - The Mac's own widgets (D-405 §6.5, Phase 5)
//
// The iPhone's views (client/ios/CasamaWidgets/WidgetViews, built into this target too), on the
// desktop and in Notification Center. View only: a Mac widget can't run its buttons inside the
// app, so every click opens Casama at the right place (ActButton), and Allow, Deny and Stop stay
// with the notch and the menu bar panel. The glance comes from the Team-ID-named app group that
// MacBridge writes (MainFlutterWindow.swift).

@main
struct CasamaWidgetsMac: WidgetBundle {
  var body: some Widget {
    GlanceBundle.refreshable(MacNeedsYouWidget.self)
    GlanceBundle.refreshable(MacBotWidget.self)
    GlanceBundle.refreshable(MacRoutinesWidget.self)
    GlanceBundle.refreshable(MacTodayWidget.self)
    GlanceBundle.refreshable(MacBriefWidget.self)
    GlanceBundle.refreshable(MacLibraryWidget.self)
    GlanceBundle.refreshable(MacTasksWidget.self)
    GlanceBundle.refreshable(MacCreditsWidget.self)
    GlanceBundle.refreshable(MacCanvasWidget.self)
    if #available(macOS 26.0, *) {
      AskCasamaControl()
      TalkToBotControl()
      RunRoutineControl()
    }
  }
}

struct MacNeedsYouWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "NeedsYouWidget", provider: GlanceProvider()) { entry in
      NeedsYouView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetNeedsYou)
    .description(NativeL10n.widgetMacNeedsYouDescription)
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

struct MacBotWidget: Widget {
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: "BotStatusWidget", intent: ChooseBotIntent.self, provider: BotProvider()) { entry in
      BotView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetNameBot)
    .description(NativeL10n.widgetIosBotDescription)
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

struct MacRoutinesWidget: Widget {
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: "RoutinesWidget", intent: ChooseRoutinesIntent.self, provider: RoutinesProvider()) { entry in
      RoutinesView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetNameRoutines)
    .description(NativeL10n.widgetMacRoutinesDescription)
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

struct MacTodayWidget: Widget {
  /// Extra large portrait arrives with macOS 27.
  private var families: [WidgetFamily] {
    var f: [WidgetFamily] = [.systemLarge, .systemExtraLarge]
    if #available(macOS 27.0, *) { f.append(.systemExtraLargePortrait) }
    return f
  }

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "TodayWidget", provider: GlanceProvider(covers: true)) { entry in
      TodayView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetToday)
    .description(NativeL10n.widgetIosTodayDescription)
    .supportedFamilies(families)
  }
}

struct MacBriefWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "BriefWidget", provider: GlanceProvider()) { entry in
      BriefView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetBrief)
    .description(NativeL10n.widgetIosBriefDescription)
    .supportedFamilies([.systemMedium, .systemLarge])
  }
}

struct MacLibraryWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "LibraryWidget", provider: GlanceProvider(covers: true)) { entry in
      LibraryView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetLibrary)
    .description(NativeL10n.widgetIosLibraryDescription)
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}

struct MacTasksWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "TasksWidget", provider: GlanceProvider()) { entry in
      TasksView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetTasks)
    .description(NativeL10n.widgetIosTasksDescription)
    .supportedFamilies([.systemMedium, .systemLarge])
  }
}

struct MacCreditsWidget: Widget {
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: "CreditsWidget", provider: GlanceProvider()) { entry in
      CreditsView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetCredits)
    .description(NativeL10n.widgetIosCreditsDescription)
    .supportedFamilies([.systemSmall])
  }
}

/// What a bot put here (docs/BOT-WIDGET-PLAN.md §10.1). The Mac app writes the canvases and their
/// pictures into the app group (MacBridge `canvases`); the widget only reads them.
struct MacCanvasWidget: Widget {
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: CanvasFetch.kind, intent: ChooseCanvasIntent.self, provider: CanvasProvider()) { entry in
      CanvasWidgetView(entry: entry)
    }
    .configurationDisplayName(NativeL10n.widgetNameCanvas)
    .description(NativeL10n.widgetIosCanvasDescription)
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
  }
}
