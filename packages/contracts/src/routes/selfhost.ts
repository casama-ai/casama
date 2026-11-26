import { createRoute, z } from "@hono/zod-openapi";
import { jsonBody, jsonResponse, Problem, problemResponses } from "../common.ts";
import {
  BusinessLicenseCreated,
  CreateBusinessLicenseRequest,
  LicenseIssued,
  PersonalLicenseRequest,
  RenewLicenseRequest,
  SelfhostLicenseList,
  SelfhostLicenseQuery,
  SelfhostLicenseRow,
  SelfhostStats,
  SelfhostStatus,
  SetSelfhostLicenseRequest,
  TrialLicenseAccepted,
  TrialLicenseRequest,
} from "../selfhost.ts";

/**
 * Self-hosted engine licenses (docs/SELF-HOSTING-PLAN.md §11.5, §11.6).
 *
 * Cloud API: Casama Cloud signs keys. Off (404 licensing_off) unless the server has a signing key.
 * Engine API: a self-hosted server's own license state, and setting its key.
 */
const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404, 409: e409, 429: e429 } = problemResponses;
const e503 = {
  description: "Email is not set up on this server",
  content: { "application/problem+json": { schema: Problem } },
};

// --- Cloud API -----------------------------------------------------------------------------------

export const issuePersonalLicense = createRoute({
  operationId: "issuePersonalLicense",
  method: "post",
  path: "/v1/selfhost/licenses/personal",
  tags: ["selfhost"],
  summary: "Get the free personal license for a self-hosted server (signed in)",
  description:
    "One active personal license per account: a new instance id moves it, and the old server's renewals answer 409 license_moved. Errors: 404 licensing_off.",
  security,
  request: { body: jsonBody(PersonalLicenseRequest) },
  responses: {
    200: jsonResponse("The key", LicenseIssued),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
  },
});

export const renewLicense = createRoute({
  operationId: "renewLicense",
  method: "post",
  path: "/v1/selfhost/licenses/renew",
  tags: ["selfhost"],
  summary: "Renew a self-hosted server's license key (no sign-in)",
  description:
    "Accepts keys up to the end of their 14-day grace. The first renewal of a trial or business key binds it to the server. Errors: 400 invalid_license, 403 license_revoked, 403 license_expired, 404 licensing_off, 409 license_moved, 429 too_many_attempts.",
  request: { body: jsonBody(RenewLicenseRequest) },
  responses: {
    200: jsonResponse("A new key", LicenseIssued),
    400: e400,
    403: e403,
    404: e404,
    409: e409,
    429: e429,
  },
});

export const requestTrialLicense = createRoute({
  operationId: "requestTrialLicense",
  method: "post",
  path: "/v1/selfhost/licenses/trial",
  tags: ["selfhost"],
  summary: "Email a 30-day business trial key (no sign-in, rate limited)",
  description:
    "Answers the same whether or not the address already had a trial. Errors: 400 bad_email, 404 licensing_off, 429 too_many_attempts, 503 email_unavailable.",
  request: { body: jsonBody(TrialLicenseRequest) },
  responses: {
    202: jsonResponse("On its way", TrialLicenseAccepted),
    400: e400,
    404: e404,
    429: e429,
    503: e503,
  },
});

export const admitForSelfhost = createRoute({
  operationId: "admitForSelfhost",
  method: "post",
  path: "/v1/selfhost/licenses/admit",
  tags: ["selfhost"],
  summary: "Let an email address past the sign-up waitlist to get a personal license",
  description:
    "Called by the desktop app and the CLI before the Casama sign-in that gets a free personal license, so a new person isn't stopped by the invite-only gate. Marks the address as let in (admitted_via 'selfhost'); answers the same whether or not it was on the list. Errors: 400 bad_email, 400 disposable_email, 404 licensing_off, 429 too_many_attempts.",
  request: { body: jsonBody(TrialLicenseRequest) },
  responses: {
    202: jsonResponse("Let in, or already could sign up", TrialLicenseAccepted),
    400: e400,
    404: e404,
    429: e429,
  },
});

export const createBusinessLicense = createRoute({
  operationId: "createBusinessLicense",
  method: "post",
  path: "/v1/admin/selfhost/licenses",
  tags: ["admin"],
  summary: "Make a business license key (instance owner); the key is shown once and emailed",
  security,
  request: { body: jsonBody(CreateBusinessLicenseRequest) },
  responses: {
    200: jsonResponse("The key", BusinessLicenseCreated),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
  },
});

export const listSelfhostLicenses = createRoute({
  operationId: "listSelfhostLicenses",
  method: "get",
  path: "/v1/admin/selfhost/licenses",
  tags: ["admin"],
  summary: "Self-hosted licenses Casama Cloud has issued (instance owner); keys aren't shown",
  security,
  request: { query: SelfhostLicenseQuery },
  responses: {
    200: jsonResponse("Licenses", SelfhostLicenseList),
    401: e401,
    403: e403,
    404: e404,
  },
});

export const revokeSelfhostLicense = createRoute({
  operationId: "revokeSelfhostLicense",
  method: "post",
  path: "/v1/admin/selfhost/licenses/{id}/revoke",
  tags: ["admin"],
  summary: "Revoke a license (instance owner): its next renewal answers 403 license_revoked",
  security,
  request: { params: z.object({ id: z.uuid() }) },
  responses: {
    200: jsonResponse("Revoked", SelfhostLicenseRow),
    401: e401,
    403: e403,
    404: e404,
  },
});

export const selfhostLicenseStats = createRoute({
  operationId: "selfhostLicenseStats",
  method: "get",
  path: "/v1/admin/selfhost/stats",
  tags: ["admin"],
  summary: "Self-hosted servers at a glance for Admin Growth (instance owner)",
  description:
    "From the daily license check-ins: daily active servers, new installs, editions, engine versions, lapsed licenses, members and bots. Counts only.",
  security,
  responses: {
    200: jsonResponse("Stats", SelfhostStats),
    401: e401,
    403: e403,
    404: e404,
  },
});

// --- Engine API ----------------------------------------------------------------------------------

export const getSelfhostStatus = createRoute({
  operationId: "getSelfhostStatus",
  method: "get",
  path: "/v1/selfhost/status",
  tags: ["selfhost"],
  summary: "This server's license state (no sign-in)",
  description:
    'On Casama Cloud, and wherever licensing is off, the answer is `{ "licensing": false }`.',
  responses: { 200: jsonResponse("State", SelfhostStatus) },
});

export const setSelfhostLicense = createRoute({
  operationId: "setSelfhostLicense",
  method: "put",
  path: "/v1/selfhost/license",
  tags: ["selfhost"],
  summary: "Set this server's license key",
  description:
    "Accepted when the key verifies and is for this server (or not yet bound to one, or offline). Before the server has a key anyone may set it (setup); after that only the instance owner. Errors: 400 invalid_license, 401 unauthorized, 403 not_instance_owner, 404 licensing_off, 409 license_other_instance.",
  security,
  request: { body: jsonBody(SetSelfhostLicenseRequest) },
  responses: {
    200: jsonResponse("The new state", SelfhostStatus),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
    409: e409,
  },
});
