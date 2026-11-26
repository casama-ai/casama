import { z } from "@hono/zod-openapi";

/** Owner alerts and live activity (D-527): see routes/owner.ts. */

export const OwnerEventKind = z
  .enum([
    "server_alarm",
    "waitlist_joined",
    "waitlist_admitted",
    "signup",
    "signup_refused",
    "first_chat",
    "milestone",
    "subscription",
    "subscription_ended",
    "purchase",
    "support_ticket",
    "feedback",
    "account_deleted",
    "download_click",
    "qr_open",
    "start_click",
    "invite_open",
    "app_first_open",
    "app_reinstall",
    "signin_started",
    "trial_started",
    "renewal",
    "refund",
    "dispute_opened",
    "store_review",
    "store_crashes",
    "day2_return",
    "week1_return",
    "device_gone",
    // Growth (D-546): creators, gifts, referrals, the newsletter and testimonials.
    "partner_interest",
    "creator_open",
    "partner_claimed",
    "gift_open",
    "comp_redeemed",
    "referral_rewarded",
    "newsletter_confirmed",
    "testimonial_submitted",
  ])
  .openapi("OwnerEventKind");

/** How far one person got (D-537): a click on casama.ai, the app opened, an account, a chat, paying. */
export const OwnerJourneySteps = z
  .object({
    click: z.boolean(),
    open: z.boolean(),
    signup: z.boolean(),
    chat: z.boolean(),
    paying: z.boolean(),
  })
  .openapi("OwnerJourneySteps");

/**
 * One person's or device's path from click to paying (D-537, docs/LIVE-ACTIVITY-V2-PLAN.md).
 * `likely` means the click was matched to the first open by platform, country and time, not by id.
 */
export const OwnerJourney = z
  .object({
    id: z.string(),
    likely: z.boolean(),
    click_platform: z.string().nullable(),
    platform: z.string().nullable(),
    distribution: z.string().nullable(),
    app_version: z.string().nullable(),
    country: z.string().nullable(),
    source: z.string().nullable(),
    medium: z.string().nullable(),
    campaign: z.string().nullable(),
    landing: z.string().nullable(),
    page: z.string().nullable(),
    first_click_at: z.string().nullable(),
    first_open_at: z.string().nullable(),
    signin_started_at: z.string().nullable(),
    signup_at: z.string().nullable(),
    steps: OwnerJourneySteps,
  })
  .openapi("OwnerJourney");

export const OwnerEvent = z
  .object({
    id: z.number().int(),
    /** One of OwnerEventKind; newer servers may add kinds, so read it as text. */
    kind: z.string(),
    /** A masked address (`ol•••@gmail.com`), never a full one. */
    label: z.string().nullable(),
    user_id: z.string().nullable(),
    /** Kind-specific facts: source, via, platform, plan, page, country… */
    detail: z.record(z.string(), z.unknown()),
    /** The journey this event belongs to (D-537); null for events outside any journey. */
    journey_id: z.string().nullable(),
    journey: OwnerJourney.nullable(),
    /** The push's words for this event. */
    title: z.string(),
    body: z.string(),
    created_at: z.string(),
  })
  .openapi("OwnerEvent");

export const OwnerActivityQuery = z.object({
  /** Only events newer than this id (polling for new ones). */
  after: z.coerce.number().int().optional(),
  /** Only events older than this id (paging back). */
  before: z.coerce.number().int().optional(),
  /** Comma-separated kinds. */
  kinds: z.string().max(400).optional(),
  limit: z.coerce.number().int().min(1).max(200).optional(),
});

export const OwnerActivity = z
  .object({
    items: z.array(OwnerEvent),
    /** Events of each kind since midnight in the owner's time zone. */
    today: z.record(z.string(), z.number().int()),
  })
  .openapi("OwnerActivity");

/** What the owner knows about the person behind a journey now (D-537). */
export const OwnerJourneyPerson = z
  .object({
    email: z.string().nullable(),
    name: z.string().nullable(),
    created_at: z.string().nullable(),
    plan: z.string().nullable(),
    plan_status: z.string().nullable(),
    messages: z.number().int(),
    bots: z.number().int(),
    devices: z.array(z.string()),
    last_active_at: z.string().nullable(),
  })
  .openapi("OwnerJourneyPerson");

export const OwnerJourneyDetail = z
  .object({
    journey: OwnerJourney,
    /** Oldest first. */
    events: z.array(OwnerEvent),
    person: OwnerJourneyPerson.nullable(),
  })
  .openapi("OwnerJourneyDetail");

/** The app's first open, or its first sign-in attempt, on one install (D-537). No sign-in needed. */
export const InstallEventRequest = z
  .object({
    event: z.enum(["first_open", "signin_started"]),
    /** A random id the app made on this install; never tied to the device or an ad id. */
    install_id: z.string().regex(/^[A-Za-z0-9_-]{8,64}$/),
    /** The website click this install came from (Play install referrer, the web app's link). */
    click_id: z
      .string()
      .regex(/^[A-Za-z0-9_-]{8,64}$/)
      .optional(),
    /** The app found an earlier install's id kept by the system (iOS keychain). */
    reinstall: z.boolean().optional(),
    platform: z.enum(["ios", "android", "macos", "windows", "linux", "web"]),
    /** Where this build came from: app_store, testflight, play, mac_app_store, dmg, apk, snap, web… */
    distribution: z.string().max(40).optional(),
    version: z.string().max(40).optional(),
    locale: z.string().max(20).optional(),
    source: z.string().max(80).optional(),
    medium: z.string().max(60).optional(),
    campaign: z.string().max(100).optional(),
    landing: z.string().max(120).optional(),
  })
  .openapi("InstallEventRequest");

export const OwnerAlertKind = z
  .object({ kind: z.string(), on: z.boolean(), default_on: z.boolean() })
  .openapi("OwnerAlertKind");

export const OwnerAlertSettings = z
  .object({ paused: z.boolean(), kinds: z.array(OwnerAlertKind) })
  .openapi("OwnerAlertSettings");

export const UpdateOwnerAlertSettings = z
  .object({
    paused: z.boolean().optional(),
    /** {kind: on}; only the kinds to change. */
    kinds: z.record(z.string(), z.boolean()).optional(),
  })
  .openapi("UpdateOwnerAlertSettings");

export const SiteEventRequest = z
  .object({
    kind: z.enum([
      "download_click",
      "qr_open",
      "start_click",
      "invite_open",
      "partner_interest",
      "creator_open",
      "gift_open",
      "newsletter_confirmed",
    ]),
    platform: z.string().max(40).optional(),
    page: z.string().max(120).optional(),
    country: z.string().max(8).optional(),
    mobile: z.boolean().optional(),
    /** A random id the Worker made for this click (D-537), carried on to Play and the web app. */
    click_id: z
      .string()
      .regex(/^[A-Za-z0-9_-]{8,64}$/)
      .optional(),
    source: z.string().max(80).optional(),
    medium: z.string().max(60).optional(),
    campaign: z.string().max(100).optional(),
  })
  .openapi("SiteEventRequest");

export const OwnerOk = z.object({ ok: z.literal(true) }).openapi("OwnerOk");
