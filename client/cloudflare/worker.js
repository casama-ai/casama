// The casama-app Worker in front of app.casama.ai (D-316).
//
// Everything is served from static assets except the app's main files (main.dart.wasm and
// main.dart.js, precompressed at Brotli 11) and any build file of 25 MiB or more (Cloudflare's
// per-asset limit), which live in the R2 bucket bound as LARGE. cloudflare/prepare.mjs lists them in
// large-files.json and uploads a plain, a Brotli and a gzip copy of each under a content-named key.
// Only paths in wrangler.jsonc's assets.run_worker_first reach this code at all.
//
// It also serves workspace invite links (/join/<token>): the app's own page, with a share card that
// says who invited you and to which workspace when a link-preview bot (WhatsApp, iMessage, Slack…)
// asks, read from the API's public invite preview. People get the page unchanged but for the card.
import large from "../build/web-host/large-files.json";

// What _headers gives static assets; it doesn't apply to responses made here.
const HEADERS = {
  "Cache-Control": "public, max-age=0, must-revalidate",
  "Cross-Origin-Opener-Policy": "same-origin",
  "Cross-Origin-Embedder-Policy": "credentialless",
  "Cross-Origin-Resource-Policy": "same-origin",
  "X-Content-Type-Options": "nosniff",
  "Referrer-Policy": "strict-origin-when-cross-origin",
  "Strict-Transport-Security": "max-age=31536000; includeSubDomains",
  Vary: "Accept-Encoding",
};

// Link-preview fetchers. iMessage asks as facebookexternalhit and Twitterbot.
const PREVIEW_BOT = /facebookexternalhit|facebookcatalog|meta-externalagent|Twitterbot|Slackbot|Discordbot|WhatsApp|TelegramBot|LinkedInBot|SkypeUriPreview|Teams|redditbot|Pinterest|Embedly|vkShare|Mastodon|Bluesky|Iframely|Google-PageRenderer|Applebot|Line\//i;
const INVITE_CARD = "/invite-card.jpg";

async function invitePreview(env, token) {
  const api = (env.API_URL ?? "https://api.casama.ai").replace(/\/$/, "");
  try {
    const res = await fetch(`${api}/v1/join/preview?invite=${encodeURIComponent(token)}`, {
      headers: { Accept: "application/json" },
      signal: AbortSignal.timeout(1500),
    });
    return res.ok ? await res.json() : null;
  } catch {
    return null;
  }
}

/** The app's page for /join/<token>, with the invite's share card. */
async function joinPage(request, env, token) {
  const url = new URL(request.url);
  const page = await env.ASSETS.fetch(new Request(new URL("/index.html", url), request));
  if (!page.ok) return page;
  const preview = PREVIEW_BOT.test(request.headers.get("User-Agent") ?? "") ? await invitePreview(env, token) : null;
  const workspace = String(preview?.workspace?.name ?? "").trim().slice(0, 80);
  const inviter = String(preview?.inviter_name ?? "").trim().slice(0, 60);
  const title = workspace
    ? inviter ? `${inviter} invited you to ${workspace} on Casama` : `Join ${workspace} on Casama`
    : "You’re invited to Casama";
  const description = "Casama: AI teammates with their own computers. Open the link to join.";
  const image = `${url.origin}${INVITE_CARD}`;
  const set = (value) => ({ element: (el) => el.setAttribute("content", value) });
  const out = new HTMLRewriter()
    .on('meta[property="og:title"], meta[name="twitter:title"]', set(title))
    .on('meta[property="og:description"], meta[name="twitter:description"]', set(description))
    .on('meta[property="og:image"], meta[name="twitter:image"]', set(image))
    .on('meta[property="og:image:alt"], meta[name="twitter:image:alt"]', set("You’re invited to Casama: AI teammates with their own computers."))
    .on('meta[property="og:url"]', set(`${url.origin}${url.pathname}`))
    .transform(page);
  const headers = new Headers(out.headers);
  for (const [k, v] of Object.entries(HEADERS)) if (!headers.has(k)) headers.set(k, v);
  headers.set("X-Frame-Options", "DENY");
  headers.set("Cache-Control", "no-store");
  return new Response(out.body, { status: 200, headers });
}

export default {
  async fetch(request, env, ctx) {
    const path = new URL(request.url).pathname;
    const join = /^\/join\/([A-Za-z0-9_-]{6,80})\/?$/.exec(path);
    if (join && (request.method === "GET" || request.method === "HEAD")) return joinPage(request, env, join[1]);
    const entry = large[path];
    if (!entry) return env.ASSETS.fetch(request);
    if (request.method !== "GET" && request.method !== "HEAD") {
      return new Response(null, { status: 405, headers: { Allow: "GET, HEAD" } });
    }

    const etag = `"${entry.hash}"`;
    const headers = new Headers({ ...HEADERS, "Content-Type": entry.type, ETag: etag });
    const seen = (request.headers.get("If-None-Match") ?? "").split(",").map((t) => t.trim().replace(/^W\//, ""));
    if (seen.includes(etag) || seen.includes("*")) return new Response(null, { status: 304, headers });

    const accept = request.headers.get("Accept-Encoding") ?? "";
    const [suffix, encoding] = /\bbr\b/.test(accept) ? [".br", "br"] : /\bgzip\b/.test(accept) ? [".gz", "gzip"] : ["", null];
    const key = entry.key + suffix;

    // Keys never change content, so each data centre keeps its copy; R2 is read once per place.
    // Cached without Content-Encoding so the cache stores the bytes exactly as uploaded.
    const cache = caches.default;
    const cacheKey = new Request(`https://casama-app-large.internal/${key}`);
    let body = null;
    let length = null;
    const hit = await cache.match(cacheKey);
    if (hit) {
      body = hit.body;
      length = hit.headers.get("Content-Length");
    } else {
      const object = await env.LARGE.get(key);
      if (!object) return new Response("Not found", { status: 404 });
      const [toClient, toCache] = object.body.tee();
      body = toClient;
      length = String(object.size);
      ctx.waitUntil(
        cache.put(
          cacheKey,
          new Response(toCache, {
            headers: { "Content-Type": "application/octet-stream", "Content-Length": length, "Cache-Control": "public, max-age=31536000, immutable" },
          }),
        ),
      );
    }

    if (encoding) headers.set("Content-Encoding", encoding);
    if (length) headers.set("Content-Length", length);
    if (request.method === "HEAD") {
      body?.cancel();
      body = null;
    }
    return new Response(body, { headers, encodeBody: encoding ? "manual" : "automatic" });
  },
};
