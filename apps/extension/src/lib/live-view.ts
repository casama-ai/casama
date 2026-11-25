/**
 * Live view of a bot's cloud computer (D-323 D10, B2), in the panel or a small window of its own.
 *
 * Uses the lightweight screenshot endpoint (`GET /v1/computers/{id}/screenshot?format=jpeg&width=…&wake=false`)
 * with ETag / If-None-Match (304) so it works on both headless and desktop computers without
 * failing with 409 `no_desktop` or waking sleeping machines.
 */
import type { CasamaClient } from "@casama/client";
import { accessToken } from "./session.ts";
import type { Account } from "./store.ts";

export interface LiveViewOptions {
  account: Account;
  api?: CasamaClient;
  computerId: string;
  img: HTMLImageElement;
  status: (text: string) => void;
  /** Target width in pixels (defaults to 800). */
  width?: number;
  /** Whether to wake a sleeping computer (defaults to false). */
  wake?: boolean;
  /** For tests. */
  everyMs?: number;
  /** Optional callback whenever a fresh frame loads. */
  onFrame?: () => void;
  /** Optional fetch override for tests. */
  fetchFn?: typeof fetch;
}

export function screenshotUrl(
  server: string,
  computerId: string,
  width = 800,
  wake = false,
): string {
  const base = server.replace(/\/+$/, "");
  return `${base}/v1/computers/${encodeURIComponent(computerId)}/screenshot?format=jpeg&width=${Math.round(width)}&wake=${wake ? "true" : "false"}`;
}

export class LiveView {
  private timer?: ReturnType<typeof setTimeout>;
  private url: string | null = null;
  private etag: string | null = null;
  private stopped = false;
  private shotUrl = "";
  private readonly o: LiveViewOptions;
  constructor(o: LiveViewOptions) {
    this.o = o;
  }

  async start() {
    this.stopped = false;
    this.etag = null;
    this.shotUrl = screenshotUrl(
      this.o.account.server,
      this.o.computerId,
      this.o.width ?? 800,
      this.o.wake ?? false,
    );
    this.o.status("Connecting…");
    await this.tick();
  }

  private async tick() {
    if (this.stopped) return;
    // Left the screen (another tab of the panel): stop rather than poll for nothing.
    if (!this.o.img.isConnected) return this.stop();
    // A hidden panel or window doesn't need pictures.
    if (typeof document === "undefined" || document.visibilityState !== "hidden")
      await this.frame();
    if (!this.stopped) this.timer = setTimeout(() => void this.tick(), this.o.everyMs ?? 1000);
  }

  private async frame() {
    try {
      const token = await accessToken(this.o.account.id);
      if (!token) {
        this.o.status("You're signed out.");
        this.stop();
        return;
      }
      const headers: Record<string, string> = { authorization: `Bearer ${token}` };
      if (this.etag) headers["if-none-match"] = this.etag;
      const doFetch = this.o.fetchFn ?? fetch;
      const res = await doFetch(this.shotUrl, {
        headers,
        cache: "no-store",
        signal: AbortSignal.timeout(10_000),
      });
      if (res.status === 304) {
        this.o.status("Live");
        return;
      }
      if (res.status === 409) {
        this.o.status("Nothing on its screen right now.");
        return;
      }
      if (!res.ok) {
        this.o.status(`The computer didn't answer (${res.status}).`);
        return;
      }
      const nextEtag = res.headers.get("etag");
      if (nextEtag) this.etag = nextEtag;
      const blob = await res.blob();
      if (this.stopped) return;
      const next = URL.createObjectURL(blob);
      this.o.img.src = next;
      if (this.url) URL.revokeObjectURL(this.url);
      this.url = next;
      this.o.status("Live");
      this.o.onFrame?.();
    } catch {
      this.o.status("Reconnecting…");
    }
  }

  stop() {
    this.stopped = true;
    clearTimeout(this.timer);
    if (this.url) URL.revokeObjectURL(this.url);
    this.url = null;
    this.etag = null;
  }
}

/** Opens the live view in a small window of its own. */
export async function popOutLiveView(computerId: string, name: string) {
  const url = chrome.runtime.getURL(
    `live/live.html?computer=${encodeURIComponent(computerId)}&name=${encodeURIComponent(name)}`,
  );
  await chrome.windows.create({ url, type: "popup", width: 640, height: 440 });
}
