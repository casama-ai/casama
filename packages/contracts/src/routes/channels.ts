import { createRoute, z } from "@hono/zod-openapi";
import {
  Channel,
  ChannelEvent,
  ChatLink,
  ChatLinkList,
  ChatLinkStart,
  CreateChannelRequest,
  StartChatLinkRequest,
  UpdateChannelRequest,
  UpdateChatLinkRequest,
} from "../channels.ts";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";

const security = [{ bearerAuth: [] }];
const { 400: e400, 401: e401, 403: e403, 404: e404 } = problemResponses;
const idParam = z.object({ id: Uuid });
const tags = ["channels"];

export const listChannels = createRoute({
  operationId: "listChannels",
  method: "get",
  path: "/v1/channels",
  tags,
  security,
  summary: "A bot's chat apps",
  request: { query: z.object({ bot_id: Uuid }) },
  responses: {
    200: jsonResponse("Channels", z.object({ items: z.array(Channel) }).openapi("ChannelList")),
    401: e401,
  },
});

export const createChannel = createRoute({
  operationId: "createChannel",
  method: "post",
  path: "/v1/channels",
  tags,
  security,
  summary: "Connect a chat app to a bot",
  request: { body: jsonBody(CreateChannelRequest) },
  responses: { 201: jsonResponse("Channel", Channel), 400: e400, 401: e401, 403: e403, 404: e404 },
});

export const updateChannel = createRoute({
  operationId: "updateChannel",
  method: "patch",
  path: "/v1/channels/{id}",
  tags,
  security,
  request: { params: idParam, body: jsonBody(UpdateChannelRequest) },
  responses: { 200: jsonResponse("Channel", Channel), 401: e401, 403: e403, 404: e404 },
});

export const deleteChannel = createRoute({
  operationId: "deleteChannel",
  method: "delete",
  path: "/v1/channels/{id}",
  tags,
  security,
  request: { params: idParam },
  responses: {
    200: jsonResponse("Deleted", z.object({ deleted: Uuid }).openapi("DeletedChannel")),
    401: e401,
    403: e403,
    404: e404,
  },
});

export const listChannelEvents = createRoute({
  operationId: "listChannelEvents",
  method: "get",
  path: "/v1/channels/{id}/events",
  tags,
  security,
  summary: "Recent messages in and out, including ignored senders",
  request: { params: idParam },
  responses: {
    200: jsonResponse(
      "Events",
      z.object({ items: z.array(ChannelEvent) }).openapi("ChannelEventList"),
    ),
    401: e401,
    404: e404,
  },
});

export const startSlackInstall = createRoute({
  operationId: "startSlackInstall",
  method: "get",
  path: "/v1/channels/slack/install",
  tags,
  security,
  summary: "Add Casama's Slack app to a Slack workspace for this bot (D-277)",
  description:
    "Returns the Slack sign-in address to open. After the person allows it, the bot answers @mentions and direct messages in that Slack workspace, and approvals show buttons in the thread. 409 when this server has no Slack app (self-hosters connect their own app with a bot token instead).",
  request: { query: z.object({ bot_id: Uuid }) },
  responses: {
    200: jsonResponse("Slack sign-in", z.object({ url: z.url() }).openapi("SlackInstallLink")),
    401: e401,
    403: e403,
    404: e404,
    409: problemResponses[409],
  },
});

// Casama's own shared bots in Telegram and Discord (CHAT-APPS-HOSTED-PLAN).
export const listChatLinks = createRoute({
  operationId: "listChatLinks",
  method: "get",
  path: "/v1/chat-links",
  tags,
  security,
  summary: "Your Telegram and Discord accounts connected to Casama's own bots",
  responses: { 200: jsonResponse("Chat links", ChatLinkList), 401: e401 },
});

export const startTelegramLink = createRoute({
  operationId: "startTelegramLink",
  method: "post",
  path: "/v1/chat-links/telegram/start",
  tags,
  security,
  summary: "A one-time link that connects your Telegram to Casama's Telegram bot",
  description:
    "Returns t.me/<bot>?start=<code>. Opening it in Telegram and pressing Start connects that Telegram account to you; messages then reach this bot in your General chat. Single use, 15 minutes. 409 when this server has no Telegram bot of its own.",
  request: { body: jsonBody(StartChatLinkRequest) },
  responses: {
    200: jsonResponse("Telegram link", ChatLinkStart),
    401: e401,
    404: e404,
    409: problemResponses[409],
  },
});

export const startDiscordLink = createRoute({
  operationId: "startDiscordLink",
  method: "post",
  path: "/v1/chat-links/discord/start",
  tags,
  security,
  summary: "Discord's sign-in, which connects your Discord to Casama's Discord app",
  description:
    "Returns Discord's sign-in address (scopes identify and applications.commands, installed to your account). Signing in there connects that Discord account to you; direct messages to Casama's bot and /ask then reach this bot in your General chat. The address works for 15 minutes. 409 when this server has no Discord app of its own.",
  request: { body: jsonBody(StartChatLinkRequest) },
  responses: {
    200: jsonResponse("Discord sign-in", ChatLinkStart),
    401: e401,
    404: e404,
    409: problemResponses[409],
  },
});

export const updateChatLink = createRoute({
  operationId: "updateChatLink",
  method: "patch",
  path: "/v1/chat-links/{id}",
  tags,
  security,
  summary: "Choose which bot your messages go to",
  request: { params: idParam, body: jsonBody(UpdateChatLinkRequest) },
  responses: { 200: jsonResponse("Chat link", ChatLink), 400: e400, 401: e401, 404: e404 },
});

export const deleteChatLink = createRoute({
  operationId: "deleteChatLink",
  method: "delete",
  path: "/v1/chat-links/{id}",
  tags,
  security,
  summary: "Disconnect a Telegram or Discord account",
  request: { params: idParam },
  responses: {
    200: jsonResponse("Deleted", z.object({ deleted: Uuid }).openapi("DeletedChatLink")),
    401: e401,
    404: e404,
  },
});
