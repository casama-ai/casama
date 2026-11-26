import { z } from "@hono/zod-openapi";

/**
 * Move to Casama Cloud, and back (docs/SELFHOST-CLOUD-MODELS-PLAN.md §4.4, §4.5, §7.5, §13.4).
 * Both ends run the same engine: the target (Casama Cloud or a self-hosted server) hands out a
 * one-time move token and receives the parts; the source checks, copies and cuts over.
 */

/** Where a workspace moved (`organizations.moved_to`). Old apps ignore it. */
export const MovedTo = z
  .object({
    url: z.string(),
    at: z.iso.datetime(),
    move_id: z.uuid(),
    /** Casama Cloud, or someone's own server. */
    target: z.enum(["cloud", "server"]),
    /** What the old server says to anyone still using it. */
    message: z.string(),
  })
  .openapi("MovedTo");

export const MoveState = z
  .enum(["created", "copying", "pausing", "finishing", "importing", "done", "failed", "cancelled"])
  .openapi("MoveState");

export const MoveError = z
  .object({ code: z.string(), message: z.string(), step: z.string().nullable().optional() })
  .openapi("MoveError");

// --- Target side ---------------------------------------------------------------------------------

export const CreateMoveRequest = z.object({ org_id: z.uuid() }).openapi("CreateMoveRequest");

export const MoveToken = z
  .object({
    move_id: z.uuid(),
    /** One-time; give it to the source server with the check. Carries the move id. */
    token: z.string(),
    expires_at: z.iso.datetime(),
  })
  .openapi("MoveToken");

export const MoveFitQuery = z
  .object({
    source_org_id: z.uuid(),
    members: z.coerce.number().int().min(0).max(1_000_000).default(0),
    bots: z.coerce.number().int().min(0).max(1_000_000).default(0),
    computers: z.coerce.number().int().min(0).max(1_000_000).default(0),
    storage_bytes: z.coerce.number().int().min(0).default(0),
    bundle_version: z.coerce.number().int().min(1).max(1000).default(1),
    engine_version: z.string().max(64).optional(),
  })
  .openapi("MoveFitQuery");

export const MoveOver = z
  .object({
    what: z.enum(["people", "bots", "computers", "storage"]),
    have: z.number(),
    limit: z.number(),
  })
  .openapi("MoveOver");

export const MoveFit = z
  .object({
    fits: z.boolean(),
    plan: z.object({ code: z.string(), name: z.string() }).nullable(),
    over: z.array(MoveOver),
    /** The smallest plan everything fits on, when the current one doesn't. */
    needs_plan: z.object({ code: z.string(), name: z.string() }).nullable(),
    /** Bundle versions this server reads; the source checks its own is one of them. */
    accepts: z.array(z.number().int()),
    engine_version: z.string(),
    /** The move key brought keys are sealed to (base64 SPKI, X25519). */
    move_key: z.string(),
    /** The receiving workspace: empty, or what's already there (moved items go alongside). */
    target: z.object({ org_id: z.uuid(), name: z.string(), empty: z.boolean() }),
  })
  .openapi("MoveFit");

export const MovePartReceived = z
  .object({ n: z.number().int(), size: z.number().int(), sha256: z.string() })
  .openapi("MovePartReceived");

export const MoveFinishRequest = z
  .object({
    /** The bundle's manifest (MOVE_BUNDLE_VERSION, entries and their parts). */
    manifest: z.record(z.string(), z.unknown()),
    /** HMAC-SHA256 of the manifest's JSON with the move token. */
    signature: z.string(),
  })
  .openapi("MoveFinishRequest");

export const MoveProgress = z
  .object({
    move_id: z.uuid(),
    role: z.enum(["source", "target"]),
    state: MoveState,
    step: z.string().nullable(),
    org_id: z.uuid().nullable(),
    remote_url: z.string().nullable(),
    bring_keys: z.boolean(),
    counts: z.record(z.string(), z.unknown()),
    progress: z.object({ done_bytes: z.number(), total_bytes: z.number() }),
    /** Target: the part numbers received so far (the source skips them when it resumes). */
    parts: z.array(z.number().int()).optional(),
    report: z.record(z.string(), z.unknown()),
    error: MoveError.nullable(),
    moved_to: MovedTo.nullable().optional(),
    created_at: z.iso.datetime(),
    updated_at: z.iso.datetime(),
    finished_at: z.iso.datetime().nullable(),
  })
  .openapi("MoveProgress");

// --- Source side ---------------------------------------------------------------------------------

export const MoveCheckRequest = z
  .object({ target_url: z.url().max(500), token: z.string().min(20).max(500) })
  .openapi("MoveCheckRequest");

export const MoveStartRequest = z
  .object({
    target_url: z.url().max(500),
    token: z.string().min(20).max(500),
    /** Model and chat app keys go along, sealed to the target's move key (decision 9). */
    bring_keys: z.boolean().default(true),
  })
  .openapi("MoveStartRequest");

export const MoveCheck = z
  .object({
    size_bytes: z.number(),
    /** Rough times: the whole move, and how long bots pause for. */
    estimate_seconds: z.number(),
    pause_seconds: z.number(),
    /** The pause would pass 5 minutes. */
    long_pause: z.boolean(),
    counts: z.record(z.string(), z.number()),
    fit: MoveFit,
    /** Null, or which end needs updating: "source" (this server) or "target". */
    update_first: z.enum(["source", "target"]).nullable(),
    /** What comes along. */
    comes: z.array(z.string()),
    /** What needs the person afterwards. */
    after: z.object({
      reconnect: z.array(z.object({ id: z.uuid(), name: z.string(), kind: z.string() })),
      invites: z.array(z.object({ name: z.string(), email: z.string() })),
      keys: z.object({ models: z.number(), chat_apps: z.number(), secrets: z.number() }),
      computers: z.number(),
      chatgpt_plans: z.number(),
    }),
    target: z.enum(["cloud", "server"]),
    already_moved: MovedTo.nullable(),
  })
  .openapi("MoveCheck");
