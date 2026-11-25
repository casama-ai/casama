import { createRoute, z } from "@hono/zod-openapi";
import { jsonBody, jsonResponse, problemResponses } from "../common.ts";
import {
  InstallEventRequest,
  OwnerActivity,
  OwnerActivityQuery,
  OwnerAlertSettings,
  OwnerJourneyDetail,
  OwnerOk,
  SiteEventRequest,
  UpdateOwnerAlertSettings,
} from "../owner.ts";

/**
 * Owner alerts and live activity (D-527, docs/OWNER-ALERTS-PLAN.md). Instance owners only, without
 * the admin console's fresh-check lock, so a live screen can stay open: these routes only ever show
 * masked addresses. Everyone else gets 403 not_instance_owner.
 */
const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404, 429: e429 } = problemResponses;

export const ownerActivity = createRoute({
  operationId: "ownerActivity",
  method: "get",
  path: "/v1/owner/activity",
  tags: ["owner"],
  security,
  summary: "What's happening on this server, newest first (owner only)",
  request: { query: OwnerActivityQuery },
  responses: { 200: jsonResponse("Activity", OwnerActivity), 401: e401, 403: e403 },
});

export const ownerAlertSettings = createRoute({
  operationId: "ownerAlertSettings",
  method: "get",
  path: "/v1/owner/alerts",
  tags: ["owner"],
  security,
  summary: "Which kinds of activity push to this owner's devices (owner only)",
  responses: { 200: jsonResponse("Settings", OwnerAlertSettings), 401: e401, 403: e403 },
});

export const setOwnerAlertSettings = createRoute({
  operationId: "setOwnerAlertSettings",
  method: "put",
  path: "/v1/owner/alerts",
  tags: ["owner"],
  security,
  summary: "Switch kinds of alerts on or off, or pause them all (owner only)",
  request: { body: jsonBody(UpdateOwnerAlertSettings) },
  responses: { 200: jsonResponse("Settings", OwnerAlertSettings), 400: e400, 401: e401, 403: e403 },
});

export const testOwnerAlert = createRoute({
  operationId: "testOwnerAlert",
  method: "post",
  path: "/v1/owner/alerts/test",
  tags: ["owner"],
  security,
  summary: "Send a test alert to this owner's devices (owner only)",
  responses: { 200: jsonResponse("Sent", OwnerOk), 401: e401, 403: e403, 429: e429 },
});

export const postSiteEvent = createRoute({
  operationId: "postSiteEvent",
  method: "post",
  path: "/v1/site-events",
  tags: ["owner"],
  summary: "A website event from casama.ai's Worker (needs the site events key)",
  description:
    "The key goes in the x-casama-site-key header. Servers without a key set answer 404.",
  request: { body: jsonBody(SiteEventRequest) },
  responses: { 200: jsonResponse("Counted", OwnerOk), 400: e400, 401: e401, 404: e404, 429: e429 },
});

export const ownerJourney = createRoute({
  operationId: "ownerJourney",
  method: "get",
  path: "/v1/owner/journeys/{id}",
  tags: ["owner"],
  security,
  summary:
    "One person's path from click to paying, with every event and what they have now (owner only)",
  request: { params: z.object({ id: z.string().uuid().openapi({ format: "uuid" }) }) },
  responses: {
    200: jsonResponse("Journey", OwnerJourneyDetail),
    401: e401,
    403: e403,
    404: e404,
  },
});

export const postInstallEvent = createRoute({
  operationId: "postInstallEvent",
  method: "post",
  path: "/v1/install-events",
  tags: ["owner"],
  summary: "The app's first open or first sign-in attempt on an install (D-537)",
  description:
    "No sign-in. Official builds send it once per install with a random install id, never an ad id. Counted once per install; always answers ok.",
  request: { body: jsonBody(InstallEventRequest) },
  responses: { 200: jsonResponse("Counted", OwnerOk), 400: e400, 401: e401, 429: e429 },
});
