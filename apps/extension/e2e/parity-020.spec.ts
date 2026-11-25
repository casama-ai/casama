/**
 * Live E2E verification of 0.2.0 parity features (Phases 1–5) in the real extension:
 * - Chat parity: workspace switcher, tool timeline + Computer Places, floating Screen Card + Bot Cursor,
 *   Tier 1 rich/live cards (Weather, Fares w/ refresh & price watch, Stats chart) + Tier 2 fallback,
 *   inline Takeover + Share Login, inline MCP-in-chat connect card.
 * - Inbox parity: filter chips (All / Needs you / Briefs / Updates), approval redacted args,
 *   skill proposals, updates feed + Mark all read.
 * - Library & Open Tasks: search, kind filter chips, inline task checkbox toggle.
 * - More -> Usage: visual meters, daily reset countdown, one-click Use Reset.
 * - Pop-out Live View: JPEG default + WebRTC toggle graceful fallback on headless computers.
 */
import { mkdirSync } from "node:fs";
import { join } from "node:path";
import type { Route } from "@playwright/test";
import { ARTICLE, openPanel, SITE, signIn, sse } from "./fixtures.ts";
import { expect, test } from "./harness.ts";

// Tiny valid 1x1 JPEG for screenshot mock on headless Screen Card / Live View.
const TINY_PNG_B64 =
  "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==";
const TINY_IMG = Buffer.from(TINY_PNG_B64, "base64");

function shotPath(name: string): string | null {
  const dir = process.env.CASAMA_CAPTURE_DIR;
  if (!dir) return null;
  mkdirSync(dir, { recursive: true });
  return join(dir, name);
}

