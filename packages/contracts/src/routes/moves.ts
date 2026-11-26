import { createRoute, z } from "@hono/zod-openapi";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";
import {
  CreateMoveRequest,
  MoveCheck,
  MoveCheckRequest,
  MoveFinishRequest,
  MoveFit,
  MoveFitQuery,
  MovePartReceived,
  MoveProgress,
  MoveStartRequest,
  MoveToken,
} from "../moves.ts";

/**
 * Move to Casama Cloud, and back (docs/SELFHOST-CLOUD-MODELS-PLAN.md §13.4). Routes marked
 * "(move token)" take `Authorization: Move <token>` from the source server, never a person's
 * session; the token is the one `createMove` returned.
 */
const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404, 409: e409 } = problemResponses;
const tags = ["moves"];
const moveParams = z.object({ id: Uuid });

// --- Target side ---------------------------------------------------------------------------------

export const createMove = createRoute({
  operationId: "createMove",
  method: "post",
  path: "/v1/moves",
  tags,
  security,
  summary: "Get a one-time move token for receiving a workspace into this one (admin)",
  request: { body: jsonBody(CreateMoveRequest) },
  responses: { 201: jsonResponse("The token", MoveToken), 400: e400, 401: e401, 403: e403 },
});

export const getMoveFit = createRoute({
  operationId: "getMoveFit",
  method: "get",
  path: "/v1/moves/{id}/fit",
  tags,
  summary: "Whether a workspace of this size fits the receiving workspace's plan (move token)",
  description: "Errors: 409 already_moved when that source workspace moved here before.",
  request: { params: moveParams, query: MoveFitQuery },
  responses: { 200: jsonResponse("Fit", MoveFit), 401: e401, 404: e404, 409: e409 },
});

export const putMovePart = createRoute({
  operationId: "putMovePart",
  method: "put",
  path: "/v1/moves/{id}/parts/{n}",
  tags,
  summary: "One part of the move bundle, with its sha256 in X-Move-Sha256 (move token)",
  request: {
    params: z.object({
      id: Uuid,
      n: z
        .string()
        .regex(/^\d{1,8}$/)
        .openapi({ description: "Part number, from 0" }),
    }),
    body: {
      content: {
        "application/octet-stream": { schema: z.string().openapi({ format: "binary" }) },
      },
    },
  },
  responses: {
    200: jsonResponse("Received", MovePartReceived),
    400: e400,
    401: e401,
    404: e404,
    409: e409,
  },
});

export const finishMove = createRoute({
  operationId: "finishMove",
  method: "post",
  path: "/v1/moves/{id}/finish",
  tags,
  summary: "Check the bundle and bring it in; progress at GET /v1/moves/{id} (move token)",
  request: { params: moveParams, body: jsonBody(MoveFinishRequest) },
  responses: {
    202: jsonResponse("Bringing it in", MoveProgress),
    400: e400,
    401: e401,
    404: e404,
    409: e409,
  },
});

export const abortMove = createRoute({
  operationId: "abortMove",
  method: "post",
  path: "/v1/moves/{id}/abort",
  tags,
  summary: "Give up a move: the parts and anything half brought in are removed (move token)",
  request: { params: moveParams },
  responses: { 200: jsonResponse("Removed", MoveProgress), 401: e401, 404: e404 },
});

export const getMove = createRoute({
  operationId: "getMove",
  method: "get",
  path: "/v1/moves/{id}",
  tags,
  security,
  summary: "A move's progress (move token, or an admin of the receiving workspace)",
  request: { params: moveParams },
  responses: { 200: jsonResponse("Progress", MoveProgress), 401: e401, 404: e404 },
});

// --- Source side ---------------------------------------------------------------------------------

const orgParams = z.object({ id: Uuid });

export const checkOrgMove = createRoute({
  operationId: "checkOrgMove",
  method: "post",
  path: "/v1/orgs/{id}/move/check",
  tags,
  security,
  summary: "Check a move before it starts: size, time, what fits, what needs you after (owner)",
  description: "Changes nothing. Errors: 409 already_moved.",
  request: { params: orgParams, body: jsonBody(MoveCheckRequest) },
  responses: {
    200: jsonResponse("The check", MoveCheck),
    400: e400,
    401: e401,
    403: e403,
    409: e409,
  },
});

export const startOrgMove = createRoute({
  operationId: "startOrgMove",
  method: "post",
  path: "/v1/orgs/{id}/move/start",
  tags,
  security,
  summary: "Start (or resume) moving this workspace to the server that gave the token (owner)",
  request: { params: orgParams, body: jsonBody(MoveStartRequest) },
  responses: {
    202: jsonResponse("Started", MoveProgress),
    400: e400,
    401: e401,
    403: e403,
    409: e409,
  },
});

export const getOrgMove = createRoute({
  operationId: "getOrgMove",
  method: "get",
  path: "/v1/orgs/{id}/move",
  tags,
  security,
  summary: "The workspace's latest move: progress, step and error, or where it moved (member)",
  request: { params: orgParams },
  responses: { 200: jsonResponse("Progress", MoveProgress), 401: e401, 404: e404 },
});
