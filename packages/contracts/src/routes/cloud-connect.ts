import { createRoute } from "@hono/zod-openapi";
import { CloudConnectCode, CloudConnectCodeRequest } from "../cloud-connect.ts";
import { jsonBody, jsonResponse, problemResponses } from "../common.ts";

/** Casama Cloud models for self-hosted servers (docs/SELFHOST-CLOUD-MODELS-PLAN.md §13.1). */
const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404 } = problemResponses;

export const createCloudConnectCode = createRoute({
  operationId: "createCloudConnectCode",
  method: "post",
  path: "/v1/selfhost/cloud/connect-codes",
  tags: ["selfhost"],
  summary: "A one-time code that connects a self-hosted server to Casama Cloud models (admins)",
  description:
    "Casama Cloud only. The caller is an owner or admin of org_id, the workspace that will pay. The app hands the code to its own server, which redeems it at Casama Cloud within 10 minutes (POST /link/v1/cloud-models/redeem). Errors: 403 forbidden, 404 not_found where Casama Cloud models aren't offered.",
  security,
  request: { body: jsonBody(CloudConnectCodeRequest) },
  responses: {
    200: jsonResponse("The code", CloudConnectCode),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
  },
});
