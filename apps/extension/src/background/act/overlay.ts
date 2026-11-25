/**
 * The frame and banner on a tab a bot is working in (D-323 C4, C5): "<Bot> is working in this tab",
 * with Stop; touching the page pauses the bot ("You took over", with Hand back).
 *
 * It lives in an isolated world the page's scripts can't reach, in a closed shadow root, hidden from
 * the accessibility tree so a bot never sees (or clicks) it. It talks back through a debugger binding
 * that only that world has, and only real input from the person (isTrusted) counts. The background
 * ignores input that arrives within 500 ms of its own, since the bot's input is real input too.
 */
import { listen, send } from "./cdp.ts";

export const OVERLAY_WORLD = "casama-overlay";
const BINDING = "casamaOverlay";

export type OverlayState = "working" | "paused" | "asking" | "teaching";

export type OverlayEvent =
  | { type: "stop"; at: number }
  | { type: "takeover"; at: number }
  | { type: "handback"; at: number };

/** The overlay's script. [label] and [state] are filled in; it re-reads state from its dataset. */
function overlaySource(label: string, state: OverlayState) {
  return `(() => {
  // The banner belongs to the tab, not to every frame in it.
  if (window.top !== window) return;
  if (window.__casamaOverlay) { window.__casamaOverlay.set(${JSON.stringify(label)}, ${JSON.stringify(state)}); return; }
  const send = (type) => { try { ${BINDING}(JSON.stringify({ type, at: Date.now() })); } catch {} };
  let host, root, bar, text, btn, cur, rip, curTimer, label = ${JSON.stringify(label)}, state = ${JSON.stringify(state)};
  const words = {
    working: (l) => [l + " is working in this tab", "Stop"],
    paused: () => ["You took over. The bot waits until you hand back.", "Hand back"],
    asking: (l) => [l + " is waiting for you in the Casama window", "Stop"],
    teaching: () => ["Recording what you do for a new skill. Passwords are never recorded.", "Stop recording"],
  };
  const paint = () => {
    if (!host) return;
    const [t, b] = words[state](label);
    text.textContent = t; btn.textContent = b;
    host.dataset.state = state;
  };
  const mount = () => {
    if (host && host.isConnected) return;
    host = document.createElement("casama-overlay");
    host.setAttribute("aria-hidden", "true");
    root = host.attachShadow({ mode: "closed" });
    root.innerHTML = '<style>' +
      ':host{all:initial}' +
      '.frame{position:fixed;inset:0;border:3px solid #7c5cff;pointer-events:none;z-index:2147483646;border-radius:2px}' +
      '.bar{position:fixed;top:8px;left:50%;transform:translateX(-50%);z-index:2147483647;display:flex;gap:12px;align-items:center;' +
      'background:#1d1b26;color:#fff;font:500 13px/1.3 system-ui,sans-serif;padding:8px 8px 8px 14px;border-radius:999px;box-shadow:0 4px 16px rgba(0,0,0,.3)}' +
      'button{all:unset;cursor:pointer;background:#fff;color:#1d1b26;font-weight:600;padding:5px 12px;border-radius:999px}' +
      '.cur{position:fixed;left:0;top:0;z-index:2147483646;pointer-events:none;opacity:0;transform:translate3d(-99px,-99px,0);' +
      'transition:transform .22s cubic-bezier(.22,1,.36,1),opacity .18s ease;display:flex;align-items:center;gap:4px}' +
      '.cur.on{opacity:1}' +
      '.cur svg{width:22px;height:22px;filter:drop-shadow(0 2px 4px rgba(0,0,0,.35))}' +
      '.cur .dots{background:#7c5cff;color:#fff;font:700 11px/1 system-ui,sans-serif;padding:2px 6px;border-radius:999px;display:none}' +
      '.cur.typing .dots{display:inline-block}' +
      '.rip{position:fixed;left:0;top:0;width:24px;height:24px;margin:-12px 0 0 -12px;border-radius:50%;border:2px solid #7c5cff;' +
      'pointer-events:none;z-index:2147483645;opacity:0;transform:scale(.4)}' +
      '.rip.pop{animation:casamaRip .55s ease-out forwards}' +
      '@keyframes casamaRip{0%{opacity:.9;transform:scale(.4)}100%{opacity:0;transform:scale(1.9)}}' +
      '@media (prefers-reduced-motion:reduce){.cur{transition:none}.rip.pop{animation:none}}' +
      '</style><div class="frame"></div><div class="bar"><span></span><button type="button"></button></div>' +
      '<div class="rip"></div><div class="cur"><svg viewBox="0 0 24 24" fill="#7c5cff" stroke="#fff" stroke-width="1.8"><path d="M4 3l7.5 18 2.8-6.7L21 11.5z"/></svg><span class="dots">•••</span></div>';
    bar = root.querySelector(".bar"); text = bar.querySelector("span"); btn = bar.querySelector("button");
    cur = root.querySelector(".cur"); rip = root.querySelector(".rip");
    btn.addEventListener("click", (e) => {
      if (!e.isTrusted) return;
      e.stopPropagation();
      send(state === "paused" ? "handback" : "stop");
    });
    (document.documentElement || document).appendChild(host);
    paint();
  };
  const touched = (e) => {
    if (!e.isTrusted || state !== "working") return;
    if (host && e.composedPath().includes(host)) return;
    send("takeover");
  };
  addEventListener("pointerdown", touched, true);
  addEventListener("keydown", touched, true);
  // Pages that replace the whole document body still get the banner back.
  const keepAlive = setInterval(() => { if (window.__casamaOverlay && (!host || !host.isConnected)) mount(); }, 1000);
  window.__casamaOverlay = {
    set(l, s) { label = l; state = s; mount(); paint(); },
    cursor(action, x, y) {
      mount();
      if (!cur) return;
      cur.style.transform = "translate3d(" + Math.round(x) + "px," + Math.round(y) + "px,0)";
      cur.classList.add("on");
      cur.classList.toggle("typing", action === "type" || action === "fill");
      if (action === "click" && rip) {
        rip.style.left = Math.round(x) + "px";
        rip.style.top = Math.round(y) + "px";
        rip.classList.remove("pop");
        void rip.offsetWidth;
        rip.classList.add("pop");
      }
      clearTimeout(curTimer);
      curTimer = setTimeout(() => { cur && cur.classList.remove("on", "typing"); }, 2500);
    },
    remove() { clearInterval(keepAlive); clearTimeout(curTimer); removeEventListener("pointerdown", touched, true); removeEventListener("keydown", touched, true); host && host.remove(); host = null; delete window.__casamaOverlay; },
  };
  if (document.documentElement) mount(); else addEventListener("DOMContentLoaded", mount, { once: true });
})()`;
}

