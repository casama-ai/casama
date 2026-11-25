import { afterEach, beforeEach, describe, expect, it, vi } from "vitest";
import { resetAnalyticsForTest, trackFeature, trackTab } from "../src/lib/analytics.ts";
import type { Account } from "../src/lib/store.ts";

vi.mock("../src/lib/session.ts", () => ({
  accessToken: vi.fn(async () => "tok-1"),
}));

const cloudAccount: Account = {
  id: "acc-1",
  userId: "u-1",
  email: "user@example.com",
  server: "https://api.casama.ai",
  authUrl: "https://auth.casama.ai",
  anonKey: "anon",
  refreshToken: "ref",
  orgId: "org-1",
  addedAt: "2026-11-24T00:00:00Z",
};

const selfHostAccount: Account = {
  ...cloudAccount,
  id: "acc-2",
  server: "https://my-casama.example.com",
};

describe("extension analytics relay (D-533)", () => {
  const realFetch = globalThis.fetch;
  let calls: Array<{ url: string; body: Record<string, unknown> }> = [];

  beforeEach(() => {
    resetAnalyticsForTest();
    calls = [];
    globalThis.fetch = (async (url: string | URL, init?: RequestInit) => {
      calls.push({ url: String(url), body: JSON.parse(String(init?.body ?? "{}")) });
      return new Response(null, { status: 204 });
    }) as typeof fetch;
  });

  afterEach(() => {
    globalThis.fetch = realFetch;
  });

  it("relays feature_used once per day and tab screen_view once per session on Casama Cloud", async () => {
    trackFeature(cloudAccount, "extension_panel");
    trackFeature(cloudAccount, "extension_panel");
    trackTab(cloudAccount, "chat");
    trackTab(cloudAccount, "chat");
    trackTab(cloudAccount, "library");
    await new Promise((r) => setTimeout(r, 10));

    expect(calls).toHaveLength(3);
    expect(calls[0]).toEqual({
      url: "https://api.casama.ai/v1/analytics/events",
      body: {
        platform: "extension",
        events: [{ name: "feature_used", properties: { feature: "extension_panel" } }],
      },
    });
    expect(calls[1]?.body).toEqual({
      platform: "extension",
      events: [{ name: "screen_view", properties: { screen: "/extension/chat" } }],
    });
    expect(calls[2]?.body).toEqual({
      platform: "extension",
      events: [{ name: "screen_view", properties: { screen: "/extension/library" } }],
    });
  });

  it("never sends anything for self-hosted servers", async () => {
    trackFeature(selfHostAccount, "extension_capture");
    trackTab(selfHostAccount, "more");
    await new Promise((r) => setTimeout(r, 10));
    expect(calls).toHaveLength(0);
  });
});
