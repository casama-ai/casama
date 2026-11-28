import { z } from "@hono/zod-openapi";

/** The ways the instance admin's Costs tab can cut the spend (docs/COST-BREAKDOWN-PLAN.md). */
export const CostGroup = z
  .enum(["service", "key", "app", "feature", "model", "workspace"])
  .openapi("CostGroup");
/**
 * Where a number comes from. metered: a real cost recorded per call. counted: the server's own
 * count times a unit price. fixed: a bill spread over its period. estimated: worked out from text
 * length, a lower bound.
 */
export const CostSource = z
  .enum(["metered", "counted", "fixed", "estimated"])
  .openapi("CostSource");

export const CostRowBilling = z.enum(["free", "metered", "own_servers"]).openapi("CostRowBilling");

const CostTotals = z
  .object({
    spent_usd: z
      .number()
      .openapi({ description: "Estimated usage cost at list prices, plus fixed bills when asked" }),
    paid_usd: z
      .number()
      .optional()
      .openapi({
        description:
          "Money that actually leaves the account (free plans and own-server shares are $0; included credits subtracted; fixed bills included when asked)",
      }),
    charged_usd: z.number().openapi({ description: "Taken from credits for usage" }),
    charged_tracked_usd: z
      .number()
      .openapi({ description: "The charged part whose cost is known per row: the margin's base" }),
    own_usd: z
      .number()
      .openapi({ description: "Paid by workspaces on their own keys: not the server's money" }),
    fixed_usd: z
      .number()
      .openapi({
        description: "Fixed bills in the period; inside spent_usd and paid_usd only when asked for",
      }),
    not_recorded_usd: z
      .number()
      .openapi({ description: "What vendors report above what the server recorded" }),
    calls: z.number().int(),
  })
  .openapi("AdminCostTotals");

export const AdminCostRow = z
  .object({
    id: z.string().openapi({ description: "The group's key; empty for rows that carry no label" }),
    label: z.string(),
    spent_usd: z.number(),
    paid_usd: z.number().optional(),
    charged_usd: z.number(),
    charged_tracked_usd: z.number(),
    calls: z.number().int(),
    previous_spent_usd: z.number().nullable(),
    previous_paid_usd: z.number().nullable().optional(),
    source: CostSource,
    /** How this service or key is billed: free ($0 paid), metered, or own_servers ($0 paid). */
    billing: CostRowBilling.optional(),
    /** Monthly usage credit (USD) included in this service's paid plan, when set. */
    included_usd: z.number().nullable().optional(),
    /** Free-plan quota cap meter (service rows when Vendors defines a cap). */
    cap_used: z.number().nullable().optional(),
    cap_limit: z.number().nullable().optional(),
    cap_unit: z.string().nullable().optional(),
    cap_period: z.enum(["day", "month", "billing_period", "prepaid"]).nullable().optional(),
    /** The vendor's own figure for this service or key, when it reports one. */
    reported_usd: z.number().nullable().optional(),
    /** Key rows: the service the key belongs to. */
    vendor: z.string().nullable().optional(),
    last_used_at: z.string().nullable().optional(),
    /** Workspace rows. */
    plan_code: z.string().nullable().optional(),
    /** App rows. spent_usd is the vendor's fees; the token cost is an estimate kept apart. */
    integration_kind: z.string().nullable().optional(),
    failed: z.number().int().nullable().optional(),
    token_usd_est: z.number().nullable().optional(),
  })
  .openapi("AdminCostRow");

export const AdminCosts = z
  .object({
    from: z.string().openapi({ description: "First UTC day, YYYY-MM-DD" }),
    to: z.string().openapi({ description: "Last UTC day, YYYY-MM-DD" }),
    group: CostGroup,
    include_fixed: z.boolean(),
    totals: CostTotals,
    /** The same number of days right before `from`; null when nothing is known that far back. */
    previous: CostTotals.nullable(),
    /** The chart's stacks: the biggest groups, then "other" (id `__other`). */
    series: z.array(z.object({ id: z.string(), label: z.string() })),
    /** One entry per day; `values` (estimated) and `paid_values` (paid) line up with `series`. */
    by_day: z.array(
      z.object({
        date: z.string(),
        values: z.array(z.number()),
        paid_values: z.array(z.number()).optional(),
      }),
    ),
    rows: z.array(AdminCostRow),
    /** When the daily tables were last rebuilt. */
    updated_at: z.string().nullable(),
  })
  .openapi("AdminCosts");

/** One of the server's own paid credentials: its name and what it spent. Never its value. */
export const AdminCostKey = z
  .object({
    key_ref: z
      .string()
      .openapi({ description: "The setting's name, e.g. CLOUD_MODEL_UPSTREAM_KEY" }),
    vendor: z.string(),
    vendor_label: z.string(),
    label: z.string(),
    purpose: z.string(),
    set_in: z.string().openapi({ description: "Where the value lives, e.g. the server's env" }),
    vault_item: z.string().nullable(),
    billing_url: z.string().nullable(),
    configured: z.boolean(),
    spent_usd: z.number(),
    paid_usd: z.number().optional(),
    billing: CostRowBilling.optional(),
    calls: z.number().int(),
    last_used_at: z.string().nullable(),
    reported_usd: z.number().nullable(),
    limit_usd: z.number().nullable(),
    limit_remaining_usd: z.number().nullable(),
  })
  .openapi("AdminCostKey");

const Day = z.string().regex(/^\d{4}-\d{2}-\d{2}$/);
/** The view the Costs tab asks for. Without `from`/`to`, the last `days` days (30). */
export const AdminCostsQuery = z.object({
  group: CostGroup.optional(),
  days: z.coerce.number().int().min(1).max(366).optional(),
  from: Day.optional(),
  to: Day.optional(),
  /** Filters: each narrows the view to one value of that grouping. */
  vendor: z.string().max(80).optional(),
  key_ref: z.string().max(80).optional(),
  feature: z.string().max(80).optional(),
  model: z.string().max(200).optional(),
  org_id: z.string().uuid().optional(),
  app: z.string().max(200).optional(),
  include_fixed: z.enum(["true", "false"]).optional(),
});
