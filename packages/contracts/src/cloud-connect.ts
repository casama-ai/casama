import { z } from "@hono/zod-openapi";
import { Uuid } from "./common.ts";

/**
 * Casama Cloud models for self-hosted servers (docs/SELFHOST-CLOUD-MODELS-PLAN.md §13.1): a Cloud
 * workspace admin's app asks Casama Cloud for a one-time connect code and hands it to its own
 * server, which redeems it at Casama Cloud. No Cloud session ever reaches the server.
 */

export const CloudConnectCodeRequest = z
  .object({
    /** The Cloud workspace that will pay for the server's model calls. */
    org_id: Uuid,
    /** The self-hosted server's id (CASAMA_INSTANCE_ID). */
    instance_id: z.string().regex(/^[A-Za-z0-9-]{8,64}$/),
    /** The server's name, for the key a server without one gets. */
    instance_name: z.string().min(1).max(80).optional(),
  })
  .openapi("CloudConnectCodeRequest");

export const CloudConnectCode = z
  .object({
    /** One-time, for this server only. */
    code: z.string(),
    expires_at: z.iso.datetime(),
  })
  .openapi("CloudConnectCode");
