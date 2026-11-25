/**
 * Unit tests for Phase 5:
 * - Cross-origin iframe (OOPIF) flattened CDP tracking and site-policy filtering.
 * - Optional WebRTC pop-out Live View with automatic fallback to JPEG screenshots.
 * - Zero new manifest permissions in 0.2.0.
 */
import { afterEach, describe, expect, it, vi } from "vitest";
import {
  attach,
  childFramesOf,
  detach,
  frameUrlOf,
  installCdp,
  send,
} from "../src/background/act/cdp.ts";
import { LiveWebRtc } from "../src/lib/live-webrtc.ts";
import { buildManifest } from "../src/manifest.ts";

describe("Phase 5: OOPIF child-frame tracking in CDP", () => {
  afterEach(() => {
    vi.restoreAllMocks();
  });

  it("tracks attached cross-origin iframes, updates their URL, routes sessionId, and cleans up on detach", async () => {
    const sent: Array<{ target: unknown; method: string; params: unknown }> = [];
    const hooks: {
      onEvent?: (source: { tabId?: number }, method: string, params?: unknown) => void;
      onDetach?: (source: { tabId?: number }, reason: string) => void;
    } = {};

    (globalThis as Record<string, unknown>).chrome = {
      debugger: {
        attach: vi.fn().mockResolvedValue(undefined),
        detach: vi.fn().mockResolvedValue(undefined),
        getTargets: vi.fn().mockResolvedValue([]),
        sendCommand: vi.fn().mockImplementation(async (target, method, params) => {
          sent.push({ target, method, params });
          return {};
        }),
        onEvent: {
          addListener: (fn: NonNullable<typeof hooks.onEvent>) => {
            hooks.onEvent = fn;
          },
        },
        onDetach: {
          addListener: (fn: NonNullable<typeof hooks.onDetach>) => {
            hooks.onDetach = fn;
          },
        },
      },
    };

    installCdp();
    await attach(42);
    expect(sent.some((c) => c.method === "Target.setAutoAttach")).toBe(true);

    // Simulate Chrome attaching a cross-origin iframe target.
    hooks.onEvent?.({ tabId: 42 }, "Target.attachedToTarget", {
      sessionId: "sess-1",
      targetInfo: {
        type: "iframe",
        targetId: "tgt-1",
        url: "https://embed.example.com/app",
        title: "Embed",
      },
    });
    // Non-iframe targets (e.g., service workers) are ignored.
    hooks.onEvent?.({ tabId: 42 }, "Target.attachedToTarget", {
      sessionId: "sess-sw",
      targetInfo: {
        type: "service_worker",
        targetId: "tgt-sw",
        url: "https://embed.example.com/sw.js",
      },
    });

    expect(childFramesOf(42)).toEqual([
      {
        sessionId: "sess-1",
        targetId: "tgt-1",
        url: "https://embed.example.com/app",
        title: "Embed",
      },
    ]);
    expect(frameUrlOf(42, "sess-1")).toBe("https://embed.example.com/app");

    // Simulate iframe navigation updating its URL.
    hooks.onEvent?.({ tabId: 42 }, "Target.targetInfoChanged", {
      targetInfo: { targetId: "tgt-1", url: "https://js.stripe.com/v3/elements" },
    });
    expect(frameUrlOf(42, "sess-1")).toBe("https://js.stripe.com/v3/elements");

    // Sending a command with sessionId passes `{ tabId, sessionId }`.
    await send(42, "Accessibility.getFullAXTree", {}, 5000, "sess-1");
    expect(sent.at(-1)?.target).toEqual({ tabId: 42, sessionId: "sess-1" });

    // Detaching target removes it cleanly.
    hooks.onEvent?.({ tabId: 42 }, "Target.detachedFromTarget", { sessionId: "sess-1" });
    expect(childFramesOf(42)).toEqual([]);

    await detach(42);
  });
});

describe("Phase 5: Optional WebRTC Live View fallback", () => {
  it("falls back cleanly to JPEG screenshots when stream-session returns 409 no_desktop", async () => {
    const statuses: string[] = [];
    const fallbacks: string[] = [];
    const fakeApi = {
      POST: vi.fn(),
      unwrap: vi.fn().mockRejectedValue(new Error("This computer has no desktop.")),
    } as never;
    const video = {
      srcObject: null,
      play: vi.fn().mockResolvedValue(undefined),
    } as unknown as HTMLVideoElement;

    const rtc = new LiveWebRtc({
      api: fakeApi,
      computerId: "comp-1",
      video,
      status: (t) => statuses.push(t),
      onFallback: (r) => fallbacks.push(r),
    });
    await rtc.start();

    expect(statuses[0]).toBe("Starting live video…");
    expect(fallbacks).toEqual(["This computer has no desktop."]);
  });

  it("keeps zero new manifest permissions in 0.2.0", () => {
    const store = buildManifest("store", "0.2.0", "chromium");
    const firefox = buildManifest("store", "0.2.0", "firefox");
    expect(store.version).toBe("0.2.0");
    expect(firefox.version).toBe("0.2.0");
    expect(store.host_permissions).toBeUndefined();
    expect(firefox.host_permissions).toBeUndefined();
    expect(store.permissions).toHaveLength(14);
  });
});
