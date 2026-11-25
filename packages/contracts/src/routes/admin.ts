import { createRoute, z } from "@hono/zod-openapi";
import {
  AbuseEvent,
  AddAdminDeviceKeyRequest,
  AdminAttention,
  AdminBotSetting,
  AdminCheck,
  AdminCreditPack,
  AdminDeviceChallenge,
  AdminDeviceChallengeRequest,
  AdminDeviceCheckRequest,
  AdminDeviceKey,
  AdminDeviceKeyList,
  AdminGrowth,
  AdminInactivity,
  AdminLiveGa4,
  AdminLiveOnline,
  AdminMailAddress,
  AdminMailReservedNames,
  AdminMargin,
  AdminModelAccess,
  AdminOrg,
  AdminOverview,
  AdminPasskeyCheckRequest,
  AdminPinCheckRequest,
  AdminPinState,
  AdminPlan,
  AdminPricing,
  AdminService,
  AdminUser,
  BillingSettings,
  CloudModels,
  ConnectionSettings,
  DecisionResults,
  DecisionSettings,
  ReportedCreation,
  ResumeWorkspaceMailResponse,
  SaveCreditPackRequest,
  SavePlanRequest,
  ServerCapacity,
  SetAdminBotRequest,
  SetAdminPinRequest,
  SetConnectionSettingsRequest,
  SetInactivityRequest,
  SetMailAddressStatusRequest,
  SetOrgLimitsRequest,
  SetUserKeepRequest,
  SetUserTeamRequest,
  SuspendOrgRequest,
  UpdateNotice,
} from "../admin.ts";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";
import { AdminCostKey, AdminCosts, AdminCostsQuery } from "../costs.ts";
import { AdminVendor, VendorSettings } from "../vendors.ts";

const security = [{ bearerAuth: [] }];
const { 401: e401, 403: e403, 404: e404 } = problemResponses;
const get = <T extends z.ZodType>(operationId: string, path: string, summary: string, schema: T) =>
  createRoute({
    operationId,
    method: "get",
    path,
    tags: ["admin"],
    security,
    summary,
    responses: { 200: jsonResponse(summary, schema), 401: e401, 403: e403 },
  });

