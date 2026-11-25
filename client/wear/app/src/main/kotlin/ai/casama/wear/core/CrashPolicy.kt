package ai.casama.wear.core

/**
 * Crash reporting policy for Wear OS (D-417, D-539): pure logic tested on the JVM.
 *
 * One reporter runs per launch (`SENTRY`, `CRASHLYTICS`, or `NONE`). Remote `crash_reporter`
 * (`wear` over `default`, delivered in `WatchSelf`) takes precedence over the build's own
 * `ERROR_REPORTING`, and `none` or opt-out always wins.
 */
enum class CrashReporterKind { SENTRY, CRASHLYTICS, NONE }

object CrashPolicy {
    private val secrets = listOf(
        Regex("""\b(sk|pk|rk)-[A-Za-z0-9_-]{12,}"""),
        Regex("""\bBearer\s+[A-Za-z0-9._~+/=-]{8,}""", RegexOption.IGNORE_CASE),
        Regex("""\beyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{5,}"""),
        Regex("""\b(gh[pousr]_[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16})\b"""),
        Regex("""[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}"""),
    )

    fun parse(raw: String?): CrashReporterKind? = when (raw?.trim()?.lowercase()) {
        "sentry" -> CrashReporterKind.SENTRY
        "crashlytics" -> CrashReporterKind.CRASHLYTICS
        "none" -> CrashReporterKind.NONE
        else -> null
    }

    /** Picks the single active crash reporter for this launch (D-417). */
    fun choose(
        remote: String?,
        buildMode: String,
        hasSentry: Boolean,
        hasCrashlytics: Boolean,
        consent: Boolean,
    ): CrashReporterKind {
        if (!consent || buildMode.trim().equals("none", ignoreCase = true)) {
            return CrashReporterKind.NONE
        }
        val available = buildSet {
            if (hasSentry) add(CrashReporterKind.SENTRY)
            if (hasCrashlytics) add(CrashReporterKind.CRASHLYTICS)
        }
        if (available.isEmpty()) return CrashReporterKind.NONE

        val remoteKind = parse(remote)
        if (remoteKind == CrashReporterKind.NONE) return CrashReporterKind.NONE
        if (remoteKind != null && remoteKind in available) return remoteKind

        val buildKind = when (buildMode.trim().lowercase()) {
            "sentry" -> CrashReporterKind.SENTRY
            "crashlytics" -> CrashReporterKind.CRASHLYTICS
            "none" -> CrashReporterKind.NONE
            else -> when {
                CrashReporterKind.SENTRY in available -> CrashReporterKind.SENTRY
                CrashReporterKind.CRASHLYTICS in available -> CrashReporterKind.CRASHLYTICS
                else -> CrashReporterKind.NONE
            }
        }
        return if (buildKind in available) buildKind else CrashReporterKind.NONE
    }

    /** Removes tokens, secrets and email addresses, and truncates long messages. */
    fun scrub(text: String, max: Int = 500): String {
        var out = text
        for (re in secrets) out = re.replace(out, "[redacted]")
        return if (out.length > max) out.take(max) + "…" else out
    }
}
