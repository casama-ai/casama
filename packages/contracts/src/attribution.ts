import { z } from "@hono/zod-openapi";

/**
 * Ads attribution (docs/ADS-ATTRIBUTION-PLAN.md): where people came from, and the switch
 * that lets Casama tell Meta when someone who saw its ad joins or pays. Only labels and random ids:
 * never names, emails, chat content or full addresses.
 */

const label = (max: number) => z.string().trim().max(max).optional();

/**
 * The labels a visit arrived with, kept by casama.ai (or the web app) for the tab and sent with a
 * waitlist join or the web app's sign-in. `fbclid_at` is when the click id was first seen (ms).
 */
export const LandingLabels = z
  .object({
    utm_source: label(100),
    utm_medium: label(100),
    utm_campaign: label(150),
    utm_id: label(100),
    utm_term: label(100),
    utm_content: label(150),
    /** Meta's click id from the ad's link, unchanged in case. */
    fbclid: z
      .string()
      .trim()
      .max(500)
      .regex(/^[A-Za-z0-9_-]+$/)
      .optional(),
    fbclid_at: z.number().int().positive().optional(),
    /** The first outside site in the tab: host name only (reddit.com), never the full address. */
    ref_host: label(253),
    /** The page the visit landed on, path only. */
    landing: label(120),
    /** The casama.ai page that handed the visit on (/get), when it wasn't the landing page. */
    via: label(100),
  })
  .openapi("LandingLabels");

export const AttributionPlatform = z
  .enum(["ios", "android", "macos", "windows", "linux", "web"])
  .openapi("AttributionPlatform");

/**
 * The app's install record, posted after sign-in (never before). The Meta fields are filled only
 * while Meta's SDK runs on this device (official build, Casama Cloud, region allowed, switch on).
 */
export const PostAttributionInstallRequest = z
  .object({
    install_id: z.string().regex(/^[A-Za-z0-9_-]{8,64}$/),
    platform: AttributionPlatform,
    /** google_play, app_store, testflight, mac_app_store, direct, web… */
    distribution: label(32),
    app_version: label(32),
    /** Bundle id or package name. */
    app_package: label(100),
    os_version: label(32),
    device_model: label(64),
    locale: label(20),
    /** IANA name, e.g. Asia/Manila. */
    timezone: label(64),
    screen_width: z.number().int().min(0).max(20000).optional(),
    screen_height: z.number().int().min(0).max(20000).optional(),
    screen_density: z.number().min(0).max(20).optional(),
    cpu_cores: z.number().int().min(0).max(1024).optional(),
    /** Meta's anonymous id for this install (only while Meta's SDK runs). */
    meta_anon_id: z
      .string()
      .max(100)
      .regex(/^[A-Za-z0-9_:.-]+$/)
      .optional(),
    /** Only an `authorized` iPhone or iPad sends app events to Meta; ignored on other platforms. */
    ios_tracking: z
      .enum(["authorized", "denied", "restricted", "not_determined"])
      .optional()
      .openapi({
        description:
          "iPhone and iPad: the App Tracking Transparency state when the record was sent",
      }),
    /** GA4's app instance id, for joining our record to GA4. */
    ga4_app_instance_id: z
      .string()
      .max(64)
      .regex(/^[A-Za-z0-9_-]+$/)
      .optional(),
    /** Google Play's install referrer text, as the Play Install Referrer API gave it. */
    play_referrer: z.string().max(2000).optional(),
    /** The web app's (or a casama.ai hand-off's) landing labels. */
    landing: LandingLabels.optional(),
  })
  .openapi("PostAttributionInstallRequest");

export const HeardFrom = z
  .enum(["instagram", "facebook", "tiktok", "youtube", "friend", "search", "ai_assistant", "other"])
  .openapi("HeardFrom");

export const PostHeardFromRequest = z
  .object({
    /** Null: the person skipped the question (asked once, never again). */
    answer: HeardFrom.nullable(),
  })
  .openapi("PostHeardFromRequest");

export const PostCheckoutIntentRequest = z
  .object({
    org_id: z.string().uuid(),
    install_id: z
      .string()
      .regex(/^[A-Za-z0-9_-]{8,64}$/)
      .optional(),
    product_id: label(200),
  })
  .openapi("PostCheckoutIntentRequest");

export const SetAdsMeasurementRequest = z
  .object({ on: z.boolean() })
  .openapi("SetAdsMeasurementRequest");

/** The one credited source of a person, once the server has frozen it. */
export const Acquisition = z
  .object({
    source: z.string(),
    medium: z.string().nullable(),
    campaign: z.string().nullable(),
    ad_set: z.string().nullable(),
    ad: z.string().nullable(),
    network: z.string().nullable(),
    kind: z.string(),
  })
  .openapi("Acquisition");

export const AttributionStatus = z
  .object({
    /** "Help measure our ads" can be shown here: Casama Cloud, a region where it's allowed. */
    offered: z.boolean(),
    /** The switch's own value (on by default where offered). Analytics off turns it off too. */
    measure_ads: z.boolean(),
    /** Meta's SDK may start on this device: offered, switch on, analytics on. */
    meta_sdk_allowed: z.boolean(),
    /** The person answered (or skipped) "How did you hear about us?". */
    heard_from_asked: z.boolean(),
    acquisition: Acquisition.nullable(),
  })
  .openapi("AttributionStatus");
