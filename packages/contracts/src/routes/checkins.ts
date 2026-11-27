import { createRoute, z } from "@hono/zod-openapi";
import {
  AcceptedSuggestion,
  AcceptSuggestionRequest,
  BotCheckins,
  DismissSuggestionRequest,
  ForYou,
  InboxSeenRequest,
  PutAwaySuggestionsRequest,
  PutAwaySuggestionsResponse,
  SnoozedSuggestion,
  SnoozeSuggestionRequest,
} from "../checkins.ts";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";

const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404, 409: e409 } = problemResponses;
const idParam = z.object({ id: Uuid });

export const getBotCheckins = createRoute({
  operationId: "getBotCheckins",
  method: "get",
  path: "/v1/bots/{id}/checkins",
  tags: ["checkins"],
  security,
  request: { params: idParam },
  responses: { 200: jsonResponse("Check-in settings", BotCheckins), 401: e401, 404: e404 },
});

export const setBotCheckins = createRoute({
  operationId: "setBotCheckins",
  method: "put",
  path: "/v1/bots/{id}/checkins",
  tags: ["checkins"],
  security,
  summary: "Turn a bot's morning brief and scans on or off, and set their times and daily cap",
  request: { params: idParam, body: jsonBody(BotCheckins) },
  responses: {
    200: jsonResponse("Check-in settings", BotCheckins),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
  },
});

export const getForYou = createRoute({
  operationId: "getForYou",
  method: "get",
  path: "/v1/for-you",
  tags: ["checkins"],
  security,
  summary: "Your feed in a workspace: the latest briefs, pending suggestions and approvals",
  request: { query: z.object({ org_id: Uuid }) },
  responses: { 200: jsonResponse("Feed", ForYou), 401: e401 },
});

export const acceptSuggestion = createRoute({
  operationId: "acceptSuggestion",
  method: "post",
  path: "/v1/suggestions/{id}/accept",
  tags: ["checkins"],
  security,
  summary: "Have the bot do it, answer it, turn it on, or set a reminder",
  request: {
    params: idParam,
    body: {
      content: { "application/json": { schema: AcceptSuggestionRequest } },
      required: false,
    },
  },
  responses: { 202: jsonResponse("Started", AcceptedSuggestion), 401: e401, 404: e404, 409: e409 },
});

export const dismissSuggestion = createRoute({
  operationId: "dismissSuggestion",
  method: "post",
  path: "/v1/suggestions/{id}/dismiss",
  tags: ["checkins"],
  security,
  request: { params: idParam, body: jsonBody(DismissSuggestionRequest) },
  responses: {
    200: jsonResponse("Dismissed", z.object({ ok: z.boolean() }).openapi("Ok")),
    401: e401,
    404: e404,
    409: e409,
  },
});

export const snoozeSuggestion = createRoute({
  operationId: "snoozeSuggestion",
  method: "post",
  path: "/v1/suggestions/{id}/snooze",
  tags: ["checkins"],
  security,
  summary:
    "Hide a suggestion until the next morning brief or a picked time (expires on 2nd snooze)",
  request: {
    params: idParam,
    body: {
      content: { "application/json": { schema: SnoozeSuggestionRequest } },
      required: false,
    },
  },
  responses: {
    200: jsonResponse("Snoozed", SnoozedSuggestion),
    401: e401,
    404: e404,
    409: e409,
  },
});

export const doneSuggestion = createRoute({
  operationId: "doneSuggestion",
  method: "post",
  path: "/v1/suggestions/{id}/done",
  tags: ["checkins"],
  security,
  summary: "Mark a look suggestion as seen/done (Got it / Open) without starting a run",
  request: { params: idParam },
  responses: {
    200: jsonResponse("Done", z.object({ ok: z.boolean() }).openapi("Ok")),
    401: e401,
    404: e404,
    409: e409,
  },
});

export const putAwaySuggestions = createRoute({
  operationId: "putAwaySuggestions",
  method: "post",
  path: "/v1/suggestions/put-away",
  tags: ["checkins"],
  security,
  summary:
    "Put away multiple pending suggestions at once (counts as Not now, not Don't suggest again)",
  request: { body: jsonBody(PutAwaySuggestionsRequest) },
  responses: {
    200: jsonResponse("Put away", PutAwaySuggestionsResponse),
    400: e400,
    401: e401,
  },
});

export const markInboxSeen = createRoute({
  operationId: "markInboxSeen",
  method: "post",
  path: "/v1/inbox/seen",
  tags: ["checkins"],
  security,
  summary: "Mark an Updates item (e.g. a page) as seen by this user across devices",
  request: { body: jsonBody(InboxSeenRequest) },
  responses: {
    200: jsonResponse("Seen", z.object({ ok: z.boolean() }).openapi("Ok")),
    400: e400,
    401: e401,
  },
});
