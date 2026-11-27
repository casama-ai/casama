---
description: "Answers to common Casama questions: what bots are, pricing and plans, privacy, which AI models it uses, self-hosting, apps and approvals."
---

# FAQ

## Getting started

### What is Casama?

Casama gives you AI teammates, called bots, that keep working after you close the chat. Each bot
has its own instructions, memory, skills and a sandboxed Linux computer. It can research, write,
code, browse and run tasks on a schedule, and it asks before doing anything risky.

You can use it on Casama Cloud, the hosted service, or run the whole thing on your own server for
free. See [What is Casama](/introduction).

### How is Casama different from a chat assistant?

A chat assistant answers in a text box while you watch. A Casama bot has its own computer, your
tools, a memory and a schedule, so it does the work itself: fills in the form, drafts the email,
builds the page, and comes back when it's done or needs you.

It works on schedules and triggers when you're not there, reaches out first with a morning brief
and suggestions, uses your tools through connections, and asks you before risky steps. What it
makes is kept in the [Library](/guide/library). You can run it yourself, on any model.

### What can my first bot do on day one?

The first time you sign in, Casama asks what bots should call you, then makes a workspace named
after you and a personal bot called Casama, and opens its chat. On Casama Cloud the bot already has
a model, so you can give it work straight away. The chat starts with tiles to **Connect your apps**
and a few starter requests you can tap.

