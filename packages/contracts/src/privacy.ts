import { z } from "@hono/zod-openapi";

export const DeleteAccountRequest = z
  .object({
    confirm_email: z.email().openapi({ description: "The account's email, to confirm" }),
  })
  .openapi("DeleteAccountRequest");

export const AccountDeletion = z
  .object({
    purge_after: z.iso.datetime({ offset: true }),
    workspaces_deleted: z
      .array(z.string())
      .openapi({ description: "Workspaces you are the only owner of; they are deleted with you" }),
  })
  .openapi("AccountDeletion");

export const AppleSignInTokenRequest = z
  .object({
    authorization_code: z.string().min(1).max(2000).optional().openapi({
      description:
        "The one-time authorization code from Apple's system sheet (iOS and macOS); the server swaps it for a refresh token",
    }),
    refresh_token: z.string().min(1).max(2000).optional().openapi({
      description:
        "Apple's refresh token from the browser sign-in (Supabase Auth's provider_refresh_token)",
    }),
  })
  .refine((b) => !!b.authorization_code !== !!b.refresh_token, {
    message: "Send authorization_code or refresh_token",
  })
  .openapi("AppleSignInTokenRequest");

export const AppleSignInTokenResult = z
  .object({
    stored: z.boolean().openapi({
      description: "False when this server doesn't revoke Apple tokens (no Sign in with Apple key)",
    }),
  })
  .openapi("AppleSignInTokenResult");

export const OrgSettings = z
  .object({
    run_event_retention_days: z.number().int().min(7).max(3650),
    require_mfa: z.boolean().openapi({
      description:
        "Owners and admins must use two-step sign-in (turning it on needs an aal2 session)",
    }),
    require_app_lock: z.boolean().optional().openapi({
      description:
        "Members must turn on the app lock (Face ID, fingerprint, the device passcode, Windows Hello, a PIN or a passkey) before the app shows the workspace",
    }),
    mcp_decide_approvals: z.boolean().openapi({
      description: "Allow approving or denying actions from AI apps connected over MCP",
    }),
    full_access: z.boolean().optional().openapi({
      description:
        "Full access (D-394): every bot acts without asking first. Payments, password and two-step changes and the workspace's own ask and hand-off rules still apply",
    }),
    allow_bot_to_bot: z.boolean().openapi({
      description: "Bots may @mention, message and delegate to each other; subagents always work",
    }),
    a2a_enabled: z.boolean().openapi({
      description:
        "Bots the workspace chooses can be published as A2A agents, reachable with workspace API keys",
    }),
    llm_tracing: z.boolean().openapi({
      description:
        "Send model calls to the server's Langfuse, secrets redacted; no effect without Langfuse",
    }),
    analytics_opt_out: z.boolean().optional().openapi({
      description: "Disable usage analytics collection and rollups for this workspace",
    }),
    chrome_extension: z.boolean().optional().openapi({
      description: "Members may use Casama for Chrome with this workspace (D-323 G9)",
    }),
    chrome_act: z.boolean().optional().openapi({
      description: "Bots may work in members' own browsers (Act, D-323 G9)",
    }),
    app_browser: z.boolean().optional().openapi({
      description: "Bots may use the browser inside members' phone apps",
    }),
    chrome_blocked_sites: z
      .array(z.string().min(1).max(253))
      .max(500)
      .optional()
      .openapi({ description: "Sites bots may never act on in members' browsers" }),
  })
  .openapi("OrgSettings");

export const UpdateOrgSettingsRequest = OrgSettings.partial().openapi("UpdateOrgSettingsRequest");

export const SetAnalyticsOptOutRequest = z
  .object({
    opt_out: z.boolean().openapi({ description: "True to opt out of usage analytics" }),
  })
  .openapi("SetAnalyticsOptOutRequest");

/** One product event the desktop app relays to Google Analytics 4 through the server (D-399). */
export const RelayedAnalyticsEvent = z
  .object({
    name: z
      .string()
      .regex(/^[a-z][a-z0-9_]{0,39}$/)
      .openapi({ description: "A catalog event the app may send, or screen_view" }),
    properties: z.record(z.string(), z.unknown()).optional().openapi({
      description: "Catalog properties: strings, numbers or booleans; anything else is dropped",
    }),
  })
  .openapi("RelayedAnalyticsEvent");

export const RelayAnalyticsRequest = z
  .object({
    platform: z.enum(["windows", "linux", "extension"]),
    events: z.array(RelayedAnalyticsEvent).min(1).max(25),
  })
  .openapi("RelayAnalyticsRequest");

/** First-touch signup attribution recorded once per account (D-533, docs/ANALYTICS-V2-PLAN.md). */
export const SetAttributionRequest = z
  .object({
    platform: z
      .enum(["ios", "android", "macos", "windows", "linux", "web", "extension"])
      .optional(),
    source: z.string().trim().max(80).optional(),
    medium: z.string().trim().max(60).optional(),
    campaign: z.string().trim().max(100).optional(),
    landing: z.string().trim().max(120).optional(),
    /** This install's random id (D-537): joins the app's first open to the account. */
    install_id: z
      .string()
      .regex(/^[A-Za-z0-9_-]{8,64}$/)
      .optional(),
  })
  .openapi("SetAttributionRequest");

/** Declared Age Range band (docs/APPLE-INTEGRATIONS-PLAN.md §5.2): never stores a birth date. */
export const AccountAgeBand = z
  .enum(["under13", "13to15", "16to17", "18plus", "declined"])
  .openapi("AccountAgeBand");
export type AccountAgeBand = z.infer<typeof AccountAgeBand>;

export const SetAgeBandRequest = z
  .object({
    age_band: AccountAgeBand,
  })
  .openapi("SetAgeBandRequest");

export const AgeBandResult = z
  .object({
    /** The band that applies now, which may not be the one sent (see setMyAgeBand). */
    account_age_band: AccountAgeBand,
    account_age_band_updated_at: z.iso.datetime({ offset: true }),
    accepted: z.boolean().optional().openapi({
      description:
        "Whether the band sent was saved; account_age_band is the band in force either way. A higher band is saved only one step at a time and only once the current band is 30 days old; declining keeps a band already known. Always sent; missing only from servers before this rule, which saved every band.",
    }),
  })
  .openapi("AgeBandResult");