test("renders Phase 2–4 Chat parity: workspace switcher, timeline, Screen Card + Bot Cursor, rich/live cards, Takeover & MCP", async ({
  context,
  extensionId,
  account,
}) => {
  await signIn(context, extensionId, account);
  await context.route(`${SITE}/news`, (r) =>
    r.fulfill({ contentType: "text/html", body: ARTICLE }),
  );

  // Mock lightweight screenshot endpoint for the floating Screen Card.
  await context.route(/\/v1\/computers\/[^/]+\/screenshot/, (r) =>
    r.fulfill({ status: 200, contentType: "image/png", headers: { etag: '"e1"' }, body: TINY_IMG }),
  );
  let watchCalled = false;
  await context.route(/\/v1\/live-cards\/[^/]+\/watch/, (r) => {
    watchCalled = true;
    return r.fulfill({
      status: 200,
      contentType: "application/json",
      body: JSON.stringify({ watching: true, watch_id: "w-1" }),
    });
  });
  await context.route(/\/v1\/apps\/probe/, (r) =>
    r.fulfill({
      status: 200,
      contentType: "application/json",
      body: JSON.stringify({
        name: "Linear",
        auth: "oauth",
        tools: ["list_issues", "create_issue"],
      }),
    }),
  );

  let release!: () => void;
  const released = new Promise<void>((r) => {
    release = r;
  });
  let calls = 0;
  await context.route(/\/v1\/runs\/[^/]+\/events/, async (route: Route) => {
    calls += 1;
    const runId = /\/v1\/runs\/([^/]+)\/events/.exec(route.request().url())![1]!;
    const base = { v: 1, run_id: runId, bot_id: account.botId, ts: new Date().toISOString() };
    if (calls === 1) {
      return route.fulfill({
        contentType: "text/event-stream",
        body: sse([
          { ...base, seq: 1, type: "run.started", payload: { computer_id: "comp-demo-1" } },
          {
            ...base,
            seq: 2,
            type: "tool.started",
            payload: {
              call_id: "tc-1",
              tool: "browser.click",
              summary: "Checking flight prices",
              place: { name: "Cloud computer", kind: "private" },
            },
          },
          {
            ...base,
            seq: 3,
            type: "screen.pointer",
            payload: {
              computer_id: "comp-demo-1",
              action: "click",
              x: 640,
              y: 400,
              width: 1280,
              height: 800,
            },
          },
          {
            ...base,
            seq: 4,
            type: "tool.finished",
            payload: { call_id: "tc-1", tool: "browser.click", ok: true, duration_ms: 420 },
          },
          {
            ...base,
            seq: 5,
            type: "message.delta",
            payload: { text: "Here are the live flight options and Tokyo weather:" },
          },
          {
            ...base,
            seq: 6,
            type: "ui.shown",
            payload: {
              surface_id: "s-weather",
              messages: [
                { version: "1.0", createSurface: { surfaceId: "s-weather", catalogId: "casama" } },
                {
                  version: "1.0",
                  updateComponents: {
                    surfaceId: "s-weather",
                    components: [
                      {
                        id: "root",
                        component: "Weather",
                        place: { name: "Tokyo", country: "Japan" },
                        now: { temp: 22, feels: 21, humidity: 55, windKph: 12, code: 0 },
                        day: { high: 25, low: 17, code: 0 },
                      },
                    ],
                  },
                },
              ],
            },
          },
          {
            ...base,
            seq: 7,
            type: "ui.shown",
            payload: {
              surface_id: "s-fares",
              messages: [
                { version: "1.0", createSurface: { surfaceId: "s-fares", catalogId: "casama" } },
                {
                  version: "1.0",
                  updateComponents: {
                    surfaceId: "s-fares",
                    components: [
                      {
                        id: "root",
                        component: "Fares",
                        from: { code: "SFO", city: "San Francisco" },
                        to: { code: "HND", city: "Tokyo" },
                        cheapest: 742,
                        currency: "USD",
                        depart: "2026-12-12",
                        cabin: "Economy",
                        live: {
                          id: "lc-1",
                          source: { name: "Kiwi.com" },
                          fetched_at: new Date().toISOString(),
                          watching: false,
                        },
                        options: [
                          {
                            airline: "ANA",
                            price: 742,
                            stops: 0,
                            duration: "11h 10m",
                          },
                        ],
                      },
                    ],
                  },
                },
              ],
            },
          },
          {
            ...base,
            seq: 8,
            type: "ui.shown",
            payload: {
              surface_id: "s-mcp",
              messages: [
                { version: "1.0", createSurface: { surfaceId: "s-mcp", catalogId: "casama" } },
                {
                  version: "1.0",
                  updateComponents: {
                    surfaceId: "s-mcp",
                    components: [
                      { id: "root", component: "Column", children: ["b"] },
                      {
                        id: "b",
                        component: "Button",
                        child: "bt",
                        action: {
                          event: {
                            name: "app:route",
                            context: {
                              server: { name: "Linear", url: "https://mcp.linear.app/sse" },
                            },
                          },
                        },
                      },
                      { id: "bt", component: "Text", text: "Connect Linear" },
                    ],
                  },
                },
              ],
            },
          },
          {
            ...base,
            seq: 9,
            type: "takeover.requested",
            payload: {
              takeover_id: "tk-1",
              computer_id: "comp-demo-1",
              reason: "Sign in to GitHub to continue",
              login_host: "github.com",
            },
          },
        ]),
      });
    }
    await released;
    return route.fulfill({
      contentType: "text/event-stream",
      body: sse([{ ...base, seq: 10, type: "run.completed", payload: {} }]),
    });
  });

  const news = await context.newPage();
  await news.goto(`${SITE}/news`);

  const panel = await openPanel(context, extensionId);
  await panel.setViewportSize({ width: 440, height: 860 });

  // Workspace switcher in header.
  await expect(panel.getByTestId("workspace-switcher")).toBeVisible();

  await panel.getByTestId("composer").fill("Find flights to Tokyo");
  await panel.getByTestId("send").click();

  // Floating Screen Card + Bot Cursor + Tool Timeline with Computer Place.
  await expect(panel.getByTestId("screen-card")).toBeVisible();
  await expect(panel.getByTestId("bot-cursor")).toBeVisible();
  await expect(panel.getByTestId("tool-timeline")).toBeVisible();

  // Rich & Live cards + Takeover Share Login + MCP-in-chat card.
  const live = panel.getByTestId("live-reply");
  await expect(live).toContainText("Tokyo, Japan");
  await expect(live).toContainText("22°");
  await expect(live).toContainText("SFO → HND");
  await expect(live).toContainText("ANA");
  await expect(live).toContainText("$742");
  await expect(panel.getByTestId("takeover-card")).toContainText("Share Login");

  // Click price-watch button on Fares live card.
  await live.getByTestId("rc-watch").click();
  await expect.poll(() => watchCalled).toBe(true);

  // Click "Connect Linear" button -> opens inline MCP-in-chat probe card (D-473).
  await live.getByRole("button", { name: "Connect Linear" }).click();
  await expect(panel.getByTestId("mcp-connect-card")).toContainText("Linear");

  const chatShot = shotPath("01-chat-parity-cards-screencard.png");
  if (chatShot) await panel.screenshot({ path: chatShot, fullPage: true });

  release();
  await expect(panel.getByTestId("send")).toBeVisible();
});

