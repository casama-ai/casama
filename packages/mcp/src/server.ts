/**
 * Casama MCP server (Phase 8, D-077): control your bots from AI coding tools. Tools: list
 * workspaces and bots, ask a bot (waits for its reply, or wait_seconds), read runs, list and decide
 * approvals (never for Gemini: it gets the approval's link, D-567), what needs the person, list and
 * run routines, and sites and domains (D-329: list, check, connect, search; buying stays with a
 * person). With a docs source it also has the docs tools (docs.ts): search and read the docs, look
 * up the API.
 * Authentication reuses the CLI's login (`casama login`), refreshing the session as needed, or a
 * token in CASAMA_TOKEN.
 */
import { readFileSync, writeFileSync } from "node:fs";
import { homedir } from "node:os";
import { join } from "node:path";
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { z } from "zod";
import { type DocsSource, type PluginCheckResult, registerDocsTools } from "./docs.ts";
import { type GallerySource, registerGalleryTools } from "./gallery.ts";

export * from "./docs.ts";
export * from "./gallery.ts";

export const VERSION = "0.2.3";

type Session = { access_token: string; refresh_token?: string; expires_at?: number };

export interface CasamaApiOptions {
  apiUrl: string;
  /** A fixed access token (CASAMA_TOKEN), or the CLI's session file. */
  token?: string;
  sessionFile?: string;
  fetch?: typeof fetch;
}

export class CasamaApi {
  readonly opts: CasamaApiOptions;
  private session: Session | null = null;

  constructor(opts: CasamaApiOptions) {
    this.opts = { ...opts, apiUrl: opts.apiUrl.replace(/\/$/, "") };
  }

  private get f() {
    return this.opts.fetch ?? fetch;
  }

  private async token(): Promise<string> {
    if (this.opts.token) return this.opts.token;
    const file = this.opts.sessionFile ?? defaultSessionFile();
    this.session ??= JSON.parse(readFileSync(file, "utf8")) as Session;
    const s = this.session;
    if (s.expires_at && s.expires_at * 1000 < Date.now() + 60_000 && s.refresh_token) {
      const cfg = (await (await this.f(`${this.opts.apiUrl}/v1/config`)).json()) as {
        supabase_url: string;
        supabase_anon_key: string;
      };
      const r = await this.f(`${cfg.supabase_url}/auth/v1/token?grant_type=refresh_token`, {
        method: "POST",
        headers: { apikey: cfg.supabase_anon_key, "content-type": "application/json" },
        body: JSON.stringify({ refresh_token: s.refresh_token }),
      });
      if (!r.ok) throw new Error("The Casama session expired. Run `casama login` again.");
      const next = (await r.json()) as Session & { user?: unknown };
      this.session = next;
      writeFileSync(file, JSON.stringify(next), { mode: 0o600 });
    }
    return this.session.access_token;
  }

  async call<T = Record<string, unknown>>(
    path: string,
    init: { method?: string; json?: unknown } = {},
  ): Promise<T> {
    const r = await this.f(`${this.opts.apiUrl}${path}`, {
      method: init.method ?? (init.json === undefined ? "GET" : "POST"),
      headers: {
        authorization: `Bearer ${await this.token()}`,
        ...(init.json !== undefined ? { "content-type": "application/json" } : {}),
      },
      body: init.json === undefined ? undefined : JSON.stringify(init.json),
    });
    const body = (await r.json().catch(() => ({}))) as T & { detail?: string; title?: string };
    if (!r.ok) throw new Error(`${body.detail ?? body.title ?? r.statusText} (HTTP ${r.status})`);
    return body;
  }

  /** A file's bytes, such as a chat picture (`/v1/media/<id>`). */
  async bytes(path: string): Promise<{ data: Uint8Array; contentType: string }> {
    const r = await this.f(`${this.opts.apiUrl}${path}`, {
      headers: { authorization: `Bearer ${await this.token()}` },
    });
    if (!r.ok) throw new Error(`${r.statusText} (HTTP ${r.status})`);
    return {
      data: new Uint8Array(await r.arrayBuffer()),
      contentType: r.headers.get("content-type") ?? "application/octet-stream",
    };
  }
}

export function defaultSessionFile() {
  const dir =
    process.env.CASAMA_CONFIG_DIR ??
    (process.platform === "win32"
      ? join(process.env.APPDATA ?? homedir(), "casama")
      : join(homedir(), ".config", "casama"));
  return join(dir, "session.json");
}

const text = (s: string) => ({ content: [{ type: "text" as const, text: s }] });
const json = (v: unknown) => text(JSON.stringify(v, null, 2));

