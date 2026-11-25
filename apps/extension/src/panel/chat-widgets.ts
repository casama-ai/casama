/**
 * Interactive Chat & Inbox widgets for Phase 2 parity:
 * - Collapsible Tool Timeline with Computer Places badge (D-483)
 * - Inline Takeover card with Share Login (D-482)
 * - Inline Secret request card (D-101)
 * - Inline MCP Question elicitation form (D-363)
 * - Inline MCP Server / App Connect card with probe + OAuth polling (D-473)
 * - Call Recap card with summary, next steps, actions, transcript, Call back (D-429, D-426)
 * - Quiet run notices (memory with Undo, skill, fallback, checkpoint, notice, canvas, gallery)
 */
import type { Schemas } from "@casama/client";
import { h } from "../lib/dom.ts";
import { popOutLiveView } from "../lib/live-view.ts";
import { markdownNodes } from "../lib/md.ts";
import { appUrl, type Here } from "../lib/workspace.ts";
import { errorBox, message, T, toast } from "./shared.ts";

// ---------------------------------------------------------------------------
// Tool Timeline + Computer Places (D-483)

export interface ToolPlace {
  computer_id?: string;
  kind?: string;
  name?: string;
}

interface ToolStepRow {
  callId: string;
  tool: string;
  place?: ToolPlace;
  status: "running" | "done" | "failed";
  el: HTMLElement;
  icon: HTMLElement;
  meta: HTMLElement;
  output: HTMLElement;
}

export function friendlyToolName(wire: string): string {
  return wire.replace(/__/g, " · ").replace(/_/g, " ");
}

export class ToolTimeline {
  readonly el: HTMLDetailsElement;
  private summary = h("summary", { className: "tl-summary" }, "Working…");
  private list = h("div", { className: "tl-list" });
  private steps = new Map<string, ToolStepRow>();

  constructor() {
    this.el = h(
      "details",
      { className: "tool-timeline", "data-testid": "tool-timeline" },
      this.summary,
      this.list,
    ) as HTMLDetailsElement;
  }

  get count() {
    return this.steps.size;
  }

  private updateSummary() {
    const all = [...this.steps.values()];
    const running = all.filter((s) => s.status === "running");
    const failed = all.filter((s) => s.status === "failed").length;
    if (running.length) {
      const cur = running.at(-1)!;
      const place = cur.place?.kind === "local" && cur.place.name ? ` on ${cur.place.name}` : "";
      this.summary.textContent = `Working: ${friendlyToolName(cur.tool)}${place} (${all.length} step${all.length === 1 ? "" : "s"})`;
    } else {
      this.summary.textContent =
        failed > 0
          ? `Used ${all.length} step${all.length === 1 ? "" : "s"} (${failed} failed)`
          : `Used ${all.length} step${all.length === 1 ? "" : "s"}`;
    }
  }

  start(callId: string, tool: string, place?: ToolPlace) {
    const icon = h("span", { className: "tl-icon running", "aria-hidden": "true" }, "⋯");
    const meta = h("span", { className: "tl-meta" });
    const placeBadge =
      place?.name && place.kind === "local"
        ? h("span", { className: "place-badge", "data-testid": "place-badge" }, `on ${place.name}`)
        : null;
    const output = h("pre", { className: "tl-out", hidden: true });
    const row = h(
      "div",
      { className: "tl-step", "data-testid": "tool-step" },
      h(
        "div",
        { className: "tl-head" },
        icon,
        h("span", { className: "tl-name" }, friendlyToolName(tool)),
        placeBadge,
        meta,
      ),
      output,
    );
    this.list.append(row);
    this.steps.set(callId, { callId, tool, place, status: "running", el: row, icon, meta, output });
    this.updateSummary();
  }

  appendOutput(callId: string, chunk: string) {
    const s = this.steps.get(callId);
    if (!s || !chunk) return;
    s.output.hidden = false;
    s.output.textContent = ((s.output.textContent ?? "") + chunk).slice(-600);
  }

