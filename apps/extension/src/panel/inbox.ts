/**
 * The Inbox tab (D2, Phase 4 parity):
 * - Filter chips: All / Needs you / Briefs / Updates
 * - Approvals (with redacted args + computer place preview, Approve/Deny/Always allow)
 * - Takeovers (+ Share Login straight to Vault, D-482)
 * - Secret requests (protected field straight to Vault)
 * - Skill proposals (Approve / Dismiss)
 * - Suggestions (with expiry + "Don't suggest again")
 * - Updates feed (notifications with Mark read / Mark all read)
 * - Running jobs with Stop & Watch
 * - Today's brief (D9)
 */
import type { Schemas } from "@casama/client";
import { updateBadge } from "../lib/alerts.ts";
import { h } from "../lib/dom.ts";
import { botAvatar, emptyState } from "../lib/look.ts";
import { markdownNodes } from "../lib/md.ts";
import { appUrl, type Here, rest } from "../lib/workspace.ts";
import { takeoverCard } from "./chat-widgets.ts";
import { ago, errorBox, message, T, toast } from "./shared.ts";

interface Suggestion {
  id: string;
  bot_id: string;
  title: string;
  body_md: string;
  created_at: string;
  expires_at?: string | null;
}
interface RunRow {
  id: string;
  bot_id: string;
  trigger: string;
  status: string;
  created_at: string;
}
interface NotificationRow {
  id: string;
  kind: string;
  payload: { title?: string; body?: string; link?: string; bot_id?: string } | null;
  read_at: string | null;
  created_at: string;
}

export type InboxFilter = "all" | "needs" | "briefs" | "updates";

export class InboxView {
  readonly el = h("section", { className: "view", "data-testid": "inbox" });
  private here: Here;
  private botNames = new Map<string, string>();
  private botAvatars = new Map<string, string | null>();
  private filter: InboxFilter = "all";
  private lastData: {
    approvals: Schemas["Approval"][];
    secrets: Schemas["BotSecretRequest"][];
    takeovers: Schemas["TakeoverRequest"][];
    proposals: Schemas["SkillProposal"][];
    suggestions: Suggestion[];
    runs: RunRow[];
    briefs: Schemas["ForYouBrief"][];
    updates: NotificationRow[];
  } | null = null;
  onCount: (n: number) => void = () => {};

  constructor(here: Here) {
    this.here = here;
  }

  private loads = 0;

  async load() {
    const { api, org, account } = this.here;
    const mine = ++this.loads;
    if (!this.el.childElementCount)
      this.el.replaceChildren(h("p", { className: "empty" }, "Loading…"));
    try {
      const [bots, approvals, secrets, takeovers, proposals, suggestions, runs, feed, updates] =
        await Promise.all([
          api.unwrap(api.GET("/v1/bots", { params: { query: { org_id: org.id } }, signal: T() })),
          api.unwrap(
            api.GET("/v1/approvals", {
              params: { query: { org_id: org.id, status: "pending" } },
              signal: T(),
            }),
          ),
          api.unwrap(
            api.GET("/v1/secrets/requests", { params: { query: { org_id: org.id } }, signal: T() }),
          ),
          api
            .unwrap(
              api.GET("/v1/takeovers", { params: { query: { org_id: org.id } }, signal: T() }),
            )
            .then((r) => r.items)
            .catch(() => [] as Schemas["TakeoverRequest"][]),
          api
            .unwrap(
              api.GET("/v1/skill-proposals", {
                params: { query: { org_id: org.id } },
                signal: T(),
              }),
            )
            .then((r) => r.items)
            .catch(() => [] as Schemas["SkillProposal"][]),
          rest(
            account,
            `suggestions?org_id=eq.${org.id}&status=eq.pending&order=created_at.desc&limit=20&select=id,bot_id,title,body_md,created_at,expires_at`,
          )
            .then((r) => r.json() as Promise<Suggestion[]>)
            .catch(() => [] as Suggestion[]),
          rest(
            account,
            `runs?org_id=eq.${org.id}&status=in.(queued,running)&order=created_at.desc&limit=10&select=id,bot_id,trigger,status,created_at`,
          )
            .then((r) => r.json() as Promise<RunRow[]>)
            .catch(() => [] as RunRow[]),
          api
            .unwrap(api.GET("/v1/for-you", { params: { query: { org_id: org.id } }, signal: T() }))
            .catch(() => null),
          rest(
            account,
            `notifications?user_id=eq.${account.userId}&org_id=eq.${org.id}&order=created_at.desc&limit=25&select=id,kind,payload,read_at,created_at`,
          )
            .then((r) => r.json() as Promise<NotificationRow[]>)
            .catch(() => [] as NotificationRow[]),
        ]);
      if (mine !== this.loads) return;
      for (const b of bots.items) {
        this.botNames.set(b.id, b.name);
        this.botAvatars.set(b.id, b.avatar_url);
      }
      const pendingSecrets = secrets.items.filter((s) => s.status === "pending");
      const pendingTakeovers = takeovers.filter((t) => t.status === "pending");
      const pendingProposals = proposals.filter((p) => p.status === "pending");
      const unreadUpdates = updates.filter((u) => !u.read_at);
      this.onCount(
        approvals.items.length +
          pendingSecrets.length +
          pendingTakeovers.length +
          pendingProposals.length +
          unreadUpdates.length,
      );
      this.lastData = {
        approvals: approvals.items,
        secrets: pendingSecrets,
        takeovers: pendingTakeovers,
        proposals: pendingProposals,
        suggestions,
        runs,
        briefs: feed?.briefs ?? [],
        updates,
      };
      this.render();
    } catch (e) {
      if (mine === this.loads) this.el.replaceChildren(errorBox(e, () => void this.load()));
    }
  }

