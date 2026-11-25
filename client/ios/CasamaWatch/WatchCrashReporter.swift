import Foundation
#if canImport(Sentry)
import Sentry
#endif

// MARK: - Apple Watch crash reporting (D-417, D-539)
//
// Official builds embed the public Sentry DSN via CasamaWatch/WatchTelemetry.xcconfig (gitignored,
// written by scripts/package-ios.sh when CASAMA_OFFICIAL_BUILD=1). Dev and self-hosted builds carry
// no DSN and send nothing. Respects both the watch's "Share crash reports" toggle and the account's
// `analytics_opt_out` flag from GET /v1/watch/me, plus remote `crash_reporter == "none"`.

enum WatchCrashReporter {
  private static var started = false

  static var effectiveConsent: Bool {
    WatchAccount.shareCrashReports && !WatchAccount.serverAnalyticsOptOut
  }

  static func start() {
    guard !started else { return }
    let dsn = (Bundle.main.object(forInfoDictionaryKey: "CasamaSentryDSN") as? String ?? "")
      .trimmingCharacters(in: .whitespacesAndNewlines)
    let chosen = WatchCrashPolicy.choose(
      remote: WatchAccount.remoteCrashReporter,
      dsn: dsn,
      consent: effectiveConsent
    )
    guard chosen == "sentry" else { return }
    started = true
    #if canImport(Sentry)
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "0.0.0"
    let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "0"
    #if DEBUG
    let env = "development"
    #else
    let env = "production"
    #endif
    SentrySDK.start { options in
      options.dsn = dsn
      options.sendDefaultPii = false
      options.maxBreadcrumbs = 0
      options.enableAutoSessionTracking = false
      options.releaseName = "ai.casama.app@\(version)+\(build)"
      options.environment = env
      options.beforeSend = { event in
        guard WatchCrashReporter.effectiveConsent else { return nil }
        event.user = nil
        var tags = event.tags ?? [:]
        tags["surface"] = "watchos"
        event.tags = tags
        if let msg = event.message {
          let clean = SentryMessage(formatted: WatchCrashPolicy.scrub(msg.formatted))
          if let m = msg.message { clean.message = WatchCrashPolicy.scrub(m) }
          event.message = clean
        }
        if let exceptions = event.exceptions {
          for ex in exceptions {
            if let value = ex.value { ex.value = WatchCrashPolicy.scrub(value) }
          }
        }
        return event
      }
    }
    #endif
  }

  static func applyConsent() {
    if effectiveConsent && !started {
      start()
    }
  }
}
