/**
 * Theme preference (B26): System (default), Light, or Dark.
 * Sets `data-theme` on `<html>` and listens for changes across extension pages.
 */
import { getSettings, type ThemeMode } from "./settings.ts";

export function applyTheme(theme: ThemeMode | undefined) {
  if (typeof document === "undefined") return;
  const root = document.documentElement;
  if (theme === "light" || theme === "dark") root.dataset.theme = theme;
  else delete root.dataset.theme;
}

export function initTheme() {
  void getSettings()
    .then((s) => applyTheme(s.theme))
    .catch(() => {});
  if (typeof chrome !== "undefined" && chrome.storage?.onChanged) {
    chrome.storage.onChanged.addListener((changes, area) => {
      if (area !== "local" || !changes.settings) return;
      const next = changes.settings.newValue as { theme?: ThemeMode } | undefined;
      applyTheme(next?.theme);
    });
  }
}
