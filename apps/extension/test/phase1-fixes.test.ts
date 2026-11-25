/**
 * Regression tests for Phase 1 bug fixes (B1–B26, docs/EXTENSION-PARITY-AND-FIXES-PLAN.md).
 */
import { beforeEach, describe, expect, it, vi } from "vitest";
import { answerText, iconGlyph } from "../src/lib/cards.ts";
import { guardUrl } from "../src/lib/guard.ts";
import { LiveEvents, MicPermissionError } from "../src/lib/live.ts";
import { LiveView, screenshotUrl } from "../src/lib/live-view.ts";
import { handleLocalUiAction, isLocalUiAction } from "../src/lib/local-actions.ts";
import { markdownToHtml } from "../src/lib/md.ts";
import { getSettings, updateSettings } from "../src/lib/settings.ts";
import type { Account } from "../src/lib/store.ts";
import { appUrl, type Here } from "../src/lib/workspace.ts";
import { installFakeChrome } from "./fake-chrome.ts";

const makeAccount = (server: string, extra: Partial<Account> = {}): Account => ({
  id: `${server} u1`,
  server,
  authUrl: `${server}/auth`,
  anonKey: "anon",
  userId: "u1",
  email: "u1@example.test",
  refreshToken: "rt",
  addedAt: "2026-11-22T00:00:00Z",
  ...extra,
});

beforeEach(() => {
  installFakeChrome();
});

describe("B1: local app:* card actions", () => {
  it("recognizes app:* actions and never treats regular actions as local", () => {
    expect(isLocalUiAction("app:connect")).toBe(true);
    expect(isLocalUiAction("app:route")).toBe(true);
    expect(isLocalUiAction("app:invite")).toBe(true);
    expect(isLocalUiAction("app:appearance")).toBe(true);
    expect(isLocalUiAction("submit")).toBe(false);
    expect(isLocalUiAction("draft.send")).toBe(false);
  });

  it("handles app:route, app:connect, app:invite, and app:appearance locally", async () => {
    const opened: string[] = [];
    const copied: string[] = [];
    const toasted: string[] = [];
    const here = {
      account: makeAccount("https://api.casama.ai"),
      org: { id: "org-1", name: "Acme", role: "admin" },
      orgs: [],
      api: {
        GET: vi.fn(async () => ({ data: { url: "https://casama.ai/join/abc" } })),
        unwrap: vi.fn(async (p: Promise<{ data: unknown }>) => (await p).data),
      },
    } as unknown as Here;
    const hooks = {
      openTab: (u: string) => void opened.push(u),
      copyText: async (t: string) => void copied.push(t),
      onToast: (t: string) => void toasted.push(t),
    };

    expect(
      await handleLocalUiAction(
        here,
        {
          surface_id: "s1",
          name: "app:route",
          context: { path: "/settings/models", provider: "openai" },
        },
        hooks,
      ),
    ).toBe(true);
    expect(opened.at(-1)).toBe("https://app.casama.ai/settings/models?provider=openai");

    expect(
      await handleLocalUiAction(
        here,
        { surface_id: "s1", name: "app:connect", context: { app: "gmail" } },
        hooks,
      ),
    ).toBe(true);
    expect(opened.at(-1)).toBe("https://app.casama.ai/settings/integrations?connect=gmail");

    expect(
      await handleLocalUiAction(here, { surface_id: "s1", name: "app:invite", context: {} }, hooks),
    ).toBe(true);
    expect(copied).toEqual(["https://casama.ai/join/abc"]);
    expect(toasted.at(-1)).toBe("Invite link copied.");

    expect(
      await handleLocalUiAction(
        here,
        { surface_id: "s1", name: "app:appearance", context: { theme: "dark" } },
        hooks,
      ),
    ).toBe(true);
    expect((await getSettings()).theme).toBe("dark");
  });
});

describe("B2: headless-compatible LiveView screenshot polling with ETag/304", () => {
  it("builds lightweight jpeg screenshot URL with wake=false", () => {
    expect(screenshotUrl("https://api.casama.ai/", "comp-1", 800, false)).toBe(
      "https://api.casama.ai/v1/computers/comp-1/screenshot?format=jpeg&width=800&wake=false",
    );
  });

  it("polls screenshot directly without stream-session and honors 304 Not Modified", async () => {
    const account = makeAccount("https://api.casama.ai");
    await chrome.storage.local.set({ accounts: [account], activeAccountId: account.id });
    await chrome.storage.session.set({
      tokens: { [account.id]: { token: "tok", expiresAt: Date.now() + 3_600_000 } },
    });
    const requests: { url: string; ifNoneMatch: string | null }[] = [];
    let call = 0;
    const fetchFn = (async (url: string, init?: RequestInit) => {
      const headers = new Headers(init?.headers);
      requests.push({ url: String(url), ifNoneMatch: headers.get("if-none-match") });
      call++;
      if (call === 1) {
        return new Response(new Uint8Array([1, 2, 3]), {
          status: 200,
          headers: { etag: '"e1"', "content-type": "image/jpeg" },
        });
      }
      return new Response(null, { status: 304, headers: { etag: '"e1"' } });
    }) as unknown as typeof fetch;

    const statuses: string[] = [];
    const img = { isConnected: true, src: "" } as unknown as HTMLImageElement;
    const origCreate = URL.createObjectURL;
    const origRevoke = URL.revokeObjectURL;
    URL.createObjectURL = () => "blob:frame1";
    URL.revokeObjectURL = () => {};
    try {
      const lv = new LiveView({
        account,
        computerId: "c-headless",
        img,
        status: (s) => statuses.push(s),
        everyMs: 10,
        fetchFn,
      });
      await lv.start();
      await new Promise((r) => setTimeout(r, 25));
      lv.stop();
    } finally {
      URL.createObjectURL = origCreate;
      URL.revokeObjectURL = origRevoke;
    }

    expect(requests.length).toBeGreaterThanOrEqual(2);
    expect(requests[0]!.url).toContain("/v1/computers/c-headless/screenshot?format=jpeg");
    expect(requests[1]!.ifNoneMatch).toBe('"e1"');
    expect(statuses).toContain("Live");
  });
});

