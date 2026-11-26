import DefaultTheme from "vitepress/theme";
import { h } from "vue";
import BrandMark from "./BrandMark.vue";
import FaqFilter from "./FaqFilter.vue";
import NotFound from "./NotFound.vue";
import PageActions from "./PageActions.vue";
import "./custom.css";

// The Casama mark is the animated mascot (BrandMark), not a picture: in the nav bar and on the home hero.
// Every docs page also gets PageActions: copy it as markdown or open it in an AI chat. A missing page
// gets NotFound, the painted lost scene shared with the other sites.
const BEACON_URL = "https://casama.ai/b";
const UTM_KEY = "casama.utm";

function readSavedUtm(): { s?: string; m?: string; c?: string } | null {
  try {
    const raw = sessionStorage.getItem(UTM_KEY);
    return raw ? JSON.parse(raw) : null;
  } catch {
    return null;
  }
}

function saveFirstUtm(qs: URLSearchParams) {
  try {
    const s = qs.get("utm_source") || "";
    if (!s || sessionStorage.getItem(UTM_KEY)) return;
    sessionStorage.setItem(
      UTM_KEY,
      JSON.stringify({
        s: s.slice(0, 80),
        m: (qs.get("utm_medium") || "").slice(0, 60),
        c: (qs.get("utm_campaign") || "").slice(0, 100),
      }),
    );
  } catch {
    // Ignore storage failures in private browsing.
  }
}

/**
 * Our own visits don't count: open any page once with ?internal=on (?internal=off undoes it) and this
 * browser stops sending counts from the docs. A flag in this site's storage, no cookie.
 */
function isInternal(): boolean {
  try {
    const q = new URLSearchParams(location.search).get("internal");
    if (q === "on") localStorage.setItem("casama.internal", "1");
    if (q === "off") localStorage.removeItem("casama.internal");
    return localStorage.getItem("casama.internal") === "1";
  } catch {
    return false;
  }
}

export function countDocsEvent(name: string, data: Record<string, unknown> = {}) {
  try {
    if (!navigator.sendBeacon || location.hostname !== "docs.casama.ai" || isInternal()) return;
    navigator.sendBeacon(
      BEACON_URL,
      JSON.stringify({ h: "docs", p: location.pathname, e: name, d: data }),
    );
  } catch {
    // Counting is never worth breaking the docs for.
  }
}

/**
 * One anonymous page-view count per page (D-398), posted to casama.ai's counter, which forwards it to
 * Google Analytics from the server: no cookie and no Google script on the docs. Only on docs.casama.ai.
 */
function countPageView() {
  try {
    if (!navigator.sendBeacon || location.hostname !== "docs.casama.ai" || isInternal()) return;
    let from = "";
    try {
      from = document.referrer ? new URL(document.referrer).hostname : "";
    } catch {
      from = "";
    }
    const qs = new URLSearchParams(location.search);
    saveFirstUtm(qs);
    const utm = qs.get("utm_source") || "";
    navigator.sendBeacon(
      BEACON_URL,
      JSON.stringify({
        h: "docs",
        p: location.pathname,
        r: from,
        u: utm,
        m: qs.get("utm_medium") || "",
        c: qs.get("utm_campaign") || "",
      }),
    );
  } catch {
    // Counting is never worth breaking the page for.
  }
}