  complete(callId: string, durationMs?: number, preview?: string) {
    const s = this.steps.get(callId);
    if (!s) return;
    s.status = "done";
    s.icon.textContent = "✓";
    s.icon.className = "tl-icon done";
    if (typeof durationMs === "number") {
      s.meta.textContent =
        durationMs >= 1000 ? `${(durationMs / 1000).toFixed(1)}s` : `${durationMs}ms`;
    }
    if (preview && !s.output.textContent) {
      s.output.hidden = false;
      s.output.textContent = preview.slice(0, 240);
    }
    this.updateSummary();
  }

  fail(callId: string, msg: string) {
    const s = this.steps.get(callId);
    if (!s) return;
    s.status = "failed";
    s.icon.textContent = "✕";
    s.icon.className = "tl-icon failed";
    s.output.hidden = false;
    s.output.textContent = msg.slice(0, 240);
    this.updateSummary();
  }
}

// ---------------------------------------------------------------------------
// Takeover + Share Login (D-482)

export interface TakeoverInfo {
  id?: string;
  computer_id: string;
  reason: string;
  login_host?: string | null;
  botName?: string;
  createdAt?: string;
}

export function takeoverCard(
  here: Here,
  info: TakeoverInfo,
  opts: { onResolved?: (outcome: string) => void } = {},
) {
  const card = h(
    "div",
    { className: "item takeover-card", "data-testid": "takeover-card" },
    h("h3", {}, info.botName ? `${info.botName} needs you` : "A bot needs you to take over"),
    h("p", {}, info.reason),
    info.login_host
      ? h("div", { className: "meta" }, `Sign-in requested for ${info.login_host}`)
      : "",
  );
  const actions = h("div", { className: "row" });
  const formWrap = h("div", { hidden: true });

  const resolve = (text: string, outcome = "completed") => {
    card.replaceChildren(h("div", { className: "meta", "data-testid": "takeover-resolved" }, text));
    opts.onResolved?.(outcome);
  };

  actions.append(
    h(
      "button",
      {
        type: "button",
        className: "primary",
        "data-testid": "takeover-control",
        onClick: () => {
          void popOutLiveView(info.computer_id, info.botName ?? "Computer").catch(() => {
            void chrome.tabs.create({
              url: appUrl(here.account, `/computer/live?c=${encodeURIComponent(info.computer_id)}`),
            });
          });
        },
      },
      "Take Control",
    ),
  );

  if (info.id && info.login_host) {
    const takeoverId = info.id;
    const host = info.login_host;
    // Allow password-manager autofill on Share Login (per §7 / D-482), cleared immediately after send.
    const userInput = h("input", {
      type: "text",
      name: "username",
      autocomplete: "username",
      placeholder: "Username or email",
      "aria-label": "Username or email",
      "data-testid": "share-login-user",
    }) as HTMLInputElement;
    const passInput = h("input", {
      type: "password",
      name: "password",
      autocomplete: "current-password",
      placeholder: "Password",
      "aria-label": "Password",
      "data-testid": "share-login-pass",
    }) as HTMLInputElement;
    const rememberBox = h("input", {
      type: "checkbox",
      "data-testid": "share-login-remember",
    }) as HTMLInputElement;
    const submitBtn = h(
      "button",
      { type: "submit", className: "primary", "data-testid": "share-login-submit" },
      "Send to Vault & sign in",
    ) as HTMLButtonElement;
    const errSlot = h("div");
    const loginForm = h(
      "form",
      { className: "share-login-form", "data-testid": "share-login-form" },
      h(
        "div",
        { className: "meta" },
        `Sent straight to your Vault for ${host}. Never stored in this browser.`,
      ),
      userInput,
      passInput,
      h("label", { className: "choice" }, rememberBox, h("span", {}, "Remember for next time")),
      h("div", { className: "row" }, submitBtn),
      errSlot,
    );
    loginForm.addEventListener("submit", async (ev) => {
      ev.preventDefault();
      const username = userInput.value.trim();
      const password = passInput.value;
      if (!username || !password) return;
      submitBtn.disabled = true;
      errSlot.replaceChildren();
      try {
        await here.api.unwrap(
          here.api.POST("/v1/takeovers/{id}/login", {
            params: { path: { id: takeoverId } },
            body: { username, password, remember: rememberBox.checked },
            signal: T(),
          }),
        );
        userInput.value = "";
        passInput.value = "";
        resolve(`Shared login for ${host}. The bot is signing in.`, "credentials");
      } catch (e) {
        errSlot.replaceChildren(errorBox(e));
      } finally {
        submitBtn.disabled = false;
      }
    });
    formWrap.append(loginForm);

    actions.append(
      h(
        "button",
        {
          type: "button",
          "data-testid": "takeover-share-login",
          onClick: () => {
            formWrap.hidden = !formWrap.hidden;
            if (!formWrap.hidden) userInput.focus();
          },
        },
        "Share Login",
      ),
    );
  }

  if (info.id) {
    const takeoverId = info.id;
    actions.append(
      h(
        "button",
        {
          type: "button",
          className: "link",
          "data-testid": "takeover-dismiss",
          onClick: async () => {
            try {
              await here.api.unwrap(
                here.api.POST("/v1/takeovers/{id}/dismiss", {
                  params: { path: { id: takeoverId } },
                  body: {},
                  signal: T(),
                }),
              );
              resolve("Dismissed.", "dismissed");
            } catch (e) {
              toast(message(e));
            }
          },
        },
        "Dismiss",
      ),
    );
  }

  card.append(actions, formWrap);
  return {
    el: card,
    resolve: (outcome: string, note?: string | null) => {
      const label =
        outcome === "completed" || outcome === "credentials"
          ? note || "Handled. The bot is continuing."
          : outcome === "dismissed"
            ? "Dismissed."
            : "Expired.";
      resolve(label, outcome);
    },
  };
}