describe("B3: LiveEvents flushAll, stable turn IDs, and MicPermissionError", () => {
  it("flushes buffered user & bot words on hang-up and assigns stable turn ids", () => {
    const ev = new LiveEvents();
    ev.handle(JSON.stringify({ serverContent: { inputTranscription: { text: "Last words" } } }));
    ev.handle(JSON.stringify({ serverContent: { outputTranscription: { text: "Goodbye!" } } }));
    expect(ev.turns).toEqual([]);
    expect(ev.flushAll()).toBe(2);
    expect(ev.turns).toEqual([
      { role: "user", text: "Last words" },
      { role: "assistant", text: "Goodbye!" },
    ]);
    expect(ev.turnsWithIds()).toEqual([
      { id: "t-1", role: "user", text: "Last words" },
      { id: "t-2", role: "assistant", text: "Goodbye!" },
    ]);
    expect(ev.turnsWithIds(1)).toEqual([{ id: "t-2", role: "assistant", text: "Goodbye!" }]);
  });

  it("distinguishes MicPermissionError from generic errors", () => {
    const err = new MicPermissionError("denied");
    expect(err).toBeInstanceOf(MicPermissionError);
    expect(err.name).toBe("MicPermissionError");
  });
});

describe("B14: appUrl for self-hosted & localhost and casama.app guard", () => {
  it("rewrites cloud/dev APIs and preserves self-hosted & localhost origins", () => {
    expect(appUrl(makeAccount("https://api.casama.ai"), "/inbox")).toBe(
      "https://app.casama.ai/inbox",
    );
    expect(appUrl(makeAccount("https://api-dev.casama.ai"), "/inbox")).toBe(
      "https://app-dev.casama.ai/inbox",
    );
    expect(appUrl(makeAccount("http://localhost:8787"), "/inbox")).toBe(
      "http://localhost:8787/inbox",
    );
    expect(appUrl(makeAccount("https://casama.acme.internal/api"), "/inbox")).toBe(
      "https://casama.acme.internal/inbox",
    );
    expect(
      appUrl(
        makeAccount("https://api.acme.internal", { appUrl: "https://chat.acme.internal" }),
        "/x",
      ),
    ).toBe("https://chat.acme.internal/x");
  });

  it("blocks casama.app in the guard", () => {
    expect(guardUrl("https://bot.casama.app/mail")).toBe("casama");
    expect(guardUrl("https://casama.app/")).toBe("casama");
  });
});

describe("B18: markdown nested lists, mixed ul/ol, parenthesized URLs, and code lang", () => {
  it("renders nested lists and separates ul and ol at the same level", () => {
    const nested = markdownToHtml("- outer\n  - inner 1\n  - inner 2\n- outer 2");
    expect(nested).toBe(
      "<ul><li>outer<ul><li>inner 1</li><li>inner 2</li></ul></li><li>outer 2</li></ul>",
    );

    const mixed = markdownToHtml("- bullet\n1. numbered");
    expect(mixed).toBe("<ul><li>bullet</li></ul><ol><li>numbered</li></ol>");
  });

  it("keeps balanced parentheses in markdown and bare URLs (Wikipedia)", () => {
    const md = markdownToHtml("[Rust](https://en.wikipedia.org/wiki/Rust_(programming_language))");
    expect(md).toContain('href="https://en.wikipedia.org/wiki/Rust_(programming_language)"');

    const bare = markdownToHtml("(see https://en.wikipedia.org/wiki/Rust_(programming_language))");
    expect(bare).toContain('href="https://en.wikipedia.org/wiki/Rust_(programming_language)"');
    expect(bare).toContain("</a>)");
  });

  it("preserves code fence language in data-lang while keeping bare fences clean", () => {
    expect(markdownToHtml("```ts\nconst x = 1;\n```")).toBe(
      '<pre data-lang="ts"><code>const x = 1;</code></pre>',
    );
    expect(markdownToHtml("```\nplain\n```")).toBe("<pre><code>plain</code></pre>");
  });
});

describe("B23: cards answerText ownCardEvents, boolean flags, and iconGlyph", () => {
  it("returns button label for ownCardEvents and boolean-only flag payloads", () => {
    expect(answerText("Send email", { to: "a@b.com", body: "hi" }, "draft.send")).toBe(
      "Send email",
    );
    expect(answerText("Skip", { skip: true }, "submit")).toBe("Skip");
    expect(answerText("Choose", { plan: "pro" }, "submit", { pro: "Pro Plan" })).toBe(
      "Choose\nplan: Pro Plan",
    );
  });

  it("maps icon names to glyphs instead of static bullets", () => {
    expect(iconGlyph("check")).toBe("✓");
    expect(iconGlyph("warning")).toBe("⚠");
    expect(iconGlyph("calendar")).toBe("📅");
    expect(iconGlyph("unknown_icon")).toBe("•");
  });
});

describe("B26: theme setting persists system/light/dark", () => {
  it("defaults to system and updates cleanly", async () => {
    expect((await getSettings()).theme).toBe("system");
    await updateSettings((s) => {
      s.theme = "light";
    });
    expect((await getSettings()).theme).toBe("light");
  });
});