function trackDocsEngagement() {
  let visibleSince = document.visibilityState === "visible" ? Date.now() : 0;
  let dwellMs = 0;
  let maxScroll = 0;
  let sent = false;
  let currentPath = location.pathname;

  const updateScroll = () => {
    const doc = document.documentElement;
    const total = Math.max(doc.scrollHeight - window.innerHeight, 0);
    if (total <= 0) {
      maxScroll = 100;
      return;
    }
    const pct = Math.min(100, Math.round((window.scrollY / total) * 100));
    if (pct > maxScroll) maxScroll = pct;
  };
  const bucket = (p: number) =>
    p >= 90 ? "90" : p >= 75 ? "75" : p >= 50 ? "50" : p >= 25 ? "25" : "0";
  const flush = (path = currentPath) => {
    if (visibleSince) {
      dwellMs += Date.now() - visibleSince;
      visibleSince = 0;
    }
    if (sent || dwellMs < 1000) return;
    sent = true;
    updateScroll();
    try {
      if (!navigator.sendBeacon || location.hostname !== "docs.casama.ai" || isInternal()) return;
      navigator.sendBeacon(
        BEACON_URL,
        JSON.stringify({
          h: "docs",
          p: path,
          e: "page_engagement",
          d: {
            engagement_time_msec: Math.min(Math.round(dwellMs), 1_800_000),
            scroll_depth: bucket(maxScroll),
          },
        }),
      );
    } catch {
      // Ignore.
    }
  };
  const reset = () => {
    currentPath = location.pathname;
    visibleSince = document.visibilityState === "visible" ? Date.now() : 0;
    dwellMs = 0;
    maxScroll = 0;
    sent = false;
  };

  window.addEventListener("scroll", updateScroll, { passive: true });
  document.addEventListener("visibilitychange", () => {
    if (document.visibilityState === "hidden") flush();
    else reset();
  });
  window.addEventListener("pagehide", () => flush());

  // Outbound app.casama.ai and /get/* links carry preserved first-touch UTMs and count start_click.
  document.addEventListener("click", (e) => {
    const target = e.target as HTMLElement | null;
    const a = target?.closest?.("a[href]") as HTMLAnchorElement | null;
    if (!a) return;
    const href = a.getAttribute("href") || "";
    // Links to the GitHub repo (D-577): the nav's star link and GitHub icon, or a link in a page.
    if (/^https:\/\/github\.com\/casama-ai\/casama\/?(#.*)?$/.test(href)) {
      countDocsEvent("github_click", {
        place: a.closest(".VPNav, .VPNavScreen, .VPSocialLinks") ? "docs_nav" : "docs_page",
      });
      return;
    }
    if (!/^https:\/\/app\.casama\.ai(\/|$|\?)/.test(href)) return;
    try {
      const u = new URL(href);
      if (!u.searchParams.has("utm_source")) {
        const saved = readSavedUtm();
        const slug =
          `docs-${location.pathname
            .replace(/^\/+|\/+$/g, "")
            .replace(/[^a-z0-9]+/gi, "-")
            .toLowerCase()}`
            .replace(/-+$/, "")
            .slice(0, 100) || "docs";
        if (saved?.s) {
          u.searchParams.set("utm_source", saved.s);
          if (saved.m) u.searchParams.set("utm_medium", saved.m);
          if (saved.c) u.searchParams.set("utm_campaign", saved.c);
          u.searchParams.set("utm_content", slug);
        } else {
          u.searchParams.set("utm_source", "docs.casama.ai");
          u.searchParams.set("utm_medium", "website");
          u.searchParams.set("utm_campaign", slug);
        }
        a.setAttribute("href", u.toString());
      }
    } catch {
      // Keep the link as is.
    }
    countDocsEvent("start_click", { via: "docs" });
  });

  return {
    onRouteChange() {
      flush(currentPath);
      reset();
    },
  };
}

/**
 * Casama Help, the support chat that answers from these docs: casama.ai's loader draws a small
 * "? Questions" button and fetches the chat on the first click. Only in the browser; on localhost
 * the loader talks to the local stack's API.
 */
function addCasamaHelp() {
  if (document.querySelector("script[data-casama-help]")) return;
  const script = document.createElement("script");
  // scripts/serve-web.py turns this address into the local casama.ai.
  script.src = "https://casama.ai/assets/support/loader.js";
  script.async = true;
  script.dataset.casamaHelp = "";
  script.dataset.surface = "docs";
  document.body.appendChild(script);
}

/**
 * In the docs search (VitePress's local search), a last row: "Ask Casama Help about “query”". Watches
 * for the search box; if VitePress ever changes its markup and the box isn't found, nothing happens.
 */
function watchSearch() {
  let row: HTMLButtonElement | null = null;
  let input: HTMLInputElement | null = null;
  const update = () => {
    if (!row || !input) return;
    const q = input.value.trim();
    row.hidden = !q;
    const label = row.querySelector("span");
    if (label) label.textContent = q.length > 80 ? `${q.slice(0, 80)}…` : q;
  };
  const attach = () => {
    const box = document.querySelector(".VPLocalSearchBox");
    const shell = box?.querySelector(".shell");
    const field = box?.querySelector<HTMLInputElement>("input.search-input, input");
    if (!box || !shell || !field) {
      row = null;
      input = null;
      return;
    }
    if (row && shell.contains(row) && input === field) return;
    input = field;
    row = document.createElement("button");
    row.type = "button";
    row.className = "casama-help-search-row";
    row.innerHTML = "Ask Casama Help about “<span></span>”";
    row.addEventListener("click", () => {
      countDocsEvent("docs_action", { action: "search_help" });
      const text = (input?.value ?? "").trim().slice(0, 1000);
      // Close the search (it listens for Escape) before the chat opens.
      window.dispatchEvent(new KeyboardEvent("keydown", { key: "Escape", bubbles: true }));
      const help = (window as unknown as { CasamaHelp?: { open: (o: { text: string }) => void } })
        .CasamaHelp;
      if (help) setTimeout(() => help.open({ text }), 50);
      else window.location.href = `https://casama.ai/help?q=${encodeURIComponent(text)}`;
    });
    shell.appendChild(row);
    field.addEventListener("input", update);
    update();
  };
  let queued = false;
  new MutationObserver(() => {
    if (queued) return;
    queued = true;
    requestAnimationFrame(() => {
      queued = false;
      attach();
    });
  }).observe(document.body, { childList: true, subtree: true });
}

export default {
  extends: DefaultTheme,
  enhanceApp({ router }) {
    if (typeof window === "undefined") return;
    countPageView();
    const engagement = trackDocsEngagement();
    try {
      addCasamaHelp();
      watchSearch();
    } catch {
      // The help chat is never worth breaking the docs for.
    }
    const previous = router.onAfterRouteChange;
    router.onAfterRouteChange = async (to) => {
      await previous?.(to);
      engagement.onRouteChange();
      countPageView();
    };
  },
  Layout() {
    return h(DefaultTheme.Layout, null, {
      "nav-bar-title-before": () => h(BrandMark, { class: "casama-mark-nav" }),
      "home-hero-image": () => h(BrandMark, { class: "image-src casama-mark-hero" }),
      "doc-before": () => [h(PageActions), h(FaqFilter)],
      "not-found": () => h(NotFound),
    });
  },
};