export const adminOverview = get(
  "adminOverview",
  "/v1/admin/overview",
  "Instance totals (owner only)",
  AdminOverview,
);
export const adminAttention = get(
  "adminAttention",
  "/v1/admin/attention",
  "What waits for the owner in each admin section, as counts (owner only)",
  AdminAttention,
);
export const adminMargin = createRoute({
  operationId: "adminMargin",
  method: "get",
  path: "/v1/admin/margin",
  tags: ["admin"],
  security,
  summary: "Usage charged against what it cost the server (owner only)",
  request: {
    query: z.object({ days: z.coerce.number().int().min(1).max(90).optional() }),
  },
  responses: {
    200: jsonResponse("Usage charged against its cost", AdminMargin),
    401: e401,
    403: e403,
  },
});
export const adminUsers = get(
  "adminUsers",
  "/v1/admin/users",
  "Everyone on this instance",
  z.object({ items: z.array(AdminUser) }).openapi("AdminUserList"),
);
// Inactive accounts (docs/INACTIVE-ACCOUNTS-PLAN.md): the steps' modes, the last run, the
// announcement, and keeping one account whatever happens.
export const adminInactivity = get(
  "adminInactivity",
  "/v1/admin/inactivity",
  "Inactive-account steps and the last daily run (owner only)",
  AdminInactivity,
);
export const setAdminInactivity = createRoute({
  operationId: "setAdminInactivity",
  method: "put",
  path: "/v1/admin/inactivity",
  tags: ["admin"],
  security,
  summary: "Set the inactive-account steps' modes (owner only)",
  request: { body: jsonBody(SetInactivityRequest) },
  responses: { 200: jsonResponse("Saved", AdminInactivity), 401: e401, 403: e403 },
});
export const announceInactivity = createRoute({
  operationId: "announceInactivity",
  method: "post",
  path: "/v1/admin/inactivity/announce",
  tags: ["admin"],
  security,
  summary: "Email every account the inactive-account rule, once (owner only)",
  responses: {
    200: jsonResponse(
      "Queued",
      z
        .object({ queued: z.number().int(), settings: AdminInactivity })
        .openapi("AnnounceInactivityResult"),
    ),
    401: e401,
    403: e403,
  },
});
export const setUserKeep = createRoute({
  operationId: "setUserKeep",
  method: "put",
  path: "/v1/admin/users/{id}/keep",
  tags: ["admin"],
  security,
  summary: "Keep an account whatever the inactive-account steps say (owner only)",
  request: { params: z.object({ id: Uuid }), body: jsonBody(SetUserKeepRequest) },
  responses: { 200: jsonResponse("Saved", AdminUser), 401: e401, 403: e403, 404: e404 },
});
export const setUserTeam = createRoute({
  operationId: "setUserTeam",
  method: "put",
  path: "/v1/admin/users/{id}/team",
  tags: ["admin"],
  security,
  summary: "Count an account as team, leaving it out of Growth (owner only)",
  request: { params: z.object({ id: Uuid }), body: jsonBody(SetUserTeamRequest) },
  responses: { 200: jsonResponse("Saved", AdminUser), 401: e401, 403: e403, 404: e404 },
});
// Growth (D-530, docs/ADMIN-GROWTH-PLAN.md): signups, activity, first steps, money, failures.
export const adminGrowth = createRoute({
  operationId: "adminGrowth",
  method: "get",
  path: "/v1/admin/growth",
  tags: ["admin"],
  security,
  summary: "Signups, active people, first steps, coming back, money and failures (owner only)",
  request: {
    query: z.object({ days: z.coerce.number().int().min(1).max(90).optional() }),
  },
  responses: { 200: jsonResponse("Growth over the range", AdminGrowth), 401: e401, 403: e403 },
});
// Live users (D-534, docs/LIVE-USERS-PLAN.md): GA4 realtime + our own online-now count.
export const adminLiveGa4 = get(
  "adminLiveGa4",
  "/v1/admin/live/ga4",
  "Google Analytics 4 realtime active users over the last 30 minutes (owner only)",
  AdminLiveGa4,
);
export const adminLiveOnline = createRoute({
  operationId: "adminLiveOnline",
  method: "get",
  path: "/v1/admin/live/online",
  tags: ["admin"],
  security,
  summary: "Signed-in users currently online from our own presence table (owner only)",
  request: {
    query: z.object({
      include_team: z.enum(["true", "false"]).optional(),
    }),
  },
  responses: { 200: jsonResponse("Online users", AdminLiveOnline), 401: e401, 403: e403 },
});
export const adminOrgs = get(
  "adminOrgs",
  "/v1/admin/orgs",
  "Workspaces with their limits and spend",
  z.object({ items: z.array(AdminOrg) }).openapi("AdminOrgList"),
);
export const adminServices = get(
  "adminServices",
  "/v1/admin/services",
  "Configured providers and system health",
  z.object({ items: z.array(AdminService) }).openapi("AdminServiceList"),
);
export const adminUpdates = get(
  "adminUpdates",
  "/v1/admin/updates",
  "Whether a newer Casama release exists",
  UpdateNotice,
);

export const adminConnectionSettings = get(
  "adminConnectionSettings",
  "/v1/admin/connections",
  "How apps without their own sign-in connect (owner only)",
  ConnectionSettings,
);

export const adminCloudModels = get(
  "adminCloudModels",
  "/v1/admin/models",
  "The models Casama Cloud runs (owner only)",
  CloudModels,
);

export const setAdminCloudModels = createRoute({
  operationId: "setAdminCloudModels",
  method: "put",
  path: "/v1/admin/models",
  tags: ["admin"],
  security,
  summary: "Change the models Casama Cloud runs (owner only)",
  request: { body: jsonBody(CloudModels) },
  responses: { 200: jsonResponse("Updated", CloudModels), 401: e401, 403: e403 },
});

export const adminModelAccess = get(
  "adminModelAccess",
  "/v1/admin/model-access",
  "Whether Cloud workspaces may use their own model providers and whether Casama's models are on per plan (owner only)",
  AdminModelAccess,
);

