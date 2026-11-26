import { z } from "@hono/zod-openapi";

/**
 * Self-hosted engine licenses (docs/SELF-HOSTING-PLAN.md §11.4–§11.6). Casama Cloud signs the
 * keys (routes/selfhost.ts, "Cloud API"); a self-hosted server checks them and reports its state
 * ("Engine API").
 */

export const LicenseEdition = z.enum(["personal", "trial", "business"]).openapi("LicenseEdition");
export const LicenseFeature = z
  .enum(["audit_export", "sso", "advanced_roles", "audit_forwarding"])
  .openapi("LicenseFeature");

// --- Cloud API -----------------------------------------------------------------------------------

export const PersonalLicenseRequest = z
  .object({
    /** The self-hosted server's id (CASAMA_INSTANCE_ID). */
    instance_id: z.uuid(),
    engine_version: z.string().min(1).max(64),
  })
  .openapi("PersonalLicenseRequest");

export const RenewLicenseRequest = z
  .object({
    license: z.string().min(20).max(8000),
    instance_id: z.uuid(),
    engine_version: z.string().min(1).max(64),
    /** The daily check-in's counts (numbers only): accounts and bots on the server. */
    members: z.number().int().min(0).max(10_000_000).optional(),
    bots: z.number().int().min(0).max(10_000_000).optional(),
  })
  .openapi("RenewLicenseRequest");

export const LicenseIssued = z
  .object({
    /** The signed key (a JWT). */
    license: z.string(),
    expires_at: z.iso.datetime(),
  })
  .openapi("LicenseIssued");

export const TrialLicenseRequest = z
  .object({ email: z.string().min(3).max(254) })
  .openapi("TrialLicenseRequest");

export const TrialLicenseAccepted = z
  .object({ ok: z.literal(true) })
  .openapi("TrialLicenseAccepted");

export const CreateBusinessLicenseRequest = z
  .object({
    customer: z.string().min(1).max(200),
    /** Where the key is emailed. */
    email: z.string().min(3).max(254),
    seats: z.number().int().min(1).max(100_000),
    features: z.array(LicenseFeature).max(10).optional(),
    /** The end of the license (the contract). */
    expires_at: z.iso.datetime(),
    /** An annual key that never renews and isn't bound to one server. */
    offline: z.boolean().optional(),
  })
  .openapi("CreateBusinessLicenseRequest");

export const BusinessLicenseCreated = z
  .object({
    id: z.uuid(),
    /** The signed key, shown once (also emailed). */
    license: z.string(),
    expires_at: z.iso.datetime(),
  })
  .openapi("BusinessLicenseCreated");

export const SelfhostLicenseRow = z
  .object({
    id: z.uuid(),
    edition: LicenseEdition,
    account_id: z.uuid().nullable(),
    customer: z.string().nullable(),
    email: z.string().nullable(),
    instance_id: z.uuid().nullable(),
    seats: z.number().int(),
    features: z.array(z.string()),
    offline: z.boolean(),
    issued_at: z.iso.datetime(),
    expires_at: z.iso.datetime(),
    valid_until: z.iso.datetime().nullable(),
    last_renewed_at: z.iso.datetime().nullable(),
    engine_version: z.string().nullable(),
    /** The server's latest daily check-in and its counts. */
    last_checkin_at: z.iso.datetime().nullable(),
    members: z.number().int().nullable(),
    bots: z.number().int().nullable(),
    revoked: z.boolean(),
    revoked_at: z.iso.datetime().nullable(),
  })
  .openapi("SelfhostLicenseRow");

export const SelfhostLicenseList = z
  .object({ items: z.array(SelfhostLicenseRow) })
  .openapi("SelfhostLicenseList");

export const SelfhostLicenseQuery = z.object({
  edition: LicenseEdition.optional(),
  /** Matches the email, customer or account id. */
  q: z.string().max(200).optional(),
  limit: z.coerce.number().int().min(1).max(500).optional(),
  offset: z.coerce.number().int().min(0).optional(),
});

const DayCount = z.object({ day: z.string(), count: z.number().int() });

/** Admin Growth's "Self-host" section (docs/SELF-HOSTING-PLAN.md §6.5). */
export const SelfhostStats = z
  .object({
    /** Servers that checked in each UTC day, the last 30 days, oldest first. */
    daily_active: z.array(DayCount),
    /** New licenses each UTC day (installs and trials), the last 30 days, oldest first. */
    new_installs: z.array(DayCount),
    /** Servers that checked in within 24 hours. */
    active_24h: z.number().int(),
    by_edition: z.array(
      z.object({
        edition: z.enum(["personal", "trial", "business"]),
        /** Checked in within 24 hours. */
        active: z.number().int(),
        /** Not revoked. */
        total: z.number().int(),
      }),
    ),
    /** Servers that checked in within 24 hours, by engine version. */
    by_engine_version: z.array(z.object({ engine_version: z.string(), servers: z.number().int() })),
    /** Licenses not revoked whose server hasn't checked in for more than 7 days. */
    lapsed: z.number().int(),
    /** Accounts and bots on the servers that checked in within 24 hours. */
    members: z.number().int(),
    bots: z.number().int(),
  })
  .openapi("SelfhostStats");

// --- Engine API ----------------------------------------------------------------------------------

export const SelfhostStatus = z
  .object({
    /** false on Casama Cloud and on servers without license enforcement: nothing else is sent. */
    licensing: z.boolean(),
    state: z.enum(["setup", "active", "grace", "expired"]).optional(),
    edition: z.enum(["personal", "trial", "business"]).nullable().optional(),
    instance_id: z.string().optional(),
    expires_at: z.iso.datetime().nullable().optional(),
    /** New bot runs stop after this (14 days after expires_at). */
    grace_until: z.iso.datetime().nullable().optional(),
    /** Accounts on this server. */
    members: z.number().int().optional(),
    seats: z.number().int().nullable().optional(),
    engine_version: z.string().optional(),
  })
  .openapi("SelfhostStatus");

export const SetSelfhostLicenseRequest = z
  .object({ license: z.string().min(20).max(8000) })
  .openapi("SetSelfhostLicenseRequest");
