import { createRoute } from "@hono/zod-openapi";
import {
  AttributionStatus,
  PostAttributionInstallRequest,
  PostCheckoutIntentRequest,
  PostHeardFromRequest,
  SetAdsMeasurementRequest,
} from "../attribution.ts";
import { jsonBody, jsonResponse, problemResponses } from "../common.ts";

/**
 * Ads attribution (docs/ADS-ATTRIBUTION-PLAN.md). Casama's server keeps its own record of where
 * each person came from and is the one sender of sign-ups and purchases to ad networks. Only
 * Casama Cloud records anything: on a self-hosted server these routes accept and drop.
 */
const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403 } = problemResponses;
const tags = ["attribution"];

export const getAttributionStatus = createRoute({
  operationId: "getAttributionStatus",
  method: "get",
  path: "/v1/attribution/status",
  tags,
  security,
  summary: "Whether ad measurement is offered and on here, and the person's credited source",
  description:
    "The app asks once per session: whether to show \"Help measure our ads\", whether Meta's SDK may start on this device, and the frozen acquisition (for RevenueCat's source fields). The region comes from the request's country.",
  responses: { 200: jsonResponse("Status", AttributionStatus), 401: e401 },
});

export const setAdsMeasurement = createRoute({
  operationId: "setAdsMeasurement",
  method: "put",
  path: "/v1/me/ads-measurement",
  tags,
  security,
  summary: 'Turn "Help measure our ads" on or off',
  description:
    "Off: nothing more about this person goes to any ad network, from the server or the app. Checked again when each conversion is delivered.",
  request: { body: jsonBody(SetAdsMeasurementRequest) },
  responses: { 200: jsonResponse("Status", AttributionStatus), 400: e400, 401: e401 },
});

export const postAttributionInstall = createRoute({
  operationId: "postAttributionInstall",
  method: "post",
  path: "/v1/attribution/install",
  tags,
  security,
  summary: "Record this install (or browser) and where it came from, after sign-in",
  description:
    "Posted once after each sign-in and again when something changes. Stores the install's app and device details, Meta's anonymous id while Meta's SDK runs, Google Play's install referrer and the web landing labels, as touches. Always 204.",
  request: { body: jsonBody(PostAttributionInstallRequest) },
  responses: { 204: { description: "Recorded (or dropped)" }, 400: e400, 401: e401 },
});

export const postHeardFrom = createRoute({
  operationId: "postHeardFrom",
  method: "post",
  path: "/v1/attribution/heard-from",
  tags,
  security,
  summary: 'The answer to "How did you hear about us?" (or a skip)',
  request: { body: jsonBody(PostHeardFromRequest) },
  responses: { 204: { description: "Recorded" }, 400: e400, 401: e401 },
});

export const postCheckoutIntent = createRoute({
  operationId: "postCheckoutIntent",
  method: "post",
  path: "/v1/attribution/checkout",
  tags,
  security,
  summary: "The person and install that pressed Buy, so the next charge is credited to them",
  request: { body: jsonBody(PostCheckoutIntentRequest) },
  responses: { 204: { description: "Recorded" }, 400: e400, 401: e401, 403: e403 },
});
