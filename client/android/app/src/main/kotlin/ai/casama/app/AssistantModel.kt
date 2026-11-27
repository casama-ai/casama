package ai.casama.app

import java.net.URLEncoder
import java.time.Instant

/**
 * The pure half of Casama's AppFunctions for Gemini on Android 16+ (docs/ANDROID-APPFUNCTIONS-PLAN.md
 * §7.2, D-567): matching the names a model says to the glance, the quiet lines, the links that open
 * Casama, which Dart answers open the app, and the time budgets. No Android imports, so it compiles
 * in every build and scripts/test-assistant-kotlin.sh checks it with kotlinc alone. The functions
 * themselves (src/appFunctions/kotlin/ai/casama/app/CasamaFunctions.kt) exist only with the build
 * switch on.
 */
object AssistantModel {
  /** The functions' ids, `<enclosing class>#<method>`, as Google's tools and Gemini name them.
   * packages/contracts/assistant-actions.json lists the same ids (client/test checks it). */
  const val FUNCTIONS_CLASS = "ai.casama.app.CasamaFunctions"
  val FUNCTIONS = listOf("listBots", "listRoutines", "whatNeedsMe", "askBot", "runRoutine", "openInCasama")
  val FUNCTION_IDS = FUNCTIONS.map { "$FUNCTIONS_CLASS#$it" }

  /** How long Dart may wait for a bot's reply. Gemini's own limit on the phone is unmeasured until
   * Google picks us (plan §13, Phase 0 c); this is Siri's default plus a little. */
  const val ASK_WAIT_MS = 25_000L

  /** How long a cold headless Flutter engine may take to say `ready` (Phase 0 b measures it). */
  const val ENGINE_READY_MS = 12_000L

  /** Room on top of Dart's own wait for the channel round trip. */
  const val MARGIN_MS = 3_000L

  /** A stale glance is refreshed with the read-only widget key for at most this long. */
  const val REFRESH_MS = 5_000L

  /** The longest reply handed to Gemini (plan §6): it becomes input to Gemini's model. */
  const val REPLY_MAX = 4_000

  /** A cold engine is closed again after this long without a call. */
  const val ENGINE_IDLE_MS = 2 * 60 * 1000L

  data class BotRow(val id: String, val name: String, val status: String, val step: String?, val link: String)

  data class RoutineRow(
    val id: String,
    val botId: String,
    val name: String,
    val bot: String,
    val nextAtMs: Long?,
    val every: String,
    val enabled: Boolean,
    val link: String,
  )

  data class NeedRow(
    val kind: String,
    val id: String,
    val bot: String,
    val text: String,
    val urgent: Boolean,
    val createdAtMs: Long,
    val link: String,
  )

  /** A name as a model may say it: case, punctuation and spacing don't matter. */
  fun norm(s: String?): String = (s ?: "").lowercase().filter { it.isLetterOrDigit() }

  /**
   * The one item whose name matches [said]: an exact match first, then the only name that starts
   * with it, then the only name that contains it. Null when nothing or more than one matches.
   */
  fun <T> pick(items: List<T>, said: String?, name: (T) -> String): Match<T> {
    val want = norm(said)
    if (want.isEmpty()) return Match.Blank()
    items.filter { norm(name(it)) == want }.let { if (it.size == 1) return Match.One(it[0]) else if (it.size > 1) return Match.Many(it) }
    items.filter { norm(name(it)).startsWith(want) }.let { if (it.size == 1) return Match.One(it[0]) else if (it.size > 1) return Match.Many(it) }
    items.filter { norm(name(it)).contains(want) }.let { if (it.size == 1) return Match.One(it[0]) else if (it.size > 1) return Match.Many(it) }
    return Match.None()
  }

  sealed class Match<T> {
    class Blank<T> : Match<T>()
    class None<T> : Match<T>()
    class One<T>(val item: T) : Match<T>()
    class Many<T>(val items: List<T>) : Match<T>()
  }

  /** Routines, only those of the bot named when one is ([botName] blank: all). */
  fun routinesFor(routines: List<RoutineRow>, bots: List<BotRow>, botName: String?): List<RoutineRow> {
    if (norm(botName).isEmpty()) return routines
    return when (val m = pick(bots, botName) { it.name }) {
      is Match.One -> routines.filter { it.botId == m.item.id }
      else -> routines.filter { norm(it.bot).contains(norm(botName)) }
    }
  }

  /** A routine by its id, else by its name. */
  fun findRoutine(routines: List<RoutineRow>, idOrName: String?): Match<RoutineRow> {
    val raw = idOrName?.trim().orEmpty()
    routines.firstOrNull { it.id == raw || "${it.id}:${it.botId}" == raw }?.let { return Match.One(it) }
    return pick(routines, raw) { it.name }
  }

  /** The `<routine>:<bot>` reference Dart's run action takes (as Siri's, D-564). */
  fun routineRef(r: RoutineRow) = "${r.id}:${r.botId}"

  /**
   * The sentences [needLine] and [needsSummary] are made of, with their `{bot}`, `{count}` and
   * `{bots}` blanks. The app passes the phone's language from its resources; the English here is
   * generated from the same keys, so this file stays free of Android.
   */
  data class Lines(
    val aBot: String = NativeEnglish.siriABotSubject,
    val needsOk: String = NativeEnglish.siriBotNeedsOk,
    val takeOver: String = NativeEnglish.siriBotNeedsTakeOver,
    val suggestion: String = NativeEnglish.siriBotHasSuggestion,
    val needsYou: String = NativeEnglish.siriBotNeedsYouLine,
    val nothing: String = NativeEnglish.siriNothingNeedsYou,
    val one: String = NativeEnglish.siriOneThingNeedsYou,
    val many: String = NativeEnglish.siriCountThingsNeedYou,
    val waiting: String = NativeEnglish.siriNeedsYouBots,
  )

