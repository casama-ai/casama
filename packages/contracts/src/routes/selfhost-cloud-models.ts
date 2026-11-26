import { createRoute } from "@hono/zod-openapi";
import { jsonBody, jsonResponse, Problem, problemResponses } from "../common.ts";
import {
  ApplyCloudModelsRequest,
  CloudModelsOff,
  CloudModelsPreview,
  CloudModelsState,
  ConnectCloudModelsRequest,
  UpdateCloudModelsRequest,
} from "../selfhost-cloud-models.ts";

/**
 * Casama Cloud models on a self-hosted server (docs/SELFHOST-CLOUD-MODELS-PLAN.md §13.3). Reading
 * is for any member; connecting, previewing, applying and turning off are for the server's admin.
 */
const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404, 409: e409 } = problemResponses;
const e402 = {
  description: "Casama Cloud refused (plan, credits, seats)",
  content: { "application/problem+json": { schema: Problem } },
};

export const getCloudModels = createRoute({
  operationId: "getSelfhostCloudModels",
  method: "get",
  path: "/v1/selfhost/cloud-models",
  tags: ["selfhost"],
  summary: "Casama Cloud models on this server: state, who pays, limits and your own use",
  security,
  responses: { 200: jsonResponse("State", CloudModelsState), 401: e401 },
});

export const updateCloudModels = createRoute({
  operationId: "updateSelfhostCloudModels",
  method: "patch",
  path: "/v1/selfhost/cloud-models",
  tags: ["selfhost"],
  summary:
    "Change who may use Casama Cloud, the daily limit per person and the fallbacks (server admin)",
  description:
    "Only the fields sent change. Bots stay where they are. Errors: 403 not_instance_owner, 404 not_available, 409 not_connected.",
  security,
  request: { body: jsonBody(UpdateCloudModelsRequest) },
  responses: {
    200: jsonResponse("State", CloudModelsState),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
    409: e409,
  },
});

export const connectCloudModels = createRoute({
  operationId: "connectSelfhostCloudModels",
  method: "post",
  path: "/v1/selfhost/cloud-models/connect",
  tags: ["selfhost"],
  summary: "Connect this server to Casama Cloud with a one-time code (server admin)",
  description:
    "The code comes from Casama Cloud (`POST /v1/selfhost/cloud/connect-codes`, signed in there). The server redeems it, keeps the link key in Vault and needs no restart. Errors: the refusal codes of Casama Cloud, 403 not_instance_owner, 404 not_available.",
  security,
  request: { body: jsonBody(ConnectCloudModelsRequest) },
  responses: {
    200: jsonResponse("State", CloudModelsState),
    400: e400,
    401: e401,
    402: e402,
    403: e403,
    404: e404,
    409: e409,
  },
});

export const previewCloudModels = createRoute({
  operationId: "previewSelfhostCloudModels",
  method: "get",
  path: "/v1/selfhost/cloud-models/preview",
  tags: ["selfhost"],
  summary: "What turning Casama Cloud models on would change, bot by bot (server admin)",
  security,
  responses: {
    200: jsonResponse("Preview", CloudModelsPreview),
    401: e401,
    403: e403,
    404: e404,
  },
});

export const applyCloudModels = createRoute({
  operationId: "applySelfhostCloudModels",
  method: "post",
  path: "/v1/selfhost/cloud-models/apply",
  tags: ["selfhost"],
  summary: "Move the chosen bots onto Casama Cloud models and save the settings (server admin)",
  description:
    "Each chosen bot points at the Casama Cloud credential with its previous choice kept, so turning off puts it back.",
  security,
  request: { body: jsonBody(ApplyCloudModelsRequest) },
  responses: {
    200: jsonResponse("State", CloudModelsState),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
    409: e409,
  },
});

export const turnOffCloudModels = createRoute({
  operationId: "turnOffSelfhostCloudModels",
  method: "post",
  path: "/v1/selfhost/cloud-models/off",
  tags: ["selfhost"],
  summary: "Turn Casama Cloud models off; each bot goes back to its previous key (server admin)",
  security,
  responses: {
    200: jsonResponse("Where each bot went", CloudModelsOff),
    401: e401,
    403: e403,
    404: e404,
  },
});
