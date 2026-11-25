# Chat apps

Chat apps let people reach a bot from the messaging tools they already use: Telegram, email, SMS,
Slack, WhatsApp, Messenger, Feishu, iMessage, Microsoft Teams and Discord. The bot answers in the
same thread, and every conversation also shows up in the Casama app. Linear and Jira work the same
way: assign an issue to the bot and it replies with a comment (see
[Give a bot a Linear or Jira issue](#give-a-bot-a-linear-or-jira-issue)).

## Casama's Telegram bot

On Casama Cloud you don't need a Telegram bot of your own. Casama runs one for everyone, and you
connect it in one tap:

1. Open **Settings** → **Chat apps** → **Connect Telegram**, or open a bot, then **Bot profile** →
   **Advanced** → **Chat apps** → **Use Casama's Telegram bot**.
2. Telegram opens. Press **Start**. Do this on your own Telegram account: the link connects
   whichever Telegram opens it to you.
3. The app shows **Telegram is connected**.

Or start in Telegram: message [@casama_ai_bot](https://t.me/casama_ai_bot) the email on your Casama
account. Casama emails that address a link; open it and tap **Connect** within 15 minutes. The bot
gives the same answer whether or not the address has an account.

### New to Casama?

You can sign up from Telegram. You don't need the app first.

1. Message [@casama_ai_bot](https://t.me/casama_ai_bot) and send your email address.
2. The bot says it just emailed your address a link. The link connects this Telegram to your Casama
   account, or sets one up if you're new, and works for 15 minutes. The bot says the same whether or
   not the address has an account.
3. Open the link in the email. If you're new, the page shows what will happen. Tap **Set up my
   account**.
4. Casama makes your account, a first workspace ("Ana's space") and a first bot called Casama, and
   connects this Telegram to you. Start chatting in Telegram right away.

Opening the link alone changes nothing, so a mail scanner can't set anything up. To use the apps
later, sign in with the same email address ([casama.ai/download](https://casama.ai/download)).

While Casama Cloud's waitlist is on, tapping the link without an invite puts your address on the
[waitlist](/guide/getting-an-invite) instead. The bot tells you: "You're on the Casama waitlist."
When you're let in, it messages you in Telegram. Send your email again and it sets up your
account.

Have an invite code? Send it to the bot as a message (a friend's 6-character code, a code such as
SHOWHN-DEC8, or a one-time `XXXX-XXXX` code), or open a `t.me/casama_ai_bot?start=CODE` link. The
bot says "Invite code accepted". Then send your email. The code is kept for a day. A code that has
run out still puts you near the front of the waitlist.

You can ask for 3 emails an hour from one Telegram account and 3 a day for one address. Disposable
email addresses get no email.

After that:

- Your messages go to your **General** chat with the bot, the same chat as in the app, so you can
  carry on in either place. Replies go back to Telegram only for messages you sent from Telegram.
- **Approve** and **Deny** buttons appear in Telegram when the bot needs your OK. Runs started from
  Telegram always ask as usual, even when the workspace has Full access on.
- Photos, files and voice notes work both ways.
- With more than one bot, start a message with **@Name** to send it to another bot once, or send
  **/bots** to switch. Each reply then starts with the bot's name.
- **/stop** stops what the bot is doing. **/help** lists the commands. **/disconnect** (or
  **Settings** → **Chat apps** → **Disconnect Telegram**) disconnects it; your chat history stays.
- One Telegram account belongs to one Casama account. Connecting it again from another account or
  workspace moves it.
- People who haven't connected get a short note on how to connect or sign up, and nothing else.

Self-hosted servers can run their own shared bot, with the same sign-up flow under that server's
own rules (`SIGNUP_ALLOWED_EMAILS`, `SIGNUP_INVITED_ONLY`; `DISABLE_SIGNUP` turns it off). Create
a bot with @BotFather and set
`TELEGRAM_HOSTED_BOT_TOKEN` and `TELEGRAM_HOSTED_WEBHOOK_SECRET` (any random string of 16 or more
characters). Without them, connect your own bot per bot as below.

## Email Casama: get@casama.app

On Casama Cloud you can also start by email. Write to **get@casama.app** about anything, from any
mail app. There's nothing to install.

1. Casama answers once, in the same thread, with a **Set up my account** button.
2. Tap it, then tap **Set up my account** on the page that opens. Casama makes your account, a first
   workspace and a bot called Casama, and then answers the email you sent.
3. After that, just write to get@casama.app any time. Mail from your address goes to your General
   chat with Casama, the same chat as in the app, and the answer comes back by email. Files you
   attach come along, and files the bot makes are attached to its answer.

Already have a Casama account? Write from its email address. Casama answers with a **Connect**
button instead; tap it once, and that address is connected.

- **Another bot:** start the subject or the first line with its name, like `@Max what's on today?`.
- **Approvals:** when a bot needs your OK, the request waits in the app. A reply saying "yes" by
  email approves nothing.
- **Who gets an answer:** Casama only writes back to mail whose sending domain confirms it (SPF,
  DKIM or DMARC), never to auto-replies or mailing lists, and sends at most one setup email a day
  (three a week) to an address. Nobody can make Casama mail an address they only typed.
- **Waitlist:** while Casama Cloud's waitlist is on, the tap puts a new address on the waitlist.
  Casama emails it a fresh link when you're let in. Put an invite code in the subject of your first
  mail to skip the line.
- **Stop:** reply `stop` to any of Casama's emails, or write to support to disconnect the address.

Self-hosted servers with hosted mail can offer the same: set `EMAIL_SIGNUP_NAME` (for example
`get`) and optionally `EMAIL_SIGNUP_DAILY_MAX` (setup emails a day, 300 by default).

## Casama in Messenger

On Casama Cloud you can also message Casama's Facebook Page in Messenger
([m.me/1539129842611601](https://m.me/1539129842611601)). Casama says it's an AI assistant and asks
for your email address.

1. Send your email address in the chat. Casama emails you a link that works for 15 minutes:
   **Set up my account** for a new address, **Connect** for one that already has an account. The
   answer in the chat is the same either way.
2. Tap the button on the page the link opens. Casama makes the account if needed and connects your
   Messenger account.
3. Your messages then go to your General chat with your bot, and its answers come back in
   Messenger. Photos and files work both ways.

- Start a message with **@Name** to send it to another bot once.
- Approvals wait in the app. Send **stop** or **disconnect** to disconnect.
- Messenger only lets a Page answer within 24 hours of your last message, so check-ins and alerts
  don't go to Messenger.
- One Messenger account belongs to one Casama account. Connecting it from another account moves it.

Self-hosted servers can run their own Page bot: make a Meta app with the Messenger product, connect
a Page, and set `MESSENGER_HOSTED_PAGE_TOKEN`, `MESSENGER_HOSTED_APP_SECRET` and
`MESSENGER_HOSTED_VERIFY_TOKEN` (any random string of 16 or more characters). Point the app's
webhook at `https://<your server>/hooks/messenger/hosted` with that verify token, subscribed to
`messages` and `messaging_postbacks`.

## How it works

- Each chat app is connected to one bot.
- A bot only answers people on the chat app's **Allowed senders** list. Messages from anyone else
  get no reply and are logged in the chat app's **Activity** as "Ignored: not on the allowed list".
- Each outside thread becomes one Casama conversation, titled with the app and the sender or
  subject, such as "Telegram: Ana". Follow-up messages in that thread continue the same
  conversation.
- Each message reaches the bot prefixed with where it came from, such as
  `(Telegram, from Ana)`, and starts a run. When the bot says something before it starts working
  ("On it, cropping now."), that line goes to the thread straight away; when the run finishes,
  its final reply follows. Email threads are the exception: email gets only the final complete
  answer (with files attached), plus one short "on it" email if a job runs longer than 60 seconds.
- If an app delivers the same message twice (Slack retries after a few seconds, for example), the
  bot answers it once.
- The conversation belongs to the person who connected the chat app, and runs act for them. That
  person sees these chats in the app.

## Connect a chat app

You need to manage the bot to connect a chat app.

1. Open the bot, then **Bot profile** → **Advanced** → **Chat apps**.
2. Tap **Connect a chat app**.
3. Choose the **App** and give the connection a **Name**.
4. Paste the credentials from the app's developer settings (see the table below). They're stored
   encrypted and never shown again.
5. Under **Allowed senders**, add one per line: email addresses (or `*@example.com` for a whole
   domain), phone numbers, or user ids. You can leave it empty and add people later; until then
   the bot answers nobody.
6. Tap **Add**.
7. Casama shows the **Webhook address**. Paste it into the app's webhook settings. Telegram is the
   exception: Casama sets its webhook for you.

| App       | What you paste                                                                  | Where the webhook goes                                     |
| --------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| Telegram  | **Bot token** from @BotFather                                                   | Set automatically                                          |
| Email     | **Email address**, Resend **API key**, and the webhook's **Signing secret**     | A Resend inbound webhook for received email                |
| SMS       | Twilio **Phone number**, **Account SID** and **Auth token**                     | The number's incoming-message webhook in Twilio            |
| Slack     | **Bot token** and **Signing secret**                                            | Event Subscriptions request URL, subscribed to `message.im`, `app_mention`, `reaction_added` and `reaction_removed` |
| WhatsApp  | **Phone number ID**, **Access token** and **App secret** from the Cloud API      | Meta webhook callback URL, with the **Verify token**       |
| Messenger | **Page access token** and **App secret**                                        | Meta webhook callback URL, with the **Verify token**       |
| Feishu    | **App ID**, **App secret**, **Encrypt key** and **Verification token**          | The app's event subscription request URL                   |
| iMessage  | Nothing; pick your **Mac**                                                      | None                                                       |
| Microsoft Teams | The Azure bot's **App ID** and client secret (**App secret**)             | The Azure bot's messaging endpoint                         |
| Discord   | **App ID** (application id), **Public key** and **Bot token**                   | The application's Interactions Endpoint URL                |
| Linear    | **The bot's user ID in the tracker**, an **API key** and the webhook's **Signing secret** | A Linear webhook for issues and comments           |
| Jira      | **Site address (https://…)**, **Account email**, **The bot's user ID in the tracker**, an **API key** (API token) and the webhook's **Signing secret** | A Jira webhook for issue created, issue updated and comment created |

For WhatsApp and Messenger, Casama generates a **Verify token** for Meta's setup and shows it once,
right after you connect. Copy it then.

Each app's requests are checked before anything happens: Telegram's secret token, the Svix-style
signature on email, Twilio's signature on SMS, Slack's signed requests, Meta's
`X-Hub-Signature-256`, Feishu's request signature, Microsoft's signed token on Teams, Discord's
Ed25519 signature, `Linear-Signature` and Jira's `X-Hub-Signature`. A request that fails the check
is refused. Feishu must have an encrypt key set; Casama decrypts its messages.

::: tip
Not sure what a sender's id looks like? Connect with **Allowed senders** empty, then ask them to
message the bot. The message shows in
**Activity** as ignored, with their id. Tap **Allow** on it to add them to **Allowed senders**.
:::

## Allowed senders

Matching is exact and ignores case. `*@example.com` matches any email address at that domain.

| App       | Use                                                                    |
| --------- | ---------------------------------------------------------------------- |
| Telegram  | The person's numeric Telegram user id                                  |
| Email     | Their email address, or `*@example.com`                                |
| SMS       | Their phone number in international format, such as `+13125550123`     |
| Slack     | Their Slack user id                                                    |
| WhatsApp  | Their WhatsApp number as Meta sends it: digits only, no `+`            |
| Messenger | Their page-scoped sender id                                            |
| Feishu    | Their open id                                                          |
| iMessage  | The phone number or email address they message from                    |
| Microsoft Teams | Their Microsoft Entra object id                                  |
| Discord   | Their Discord user id                                                  |
| Linear    | Their Linear user id                                                   |
| Jira      | Their Atlassian account id                                             |

To change the list later, tap the chat app on the **Chat apps** screen, edit **Allowed senders**
and tap **Save**.

On a bring-your-own email chat app, allowed senders are matched on the From line. Resend's
webhook carries no sender-check results, so Casama reads the results its received-email API
reports when it fetches the body, and the bot says in Activity when the sender's domain couldn't
be confirmed. A bot's [hosted address](/guide/bot-email) refuses unconfirmed mail instead of
just marking it.

## Threads and replies

| App       | One conversation per                                         | How the reply goes back                       |
| --------- | ------------------------------------------------------------ | --------------------------------------------- |
| Telegram  | Chat, or each topic in a group with topics                   | A message in the same chat, in the same topic |
| Email     | Sender plus subject (`Re:` and `Fwd:` are ignored)           | A reply email with `Re:` and threading headers |
| SMS       | Phone number                                                 | A text message                                |
| Slack     | Slack thread                                                 | A reply in that thread                        |
| WhatsApp  | Phone number                                                 | A WhatsApp message                            |
| Messenger | Sender                                                       | A Messenger message                           |
| Feishu    | Chat                                                         | A message in the same chat                    |
| iMessage  | Handle                                                       | An iMessage from your Mac                     |
| Microsoft Teams | Teams chat or channel conversation                     | A reply in the same conversation              |
| Discord   | Channel                                                      | A reply to the `/ask` command, or a channel message after 15 minutes |
| Linear    | Issue                                                        | A comment on the issue                        |
| Jira      | Issue                                                        | A comment on the issue                        |

Replies are sent in each app's own format, so bold, links, lists and code show properly instead
of raw `**` and `#`: Telegram and email get rich text, Slack and WhatsApp their own marks, Jira
its document format, and SMS, iMessage, Messenger and Feishu clean plain text with links written
as "text (url)". Discord, Teams and Linear show Markdown as it is. Tables become aligned text
where the app has none.

While the bot works, Telegram and Messenger show it typing. In Telegram, an 👀 reaction on your
message shows it arrived (Slack gets the same with an eyes reaction).

Long replies are sent in parts, split at a paragraph, line, sentence or word, so nothing is cut
off. Each part fits the app's limit: 1,600 characters on SMS, 2,000 on Messenger and Discord,
4,096 on Telegram and WhatsApp, 10,000 on Feishu, 25,000 on Teams, 39,000 on Slack, 30,000 on Jira
and 50,000 on Linear.

## Files, photos and voice notes

Files go both ways, as in the Casama app.

- **From the bot:** images, video, audio and files a reply carries go into the chat after the
  text, as photos, videos and documents where the app has them. That covers media the bot makes
  and files from its computer that the reply links to. With one file and a short reply, the text
  goes as the file's caption. A reply sends up to 10 files.
- **When an app can't take a file** (too big, a type it refuses, or more than 10), the bot sends a
  link to it instead, with its name and size. SMS sends pictures up to 5 MB by MMS and everything
  else as a link. Teams shows pictures up to 1 MB in the chat and sends other files as links.
- **To the bot:** photos, files and voice notes people send are saved like attachments in the app,
  so the bot can look at a picture or read a PDF. Each file can be up to 25 MB (Telegram's own
  limit for bots is 20 MB), up to 10 per message, and they count against the daily attachment
  allowance (300 files and 1 GB) of the person who connected the chat app. A file that can't come
  through still reaches the bot as a note saying which file and why. Stickers, locations and
  contacts aren't passed on yet.
- **Voice notes** are also turned into text when the workspace can transcribe, so the bot answers
  what was said.
- **On Discord**, give the slash command an optional attachment option to send the bot a file.

The bot is told which chat app it's in, and that its files are delivered there.

**About links:** a file link works for anyone who has it, without signing in, for 7 days. It only
ever goes to the chat it was made for. Deleting the file in Casama stops its links working.

If a reply can't be sent, the error shows on the chat app in the list and in its **Activity**.

## Reactions

Reactions go both ways in Telegram, Slack and WhatsApp:

- **In:** when someone on the allowed list reacts to a message in the chat app, the reaction shows
  on that message in the Casama chat, under their name in the chat app. The bot sees it the next
  time it works in the chat. Taking it back there takes it back in Casama. Reactions to messages
  sent before this feature came aren't matched.
- **Out:** when the bot reacts to a message, the reaction is added to the same message in the chat
  app. Telegram allows only its own set of reaction emoji: 😂 is sent as 🤣 and 😮 as 😱, and an
  emoji with nothing close isn't sent there (it still shows in Casama).

Notes for each app:

- **Telegram:** in groups, reactions reach the bot only when it is an admin. Chat apps connected
  before reactions came are switched over the next time a message arrives.
- **Slack:** your own Slack app needs the `reactions:read` scope and the `reaction_added` and
  `reaction_removed` bot events. Casama's Slack app asks for them; workspaces that installed it
  before need to install it again.
- **WhatsApp:** reactions come in as WhatsApp's reaction messages; nothing to set up.

Discord, Messenger, Teams, Feishu, iMessage, email, SMS, Linear and Jira don't pass reactions.

## Bots sending first

A bot can start a new message through one of its chat apps, for example to tell you a long job is
done. It can only message people on that chat app's allowed list, and sending is a high-risk action,
so under the default autonomy it asks you first. See [Autonomy and approvals](/guide/autonomy).

## Routines on messages

A routine can start when a matching message arrives. Filter by chat app, sender (`*@example.com`
works), subject or message text. Without a sender filter, a routine only hears people on the chat
app's allowed list. With one, it also hears that sender when they aren't on the list: for example, a
routine can file every invoice a vendor emails, although the vendor can't chat with the bot. A
message that starts a routine isn't also answered. In the routine sheet, choose **Messages**. See
[Routines](/guide/routines).

## Approvals in the chat

When a run started from Telegram, Slack or Discord needs your approval, the request is also posted in the
chat with **Approve** and **Deny** buttons. Only people on the chat app's allowed list can press
them; the decision counts as made by the person who connected the chat app, and the buttons are
replaced with who approved or denied it. The usual notification and the card in the app still
work. In Telegram there's nothing to set up: Casama asks Telegram for button presses itself. In
Discord the presses come to the same Interactions Endpoint URL as the commands.

## Slack

In Slack, people can message the bot directly or @mention it in a channel. The mention is removed
before the bot reads the message. An eyes reaction on the message shows it arrived.

When a run started from a Slack thread needs your approval, the request is also posted in that
thread with **Approve** and **Deny** buttons. Only people on the chat app's allowed list can press
them; the decision counts as made by the person who connected the chat app, and the message then
says who approved or denied it. The usual notification and the card in the app still work.

To use the buttons with your own Slack app, turn on **Interactivity** in the Slack app's settings
and set its request URL to the **Webhook address** followed by `/interact`. Give the bot token the
scopes `app_mentions:read`, `chat:write`, `files:read`, `files:write`, `im:history`, `im:read`,
`reactions:read` and `reactions:write`, and subscribe to the bot events `app_mention`, `message.im`, `reaction_added` and
`reaction_removed`.

### Install Casama's Slack app

A server can run its own Slack app, so people connect Slack with one click instead of pasting a bot
token. Whoever runs the server registers the Slack app and sets `SLACK_CLIENT_ID`,
`SLACK_CLIENT_SECRET` and `SLACK_SIGNING_SECRET`. The Slack app's addresses are, on the server's
public API address:

| Slack setting              | Address                |
| -------------------------- | ---------------------- |
| OAuth redirect URL         | `/hooks/slack/oauth`   |
| Event Subscriptions        | `/hooks/slack/events`  |
| Interactivity request URL  | `/hooks/slack/interact` |

`GET /v1/channels/slack/install?bot_id=…` returns Slack's sign-in address. After you approve it in
Slack, the chat app is made for that bot, with you on its allowed list. Each Slack workspace talks
to one Casama bot through the server's app; installing again for another bot moves it. Without
those settings the request answers that the server has no Slack app, and you connect your own
Slack app with a bot token as above. In the app, it's **Add to Slack** at the top of a bot's
**Chat apps**. A ready-made Slack app manifest is in `infra/slack/` in the repository.

Only you may talk to the bot at first. Add teammates' Slack user ids to the allowed list, or open
the chat app and turn on **Anyone in this Slack workspace**: then everyone in that Slack workspace
can talk to it, but not guests from other workspaces in a shared (Slack Connect) channel. Approval
buttons still work only for people on the allowed list.

## Microsoft Teams

People message the bot in Teams chats and channels. In a channel, @mention it; the mention is
removed before the bot reads the message.

1. In Azure, create an Azure bot and a client secret for it.
2. In Casama, connect **Microsoft Teams** with the bot's **App ID** and the client secret as
   **App secret**.
3. Paste the **Webhook address** as the Azure bot's messaging endpoint, and add the Teams channel
   to the Azure bot.

## Discord

### Casama's Discord bot

On Casama Cloud you don't need a Discord application of your own. Casama runs one for everyone.

1. Open **Settings** → **Chat apps** → **Connect Discord**, or a bot's **Chat apps** → **Use
   Casama's Discord bot**.
2. Discord's sign-in opens in your browser. Allow Casama. This adds Casama's commands to your
   Discord account; it doesn't add the bot to any server.
3. The Casama bot sends you a direct message. Reply there like you would to a person.

Or start in Discord: add Casama to your Discord account with its
[install link](https://discord.com/oauth2/authorize?client_id=1575022225692827819) (or **Add App**
on the Casama bot's profile), then send the bot the email on your Casama account, in a direct
message or as `/ask`'s question. Casama emails that address a link; open it and tap **Connect**
within 15 minutes. The bot gives the same answer whether or not the address has an account.

#### New to Casama?

You can sign up from Discord without the app. Send the Casama bot your email address the same way.
The link Casama emails you sets up your account: tap **Set up my account** and Casama makes your
account, a first workspace and a first bot called Casama, and connects this Discord account to you.
While Casama Cloud's waitlist is on, the link without an invite adds your address to the
[waitlist](https://casama.ai/waitlist); Casama emails you when you're in, and then you send your
email to the bot again. The bot sends at most 3 emails an hour to one Discord account and 3 a day
to one address, and none to disposable addresses.

Your messages go to your **General** chat, the same chat as in the app. You can also use **/ask**
anywhere in Discord (a server, another DM): only you see the answer unless you turn on its
**share** option. Start a message with **@Name** to send it to another bot once. **/bots** picks
which bot you talk to, **/stop** stops what it's doing, **/help** lists the commands and
**/disconnect** disconnects Discord. When a bot needs your OK, **Approve** and **Deny** buttons show
up in the DM. Runs started from Discord always ask, even when the workspace has Full access on.

One Discord account belongs to one Casama account; connecting it again from another account moves
it. If Discord won't let the bot message you first (it sometimes needs a shared server), `/ask`
still works, and adding Casama to your account with the install link lets the bot reach you.

To offer the same on your own server, register a Discord application (steps in `infra/discord/`
in the repository) and set `DISCORD_CLIENT_ID`, `DISCORD_CLIENT_SECRET`, `DISCORD_PUBLIC_KEY` and
`DISCORD_BOT_TOKEN` on the API and the worker. The worker keeps one Gateway connection open for
direct messages; with several workers, only one holds it.

### Your own Discord application

Discord only delivers ordinary messages to bots that keep a live connection open, which a webhook
server doesn't. So people talk to your own bot through a slash command, such as `/ask`, with one
text option for the question.

1. In the Discord Developer Portal, copy the application's **Application ID** and **Public key**,
   and the bot's token.
2. In Casama, connect **Discord** with those as **App ID**, **Public key** and **Bot token**.
3. Paste the **Webhook address** as the application's **Interactions Endpoint URL**.
4. Register a slash command for the application with one string option.

Discord shows "thinking…" while the bot works. The reply answers the command if it's ready within
15 minutes, and otherwise arrives as a message in the channel.

## Give a bot a Linear or Jira issue

Connect Linear or Jira as a chat app and you can hand a bot an issue the way you would a teammate.

- **Assign an issue** to the tracker user that stands for the bot, or create it assigned. The bot
  starts work with the issue's title and description.
- **Comment** on an issue the bot holds to continue the conversation. Each issue is one Casama
  conversation, so the bot keeps the context.
- **The bot's reply** is posted as a comment on the issue. Changes the bot makes itself are
  ignored, so it doesn't answer its own comments.

People who assign issues or comment need to be on the **Allowed senders** list, by their Linear user
id or Atlassian account id.

### Linear

1. Create a Linear user for the bot and copy its user id. Create a personal **API key** for that
   user; the bot comments with it.
2. In Linear's settings, add a webhook for **Issues** and **Comments** pointing to the
   **Webhook address**, and copy its signing secret.
3. In Casama, connect **Linear** with **The bot's user ID in the tracker**, the **API key** and
   the **Signing secret**.

### Jira Cloud

1. Create an Atlassian account for the bot and an API token for it.
2. In Casama, connect **Jira** with your **Site address (https://…)**, the bot account's
   **Account email**, its account id as **The bot's user ID in the tracker**, the API token as
   **API key**, and a **Signing secret** you make up.
3. In Jira's system settings, add a webhook to the **Webhook address** with that secret, for issue
   created, issue updated and comment created.

The bot doesn't move the issue's status as it works; it says where things stand in its comment.

To have a bot use Linear or Jira as a tool instead (search issues, file new ones), connect the app
from [Apps and connections](/guide/connections).

## iMessage

iMessage has no bot API, so your own Mac does the work through the desktop app.

1. On your Mac, open the desktop app and turn on **Use this computer for bots**.
2. Under **What bots may do**, allow **Messages (iMessage)**.
3. Give the desktop app Full Disk Access in macOS System Settings, so it can read Messages.
4. In the bot's **Chat apps**, connect **iMessage** and pick your **Mac**.

Your Mac reads new messages and sends replies through Messages. Casama checks for new messages every
minute. The first check only takes a starting point, so old messages are never answered. Only
one-to-one messages are read; group chats are left alone. Only the
Mac's owner can connect it, and only bots allowed on that Mac can use it. Photos and files go both
ways once the Mac has the latest desktop app; until then, the bot's files arrive as links. See
[Your own computer](/guide/companion).

## Manage a chat app

On the **Chat apps** screen:

- Use the switch next to a chat app to turn it off and on.
- Tap a chat app to see its **Webhook address**, edit **Allowed senders**, and read its
  **Activity**: answered, sent, started a routine, ignored or failed.
  Tap **Allow** on an ignored message to let that sender in.
- Tap **Disconnect** to remove it. Its saved credentials are deleted.

## Limits

- Feishu has no one-click install. Slack has one only on servers that run their own Slack app, and
  only through the API for now.
- Approval buttons are in Telegram and Slack only. Elsewhere, approvals arrive in the app as usual.
- On Discord, the bot hears only its slash command, not ordinary messages.
- Group chats on WhatsApp and iMessage aren't supported.
- iMessage needs your Mac to be on, with the desktop app running.
- The adapters follow each provider's public docs and have been tested against stand-ins, not yet
  against every live provider. Teams and Discord have been tested with signed test requests only.
- If your server sits behind a proxy, set `PUBLIC_API_URL` so signatures and webhook addresses use
  your public address. See [Configuration](/self-hosting/configuration).

## Related

- [A bot's email address](/guide/bot-email)
- [Chat](/guide/chat)
- [Routines](/guide/routines)
- [Your own computer](/guide/companion)
- [Autonomy and approvals](/guide/autonomy)
- [Voice and calls](/guide/voice)
