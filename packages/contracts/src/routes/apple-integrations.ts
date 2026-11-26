import { createRoute, z } from "@hono/zod-openapi";
import {
  DeletedFileKey,
  DeviceQuietResult,
  FileKey,
  FileKeyCreate,
  FileKeyCreated,
  UpdateDeviceQuietRequest,
} from "../apple-integrations.ts";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";

const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404 } = problemResponses;
const idParam = z.object({ id: Uuid });

export const updateDeviceQuiet = createRoute({
  operationId: "updateDeviceQuiet",
  method: "patch",
  path: "/v1/devices/{id}",
  tags: ["devices"],
  security,
  summary: "Hold proactive check-ins for a device while a Focus filter is active",
  request: {
    params: idParam,
    body: jsonBody(UpdateDeviceQuietRequest),
  },
  responses: {
    200: jsonResponse("Updated", DeviceQuietResult),
    400: e400,
    401: e401,
    404: e404,
  },
});

export const createFileKey = createRoute({
  operationId: "createFileKey",
  method: "post",
  path: "/v1/file-keys",
  tags: ["files"],
  security,
  summary:
    "Create a read-only File Provider key (cfk_…) shown once, for browsing and downloading computer files in Files and Finder",
  request: { body: jsonBody(FileKeyCreate) },
  responses: {
    201: jsonResponse("Created", FileKeyCreated),
    400: e400,
    401: e401,
    403: e403,
    404: e404,
  },
});

export const listFileKeys = createRoute({
  operationId: "listFileKeys",
  method: "get",
  path: "/v1/file-keys",
  tags: ["files"],
  security,
  summary: "List your read-only File Provider keys",
  responses: {
    200: jsonResponse("File keys", z.object({ items: z.array(FileKey) }).openapi("FileKeyList")),
    401: e401,
  },
});

export const deleteFileKey = createRoute({
  operationId: "deleteFileKey",
  method: "delete",
  path: "/v1/file-keys/{id}",
  tags: ["files"],
  security,
  summary: "Revoke a read-only File Provider key (sign-out)",
  request: { params: idParam },
  responses: {
    200: jsonResponse("Deleted", DeletedFileKey),
    401: e401,
    404: e404,
  },
});