export const setAdminModelAccess = createRoute({
  operationId: "setAdminModelAccess",
  method: "put",
  path: "/v1/admin/model-access",
  tags: ["admin"],
  security,
  summary: "Change own-provider access and the per-plan Casama models switch (owner only)",
  request: { body: jsonBody(AdminModelAccess) },
  responses: {
    200: jsonResponse("Updated", AdminModelAccess),
    400: problemResponses[400],
    401: e401,
    403: e403,
  },
});

export const adminDecisions = get(
  "adminDecisions",
  "/v1/admin/decisions",
  "Decision model settings (owner only)",
  DecisionSettings,
);

export const setAdminDecisions = createRoute({
  operationId: "setAdminDecisions",
  method: "put",
  path: "/v1/admin/decisions",
  tags: ["admin"],
  security,
  summary: "Change decision model settings (owner only)",
  request: { body: jsonBody(DecisionSettings) },
  responses: { 200: jsonResponse("Updated", DecisionSettings), 401: e401, 403: e403 },
});

export const adminDecisionResults = createRoute({
  operationId: "adminDecisionResults",
  method: "get",
  path: "/v1/admin/decisions/results",
  tags: ["admin"],
  security,
  summary: "Shadow and live decision results against what really happened (owner only)",
  request: {
    query: z.object({
      days: z.coerce.number().int().min(1).max(90).optional(),
      use: z
        .enum([
          "scan_gate",
          "reply_check",
          "push_score",
          "tool_gate",
          "long_run",
          "effort",
          "watcher_gate",
        ])
        .optional(),
    }),
  },
  responses: { 200: jsonResponse("Results", DecisionResults), 401: e401, 403: e403 },
});

export const setAdminConnectionSettings = createRoute({
  operationId: "setAdminConnectionSettings",
  method: "put",
  path: "/v1/admin/connections",
  tags: ["admin"],
  security,
  summary: "Choose how apps without their own sign-in connect (owner only)",
  request: { body: jsonBody(SetConnectionSettingsRequest) },
  responses: { 200: jsonResponse("Updated", ConnectionSettings), 401: e401, 403: e403 },
});

export const adminBot = get(
  "adminBot",
  "/v1/admin/admin-bot",
  "The admin bot: which bot may propose admin actions in the owner's chat (owner only)",
  AdminBotSetting,
);

export const setAdminBot = createRoute({
  operationId: "setAdminBot",
  method: "put",
  path: "/v1/admin/admin-bot",
  tags: ["admin"],
  security,
  summary: "Turn the admin bot on or off, or choose its bot (owner only)",
  description:
    "Every admin action the bot proposes still waits for the owner's approval in the app (D-435).",
  request: { body: jsonBody(SetAdminBotRequest) },
  responses: {
    200: jsonResponse("Updated", AdminBotSetting),
    400: problemResponses[400],
    401: e401,
    403: e403,
  },
});

export const setOrgLimits = createRoute({
  operationId: "setOrgLimits",
  method: "patch",
  path: "/v1/admin/orgs/{id}/limits",
  tags: ["admin"],
  security,
  summary: "Set a workspace's quotas",
  request: { params: z.object({ id: Uuid }), body: jsonBody(SetOrgLimitsRequest) },
  responses: { 200: jsonResponse("Updated", AdminOrg), 401: e401, 403: e403, 404: e404 },
});

export const adminAbuseEvents = get(
  "adminAbuseEvents",
  "/v1/admin/abuse",
  "Recent abuse signals and actions (owner only)",
  z.object({ items: z.array(AbuseEvent) }).openapi("AbuseEventList"),
);

export const suspendOrg = createRoute({
  operationId: "suspendOrg",
  method: "post",
  path: "/v1/admin/orgs/{id}/suspend",
  tags: ["admin"],
  security,
  summary: "Suspend a workspace: stops its computers and runs, keeps its data",
  request: { params: z.object({ id: Uuid }), body: jsonBody(SuspendOrgRequest) },
  responses: { 200: jsonResponse("Suspended", AdminOrg), 401: e401, 403: e403, 404: e404 },
});

export const unsuspendOrg = createRoute({
  operationId: "unsuspendOrg",
  method: "delete",
  path: "/v1/admin/orgs/{id}/suspend",
  tags: ["admin"],
  security,
  summary: "Lift a workspace's suspension",
  request: { params: z.object({ id: Uuid }) },
  responses: { 200: jsonResponse("Unsuspended", AdminOrg), 401: e401, 403: e403, 404: e404 },
});

