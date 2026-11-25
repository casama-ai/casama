/**
 * MV3-safe crash reporting for Casama's browser extension (D-539).
 *
 * Zero third-party runtime dependencies: works identically in Chrome/Edge MV3 service workers,
 * Firefox background scripts, and extension HTML pages (panel, options, live, offscreen, ask),
 * without violating `script-src 'self'` CSP or shipping remote code. Never loaded in content.js,
 * so host-page errors and URLs never get captured.
 *
 * Follows D-416 / D-417:
 * - Official store builds only (keys are empty in dev, e2e, and self-hosted builds).
 * - One reporter at a time: remote `crash_reporter` (`extension` over `default`) switches between
 *   `sentry`, `posthog`, and `none`; defaults to `sentry` when a DSN is configured.
 * - Scrubs secrets, emails, query strings, and per-install extension IDs/UUIDs; no cookies, no
 *   user ID, no page URLs, at most 10 deduplicated reports per context.
 * - Off when `settings.crashReports` is false, account `analytics_opt_out` is true, or DNT/GPC is on.
 */
import { getSettings } from "./settings.ts";

export type CrashContext = "background" | "panel" | "options" | "live" | "offscreen" | "ask";
export type ExtensionCrashReporter = "sentry" | "posthog" | "none";

export interface ParsedDsn {
  origin: string;
  projectId: string;
  publicKey: string;
  envelopeUrl: string;
}

export interface StackFrame {
  filename: string;
  function?: string;
  lineno?: number;
  colno?: number;
}

const MAX_REPORTS = 10;
const SECRETS: RegExp[] = [
  /\b(sk|pk|rk)-[A-Za-z0-9_-]{12,}/g,
  /\bBearer\s+[A-Za-z0-9._~+/=-]{8,}/gi,
  /\beyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{5,}/g,
  /\b(gh[pousr]_[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16})\b/g,
  /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/g,
];

let sentCount = 0;
const seenKeys = new Set<string>();
let installedContext: CrashContext | null = null;

/** Parses a Sentry DSN into its envelope endpoint URL, or returns null if invalid. */
export function parseDsn(dsn: string): ParsedDsn | null {
  const trimmed = dsn.trim();
  if (!trimmed) return null;
  try {
    const u = new URL(trimmed);
    const publicKey = u.username;
    const parts = u.pathname.replace(/^\/+|\/+$/g, "").split("/");
    const projectId = parts.pop() ?? "";
    if (!publicKey || !projectId || !/^\d+$/.test(projectId)) return null;
    const prefix = parts.length ? `/${parts.join("/")}` : "";
    const origin = `${u.protocol}//${u.host}`;
    const envelopeUrl = `${origin}${prefix}/api/${projectId}/envelope/?sentry_key=${encodeURIComponent(publicKey)}&sentry_version=7`;
    return { origin, projectId, publicKey, envelopeUrl };
  } catch {
    return null;
  }
}

