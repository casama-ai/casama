import { z } from "@hono/zod-openapi";
import { Uuid } from "./common.ts";

const ts = z.iso.datetime({ offset: true });

export const BotCheckins = z
  .object({
    enabled: z.boolean(),
    brief_time: z
      .string()
      .regex(/^([01]\d|2[0-3]):[0-5]\d$/)
      .openapi({ description: "Local time, HH:MM" }),
    scan_every_hours: z.number().int().min(1).max(24),
    daily_cap_usd: z.number().positive().max(100),
  })
  .openapi("BotCheckins");

export const SuggestionKind = z
  .enum(["do", "answer", "turn_on", "remind", "look"])
  .openapi("SuggestionKind");

export const Suggestion = z
  .object({
    id: Uuid,
    bot_id: Uuid,
    title: z.string(),
    body_md: z.string(),
    /** The bot's own line for it, as its push showed it ("Want me to…?"; D-247). */
    push_text: z.string().nullable().optional(),
    kind: SuggestionKind.default("do"),
    /** Optional short label for the main button on a `do` suggestion (<= 24 graphemes). */
    label: z.string().nullable().optional(),
    /** 2–4 short answer choices for an `answer` suggestion. */
    choices: z.array(z.string()).nullable().optional(),
    /** Destination link for a `look` suggestion. */
    url: z.string().nullable().optional(),
    /** Suggested reminder time for a `remind` suggestion. */
    remind_at: ts.nullable().optional(),
    /** Hidden from Needs you until this time (Later / snooze). */
    snoozed_until: ts.nullable().optional(),
    snooze_count: z.number().int().min(0).default(0),
    proposed_action: z
      .object({ tool: z.string(), args: z.record(z.string(), z.unknown()).optional() })
      .nullable(),
    sources: z.array(z.string()),
    urgency: z.enum(["low", "normal", "urgent"]),
    expires_at: ts,
    created_at: ts,
  })
  .openapi("Suggestion");

export const ForYouBrief = z
  .object({ bot_id: Uuid, conversation_id: Uuid, text: z.string(), created_at: ts })
  .openapi("ForYouBrief");

export const ForYouApproval = z
  .object({ id: Uuid, bot_id: Uuid, summary: z.string(), risk: z.string(), created_at: ts })
  .openapi("ForYouApproval");

export const ForYou = z
  .object({
    briefs: z.array(ForYouBrief),
    suggestions: z.array(Suggestion),
    approvals: z.array(ForYouApproval),
    /** Page ids already opened by this user across devices (inbox_seen). */
    seen_page_ids: z.array(Uuid).optional(),
  })
  .openapi("ForYou");

export const AcceptSuggestionRequest = z
  .object({
    /** The button label the person tapped, in their language, used as their chat message. */
    said: z.string().max(400).optional(),
    /** The chosen option for an `answer` suggestion. */
    choice: z.string().max(400).optional(),
    /** Override reminder time for a `remind` suggestion. */
    remind_at: ts.optional(),
  })
  .openapi("AcceptSuggestionRequest");

export const DismissSuggestionRequest = z
  .object({ dont_suggest_again: z.boolean().default(false) })
  .openapi("DismissSuggestionRequest");

export const SnoozeSuggestionRequest = z
  .object({
    /** Optional ISO time to snooze until; defaults to the next morning brief. */
    until: ts.optional(),
  })
  .openapi("SnoozeSuggestionRequest");

export const SnoozedSuggestion = z
  .object({
    ok: z.boolean(),
    snoozed_until: ts.nullable(),
    /** True when snoozing a second time expired the suggestion instead. */
    expired: z.boolean().default(false),
  })
  .openapi("SnoozedSuggestion");

export const PutAwaySuggestionsRequest = z
  .object({
    ids: z.array(Uuid).min(1).max(100),
  })
  .openapi("PutAwaySuggestionsRequest");

export const PutAwaySuggestionsResponse = z
  .object({
    ok: z.boolean(),
    count: z.number().int().min(0),
  })
  .openapi("PutAwaySuggestionsResponse");

export const InboxSeenRequest = z
  .object({
    item_kind: z.enum(["page", "brief", "notification"]),
    item_id: Uuid,
  })
  .openapi("InboxSeenRequest");

export const AcceptedSuggestion = z
  .object({
    conversation_id: Uuid.nullable().optional(),
    run_id: Uuid.nullable().optional(),
    routine_id: Uuid.nullable().optional(),
    direct: z.boolean().optional(),
  })
  .openapi("AcceptedSuggestion");