  /**
   * One line about something that needs the person. [quiet] (a private workspace, the app lock, a
   * locked phone; plan §4.3): only the kind of thing and the bot, never what it says.
   */
  fun needLine(need: NeedRow, quiet: Boolean, lines: Lines = Lines()): String {
    val bot = need.bot.ifBlank { lines.aBot }
    if (quiet || need.text.isBlank()) {
      val line = when (need.kind) {
        "approval" -> lines.needsOk
        "takeover" -> lines.takeOver
        "suggestion" -> lines.suggestion
        else -> lines.needsYou
      }
      return line.replace("{bot}", bot)
    }
    return "$bot: ${need.text.trim()}"
  }

  /** The sentence Gemini can say for what needs the person. */
  fun needsSummary(count: Int, needs: List<NeedRow>, quiet: Boolean, lines: Lines = Lines()): String {
    if (count <= 0) return lines.nothing
    val head = if (count == 1) lines.one else lines.many.replace("{count}", count.toString())
    // Quiet: the number only.
    if (quiet) return head
    val bots = needs.map { it.bot }.filter { it.isNotBlank() }.distinct().take(2)
    if (bots.isEmpty()) return head
    return "$head ${lines.waiting.replace("{bots}", bots.joinToString(", "))}"
  }

  /** Whole minutes from [atMs] to [nowMs], never below zero. */
  fun minutesAgo(nowMs: Long, atMs: Long): Int = (((nowMs - atMs).coerceAtLeast(0)) / 60_000L).toInt()

  /** An ISO-8601 instant for a time, or null. */
  fun iso(ms: Long?): String? = ms?.let { Instant.ofEpochMilli(it).toString() }

  /** A bot's status for the list. Over ten minutes old, nothing claims "working" (the widgets'
   * rule, D-405 §4). */
  fun botStatus(bot: BotRow, stale: Boolean): String = if (stale && bot.status == "working") "idle" else bot.status

  /** What a working bot is doing; [quiet] and a stale glance say nothing. */
  fun botStep(bot: BotRow, quiet: Boolean, stale: Boolean): String? =
    if (quiet || stale || bot.status != "working") null else bot.step

  /** Where `openInCasama` goes, as an app route; null when the place is unknown. */
  fun linkFor(place: String?, id: String?, bot: BotRow?, text: String?): String? {
    val p = norm(place)
    val i = id?.trim().orEmpty()
    return when (p) {
      "bot", "chat" -> when {
        p == "chat" && i.isNotEmpty() && bot != null -> "/bots/${bot.id}/chat?c=${enc(i)}"
        bot != null -> "/bots/${bot.id}/chat"
        else -> null
      }
      "approval" -> if (i.isNotEmpty()) "/approvals/${enc(i)}" else "/inbox"
      "quickask", "ask" -> quickAsk(bot?.id, text.orEmpty())
      "inbox", "needs", "needsme", "whatneedsme" -> "/inbox"
      "routines", "routine" -> "/routines"
      "home", "casama", "" -> "/"
      else -> null
    }
  }

  /** Quick ask with the bot and the words filled in, as Dart's askPath writes it. */
  fun quickAsk(botId: String?, text: String): String {
    val q = buildList {
      add("text=${enc(text)}")
      if (!botId.isNullOrEmpty()) add("bot=${enc(botId)}")
    }
    return "/quick-ask?" + q.joinToString("&")
  }

  private fun enc(s: String) = URLEncoder.encode(s, "UTF-8").replace("+", "%20")

  /** Dart answers that mean the person has to finish in Casama, so the app is brought forward. */
  fun opensApp(status: String?, open: String?): Boolean =
    !open.isNullOrEmpty() && status in setOf("opened_app", "needs_you", "limited", "failed", "hidden")

  /** How long a function waits for Dart: its own wait plus the margin, plus start-up when cold. */
  fun budgetMs(cold: Boolean, waitMs: Long = ASK_WAIT_MS): Long = waitMs + MARGIN_MS + if (cold) ENGINE_READY_MS else 0L

  /** Whether the functions are on (plan §7.3): signed in and the Settings switch on. */
  fun enabled(signedIn: Boolean, switchOn: Boolean) = signedIn && switchOn

  /** A reply cut for Gemini, at a sentence when one ends late enough. */
  fun capReply(text: String?): String? {
    val t = text?.trim().orEmpty()
    if (t.isEmpty()) return null
    if (t.length <= REPLY_MAX) return t
    val cut = t.substring(0, REPLY_MAX)
    val end = Regex("[.!?]\\s").findAll(cut).lastOrNull()?.range?.first ?: -1
    return (if (end > REPLY_MAX / 2) cut.substring(0, end + 1) else cut.trimEnd()) + "…"
  }

  /** What kind of failure a Dart status is, for the exception Gemini gets; null: a normal answer. */
  enum class Failure { SIGNED_OUT, SWITCHED_OFF }

  fun failureFor(status: String?): Failure? = when (status) {
    "signed_out" -> Failure.SIGNED_OUT
    "off" -> Failure.SWITCHED_OFF
    else -> null
  }
}
