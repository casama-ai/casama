package ai.casama.wear.data

import ai.casama.wear.BuildConfig
import ai.casama.wear.core.CrashPolicy
import ai.casama.wear.core.CrashReporterKind
import ai.casama.wear.notify.PushSetup
import android.content.Context
import com.google.firebase.FirebaseApp
import com.google.firebase.crashlytics.FirebaseCrashlytics
import io.sentry.SentryEvent
import io.sentry.SentryOptions
import io.sentry.android.core.SentryAndroid

/**
 * Wear OS crash reporter (D-417, D-539).
 *
 * Runs at most one reporter per launch (Sentry or Firebase Crashlytics), only in official builds
 * carrying credentials from `client/config/telemetry.json`, and only while both the watch's own
 * "Share crash reports" toggle is on and the account/workspace hasn't set `analytics_opt_out`.
 */
object CrashReporter {
    @Volatile
    private var active: CrashReporterKind = CrashReporterKind.NONE

    @Volatile
    private var consentOn: Boolean = true

    fun init(context: Context, settings: Settings) {
        consentOn = effectiveConsent(settings)
        val hasSentry = BuildConfig.SENTRY_DSN.isNotBlank()
        val hasCrashlytics = BuildConfig.CRASHLYTICS_ENABLED &&
            PushSetup.configured &&
            FirebaseApp.getApps(context).isNotEmpty()

        val chosen = CrashPolicy.choose(
            remote = settings.remoteCrashReporter,
            buildMode = BuildConfig.ERROR_REPORTING,
            hasSentry = hasSentry,
            hasCrashlytics = hasCrashlytics,
            consent = consentOn,
        )
        active = chosen

        when (chosen) {
            CrashReporterKind.SENTRY -> {
                stopCrashlytics(hasCrashlytics)
                startSentry(context)
            }
            CrashReporterKind.CRASHLYTICS -> startCrashlytics()
            CrashReporterKind.NONE -> stopCrashlytics(hasCrashlytics)
        }
    }

    /** Applies a change to the watch toggle or account opt-out immediately. */
    fun applyConsent(settings: Settings) {
        val next = effectiveConsent(settings)
        consentOn = next
        if (active == CrashReporterKind.CRASHLYTICS) {
            runCatching {
                val c = FirebaseCrashlytics.getInstance()
                c.setCrashlyticsCollectionEnabled(next)
                if (!next) c.deleteUnsentReports()
            }
        }
    }

    private fun effectiveConsent(settings: Settings): Boolean =
        settings.switches.value.shareCrashReports && !settings.serverAnalyticsOptOut

    private fun startSentry(context: Context) {
        runCatching {
            SentryAndroid.init(context) { options ->
                options.dsn = BuildConfig.SENTRY_DSN
                options.isSendDefaultPii = false
                options.maxBreadcrumbs = 0
                options.isEnableAutoSessionTracking = false
                options.environment = if (BuildConfig.DEBUG) "development" else "production"
                options.release = "ai.casama.app@${BuildConfig.VERSION_NAME}+${BuildConfig.VERSION_CODE}"
                options.setTag("surface", "wear")
                options.beforeSend = SentryOptions.BeforeSendCallback { event, _ ->
                    if (!consentOn) return@BeforeSendCallback null
                    scrubEvent(event)
                }
            }
        }
    }

    private fun scrubEvent(event: SentryEvent): SentryEvent {
        event.user = null
        event.message?.let { msg ->
            msg.message = msg.message?.let { CrashPolicy.scrub(it) }
            msg.formatted = msg.formatted?.let { CrashPolicy.scrub(it) }
        }
        event.exceptions?.forEach { ex ->
            ex.value = ex.value?.let { CrashPolicy.scrub(it) }
        }
        return event
    }

    private fun startCrashlytics() {
        runCatching {
            val c = FirebaseCrashlytics.getInstance()
            c.setCrashlyticsCollectionEnabled(true)
            c.setCustomKey("surface", "wear")
            c.setCustomKey("environment", if (BuildConfig.DEBUG) "development" else "production")
        }
    }

    private fun stopCrashlytics(hasFirebase: Boolean) {
        if (!hasFirebase) return
        runCatching {
            val c = FirebaseCrashlytics.getInstance()
            c.setCrashlyticsCollectionEnabled(false)
            c.deleteUnsentReports()
        }
    }
}
