import { z } from "@hono/zod-openapi";
import { Uuid } from "./common.ts";

/** Casama Partners (D-543, docs/CREATOR-PROGRAM-PLAN.md): see routes/partners.ts. */

/** 3 to 20 letters and digits; any case (stored uppercase). */
const Code = z.string().min(3).max(40);

export const PartnerMe = z
  .object({
    /** Off on this server (self-hosted, or billing off): the app hides partner codes. */
    enabled: z.boolean(),
    /** The creator who sent you, once you entered their code or opened their link. */
    sent_by: z
      .object({
        code: z.string(),
        name: z.string(),
        picture: z.string().nullable(),
        claimed_at: z.iso.datetime(),
      })
      .nullable(),
    /** You can still enter a creator's code (a new account that hasn't paid). */
    can_claim: z.boolean(),
    claim_days_left: z.number().int(),
    /** You are a partner: your code and link. Earnings and payouts are in the partner portal. */
    partner: z
      .object({ code: z.string(), link: z.string(), status: z.string(), portal_url: z.string() })
      .nullable(),
  })
  .openapi("PartnerMe");

export const ClaimPartnerRequest = z
  .object({
    /** The creator's code, or their casama.ai/c/<code> link. */
    code: z.string().min(1).max(200),
    /** How the code reached the app: opened link, Play install referrer, or typed. */
    via: z.enum(["link_web", "play_referrer", "typed"]).optional(),
  })
  .openapi("ClaimPartnerRequest");

export const PartnerPreview = z
  .object({
    code: z.string(),
    /** The creator's name as they chose it. */
    name: z.string(),
    picture: z.string().nullable(),
  })
  .openapi("PartnerPreview");

export const AdminPartnerCode = z
  .object({
    code: z.string(),
    status: z.enum(["active", "paused", "retired"]),
    dodo_discount_code: z.string().nullable(),
    apple_offer_code: z.string().nullable(),
    play_promo_code: z.string().nullable(),
    /** Also a waitlist pass while sign-up is by invitation. */
    waitlist: z.boolean(),
  })
  .openapi("AdminPartnerCode");

export const AdminPartner = z
  .object({
    id: Uuid,
    display_name: z.string(),
    email: z.string().nullable(),
    picture_url: z.string().nullable(),
    channel_url: z.string().nullable(),
    country: z.string().nullable(),
    status: z.enum(["applied", "active", "paused", "banned", "left"]),
    /** This partner's own rate; null uses the server's. */
    rate: z.number().nullable(),
    tolt_partner_id: z.string().nullable(),
    /** Their Casama account, when linked. */
    user_id: Uuid.nullable(),
    notes: z.string().nullable(),
    codes: z.array(AdminPartnerCode),
    referred: z.number().int(),
    paying: z.number().int(),
    pending_usd: z.number(),
    payable_usd: z.number(),
    paid_usd: z.number(),
    created_at: z.iso.datetime(),
  })
  .openapi("AdminPartner");

export const AdminPartners = z
  .object({
    enabled: z.boolean(),
    /** Tolt is connected (commissions are sent there). */
    platform: z.string().nullable(),
    rate: z.number(),
    hold_days: z.number().int(),
    totals: z.object({
      pending_usd: z.number(),
      payable_usd: z.number(),
      paid_usd: z.number(),
      /** Charges whose net couldn't be read: they earn nothing until fixed. */
      unread_charges: z.number().int(),
      /** Rows Tolt refused; see the commission list. */
      sync_failed: z.number().int(),
    }),
    partners: z.array(AdminPartner),
  })
  .openapi("AdminPartners");

export const CreateAdminPartnerRequest = z
  .object({
    display_name: z.string().min(1).max(80),
    email: z.email().max(320).optional(),
    channel_url: z.string().max(500).optional(),
    tolt_partner_id: z.string().max(64).optional(),
  })
  .openapi("CreateAdminPartnerRequest");

export const UpdateAdminPartnerRequest = z
  .object({
    display_name: z.string().min(1).max(80).optional(),
    picture_url: z.string().max(500).nullable().optional(),
    channel_url: z.string().max(500).nullable().optional(),
    status: z.enum(["applied", "active", "paused", "banned", "left"]).optional(),
    rate: z.number().min(0).max(1).nullable().optional(),
    notes: z.string().max(2000).nullable().optional(),
    /** Links their Casama account by its email (never earns on itself); null unlinks. */
    user_email: z.email().nullable().optional(),
  })
  .openapi("UpdateAdminPartnerRequest");

export const CreateAdminPartnerCodeRequest = z
  .object({
    code: Code,
    dodo_discount_code: z.string().max(64).optional(),
    apple_offer_code: z.string().max(64).optional(),
    play_promo_code: z.string().max(64).optional(),
    /** People the code can let in while sign-up is by invitation; 0 = not a waitlist pass. */
    waitlist_uses: z.number().int().min(0).max(100_000).optional(),
  })
  .openapi("CreateAdminPartnerCodeRequest");

export const UpdateAdminPartnerCodeRequest = z
  .object({
    status: z.enum(["active", "paused", "retired"]).optional(),
    dodo_discount_code: z.string().max(64).nullable().optional(),
    apple_offer_code: z.string().max(64).nullable().optional(),
    play_promo_code: z.string().max(64).nullable().optional(),
  })
  .openapi("UpdateAdminPartnerCodeRequest");

export const AdminPartnerCommission = z
  .object({
    id: Uuid,
    partner_id: Uuid,
    partner_name: z.string(),
    kind: z.enum(["sale", "reversal", "manual"]),
    source: z.string().nullable(),
    base_usd: z.number(),
    rate: z.number(),
    amount_usd: z.number(),
    status: z.enum(["pending", "payable", "paid", "held_for_review", "void"]),
    hold_until: z.iso.datetime(),
    note: z.string().nullable(),
    sync_state: z.string(),
    sync_error: z.string().nullable(),
    paid_at: z.iso.datetime().nullable(),
    created_at: z.iso.datetime(),
  })
  .openapi("AdminPartnerCommission");

export const UpdateAdminPartnerCommissionRequest = z
  .object({
    /** hold: stop it for review; release: back to pending/payable; void: never pay it. */
    action: z.enum(["hold", "release", "void"]),
    note: z.string().max(300).optional(),
  })
  .openapi("UpdateAdminPartnerCommissionRequest");

export const AdminPartnerSync = z
  .object({ partners: z.number().int(), paid: z.number().int(), pushed: z.number().int() })
  .openapi("AdminPartnerSync");
