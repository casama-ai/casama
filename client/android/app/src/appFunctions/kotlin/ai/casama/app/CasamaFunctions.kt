package ai.casama.app

import android.app.KeyguardManager
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.appfunctions.AppFunctionDeclaration
import androidx.appfunctions.AppFunctionDeniedException
import androidx.appfunctions.AppFunctionDisabledException
import androidx.appfunctions.AppFunctionElementNotFoundException
import androidx.appfunctions.AppFunctionInvalidArgumentException
import androidx.appfunctions.AppFunctionSerializable
import androidx.appfunctions.AppFunctionService
import androidx.appfunctions.AppFunctionServiceEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.async
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeoutOrNull

/**
 * Casama's AppFunctions: what Gemini on Android 16+ (and Google's AppFunctions testing agent) may
 * do with Casama on this phone (docs/ANDROID-APPFUNCTIONS-PLAN.md §5 and §7.2, D-567). KSP writes
 * the service `CasamaFunctionsService` and the schema `casama_functions.xml` from this class; the
 * manifest is src/appFunctions/AndroidManifest.xml. Compiled only with the build switch on.
 *
 * - Reads (`listBots`, `listRoutines`, `whatNeedsMe`) come from the glance the widgets read
 *   ([GlanceStore], D-405), refreshed first with the read-only widget key when it is stale.
 * - Acts (`askBot`, `runRoutine`) go through Dart ([AppFunctionsBridge]).
 * - `openInCasama` opens a place in the app. There is no function that approves or denies:
 *   approvals stay in Casama for Gemini, always (plan §4.4).
 *
 * Every function starts off and is turned on by the app while someone is signed in and Settings →
 * Privacy → Let Gemini use Casama is on (plan §7.3).
 */