const PlanCode = z.object({ code: z.string().regex(/^[a-z0-9_]{1,40}$/) });

export const adminCapacity = get(
  "adminCapacity",
  "/v1/admin/capacity",
  "Server capacity: host memory, computers' share of their budget, 30-day peaks and a forecast (owner only)",
  ServerCapacity,
);

export const adminPricing = get(
  "adminPricing",
  "/v1/admin/pricing",
  "Plans, credit packs and the usage markup (owner only)",
  AdminPricing,
);

export const savePlan = createRoute({
  operationId: "savePlan",
  method: "put",
  path: "/v1/admin/plans/{code}",
  tags: ["admin"],
  security,
  summary: "Create or change a plan; workspaces on it get the new limits right away",
  request: { params: PlanCode, body: jsonBody(SavePlanRequest) },
  responses: { 200: jsonResponse("Saved", AdminPlan), 401: e401, 403: e403, 404: e404 },
});

export const saveCreditPack = createRoute({
  operationId: "saveCreditPack",
  method: "put",
  path: "/v1/admin/credit-packs/{code}",
  tags: ["admin"],
  security,
  summary: "Create or change a credit pack",
  request: { params: PlanCode, body: jsonBody(SaveCreditPackRequest) },
  responses: { 200: jsonResponse("Saved", AdminCreditPack), 401: e401, 403: e403, 404: e404 },
});

export const setBillingSettings = createRoute({
  operationId: "setBillingSettings",
  method: "patch",
  path: "/v1/admin/billing-settings",
  tags: ["admin"],
  security,
  summary: "Change the markup on usage paid with Casama's keys",
  request: { body: jsonBody(BillingSettings) },
  responses: { 200: jsonResponse("Saved", BillingSettings), 401: e401, 403: e403 },
});

export const listReportedCreations = createRoute({
  operationId: "listReportedCreations",
  method: "get",
  path: "/v1/admin/reports",
  tags: ["admin"],
  security,
  summary: "Public links people reported, most reported first (owner only; D-281)",
  responses: {
    200: jsonResponse(
      "Reports",
      z.object({ items: z.array(ReportedCreation) }).openapi("ReportedCreationList"),
    ),
    401: e401,
    403: e403,
  },
});

export const takeDownCreation = createRoute({
  operationId: "takeDownCreation",
  method: "post",
  path: "/v1/admin/creations/{id}/takedown",
  tags: ["admin"],
  security,
  summary: "Stop a creation's public link at once, or lift that (owner only; D-281)",
  request: {
    params: z.object({ id: Uuid }),
    body: jsonBody(z.object({ down: z.boolean() }).openapi("TakeDownRequest")),
  },
  responses: { 200: jsonResponse("Done", ReportedCreation), 401: e401, 403: e403, 404: e404 },
});

export const approveHeldCreation = createRoute({
  operationId: "approveHeldCreation",
  method: "post",
  path: "/v1/admin/creations/{id}/approve",
  tags: ["admin"],
  security,
  summary:
    "Approve a public page the phishing and malware check held: visitors see it again (owner only; D-550)",
  request: { params: z.object({ id: Uuid }) },
  responses: { 200: jsonResponse("Approved", ReportedCreation), 401: e401, 403: e403, 404: e404 },
});

export const adminVendors = get(
  "adminVendors",
  "/v1/admin/vendors",
  "Vendor usage (owner only)",
  z.object({ items: z.array(AdminVendor) }).openapi("AdminVendorList"),
);
export const setAdminVendor = createRoute({
  operationId: "setAdminVendor",
  method: "put",
  path: "/v1/admin/vendors/{vendor}",
  tags: ["admin"],
  security,
  request: {
    params: z.object({ vendor: z.string().min(1).max(80) }),
    body: jsonBody(VendorSettings),
  },
  responses: { 200: jsonResponse("Updated vendor", AdminVendor), ...problemResponses },
});
export const checkAdminVendor = createRoute({
  operationId: "checkAdminVendor",
  method: "post",
  path: "/v1/admin/vendors/{vendor}/check",
  tags: ["admin"],
  security,
  request: { params: z.object({ vendor: z.string().min(1).max(80) }) },
  responses: { 200: jsonResponse("Latest vendor reading", AdminVendor), ...problemResponses },
});