  private render() {
    const d = this.lastData;
    if (!d) return;
    const filters: Array<{ id: InboxFilter; label: string }> = [
      { id: "all", label: "All" },
      { id: "needs", label: "Needs you" },
      { id: "briefs", label: "Briefs" },
      { id: "updates", label: "Updates" },
    ];
    const bar = h(
      "div",
      { className: "chips filter-bar", "data-testid": "inbox-filters" },
      ...filters.map((f) =>
        h(
          "button",
          {
            type: "button",
            className: "chip",
            "aria-pressed": String(this.filter === f.id),
            "data-testid": `inbox-filter-${f.id}`,
            onClick: () => {
              this.filter = f.id;
              this.render();
            },
          },
          f.label,
        ),
      ),
    );

    const sections: Node[] = [];
    const show = (bucket: InboxFilter) => this.filter === "all" || this.filter === bucket;

    if (show("briefs")) {
      const today = new Date().toDateString();
      const briefs =
        this.filter === "briefs"
          ? [...d.briefs].sort((a, b) => b.created_at.localeCompare(a.created_at))
          : d.briefs
              .filter((b) => new Date(b.created_at).toDateString() === today)
              .sort((a, b) => b.created_at.localeCompare(a.created_at))
              .slice(0, 1);
      if (briefs.length) {
        if (this.filter === "briefs")
          sections.push(h("div", { className: "section-title" }, "Briefs"));
        sections.push(...briefs.map((b) => this.brief(b)));
      }
    }

    if (show("needs")) {
      if (d.approvals.length)
        sections.push(
          h("div", { className: "section-title" }, "Approvals"),
          ...d.approvals.map((a) => this.approval(a)),
        );
      if (d.takeovers.length)
        sections.push(
          h("div", { className: "section-title" }, "Needs you on screen"),
          ...d.takeovers.map(
            (t) =>
              takeoverCard(
                this.here,
                {
                  id: t.id,
                  computer_id: t.computer_id,
                  reason: t.reason,
                  login_host: t.login_host,
                  botName: this.name(t.bot_id),
                  createdAt: t.created_at,
                },
                { onResolved: () => void updateBadge().catch(() => {}) },
              ).el,
          ),
        );
      if (d.secrets.length)
        sections.push(
          h("div", { className: "section-title" }, "Asked for"),
          ...d.secrets.map((s) => this.secret(s)),
        );
      if (d.proposals.length)
        sections.push(
          h("div", { className: "section-title" }, "Skill proposals"),
          ...d.proposals.map((p) => this.skillProposal(p)),
        );
      if (d.suggestions.length)
        sections.push(
          h("div", { className: "section-title" }, "Suggestions"),
          ...d.suggestions.map((s) => this.suggestion(s)),
        );
      if (d.runs.length)
        sections.push(
          h("div", { className: "section-title" }, "Working now"),
          ...d.runs.map((r) => this.run(r)),
        );
    }

    if (show("updates") && d.updates.length) {
      const unread = d.updates.filter((u) => !u.read_at);
      sections.push(
        h(
          "div",
          { className: "section-title section-row" },
          h("span", {}, "Updates"),
          unread.length
            ? h(
                "button",
                {
                  type: "button",
                  className: "link",
                  "data-testid": "mark-all-read",
                  onClick: () => void this.markAllRead(unread),
                },
                "Mark all read",
              )
            : "",
        ),
        ...d.updates.slice(0, 20).map((u) => this.updateRow(u)),
      );
    }

    this.el.replaceChildren(
      bar,
      ...(sections.length
        ? sections
        : [
            emptyState({
              mascot: "starry",
              badge: "check",
              testid: "inbox-empty",
              message:
                this.filter === "all"
                  ? "Nothing needs you right now."
                  : `Nothing in ${filters.find((f) => f.id === this.filter)?.label ?? "this view"}.`,
            }),
          ]),
    );
  }

