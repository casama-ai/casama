/**
 * Read aloud (A11, B8): audio plays in an offscreen document, so it keeps playing when the panel
 * closes and the service worker can start it too. Firefox has no offscreen documents: there it
 * plays in the page that asked (the sidebar, or the background page, which has a DOM there).
 */
const PATH = "offscreen/offscreen.html";

let here: HTMLAudioElement | null = null;
let playingId: string | null = null;
const listeners = new Set<(id: string | null) => void>();

function notify(id: string | null) {
  playingId = id;
  for (const fn of listeners) fn(id);
}

/** Subscribes to playback state changes (`id` of playing message, or null when stopped). */
export function onAudioState(fn: (id: string | null) => void): () => void {
  listeners.add(fn);
  return () => listeners.delete(fn);
}

export function playingAudioId(): string | null {
  return playingId;
}

if (typeof chrome !== "undefined" && chrome.runtime?.onMessage) {
  chrome.runtime.onMessage.addListener((m: { type?: string }) => {
    if (m?.type === "audio:ended") notify(null);
  });
}

function playHere(bytes: ArrayBuffer, mime: string, id: string) {
  stopHere();
  const audio = new Audio(URL.createObjectURL(new Blob([bytes], { type: mime })));
  here = audio;
  notify(id);
  audio.addEventListener("ended", () => {
    if (here === audio) stopHere();
    notify(null);
  });
  audio.addEventListener("error", () => {
    if (here === audio) stopHere();
    notify(null);
  });
  return audio.play().catch((e) => {
    if (here === audio) stopHere();
    notify(null);
    throw e;
  });
}

function stopHere() {
  if (!here) return;
  here.pause();
  URL.revokeObjectURL(here.src);
  here = null;
}

async function ensureOffscreen() {
  const url = chrome.runtime.getURL(PATH);
  const have = await chrome.runtime.getContexts?.({
    contextTypes: ["OFFSCREEN_DOCUMENT" as chrome.runtime.ContextType],
    documentUrls: [url],
  });
  if (have?.length) return;
  await chrome.offscreen.createDocument({
    url: PATH,
    reasons: ["AUDIO_PLAYBACK" as chrome.offscreen.Reason],
    justification: "Reads a bot's reply aloud when the person asks.",
  });
}

export async function playAudio(bytes: ArrayBuffer, mime: string, id = "audio") {
  if (__CASAMA_BROWSER__ !== "chromium" || !chrome.offscreen) return playHere(bytes, mime, id);
  await ensureOffscreen();
  const { toBase64 } = await import("./capture.ts");
  notify(id);
  await chrome.runtime.sendMessage({
    target: "offscreen",
    type: "play",
    data: toBase64(new Uint8Array(bytes)),
    mime,
  });
}

export async function stopAudio() {
  stopHere();
  notify(null);
  if (__CASAMA_BROWSER__ !== "chromium" || !chrome.offscreen) return;
  await chrome.runtime.sendMessage({ target: "offscreen", type: "stop" }).catch(() => {});
}