export const adminCosts = createRoute({
  operationId: "adminCosts",
  method: "get",
  path: "/v1/admin/costs",
  tags: ["admin"],
  security,
  summary: "What the server spent, by service, key, app, feature, model or workspace (owner only)",
  request: { query: AdminCostsQuery },
  responses: { 200: jsonResponse("Costs for the period", AdminCosts), ...problemResponses },
});
export const adminCostKeys = createRoute({
  operationId: "adminCostKeys",
  method: "get",
  path: "/v1/admin/costs/keys",
  tags: ["admin"],
  security,
  summary: "The server's own paid credentials by name, with what each spent (owner only)",
  request: { query: AdminCostsQuery.pick({ days: true, from: true, to: true }) },
  responses: {
    200: jsonResponse(
      "Keys",
      z.object({ items: z.array(AdminCostKey) }).openapi("AdminCostKeyList"),
    ),
    ...problemResponses,
  },
});
export const adminCostsExport = createRoute({
  operationId: "adminCostsExport",
  method: "get",
  path: "/v1/admin/costs/export",
  tags: ["admin"],
  security,
  summary: "The same view as CSV (owner only)",
  request: { query: AdminCostsQuery },
  responses: {
    200: { description: "CSV", content: { "text/csv": { schema: z.string() } } },
    ...problemResponses,
  },
});

export const adminMailAddresses = createRoute({
  operationId: "adminMailAddresses",
  method: "get",
  path: "/v1/admin/mail",
  tags: ["admin"],
  security,
  summary: "Hosted bot addresses with recent sending health (owner only)",
  responses: {
    200: jsonResponse(
      "Mail addresses",
      z.object({
        items: z.array(AdminMailAddress),
        /** Mails every workspace sent in the last 24 hours. */
        sent_today: z.number().int().optional(),
        /** The day's ceiling across every workspace (MAIL_SEND_DAILY_MAX); null: none. */
        send_ceiling: z.number().int().nullable().optional(),
      }),
    ),
    401: e401,
    403: e403,
  },
});

export const setMailAddressStatus = createRoute({
  operationId: "setMailAddressStatus",
  method: "patch",
  path: "/v1/admin/mail/addresses/{id}",
  tags: ["admin"],
  security,
  summary: "Pause an address, or lift a pause including an automatic one (owner only)",
  request: { params: z.object({ id: Uuid }), body: jsonBody(SetMailAddressStatusRequest) },
  responses: {
    200: jsonResponse("Mail address", AdminMailAddress),
    401: e401,
    403: e403,
    404: e404,
  },
});

export const resumeWorkspaceMail = createRoute({
  operationId: "resumeWorkspaceMail",
  method: "post",
  path: "/v1/admin/mail/workspaces/{org_id}/resume",
  tags: ["admin"],
  security,
  summary:
    "Resume a workspace's bot email after an automatic pause for bounces or spam reports, lifting its automatically paused addresses (owner only)",
  request: { params: z.object({ org_id: Uuid }) },
  responses: {
    200: jsonResponse("Resumed", ResumeWorkspaceMailResponse),
    401: e401,
    403: e403,
  },
});

export const adminMailReservedNames = createRoute({
  operationId: "adminMailReservedNames",
  method: "get",
  path: "/v1/admin/mail-reserved-names",
  tags: ["admin"],
  security,
  summary: "Instance-added reserved mail names (owner only)",
  responses: { 200: jsonResponse("Reserved names", AdminMailReservedNames), 401: e401, 403: e403 },
});

export const setMailReservedNames = createRoute({
  operationId: "setMailReservedNames",
  method: "put",
  path: "/v1/admin/mail-reserved-names",
  tags: ["admin"],
  security,
  summary: "Replace the instance-added reserved mail names (owner only)",
  request: { body: jsonBody(AdminMailReservedNames) },
  responses: { 200: jsonResponse("Reserved names", AdminMailReservedNames), 401: e401, 403: e403 },
});

// --- Admin checks (D-452): a passkey or the admin PIN instead of signing in again --------------