  /** D9: today's brief, as the bot wrote it, with a link to its conversation. */
  private brief(b: Schemas["ForYouBrief"]) {
    const long = b.text.length > 1500;
    return h(
      "div",
      { className: "item brief", "data-testid": "brief" },
      this.head(b.bot_id, "Today's brief", `${this.name(b.bot_id)} · ${ago(b.created_at)}`),
      h("div", { className: "body" }, markdownNodes(long ? `${b.text.slice(0, 1500)}…` : b.text)),
      h(
        "a",
        {
          href: appUrl(this.here.account, `/bots/${b.bot_id}/chat?c=${b.conversation_id}`),
          target: "_blank",
          rel: "noopener",
        },
        long ? "Read it all in Casama" : "Open in Casama",
      ),
    );
  }

  private name(botId: string | null | undefined) {
    return (botId && this.botNames.get(botId)) || "A bot";
  }

  /** A card's top: the bot's avatar beside the title and its line, as the app's Inbox cards. */
  private head(botId: string | null | undefined, title: string, meta: string) {
    return h(
      "div",
      { className: "item-head" },
      botAvatar(this.name(botId), botId ? this.botAvatars.get(botId) : null, 36),
      h("div", {}, h("h3", {}, title), h("div", { className: "meta" }, meta)),
    );
  }

  private approval(a: Schemas["Approval"]) {
    const args = (a.args_redacted ?? {}) as Record<string, unknown>;
    const argPairs = Object.entries(args)
      .filter(([, v]) => v !== undefined && v !== null && v !== "")
      .slice(0, 4);
    const place = (a as { place?: { name?: string; kind?: string } }).place;
    const placeNote = place?.name ? ` · on ${place.name}` : "";
    const card = h(
      "div",
      { className: "item", "data-testid": "approval" },
      this.head(
        a.bot_id,
        a.summary || a.tool_name,
        `${this.name(a.bot_id)} · ${a.risk} risk${placeNote} · ${ago(a.created_at)}`,
      ),
      argPairs.length
        ? h(
            "dl",
            { className: "rc-kv", style: "margin-top:6px" },
            ...argPairs.flatMap(([k, v]) => [
              h("dt", {}, k),
              h("dd", {}, typeof v === "string" ? v.slice(0, 90) : JSON.stringify(v).slice(0, 90)),
            ]),
          )
        : "",
    );
    const decide = async (decision: "approved" | "denied", alwaysAllow = false) => {
      try {
        await this.here.api.decideApproval(a.id, decision, { alwaysAllow });
        card.replaceChildren(
          h("div", { className: "meta" }, decision === "approved" ? "Approved" : "Denied"),
        );
        void updateBadge().catch(() => {});
      } catch (e) {
        card.append(errorBox(e));
      }
    };
    card.append(
      h(
        "div",
        { className: "row" },
        h(
          "button",
          {
            className: "primary",
            "data-testid": "approve",
            onClick: () => void decide("approved"),
          },
          "Approve",
        ),
        h("button", { "data-testid": "deny", onClick: () => void decide("denied") }, "Deny"),
        a.risk !== "high"
          ? h(
              "button",
              { className: "link", onClick: () => void decide("approved", true) },
              "Always allow",
            )
          : "",
      ),
    );
    return card;
  }

