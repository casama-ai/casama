import { z } from "@hono/zod-openapi";
import { Canvas } from "./canvas.ts";
import { Uuid } from "./common.ts";

/**
 * Run event protocol. Every step of every run is an append-only event in run_events.
 * seq increases by 1 per run with no gaps. Clients ignore unknown types.
 */
export const RUN_EVENT_VERSION = 1;

const id = Uuid;
const ts = z.iso.datetime({ offset: true });

/**
 * The computer a tool call works on (computer places): the bot's own, or the computer of the
 * person the run acts for (`kind: "local"`), which the chat names on the row. Only on calls that
 * use a computer; older servers never send it.
 */
const eventPlace = z
  .object({
    computer_id: z.string(),
    kind: z.string().openapi({ description: "private, team or local (a person's own computer)" }),
    name: z.string(),
  })
  .optional();

/** Payload schema per event type. Adding a type here is the only step needed to extend the protocol. */
export const runEventPayloads = {
  "run.started": z.object({ trigger: z.string(), model: z.string(), computer_id: id.nullable() }),
  "message.delta": z.object({ message_id: id, text: z.string() }),
  "message.completed": z.object({
    message_id: id,
    content: z.array(z.record(z.string(), z.unknown())),
  }),
  "tool.started": z.object({
    call_id: z.string(),
    tool: z.string(),
    args_redacted: z.record(z.string(), z.unknown()),
    place: eventPlace,
  }),
  "tool.output": z.object({ call_id: z.string(), chunk: z.string() }),
  "tool.completed": z.object({
    call_id: z.string(),
    result_preview: z.string(),
    artifact_path: z.string().nullable(),
    duration_ms: z.number().int().nonnegative(),
    place: eventPlace,
  }),
  "tool.failed": z.object({ call_id: z.string(), error_code: z.string(), message: z.string() }),
  // The bot's cursor (docs/BOT-CURSOR-PLAN.md): where a screen step is about to act on the bot's own
  // computer, sent before the action. The app draws a cursor there over the screen's picture.
  "screen.pointer": z.object({
    call_id: z.string(),
    computer_id: z.string(),
    action: z.string().openapi({ description: "click or type; later servers may add more" }),
    x: z.number().openapi({ description: "In the screen picture's own pixels" }),
    y: z.number(),
    width: z.number().positive().openapi({ description: "The size x and y are measured against" }),
    height: z.number().positive(),
  }),
  "approval.requested": z.object({
    approval_id: id,
    tool: z.string(),
    args_redacted: z.record(z.string(), z.unknown()),
    risk: z.enum(["low", "medium", "high"]),
    expires_at: ts,
    place: eventPlace,
  }),
  "approval.resolved": z.object({
    approval_id: id,
    decision: z.enum(["approved", "denied", "expired"]),
    decided_by: id.nullable(),
  }),
  // Device connections (D-149).
  "device.access_requested": z.object({
    kind: z.enum([
      "calendar",
      "reminders",
      "contacts",
      "places",
      "photos",
      "health",
      "notifications",
      "activity",
    ]),
    reason: z.string(),
    bot_id: id,
  }),
  // Casama for Chrome's kinds (D-323 Phase 4): their own event, so app builds that read
  // device.access_requested's kind strictly skip it instead of failing.
  "device.browser_access_requested": z.object({
    kind: z.enum(["browser_tab", "browser_history"]),
    reason: z.string(),
    bot_id: id,
  }),
  // Apple live device actions (AlarmKit & HomeKit, docs/APPLE-INTEGRATIONS-PLAN.md §7.1, §7.4):
  // their own event, so older app builds skip it instead of failing to parse the timeline.
  "device.action_access_requested": z.object({
    kind: z.enum(["alarm", "home"]),
    reason: z.string(),
    bot_id: id,
  }),
  /** A local MCP server needs its owner to sign in again on that computer (D-363). */
  "local_mcp.sign_in_needed": z.object({
    integration_id: id,
    device_id: id,
    /** The server's key in the desktop app's list on that computer. */
    server: z.string(),
    label: z.string(),
    bot_id: id,
  }),
  /** A connected MCP server asks the person something mid-call (MCP elicitation, D-363). */
  "mcp.question": z.object({
    question_id: id,
    connection: z.string(),
    message: z.string(),
    schema: z.record(z.string(), z.unknown()),
    expires_at: ts,
  }),
  "mcp.question_resolved": z.object({
    question_id: id,
    outcome: z.enum(["accepted", "declined", "cancelled", "expired"]),
  }),
  // System permissions on the person's own device (D-376): a card with a button per permission.
  // Ids are plain strings so a newer server can name one an older app doesn't know.
  "device.permission_needed": z.object({
    device_ref: z.string(),
    device_name: z.string(),
    platform: z.string(),
    permissions: z.array(z.string()).min(1).max(20),
    reason: z.string(),
    bot_id: id,
  }),
  "device.data_used": z.object({
    kind: z.string(),
    count: z.number().int(),
    from: z.string(),
    to: z.string(),
    devices: z.array(z.string()),
  }),
  "secret.requested": z.object({
    request_id: id,
    name: z.string(),
    service: z.string(),
    allowed_hosts: z.array(z.string()),
    reason: z.string(),
    kind: z.enum(["value", "totp"]),
    expires_at: ts,
    /** A sign-in card in the browser inside the person's app (D-511): the site to sign in to. */
    login_host: z.string().nullable().optional(),
  }),
  "secret.resolved": z.object({
    request_id: id,
    outcome: z.enum(["fulfilled", "declined", "expired"]),
    /** The person chose to sign in on the page themselves (outcome declined, D-511). */
    on_page: z.boolean().optional(),
  }),
  "takeover.requested": z.object({
    computer_id: id,
    reason: z.string(),
    /** Missing on events from before the login choice (TAKEOVER-SIGN-IN-PLAN). */
    takeover_id: id.optional(),
    /** Set when the person may share a login for this site instead of taking over. */
    login_host: z.string().nullable().optional(),
  }),
  "takeover.resolved": z.object({
    computer_id: id,
    outcome: z.enum(["completed", "dismissed", "expired"]),
    note: z.string().nullable(),
    /** The person shared their login for this site instead of taking over (outcome completed). */
    login_host: z.string().nullable().optional(),
  }),
  /** Asks which browser to open a site in when sign-in is needed or the bot's computer is blocked. */
  "browser.choice_requested": z.object({
    choice_id: id,
    host: z.string(),
    reason: z.enum(["sign_in", "blocked"]),
    device_system: z.enum(["ios", "android", "macos", "linux", "windows"]).nullable(),
    has_chrome: z.boolean(),
    expires_at: ts,
  }),
  "browser.choice_resolved": z.object({
    choice_id: id,
    outcome: z.enum(["answered", "expired", "cancelled"]),
    choice: z.enum(["app", "mine", "computer"]).nullable(),
    remember: z.boolean().optional(),
  }),
  /** The in-app browser left mid-run: the run waits for the person to come back to the chat. */
  "browser.waiting": z.object({
    device_system: z.enum(["ios", "android", "macos", "linux", "windows"]).nullable(),
    host: z.string().nullable(),
    expires_at: ts,
    /** The page is the person's turn and the run waits for Hand Back (D-571), not for the chat. */
    hand_back: z.boolean().optional(),
  }),
  "browser.waiting_resolved": z.object({
    outcome: z.enum(["back", "expired", "cancelled"]),
  }),
  "lease.changed": z.object({
    computer_id: id,
    holder_type: z.enum(["bot", "user"]),
    mode: z.enum(["view", "control"]),
  }),
  "computer.state": z.object({
    computer_id: id,
    state: z.enum(["provisioning", "starting", "running", "idle", "sleeping", "stopped", "error"]),
  }),
  "checkpoint.created": z.object({ checkpoint_id: id, label: z.string() }),
  "subrun.started": z.object({ child_run_id: id, bot_id: id, task: z.string() }),
  "subrun.completed": z.object({
    child_run_id: id,
    status: z.enum(["completed", "failed", "cancelled"]),
    summary: z.string(),
  }),
  "memory.written": z.object({
    /** A uuid in the built-in store; a provider's id with a memory backend (D-137). */
    memory_id: z.string().min(1),
    kind: z.enum(["fact", "episode", "summary", "preference"]),
    /** "profile": saved to the person's own About you instead of the bot's memory (D-169). */
    scope: z.enum(["bot", "profile"]).optional(),
  }),
  "skill.loaded": z.object({ skill_id: id, name: z.string() }),
  usage: z.object({
    tokens_in: z.number().int().nonnegative(),
    tokens_out: z.number().int().nonnegative(),
    cost_usd: z.number().nonnegative(),
  }),
  /** The run moved past a model it could not use, such as a ChatGPT plan at its limit. */
  "model.fallback": z.object({ from_model: z.string(), reason: z.string(), message: z.string() }),
  /** Something the person should know about the run, e.g. a bot @mention that wasn't delivered (D-133). */
  notice: z.object({ code: z.string(), message: z.string() }),
  "run.completed": z.object({ final_message_id: id.nullable() }),
  "run.failed": z.object({ error_code: z.string(), message: z.string() }),
  "run.cancelled": z.object({ cancelled_by: id.nullable() }),
  /** An interactive UI the bot shows in the chat (D-086): A2UI v1.0 messages for one surface. */
  "ui.shown": z.object({
    surface_id: z.string(),
    messages: z.array(z.record(z.string(), z.unknown())),
  }),
  /**
   * Bot widgets (docs/BOT-WIDGET-PLAN.md §8.5): a bot set a canvas; the chat shows it drawn as
   * the widget will draw it. waiting: the person hasn't let this bot write yet (Show on my
   * widgets / Not now). not_placed: shown, but no Canvas widget is placed (how to add one).
   * Older apps skip it, as they skip every type they don't know.
   */
  "canvas.preview": z.object({
    canvas_id: id,
    bot_id: id,
    state: z.enum(["waiting", "shown", "not_placed"]),
    canvas: Canvas,
  }),
} as const;

