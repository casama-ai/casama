import { createRoute, z } from "@hono/zod-openapi";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";
import {
  AccountDeletion,
  AppleSignInTokenRequest,
  AppleSignInTokenResult,
  DeleteAccountRequest,
  OrgSettings,
  RelayAnalyticsRequest,
  SetAttributionRequest,
  UpdateOrgSettingsRequest,
} from "../privacy.ts";

const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404 } = problemResponses;
const tags = ["privacy"];

export const exportMyData = createRoute({
  operationId: "exportMyData",
  method: "get",
  path: "/v1/me/export",
  tags,
  security,
  summary: "Download everything you can see as a ZIP of JSON files",
  responses: {
    200: {
      description: "ZIP archive",
      content: { "application/zip": { schema: z.string().openapi({ format: "binary" }) } },
    },
    401: e401,
  },
});

export const deleteMyAccount = createRoute({
  operationId: "deleteMyAccount",
  method: "delete",
  path: "/v1/me",
  tags,
  security,
  summary:
    "Delete your account: you are signed out now, and your data, workspaces you solely own and their computer snapshots are purged after the grace period",
  request: { body: jsonBody(DeleteAccountRequest) },
  responses: { 200: jsonResponse("Scheduled", AccountDeletion), 400: e400, 401: e401 },
});

export const saveAppleSignInToken = createRoute({
  operationId: "saveAppleSignInToken",
  method: "post",
  path: "/v1/me/apple-sign-in",
  tags,
  security,
  summary: "Hand over what Sign in with Apple returned, so deleting the account can revoke it",
  description:
    "App Store 5.1.1(v) (D-420): deleting an account revokes its Sign in with Apple tokens. The app sends the system sheet's authorization code, or the browser sign-in's refresh token, right after signing in with Apple. The server checks it with Apple against the person's Apple identity and keeps the refresh token in Vault until the account is deleted.",
  request: { body: jsonBody(AppleSignInTokenRequest) },
  responses: { 200: jsonResponse("Saved", AppleSignInTokenResult), 400: e400, 401: e401 },
});

export const renameTwoStepFactor = createRoute({
  operationId: "renameTwoStepFactor",
  method: "patch",
  path: "/v1/me/two-step/{id}",
  tags,
  security,
  summary: "Rename one of your authenticator apps (two-step sign-in)",
  request: {
    params: z.object({ id: Uuid }),
    body: jsonBody(z.object({ name: z.string().trim().min(1).max(60) })),
  },
  responses: { 204: { description: "Renamed" }, 400: e400, 401: e401, 404: e404 },
});

export const getOrgSettings = createRoute({
  operationId: "getOrgSettings",
  method: "get",
  path: "/v1/orgs/{id}/settings",
  tags,
  security,
  request: { params: z.object({ id: Uuid }) },
  responses: { 200: jsonResponse("Settings", OrgSettings), 401: e401, 404: e404 },
});

export const updateOrgSettings = createRoute({
  operationId: "updateOrgSettings",
  method: "patch",
  path: "/v1/orgs/{id}/settings",
  tags,
  security,
  summary: "Change workspace settings such as run event retention (admins)",
  request: { params: z.object({ id: Uuid }), body: jsonBody(UpdateOrgSettingsRequest) },
  responses: {
    200: jsonResponse("Settings", OrgSettings),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
  },
});

export const setAnalyticsOptOut = createRoute({
  operationId: "setAnalyticsOptOut",
  method: "post",
  path: "/v1/me/analytics-opt-out",
  tags,
  security,
  summary: "Update the user's analytics opt-out preference",
  request: { body: jsonBody(z.object({ opt_out: z.boolean() })) },
  responses: { 204: { description: "Updated" }, 401: e401 },
});

export const relayAnalytics = createRoute({
  operationId: "relayAnalytics",
  method: "post",
  path: "/v1/analytics/events",
  tags,
  security,
  summary: "Relay desktop or extension product events to Google Analytics 4",
  description:
    "Windows, Linux and the browser extension have no Firebase Analytics, and the Measurement Protocol secret can't ship in the client, so they send catalog events here and the server forwards them to GA4 (D-399, D-533). Only Casama Cloud with GA4 configured forwards anything; opted-out people and unknown events are dropped. Always 204.",
  request: { body: jsonBody(RelayAnalyticsRequest) },
  responses: { 204: { description: "Accepted (forwarded or dropped)" }, 400: e400, 401: e401 },
});

export const setAttribution = createRoute({
  operationId: "setAttribution",
  method: "post",
  path: "/v1/me/attribution",
  tags,
  security,
  summary: "Record first-touch signup platform and acquisition source once per account",
  description:
    "Written once per account (COALESCE when null) right after sign-in, respecting analytics_opt_out (D-533). Never stores personal details or query strings beyond utm_source, utm_medium, utm_campaign and path.",
  request: { body: jsonBody(SetAttributionRequest) },
  responses: { 204: { description: "Recorded or already set" }, 400: e400, 401: e401 },
});
