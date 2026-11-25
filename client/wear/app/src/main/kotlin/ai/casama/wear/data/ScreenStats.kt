package ai.casama.wear.data

import ai.casama.wear.core.ScreenCount
import android.content.Context
import androidx.core.content.edit
import java.time.LocalDate
import java.time.ZoneOffset
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

/**
 * Sends which screens the app showed (D-535), a few seconds after they are seen, in one call. The
 * server records nothing for people who turned usage data off, or on servers without analytics.
 * Best effort: a failed send waits for the next screen; nothing here ever shows an error.
 */
class ScreenStats(
    context: Context,
    private val scope: CoroutineScope,
    private val api: WatchApi,
    private val signedIn: () -> Boolean,
) {
    private val prefs = context.getSharedPreferences("casama_screen_stats", Context.MODE_PRIVATE)
    private val count = ScreenCount(
        prefs.getString(K_DAY, "").orEmpty(),
        prefs.getStringSet(K_SENT, emptySet()).orEmpty(),
    )
    private var job: Job? = null

    /** Where the next screen was opened from (a notification, a tile, a complication). */
    @Volatile
    private var openedFrom: String? = null

    fun openedFrom(surface: String?) {
        openedFrom = surface
    }

    /** A tap outside the app opened the screen already showing: counted only if not yet. */
    fun reopened(route: String) {
        if (openedFrom != null) viewed(route)
    }

    /** A screen came on; [route] is its navigation route pattern. */
    fun viewed(route: String?) {
        val screen = ScreenCount.screenFor(route) ?: return
        val surface = openedFrom ?: "app"
        openedFrom = null
        if (!signedIn()) return
        if (!count.viewed(screen, surface, LocalDate.now(ZoneOffset.UTC).toString())) return
        if (job?.isActive == true) return
        job = scope.launch {
            delay(5_000)
            send()
        }
    }

    private suspend fun send() {
        val batch = count.batch()
        if (batch.isEmpty()) return
        try {
            api.screenEvents(ScreenCount.body(batch))
            count.sentOk(batch)
            val (day, sent) = count.saved()
            prefs.edit {
                putString(K_DAY, day)
                putStringSet(K_SENT, sent)
            }
        } catch (e: ApiError.SignedOut) {
            count.dropped(batch)
        } catch (e: ApiError.Refused) {
            count.dropped(batch)
        } catch (e: ApiError.Forbidden) {
            count.dropped(batch)
        } catch (e: Exception) {
            // Offline or a server problem: kept for the next screen.
        }
    }

    private companion object {
        const val K_DAY = "day"
        const val K_SENT = "sent"
    }
}
