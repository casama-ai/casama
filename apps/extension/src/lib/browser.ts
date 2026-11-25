/**
 * Which browser this is, and what it can do (D-323 Phase 5, plan §13).
 *
 * - **Chrome** and the browsers built on it (Brave, Arc, Vivaldi, Opera) run the store build.
 * - **Edge** runs the same package from Edge Add-ons. It has the side panel, the debugger and tab
 *   capture, but no `chrome.gcm`, so approval notifications come from the minute check instead of pushes.
 * - **Firefox** gets its own build (`vite build --mode firefox`): Ask, Capture and Stay in the
 *   loop only, without the page kit (see [FEATURES.pageKit]). It has no debugger API (no Act), no side panel (its sidebar instead), no tab
 *   capture, no offscreen documents, no reading list, and no `externally_connectable` (no sign-in
 *   handed over from the web app). The browser as a device (E2–E7) stays with Chrome and Edge.
 */

export const IS_FIREFOX = __CASAMA_BROWSER__ === "firefox";
export const IS_SAFARI = __CASAMA_BROWSER__ === "safari";
export const IS_CHROMIUM = __CASAMA_BROWSER__ === "chromium";

export type BrowserName = "Chrome" | "Edge" | "Opera" | "Firefox" | "Safari";

/** The browser's name, for words people read ("Edge didn't give the permission"). */
export function browserName(
  userAgent: string = globalThis.navigator?.userAgent ?? "",
): BrowserName {
  if (IS_FIREFOX || /\bFirefox\//.test(userAgent)) return "Firefox";
  if (IS_SAFARI) return "Safari";
  if (/\bEdg\//.test(userAgent)) return "Edge";
  if (/\bOPR\//.test(userAgent)) return "Opera";
  if (/\bSafari\//.test(userAgent) && !/\b(?:Chrome|Chromium|CriOS)\//.test(userAgent))
    return "Safari";
  return "Chrome";
}

/** What this build can offer. Each one hides its buttons and settings where it's false. */
export const FEATURES = {
  /** C: bots in your own browser (the debugger and tab groups). */
  act: IS_CHROMIUM,
  /** E2–E7: this browser as a device source (Realtime requests, triggers, recap, captions). */
  device: IS_CHROMIUM,
  /** B12: record this tab. */
  record: IS_CHROMIUM,
  /** B11's reading list. */
  readingList: IS_CHROMIUM,
  /** E1: the web app hands the extension a sign-in (`externally_connectable`). */
  webAppSignIn: IS_CHROMIUM,
  /** Safari: one-tap sign-in handover from the host Casama Mac/iOS app via sendNativeMessage. */
  nativeAppSignIn: IS_SAFARI,
  /** Safari: pop-out companion window button in the popover header on macOS. */
  popOutWindow: IS_SAFARI,
  /** Google and Apple sign-in (identity.launchWebAuthFlow); Chrome, Edge, Opera and Firefox. */
  providerSignIn: !IS_SAFARI,
  /** D2: Approve and Deny buttons on notifications (Firefox and Safari show no buttons). */
  notificationButtons: IS_CHROMIUM,
  /**
   * A12–A20, B6–B9: the page kit (selection bar, write button, site helpers, highlights). Its
   * content script runs only when storage is closed to content scripts, and Firefox/Safari can't
   * close it (no `storage.local.setAccessLevel`), so the refresh token would be readable from pages.
   */
  pageKit: IS_CHROMIUM,
} as const;

/** Where people change the extension's keyboard shortcuts. */
export function shortcutsUrl(name: BrowserName = browserName()): string {
  if (name === "Firefox") return "about:addons";
  if (name === "Edge") return "edge://extensions/shortcuts";
  if (name === "Opera") return "opera://extensions/shortcuts";
  if (name === "Safari") return "";
  return "chrome://extensions/shortcuts";
}

/** Opens the browser's keyboard shortcut settings (Firefox uses its own API; Chromium browsers open a tab). */
export async function openShortcuts(): Promise<void> {
  const commands = chrome.commands as typeof chrome.commands & {
    openShortcutSettings?: () => Promise<void>;
  };
  if (IS_FIREFOX && commands.openShortcutSettings) return commands.openShortcutSettings();
  const url = shortcutsUrl();
  if (!url) return;
  await chrome.tabs.create({ url });
}

/** Firefox's sidebar, where Chrome and Edge have the side panel. */
type SidebarAction = { open(): Promise<void>; toggle?(): Promise<void> };
export function sidebarAction(): SidebarAction | undefined {
  const g = globalThis as unknown as {
    browser?: { sidebarAction?: SidebarAction };
    chrome?: { sidebarAction?: SidebarAction };
  };
  return g.browser?.sidebarAction ?? g.chrome?.sidebarAction;
}

/** "Casama for Chrome", "Casama for Edge" or "Casama for Firefox". */
export function productName(name: BrowserName = browserName()): string {
  return `Casama for ${name}`;
}