// ---------------------------------------------------------------------------
// Inline Secret Request (D-101)

export interface SecretInfo {
  request_id: string;
  name: string;
  service: string;
  reason: string;
  kind: "value" | "totp";
}

export function inlineSecretCard(here: Here, s: SecretInfo) {
  const input = h("input", {
    type: "password",
    autocomplete: "off",
    placeholder: s.kind === "totp" ? "Setup key" : "Value",
    "aria-label": s.name,
    "data-testid": "inline-secret-input",
  }) as HTMLInputElement;
  const errSlot = h("div");
  const card = h(
    "form",
    { className: "item", "data-testid": "secret-inline" },
    h("h3", {}, `Bot asks for ${s.name}`),
    h("div", { className: "meta" }, `${s.service} · ${s.reason}`),
    input,
    errSlot,
  );
  const finish = (text: string) => {
    input.value = "";
    card.replaceChildren(h("div", { className: "meta" }, text));
  };
  const decline = async () => {
    try {
      await here.api.unwrap(
        here.api.POST("/v1/secrets/requests/{id}/decline", {
          params: { path: { id: s.request_id } },
          signal: T(),
        }),
      );
      finish("Declined.");
    } catch (e) {
      errSlot.replaceChildren(errorBox(e));
    }
  };
  card.append(
    h(
      "div",
      { className: "row" },
      h(
        "button",
        { className: "primary", type: "submit", "data-testid": "inline-secret-send" },
        "Send to Vault",
      ),
      h("button", { type: "button", onClick: () => void decline() }, "Decline"),
    ),
  );
  card.addEventListener("submit", async (ev) => {
    ev.preventDefault();
    const val = input.value;
    if (!val) return;
    errSlot.replaceChildren();
    try {
      await here.api.unwrap(
        here.api.POST("/v1/secrets/requests/{id}/fulfill", {
          params: { path: { id: s.request_id } },
          body: { value: val },
          signal: T(),
        }),
      );
      finish("Sent to Vault. The bot can use it now.");
    } catch (e) {
      errSlot.replaceChildren(errorBox(e));
    }
  });
  return {
    el: card,
    resolve: (outcome: string) =>
      finish(
        outcome === "fulfilled"
          ? "Sent to Vault."
          : outcome === "declined"
            ? "Declined."
            : "Expired.",
      ),
  };
}

// ---------------------------------------------------------------------------
// Inline MCP Question (D-363)

export interface McpQuestionInfo {
  question_id: string;
  connection: string;
  message: string;
  schema: Record<string, unknown>;
}

