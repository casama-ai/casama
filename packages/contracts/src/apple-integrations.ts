import { z } from "@hono/zod-openapi";
import { Uuid } from "./common.ts";

/**
 * Apple integrations (docs/APPLE-INTEGRATIONS-PLAN.md):
 * - Focus filter device quiet_until (item 6)
 * - Read-only File Provider keys (item 20, D-405)
 */

export const UpdateDeviceQuietRequest = z
  .object({
    quiet_until: z.iso.datetime({ offset: true }).nullable().openapi({
      description:
        "Hold proactive check-in pushes to this device until this time; null clears the hold",
    }),
  })
  .openapi("UpdateDeviceQuietRequest");

export const DeviceQuietResult = z
  .object({
    id: Uuid,
    quiet_until: z.iso.datetime({ offset: true }).nullable(),
  })
  .openapi("DeviceQuietResult");

export const FileKey = z
  .object({
    id: Uuid,
    org_id: Uuid,
    platform: z.enum(["ios", "macos"]),
    label: z.string().max(80).nullable(),
    last_used_at: z.iso.datetime({ offset: true }).nullable(),
    created_at: z.iso.datetime({ offset: true }),
  })
  .openapi("FileKey");

export const FileKeyCreate = z
  .object({
    org_id: Uuid,
    platform: z.enum(["ios", "macos"]),
    label: z.string().trim().min(1).max(80).optional(),
  })
  .openapi("FileKeyCreate");

export const FileKeyCreated = FileKey.extend({
  key: z.string().openapi({
    description:
      "Read-only File Provider key (cfk_…), shown once. Send as Authorization: FileKey <key>",
  }),
}).openapi("FileKeyCreated");

export const DeletedFileKey = z
  .object({
    deleted: Uuid,
  })
  .openapi("DeletedFileKey");
