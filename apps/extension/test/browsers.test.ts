/**
 * Phase 5 (plan §13): Edge takes the Chrome package as it is; Firefox gets its own manifest from
 * the same code, without Act or the browser as a device.
 */
import { describe, expect, it } from "vitest";
import { browserName, FEATURES, productName, shortcutsUrl } from "../src/lib/browser.ts";
import {
  buildManifest,
  FIREFOX_ANDROID_MIN_VERSION,
  FIREFOX_MIN_VERSION,
  GECKO_ID,
} from "../src/manifest.ts";

const EDGE =
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0";
const OPERA =
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 OPR/120.0.0.0";
const CHROME =
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36";
const FIREFOX =
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:145.0) Gecko/20100101 Firefox/145.0";
const SAFARI =
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Safari/605.1.15";

describe("which browser", () => {
  it("names Chrome, Edge, Opera, Firefox and Safari from the user agent", () => {
    expect(browserName(CHROME)).toBe("Chrome");
    expect(browserName(EDGE)).toBe("Edge");
    expect(browserName(OPERA)).toBe("Opera");
    expect(browserName(FIREFOX)).toBe("Firefox");
    expect(browserName(SAFARI)).toBe("Safari");
    expect(productName("Edge")).toBe("Casama for Edge");
    expect(productName("Opera")).toBe("Casama for Opera");
    expect(productName("Safari")).toBe("Casama for Safari");
  });

  it("sends people to each browser's shortcut settings", () => {
    expect(shortcutsUrl("Chrome")).toBe("chrome://extensions/shortcuts");
    expect(shortcutsUrl("Edge")).toBe("edge://extensions/shortcuts");
    expect(shortcutsUrl("Opera")).toBe("opera://extensions/shortcuts");
    expect(shortcutsUrl("Firefox")).toBe("about:addons");
    expect(shortcutsUrl("Safari")).toBe("");
  });

  it("keeps every Chromium feature enabled in the Chromium build (this test run is one)", () => {
    expect(FEATURES.act).toBe(true);
    expect(FEATURES.device).toBe(true);
    expect(FEATURES.record).toBe(true);
    expect(FEATURES.readingList).toBe(true);
    expect(FEATURES.webAppSignIn).toBe(true);
    expect(FEATURES.providerSignIn).toBe(true);
    expect(FEATURES.notificationButtons).toBe(true);
    expect(FEATURES.pageKit).toBe(true);
    expect(FEATURES.nativeAppSignIn).toBe(false);
    expect(FEATURES.popOutWindow).toBe(false);
  });
});

describe("Firefox's manifest", () => {
  const m = buildManifest("store", "0.1.0", "firefox") as unknown as Record<string, unknown> & {
    permissions: string[];
    optional_permissions: string[];
    commands: Record<string, { description?: string }>;
    browser_specific_settings: {
      gecko: {
        id: string;
        strict_min_version: string;
        data_collection_permissions: { required: string[]; optional: string[] };
      };
      gecko_android: {
        strict_min_version: string;
      };
    };
  };

  it("has the sidebar and a background script, not the side panel and a service worker", () => {
    expect(m.sidebar_action).toMatchObject({ default_panel: "panel/panel.html" });
    expect(m.side_panel).toBeUndefined();
    expect(m.background).toEqual({ scripts: ["background.js"], type: "module" });
    expect(m.options_ui).toEqual({ page: "options/options.html", open_in_tab: true });
    expect(m.options_page).toBeUndefined();
  });

  it("asks for nothing Act, the device or Chrome-only APIs need", () => {
    for (const p of ["debugger", "tabGroups", "tabCapture", "sidePanel", "offscreen", "gcm"])
      expect(m.permissions).not.toContain(p);
    expect(m.permissions).toContain("identity");
    expect(m.optional_permissions).toEqual(["tabs", "bookmarks"]);
    expect(m.host_permissions).toBeUndefined();
    expect(m.optional_host_permissions).toEqual(["https://*/*", "http://*/*"]);
    // Firefox has no externally_connectable, no managed schema for Act's settings, and no key.
    expect(m.externally_connectable).toBeUndefined();
    expect(m.storage).toBeUndefined();
    expect(m.key).toBeUndefined();
    expect(m.minimum_chrome_version).toBeUndefined();
  });

  it("carries Firefox's id, its minimum version and the data it says it sends", () => {
    const gecko = m.browser_specific_settings.gecko;
    expect(gecko.id).toBe(GECKO_ID);
    expect(gecko.strict_min_version).toBe(FIREFOX_MIN_VERSION);
    expect(gecko.data_collection_permissions.required).toEqual([
      "authenticationInfo",
      "personalCommunications",
      "websiteContent",
    ]);
    expect(gecko.data_collection_permissions.optional).toEqual([
      "bookmarksInfo",
      "technicalAndInteraction",
    ]);
    expect(m.browser_specific_settings.gecko_android.strict_min_version).toBe(
      FIREFOX_ANDROID_MIN_VERSION,
    );
  });

  it("opens the sidebar from the first shortcut", () => {
    expect(Object.keys(m.commands)).toEqual([
      "_execute_sidebar_action",
      "ask-selection",
      "screenshot",
      "save-page",
    ]);
    expect(m.commands._execute_sidebar_action?.description).toBe("Open Casama");
  });

  it("gives the e2e build its permissions up front, as Chrome's e2e build has", () => {
    const e2e = buildManifest("e2e", "0.1.0", "firefox");
    expect(e2e.host_permissions).toEqual(["<all_urls>"]);
    expect(e2e.permissions).toContain("tabs");
    expect(e2e.name).toBe("Casama (dev)");
  });
});

describe("Safari's manifest", () => {
  const m = buildManifest("store", "0.2.1", "safari") as unknown as Record<string, unknown> & {
    permissions: string[];
    optional_permissions: string[];
    action: { default_popup?: string };
    background: { service_worker?: string; type?: string };
  };

  it("uses toolbar popover and nativeMessaging without Chromium-only APIs", () => {
    expect(m.action.default_popup).toBe("panel/panel.html");
    expect(m.side_panel).toBeUndefined();
    expect(m.sidebar_action).toBeUndefined();
    expect(m.background).toEqual({ service_worker: "background.js", type: "module" });
    expect(m.permissions).toContain("nativeMessaging");
    for (const p of [
      "debugger",
      "tabGroups",
      "tabCapture",
      "sidePanel",
      "offscreen",
      "gcm",
      "identity",
      "unlimitedStorage",
    ]) {
      expect(m.permissions).not.toContain(p);
    }
    expect(m.optional_permissions).toEqual(["tabs"]);
    expect(m.externally_connectable).toBeUndefined();
    expect(m.storage).toBeUndefined();
    expect(m.key).toBeUndefined();
  });
});

describe("Edge and Opera", () => {
  it("take the Chromium store manifest as it is", () => {
    expect(buildManifest("store", "0.1.0", "chromium")).toEqual(buildManifest("store", "0.1.0"));
  });
});