export function mcpQuestionCard(here: Here, q: McpQuestionInfo) {
  const props = (q.schema?.properties as Record<string, Record<string, unknown>> | undefined) ?? {};
  const required = new Set(
    Array.isArray(q.schema?.required) ? (q.schema.required as string[]) : [],
  );
  const getters = new Map<string, () => unknown>();
  const fields = h("div", { className: "ui-col" });

  for (const [key, spec] of Object.entries(props)) {
    const title = String(spec.title ?? key);
    const desc = typeof spec.description === "string" ? spec.description : "";
    const type = String(spec.type ?? "string");
    if (Array.isArray(spec.enum) && spec.enum.length) {
      const sel = h(
        "select",
        { "aria-label": title, "data-testid": `mcp-field-${key}` },
        ...spec.enum.map((v) => h("option", { value: String(v) }, String(v))),
      ) as HTMLSelectElement;
      getters.set(key, () => sel.value);
      fields.append(h("label", { className: "ui-field" }, title, sel));
    } else if (type === "boolean") {
      const box = h("input", {
        type: "checkbox",
        checked: spec.default === true,
        "data-testid": `mcp-field-${key}`,
      }) as HTMLInputElement;
      getters.set(key, () => box.checked);
      fields.append(h("label", { className: "ui-check" }, box, title));
    } else {
      const inp = h("input", {
        type: type === "number" || type === "integer" ? "number" : "text",
        placeholder: desc,
        required: required.has(key),
        value: spec.default != null ? String(spec.default) : "",
        "data-testid": `mcp-field-${key}`,
      }) as HTMLInputElement;
      getters.set(key, () =>
        type === "number" || type === "integer" ? Number(inp.value) : inp.value,
      );
      fields.append(h("label", { className: "ui-field" }, title, inp));
    }
  }

  const errSlot = h("div");
  const form = h(
    "form",
    { className: "item", "data-testid": "mcp-question" },
    h("h3", {}, `${q.connection} asks`),
    h("p", {}, q.message),
    fields,
    errSlot,
  );
  const finish = (text: string) => {
    form.replaceChildren(h("div", { className: "meta" }, text));
  };
  const answer = async (action: "accept" | "decline") => {
    errSlot.replaceChildren();
    try {
      const content: Record<string, unknown> = {};
      if (action === "accept") {
        for (const [k, get] of getters) content[k] = get();
      }
      await here.api.unwrap(
        here.api.POST("/v1/mcp-questions/{id}/answer", {
          params: { path: { id: q.question_id } },
          body: action === "accept" ? { action, content } : { action },
          signal: T(),
        }),
      );
      finish(action === "accept" ? "Answered." : "Declined.");
    } catch (e) {
      errSlot.replaceChildren(errorBox(e));
    }
  };
  form.append(
    h(
      "div",
      { className: "row" },
      h(
        "button",
        { type: "submit", className: "primary", "data-testid": "mcp-question-submit" },
        "Submit",
      ),
      h("button", { type: "button", onClick: () => void answer("decline") }, "Decline"),
    ),
  );
  form.addEventListener("submit", (ev) => {
    ev.preventDefault();
    void answer("accept");
  });
  return {
    el: form,
    resolve: (outcome: string) =>
      finish(
        outcome === "accepted"
          ? "Answered."
          : outcome === "declined"
            ? "Declined."
            : outcome === "cancelled"
              ? "Cancelled."
              : "Expired.",
      ),
  };
}

// ---------------------------------------------------------------------------
// Inline MCP Server & App Connect (D-473, Decision #2)

export interface OfferedServerInfo {
  name: string;
  url?: string;
  command?: string;
  appId?: string;
}

export function extractOfferedServer(ctx: Record<string, unknown>): OfferedServerInfo | null {
  const srv =
    typeof ctx.server === "object" && ctx.server !== null
      ? (ctx.server as Record<string, unknown>)
      : ctx;
  const url =
    typeof srv.url === "string"
      ? srv.url
      : typeof srv.server_url === "string"
        ? srv.server_url
        : undefined;
  const command = typeof srv.command === "string" ? srv.command : undefined;
  if (!url && !command) return null;
  const name =
    typeof srv.name === "string" && srv.name.trim()
      ? srv.name.trim()
      : url
        ? new URL(url).hostname
        : "MCP Server";
  return { name, url, command };
}