interface Shown {
  scriptId: string | null;
  label: string;
  state: OverlayState;
  stop: () => void;
}
const SHOWN = new Map<number, Shown>();

async function evalInWorld(tabId: number, expression: string) {
  const { frameTree } = await send<{ frameTree: { frame: { id: string } } }>(
    tabId,
    "Page.getFrameTree",
  );
  const { executionContextId } = await send<{ executionContextId: number }>(
    tabId,
    "Page.createIsolatedWorld",
    { frameId: frameTree.frame.id, worldName: OVERLAY_WORLD, grantUniveralAccess: false },
  );
  await send(tabId, "Runtime.evaluate", { expression, contextId: executionContextId });
}

/** Shows (or updates) the overlay on an attached tab; [onEvent] gets the person's presses. */
export async function showOverlay(
  tabId: number,
  label: string,
  state: OverlayState,
  onEvent: (e: OverlayEvent) => void,
) {
  const had = SHOWN.get(tabId);
  if (had) {
    had.label = label;
    had.state = state;
    await evalInWorld(tabId, overlaySource(label, state)).catch(() => {});
    if (had.scriptId) {
      // New pages in this tab start with the current words.
      await send(tabId, "Page.removeScriptToEvaluateOnNewDocument", {
        identifier: had.scriptId,
      }).catch(() => {});
      had.scriptId = await addScript(tabId, label, state);
    }
    return;
  }
  await send(tabId, "Runtime.addBinding", {
    name: BINDING,
    executionContextName: OVERLAY_WORLD,
  }).catch(() => {});
  const stop = listen(tabId, (method, p) => {
    if (method !== "Runtime.bindingCalled" || p.name !== BINDING) return;
    try {
      const e = JSON.parse(String(p.payload)) as OverlayEvent;
      if (e.type === "stop" || e.type === "takeover" || e.type === "handback") onEvent(e);
    } catch {
      // Not ours.
    }
  });
  const shown: Shown = { scriptId: null, label, state, stop };
  SHOWN.set(tabId, shown);
  shown.scriptId = await addScript(tabId, label, state);
  await evalInWorld(tabId, overlaySource(label, state)).catch(() => {});
}

async function addScript(tabId: number, label: string, state: OverlayState) {
  const r = await send<{ identifier: string }>(tabId, "Page.addScriptToEvaluateOnNewDocument", {
    source: overlaySource(label, state),
    worldName: OVERLAY_WORLD,
  }).catch(() => null);
  return r?.identifier ?? null;
}

export function overlayState(tabId: number) {
  return SHOWN.get(tabId)?.state ?? null;
}

/**
 * BOT-CURSOR-PLAN Phase 4: glides the bot cursor inside casama-overlay's closed shadow root
 * during Act click, fill, and scroll steps on Chrome tabs.
 */
export async function moveOverlayCursor(
  tabId: number,
  action: "click" | "fill" | "type" | "scroll",
  x: number,
  y: number,
) {
  if (!SHOWN.has(tabId)) return;
  await evalInWorld(
    tabId,
    `window.__casamaOverlay && window.__casamaOverlay.cursor(${JSON.stringify(action)}, ${Number(x) || 0}, ${Number(y) || 0})`,
  ).catch(() => {});
}

/** Takes the overlay off (before detaching). */
export async function hideOverlay(tabId: number) {
  const s = SHOWN.get(tabId);
  if (!s) return;
  SHOWN.delete(tabId);
  s.stop();
  if (s.scriptId)
    await send(tabId, "Page.removeScriptToEvaluateOnNewDocument", { identifier: s.scriptId }).catch(
      () => {},
    );
  await evalInWorld(tabId, "window.__casamaOverlay && window.__casamaOverlay.remove()").catch(
    () => {},
  );
}

/** Forgets a tab whose debugger went away (nothing to remove: the page keeps no binding). */
export function forgetOverlay(tabId: number) {
  const s = SHOWN.get(tabId);
  s?.stop();
  SHOWN.delete(tabId);
}