export const adminPin = createRoute({
  operationId: "adminPin",
  method: "get",
  path: "/v1/admin/pin",
  tags: ["admin"],
  security,
  summary: "Whether the owner has an admin PIN (owner only)",
  responses: { 200: jsonResponse("Admin PIN", AdminPinState), 401: e401, 403: e403 },
});

export const setAdminPin = createRoute({
  operationId: "setAdminPin",
  method: "put",
  path: "/v1/admin/pin",
  tags: ["admin"],
  security,
  summary: "Set or change the admin PIN (owner only; a fresh passkey or sign-in, not the PIN)",
  request: { body: jsonBody(SetAdminPinRequest) },
  responses: { 200: jsonResponse("Admin PIN", AdminPinState), ...problemResponses },
});

export const removeAdminPin = createRoute({
  operationId: "removeAdminPin",
  method: "delete",
  path: "/v1/admin/pin",
  tags: ["admin"],
  security,
  summary: "Remove the admin PIN (owner only; a fresh passkey or sign-in, not the PIN)",
  responses: { 200: jsonResponse("Admin PIN", AdminPinState), ...problemResponses },
});

export const adminPasskeyCheck = createRoute({
  operationId: "adminPasskeyCheck",
  method: "post",
  path: "/v1/admin/checks/passkey",
  tags: ["admin"],
  security,
  summary: "Record a passkey check on this sign-in session (owner only)",
  request: { body: jsonBody(AdminPasskeyCheckRequest) },
  responses: { 200: jsonResponse("Check recorded", AdminCheck), ...problemResponses },
});

export const adminPinCheck = createRoute({
  operationId: "adminPinCheck",
  method: "post",
  path: "/v1/admin/checks/pin",
  tags: ["admin"],
  security,
  summary: "Check the admin PIN and record it on this sign-in session (owner only)",
  request: { body: jsonBody(AdminPinCheckRequest) },
  responses: { 200: jsonResponse("Check recorded", AdminCheck), ...problemResponses },
});

// --- Device keys (D-453): the screen lock as the whole check -----------------------------------

export const adminDeviceKeys = createRoute({
  operationId: "adminDeviceKeys",
  method: "get",
  path: "/v1/admin/devices",
  tags: ["admin"],
  security,
  summary: "Devices that confirm the owner with the screen lock (owner only)",
  responses: { 200: jsonResponse("Devices", AdminDeviceKeyList), 401: e401, 403: e403 },
});

export const addAdminDeviceKey = createRoute({
  operationId: "addAdminDeviceKey",
  method: "post",
  path: "/v1/admin/devices",
  tags: ["admin"],
  security,
  summary: "Add this device's key (owner only; a fresh passkey, Face ID or sign-in, not the PIN)",
  request: { body: jsonBody(AddAdminDeviceKeyRequest) },
  responses: { 200: jsonResponse("Device", AdminDeviceKey), ...problemResponses },
});

export const removeAdminDeviceKey = createRoute({
  operationId: "removeAdminDeviceKey",
  method: "delete",
  path: "/v1/admin/devices/{id}",
  tags: ["admin"],
  security,
  summary: "Remove a device's key (owner only)",
  request: { params: z.object({ id: Uuid }) },
  responses: { 200: jsonResponse("Devices", AdminDeviceKeyList), ...problemResponses },
});

export const adminDeviceChallenge = createRoute({
  operationId: "adminDeviceChallenge",
  method: "post",
  path: "/v1/admin/checks/device/challenge",
  tags: ["admin"],
  security,
  summary: "A one-time challenge for this device's key (owner only)",
  request: { body: jsonBody(AdminDeviceChallengeRequest) },
  responses: { 200: jsonResponse("Challenge", AdminDeviceChallenge), ...problemResponses },
});

export const adminDeviceCheck = createRoute({
  operationId: "adminDeviceCheck",
  method: "post",
  path: "/v1/admin/checks/device",
  tags: ["admin"],
  security,
  summary: "Check the device's signature and record it on this sign-in session (owner only)",
  request: { body: jsonBody(AdminDeviceCheckRequest) },
  responses: { 200: jsonResponse("Check recorded", AdminCheck), ...problemResponses },
});