type ImageBlock = { type: "image"; data: string; mimeType: string };
type RunEvent = { type: string; payload: Record<string, unknown> };
const MAX_IMAGES = 3;
const MAX_IMAGE_BYTES = 3_000_000;

/**
 * Pictures a bot made in a run (its reply's `media:<id>` files, D-205), as image blocks the AI app
 * can show: Gemini only saw the media id and couldn't display the picture (D-567). Up to three
 * pictures of 3 MB each; anything else (videos, bigger files) is named, to open in Casama.
 */
async function replyMedia(
  api: CasamaApi,
  events: RunEvent[],
  mediaLink?: (mediaId: string) => string,
): Promise<{ images: ImageBlock[]; others: string[]; links: string[] }> {
  const files = events
    .filter((e) => e.type === "message.completed")
    .flatMap((e) => (e.payload.content as Array<Record<string, unknown>> | undefined) ?? [])
    .filter((p) => p.type === "file" && typeof p.path === "string" && p.path.startsWith("media:"));
  const images: ImageBlock[] = [];
  const others: string[] = [];
  const links: string[] = [];
  for (const f of files) {
    const mime = String(f.mime_type ?? "");
    const name = String(f.name ?? f.path);
    const url = mediaLink?.(String(f.path).slice("media:".length));
    if (url) links.push(mime.startsWith("image/") ? `![${name}](${url})` : `[${name}](${url})`);
    const fits = mime.startsWith("image/") && Number(f.size ?? 0) <= MAX_IMAGE_BYTES;
    if (fits && images.length < MAX_IMAGES) {
      try {
        const id = String(f.path).slice("media:".length);
        const got = await api.bytes(`/v1/media/${encodeURIComponent(id)}`);
        if (got.data.length <= MAX_IMAGE_BYTES) {
          images.push({
            type: "image",
            data: Buffer.from(got.data).toString("base64"),
            mimeType: got.contentType.split(";")[0] ?? mime,
          });
          continue;
        }
      } catch {
        // Named below instead, to open in Casama.
      }
    }
    others.push(`${name} (${mime || "file"})`);
  }
  return { images, others, links };
}

/** How a tool call ended, for counting: `redirected` means it sent the person to Casama instead. */
export type ToolOutcome = "ok" | "error" | "redirected";

/** Marks a result that sent the person to Casama rather than acting (counted as redirected). */
const REDIRECTED = Symbol("redirected");
const redirectedResult = <T extends object>(r: T) => Object.assign(r, { [REDIRECTED]: true });

/** Wraps every tool registered from here on so each call reports how it ended (no arguments). */
function countToolCalls(server: McpServer, report: (tool: string, outcome: ToolOutcome) => void) {
  type Register = (name: string, config: unknown, cb: (...a: unknown[]) => unknown) => unknown;
  const register = server.registerTool.bind(server) as unknown as Register;
  const wrapped: Register = (name, config, cb) =>
    register(name, config, async (...args: unknown[]) => {
      try {
        const r = (await cb(...args)) as { isError?: boolean; [REDIRECTED]?: boolean } | undefined;
        report(name, r?.isError ? "error" : r?.[REDIRECTED] ? "redirected" : "ok");
        return r;
      } catch (e) {
        report(name, "error");
        throw e;
      }
    });
  (server as unknown as { registerTool: Register }).registerTool = wrapped;
}

/**
 * Copies each tool's title into `annotations.title` too. Claude's connector directory reads the
 * title from the annotations, other clients from the tool itself, so every tool carries both.
 */
function titleInAnnotations(server: McpServer) {
  type Register = (name: string, config: unknown, cb: (...a: unknown[]) => unknown) => unknown;
  const register = server.registerTool.bind(server) as unknown as Register;
  const wrapped: Register = (name, config, cb) => {
    const c = config as { title?: string; annotations?: Record<string, unknown> };
    const annotations =
      c.title && !c.annotations?.title ? { title: c.title, ...c.annotations } : c.annotations;
    return register(name, annotations ? { ...c, annotations } : c, cb);
  };
  (server as unknown as { registerTool: Register }).registerTool = wrapped;
}

/** run_routine's request_id memory: a second start with the same id within a minute is the first. */
const recentStarts = new Map<string, { at: number; result: string }>();
const START_MEMORY_MS = 60_000;

/** Run states after which a run won't move on by itself. */
const SETTLED = ["completed", "failed", "cancelled", "waiting_approval"];

type Org = { id: string; name: string; slug: string; role: string };
type Bot = { id: string; name: string; status: string; org_id: string };

