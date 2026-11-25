/**
 * Lightweight, privacy-safe GA4 product analytics for the browser extension (D-533).
 *
 * Relays catalog-typed events (`feature_used` once per feature per UTC day, plus `screen_view`
 * for side-panel tabs) through `POST /v1/analytics/events` with `platform: "extension"`.
 * Only runs on Casama Cloud (`api.casama.ai`); the server enforces `analytics_opt_out`, and no
 * page URLs, titles, or text ever leave the browser.
 */
import { accessToken } from "./session.ts";
import type { Account } from "./store.ts";

export type ExtensionFeature = "extension_panel" | "extension_chat" | "extension_capture";

const CLOUD_HOSTS = new Set(["api.casama.ai"]);
const seenDaily = new Set<string>();
const seenTabs = new Set<string>();

function isCloudServer(server: string): boolean {
  try {
    return CLOUD_HOSTS.has(new URL(server).hostname.toLowerCase());
  } catch {
    return false;
  }
}

async function sendEvents(
  account: Account,
  events: Array<{ name: string; properties?: Record<string, string | number | boolean> }>,
): Promise<void> {
  if (!events.length || !isCloudServer(account.server)) return;
  try {
    const token = await accessToken(account.id);
    if (!token) return;
    await fetch(`${account.server.replace(/\/$/, "")}/v1/analytics/events`, {
      method: "POST",
      headers: {
        authorization: `Bearer ${token}`,
        "content-type": "application/json",
      },
      body: JSON.stringify({ platform: "extension", events }),
    });
  } catch {
    // Analytics must never interrupt the extension.
  }
}

/** Emits `feature_used` at most once per feature per UTC day in this panel session. */
export function trackFeature(account: Account, feature: ExtensionFeature): void {
  const day = new Date().toISOString().slice(0, 10);
  const key = `${account.id}|${feature}|${day}`;
  if (seenDaily.has(key)) return;
  seenDaily.add(key);
  void sendEvents(account, [{ name: "feature_used", properties: { feature } }]);
}

/** Emits one `screen_view` per panel tab per session (route template only, never page URLs). */
export function trackTab(account: Account, tab: "chat" | "inbox" | "library" | "more"): void {
  const key = `${account.id}|${tab}`;
  if (seenTabs.has(key)) return;
  seenTabs.add(key);
  void sendEvents(account, [{ name: "screen_view", properties: { screen: `/extension/${tab}` } }]);
}

/** Tests only: clear dedupe caches. */
export function resetAnalyticsForTest(): void {
  seenDaily.clear();
  seenTabs.clear();
}