It can use its computer to research, write, code and keep files, make pages and documents, and set
up reminders and routines from a plain request such as "Remind me in 20 minutes to call Ana". Its
check-ins are on: each morning it sends a brief, and during the day it offers suggestions you
accept or dismiss. See [Your first bot](/guide/bots#your-first-bot).

### Which devices can I use it on?

There are apps for iPhone, iPad, Android, Mac, Windows and Linux, and a web app at
[app.casama.ai](https://app.casama.ai). The `casama` CLI works in the terminal and in scripts:
install it with `brew install stackwares/tap/casama` or download it from the
[releases page](https://github.com/casama-ai/casama-releases/releases).

You can also reach your bots from chat apps such as Slack, Telegram and WhatsApp, and from AI
coding tools over MCP. A few things need the desktop app: signing in with a ChatGPT plan, lending
your own computer to bots, and iMessage, which needs a Mac. See [Quick start](/quick-start).

### Should I get the Mac app from the website or the Mac App Store?

Get it from the website ([casama.ai/download](https://casama.ai/download)) unless you prefer the
App Store. The website version can do everything. Apple's App Store requires a sandbox, which
keeps an app inside its own box, so the App Store version leaves out the features that reach
outside the app:

| | From the website | Mac App Store |
| --- | --- | --- |
| Chat, bots, voice, widgets, notifications | Yes | Yes |
| Let bots use your Mac (terminal, files, browser, desktop apps) | Yes | No |
| Coding agents and local MCP servers on your Mac | Yes | No |
| Run your own Casama server on this Mac (**Run on This Mac**) | Yes | No |
| Quick ask reads the front window and your selection | Yes | No |
| Watch folders for new files | Yes | No |
| Updates | The app updates itself | Through the App Store |
| How you pay | Web checkout | In-app purchase (in the US, a web checkout link too) |

Your account, bots and chats live on the server, so you can switch later: install the other
version and sign in. A plan you bought in one version stays with the store you bought it in. To
manage or cancel it, go back to that store (see [Where do I pay?](#where-do-i-pay)).

### Which languages does Casama support?

The apps are in English only for now.

### Do I need technical skills?

Not for Casama Cloud. Sign in with Google, Apple or your email and ask a bot for what you need in
plain words. It sets up its own routines when you ask, and most apps connect with one sign-in.
Connecting some chat apps means pasting keys from that app's developer settings.

Running Casama yourself takes a little more: you need Docker, though the desktop apps set it up in
one click. See [Self-hosting](/self-hosting/).

### Is Casama open source?

Yes, in part. Casama's apps, `computerd`, SDKs, CLI and MCP server are open source (AGPL-3.0 and Apache-2.0), and so is everything that decides what a bot may do: the safety rules, the bot's computer and its network guard. Casama Cloud runs on the Casama Engine, which is not open source. If you change an AGPL part and let others use it, you share your changes under AGPL-3.0 too. A commercial license is
available. The code is on
[GitHub](https://github.com/casama-ai/casama). See [Open source](https://casama.ai/open-source)
and [LICENSING.md](https://github.com/casama-ai/casama/blob/main/LICENSING.md).

### How do I sign up?

Get the app at [casama.ai/download](https://casama.ai/download) (or open
[app.casama.ai](https://app.casama.ai)) and continue with Google, Apple or your email. There's no
waitlist and no invite needed. You can also start from Telegram
([@casama_ai_bot](https://t.me/casama_ai_bot)), email (**get@casama.app**) or Messenger
([m.me/1539129842611601](https://m.me/1539129842611601)). See [Signing up](/guide/getting-an-invite).

### I have an invite code. What now?

Open your friend's invite link, or enter the code at
[casama.ai/waitlist](https://casama.ai/waitlist) with your email. Then sign up with that address — Google, Apple and the email
link all work, as long as it's the same address. You and your friend both get credits after your
first chat. You can also
send your code to [@casama_ai_bot](https://t.me/casama_ai_bot) on Telegram or put it in the subject
of an email to **get@casama.app**.

## Plans & billing

### Is it free?

Self-hosting is free for one person's personal use; a business needs a paid
[license](/self-hosting/licenses). You pay your model provider and your server. A local model has no
model bill. [Casama Link](/self-hosting/remote-access), which puts a server
on your own computer on your phone, is free too.

Casama Cloud, the hosted service, has a Free plan that doesn't end: $1 of credits every month, 3
bots and one cloud computer with 5 hours of computer time. Three paid plans add more. See
[Usage, budgets and plans](/guide/usage).

### What plans are there and what do they cost?

Casama Cloud has four plans:

- **Free**: $0. $1 of credits a month, 3 bots, 1 computer, 5 computer hours a month, 1 person,
  1 GB of Library storage.
- **Plus**: $15 a month or $150 a year. $5 of credits a month, 10 bots, 2 computers, 30 computer
  hours, 1 person, 10 GB.
- **Pro**: $49 a month or $490 a year. $15 of credits a month, unlimited bots, 5 computers, 100
  computer hours, 3 people, 50 GB.
- **Max**: $99 a month or $899 a year. $30 of credits a month, unlimited bots, 10 computers, 300
  computer hours, 10 people, 200 GB.

Plus, Pro and Max can also be paid by the week: $7.99, $19.99 and $39.99, with a quarter of the
monthly credits each week.

Bigger plans also get bigger computers. Plans can change, so **Settings → Billing** always shows
the current ones. See [Pricing](https://casama.ai/pricing) and [Plans](/guide/usage#plans).

### What do credits pay for?

On Casama Cloud, a credit is a dollar. Credits pay for the things that cost money each time a bot
works: AI models, cloud computer time beyond your plan's hours, live calls, images and video,
read-aloud and dictation, apps connected through Casama's own connector account, and paid data
lookups, which always ask first and show the price.

A run that is waiting for your approval, or a computer that is asleep, costs nothing. A run that
fails because of Casama or a model provider doesn't cost model credits. A self-hosted server uses
no credits: you pay your providers directly.

Credits belong to the workspace. A month's included credits last until the end of the following
month, and credit packs bought on the web and rewards last 12 months. Credit packs bought in the
App Store or Google Play never expire. Credits that run out soonest are spent first.
See [Credits](/guide/usage#credits).

### What happens when I run out of credits?

Bots stop starting new paid work and tell you why. Nothing is charged without you buying a credit
pack or changing plan. On a paid plan you can buy packs of $10 or $25 of credits. On the Free plan,
the paywall shows the paid plans.

Each plan also has a daily limit on what Casama Cloud spends for you in a day ($0.25 on Free, $5 on
Plus, $10 on Pro and $25 on Max), which resets at midnight UTC, and a number of computer hours a
month. Using up the hours stops only the bots' computers; chat keeps working on credits. When a workspace's balance drops under $1, its owners get a notification, at most once a
week. See [When a run hits a limit](/guide/usage#when-a-run-hits-a-limit).

### Can I limit what a bot spends?

Yes. Every bot has a budget per run ($1 by default) and per day ($10 by default). When a run
reaches its budget it stops and tells you. The **Usage** screen shows spend by bot, by model, by day
and by where the work came from, and **Settings > Show usage on replies** puts each reply's cost
under it. See [Bot budgets](/guide/usage#bot-budgets).

### Is there a free trial?

Pro is free for 7 days, once per person, if you've never had a subscription. During the trial the
workspace gets $2 of credits and 10 computer hours; the first payment tops the month up to $15.

Once per person means once per email inbox, so accounts on the same inbox share the trial, and
deleting an account and signing up again doesn't start it over. See [Plans](/guide/usage#plans).

### Can I add people to my workspace?

Pro includes 3 people and Max includes 10. On the web, Pro and Max can add more people at $12 a
month each ($120 a year). Free and Plus are for one person, the owner, so inviting someone needs
Pro or Max. See [Workspaces and teams](/guide/workspaces).

### Where do I pay?

It depends on where you use the app. On iPhone, iPad and the Mac App Store app you pay by in-app
purchase, and in the US there's a web checkout link too. On Android you pay through Google Play. On
the web, Windows, Linux and the Mac app from the web you use the web checkout.

Credit packs cost their face value on the web, and a little more in the App Store and Google Play,
because the stores keep a share. Card details are handled by Apple, Google or Dodo Payments; Casama
never sees your card number. See [Where you can buy](/guide/usage#where-you-can-buy).

### How do I cancel?

Open **Settings → Billing** and tap **Manage Subscription**. A subscription bought in a store is
managed and cancelled in that store: on iPhone in **Settings > Apple Account > Subscriptions**, and on
Android in **Play Store > Payments & subscriptions**.

Cancelling a store subscription keeps access until the end of the paid period. See
[Usage, budgets and plans](/guide/usage#where-you-can-buy).

### Can I get a refund?

No. Payments are non-refundable, except where the law or the store's rules require a refund. We
don't refund partly used periods, unused credits or a change of mind. Cancelling stops the next
renewal; store subscriptions keep access until the end of the paid period.

App Store and Google Play purchases are billed by Apple and Google, who decide any refund under
their own rules. If a payment is refunded or charged back, the plan ends for the period it paid for
and the credits it added that month are taken back. A refunded credit pack takes its credits back.
See the [terms](https://casama.ai/terms#paid).

### What happens if I downgrade?

Your workspace keeps everything: bots, chats, files and memories. Every bot you already have keeps
working on the new plan's credits, even when you have more bots than the plan includes. You can't
add another bot or bring back an archived one until you're under the plan's number or upgrade. Only
the new plan's number of cloud computers start, oldest first, and check-ins are limited to the
plan's number of bots in the same way. See
[Usage, budgets and plans](/guide/usage).

## Account & data

### Who can see my data?

On Casama Cloud, your chats, memories and files are used to run Casama for you. In a shared
workspace, members see content according to their roles. Your About you details, the facts bots
learn about you and your device data stay private to you. Every table uses row-level security, so
one workspace can't read another's data, and workspace owners can encrypt content at rest.

On a self-hosted server, only people with access to your server can see your data, and Casama
doesn't receive it. On its own, the server sends only its
[license renewal](/self-hosting/what-goes-home); telemetry stays off unless its owner turns it on. The official apps
connected to your server send only crash reports and one anonymous daily ping. See
[Privacy and security](/guide/privacy).

### Is my data used to train AI models?

No. Your chats, memories and files are used to run Casama for you and for nothing else. We don't
sell data or show ads, and your keys never reach the model.

To answer you, a bot sends the conversation and the context it needs to the model that runs it.
Model providers have their own policies about the data they receive. A local model keeps it on
your machine. See [Privacy Policy](https://casama.ai/privacy).

### Where is my data stored?

On Casama Cloud, the database and sign-in run on Casama's own servers, with Cloudflare for
delivery, file storage and protection from attacks. Model requests go through OpenRouter, and
live calls and read-aloud through Google. Casama is based in the Philippines, and some providers
process data in other countries, including the United States. Encrypted backups are kept for 14
days.

On a self-hosted server, your data stays on your server. See
[Privacy Policy](https://casama.ai/privacy).

### How do I export my data?

Open **Settings → Privacy** and tap **Export My Data**, or run `casama account export`. You get a
ZIP of JSON files with everything you can see: bots, chats, memories, skills, routines, usage and
more. Secrets and keys appear by name only.

The export doesn't include what bots made in the Library; open or download those from the
Library. A single chat can be exported as Markdown or JSON. See
[Export your data](/guide/privacy#export-your-data).

### How do I delete my account?

Open **Settings → Privacy**, and under **Danger Zone** tap **Delete My Account**, then type your
email to confirm. You're signed out everywhere at once, and the app shows the date your data will
be erased. On Casama Cloud that's after a 7-day grace period.

A workspace where you're the only owner is deleted with your account, even if other people use it.
The app has no screen for making someone else an owner yet, so ask for help first if the workspace
should stay. See [Delete your account](/guide/privacy#delete-your-account), and
[casama.ai/delete-account](https://casama.ai/delete-account) for deleting without the app.

### What happens if I stop using Casama?

A workspace nobody uses for 30 days rests: routines and watchers pause, and nothing is deleted. It
wakes when someone is back. After 6 months unused, the saved files of its cloud computers are
removed, and after 12 months without you using Casama (24 if you ever paid) the account is
removed. You get an email and a push notification before each step, and paid plans are never
touched. See [Inactive accounts](/guide/privacy#inactive-accounts).

### Does the model see my passwords and API keys?

No. Secrets live in a vault and are filled in at the moment a tool uses them, inside the computer or
the request. They're redacted from logs and never put into the model's input.

### How do I keep my account secure?

Turn on two-step sign-in with an authenticator app, add a passkey to sign in with Face ID, a
fingerprint or your screen lock, and turn on the app lock so Casama asks you to unlock it when it
opens. With **Confirm risky actions** on (the default), Casama also asks you to unlock again before
things like deleting your account or allowing a high-risk request. See
[Two-step sign-in](/guide/privacy#two-step-sign-in).

## Bots, apps & chat apps

### Which models can I use?

On Casama Cloud, Casama picks and runs the models for you, so you don't need a key. Models are
paid from your credits.

On your own server, use any model you have a key for: OpenAI, Anthropic, Google, xAI, OpenRouter, or
any OpenAI-compatible endpoint (Ollama, vLLM, LM Studio and others). Each bot picks its own model,
with fallbacks. See [Bots and models](/guide/bots).

### Can I use my ChatGPT plan?

Yes, on a self-hosted server. In the desktop app, open **Settings** → **Model keys** and choose
**Continue with ChatGPT**, or run `casama credential chatgpt` in the CLI. Bots' model calls then
count toward your plan's limits, and only you can use it. Casama Cloud doesn't offer it. See
[Connect a ChatGPT plan](/guide/bots#connect-a-chatgpt-plan).

### Can I run it fully offline or with local models?

You can run the server on your own network and use a local model through an OpenAI-compatible
endpoint, and calls to it are free. A local model can read pictures, and a local embedding model
keeps memory search on your machine too. Bots that browse the web or use cloud apps still need
internet access for those tasks. The license renews online every 30 days; an annual business
license can include an offline key. See [Local models](/guide/bots#local-models).

### How do bots use my other apps?

Through connections. Open **Settings** → **Integrations**, pick an app from the catalog, and connect
it with one sign-in or an API key. You can also add any MCP server, logins from a password manager
such as 1Password or Bitwarden, and plugins.

Every connection is stored encrypted, and each bot gets only the connections you give it. See
[Apps and connections](/guide/connections).

### Can a bot answer me in WhatsApp, Telegram or iMessage?

Yes. On Casama Cloud you can start right away with nothing to set up using Casama's own Telegram bot
([@casama_ai_bot](https://t.me/casama_ai_bot)), by emailing **get@casama.app**, or by messaging
Casama on [Messenger](https://m.me/1539129842611601). You can also connect a bot of your own to
Telegram, email, SMS, Slack, WhatsApp, Messenger, Feishu, iMessage, Microsoft Teams and Discord, and
every conversation also shows up in the Casama app. Assign it a Linear or Jira issue and it replies
with a comment.

Each connected chat app belongs to one bot, and the bot answers only people on its **Allowed
senders** list. iMessage needs your Mac to be on with the desktop app running. Group chats on
WhatsApp and iMessage aren't supported, and approval buttons are in Telegram and Slack only. See
[Chat apps](/guide/chat-apps).

### Does a bot join my meetings?

No. Casama doesn't send a bot into your calls. A bot can work from the notes your meeting app
already takes, or from your calendar, and file a summary with decisions and action items. See
[Meeting notes](/guide/meetings).

### Can a bot work on a schedule?

Yes. A routine is work a bot does later on its own: once at a time you pick, on a repeating
schedule, or when something happens, such as a webhook, a meeting, a message or an event on your
phone. The quickest way is to ask in chat, for example "Every weekday at 9:00, summarize my
inbox". A routine can stop on a date or after a number of runs. See [Routines](/guide/routines).

### Does each bot get its own computer?

Every bot works on a sandboxed Linux computer with a shell, a home folder that persists between
chats and a browser that stays signed in. By default bots share the workspace's team computer, and
you can give a bot a private computer of its own, optionally with a desktop you can watch live.

A computer goes to sleep after 5 minutes with nothing to do and wakes with everything intact, and
an asleep computer costs nothing. On Casama Cloud, your plan sets how many computers you have and
how many hours they can run each month. See [Computers](/guide/computers).

### Can a bot use my own computer?

Yes, if you allow it. The desktop app for macOS, Windows and Linux can lend your machine to the
bots you choose, to run commands and edit files in folders you share and use your desktop apps.
Everything a bot does on your machine shows on screen and can be stopped, and nothing is allowed
until you turn it on. See [Your own computer](/guide/companion).

### Does allowing a bot on my computer move it there?

No. The bot keeps its own computer, and yours is a second place it may also work in. By default
(**Automatic**) it uses its own computer unless a task needs your files, apps or sign-ins. You can
change this per bot under **Works on**. See
[Where a bot works](/guide/companion#where-a-bot-works).

### Can a bot browse on my phone, Mac or Linux computer?

Yes. On iPhone, iPad, Android, Mac (macOS 14 and later) and Linux (with WebKitGTK 4.1), Casama
includes a small in-app browser your bots can use while you watch — useful when a site needs your
sign-in or blocks the bot's cloud computer. Touch or click the page to take over, tap **Hand Back**
when you're done, and **Stop** at any time. See [In-app browser](/guide/in-app-browser).

### Why did my bot stop browsing on my Mac?

A bot now browses on its own computer by default. The separate browser on your Mac is used only when
the bot asks for it, or for a page only your Mac serves, like `localhost:3000`. To browse on your
Mac every time, set the bot to **Only my computer**. See [Browsing](/guide/companion#browsing).

### Can I talk to a bot?

Yes. You can dictate messages, have replies read aloud, call a bot live, and let a bot ring your
phone when something needs you. On Casama Cloud, voice is paid from your credits, with no keys to
add. On your own server, voice uses your workspace's provider keys. See
[Voice and calls](/guide/voice).

## Safety

### Can a bot do something I didn't want?

Every action has a risk level, and the bot's autonomy level decides which actions need your approval
first. Risky steps such as sending, booking, paying or deleting wait for your OK by default. Action
rules can allow an action (optionally within limits, such as recipients at one domain or a maximum
amount), always ask, or hand it to you to finish.

You can also set budgets and stop a run at any time. Destructive commands take a checkpoint first
(a recent one counts), so you can roll the computer back. Every run keeps a timeline of each step,
what it cost and why.
See [Autonomy and approvals](/guide/autonomy).

### Can a bot spend my money without asking?

No. Payments always ask, whatever the bot's autonomy setting. Model and computer costs are capped
by the bot's budgets. See [How Casama keeps bots safe](https://casama.ai/security).

### Does a bot follow instructions hidden in a web page?

Web pages, emails and files can contain text written to trick a bot. Casama marks that content as
untrusted and tells the bot never to follow instructions inside it. After a bot has read untrusted
content, actions that send data out ask for approval, even ones that normally wouldn't. See
[Untrusted content](/guide/autonomy#untrusted-content).

### What stops a bot's computer from reaching my network?

Computers reach the internet only through an egress proxy that blocks private and cloud-metadata
addresses, so a bot's computer can't reach your home or office network. Computers can't reach each
other or Casama's internal services. See [Computer providers](/self-hosting/computers).

### What stops people from misusing Casama?

If a bot's reply is harmful, long-press it and choose **Report reply**. You can also report a bot,
a gallery item or a person, and block people so they can't invite you. Reports go to the people who
run the server, who can take content down or suspend a workspace.

Every public page and Library item has a link for viewers to report it, and after reports from
three different people it's hidden until someone looks at it. A workspace can make at most 20 new
public links a day. Casama Link addresses used for phishing or malware are taken down. See
[Report or block](/guide/privacy#report-or-block).

## Self-hosting

### Can I run it on my own server?

Yes. Casama runs on Casama Cloud, or on your own computer or server. One click in the Mac app from
casama.ai, or in the Windows or Linux app, sets it up on your computer. On a server, use the
self-host release. See [Self-hosting](/self-hosting/).

### Is self-hosting free?

It's free for one person's personal use, with a license you get by signing in with your Casama
account. Business use needs a paid license for each active user, the same price as on Casama Cloud:
write to [hello@casama.ai](mailto:hello@casama.ai). A 30-day trial key is on
[casama.ai/self-hosted](https://casama.ai/self-hosted). See [Licenses](/self-hosting/licenses).

### Is the self-hosted engine open source?

No. Casama's apps, `computerd`, SDKs, CLI and MCP server are open source (AGPL-3.0 and
Apache-2.0), and so is everything that decides what a bot may do: the safety rules, the bot's
computer and its network guard. Casama Cloud runs on the Casama Engine, which is not open source.
Self-hosted, you install the engine as signed container images under a license.

### What do I need to self-host?

Docker, on your computer or on a Linux server (a Mac works for a trial), and a domain if other
people will connect. For a server, plan on 4 vCPU, 8 GB of RAM and 40 GB of disk for a few
computers at once; see [Install on a server](/self-hosting/server). To try it on your own computer
without a terminal, use **Run on This Mac** (or **Run on This Computer**) on the desktop app's
sign-in screen. See [Install on your computer](/self-hosting/desktop).

### What happens when a license runs out?

Your data is never locked: signing in, reading, exporting and backups keep working. After a 14-day
grace period, new bot runs stop until you renew. See
[Licenses](/self-hosting/licenses#when-a-license-runs-out).

### What does a self-hosted server send to Casama?

On its own, only its license renewal: the license key, the server's instance id and the engine
version. See [What goes home](/self-hosting/what-goes-home).

### How do I update?

In the desktop app, choose **Update**. On a server, run `casama selfhost update`. Both back up
first and go back to the old version if the new one doesn't start properly. See
[Updates and rollback](/self-hosting/updates).

### Can I use a server on my own computer from my phone?

Yes. [Casama Link](/self-hosting/remote-access) gives a server installed with `--local` an address
like `https://k7qm2xfd9abc.casama.link`, with no domain and no open ports. Your phone signs in by
scanning a QR code, and notifications reach it like any other app's. Phone traffic goes through
Cloudflare to your computer, never through Casama's servers. It's free on every plan, including
Free. Watching a bot's computer live while you're away from home comes with Plus and up.

### Can I use Casama Cloud computers from my own server?

Yes, with [Casama Link](/guide/casama-link). Computer time and model calls are paid from the cloud
workspace's credits, and your bots, chats and data stay on your server. See
[Cloud computers and credits](/self-hosting/casama-link-cloud).

### Can I move between Casama Cloud and my own server?

Yes. Your workspace exports in full, and bots, skills and routines can be shared as files and
packs. See [Templates, sharing and import](/guide/sharing).

## Casama Link & Pages

### What is Casama Link?

Casama Link connects a Casama server you run yourself to a Casama Cloud workspace. It has two
parts, and you can use either or both. Remote access gives your server an address your phone can
reach, sign-in by scanning a code, and notifications in the store apps. Cloud computers and credits
let your bots use Casama Cloud's computers and models.

Your bots, chats, memory and files stay on your server either way. See
[Casama Link](/guide/casama-link).

### Is Casama Link free?

Remote access is free on every plan: the address, sign-in by QR code and notifications. Live video
of a bot's computer away from the computer that runs the server comes with Plus and up; on Free you
see a screenshot about once a second. Free and Plus link one server, Pro three and Max ten.

Cloud computers and model calls are billed to the cloud workspace's credits. See
[Servers per plan](/self-hosting/remote-access#servers-per-plan).

### What is a page?

A page is a small web page a bot publishes for you: a report, a dashboard, a tracker, a site or a
game. Ask for one when an answer is better as something to look at, keep, play or share than as a
chat message. Pages open in your browser, stay private until you share them, can refresh
themselves on a schedule, and are kept in the Library. See [Pages](/guide/pages).

### How do I share something a bot made?

Open it in the Library and, under **Who Can See It**, choose **Only me**, **Workspace** or
**Anyone with the link**. A public link opens for anyone without signing in, and is hidden from
search engines. On Casama Cloud, shared pages open at `share.casama.page`.

To take a link back, set it to **Only me** or **Workspace**; the old link stops working, and making
it public again gives a new one. See [Share what bots make](/guide/sharing#share-what-bots-make).

## Building on Casama

### Is there an API?

Yes. Everything the apps do goes through a documented HTTP API, with a CLI and SDKs for TypeScript
and Dart. See [HTTP API](/develop/api) and the [API reference](/api/).

### Can I extend what bots can do?

Yes: connect MCP servers, write [plugins](/develop/plugins) (skills plus tool servers), share whole
bots and their routines as [packs](/develop/packs), share [bot templates](/develop/bot-templates),
or call other agents over [A2A](/develop/a2a).

### Can my coding agent learn Casama?

Yes. Give it the agent kit (skills for plugins, the API and more) and the docs MCP server, or point
it at [llms.txt](https://docs.casama.ai/llms.txt). No account is needed. See
[Build with AI agents](/develop/agents).

### Can a bot hand work to a coding agent?

Yes. A bot can hand a coding task to a coding agent such as Claude Code, Codex or Cursor, and
report back with a summary and the files that changed. The agent can run on your own computer with
your own sign-ins, on the bot's computer, or as one of Cursor's cloud agents. See
[Coding agents](/guide/coding-agents).

### How do I contribute?

Read [Contribute to Casama](/develop/contributing), and
[How Casama is built](/develop/architecture) for a map of the code. Bug reports, docs fixes and
code are all welcome.

## Getting help

### How do I get help in the app?

Open **Settings > Help & support**. On Casama Cloud, **Casama Help** answers straight away: it
knows these guides and can check your account and the workspace you have open: your plan and its
limits, purchases, this month's usage, credit history, connected apps and chat channels, invites,
and a bot's settings, routines and recent errors. It sees what the app would show you and never
reads your chats. Answers can link straight to the screen or store page you need.
When a person should take over, it writes up the problem and you send it to our support team with
one tap; we reply by email. You can also choose **Contact support** there at any time.

The same page shows your **support IDs**. Your workspace ID is also your purchase ID in the App
Store and Google Play, so share it if we ask about a purchase.

### Is Casama Cloud down?

[status.casama.ai](https://status.casama.ai) shows whether the API, web app, sign-in and docs are
working right now, with 90 days of uptime and a note when we know about a problem. It runs outside
our servers, so it stays up when they don't. If the app can't reach Casama Cloud, the bar at the
top has a **Status** button that opens it. For a self-hosted server, see
[Troubleshooting](/self-hosting/troubleshooting).

### Where do I share an idea or a feature request?

Two places, and we read both:

- **In the app:** **Settings > Help & support > Send feedback**. Pick idea, something you like,
  something you don't, or something confusing. Only the Casama team sees it.
- **On the ideas board:** [ideas.casama.ai](https://ideas.casama.ai) lists ideas in public. Vote and
  comment on them, post your own, and see what's planned, in progress or shipped. You sign in with
  a link sent to your email. **Ideas board** in Help & support opens it too.

Building on Casama (the API, plugins, self-hosting)? Use
[GitHub Discussions](https://github.com/casama-ai/casama/discussions) for questions and ideas,
and [Issues](https://github.com/casama-ai/casama/issues) for bugs.

### How do I reach the Casama team?

| For                              | Email                                         |
| -------------------------------- | --------------------------------------------- |
| Anything else, or not sure       | [hello@casama.ai](mailto:hello@casama.ai)       |
| Help with the apps or your account | [support@casama.ai](mailto:support@casama.ai) |
| Plans and invoices               | [billing@casama.ai](mailto:billing@casama.ai)   |
| Your data and privacy requests   | [privacy@casama.ai](mailto:privacy@casama.ai)   |
| Security issues                  | [security@casama.ai](mailto:security@casama.ai) (see `SECURITY.md`) |

All of them are on the [contact page](https://casama.ai/contact).
