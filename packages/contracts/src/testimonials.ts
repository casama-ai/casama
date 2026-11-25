import { z } from "@hono/zod-openapi";
import { Uuid } from "./common.ts";

/**
 * Testimonials (D-545, docs/TESTIMONIALS-PLAN.md): short quotes from real people, with consent on
 * record, chosen by an instance owner. See routes/testimonials.ts.
 */

export const TestimonialPlace = z
  .enum(["site_home", "site_pricing", "app_paywall", "app_signin"])
  .openapi("TestimonialPlace");
export const TestimonialSource = z
  .enum(["email", "in_app", "toolradar", "app_store", "play", "other"])
  .openapi("TestimonialSource");
export const TestimonialState = z
  .enum(["draft", "live", "hidden", "withdrawn"])
  .openapi("TestimonialState");

/** One quote as everyone may see it. Never ids, emails, accounts or the consent record. */
export const PublicTestimonial = z
  .object({
    quote: z.string(),
    name_shown: z.string(),
    role_shown: z.string().nullable(),
    rating: z.number().int().min(1).max(5).nullable(),
    source: TestimonialSource,
    source_url: z.string().nullable(),
    /** Set when the person was given something for it ("Received a discount"); shown as a label. */
    incentive_note: z.string().nullable(),
  })
  .openapi("PublicTestimonial");

export const PublicTestimonials = z
  .object({ items: z.array(PublicTestimonial) })
  .openapi("PublicTestimonials");

export const AdminTestimonial = z
  .object({
    id: Uuid,
    quote: z.string(),
    name_shown: z.string(),
    role_shown: z.string().nullable(),
    source: TestimonialSource,
    source_url: z.string().nullable(),
    consent_text: z.string().nullable(),
    consent_at: z.iso.datetime().nullable(),
    /** The person's Casama account email, when the quote is tied to one (owner only). */
    user_email: z.string().nullable(),
    rating: z.number().int().min(1).max(5).nullable(),
    incentive_note: z.string().nullable(),
    places: z.array(TestimonialPlace),
    sort: z.number().int(),
    state: TestimonialState,
    notes: z.string().nullable(),
    created_at: z.iso.datetime(),
    updated_at: z.iso.datetime(),
    withdrawn_at: z.iso.datetime().nullable(),
  })
  .openapi("AdminTestimonial");

export const AdminTestimonials = z
  .object({ items: z.array(AdminTestimonial) })
  .openapi("AdminTestimonials");

/** An https:// link; "" clears it (the Dart client can't send null). */
const Https = z
  .string()
  .max(500)
  .regex(/^(https:\/\/\S+)?$/, "An https:// link");

export const CreateAdminTestimonialRequest = z
  .object({
    quote: z.string().trim().min(1).max(280),
    name_shown: z.string().trim().min(1).max(60),
    role_shown: z.string().trim().max(80).nullable().optional(),
    source: TestimonialSource,
    source_url: Https.nullable().optional(),
    /** What the person said yes to, word for word. Required before the quote can go live. */
    consent_text: z.string().trim().max(2000).nullable().optional(),
    /** When they said yes; defaults to now when consent_text is given. */
    consent_at: z.iso.datetime().nullable().optional(),
    /** Ties the quote to a Casama account, so deleting the account withdraws it; "" unties it. */
    user_email: z.string().max(320).nullable().optional(),
    /** 1 to 5 stars; 0 or null for none. */
    rating: z.number().int().min(0).max(5).nullable().optional(),
    incentive_note: z.string().trim().max(80).nullable().optional(),
    places: z.array(TestimonialPlace).max(4).optional(),
    sort: z.number().int().min(-100000).max(100000).optional(),
    state: TestimonialState.optional(),
    notes: z.string().max(2000).nullable().optional(),
  })
  .openapi("CreateAdminTestimonialRequest");

export const UpdateAdminTestimonialRequest = CreateAdminTestimonialRequest.partial().openapi(
  "UpdateAdminTestimonialRequest",
);

export const ReorderAdminTestimonialsRequest = z
  .object({ ids: z.array(Uuid).min(1).max(500) })
  .openapi("ReorderAdminTestimonialsRequest", {
    description: "Every id in the new order; sort becomes its position",
  });

/** The app's "Tell us in a sentence" sheet. It always lands as a draft. */
export const SubmitTestimonialRequest = z
  .object({
    quote: z.string().min(1).max(280),
    /** The person ticked "You can quote this on casama.ai and in the app as <name>". */
    consent: z.boolean(),
    org_id: Uuid.optional(),
    platform: z.string().max(40).optional(),
  })
  .openapi("SubmitTestimonialRequest");

export const TestimonialAsk = z
  .object({
    /** Whether this person may send one now (one per 90 days). */
    can_send: z.boolean(),
    /** The name a quote would show: first name and last initial, from the profile. */
    name_shown: z.string().nullable(),
  })
  .openapi("TestimonialAsk");

export const SubmittedTestimonial = z.object({ ok: z.boolean() }).openapi("SubmittedTestimonial");
