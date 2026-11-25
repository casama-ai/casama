package ai.casama.wear.core

import kotlinx.serialization.json.buildJsonArray
import kotlinx.serialization.json.buildJsonObject
import kotlinx.serialization.json.put

/**
 * Which screens the app showed, for usage counts (D-535, POST /v1/watch/events). Each screen and
 * where it was opened from is sent at most once a day (UTC). Only the screen's name goes, never an
 * id or anything on it. Pure Kotlin so it is tested without Android.
 */
class ScreenCount(
    /** Already sent today, as "screen|surface", and the day they belong to. */
    private var day: String = "",
    sent: Set<String> = emptySet(),
) {
    private val sent = sent.toMutableSet()
    private val pending = LinkedHashSet<String>()

    /** Counts [screen] on [today]; true when it is new and waits to be sent. */
    @Synchronized
    fun viewed(screen: String, surface: String, today: String): Boolean {
        if (screen !in SCREENS) return false
        val s = if (surface in SURFACES) surface else "app"
        if (today != day) {
            day = today
            sent.clear()
        }
        val key = "$screen|$s"
        if (key in sent || key in pending) return false
        pending += key
        return true
    }

    /** Up to 20 waiting events, still waiting until [sentOk] or [dropped]. */
    @Synchronized
    fun batch(): List<String> = pending.take(MAX_BATCH)

    @Synchronized
    fun sentOk(batch: List<String>) {
        pending.removeAll(batch.toSet())
        sent += batch
    }

    /** The server won't take them (signed out, refused): asking again won't help. */
    @Synchronized
    fun dropped(batch: List<String>) {
        pending.removeAll(batch.toSet())
    }

    @Synchronized
    fun saved(): Pair<String, Set<String>> = day to sent.toSet()

    companion object {
        const val MAX_BATCH = 20

        /** The same names the Apple Watch sends (WATCH_SCREENS in packages/contracts/src/watch.ts). */
        val SCREENS = setOf(
            "now", "needs", "request", "suggestion", "elsewhere", "ask", "run",
            "chat", "bots", "up_next", "brief", "talk", "settings",
        )
        val SURFACES = setOf("app", "notification", "complication", "smart_stack", "tile", "control", "siri")

        /** The screen a navigation route pattern ("chat/{bot}/{conv}") shows; null for one not counted. */
        fun screenFor(route: String?): String? = when (route?.substringBefore('/')) {
            "now" -> "now"
            "needs" -> "needs"
            "request" -> "request"
            "suggestion" -> "suggestion"
            "elsewhere" -> "elsewhere"
            "ask" -> "ask"
            "working" -> "run"
            "chat" -> "chat"
            "bots" -> "bots"
            "upnext" -> "up_next"
            "brief" -> "brief"
            "talk" -> "talk"
            "settings" -> "settings"
            else -> null
        }

        /** The body of POST /v1/watch/events (WatchEvents) for "screen|surface" keys. */
        fun body(batch: List<String>): String = buildJsonObject {
            put("events", buildJsonArray {
                for (key in batch) {
                    val (screen, surface) = key.split('|', limit = 2).let { it[0] to it.getOrElse(1) { "app" } }
                    add(buildJsonObject {
                        put("screen", screen)
                        put("surface", surface)
                    })
                }
            })
        }.toString()
    }
}