export function mcpConnectCard(
  here: Here,
  info: OfferedServerInfo,
  opts: { botId?: string; onConnected: (label: string) => void | Promise<void> },
): HTMLElement {
  const body = h("div", { className: "meta" }, "Checking server…");
  const card = h(
    "div",
    { className: "item", "data-testid": "mcp-connect-card" },
    h("h3", {}, `Connect ${info.name}`),
    body,
  );

  if (info.command && !info.url) {
    body.replaceChildren(
      h(
        "p",
        {},
        `${info.name} runs on your own computer. Add it in the Casama desktop app under Local MCP servers.`,
      ),
      h(
        "a",
        {
          href: appUrl(here.account, "/settings/integrations"),
          target: "_blank",
          rel: "noopener",
        },
        "Open Integrations in Casama",
      ),
    );
    return card;
  }

  const pollFlow = async (flowId: string, statusEl: HTMLElement) => {
    statusEl.textContent = "Finish signing in in the tab that opened…";
    for (let i = 0; i < 90; i++) {
      await new Promise((r) => setTimeout(r, 2000));
      if (!card.isConnected) return;
      const r = await here.api
        .unwrap(
          here.api.GET("/v1/apps/connect/{id}", {
            params: { path: { id: flowId } },
            signal: T(),
          }),
        )
        .catch(() => null);
      if (r?.status === "connected") {
        card.replaceChildren(h("div", { className: "meta" }, `Connected ${info.name}.`));
        await opts.onConnected(info.name);
        return;
      }
      if (r?.status === "error" || r?.status === "expired") {
        statusEl.textContent = r.error || "Sign-in didn't finish. Try again.";
        return;
      }
    }
    statusEl.textContent = "Timed out waiting for sign-in.";
  };

  void (async () => {
    try {
      let auth: "none" | "oauth" | "key" = "oauth";
      let appId = info.appId;
      if (info.url && !appId) {
        const probed = await here.api.unwrap(
          here.api.POST("/v1/apps/probe", {
            body: { org_id: here.org.id, url: info.url },
            signal: T(),
          }),
        );
        auth = probed.auth;
        appId = probed.app_id;
      }
      const status = h("div", { className: "meta" });
      const keyInput =
        auth === "key"
          ? (h("input", {
              type: "password",
              autocomplete: "off",
              placeholder: "API key or token",
              "aria-label": "API key",
              "data-testid": "mcp-api-key",
            }) as HTMLInputElement)
          : null;
      const connectBtn = h(
        "button",
        {
          type: "button",
          className: "primary",
          "data-testid": "mcp-connect-btn",
          onClick: async () => {
            connectBtn.disabled = true;
            status.textContent = "Connecting…";
            try {
              const apiKey = keyInput?.value.trim();
              if (auth === "key" && !apiKey) {
                status.textContent = "Enter an API key first.";
                connectBtn.disabled = false;
                return;
              }
              const res = appId
                ? await here.api.unwrap(
                    here.api.POST("/v1/apps/connect", {
                      body: {
                        org_id: here.org.id,
                        app_id: appId,
                        method: auth === "key" ? "api_key" : auth,
                        ...(apiKey ? { api_key: apiKey } : {}),
                        return_to_app: false,
                      },
                      signal: T(),
                    }),
                  )
                : await here.api.unwrap(
                    here.api.POST("/v1/apps/connect-server", {
                      body: {
                        org_id: here.org.id,
                        url: info.url!,
                        name: info.name,
                        method: auth === "key" ? "api_key" : auth,
                        ...(apiKey ? { api_key: apiKey } : {}),
                        ...(opts.botId ? { bot_id: opts.botId } : {}),
                        return_to_app: false,
                      },
                      signal: T(),
                    }),
                  );
              if (keyInput) keyInput.value = "";
              if (res.status === "connected") {
                card.replaceChildren(h("div", { className: "meta" }, `Connected ${info.name}.`));
                await opts.onConnected(info.name);
              } else if (res.status === "authorize" && res.authorize_url && res.flow_id) {
                await chrome.tabs.create({ url: res.authorize_url });
                await pollFlow(res.flow_id, status);
              } else {
                status.textContent = res.error || "Couldn't connect.";
                connectBtn.disabled = false;
              }
            } catch (e) {
              status.textContent = message(e);
              connectBtn.disabled = false;
            }
          },
        },
        auth === "oauth" ? `Sign in to ${info.name}` : `Connect ${info.name}`,
      ) as HTMLButtonElement;
      body.replaceChildren(
        info.url ? h("div", { className: "meta" }, info.url) : "",
        keyInput ?? "",
        h(
          "div",
          { className: "row" },
          connectBtn,
          h(
            "button",
            { type: "button", className: "link", onClick: () => card.remove() },
            "Cancel",
          ),
        ),
        status,
      );
    } catch (e) {
      body.replaceChildren(errorBox(e));
    }
  })();

  return card;
}

