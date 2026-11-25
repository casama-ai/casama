package ai.casama.app

import ai.casama.app.AssistantModel.Match
import ai.casama.app.AssistantModel.NeedRow
import ai.casama.app.AssistantModel.RoutineRow
import ai.casama.app.AssistantModel.BotRow
import ai.casama.app.canvas.MiniJson
import java.io.File

/**
 * Checks AssistantModel (the pure half of the AppFunctions for Gemini, D-567) and that its function
 * ids match packages/contracts/assistant-actions.json. A plain `main` with no test library, like
 * CanvasModelCheck: run it with scripts/test-assistant-kotlin.sh (kotlinc, no Gradle).
 */
private var checks = 0

private fun expect(ok: Boolean, what: () -> String) {
  checks++
  if (!ok) throw AssertionError(what())
}

private fun <T> one(m: Match<T>): T? = (m as? Match.One<T>)?.item

fun main() {
  val bots = listOf(
    BotRow("b1", "Research", "working", "Searching the web", "/bots/b1/chat"),
    BotRow("b2", "Writer", "idle", null, "/bots/b2/chat"),
    BotRow("b3", "Research Assistant", "idle", null, "/bots/b3/chat"),
  )
  // Names as a model says them.
  expect(one(AssistantModel.pick(bots, "research") { it.name })?.id == "b1") { "exact match wins over a longer name" }
  expect(one(AssistantModel.pick(bots, " WRITER! ") { it.name })?.id == "b2") { "case and punctuation don't matter" }
  expect(one(AssistantModel.pick(bots, "writ") { it.name })?.id == "b2") { "a unique prefix matches" }
  expect(AssistantModel.pick(bots, "res") { it.name } is Match.Many) { "an ambiguous prefix is not a match" }
  expect(AssistantModel.pick(bots, "nobody") { it.name } is Match.None) { "no match" }
  expect(AssistantModel.pick(bots, "") { it.name } is Match.Blank) { "blank is its own case" }
  expect(one(AssistantModel.pick(bots, "assistant") { it.name })?.id == "b3") { "a unique part matches" }

  val routines = listOf(
    RoutineRow("r1", "b1", "Morning brief", "Research", 1_000L, "Every day at 7:00", true, "/routines/r1"),
    RoutineRow("r2", "b2", "Weekly post", "Writer", null, "Mondays", true, "/routines/r2"),
  )
  expect(AssistantModel.routinesFor(routines, bots, "writer").map { it.id } == listOf("r2")) { "routines of one bot" }
  expect(AssistantModel.routinesFor(routines, bots, null).size == 2) { "no bot: all routines" }
  expect(one(AssistantModel.findRoutine(routines, "r1"))?.id == "r1") { "by id" }
  expect(one(AssistantModel.findRoutine(routines, "r1:b1"))?.id == "r1") { "by reference" }
  expect(one(AssistantModel.findRoutine(routines, "my morning brief"))?.id == null) { "extra words don't match" }
  expect(one(AssistantModel.findRoutine(routines, "morning"))?.id == "r1") { "by part of the name" }
  expect(AssistantModel.routineRef(routines[0]) == "r1:b1") { "routine reference" }

  // Quiet lines never carry what a need says.
  val need = NeedRow("approval", "a1", "Research", "Send the email to Sam", false, 0L, "/approvals/a1")
  expect(AssistantModel.needLine(need, quiet = true) == "Research needs your OK.") { "quiet approval line" }
  expect(!AssistantModel.needLine(need, quiet = true).contains("Sam")) { "quiet hides the text" }
  expect(AssistantModel.needLine(need, quiet = false).contains("Sam")) { "not quiet shows the text" }
  expect(AssistantModel.needsSummary(0, emptyList(), false) == "Nothing needs you right now.") { "nothing" }
  expect(AssistantModel.needsSummary(2, listOf(need), true) == "2 things need you.") { "quiet summary: a count only" }
  expect(AssistantModel.needsSummary(1, listOf(need), false) == "One thing needs you. Waiting on you: Research.") { "summary names bots" }
  expect(AssistantModel.minutesAgo(10 * 60_000L, 0L) == 10) { "minutes ago" }
  expect(AssistantModel.minutesAgo(0L, 60_000L) == 0) { "never negative" }

  // Bots: a stale glance claims nothing about now, quiet hides the step.
  expect(AssistantModel.botStatus(bots[0], stale = true) == "idle") { "stale working is idle" }
  expect(AssistantModel.botStep(bots[0], quiet = false, stale = false) == "Searching the web") { "step" }
  expect(AssistantModel.botStep(bots[0], quiet = true, stale = false) == null) { "quiet step" }

  // Links into the app.
  expect(AssistantModel.linkFor("bot", null, bots[0], null) == "/bots/b1/chat") { "bot link" }
  expect(AssistantModel.linkFor("chat", "c9", bots[0], null) == "/bots/b1/chat?c=c9") { "chat link" }
  expect(AssistantModel.linkFor("approval", "a1", null, null) == "/approvals/a1") { "approval link" }
  expect(AssistantModel.linkFor("quick ask", null, bots[1], "hi there & more") == "/quick-ask?text=hi%20there%20%26%20more&bot=b2") {
    "quick ask link: " + AssistantModel.linkFor("quick ask", null, bots[1], "hi there & more")
  }
  expect(AssistantModel.linkFor("spaceship", null, null, null) == null) { "unknown place" }

  // Dart's answers: which bring Casama forward, and the budgets.
  expect(AssistantModel.opensApp("needs_you", "/bots/b1/chat")) { "needs you opens" }
  expect(!AssistantModel.opensApp("replied", "/x")) { "a reply doesn't open" }
  expect(!AssistantModel.opensApp("opened_app", null)) { "no link, nothing to open" }
  expect(AssistantModel.budgetMs(cold = true) > AssistantModel.budgetMs(cold = false)) { "cold waits longer" }
  expect(AssistantModel.enabled(signedIn = true, switchOn = true) && !AssistantModel.enabled(false, true) && !AssistantModel.enabled(true, false)) { "enabled" }
  expect(AssistantModel.failureFor("signed_out") == AssistantModel.Failure.SIGNED_OUT && AssistantModel.failureFor("replied") == null) { "failures" }
  val long = "A sentence. ".repeat(500)
  val capped = AssistantModel.capReply(long)!!
  expect(capped.length <= AssistantModel.REPLY_MAX + 1 && capped.endsWith(".…")) { "reply capped at a sentence" }
  expect(AssistantModel.capReply("  ") == null) { "blank reply" }

  // One vocabulary (plan §5): the ids match the shared list.
  val file = File(System.getProperty("actions.file") ?: "../../../packages/contracts/assistant-actions.json")
  val root = MiniJson.parse(file.readText()) as Map<*, *>
  val shared = (root["actions"] as List<*>).mapNotNull { (it as Map<*, *>)["android"] as? String }.toSet()
  expect(shared == AssistantModel.FUNCTIONS.toSet()) { "assistant-actions.json android ids $shared != ${AssistantModel.FUNCTIONS}" }
  expect(AssistantModel.FUNCTION_IDS.all { it.startsWith("ai.casama.app.CasamaFunctions#") }) { "function id form" }

  println("AssistantModel: $checks checks passed")
}
