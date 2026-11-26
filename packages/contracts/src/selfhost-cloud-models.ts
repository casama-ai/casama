import { z } from "@hono/zod-openapi";

/**
 * Casama Cloud models on a self-hosted server, the engine side
 * (docs/SELFHOST-CLOUD-MODELS-PLAN.md §13.3). Cloud's own endpoints are §13.1 and §13.2.
 */

const CloudJobModels = z.object({
  chat: z.string().nullable(),
  background: z.string().nullable(),
  embedding: z.string().nullable(),
  image: z.string().nullable(),
  tts: z.string().nullable(),
  stt: z.string().nullable(),
});

/** §13.1 `GET /link/v1/status`, as Cloud answered it (cached 60 s). */
export const CloudLinkStatus = z
  .object({
    scopes: z.array(z.string()),
    payer: z.object({ org_id: z.string(), name: z.string() }).nullable(),
    plan: z
      .object({
        code: z.string(),
        name: z.string(),
        paid: z.boolean(),
        ended: z
          .boolean()
          .optional()
          .openapi({ description: "The payer had a paid plan and it ended (not just never paid)" }),
      })
      .nullable(),
    models_allowed: z.boolean(),
    credits_usd: z.number(),
    included: z.object({ used_usd: z.number(), limit_usd: z.number() }).nullable(),
    today: z.object({
      spend_usd: z.number(),
      cap_usd: z.number().nullable(),
      resets_at: z.string().nullable(),
    }),
    seats: z.object({ plan: z.number(), used: z.number() }).nullable(),
    trial: z.object({ remaining_usd: z.number() }).nullable(),
    jobs: CloudJobModels.partial(),
  })
  .partial()
  .openapi("CloudLinkStatus");

export const CloudModelsPolicy = z
  .object({
    allowed: z
      .union([z.literal("all"), z.array(z.uuid()).max(10_000)])
      .openapi({ description: '"all", or the user ids who may use Casama Cloud' }),
    daily_usd_per_member: z.number().min(0).max(100_000).nullable(),
  })
  .openapi("CloudModelsPolicy");

export const CloudModelsFallback = z
  .object({
    to_own: z
      .boolean()
      .openapi({ description: "Casama Cloud refused or can't be reached: use an own key" }),
    from_own: z.boolean().openapi({ description: "An own key failed: use Casama Cloud" }),
  })
  .openapi("CloudModelsFallback");

/** §13.3 GET /v1/selfhost/cloud-models. */
export const CloudModelsState = z
  .object({
    available: z.boolean().openapi({
      description: "False on Casama Cloud itself and on a server without a license in force",
    }),
    connected: z.boolean(),
    can_manage: z.boolean(),
    payer: z.object({ org_id: z.string(), name: z.string() }).nullable(),
    status: CloudLinkStatus.nullable(),
    policy: CloudModelsPolicy,
    fallback: CloudModelsFallback,
    embedding: z.boolean(),
    me: z.object({
      allowed: z.boolean(),
      today_usd: z.number(),
      limit_usd: z.number().nullable(),
    }),
    /** Memory re-indexing after the embedding model changed; null when none is running. */
    memory_reindex: z.object({ done: z.number().int(), total: z.number().int() }).nullable(),
    status_error: z.object({ code: z.string(), message: z.string() }).nullable().openapi({
      description:
        "Why Casama Cloud isn't answering: the last refusal from Cloud's status call, or a run's when Cloud itself couldn't be reached. Null when fine",
    }),
    has_own_key: z
      .boolean()
      .openapi({ description: "A working own chat key exists on this server" }),
  })
  .openapi("CloudModelsState");

/** §13.3 PATCH /v1/selfhost/cloud-models: who may use it, limits and fallbacks, without re-applying. */
export const UpdateCloudModelsRequest = z
  .object({
    policy: CloudModelsPolicy.optional(),
    fallback: CloudModelsFallback.optional(),
  })
  .openapi("UpdateCloudModelsRequest");

export const ConnectCloudModelsRequest = z
  .object({ code: z.string().min(4).max(200) })
  .openapi("ConnectCloudModelsRequest");

const PreviewFrom = z.object({
  credential_id: z.string().nullable(),
  provider: z.string().nullable(),
  model: z.string().nullable(),
  label: z.string().nullable(),
  working: z.boolean(),
});

/** §13.3 GET /v1/selfhost/cloud-models/preview. */
export const CloudModelsPreview = z
  .object({
    bots: z.array(
      z.object({
        id: z.uuid(),
        name: z.string(),
        from: PreviewFrom,
        suggested: z.boolean(),
        step_down: z.boolean(),
      }),
    ),
    jobs: z.object({
      embedding: z.object({ has_own: z.boolean() }),
      image: z.object({ has_own: z.boolean() }),
      tts: z.object({ has_own: z.boolean() }),
      stt: z.object({ has_own: z.boolean() }),
    }),
  })
  .openapi("CloudModelsPreview");

/** §13.3 POST /v1/selfhost/cloud-models/apply. */
export const ApplyCloudModelsRequest = z
  .object({
    bots: z.array(z.uuid()).max(10_000),
    workspace_default: z.boolean().optional(),
    embedding: z.boolean().optional(),
    fallback: CloudModelsFallback.optional(),
    policy: CloudModelsPolicy.optional(),
  })
  .openapi("ApplyCloudModelsRequest");

/** §13.3 POST /v1/selfhost/cloud-models/off. */
export const CloudModelsOff = z
  .object({
    bots: z.array(
      z.object({
        id: z.uuid(),
        name: z.string(),
        to: z.object({ label: z.string() }).nullable(),
      }),
    ),
  })
  .openapi("CloudModelsOff");