@RequiresApi(36)
@AppFunctionServiceEntryPoint(serviceName = "CasamaFunctionsService", appFunctionXmlFileName = "casama_functions")
abstract class CasamaFunctions : AppFunctionService() {
  private val refreshScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)

  /**
   * Lists the person's Casama bots: AI helpers they made in Casama, each with a name and whether it
   * is working right now. Use it to find the exact bot name before asking a bot something or
   * listing its routines.
   *
   * @return The bots, as Casama lists them.
   */
  @AppFunctionDeclaration(isDescribedByKDoc = true, isEnabled = false)
  suspend fun listBots(): CasamaBotList = withContext(Dispatchers.IO) {
    val view = glance()
    CasamaBotList(
      bots = view.bots.map {
        CasamaBot(
          id = it.id,
          name = it.name,
          status = AssistantModel.botStatus(it, view.stale),
          currentStep = AssistantModel.botStep(it, view.quiet, view.stale),
        )
      },
      asOf = view.asOfIso,
    )
  }

  /**
   * Lists the person's Casama routines: tasks a bot runs on a schedule, such as a morning brief.
   *
   * @param botName Only the routines of this bot, by its name as listBots gives it. Leave empty for
   *   every bot's routines.
   * @return The routines coming up next.
   */
  @AppFunctionDeclaration(isDescribedByKDoc = true, isEnabled = false)
  suspend fun listRoutines(botName: String?): CasamaRoutineList = withContext(Dispatchers.IO) {
    val view = glance()
    CasamaRoutineList(
      routines = AssistantModel.routinesFor(view.routines, view.bots, botName).map {
        CasamaRoutine(id = AssistantModel.routineRef(it), name = it.name, botName = it.bot, schedule = it.every, nextRunAt = AssistantModel.iso(it.nextAtMs), enabled = it.enabled)
      },
      asOf = view.asOfIso,
    )
  }

  /**
   * Says what needs the person in Casama: requests waiting for their OK, bots that need them to
   * take over, and suggestions. Read only: to answer a request, open it in Casama with
   * openInCasama (place "approval"); Casama never approves through an assistant.
   *
   * @return How many things need the person, a sentence to say, and the newest items.
   */
  @AppFunctionDeclaration(isDescribedByKDoc = true, isEnabled = false)
  suspend fun whatNeedsMe(): CasamaNeeds = withContext(Dispatchers.IO) {
    val view = glance()
    val now = System.currentTimeMillis()
    CasamaNeeds(
      count = view.needsCount,
      summary = AssistantModel.needsSummary(view.needsCount, view.needs, view.quiet),
      items = view.needs.map {
        CasamaNeed(kind = it.kind, id = it.id, botName = it.bot, line = AssistantModel.needLine(it, view.quiet), minutesAgo = AssistantModel.minutesAgo(now, it.createdAtMs))
      },
      asOf = view.asOfIso,
    )
  }

  /**
   * Asks one of the person's Casama bots something, as a new chat, and returns its reply when it
   * comes within about 25 seconds. Longer work keeps going and the person gets a notification when
   * it's done. If the bot needs the person's OK first, Casama opens on that request.
   *
   * @param botName The bot to ask, by its name as listBots gives it. Leave empty for the person's
   *   usual bot.
   * @param message What to ask or tell the bot, in the person's words.
   * @param requestId Any id unique to this request; the same id within a minute returns the first
   *   answer instead of asking twice.
   * @return How it went, a sentence to say, and the reply when there is one and it may be shown.
   */
  @AppFunctionDeclaration(isDescribedByKDoc = true, isEnabled = false)
  suspend fun askBot(botName: String?, message: String, requestId: String?): CasamaAskResult {
    val text = message.trim()
    if (text.isEmpty()) throw AppFunctionInvalidArgumentException("Say what to ask the bot.")
    val view = withContext(Dispatchers.IO) { glance() }
    guardSignedIn(view)
    val bot = when (val m = AssistantModel.pick(view.bots, botName) { it.name }) {
      is AssistantModel.Match.Blank -> null
      is AssistantModel.Match.One -> m.item
      is AssistantModel.Match.Many -> throw AppFunctionInvalidArgumentException("More than one bot matches \"$botName\": ${m.items.joinToString { it.name }}.")
      is AssistantModel.Match.None -> throw AppFunctionElementNotFoundException("No bot is called \"$botName\". Bots: ${view.bots.joinToString { it.name }}.")
    }
    if (phoneLocked()) return CasamaAskResult("locked", "Unlock your phone and try again.", null, bot?.name, null, false)
    val answer = AppFunctionsBridge.call(
      this,
      "ask",
      mapOf("bot_id" to (bot?.id ?: ""), "text" to text, "wait_ms" to AssistantModel.ASK_WAIT_MS.toInt(), "request_id" to (requestId ?: "")),
      AssistantModel.ASK_WAIT_MS,
    ) ?: return openInstead(AssistantModel.quickAsk(bot?.id, text)).let { opened ->
      CasamaAskResult("opened_app", "Open Casama to finish.", null, bot?.name, null, opened)
    }
    failure(answer)
    val status = answer["status"] as? String ?: "failed"
    val open = answer["open"] as? String
    val opened = if (AssistantModel.opensApp(status, open)) openInstead(open!!) else false
    return CasamaAskResult(
      status = status,
      message = answer["say"] as? String ?: "Open Casama to finish.",
      reply = if (status == "replied") AssistantModel.capReply(answer["text"] as? String) else null,
      botName = answer["bot"] as? String ?: bot?.name,
      chatId = answer["conversation_id"] as? String,
      openedCasama = opened,
    )
  }

  /**
   * Runs one of the person's Casama routines now, as if they pressed Run now. The result arrives
   * the way the routine's results always do (a notification, the chat).
   *
   * @param routine The routine, by its name or its id as listRoutines gives it.
   * @param requestId Any id unique to this request; the same id within a minute doesn't start it
   *   twice.
   * @return How it went and a sentence to say.
   */
  @AppFunctionDeclaration(isDescribedByKDoc = true, isEnabled = false)
  suspend fun runRoutine(routine: String, requestId: String?): CasamaRunResult {
    val view = withContext(Dispatchers.IO) { glance() }
    guardSignedIn(view)
    val r = when (val m = AssistantModel.findRoutine(view.routines, routine)) {
      is AssistantModel.Match.One -> m.item
      is AssistantModel.Match.Blank -> throw AppFunctionInvalidArgumentException("Say which routine to run.")
      is AssistantModel.Match.Many -> throw AppFunctionInvalidArgumentException("More than one routine matches \"$routine\": ${m.items.joinToString { it.name }}.")
      is AssistantModel.Match.None -> throw AppFunctionElementNotFoundException("No routine is called \"$routine\". Use listRoutines to see them.")
    }
    if (phoneLocked()) return CasamaRunResult("locked", "Unlock your phone and try again.", r.name, r.bot, false)
    val answer = AppFunctionsBridge.call(
      this,
      "run",
      mapOf("routine_id" to AssistantModel.routineRef(r), "name" to r.name, "request_id" to (requestId ?: "")),
      0L,
    ) ?: return CasamaRunResult("opened_app", "Open Casama to finish.", r.name, r.bot, openInstead("/run-routine/${AssistantModel.routineRef(r)}"))
    failure(answer)
    val status = answer["status"] as? String ?: "failed"
    val open = answer["open"] as? String
    return CasamaRunResult(status, answer["say"] as? String ?: "Open Casama to finish.", r.name, r.bot, if (AssistantModel.opensApp(status, open)) openInstead(open!!) else false)
  }

  /**
   * Opens Casama on a place: a bot's chat, a chat by id, a request waiting for the person's OK,
   * Quick ask with words filled in, what needs the person ("inbox"), or the routines.
   *
   * @param place One of "bot", "chat", "approval", "quick_ask", "inbox", "routines".
   * @param id The chat's id for "chat", the request's id (from whatNeedsMe) for "approval".
   * @param botName The bot, by name, for "bot", "chat" and "quick_ask".
   * @param text Words to fill in for "quick_ask".
   * @return Whether Casama opened.
   */
  @AppFunctionDeclaration(isDescribedByKDoc = true, isEnabled = false)
  suspend fun openInCasama(place: String, id: String?, botName: String?, text: String?): CasamaOpened {
    val view = withContext(Dispatchers.IO) { glance() }
    // Signed out: open Casama on its start (the sign-in screen) rather than refuse (Phase 0).
    if (!view.signedIn) return CasamaOpened(openInstead("/"))
    val bot = (AssistantModel.pick(view.bots, botName) { it.name } as? AssistantModel.Match.One)?.item
    val link = AssistantModel.linkFor(place, id, bot, text)
      ?: throw AppFunctionInvalidArgumentException("Unknown place \"$place\". Use bot, chat, approval, quick_ask, inbox or routines.")
    return CasamaOpened(openInstead(link))
  }

  // MARK: The glance

  private class View(
    val signedIn: Boolean,
    val quiet: Boolean,
    val stale: Boolean,
    val asOfIso: String?,
    val bots: List<AssistantModel.BotRow>,
    val routines: List<AssistantModel.RoutineRow>,
    val needs: List<AssistantModel.NeedRow>,
    val needsCount: Int,
  )

  /** The glance as the widgets read it; a stale one is refreshed first (at most a few seconds). */
  private suspend fun glance(): View {
    var snap = GlanceStore.load(this)
    if (snap.stale && GlanceRefresh.key(this) != null) {
      val fetch = refreshScope.async { GlanceRefresh.fetch(applicationContext) }
      if (withTimeoutOrNull(AssistantModel.REFRESH_MS) { fetch.await() } != null) snap = GlanceStore.load(this)
    }
    val g = snap.glance
    val freshAt = g?.madeAtMs
    return View(
      signedIn = snap.state != GlanceStore.State.SIGNED_OUT,
      // A private workspace or the app lock (the glance is made private then), or a locked phone.
      quiet = snap.isPrivate || phoneLocked(),
      stale = snap.stale,
      asOfIso = if (snap.stale) AssistantModel.iso(freshAt) else null,
      bots = g?.bots.orEmpty().filter { it.status != "disabled" }.map { AssistantModel.BotRow(it.id, it.name, it.status, it.step, it.link) },
      routines = g?.next.orEmpty().map { AssistantModel.RoutineRow(it.id, it.botId, it.name, it.bot, it.nextAtMs, it.every, it.enabled, it.link) },
      needs = g?.needs.orEmpty().map { AssistantModel.NeedRow(it.kind, it.id, it.bot, it.text, it.urgent, it.createdAtMs, it.link) },
      needsCount = g?.needsCount ?: 0,
    )
  }

  private fun guardSignedIn(view: View) {
    if (!view.signedIn) throw AppFunctionDeniedException("Sign in to Casama first.")
  }

  /** Dart said signed out or switched off: Gemini gets the matching exception, not an answer. */
  private fun failure(answer: Map<String, Any?>) {
    when (AssistantModel.failureFor(answer["status"] as? String)) {
      AssistantModel.Failure.SIGNED_OUT -> throw AppFunctionDeniedException("Sign in to Casama first.")
      AssistantModel.Failure.SWITCHED_OFF -> throw AppFunctionDisabledException("Gemini is turned off for Casama on this phone (Casama → Settings → Privacy).")
      null -> {}
    }
  }

  private fun phoneLocked(): Boolean = getSystemService(KeyguardManager::class.java)?.isKeyguardLocked == true

  /**
   * Opens the app on [link]. Whether a function may start an activity from the background is
   * Phase 0 (d); when Android refuses, this says false and Gemini tells the person to open Casama.
   */
  private fun openInstead(link: String): Boolean = try {
    startActivity(
      Intent(Intent.ACTION_VIEW, Uri.parse(link), this as Context, MainActivity::class.java)
        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP),
    )
    true
  } catch (e: Exception) {
    Log.w("CasamaFunctions", "couldn't open Casama: ${e.message}")
    false
  }
}