// ---------------------------------------------------------------------------
// Call Recap Card (D-429, D-426)

export interface CallPartData {
  live_call_id?: string | null;
  seconds?: number;
  kind?: "app" | "phone";
  ended?: string;
  turns?: number;
  tasks?: Array<{ run_id?: string; title?: string; status?: string }>;
  actions?: Array<{ label?: string; tool?: string }>;
  summary?: { status?: string; text?: string };
  next_steps?: Array<{ id?: string; text?: string; status?: string }>;
  reason?: string;
}

export function formatDuration(seconds: number): string {
  const s = Math.max(0, Math.round(seconds));
  const m = Math.floor(s / 60);
  const rem = s % 60;
  return m > 0 ? `${m}m ${rem}s` : `${rem}s`;
}

export function callRecapCard(
  here: Here,
  part: CallPartData,
  opts: {
    botName: string;
    transcript?: Array<{ role: string; text: string }>;
    onCallBack?: () => void;
    onStepStarted?: (runId: string) => void;
  },
): HTMLElement {
  const endedLabel: Record<string, string> = {
    hung_up: "Call ended",
    bot_hung_up: `${opts.botName} ended the call`,
    dropped: "Connection dropped",
    idle: "Ended after silence",
    limit: "Reached call limit",
    silent: "No answer",
  };
  const statusText = endedLabel[part.ended ?? ""] ?? "Voice call";
  const dur = typeof part.seconds === "number" ? formatDuration(part.seconds) : "";
  const metaBits = [statusText, dur, part.turns ? `${part.turns} turns` : ""].filter(Boolean);

  const card = h(
    "div",
    { className: "item call-recap", "data-testid": "call-recap" },
    h(
      "div",
      { className: "row", style: "margin-top:0;justify-content:space-between" },
      h("strong", {}, part.kind === "phone" ? "Phone call" : "Voice call"),
      opts.onCallBack
        ? h(
            "button",
            {
              type: "button",
              className: "link",
              "data-testid": "call-back",
              onClick: () => opts.onCallBack?.(),
            },
            "Call back",
          )
        : "",
    ),
    h("div", { className: "meta" }, metaBits.join(" · ")),
  );

  if (part.summary?.text) {
    card.append(h("div", { className: "body" }, markdownNodes(part.summary.text)));
  } else if (part.summary?.status === "pending") {
    card.append(h("div", { className: "meta" }, "Writing a summary…"));
  } else if (part.reason) {
    card.append(h("p", {}, part.reason));
  }

  const steps = part.next_steps ?? [];
  if (steps.length) {
    const list = h("div", { className: "call-steps" });
    for (const st of steps) {
      if (!st.text) continue;
      const done = st.status && st.status !== "open" && st.status !== "pending";
      const row = h(
        "div",
        { className: "call-step", "data-testid": "call-step" },
        h("span", {}, st.text),
      );
      if (!done && part.live_call_id && st.id) {
        const callId = part.live_call_id;
        const stepId = st.id;
        const act = async (action: "start" | "dismiss") => {
          try {
            const res = await here.api.unwrap(
              here.api.POST("/v1/voice/live/{id}/steps/{step_id}", {
                params: { path: { id: callId, step_id: stepId } },
                body: { action },
                signal: T(),
              }),
            );
            row.replaceChildren(
              h(
                "span",
                { className: "meta" },
                `${st.text} · ${action === "start" ? "Started" : "Dismissed"}`,
              ),
            );
            if (res.run_id) opts.onStepStarted?.(res.run_id);
          } catch (e) {
            toast(message(e));
          }
        };
        row.append(
          h(
            "div",
            { className: "row", style: "margin-top:4px" },
            h(
              "button",
              {
                type: "button",
                className: "primary",
                "data-testid": "call-step-do",
                onClick: () => void act("start"),
              },
              "Do it",
            ),
            h(
              "button",
              { type: "button", className: "link", onClick: () => void act("dismiss") },
              "Dismiss",
            ),
          ),
        );
      } else if (done) {
        row.append(h("span", { className: "meta" }, ` (${st.status})`));
      }
      list.append(row);
    }
    card.append(list);
  }

  const actions = part.actions ?? [];
  if (actions.length) {
    card.append(
      h(
        "div",
        { className: "meta" },
        `Tools: ${actions
          .map((a) => a.label || a.tool || "")
          .filter(Boolean)
          .join(", ")}`,
      ),
    );
  }

  if (opts.transcript?.length) {
    card.append(
      h(
        "details",
        { className: "call-transcript", "data-testid": "call-transcript" },
        h("summary", {}, `Transcript (${opts.transcript.length})`),
        ...opts.transcript.map((t) =>
          h(
            "div",
            { className: `turn ${t.role}` },
            h("strong", {}, t.role === "user" ? "You: " : `${opts.botName}: `),
            t.text,
          ),
        ),
      ),
    );
  }

  return card;
}