  private skillProposal(p: Schemas["SkillProposal"]) {
    const card = h(
      "div",
      { className: "item", "data-testid": "skill-proposal" },
      this.head(
        p.bot_id,
        `${p.kind === "edit" ? "Update skill" : "New skill"}: ${p.name}`,
        `${this.name(p.bot_id)} · ${ago(p.created_at)}`,
      ),
      p.description ? h("p", {}, p.description) : "",
      p.reason ? h("div", { className: "meta" }, p.reason) : "",
      p.body_md
        ? h(
            "details",
            { style: "margin-top:6px" },
            h("summary", { className: "meta" }, "Preview instructions"),
            h("pre", { className: "tl-out", style: "margin-left:0" }, p.body_md.slice(0, 800)),
          )
        : "",
    );
    const decide = async (accept: boolean) => {
      try {
        if (accept) {
          await this.here.api.unwrap(
            this.here.api.POST("/v1/skill-proposals/{id}/accept", {
              params: { path: { id: p.id } },
              body: {},
              signal: T(),
            }),
          );
        } else {
          await this.here.api.unwrap(
            this.here.api.POST("/v1/skill-proposals/{id}/dismiss", {
              params: { path: { id: p.id } },
              signal: T(),
            }),
          );
        }
        card.replaceChildren(
          h("div", { className: "meta" }, accept ? `Saved skill "${p.name}".` : "Dismissed."),
        );
        void updateBadge().catch(() => {});
      } catch (e) {
        toast(message(e));
      }
    };
    card.append(
      h(
        "div",
        { className: "row" },
        h(
          "button",
          {
            className: "primary",
            "data-testid": "proposal-approve",
            onClick: () => void decide(true),
          },
          "Approve",
        ),
        h(
          "button",
          { "data-testid": "proposal-dismiss", onClick: () => void decide(false) },
          "Dismiss",
        ),
      ),
    );
    return card;
  }

  /** The value goes straight to the server's Vault; it never reaches the bot or this page again. */
  private secret(s: Schemas["BotSecretRequest"]) {
    const input = h("input", {
      type: "password",
      autocomplete: "off",
      placeholder: s.kind === "totp" ? "Setup key" : "Value",
      "aria-label": s.name,
    }) as HTMLInputElement;
    const card = h(
      "form",
      { className: "item", "data-testid": "secret" },
      this.head(
        s.bot_id,
        `${this.name(s.bot_id)} asks for ${s.name}`,
        `${s.service} · ${s.reason}`,
      ),
      input,
      h(
        "div",
        { className: "row" },
        h("button", { className: "primary", type: "submit" }, "Send to the server"),
        h("button", { type: "button", onClick: () => void decline() }, "Decline"),
      ),
    );
    const decline = async () => {
      try {
        await this.here.api.unwrap(
          this.here.api.POST("/v1/secrets/requests/{id}/decline", {
            params: { path: { id: s.id } },
            signal: T(),
          }),
        );
        card.replaceChildren(h("div", { className: "meta" }, "Declined"));
        void updateBadge().catch(() => {});
      } catch (e) {
        card.append(errorBox(e));
      }
    };
    card.addEventListener("submit", async (ev) => {
      ev.preventDefault();
      if (!input.value) return;
      try {
        await this.here.api.unwrap(
          this.here.api.POST("/v1/secrets/requests/{id}/fulfill", {
            params: { path: { id: s.id } },
            body: { value: input.value },
            signal: T(),
          }),
        );
        input.value = "";
        card.replaceChildren(h("div", { className: "meta" }, "Sent. The bot can use it now."));
        void updateBadge().catch(() => {});
      } catch (e) {
        card.append(errorBox(e));
      }
    });
    return card;
  }