/** The person's Casama bots. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaBotList(
  /** Each bot. */
  val bots: List<CasamaBot>,
  /** When this was last true, if it is over ten minutes old (ISO-8601); null when it is current. */
  val asOf: String?,
)

/** One Casama bot: an AI helper the person made. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaBot(
  /** The bot's id. */
  val id: String,
  /** The bot's name, as the person calls it. */
  val name: String,
  /** "idle", "working" or "waiting" (waiting for the person). */
  val status: String,
  /** While it works, what it is doing in general words. */
  val currentStep: String?,
)

/** The person's Casama routines. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaRoutineList(
  /** Each routine. */
  val routines: List<CasamaRoutine>,
  /** When this was last true, if it is over ten minutes old (ISO-8601). */
  val asOf: String?,
)

/** One routine: a task a bot runs on a schedule. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaRoutine(
  /** The routine's id, for runRoutine. */
  val id: String,
  /** The routine's name. */
  val name: String,
  /** The bot that runs it. */
  val botName: String,
  /** When it runs, in words ("Every day at 7:00"). */
  val schedule: String,
  /** When it runs next (ISO-8601). */
  val nextRunAt: String?,
  /** Whether it runs on its schedule. */
  val enabled: Boolean,
)

/** What needs the person in Casama. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaNeeds(
  /** How many things need the person. */
  val count: Int,
  /** One or two sentences to say. */
  val summary: String,
  /** The newest few. */
  val items: List<CasamaNeed>,
  /** When this was last true, if it is over ten minutes old (ISO-8601). */
  val asOf: String?,
)