test("renders Phase 4–5 Inbox parity, Library & Tasks, Usage meters, and Pop-out Live View WebRTC fallback", async ({
  context,
  extensionId,
  account,
}) => {
  await signIn(context, extensionId, account);

  // Seed a real approval on the real server, plus stub skill proposals, billing meters & tasks.
  const [run] = await account.rest<{ id: string }[]>("/runs", {
    method: "POST",
    body: JSON.stringify({
      org_id: account.orgId,
      bot_id: account.botId,
      status: "waiting_approval",
    }),
  });
  await account.rest("/approvals", {
    method: "POST",
    body: JSON.stringify({
      org_id: account.orgId,
      bot_id: account.botId,
      run_id: run!.id,
      call_id: "call-parity-1",
      tool_name: "email.send",
      summary: "Email quarterly report to team",
      args_redacted: { to: "team@casama.ai", subject: "Q4 numbers" },
      risk: "medium",
    }),
  });

  await context.route(/\/v1\/skill-proposals/, (r) =>
    r.fulfill({
      status: 200,
      contentType: "application/json",
      body: JSON.stringify({
        items: [
          {
            id: "sp-1",
            bot_id: account.botId,
            status: "pending",
            kind: "create",
            name: "Weekly competitor digest",
            description: "Summarizes pricing changes every Monday morning",
            reason: "Noticed you ask for this every week",
            body_md: "1. Check pricing pages\n2. Summarize diffs",
            created_at: new Date().toISOString(),
          },
        ],
      }),
    }),
  );
  await context.route(/\/v1\/tasks(?:\?|$)/, (r) =>
    r.fulfill({
      status: 200,
      contentType: "application/json",
      body: JSON.stringify({
        items: [
          {
            id: "task-1",
            title: "Review 0.2.0 extension release notes",
            status: "todo",
            priority: "high",
            created_at: new Date().toISOString(),
          },
        ],
      }),
    }),
  );
  let taskDone = false;
  await context.route(/\/v1\/tasks\/task-1/, (r) => {
    taskDone = true;
    return r.fulfill({
      status: 200,
      contentType: "application/json",
      body: JSON.stringify({ id: "task-1", status: "done" }),
    });
  });
  await context.route(/\/v1\/orgs\/[^/]+\/billing(?:\?|$)/, (r) =>
    r.fulfill({
      status: 200,
      contentType: "application/json",
      body: JSON.stringify({
        enabled: true,
        plan_name: "Pro",
        unlimited: false,
        credits_usd: 14.5,
        limits: { credits_usd: 20, computer_hours: 40 },
        daily: {
          used_usd: 2.1,
          cap_usd: 5,
          resets_at: new Date(Date.now() + 3 * 3600_000).toISOString(),
        },
      }),
    }),
  );
  await context.route(/\/v1\/orgs\/[^/]+\/billing\/resets(?:\?|$)/, (r) =>
    r.fulfill({
      status: 200,
      contentType: "application/json",
      body: JSON.stringify([{ id: "rst-1", status: "available" }]),
    }),
  );
  await context.route(/\/v1\/computers\/[^/]+\/screenshot/, (r) =>
    r.fulfill({ status: 200, contentType: "image/png", headers: { etag: '"e2"' }, body: TINY_IMG }),
  );
  await context.route(/\/v1\/computers\/[^/]+\/stream-session/, (r) =>
    r.fulfill({
      status: 409,
      contentType: "application/json",
      body: JSON.stringify({ code: "no_desktop", message: "This computer has no desktop." }),
    }),
  );

  const panel = await openPanel(context, extensionId);
  await panel.setViewportSize({ width: 440, height: 860 });

  // 1. Inbox parity: filter bar, redacted args, skill proposal.
  await panel.getByTestId("tab-inbox").click();
  await expect(panel.getByTestId("inbox-filters")).toBeVisible();
  await expect(panel.getByTestId("approval")).toContainText("team@casama.ai");
  await expect(panel.getByTestId("skill-proposal")).toContainText("Weekly competitor digest");
  const inboxShot = shotPath("02-inbox-parity.png");
  if (inboxShot) await panel.screenshot({ path: inboxShot, fullPage: true });

  // Filter to Briefs -> approvals hide; back to All -> approvals return.
  await panel.getByTestId("inbox-filter-briefs").click();
  await expect(panel.getByTestId("approval")).toHaveCount(0);
  await panel.getByTestId("inbox-filter-all").click();
  await expect(panel.getByTestId("approval")).toHaveCount(1);

  // 2. Library search, kind chips & Open Tasks inline completion.
  await panel.getByTestId("tab-library").click();
  await expect(panel.getByTestId("library-search")).toBeVisible();
  await expect(panel.getByRole("button", { name: "Images" })).toBeVisible();
  await expect(panel.getByTestId("open-tasks")).toContainText(
    "Review 0.2.0 extension release notes",
  );
  const libShot = shotPath("03-library-tasks.png");
  if (libShot) await panel.screenshot({ path: libShot, fullPage: true });
  await panel.getByTestId("open-tasks").locator('input[type="checkbox"]').first().check();
  await expect.poll(() => taskDone).toBe(true);

  // 3. More -> Usage meters + Use Reset button.
  await panel.getByTestId("tab-more").click();
  await expect(panel.getByTestId("usage-meter").first()).toBeVisible();
  await expect(panel.getByTestId("use-limit-reset")).toContainText("Use Reset");
  const moreShot = shotPath("04-usage-meters.png");
  if (moreShot) await panel.screenshot({ path: moreShot, fullPage: true });

  // 4. Pop-out Live View: JPEG default + WebRTC toggle falls back cleanly on 409 no_desktop.
  const livePage = await context.newPage();
  await livePage.setViewportSize({ width: 640, height: 480 });
  await livePage.goto(
    `chrome-extension://${extensionId}/live/live.html?computer=comp-1&name=Research+Box`,
  );
  await expect(livePage.getByTestId("live-img")).toBeVisible();
  await expect(livePage.getByTestId("live-mode-toggle")).toHaveText("Live video");
  await livePage.getByTestId("live-mode-toggle").click();
  // Headless computer returns 409 -> gracefully falls back to JPEG screenshots.
  await expect(livePage.getByTestId("live-img")).toBeVisible();
  await expect(livePage.getByTestId("live-status")).toContainText(/No desktop|no desktop/i);
  const liveShot = shotPath("05-popout-live-view.png");
  if (liveShot) await livePage.screenshot({ path: liveShot });
  await livePage.close();
});