/** Strips secrets, emails, query strings, and per-install extension IDs/UUIDs. */
export function scrubCrashText(text: string, max = 500): string {
  let out = text
    .replace(/(?:chrome|moz|safari-web)-extension:\/\/[^/\s)]+/gi, "app://")
    .replace(/(https?:\/\/[^\s?#)]+)[?#][^\s)]*/gi, "$1");
  for (const re of SECRETS) out = out.replace(re, "[redacted]");
  return out.length > max ? `${out.slice(0, max)}…` : out;
}

/** Normalizes a stack frame filename: extension paths become `app:///...`, host URLs are redacted. */
export function normalizeFrameUrl(raw: string): string {
  const bare = raw.trim().split(/[?#]/)[0] ?? "";
  const extMatch = bare.match(/^(?:chrome|moz|safari-web)-extension:\/\/[^/]+(\/.*)$/i);
  if (extMatch) return `app://${extMatch[1]}`;
  if (/^https?:\/\//i.test(bare)) return "[redacted-url]";
  return scrubCrashText(bare, 200);
}

/** Parses Chrome/V8 and Firefox/SpiderMonkey stack traces into Sentry frames (oldest first). */
export function parseStackFrames(stack?: string): StackFrame[] {
  if (!stack) return [];
  const frames: StackFrame[] = [];
  for (const rawLine of stack.split("\n")) {
    const line = rawLine.trim();
    // V8: "at fn (url:line:col)" or "at url:line:col"
    const v8 = line.match(/^at\s+(?:(.+?)\s+\()?(.+?):(\d+):(\d+)\)?$/);
    if (v8) {
      frames.push({
        function: v8[1] ? scrubCrashText(v8[1], 120) : "<anonymous>",
        filename: normalizeFrameUrl(v8[2] ?? ""),
        lineno: Number.parseInt(v8[3] ?? "0", 10) || undefined,
        colno: Number.parseInt(v8[4] ?? "0", 10) || undefined,
      });
      continue;
    }
    // SpiderMonkey: "fn@url:line:col"
    const ff = line.match(/^([^@]*)@(.+?):(\d+):(\d+)$/);
    if (ff) {
      frames.push({
        function: ff[1] ? scrubCrashText(ff[1], 120) : "<anonymous>",
        filename: normalizeFrameUrl(ff[2] ?? ""),
        lineno: Number.parseInt(ff[3] ?? "0", 10) || undefined,
        colno: Number.parseInt(ff[4] ?? "0", 10) || undefined,
      });
    }
  }
  // Sentry expects frames oldest-first (innermost frame last).
  return frames.slice(0, 40).reverse();
}

/** Picks the active reporter following D-417 (`none` always wins). */
export function chooseReporter(opts: {
  remote?: string | null;
  sentryDsn: string;
  posthogKey: string;
}): ExtensionCrashReporter {
  const hasSentry = parseDsn(opts.sentryDsn) !== null;
  const hasPosthog = opts.posthogKey.trim().length > 0;
  if (opts.remote === "none") return "none";
  if (opts.remote === "sentry" && hasSentry) return "sentry";
  if (opts.remote === "posthog" && hasPosthog) return "posthog";
  if (hasSentry) return "sentry";
  if (hasPosthog) return "posthog";
  return "none";
}

function eventId(): string {
  const bytes = new Uint8Array(16);
  crypto.getRandomValues(bytes);
  return Array.from(bytes, (b) => b.toString(16).padStart(2, "0")).join("");
}

export interface CrashPayloadInput {
  name: string;
  message: string;
  frames: StackFrame[];
  handled: boolean;
  context: CrashContext;
  version: string;
  browser: "chromium" | "firefox" | "safari";
  dsn?: string;
}

/** Formats a standard Sentry Envelope (newline-delimited JSON header + item header + event). */
export function buildSentryEnvelope(input: CrashPayloadInput): string {
  const id = eventId();
  const sentAt = new Date().toISOString();
  const header = JSON.stringify({
    event_id: id,
    sent_at: sentAt,
    ...(input.dsn ? { dsn: input.dsn } : {}),
  });
  const event = JSON.stringify({
    event_id: id,
    timestamp: Math.floor(Date.now() / 1000),
    platform: "javascript",
    level: "error",
    environment: "production",
    release: `casama-extension@${input.version}`,
    tags: {
      surface: "extension",
      extension_context: input.context,
      extension_browser: input.browser,
    },
    exception: {
      values: [
        {
          type: scrubCrashText(input.name || "Error", 120),
          value: scrubCrashText(input.message || "Unknown error"),
          mechanism: { type: "generic", handled: input.handled },
          ...(input.frames.length ? { stacktrace: { frames: input.frames } } : {}),
        },
      ],
    },
  });
  const itemHeader = JSON.stringify({ type: "event", content_type: "application/json" });
  return `${header}\n${itemHeader}\n${event}\n`;
}

/** Formats a PostHog `$exception` capture payload (unlinked anonymous ID per crash). */
export function buildPosthogException(
  input: CrashPayloadInput & { apiKey: string },
): Record<string, unknown> {
  return {
    api_key: input.apiKey,
    event: "$exception",
    distinct_id: `ext-anon-${eventId().slice(0, 12)}`,
    properties: {
      $exception_type: scrubCrashText(input.name || "Error", 120),
      $exception_message: scrubCrashText(input.message || "Unknown error"),
      $exception_list: [
        {
          type: scrubCrashText(input.name || "Error", 120),
          value: scrubCrashText(input.message || "Unknown error"),
          mechanism: { type: "generic", handled: input.handled },
          ...(input.frames.length ? { stacktrace: { type: "raw", frames: input.frames } } : {}),
        },
      ],
      surface: "extension",
      extension_context: input.context,
      extension_browser: input.browser,
      app_version: input.version,
      $process_person_profile: false,
    },
  };
}

function browserOptedOut(): boolean {
  try {
    const nav = globalThis.navigator as
      | (Navigator & { globalPrivacyControl?: boolean })
      | undefined;
    if (nav?.doNotTrack === "1" || nav?.globalPrivacyControl === true) return true;
  } catch {
    // ignore
  }
  return false;
}

function buildConfig(): {
  sentryDsn: string;
  posthogKey: string;
  posthogHost: string;
  version: string;
  browser: "chromium" | "firefox" | "safari";
} {
  return {
    sentryDsn: typeof __CASAMA_SENTRY_DSN__ === "string" ? __CASAMA_SENTRY_DSN__ : "",
    posthogKey: typeof __CASAMA_POSTHOG_KEY__ === "string" ? __CASAMA_POSTHOG_KEY__ : "",
    posthogHost:
      typeof __CASAMA_POSTHOG_HOST__ === "string" && __CASAMA_POSTHOG_HOST__
        ? __CASAMA_POSTHOG_HOST__
        : "https://us.i.posthog.com",
    version: typeof __CASAMA_VERSION__ === "string" ? __CASAMA_VERSION__ : "0.0.0",
    browser:
      typeof __CASAMA_BROWSER__ === "string" &&
      (__CASAMA_BROWSER__ === "firefox" || __CASAMA_BROWSER__ === "safari")
        ? __CASAMA_BROWSER__
        : "chromium",
  };
}

async function readRemoteReporter(): Promise<string | null> {
  try {
    const got = await chrome.storage.local.get(["remoteConfigs", "crashAccountOptOut"]);
    if (got.crashAccountOptOut === true) return "none";
    const map = got.remoteConfigs as
      | Record<string, { config?: { crash_reporter?: { extension?: string; default?: string } } }>
      | undefined;
    if (!map) return null;
    for (const entry of Object.values(map)) {
      const cr = entry?.config?.crash_reporter;
      if (cr?.extension) return cr.extension;
      if (cr?.default) return cr.default;
    }
  } catch {
    // ignore storage errors
  }
  return null;
}

function toErrorParts(error: unknown): { name: string; message: string; frames: StackFrame[] } {
  if (error instanceof Error) {
    return {
      name: error.name || "Error",
      message: error.message || String(error),
      frames: parseStackFrames(error.stack),
    };
  }
  if (typeof error === "string") return { name: "Error", message: error, frames: [] };
  try {
    return { name: "Error", message: JSON.stringify(error) ?? String(error), frames: [] };
  } catch {
    return { name: "Error", message: String(error), frames: [] };
  }
}

/** Sends one scrubbed crash report if enabled and under the per-context cap. */
export async function reportCrash(
  error: unknown,
  opts: { context?: CrashContext; handled?: boolean; fetchImpl?: typeof fetch } = {},
): Promise<boolean> {
  if (sentCount >= MAX_REPORTS || browserOptedOut()) return false;
  const cfg = buildConfig();
  if (!cfg.sentryDsn && !cfg.posthogKey) return false;

  try {
    const settings = await getSettings();
    if (!settings.crashReports) return false;
  } catch {
    // If settings can't be read, stay safe and don't crash.
    return false;
  }

  const remote = await readRemoteReporter();
  const reporter = chooseReporter({
    remote,
    sentryDsn: cfg.sentryDsn,
    posthogKey: cfg.posthogKey,
  });
  if (reporter === "none") return false;

  const parts = toErrorParts(error);
  const topFrame = parts.frames.at(-1)?.filename ?? "";
  const dedupeKey = `${parts.name}|${scrubCrashText(parts.message, 120)}|${topFrame}`;
  if (seenKeys.has(dedupeKey)) return false;
  seenKeys.add(dedupeKey);
  sentCount += 1;

  const context = opts.context ?? installedContext ?? "background";
  const payloadInput: CrashPayloadInput = {
    name: parts.name,
    message: parts.message,
    frames: parts.frames,
    handled: opts.handled ?? false,
    context,
    version: cfg.version,
    browser: cfg.browser,
    dsn: cfg.sentryDsn,
  };
  const doFetch = opts.fetchImpl ?? fetch;

  try {
    if (reporter === "sentry") {
      const parsed = parseDsn(cfg.sentryDsn);
      if (!parsed) return false;
      // Plain text content-type with sentry_key in query avoids a CORS preflight in MV3.
      await doFetch(parsed.envelopeUrl, {
        method: "POST",
        headers: { "content-type": "text/plain;charset=UTF-8" },
        body: buildSentryEnvelope(payloadInput),
        keepalive: true,
      });
      return true;
    }
    if (reporter === "posthog") {
      const url = `${cfg.posthogHost.replace(/\/$/, "")}/capture/`;
      await doFetch(url, {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify(buildPosthogException({ ...payloadInput, apiKey: cfg.posthogKey })),
        keepalive: true,
      });
      return true;
    }
  } catch {
    // Crash reporting must never throw or recurse.
  }
  return false;
}

/** Installs global uncaught error & unhandled rejection listeners for an extension context. */
export function installCrashReporting(context: CrashContext): void {
  if (installedContext) return;
  installedContext = context;
  globalThis.addEventListener("error", (e: Event) => {
    const errEvent = e as ErrorEvent;
    const err =
      errEvent.error ??
      new Error(scrubCrashText(String(errEvent.message || "Uncaught extension error")));
    void reportCrash(err, { context, handled: false });
  });
  globalThis.addEventListener("unhandledrejection", (e: Event) => {
    const rej = e as PromiseRejectionEvent;
    void reportCrash(rej.reason ?? new Error("Unhandled promise rejection"), {
      context,
      handled: false,
    });
  });
}

/** Tests only: reset counters and installation flag. */
export function resetCrashForTest(): void {
  sentCount = 0;
  seenKeys.clear();
  installedContext = null;
}
