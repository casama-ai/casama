import { z } from "@hono/zod-openapi";
import { Uuid } from "./common.ts";

/**
 * The languages `profiles.locale` takes: English and the ones docs/LOCALIZATION-PLAN.md plans
 * (waves 1 to 3), each with an optional script and region ("de", "pt-BR", "zh-Hant-TW").
 */
export const ProfileLocale = z
  .string()
  .max(16)
  .regex(/^(en|es|pt|fr|de|ja|ko|zh|it|id|tr|vi|ar|hi)(-[A-Za-z]{4})?(-([A-Za-z]{2}|[0-9]{3}))?$/);

/** About you (D-169): see routes/about-you.ts. */
export const AboutYou = z
  .object({
    display_name: z.string().nullable(),
    preferred_name: z.string().nullable(),
    pronouns: z.string().nullable(),
    about: z.string(),
    reply_style: z.string(),
    learn: z.boolean(),
    /** The one-time "What should bots call you?" card was answered or dismissed. */
    name_asked: z.boolean(),
    /** Profile photo (D-202): the current photo's id, served at /v1/photos/{id}. */
    photo_id: Uuid.nullable().optional(),
    /** The sign-in provider (Google) shared a photo that "Use my Google photo" can copy. */
    provider_photo: z.boolean().optional(),
    /** The sign-in photo was already copied once (or found missing); it isn't copied again by itself. */
    photo_import_tried: z.boolean().optional(),
    /**
     * Adult sites (D-522): the person confirmed they're 18 or older and lets bots open adult
     * websites for them. Only used from web, desktop and direct-download apps.
     */
    adult_sites: z.boolean().optional(),
  })
  .openapi("AboutYou");

/** A new profile photo: a JPEG, PNG or WebP of at most 1 MB, base64-encoded. */
export const SetProfilePhotoRequest = z
  .object({
    content_type: z.enum(["image/jpeg", "image/png", "image/webp"]),
    data: z.base64().max(1_400_000),
  })
  .openapi("SetProfilePhotoRequest");

export const ImportProfilePhotoRequest = z
  .object({
    /** Copy it even if there's a photo already or it was copied before ("Use my Google photo"). */
    replace: z.boolean().optional(),
  })
  .openapi("ImportProfilePhotoRequest");

export const UpdateAboutYouRequest = z
  .object({
    preferred_name: z.string().max(60).nullable().optional(),
    pronouns: z.string().max(40).nullable().optional(),
    about: z.string().max(1500).optional(),
    reply_style: z.string().max(600).optional(),
    learn: z.boolean().optional(),
    name_asked: z.literal(true).optional(),
    /** Turning it on means the person confirms they're 18 or older (D-522). */
    adult_sites: z.boolean().optional(),
    /** The language the person picked, saved to the profile; null follows their device again. */
    locale: ProfileLocale.nullable().optional(),
  })
  .openapi("UpdateAboutYouRequest");

export const UserFact = z
  .object({
    id: Uuid,
    kind: z.enum(["fact", "preference"]),
    content: z.string(),
    pinned: z.boolean(),
    updated_at: z.iso.datetime({ offset: true }),
  })
  .openapi("UserFact");