  private suggestion(s: Suggestion) {
    const exp = s.expires_at ? ` · expires ${new Date(s.expires_at).toLocaleDateString()}` : "";
    const card = h(
      "div",
      { className: "item", "data-testid": "suggestion" },
      this.head(s.bot_id, s.title, `${this.name(s.bot_id)} · ${ago(s.created_at)}${exp}`),
      s.body_md ? h("p", {}, s.body_md.slice(0, 280)) : "",
    );
    const act = async (what: "accept" | "dismiss", neverAgain = false) => {
      try {
        if (what === "accept")
          await this.here.api.unwrap(
            this.here.api.POST("/v1/suggestions/{id}/accept", {
              params: { path: { id: s.id } },
              signal: T(),
            }),
          );
        else
          await this.here.api.unwrap(
            this.here.api.POST("/v1/suggestions/{id}/dismiss", {
              params: { path: { id: s.id } },
              body: { dont_suggest_again: neverAgain },
              signal: T(),
            }),
          );
        card.replaceChildren(
          h(
            "div",
            { className: "meta" },
            what === "accept" ? "On it" : neverAgain ? "Won't suggest again" : "Dismissed",
          ),
        );
      } catch (e) {
        toast(message(e));
      }
    };
    card.append(
      h(
        "div",
        { className: "row" },
        h("button", { className: "primary", onClick: () => void act("accept") }, "Do it"),
        h("button", { onClick: () => void act("dismiss", false) }, "Not now"),
        h(
          "button",
          {
            className: "link",
            "data-testid": "suggestion-never",
            onClick: () => void act("dismiss", true),
          },
          "Don't suggest again",
        ),
      ),
    );
    return card;
  }

  private updateRow(u: NotificationRow) {
    const title = u.payload?.title || u.kind.replace(/_/g, " ");
    const body = u.payload?.body || "";
    const link = u.payload?.link;
    const card = h(
      "div",
      { className: `item update-item${u.read_at ? "" : " unread"}`, "data-testid": "update-item" },
      h(
        "div",
        { className: "rc-head" },
        h("strong", {}, title),
        h("span", { className: "meta" }, ago(u.created_at)),
      ),
      body ? h("p", { className: "meta" }, body.slice(0, 220)) : "",
      h(
        "div",
        { className: "row" },
        link
          ? h(
              "a",
              { href: appUrl(this.here.account, link), target: "_blank", rel: "noopener" },
              "Open",
            )
          : "",
        !u.read_at
          ? h(
              "button",
              {
                type: "button",
                className: "link",
                "data-testid": "mark-read",
                onClick: async () => {
                  try {
                    await rest(this.here.account, `notifications?id=eq.${u.id}`, {
                      method: "PATCH",
                      headers: { prefer: "return=minimal" },
                      body: JSON.stringify({ read_at: new Date().toISOString() }),
                    });
                    u.read_at = new Date().toISOString();
                    this.render();
                    void updateBadge().catch(() => {});
                  } catch (e) {
                    toast(message(e));
                  }
                },
              },
              "Mark read",
            )
          : "",
      ),
    );
    return card;
  }

  private async markAllRead(unread: NotificationRow[]) {
    try {
      const now = new Date().toISOString();
      await rest(
        this.here.account,
        `notifications?user_id=eq.${this.here.account.userId}&org_id=eq.${this.here.org.id}&read_at=is.null`,
        {
          method: "PATCH",
          headers: { prefer: "return=minimal" },
          body: JSON.stringify({ read_at: now }),
        },
      );
      for (const u of unread) u.read_at = now;
      this.render();
      void updateBadge().catch(() => {});
    } catch (e) {
      toast(message(e));
    }
  }

  private run(r: RunRow) {
    const card = h(
      "div",
      { className: "item", "data-testid": "running" },
      this.head(
        r.bot_id,
        `${this.name(r.bot_id)} is working`,
        `${r.trigger} · started ${ago(r.created_at)}`,
      ),
    );
    card.append(
      h(
        "div",
        { className: "row" },
        h(
          "button",
          {
            onClick: async () => {
              try {
                await this.here.api.cancelRun(r.id);
                card.replaceChildren(h("div", { className: "meta" }, "Stopped"));
              } catch (e) {
                toast(message(e));
              }
            },
          },
          "Stop",
        ),
        h(
          "a",
          {
            href: appUrl(this.here.account, `/bots/${r.bot_id}/runs/${r.id}`),
            target: "_blank",
            rel: "noopener",
          },
          "Watch",
        ),
      ),
    );
    return card;
  }
}