export function createCasamaMcpServer(
  api: CasamaApi,
  opts: {
    pollMs?: number;
    timeoutMs?: number;
    /** The longest ask_bot waits, whatever wait_seconds asks (Gemini: its own call deadline). */
    maxWaitMs?: number;
    /** Hosted /mcp (D-117): the token's workspace; others are invisible. */
    scopeOrgId?: string;
    /** Hosted /mcp: whether this workspace allows deciding approvals over MCP. */
    canDecideApprovals?: () => Promise<boolean>;
    /** Adds the docs tools (search_docs, read_doc, list_doc_pages, get_api_operation). */
    docs?: DocsSource;
    /** Adds check_plugin (stdio only: it reads a folder on this computer). */
    checkPlugin?: (dir: string) => PluginCheckResult | Promise<PluginCheckResult>;
    /** Adds gallery_search over the public gallery catalog. */
    gallery?: GallerySource;
    /**
     * Hosted /mcp (D-567 §4.4): this client never decides approvals, whatever the workspace allows
     * (Gemini). decide_approval answers with the approval's link in Casama instead.
     */
    approvalsInApp?: boolean;
    /** Turns an app route ("/approvals/<id>") into a link that opens it (hosted: appLink, D-326). */
    openLink?: (route: string) => string;
    /**
     * A link anyone can open to a reply's file (`media:<id>`) for a while (hosted: the signed
     * /hooks/files link chat apps get, D-342). Gemini doesn't draw image blocks a tool returns,
     * only pictures linked in its answer (D-567, 2026-11-25), so replies name each picture by link.
     */
    mediaLink?: (mediaId: string) => string;
    /** Who is calling, for run_routine's request_id memory (one person, workspace and app). */
    callerKey?: string;
    /** Counts each tool call (mcp_tool_call). Never gets arguments or results. */
    onToolCall?: (tool: string, outcome: ToolOutcome) => void;
  } = {},
) {
  const server = new McpServer({ name: "casama", version: VERSION });
  titleInAnnotations(server);
  const openLink = opts.openLink ?? ((route: string) => route);
  if (opts.onToolCall) countToolCalls(server, opts.onToolCall);
  if (opts.docs) registerDocsTools(server, opts.docs, { checkPlugin: opts.checkPlugin });
  if (opts.gallery) registerGalleryTools(server, opts.gallery);

  const orgs = async () =>
    (await api.call<{ items: Org[] }>("/v1/orgs")).items.filter(
      (o) => !opts.scopeOrgId || o.id === opts.scopeOrgId,
    );
  const resolveOrg = async (org?: string) => {
    const all = await orgs();
    const o = org
      ? all.find(
          (x) => x.id === org || x.slug === org || x.name.toLowerCase() === org.toLowerCase(),
        )
      : all[0];
    if (!o) throw new Error(org ? `No workspace "${org}"` : "You are not in any workspace yet");
    return o;
  };
  const bots = async (org?: string) => {
    const o = await resolveOrg(org);
    return (await api.call<{ items: Bot[] }>(`/v1/bots?org_id=${o.id}`)).items;
  };
  const resolveBot = async (bot: string, org?: string) => {
    const list = await bots(org);
    const b = list.find((x) => x.id === bot || x.name.toLowerCase() === bot.toLowerCase());
    if (!b)
      throw new Error(`No bot "${bot}". Bots: ${list.map((x) => x.name).join(", ") || "none"}`);
    return b;
  };

  server.registerTool(
    "list_workspaces",
    {
      title: "List workspaces",
      description: "Casama workspaces you belong to, with your role.",
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async () =>
      json((await orgs()).map((o) => ({ id: o.id, name: o.name, slug: o.slug, role: o.role }))),
  );

  server.registerTool(
    "list_bots",
    {
      title: "List bots",
      description:
        "Bots in a workspace (default: your first workspace), with their current status.",
      inputSchema: { workspace: z.string().optional().describe("Workspace slug, name or id") },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ workspace }) =>
      json((await bots(workspace)).map((b) => ({ id: b.id, name: b.name, status: b.status }))),
  );

  server.registerTool(
    "ask_bot",
    {
      title: "Ask a bot",
      description:
        "Send a message to a Casama bot and wait for its reply. The bot can use its own computer and tools; risky actions may wait for the person's approval (see what_needs_me and list_approvals). Pass conversation_id to continue a thread. Assistants that can't wait long should pass wait_seconds: if the bot is still working when it runs out, the answer says so with a run_id (follow up with get_run), and the person gets a notification when it's done.",
      inputSchema: {
        bot: z.string().describe("Bot name or id"),
        message: z.string().min(1).max(20_000),
        conversation_id: z.string().uuid().optional(),
        workspace: z.string().optional(),
        wait_seconds: z
          .number()
          .int()
          .min(5)
          .max(120)
          .optional()
          .describe("How long to wait for the reply, 5–120 seconds (default: up to 10 minutes)"),
      },
      // The bot can act with its own computer and connected apps; risky steps still wait for approval.
      annotations: {
        readOnlyHint: false,
        destructiveHint: true,
        idempotentHint: false,
        openWorldHint: true,
      },
    },
    async ({ bot, message, conversation_id, workspace, wait_seconds }) => {
      const b = await resolveBot(bot, workspace);
      // A conversation id must be one of this bot's (so a workspace-scoped token stays in its workspace).
      if (conversation_id) {
        const mine = (
          await api.call<{ items: Array<{ id: string }> }>(
            `/v1/bots/${encodeURIComponent(b.id)}/conversations?limit=200`,
          )
        ).items;
        if (!mine.some((c) => c.id === conversation_id))
          throw new Error(`No conversation ${conversation_id} with ${b.name}.`);
      }
      const conv =
        conversation_id ??
        (await api.call<{ id: string }>("/v1/conversations", { json: { bot_id: b.id } })).id;
      const sent = await api.call<{ run_id: string }>(`/v1/conversations/${conv}/messages`, {
        json: { text: message },
      });
      const wantMs = wait_seconds != null ? wait_seconds * 1000 : (opts.timeoutMs ?? 10 * 60_000);
      const deadline = Date.now() + Math.min(wantMs, opts.maxWaitMs ?? wantMs);
      let run: { status: string; cost_usd?: number; error?: { message: string } | null } = {
        status: "queued",
      };
      while (!SETTLED.includes(run.status) && Date.now() < deadline) {
        await new Promise((r) =>
          setTimeout(r, Math.min(opts.pollMs ?? 1000, Math.max(0, deadline - Date.now()))),
        );
        run = await api.call(`/v1/runs/${sent.run_id}`);
      }
      const events = (
        await api.call<{ items: Array<{ type: string; payload: Record<string, unknown> }> }>(
          `/v1/runs/${sent.run_id}/events?limit=1000`,
        )
      ).items;
      const reply = events
        .filter((e) => e.type === "message.completed")
        .flatMap((e) => (e.payload.content as Array<{ type: string; text?: string }>) ?? [])
        .filter((p) => p.type === "text")
        .map((p) => p.text)
        .join("\n");
      const tools = events.filter((e) => e.type === "tool.started").map((e) => e.payload.tool);
      const working = !SETTLED.includes(run.status);
      // Gemini sends the person to Casama's approval card instead of deciding (D-567 §4.4).
      let review = "";
      if (run.status === "waiting_approval" && opts.approvalsInApp) {
        const pending = (
          await api.call<{ items: Array<{ id: string; run_id?: string | null }> }>(
            `/v1/approvals?org_id=${b.org_id}&status=pending`,
          )
        ).items;
        const a = pending.find((x) => x.run_id === sent.run_id);
        review = `${b.name} needs the person's OK first. Open Casama to review it${a ? `: ${openLink(`/approvals/${a.id}`)}` : "."}`;
      }
      const lines = [
        reply ||
          (run.status === "completed"
            ? "(no text reply)"
            : working
              ? `${b.name} is still working on it. The person gets a notification when it's done.`
              : ""),
        "",
        review,
        `status: ${run.status}${run.status === "waiting_approval" && !opts.approvalsInApp ? " (approve with decide_approval)" : ""}`,
        run.error ? `error: ${run.error.message}` : "",
        tools.length ? `tools used: ${tools.join(", ")}` : "",
        `conversation_id: ${conv}`,
        `run_id: ${sent.run_id}`,
        run.cost_usd != null ? `cost: $${run.cost_usd.toFixed(4)}` : "",
      ].filter((l, i) => l !== "" || i === 1);
      const media = await replyMedia(api, events, opts.mediaLink);
      const chat = opts.openLink?.(`/bots/${b.id}/chat?c=${conv}`);
      if (media.images.length) lines.push(`pictures: ${media.images.length} attached below`);
      if (media.others.length)
        lines.push(`files: ${media.others.join(", ")}${chat ? ` (open in Casama: ${chat})` : ""}`);
      if (media.links.length)
        lines.push(
          "",
          "Show these to the person as they are (each link works for 7 days):",
          ...media.links,
        );
      const out = text(lines.join("\n").trim()) as {
        content: Array<{ type: "text"; text: string } | ImageBlock>;
      };
      out.content.push(...media.images);
      return review ? redirectedResult(out) : out;
    },
  );

  server.registerTool(
    "react_to_message",
    {
      title: "React to a message",
      description:
        "React to a message in a conversation with one emoji (D-331), or take your reaction back. Without message_id it reacts to the bot's latest reply. One reaction per person per message: another emoji replaces yours. The bot sees it the next time it works in that chat; a 👍 or 👎 tells it whether the reply worked.",
      inputSchema: {
        bot: z.string().describe("Bot name or id"),
        conversation_id: z.string().uuid(),
        emoji: z.string().min(1).max(64).describe("Exactly one emoji, e.g. 👍"),
        message_id: z.string().uuid().optional(),
        remove: z.boolean().optional().describe("Take your reaction back instead"),
        workspace: z.string().optional(),
      },
      annotations: {
        readOnlyHint: false,
        destructiveHint: false,
        idempotentHint: true,
        openWorldHint: false,
      },
    },
    async ({ bot, conversation_id, emoji, message_id, remove, workspace }) => {
      const b = await resolveBot(bot, workspace);
      const mine = (
        await api.call<{ items: Array<{ id: string }> }>(
          `/v1/bots/${encodeURIComponent(b.id)}/conversations?limit=200`,
        )
      ).items;
      if (!mine.some((c) => c.id === conversation_id))
        throw new Error(`No conversation ${conversation_id} with ${b.name}.`);
      let target = message_id;
      if (!target) {
        const items = (
          await api.call<{ items: Array<{ id: string; role: string }> }>(
            `/v1/conversations/${conversation_id}/thread?limit=20`,
          )
        ).items;
        target = [...items].reverse().find((m) => m.role === "assistant")?.id;
        if (!target) throw new Error("The bot hasn't replied in this conversation yet.");
      }
      const path = `/v1/conversations/${conversation_id}/messages/${target}/reaction`;
      return json(
        remove
          ? await api.call(path, { method: "DELETE" })
          : await api.call(path, { method: "PUT", json: { emoji } }),
      );
    },
  );

  server.registerTool(
    "get_run",
    {
      title: "Get a run",
      description: "A run's status, cost and its recent events (tool calls, outputs, errors).",
      inputSchema: { run_id: z.string().uuid() },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ run_id }) => {
      const run = await api.call<{ bot_id: string }>(`/v1/runs/${encodeURIComponent(run_id)}`);
      // Only runs of bots in the token's workspace (hosted /mcp, D-117).
      if (opts.scopeOrgId && !(await bots()).some((b) => b.id === run.bot_id))
        throw new Error("No such run in this workspace.");
      const items = (await api.call<{ items: RunEvent[] }>(`/v1/runs/${run_id}/events?limit=200`))
        .items;
      const events = items
        .filter((e) => e.type !== "message.delta")
        .map((e) => ({ type: e.type, ...e.payload }));
      const out = json({ run, events: events.slice(-60) }) as {
        content: Array<{ type: "text"; text: string } | ImageBlock>;
      };
      const media = await replyMedia(api, items, opts.mediaLink);
      if (media.links.length)
        out.content.push({
          type: "text",
          text: `Files from this run. Show these to the person as they are (each link works for 7 days):\n${media.links.join("\n")}`,
        });
      out.content.push(...media.images);
      return out;
    },
  );

  server.registerTool(
    "list_approvals",
    {
      title: "List approvals",
      description: "Actions waiting for a person's approval in a workspace.",
      inputSchema: { workspace: z.string().optional() },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ workspace }) => {
      const o = await resolveOrg(workspace);
      return json(
        (await api.call<{ items: unknown[] }>(`/v1/approvals?org_id=${o.id}&status=pending`)).items,
      );
    },
  );

  server.registerTool(
    "decide_approval",
    {
      title: "Approve or deny",
      description: opts.approvalsInApp
        ? "Approvals are decided in Casama, not through this assistant. This returns a link that opens the approval in Casama, where the person reviews it and decides; nothing is approved or denied here, so don't retry."
        : "Approve or deny a pending action. The bot continues (or skips the step) right away.",
      inputSchema: {
        approval_id: z.string().uuid(),
        decision: z.enum(["approve", "deny"]),
      },
      // Approving lets the bot carry out the waiting step, which may act outside Casama.
      annotations: {
        readOnlyHint: false,
        destructiveHint: true,
        idempotentHint: false,
        openWorldHint: true,
      },
    },
    async ({ approval_id, decision }) => {
      if (opts.approvalsInApp) {
        // Never decided here, even when the workspace allows deciding over MCP (D-567 §4.4).
        const o = await resolveOrg();
        const pending = (
          await api.call<{ items: Array<{ id: string }> }>(
            `/v1/approvals?org_id=${o.id}&status=pending`,
          )
        ).items;
        if (!pending.some((a) => a.id === approval_id))
          throw new Error("No such pending approval in this workspace.");
        return redirectedResult(
          text(
            `Open Casama to review it: ${openLink(`/approvals/${approval_id}`)}\nThe person approves or denies it there. Nothing was decided.`,
          ),
        );
      }
      if (opts.canDecideApprovals && !(await opts.canDecideApprovals()))
        throw new Error(
          "This workspace doesn't allow deciding approvals over MCP. Approve it in the Casama app.",
        );
      if (opts.scopeOrgId) {
        const pending = (
          await api.call<{ items: Array<{ id: string }> }>(
            `/v1/approvals?org_id=${opts.scopeOrgId}&status=pending`,
          )
        ).items;
        if (!pending.some((a) => a.id === approval_id))
          throw new Error("No such pending approval in this workspace.");
      }
      return json(
        await api.call(`/v1/approvals/${approval_id}/decision`, {
          json: { decision: decision === "approve" ? "approved" : "denied" },
        }),
      );
    },
  );

  // ------------------------------------------- What needs the person, routines (D-567 §5)
  type GlanceNeed = {
    kind: "approval" | "takeover" | "suggestion";
    id: string;
    bot: string;
    text: string;
    risk: "low" | "medium" | "high" | null;
    urgent: boolean;
    created_at: string;
    link: string;
  };
  server.registerTool(
    "what_needs_me",
    {
      title: "What needs me",
      description:
        "What is waiting for the person in Casama: approvals (a bot wants an OK before a risky step), take-overs (a bot needs the person to do something on its computer) and suggestions. Each comes with a link that opens it in Casama. Approvals are reviewed there.",
      inputSchema: { workspace: z.string().optional() },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ workspace }) => {
      const o = await resolveOrg(workspace);
      const g = await api.call<{ needs: { count: number; items: GlanceNeed[] } }>(
        `/v1/glance?org_id=${o.id}`,
      );
      if (g.needs.count === 0) return text("Nothing needs the person right now.");
      const what = (n: GlanceNeed) =>
        n.kind === "approval"
          ? `${n.bot} wants an OK${n.risk ? ` (${n.risk} risk)` : ""}`
          : n.kind === "takeover"
            ? `${n.bot} needs the person on its computer`
            : `${n.bot} suggests${n.urgent ? " (urgent)" : ""}`;
      const lines = g.needs.items.map(
        (n) => `- ${what(n)}${n.text ? `: ${n.text}` : ""}\n  open: ${openLink(n.link)}`,
      );
      const more = g.needs.count - g.needs.items.length;
      return text(
        [
          `${g.needs.count} ${g.needs.count === 1 ? "thing needs" : "things need"} the person:`,
          ...lines,
          more > 0 ? `…and ${more} more in Casama: ${openLink("/inbox")}` : "",
        ]
          .filter(Boolean)
          .join("\n"),
      );
    },
  );

  type RoutineItem = {
    id: string;
    bot_id: string;
    name: string;
    schedule_cron: string | null;
    timezone: string;
    trigger: unknown;
    enabled: boolean;
    next_run_at: string | null;
    last_run_at: string | null;
  };
  const routinesOf = async (workspace?: string, bot?: string) => {
    const list = bot ? [await resolveBot(bot, workspace)] : await bots(workspace);
    const out: Array<RoutineItem & { bot: string }> = [];
    for (const b of list) {
      const items = (
        await api.call<{ items: RoutineItem[] }>(`/v1/bots/${encodeURIComponent(b.id)}/routines`)
      ).items;
      out.push(...items.map((r) => ({ ...r, bot: b.name })));
    }
    return out;
  };

  server.registerTool(
    "list_routines",
    {
      title: "List routines",
      description:
        "The person's routines: things a bot does on a schedule or a trigger (a morning brief, a weekly report). Optionally only one bot's.",
      inputSchema: {
        bot: z.string().optional().describe("Only this bot's routines (name or id)"),
        workspace: z.string().optional(),
      },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ bot, workspace }) =>
      json(
        (await routinesOf(workspace, bot)).map((r) => ({
          id: r.id,
          name: r.name,
          bot: r.bot,
          enabled: r.enabled,
          schedule: r.schedule_cron,
          timezone: r.timezone,
          next_run_at: r.next_run_at,
          last_run_at: r.last_run_at,
        })),
      ),
  );

  server.registerTool(
    "run_routine",
    {
      title: "Run a routine",
      description:
        "Start one of the person's routines now, by name or id. It runs like a scheduled run; the result arrives in Casama and as a notification. Pass request_id so a retry within a minute doesn't start it twice.",
      inputSchema: {
        routine: z.string().min(1).describe("Routine name or id"),
        bot: z.string().optional().describe("The routine's bot, when names repeat"),
        request_id: z.string().min(1).max(100).optional(),
        workspace: z.string().optional(),
      },
      annotations: {
        readOnlyHint: false,
        destructiveHint: false,
        idempotentHint: false,
        openWorldHint: true,
      },
    },
    async ({ routine, bot, request_id, workspace }) => {
      const now = Date.now();
      for (const [k, v] of recentStarts) if (now - v.at > START_MEMORY_MS) recentStarts.delete(k);
      const key = request_id ? `${opts.callerKey ?? "local"}|${request_id}` : null;
      const seen = key ? recentStarts.get(key) : undefined;
      if (seen) return text(seen.result);
      const all = await routinesOf(workspace, bot);
      const r =
        all.find((x) => x.id === routine) ??
        all.find((x) => x.name.toLowerCase() === routine.toLowerCase());
      if (!r)
        throw new Error(
          `No routine "${routine}". Routines: ${all.map((x) => x.name).join(", ") || "none"}`,
        );
      const started = await api.call<{ run_id: string }>(
        `/v1/routines/${encodeURIComponent(r.id)}/run`,
        { json: {} },
      );
      const result = `Started ${r.name} (${r.bot}). The person gets the result in Casama.\nrun_id: ${started.run_id}`;
      if (key) recentStarts.set(key, { at: now, result });
      return text(result);
    },
  );

  // ---------------------------------------------------------------- Sites and domains (D-329)
  type DomainItem = { id: string; name: string; state: string; live: boolean };
  const domainsOf = async (workspace?: string) => {
    const o = await resolveOrg(workspace);
    return (await api.call<{ items: DomainItem[] }>(`/v1/orgs/${o.id}/domains`)).items;
  };
  /** A domain of a workspace the token can see (hosted /mcp stays in its workspace). */
  const ownDomain = async (id: string, workspace?: string) => {
    const d = (await domainsOf(workspace)).find((x) => x.id === id || x.name === id);
    if (!d) throw new Error(`No domain "${id}" in this workspace.`);
    return d;
  };

  server.registerTool(
    "list_sites",
    {
      title: "List sites",
      description:
        "Pages published on the web at their own address in a workspace, with their hosts and states.",
      inputSchema: { workspace: z.string().optional() },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ workspace }) => {
      const o = await resolveOrg(workspace);
      return json((await api.call<{ items: unknown[] }>(`/v1/orgs/${o.id}/sites`)).items);
    },
  );

  server.registerTool(
    "list_domains",
    {
      title: "List domains",
      description:
        "Connected and bought domains in a workspace: the site each shows and its state (live, waiting_dns, waiting_cert, paused, needs_attention).",
      inputSchema: { workspace: z.string().optional() },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ workspace }) => json(await domainsOf(workspace)),
  );

  server.registerTool(
    "get_domain",
    {
      title: "Get a domain",
      description:
        "A domain's hosts and states, the DNS records to add with what DNS shows now, renewal details and history.",
      inputSchema: {
        domain: z.string().describe("Domain id or name"),
        workspace: z.string().optional(),
      },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ domain, workspace }) => {
      const d = await ownDomain(domain, workspace);
      return json(await api.call(`/v1/domains/${d.id}`));
    },
  );

  server.registerTool(
    "check_domain",
    {
      title: "Check a domain's DNS now",
      description:
        "Check a domain's DNS and certificate now instead of waiting for the next check (admins; at most once every 10 seconds).",
      inputSchema: { domain: z.string(), workspace: z.string().optional() },
      // Looks up public DNS and may update the domain's state; changes nothing the person set.
      annotations: {
        readOnlyHint: false,
        destructiveHint: false,
        idempotentHint: true,
        openWorldHint: true,
      },
    },
    async ({ domain, workspace }) => {
      const d = await ownDomain(domain, workspace);
      return json(await api.call(`/v1/domains/${d.id}/check`, { method: "POST" }));
    },
  );

  server.registerTool(
    "connect_domain",
    {
      title: "Connect a domain",
      description:
        "Connect a domain the workspace already owns (bakery.com, www.bakery.com or shop.bakery.com), optionally showing a published site. Answers the DNS records to add at the domain's DNS company (admins).",
      inputSchema: {
        name: z.string().min(3).max(253),
        page_id: z.string().uuid().optional().describe("A published site's page id"),
        workspace: z.string().optional(),
      },
      annotations: {
        readOnlyHint: false,
        destructiveHint: false,
        idempotentHint: true,
        openWorldHint: true,
      },
    },
    async ({ name, page_id, workspace }) => {
      const o = await resolveOrg(workspace);
      return json(
        await api.call(`/v1/orgs/${o.id}/domains`, {
          json: { name, ...(page_id ? { page_id } : {}) },
        }),
      );
    },
  );

  server.registerTool(
    "search_domains",
    {
      title: "Search domains to buy",
      description:
        "Domain names for a few words or a name, with availability, the first year's price and the renewal price (before tax). Only a person can buy one, in the Casama app.",
      inputSchema: { query: z.string().min(1).max(100), workspace: z.string().optional() },
      annotations: { readOnlyHint: true, openWorldHint: true },
    },
    async ({ query, workspace }) => {
      const o = await resolveOrg(workspace);
      return json(
        (
          await api.call<{ items: unknown[] }>(
            `/v1/domains/search?org_id=${o.id}&q=${encodeURIComponent(query)}`,
          )
        ).items,
      );
    },
  );

  server.registerTool(
    "list_packs",
    {
      title: "List installed packs",
      description:
        "Packs installed in a workspace: plugins that brought bots, skills, routines, apps and looks.",
      inputSchema: { workspace: z.string().optional() },
      annotations: { readOnlyHint: true, openWorldHint: false },
    },
    async ({ workspace }) => {
      const o = await resolveOrg(workspace);
      return json((await api.call<{ items: unknown[] }>(`/v1/packs?org_id=${o.id}`)).items);
    },
  );

  server.registerTool(
    "preview_pack",
    {
      title: "Preview a pack",
      description:
        "What a pack from a GitHub link (or a reviewed pack from the directory, by id) would add: bots, skills, routines, apps, looks, tools, the questions it asks, what it can reach and the commit to install.",
      inputSchema: {
        url: z.string().optional().describe("A GitHub repository or folder"),
        gallery_id: z.string().optional().describe("A pack from the plugin directory"),
        workspace: z.string().optional(),
      },
      annotations: { readOnlyHint: true, openWorldHint: true },
    },
    async ({ url, gallery_id, workspace }) => {
      const o = await resolveOrg(workspace);
      return json(
        await api.call("/v1/packs/preview", {
          json: { org_id: o.id, ...(url ? { url } : {}), ...(gallery_id ? { gallery_id } : {}) },
        }),
      );
    },
  );

  server.registerTool(
    "install_pack",
    {
      title: "Install a pack",
      description:
        "Install a pack in a workspace, pinned to the commit preview_pack showed. Show the person the preview first. Secrets aren't taken here: the person adds them in the app. Packs that aren't reviewed start their routines switched off; the workspace's gallery rules apply.",
      inputSchema: {
        url: z.string().optional(),
        commit: z
          .string()
          .regex(/^[0-9a-f]{40}$/)
          .optional(),
        gallery_id: z.string().optional(),
        inputs: z.record(z.string(), z.string()).optional().describe("Answers to its questions"),
        skip: z
          .array(z.object({ kind: z.string(), id: z.string() }))
          .optional()
          .describe("Items to leave out"),
        workspace: z.string().optional(),
      },
      annotations: {
        readOnlyHint: false,
        destructiveHint: false,
        idempotentHint: false,
        openWorldHint: true,
      },
    },
    async ({ url, commit, gallery_id, inputs, skip, workspace }) => {
      const o = await resolveOrg(workspace);
      return json(
        await api.call("/v1/packs", {
          json: {
            org_id: o.id,
            ...(url ? { url } : {}),
            ...(commit ? { commit } : {}),
            ...(gallery_id ? { gallery_id } : {}),
            ...(inputs ? { inputs } : {}),
            ...(skip ? { skip } : {}),
          },
        }),
      );
    },
  );

  return server;
}

/** Only the docs tools, no account: what anyone gets at /mcp/docs without signing in. */
export function createCasamaDocsMcpServer(
  docs: DocsSource,
  opts: {
    checkPlugin?: (dir: string) => PluginCheckResult | Promise<PluginCheckResult>;
    /** Adds gallery_search over the public gallery catalog. */
    gallery?: GallerySource;
  } = {},
) {
  const server = new McpServer({ name: "casama-docs", version: VERSION });
  titleInAnnotations(server);
  registerDocsTools(server, docs, opts);
  if (opts.gallery) registerGalleryTools(server, opts.gallery);
  return server;
}