// ---------------------------------------------------------------------------
// Quiet run notices (memory, skill, fallback, checkpoint, notice, canvas, gallery)

export function quietNotice(
  text: string,
  action?: {
    label: string;
    testid?: string;
    onClick: (btn: HTMLButtonElement) => void | Promise<void>;
  },
): HTMLElement {
  const row = h(
    "div",
    { className: "quiet-notice", "data-testid": "quiet-notice" },
    h("span", {}, text),
  );
  if (action) {
    const btn = h(
      "button",
      {
        type: "button",
        className: "link",
        "data-testid": action.testid,
        onClick: () => void action.onClick(btn),
      },
      action.label,
    ) as HTMLButtonElement;
    row.append(" ", btn);
  }
  return row;
}

export function galleryCard(here: Here, part: Record<string, unknown>): HTMLElement {
  const title = String(part.title ?? part.name ?? "Gallery item");
  const desc = String(part.description ?? part.summary ?? "");
  const type = String(part.item_type ?? part.kind ?? "item");
  const id = String(part.item_id ?? part.id ?? "");
  return h(
    "div",
    { className: "item", "data-testid": "gallery-card" },
    h("h3", {}, title),
    desc ? h("p", { className: "meta" }, desc.slice(0, 180)) : "",
    h(
      "a",
      {
        href: appUrl(
          here.account,
          id ? `/gallery/${encodeURIComponent(type)}/${encodeURIComponent(id)}` : "/gallery",
        ),
        target: "_blank",
        rel: "noopener",
      },
      "View in Gallery",
    ),
  );
}

/** Formats run usage cost/tokens as a quiet single line. */
export function formatReplyUsage(u: {
  tokens_in?: number;
  tokens_out?: number;
  cost_usd?: number;
}): string {
  const parts: string[] = [];
  if (typeof u.tokens_in === "number" || typeof u.tokens_out === "number") {
    const total = (u.tokens_in ?? 0) + (u.tokens_out ?? 0);
    if (total > 0) parts.push(`${total.toLocaleString()} tokens`);
  }
  if (typeof u.cost_usd === "number" && u.cost_usd > 0) {
    parts.push(u.cost_usd < 0.01 ? `<$0.01` : `$${u.cost_usd.toFixed(3)}`);
  }
  return parts.join(" · ");
}

/** Computer places available in the workspace (D-483). */
export interface PlaceChoice {
  id: string;
  label: string;
  kind: "auto" | "private" | "team" | "local";
}

export function computerPlacesOf(
  computers: Schemas["Computer"][],
  botId: string | null,
): PlaceChoice[] {
  const choices: PlaceChoice[] = [{ id: "auto", label: "Auto place", kind: "auto" }];
  for (const c of computers) {
    if (c.kind === "private" && botId && c.owner_bot_id !== botId) continue;
    choices.push({
      id: c.id,
      label: c.kind === "local" ? `${c.name} (yours)` : c.name,
      kind: c.kind as "private" | "team" | "local",
    });
  }
  return choices;
}
