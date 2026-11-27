import { z } from "@hono/zod-openapi";

/** Dodo discount codes managed from Admin → Discount Codes (docs/DISCOUNT-ADMIN-PLAN.md). */
const timestamp = z.iso.datetime({ offset: true });
const planCode = z.string().trim().min(1).max(80);
const note = z.string().trim().max(200).nullable().optional();
const channel = z.string().trim().max(120).nullable().optional();

export const AdminDiscountPlan = z
  .object({
    code: z.string(),
    name: z.string(),
    interval: z.enum(["month", "year", "week"]),
    price_label: z.string().nullable(),
  })
  .openapi("AdminDiscountPlan");

export const AdminDiscountState = z
  .enum(["live", "scheduled", "used_up", "ended", "off"])
  .openapi("AdminDiscountState");

export const AdminDiscount = z
  .object({
    id: z.string(),
    code: z.string(),
    percent: z.number().nullable().openapi({
      description: "Percentage off (from basis points, e.g. 50 or 12.5); null for flat codes",
    }),
    cycles: z.number().int().nullable().openapi({
      description: "Subscription renewals covered; null means every renewal",
    }),
    max_uses: z.number().int().nullable(),
    used: z.number().int(),
    per_person: z.number().int().nullable(),
    plans: z.array(z.string()).openapi({
      description: "Plan codes; Dodo product ids unknown to this server appear as 'other'",
    }),
    starts_at: timestamp.nullable(),
    ends_at: timestamp.nullable(),
    // Plain string so a future Dodo eligibility value never breaks older clients' parse.
    who: z.string().openapi({
      description: "any, first_time, existing or specific",
    }),
    keep_on_plan_change: z.boolean(),
    state: AdminDiscountState,
    note: z.string().nullable(),
    channel: z.string().nullable(),
    made_by: z.string().nullable().openapi({
      description: "Masked email of the owner who made the code, or null if made in Dodo",
    }),
    made_in_casama: z.boolean(),
    created_at: timestamp.nullable(),
    link: z.string().nullable().openapi({
      description: "Share link when pricing page reads ?code=; null in v1",
    }),
  })
  .openapi("AdminDiscount");

export const AdminDiscountsResponse = z
  .object({
    discounts: z.array(AdminDiscount),
    plans: z.array(AdminDiscountPlan),
  })
  .openapi("AdminDiscountsResponse");

export const CreateAdminDiscountRequest = z
  .object({
    code: z
      .string()
      .trim()
      .min(3)
      .max(16)
      .regex(/^[A-Za-z0-9-]+$/, "Use 3–16 letters, digits, or hyphens"),
    percent: z.number().min(1).max(100),
    plans: z.array(planCode).min(1).max(30),
    cycles: z.number().int().min(1).max(36).nullable().optional(),
    max_uses: z.number().int().min(1).max(100000).nullable().optional(),
    per_person: z.number().int().min(1).max(100).nullable().optional(),
    starts_at: timestamp.nullable().optional(),
    ends_at: timestamp.nullable().optional(),
    who: z.enum(["any", "first_time"]).optional(),
    note,
    channel,
    confirm_large: z.boolean().optional().default(false),
  })
  .openapi("CreateAdminDiscountRequest");

export const UpdateAdminDiscountRequest = z
  .object({
    max_uses: z.number().int().min(1).max(100000).nullable().optional(),
    per_person: z.number().int().min(1).max(100).nullable().optional(),
    ends_at: timestamp.nullable().optional(),
    plans: z.array(planCode).min(1).max(30).optional(),
    note,
    channel,
    off: z.boolean().optional(),
    confirm_large: z.boolean().optional().default(false),
  })
  .openapi("UpdateAdminDiscountRequest");
