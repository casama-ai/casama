/**
 * The pop-out live view of a bot's cloud computer (D-323 D10 + Phase 5 optional WebRTC upgrade).
 * Defaults to lightweight JPEG screenshots (works on headless and desktop computers) and offers
 * one-click upgrade to live WebRTC video on desktop computers with automatic fallback.
 */
import { installCrashReporting } from "../lib/crash.ts";
import { h } from "../lib/dom.ts";
import { LiveView } from "../lib/live-view.ts";
import { LiveWebRtc } from "../lib/live-webrtc.ts";
import { initTheme } from "../lib/theme.ts";
import { appUrl, here } from "../lib/workspace.ts";

initTheme();
installCrashReporting("live");

const app = document.getElementById("app") as HTMLElement;
const q = new URLSearchParams(location.search);
const id = q.get("computer") ?? "";
const name = q.get("name") ?? "Computer";

async function main() {
  const w = await here().catch(() => null);
  if (!w || !id) {
    app.replaceChildren(h("p", {}, "Sign in to Casama to watch."));
    return;
  }
  document.title = `${name}: live view`;
  const status = h("span", { className: "muted", "data-testid": "live-status" }, "Connecting…");
  const img = h("img", { alt: `${name}'s screen`, "data-testid": "live-img" }) as HTMLImageElement;
  const video = h("video", {
    autoplay: true,
    playsinline: true,
    muted: true,
    hidden: true,
    "data-testid": "live-video",
  }) as HTMLVideoElement;

  let mode: "jpeg" | "webrtc" = "jpeg";
  let jpeg: LiveView | null = null;
  let rtc: LiveWebRtc | null = null;

  const startJpeg = (note?: string) => {
    mode = "jpeg";
    rtc?.stop();
    rtc = null;
    video.hidden = true;
    img.hidden = false;
    toggleBtn.textContent = "Live video";
    if (note) status.textContent = `${note} · using screenshots`;
    jpeg?.stop();
    jpeg = new LiveView({
      account: w.account,
      api: w.api,
      computerId: id,
      img,
      status: (t) => {
        status.textContent = note && t === "Live" ? `Screenshots (${note})` : t;
      },
    });
    void jpeg.start().catch((e) => {
      status.textContent = (e as Error).message;
    });
  };

  const startWebRtc = () => {
    mode = "webrtc";
    jpeg?.stop();
    jpeg = null;
    img.hidden = true;
    video.hidden = false;
    toggleBtn.textContent = "Screenshots";
    rtc?.stop();
    rtc = new LiveWebRtc({
      api: w.api,
      computerId: id,
      video,
      status: (t) => {
        status.textContent = t;
      },
      onFallback: (reason) => {
        if (mode === "webrtc") startJpeg(reason);
      },
    });
    void rtc.start();
  };

  const toggleBtn = h(
    "button",
    {
      type: "button",
      "data-testid": "live-mode-toggle",
      onClick: () => {
        if (mode === "jpeg") startWebRtc();
        else startJpeg();
      },
    },
    "Live video",
  ) as HTMLButtonElement;

  app.replaceChildren(
    h(
      "header",
      {},
      h("h1", {}, name),
      status,
      toggleBtn,
      h(
        "a",
        { href: appUrl(w.account, `/computer/live?c=${id}`), target: "_blank", rel: "noopener" },
        "Take over in Casama",
      ),
    ),
    h("div", { className: "stage" }, img, video),
  );

  addEventListener("pagehide", () => {
    jpeg?.stop();
    rtc?.stop();
  });
  startJpeg();
}
void main();
