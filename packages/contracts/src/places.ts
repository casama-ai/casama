import { z } from "@hono/zod-openapi";
import { Uuid } from "./common.ts";

/**
 * Computer places (docs/COMPUTER-PLACES-PLAN.md): a bot keeps its own computer and may also work
 * on the computer of the person it acts for. Each person says, per bot, where it works for them.
 */
export const PlaceMode = z.enum(["auto", "bot_computer", "my_computer"]).openapi("PlaceMode", {
  description:
    "auto: the bot picks per action, its own computer unless it says otherwise. bot_computer: only the bot's own computer; yours isn't offered. my_computer: your computer unless the bot names its own",
});

export const PlaceWhere = z.enum(["bot_computer", "my_computer"]).openapi("PlaceWhere");

export const BotPlace = z
  .object({
    where: PlaceWhere,
    computer_id: Uuid,
    /** Set for one of your own computers: the device that pairs it. */
    device_id: Uuid.nullable(),
    name: z.string(),
    kind: z.enum(["private", "team", "local"]),
    /** macos, windows or linux for one of your own computers; null for the bot's. */
    platform: z.string().nullable(),
    /**
     * The bot's own computer: whether this server can run it at all. One of yours: whether the
     * Casama desktop app is connected right now.
     */
    online: z.boolean(),
    /** What you allowed on one of your own computers (shell, files, browser, desktop…). */
    capabilities: z.record(z.string(), z.boolean()),
    /** Of your own computers, the one the bot uses when several let it in. */
    selected: z.boolean(),
  })
  .openapi("BotPlace");

export const BotPlaces = z
  .object({
    bot_id: Uuid,
    /** The bot's own computer first (when it has one), then each of your computers that lets it in. */
    places: z.array(BotPlace),
    mode: PlaceMode,
    /** The computer of yours you picked, when you picked one. */
    device_id: Uuid.nullable(),
  })
  .openapi("BotPlaces");

export const SetPlacePreferenceRequest = z
  .object({
    mode: PlaceMode.optional(),
    device_id: Uuid.nullable().optional().openapi({
      description:
        "Which of your computers the bot uses when several let it in; null goes back to the one last seen",
    }),
  })
  .refine((b) => b.mode !== undefined || b.device_id !== undefined, "Give mode or device_id")
  .openapi("SetPlacePreferenceRequest");
