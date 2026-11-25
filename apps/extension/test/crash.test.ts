import { afterEach, beforeEach, describe, expect, it, vi } from "vitest";
import {
  buildPosthogException,
  buildSentryEnvelope,
  chooseReporter,
  normalizeFrameUrl,
  parseDsn,
  parseStackFrames,
  reportCrash,
  resetCrashForTest,
  scrubCrashText,
} from "../src/lib/crash.ts";

const TEST_DSN = "https://abc123def456@o219011.ingest.us.sentry.io/4512413457776640";

describe("extension crash reporting (D-539)", () => {
  const storage: Record<string, unknown> = {};

  beforeEach(() => {
    resetCrashForTest();
    for (const k of Object.keys(storage)) delete storage[k];
    (globalThis as Record<string, unknown>).__CASAMA_SENTRY_DSN__ = TEST_DSN;
    (globalThis as Record<string, unknown>).__CASAMA_POSTHOG_KEY__ = "phc_test_key";
    (globalThis as Record<string, unknown>).__CASAMA_POSTHOG_HOST__ = "https://us.i.posthog.com";
    (globalThis as Record<string, unknown>).__CASAMA_VERSION__ = "0.2.1";
    (globalThis as Record<string, unknown>).__CASAMA_BROWSER__ = "chromium";
    (globalThis as Record<string, unknown>).chrome = {
      storage: {
        local: {
          get: async (keys: string | string[]) => {
            const list = Array.isArray(keys) ? keys : [keys];
            const out: Record<string, unknown> = {};
            for (const k of list) if (k in storage) out[k] = storage[k];
            return out;
          },
          set: async (vals: Record<string, unknown>) => {
            Object.assign(storage, vals);
          },
        },
      },
    };
  });

  afterEach(() => {
    vi.restoreAllMocks();
  });

  it("parses valid Sentry DSNs and rejects malformed ones", () => {
    const parsed = parseDsn(TEST_DSN);
    expect(parsed).toEqual({
      origin: "https://o219011.ingest.us.sentry.io",
      projectId: "4512413457776640",
      publicKey: "abc123def456",
      envelopeUrl:
        "https://o219011.ingest.us.sentry.io/api/4512413457776640/envelope/?sentry_key=abc123def456&sentry_version=7",
    });
    expect(parseDsn("")).toBeNull();
    expect(parseDsn("https://example.com/not-a-project")).toBeNull();
    expect(parseDsn("not-a-url")).toBeNull();
  });

  it("scrubs secrets, emails, query strings, and extension UUIDs", () => {
    const raw =
      "Bearer secret_tok_12345 failed for alice@example.com at moz-extension://1234-5678/assets/panel.js and https://bank.example/login?code=999";
    const cleaned = scrubCrashText(raw);
    expect(cleaned).not.toContain("secret_tok_12345");
    expect(cleaned).not.toContain("alice@example.com");
    expect(cleaned).not.toContain("1234-5678");
    expect(cleaned).not.toContain("code=999");
    expect(cleaned).toContain("app:///assets/panel.js");
  });

  it("normalizes extension frame URLs to app:/// and redacts third-party URLs", () => {
    expect(
      normalizeFrameUrl("chrome-extension://kkfppfhkjnenffibmnkphnbejidkmbkj/background.js?v=1"),
    ).toBe("app:///background.js");
    expect(normalizeFrameUrl("moz-extension://deadbeef-uuid/assets/panel.js")).toBe(
      "app:///assets/panel.js",
    );
    expect(normalizeFrameUrl("https://mail.google.com/mail/u/0/#inbox")).toBe("[redacted-url]");
  });

  it("parses V8 and Firefox stack traces oldest-first", () => {
    const v8 = parseStackFrames(
      "TypeError: boom\n    at inner (chrome-extension://id/assets/panel.js:12:34)\n    at outer (chrome-extension://id/background.js:5:6)",
    );
    expect(v8).toEqual([
      { function: "outer", filename: "app:///background.js", lineno: 5, colno: 6 },
      { function: "inner", filename: "app:///assets/panel.js", lineno: 12, colno: 34 },
    ]);
    const ff = parseStackFrames(
      "inner@moz-extension://uuid/panel.js:10:2\n@moz-extension://uuid/bg.js:1:1",
    );
    expect(ff).toEqual([
      { function: "<anonymous>", filename: "app:///bg.js", lineno: 1, colno: 1 },
      { function: "inner", filename: "app:///panel.js", lineno: 10, colno: 2 },
    ]);
  });

  it("chooses one reporter per D-417", () => {
    expect(chooseReporter({ remote: "none", sentryDsn: TEST_DSN, posthogKey: "phc_x" })).toBe(
      "none",
    );
    expect(chooseReporter({ remote: "posthog", sentryDsn: TEST_DSN, posthogKey: "phc_x" })).toBe(
      "posthog",
    );
    expect(chooseReporter({ remote: "sentry", sentryDsn: TEST_DSN, posthogKey: "phc_x" })).toBe(
      "sentry",
    );
    expect(chooseReporter({ remote: null, sentryDsn: TEST_DSN, posthogKey: "phc_x" })).toBe(
      "sentry",
    );
    expect(chooseReporter({ remote: null, sentryDsn: "", posthogKey: "phc_x" })).toBe("posthog");
    expect(chooseReporter({ remote: null, sentryDsn: "", posthogKey: "" })).toBe("none");
  });

  it("builds valid Sentry envelopes and PostHog exception payloads", () => {
    const env = buildSentryEnvelope({
      name: "TypeError",
      message: "sk-1234567890abcdef failed",
      frames: [{ filename: "app:///background.js", function: "tick", lineno: 4, colno: 2 }],
      handled: false,
      context: "background",
      version: "0.2.1",
      browser: "chromium",
      dsn: TEST_DSN,
    });
    const lines = env.trim().split("\n");
    expect(lines).toHaveLength(3);
    const body = JSON.parse(lines[2]!) as {
      release: string;
      tags: Record<string, string>;
      exception: { values: Array<{ value: string }> };
    };
    expect(body.release).toBe("casama-extension@0.2.1");
    expect(body.tags.surface).toBe("extension");
    expect(body.exception.values[0]?.value).toBe("[redacted] failed");

    const ph = buildPosthogException({
      apiKey: "phc_test",
      name: "Error",
      message: "user@casama.ai broke",
      frames: [],
      handled: true,
      context: "panel",
      version: "0.2.1",
      browser: "firefox",
    });
    expect(ph.event).toBe("$exception");
    expect((ph.properties as Record<string, unknown>).$exception_message).toBe("[redacted] broke");
    expect((ph.properties as Record<string, unknown>).$process_person_profile).toBe(false);
  });

  it("sends to Sentry by default, deduplicates, and honors opt-outs and remote switches", async () => {
    const calls: Array<{ url: string; body: string }> = [];
    const fakeFetch = (async (url: string | URL | Request, init?: RequestInit) => {
      calls.push({ url: String(url), body: String(init?.body ?? "") });
      return new Response("{}", { status: 200 });
    }) as typeof fetch;

    // Sends once, deduplicates identical error
    expect(await reportCrash(new Error("boom"), { context: "panel", fetchImpl: fakeFetch })).toBe(
      true,
    );
    expect(await reportCrash(new Error("boom"), { context: "panel", fetchImpl: fakeFetch })).toBe(
      false,
    );
    expect(calls).toHaveLength(1);
    expect(calls[0]?.url).toContain("/api/4512413457776640/envelope/");

    // Local toggle off blocks sending
    storage.settings = { crashReports: false };
    expect(await reportCrash(new Error("boom2"), { context: "panel", fetchImpl: fakeFetch })).toBe(
      false,
    );
    storage.settings = { crashReports: true };

    // Account analytics_opt_out blocks sending
    storage.crashAccountOptOut = true;
    expect(await reportCrash(new Error("boom3"), { context: "panel", fetchImpl: fakeFetch })).toBe(
      false,
    );
    storage.crashAccountOptOut = false;

    // Remote switch to posthog routes to PostHog /capture/
    storage.remoteConfigs = {
      "https://api.casama.ai": { config: { crash_reporter: { extension: "posthog" } } },
    };
    expect(await reportCrash(new Error("boom4"), { context: "panel", fetchImpl: fakeFetch })).toBe(
      true,
    );
    expect(calls).toHaveLength(2);
    expect(calls[1]?.url).toBe("https://us.i.posthog.com/capture/");

    // Remote switch to none stops sending
    storage.remoteConfigs = {
      "https://api.casama.ai": { config: { crash_reporter: { extension: "none" } } },
    };
    expect(await reportCrash(new Error("boom5"), { context: "panel", fetchImpl: fakeFetch })).toBe(
      false,
    );
  });
});
