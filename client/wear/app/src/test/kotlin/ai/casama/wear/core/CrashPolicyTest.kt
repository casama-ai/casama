package ai.casama.wear.core

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class CrashPolicyTest {
    @Test
    fun choosesOneReporterAndHonorsConsentAndRemote() {
        // Default: sentry when available
        assertEquals(
            CrashReporterKind.SENTRY,
            CrashPolicy.choose(null, "auto", hasSentry = true, hasCrashlytics = true, consent = true),
        )
        // Remote switch to crashlytics
        assertEquals(
            CrashReporterKind.CRASHLYTICS,
            CrashPolicy.choose("crashlytics", "sentry", hasSentry = true, hasCrashlytics = true, consent = true),
        )
        // Remote none always wins
        assertEquals(
            CrashReporterKind.NONE,
            CrashPolicy.choose("none", "sentry", hasSentry = true, hasCrashlytics = true, consent = true),
        )
        // Consent off always wins
        assertEquals(
            CrashReporterKind.NONE,
            CrashPolicy.choose("sentry", "sentry", hasSentry = true, hasCrashlytics = true, consent = false),
        )
        // Build mode none rules everything out
        assertEquals(
            CrashReporterKind.NONE,
            CrashPolicy.choose("crashlytics", "none", hasSentry = true, hasCrashlytics = true, consent = true),
        )
        // Falls back to build default if remote choice isn't available
        assertEquals(
            CrashReporterKind.SENTRY,
            CrashPolicy.choose("crashlytics", "sentry", hasSentry = true, hasCrashlytics = false, consent = true),
        )
        // Unofficial build with no keys sends nothing
        assertEquals(
            CrashReporterKind.NONE,
            CrashPolicy.choose(null, "auto", hasSentry = false, hasCrashlytics = false, consent = true),
        )
    }

    @Test
    fun scrubsSecretsAndEmails() {
        val raw = "Bearer secret_token_12345 for alice@example.com with sk-1234567890abcdef"
        val cleaned = CrashPolicy.scrub(raw)
        assertFalse(cleaned.contains("secret_token_12345"))
        assertFalse(cleaned.contains("alice@example.com"))
        assertFalse(cleaned.contains("sk-1234567890abcdef"))
        assertTrue(cleaned.contains("[redacted]"))
    }
}
