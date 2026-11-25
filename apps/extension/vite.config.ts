/**
 * Builds Casama for Chrome into dist/<mode> (D-323): `vite build --mode dev`, `--mode store` or
 * `--mode e2e`; Phase 5 adds `--mode firefox` (Firefox's store build, plan §13) and
 * `--mode firefox-e2e` (its end-to-end build). Edge takes the store build as it is.
 * The manifest is written from src/manifest.ts with the version from package.json.
 */
import { existsSync, readFileSync, rmSync } from "node:fs";
import { resolve } from "node:path";
import { build, defineConfig, type Plugin } from "vite";
import { type Browser, buildManifest, type Target } from "./src/manifest.ts";

const pkg = JSON.parse(readFileSync(new URL("./package.json", import.meta.url), "utf8")) as {
  version: string;
};

/** Official store builds read public DSN/key from client/config/telemetry.json (gitignored; D-539). */
function officialTelemetry(target: Target): {
  sentryDsn: string;
  posthogKey: string;
  posthogHost: string;
} {
  if (target !== "store" || process.env.CASAMA_OFFICIAL_BUILD !== "1") {
    return { sentryDsn: "", posthogKey: "", posthogHost: "" };
  }
  const file = resolve(import.meta.dirname, "../../client/config/telemetry.json");
  if (!existsSync(file)) return { sentryDsn: "", posthogKey: "", posthogHost: "" };
  try {
    const raw = JSON.parse(readFileSync(file, "utf8")) as Record<string, unknown>;
    if (raw.ERROR_REPORTING === "none") return { sentryDsn: "", posthogKey: "", posthogHost: "" };
    return {
      sentryDsn: typeof raw.SENTRY_DSN === "string" ? raw.SENTRY_DSN : "",
      posthogKey: typeof raw.POSTHOG_API_KEY === "string" ? raw.POSTHOG_API_KEY : "",
      posthogHost:
        typeof raw.POSTHOG_HOST === "string" ? raw.POSTHOG_HOST : "https://us.i.posthog.com",
    };
  } catch {
    return { sentryDsn: "", posthogKey: "", posthogHost: "" };
  }
}

function manifest(target: Target, browser: Browser): Plugin {
  return {
    name: "casama-manifest",
    generateBundle() {
      this.emitFile({
        type: "asset",
        fileName: "manifest.json",
        source: `${JSON.stringify(buildManifest(target, pkg.version, browser), null, 2)}\n`,
      });
    },
  };
}

/**
 * The page kit (src/content/kit.ts) is a content script, which Chrome runs as a classic script: it
 * is built on its own, as one self-contained IIFE, into content.js next to the rest.
 */
function contentScript(target: Target, browser: Browser, outDir: string, minify: boolean): Plugin {
  return {
    name: "casama-content-script",
    apply: "build",
    async closeBundle() {
      await build({
        configFile: false,
        logLevel: "warn",
        define: {
          __CASAMA_TARGET__: JSON.stringify(target === "e2e" ? "dev" : target),
          __CASAMA_BROWSER__: JSON.stringify(browser),
        },
        build: {
          outDir,
          emptyOutDir: false,
          target: esTarget(browser),
          minify,
          sourcemap: false,
          lib: {
            entry: resolve(import.meta.dirname, "src/content/kit.ts"),
            formats: ["iife"],
            name: "casamaKit",
            fileName: () => "content.js",
          },
        },
      });
    },
  };
}

/**
 * Firefox and Safari don't use Chrome's managed_schema.json, so those builds leave it out.
 */
function withoutManaged(outDir: string): Plugin {
  return {
    name: "casama-no-managed",
    apply: "build",
    closeBundle: () => rmSync(resolve(outDir, "managed_schema.json"), { force: true }),
  };
}

const esTarget = (browser: Browser) =>
  browser === "firefox" ? "firefox140" : browser === "safari" ? "safari17" : "chrome116";

export default defineConfig(({ mode }) => {
  const isOpera = mode === "opera";
  const browser: Browser = mode.startsWith("firefox")
    ? "firefox"
    : mode.startsWith("safari")
      ? "safari"
      : "chromium";
  const base =
    browser === "firefox"
      ? mode.slice("firefox".length).replace(/^-/, "")
      : browser === "safari"
        ? mode.slice("safari".length).replace(/^-/, "")
        : isOpera
          ? "store"
          : mode;
  const target: Target = base === "e2e" ? "e2e" : base === "dev" ? "dev" : "store";
  const validModes = [
    "store",
    "opera",
    "e2e",
    "dev",
    "firefox",
    "firefox-e2e",
    "firefox-dev",
    "safari",
    "safari-e2e",
    "safari-dev",
  ];
  if (!validModes.includes(mode)) throw new Error(`unknown build mode ${mode}`);
  const outDir = resolve(import.meta.dirname, "dist", mode);
  const telemetry = officialTelemetry(target);
  // Chrome/Edge store builds are minified; Opera (strict review rule), Firefox, and Safari stay readable.
  const shouldMinify = target === "store" && browser === "chromium" && !isOpera;
  return {
    root: resolve(import.meta.dirname, "src"),
    publicDir: resolve(import.meta.dirname, "public"),
    base: "",
    define: {
      // The e2e build behaves as the dev build; only its manifest differs.
      __CASAMA_TARGET__: JSON.stringify(target === "e2e" ? "dev" : target),
      __CASAMA_VERSION__: JSON.stringify(pkg.version),
      __CASAMA_BROWSER__: JSON.stringify(browser),
      __CASAMA_SENTRY_DSN__: JSON.stringify(telemetry.sentryDsn),
      __CASAMA_POSTHOG_KEY__: JSON.stringify(telemetry.posthogKey),
      __CASAMA_POSTHOG_HOST__: JSON.stringify(telemetry.posthogHost),
    },
    plugins: [
      manifest(target, browser),
      contentScript(target, browser, outDir, shouldMinify),
      ...(browser !== "chromium" ? [withoutManaged(outDir)] : []),
    ],
    build: {
      outDir,
      emptyOutDir: true,
      target: esTarget(browser),
      minify: shouldMinify,
      // Chrome store builds emit hidden sourcemaps so build-extension.sh can upload them to Sentry
      // and PostHog, then deletes every .map file before zipping (D-539).
      sourcemap: target !== "store" ? true : shouldMinify ? "hidden" : false,
      modulePreload: false,
      rollupOptions: {
        input: {
          options: resolve(import.meta.dirname, "src/options/options.html"),
          panel: resolve(import.meta.dirname, "src/panel/panel.html"),
          // Act's ask page and the offscreen audio page: Chromium only.
          ...(browser !== "chromium"
            ? {}
            : {
                offscreen: resolve(import.meta.dirname, "src/offscreen/offscreen.html"),
                ask: resolve(import.meta.dirname, "src/act/ask.html"),
              }),
          live: resolve(import.meta.dirname, "src/live/live.html"),
          background: resolve(import.meta.dirname, "src/background/index.ts"),
        },
        output: {
          entryFileNames: (chunk) =>
            chunk.name === "background" ? "background.js" : "assets/[name]-[hash].js",
          chunkFileNames: "assets/[name]-[hash].js",
          assetFileNames: "assets/[name]-[hash][extname]",
        },
      },
    },
  };
});