/** One thing that needs the person. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaNeed(
  /** "approval" (a request waiting for their OK), "takeover" or "suggestion". */
  val kind: String,
  /** Its id, for openInCasama. */
  val id: String,
  /** The bot it is from. */
  val botName: String,
  /** One line about it. */
  val line: String,
  /** How many minutes ago it came. */
  val minutesAgo: Int,
)

/** How an ask went. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaAskResult(
  /** "replied", "working", "needs_you", "hidden", "no_credits", "offline", "limited", "opened_app", "failed" or "locked". */
  val status: String,
  /** A sentence to tell the person. */
  val message: String,
  /** The bot's reply, when it replied and the reply may be shown. */
  val reply: String?,
  /** The bot that was asked. */
  val botName: String?,
  /** The chat's id, for openInCasama with place "chat". */
  val chatId: String?,
  /** Whether Casama opened for the person to finish there. */
  val openedCasama: Boolean,
)

/** How starting a routine went. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaRunResult(
  /** "working" (started), "no_credits", "offline", "opened_app", "failed" or "locked". */
  val status: String,
  /** A sentence to tell the person. */
  val message: String,
  /** The routine. */
  val routineName: String,
  /** The bot that runs it. */
  val botName: String,
  /** Whether Casama opened for the person to finish there. */
  val openedCasama: Boolean,
)

/** Whether Casama opened. */
@AppFunctionSerializable(isDescribedByKDoc = true)
class CasamaOpened(
  /** True when Casama opened. */
  val opened: Boolean,
)
