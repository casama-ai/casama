/**
 * Card actions the extension handles locally (B1, mirrors client/lib/features/chat/local_actions.dart):
 * `app:route`, `app:connect`, `app:invite`, `app:appearance`. Never sent to the chat as a message.
 */
import type { UiAction } from "./cards.ts";
import { updateSettings } from "./settings.ts";
import { applyTheme } from "./theme.ts";
import { appUrl, type Here } from "./workspace.ts";

export interface LocalActionHooks {
  onToast?: (text: string) => void;
  openTab?: (url: string) => void | Promise<void>;
  copyText?: (text: string) => Promise<void>;
  /** Optional Phase 2+ handler for inline app/MCP server connection. */
  onConnectServer?: (
    action: UiAction,
    offered: Record<string, unknown>,
  ) => Promise<boolean> | boolean;
  onConnectApp?: (action: UiAction, appId: string) => Promise<boolean> | boolean;
}

export function isLocalUiAction(name: string): boolean {
  return name.startsWith("app:");
}

export async function handleLocalUiAction(
  here: Here,
  action: UiAction,
  hooks: LocalActionHooks = {},
): Promise<boolean> {
  if (!isLocalUiAction(action.name)) return false;
  const ctx = action.context ?? {};
  const open =
    hooks.openTab ??
    ((url: string) => {
      void chrome.tabs.create({ url });
    });
  const notify = hooks.onToast ?? (() => {});
  const copy = hooks.copyText ?? ((t: string) => navigator.clipboard.writeText(t));

  switch (action.name) {
    case "app:route": {
      // Offered MCP server (D-473): delegated to inline connector when available.
      if (
        hooks.onConnectServer &&
        typeof ctx.server === "object" &&
        ctx.server !== null &&
        (await hooks.onConnectServer(action, ctx.server as Record<string, unknown>))
      ) {
        return true;
      }
      if (
        hooks.onConnectServer &&
        (typeof ctx.server_url === "string" || typeof ctx.command === "string") &&
        (await hooks.onConnectServer(action, ctx))
      ) {
        return true;
      }
      const path = ctx.path;
      if (typeof path === "string" && path.startsWith("/")) {
        const provider = ctx.provider;
        const sep = path.includes("?") ? "&" : "?";
        const target =
          typeof provider === "string" && provider && provider !== "chatgpt"
            ? `${path}${sep}provider=${encodeURIComponent(provider)}`
            : path;
        await open(appUrl(here.account, target));
      }
      return true;
    }

    case "app:connect": {
      const appId = typeof ctx.app === "string" ? ctx.app : "";
      if (appId && hooks.onConnectApp && (await hooks.onConnectApp(action, appId))) {
        return true;
      }
      const target = appId
        ? `/settings/integrations?connect=${encodeURIComponent(appId)}`
        : "/settings/integrations";
      await open(appUrl(here.account, target));
      return true;
    }

    case "app:invite": {
      try {
        const invite = await here.api.unwrap(
          here.api.GET("/v1/orgs/{id}/default-invite", {
            params: { path: { id: here.org.id } },
            signal: AbortSignal.timeout(15_000),
          }),
        );
        const url = (invite as { url?: string }).url;
        if (url) {
          await copy(url);
          notify("Invite link copied.");
        } else {
          await open(appUrl(here.account, "/settings/members"));
        }
      } catch (e) {
        notify((e as Error)?.message || "Couldn't get the invite link.");
      }
      return true;
    }

    case "app:appearance": {
      const mode = ctx.theme ?? ctx.mode ?? ctx.brightness;
      if (mode === "light" || mode === "dark" || mode === "system") {
        await updateSettings((s) => {
          s.theme = mode;
        });
        applyTheme(mode);
        notify(`Switched to ${mode} theme.`);
      } else {
        await open(appUrl(here.account, "/settings/appearance"));
        notify("Opened Appearance in Casama.");
      }
      return true;
    }

    default:
      return true;
  }
}