export type RunEventType = keyof typeof runEventPayloads;
export const RUN_EVENT_TYPES = Object.keys(runEventPayloads) as RunEventType[];

const envelopeShape = {
  v: z
    .number()
    .int()
    .min(1)
    .openapi({ description: `Protocol version, currently ${RUN_EVENT_VERSION}` }),
  run_id: id,
  seq: z.number().int().positive(),
  ts,
  bot_id: id,
};

/** OpenAPI component name for a type: "tool.completed" -> "ToolCompletedEvent". */
export const eventComponentName = (type: string) =>
  `${type
    .split(/[._]/)
    .map((p) => p.charAt(0).toUpperCase() + p.slice(1))
    .join("")}Event`;

const variants = RUN_EVENT_TYPES.map((type) =>
  z
    .object({ ...envelopeShape, type: z.literal(type), payload: runEventPayloads[type] })
    .openapi(eventComponentName(type)),
);

export const RunEvent = z
  .discriminatedUnion("type", variants as unknown as [(typeof variants)[0], ...typeof variants])
  .openapi("RunEvent");

export type RunEventOf<T extends RunEventType> = {
  v: number;
  run_id: string;
  seq: number;
  ts: string;
  bot_id: string;
  type: T;
  payload: z.infer<(typeof runEventPayloads)[T]>;
};
export type RunEvent = { [T in RunEventType]: RunEventOf<T> }[RunEventType];

/** Envelope as stored and sent on the wire, with an untyped payload (forward compatible). */
export const RunEventEnvelope = z
  .object({ ...envelopeShape, type: z.string(), payload: z.record(z.string(), z.unknown()) })
  .openapi("RunEventEnvelope");
export type RunEventEnvelope = z.infer<typeof RunEventEnvelope>;

/** Validate a payload for a known type. Throws on mismatch. */
export function parseRunEventPayload<T extends RunEventType>(type: T, payload: unknown) {
  return runEventPayloads[type].parse(payload) as z.infer<(typeof runEventPayloads)[T]>;
}

/** Parse an envelope; returns null for unknown types instead of throwing. */
export function parseRunEvent(input: unknown): RunEvent | null {
  const env = RunEventEnvelope.parse(input);
  if (!(env.type in runEventPayloads)) return null;
  return RunEvent.parse(env) as RunEvent;
}
