import { createRoute, z } from "@hono/zod-openapi";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";
import { BotPlaces, SetPlacePreferenceRequest } from "../places.ts";

const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 404: e404 } = problemResponses;
const idParam = z.object({ id: Uuid });

export const getBotPlaces = createRoute({
  operationId: "getBotPlaces",
  method: "get",
  path: "/v1/bots/{id}/places",
  tags: ["bots"],
  security,
  summary:
    "Where this bot can work for you: its own computer and each of your computers that lets it in, with your choice",
  request: { params: idParam },
  responses: { 200: jsonResponse("Places", BotPlaces), 401: e401, 404: e404 },
});

export const setBotPlacePreference = createRoute({
  operationId: "setBotPlacePreference",
  method: "put",
  path: "/v1/bots/{id}/places/preference",
  tags: ["bots"],
  security,
  summary: "Choose where this bot works for you (Works on), and which of your computers it uses",
  request: { params: idParam, body: jsonBody(SetPlacePreferenceRequest) },
  responses: { 200: jsonResponse("Places", BotPlaces), 400: e400, 401: e401, 404: e404 },
});
