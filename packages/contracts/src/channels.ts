import { z } from "@hono/zod-openapi";
import { Uuid } from "./common.ts";

const ts = z.iso.datetime({ offset: true });
export const ChannelKind = z
  .enum([
    "telegram",
    "email",
    "sms",
    "slack",
    "whatsapp",
    "messenger",
    "feishu",
    "imessage",
    "teams",
    "discord",
    "linear",
    "jira",
  ])
  .openapi("ChannelKind");

export const Channel = z
  .object({
    id: Uuid,
    bot_id: Uuid,
    kind: ChannelKind,
    name: z.string(),
    config: z.record(z.string(), z.unknown()),
    allowed_senders: z.array(z.string()),
    enabled: z.boolean(),
    /** Where the provider sends messages (none for iMessage). */
    webhook_url: z.string().nullable(),
    /** WhatsApp and Messenger: the verify token to paste into Meta's setup (shown once). */
    verify_token: z.string().nullable(),
    last_inbound_at: ts.nullable(),
    last_error: z.string().nullable(),
    created_at: ts,
  })
  .openapi("Channel");

export const CreateChannelRequest = z
  .object({
    bot_id: Uuid,
    kind: ChannelKind,
    name: z.string().min(1).max(100),
    config: z.record(z.string(), z.unknown()).optional(),
    secrets: z.record(z.string(), z.string().max(5000)).optional(),
    allowed_senders: z.array(z.string().min(1).max(300)).max(200),
  })
  .openapi("CreateChannelRequest");

export const UpdateChannelRequest = z
  .object({
    name: z.string().min(1).max(100).optional(),
    allowed_senders: z.array(z.string().min(1).max(300)).max(200).optional(),
    enabled: z.boolean().optional(),
    /**
     * Casama's own Slack app only (CHAT-APPS-HOSTED-PLAN §4): anyone in the Slack workspace it was
     * installed in may talk to the bot, not only the allowed list. Approvals still need someone on
     * the list. Off by default.
     */
    anyone_in_workspace: z.boolean().optional(),
  })
  .openapi("UpdateChannelRequest");

export const ChannelEvent = z
  .object({
    id: Uuid,
    direction: z.enum(["in", "out"]),
    status: z.enum(["accepted", "ignored", "routine", "sent", "failed"]),
    sender: z.string().nullable(),
    preview: z.string().nullable(),
    detail: z.string().nullable(),
    created_at: ts,
  })
  .openapi("ChannelEvent");

/** Casama's own shared bot in a chat app (CHAT-APPS-HOSTED-PLAN). */
export const ChatLinkProvider = z.enum(["telegram", "discord"]).openapi("ChatLinkProvider");

export const ChatLink = z
  .object({
    id: Uuid,
    provider: ChatLinkProvider,
    /** "Ana (@ana)": which account in that app is connected. */
    external_name: z.string().nullable(),
    org_id: Uuid,
    default_bot_id: Uuid.nullable(),
    linked_at: ts,
    last_seen_at: ts.nullable(),
  })
  .openapi("ChatLink");

export const ChatLinkList = z
  .object({
    items: z.array(ChatLink),
    /** The shared bots this server offers; null when it has none for that app. */
    offered: z.object({
      telegram: z.object({ username: z.string(), url: z.url() }).nullable(),
      discord: z.object({ url: z.url().nullable() }).nullable(),
    }),
  })
  .openapi("ChatLinkList");

export const StartChatLinkRequest = z.object({ bot_id: Uuid }).openapi("StartChatLinkRequest");
export const ChatLinkStart = z.object({ url: z.url(), expires_at: ts }).openapi("ChatLinkStart");
export const UpdateChatLinkRequest = z
  .object({ default_bot_id: Uuid })
  .openapi("UpdateChatLinkRequest");
