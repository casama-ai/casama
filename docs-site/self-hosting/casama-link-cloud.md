# Casama Cloud models, computers and credits

Run your own Casama server, and let Casama Cloud pay for the model calls, host the bots' computers,
or both. Your bots, chats, memory and files stay on your server.

There are two ways in:

- **[The one-switch way](#use-casama-cloud-models):** turn on **Casama Cloud** under
  **Settings → Models**. No keys to copy. This page's first half.
- **[The manual key way](#the-manual-way-a-casama-link-key):** make a Casama Link key by hand. You
  need it for cloud computers, and it still works for models. The second half.

This is the paid half of Casama Link. The free half, an address your phone can reach plus
notifications, is on [Use your server on your phone](/self-hosting/remote-access). See the
[Casama Link overview](/guide/casama-link) for how the two fit together.

Want to stop running a server instead? See [Move to Casama Cloud](/self-hosting/move-to-cloud).

## Use Casama Cloud models

One switch makes your bots use Casama's models, paid by a Casama Cloud plan. You can turn it on or
off any time.

1. Open **Settings → Models** and choose **Casama Cloud**. Only admins of the server see the switch.
   Other people see who pays.
2. Sign in with your Casama account. If you signed in already for your license, this is skipped.
3. Pick who pays. Choose a Casama Cloud workspace you own or run. With none, choose **Create One**.
4. Pick a plan, unless the workspace already has one that covers this. Or choose **Try It First**.
5. Check the review screen, then choose **Turn On Casama Cloud**.

From a terminal, for a server with no app open:

```sh
casama selfhost cloud-models on --workspace "My workspace"
casama selfhost cloud-models status
casama selfhost cloud-models off
```

`on` signs in to Casama Cloud with your account and hands the server a one-time code, so your Cloud
sign-in never reaches the server. The CLI must also be signed in to the server as its admin. See
[CLI](/develop/cli).

### Who pays

The Casama Cloud workspace you pick pays, never your license. A personal, trial or business license
has no say in it. The workspace's plan, included usage and daily limit are shared with everything
else it uses on Cloud, and with every server it pays for. There is no separate price for
self-hosting. Free Cloud plans don't count: it needs a paid plan or bought credits.

### Free usage to try

**Try It First** gives about $0.50 of free usage, once per Casama account: several hundred
messages. It needs no purchase. When it's used up, the screen asks you to choose a plan.

### What's checked

Each call is checked on Casama Cloud before it runs:

- **Plan.** The workspace has a paid plan, bought credits, or free usage left.
- **Seats.** On a business or trial server, the people using the server are counted like seats on
  Cloud. Above the plan's seats, each extra person is billed at Cloud's extra-person price. The
  review screen says what that costs before you confirm.
- **Daily limit.** One daily limit is shared by Cloud and every server the workspace pays for, so
  using it in two places can't spend more than the limit.
- **Credits** are enough for the call.

### Billing

Calls are billed at the price Casama Cloud charges, from the workspace's included usage first, then
its credits. The same calls show on the workspace's **Billing** screen under your server's name, and
on your server's **Usage** screen with the included usage left and today's spend against the limit.

### What the review screen switches

- **Chat and background work** switch for the bots you pick. By default that is the bots with no
  working key. Each bot shows what it used before and what it uses now, and warns you when the new
  model may answer shorter or less carefully. Try one bot first if you're unsure.
- **Memory search, images, read aloud and dictation** switch only where none of your own keys
  covers the job. Memory is an extra choice: it re-indexes in the background, and search keeps
  working by words while it catches up.
- **Live voice, phone calls and video** keep using your own keys.

Casama picks the model for each job, and it can change as better ones arrive. Nothing to update on
your side.

### Members on a business or trial server

Admins choose who may use Casama Cloud (everyone, or chosen people) and can set a daily limit per
person. People see **Casama Cloud, paid by** the workspace's name on a bot's model, and get a notice
the first time one of their bots answers through it.

### Own key as a fallback

Turn on **If Casama Cloud runs out or can't be reached, use my own key** to let your bots answer
with your own key when Cloud can't. Each such answer says it came from your own key. It's off by
default and shows only when you have a working key. A fallback in the other direction (your own key
fails, Cloud answers) can be set under **When Casama Cloud can't answer**.

### Turn it off

Choose **Turn Off** on the same screen. It lists each bot and the key it goes back to: its previous
key when that still works, else the workspace's default key, else **Needs a key**. Confirm, and
Casama Cloud models stop at once. Nothing else changes, and you can turn it on again any time.

### When it stops

Nothing fails silently. Bots reply once in plain words, and routines wait and carry on by
themselves when the cause is fixed. The server checks Casama Cloud every 15 minutes while it waits.

| What happened | What people see | What to do |
| --- | --- | --- |
| Included usage or credits used up | "Casama Cloud is out of usage for this month." | **Top Up**, or **Use My Own Key** |
| Daily limit reached | "Today's Casama Cloud limit is used up." It says when it resets | Wait, or **Use My Own Key** |
| No paid plan | "Casama Cloud needs a plan on" the workspace | **See Plans** |
| Plan ended | "The Casama Cloud plan on" the workspace "ended." You get notices 3 days and 1 day before | **Renew**, or **Use My Own Key** |
| Plan doesn't cover everyone | "The plan on" the workspace "doesn't cover everyone using Casama Cloud here." | Admin: add seats or change the plan |
| A person hit their limit | "You've reached today's Casama Cloud limit on this server." | **Ask an Admin**, or wait for the reset |
| A person isn't allowed | "Your admin hasn't turned on Casama Cloud for you." | **Ask an Admin** |
| Server disconnected, or key revoked | "Casama Cloud was disconnected from this server." | Admin: **Reconnect** |
| Casama Cloud can't be reached | The server tries three times quietly, then "Casama Cloud can't be reached right now. Trying again." | **Use My Own Key**, or wait |
| Server license expired | The license screen, as usual | Renew the license |

With the fallback on, each of these is answered with your own key instead, and says so once a day.
Before a limit is reached, at 80% of the included usage or the daily limit, you get one banner and
a notification with **Top Up** or **Use My Own Key**.

What goes to Casama Cloud: see [What goes home](/self-hosting/what-goes-home#casama-cloud-models).

## The manual way: a Casama Link key

Use a key you make by hand for cloud computers, or for models on a server that has no app to turn
the switch in. It has the same billing as above.

### 1. Create a key in Casama Cloud

You need to be an owner or admin of the cloud workspace.

1. In the Casama Cloud app, open **Settings → Billing**.
2. Open **Charges by server, Casama Link servers and keys**.
3. Under **Casama Link**, choose **New Casama Link Key**.
4. Enter a **Server name**, such as `home-server`, and choose **Create**.
5. Copy the key. It starts with `kcc_` and is shown only once.

A key from the app can use both computers and models. Through the API you can pick what a key may
do with `scopes` on `POST /v1/orgs/{id}/link/keys`:

| Scope           | Lets the server                                  | Spends credits |
| --------------- | ------------------------------------------------ | -------------- |
| `computers`     | Create and use computers on Casama Cloud         | Yes            |
| `models`        | Call models through Casama Cloud                 | Yes            |
| `remote_access` | Hold a `casama.link` address                     | No             |
| `push`          | Send notifications to the store apps             | No             |

A key made by linking (`casama selfhost remote on`, or **Use on Your Phone** in the app) has only
`remote_access` and `push`.

### 2. Configure your server

Add both values to `.env`:

```sh
CASAMA_CLOUD_URL=https://api.casama.ai
CASAMA_CLOUD_KEY=kcc_...
```

Then run `casama selfhost up`. The API and worker now offer a computer provider named
`casama-cloud`.

::: tip One key per server
A server holds one `CASAMA_CLOUD_KEY`. To use cloud computers or credits and remote access
together, create the key through the API with all four scopes, set it in `.env`, then run
`casama selfhost remote on`, which keeps a key that can already hold an address. Linking again
replaces the key with one that can't spend credits.
:::

### 3. Use cloud computers

Create a computer with the provider `casama-cloud` through the API:

```http
POST /v1/computers
Content-Type: application/json

{ "org_id": "<workspace id>", "name": "Cloud computer", "kind": "team", "provider": "casama-cloud" }
```

The computer runs on Casama Cloud, and bots use it like any other computer: shell, files, browser,
sleep and wake. If the server has no `CASAMA_CLOUD_KEY`, the request fails with `link_cloud_off`.
If the key lacks the `computers` scope, Casama Cloud refuses with `computers_unavailable`. See
[API](/develop/api) and [Computers](/guide/computers).

### 4. Use the key for models

With the key in `.env`, the server reads it when it needs it. If you used the one-switch way, skip
this step: the server already has a key. To use the key as an ordinary model key instead, add an
OpenRouter model key that points at Casama Cloud, with the Casama Link key as the API key:

```sh
casama credential add --provider openrouter --label "Casama Cloud" \
  --base-url https://api.casama.ai/link/v1/models \
  --key kcc_...
```

Then pick that key and a model in a bot's settings. Casama Cloud passes the calls to its own model
provider (OpenRouter by default) and bills the cost that provider reports. One call can ask for at
most 32,768 output tokens (more is cut to that), and it needs enough credits for its prompt and
that output. A streamed call you stop early is billed for its prompt and what came out, reasoning
included.

### Billing for computers and keys

| What                | How it's billed                                              |
| ------------------- | ------------------------------------------------------------ |
| Cloud computer time | Per hour, from create or wake until sleep or delete          |
| Model calls         | The provider's reported cost, with Casama Cloud's markup     |

Usage appears on the cloud workspace's **Billing** screen with your server's name, and is deducted
from its credits. When the credits run out, new computers, wake-ups, commands and model calls are
refused with `out_of_credits` until credits are added. Model calls also stop for the day when the
workspace reaches its daily limit for model credits. See [Usage, budgets and plans](/guide/usage).

Cloud computers follow the cloud workspace's plan, counted together with its own hosted computers:
how many computers it can have and run at once (`plan_limit`), its computer hours for the month
(`computer_hours_exceeded`), and its computer size (a bigger size asked for is cut to the plan's).
When the workspace runs out of credits or computer hours, Casama Cloud puts its running computers
to sleep itself, and the next wake-up restores them from that sleep.

### Revoke a key

1. In Casama Cloud, open **Settings → Billing**, then **Charges by server, Casama Link servers and
   keys**.
2. Under **Casama Link**, choose the delete icon next to the server.
3. Confirm **Revoke**.

That server stops using cloud computers and credits right away. If the key also held an address,
the address is removed too.

### Limits

- Live view and terminals for cloud computers aren't available through Casama Link. Bots can still
  use the computer.
- The app has no option to pick the `casama-cloud` provider when creating a computer. Use the API.
- A cloud computer belongs to the cloud workspace that first created it. Other cloud workspaces
  can't use it.

## Related

- [Move to Casama Cloud](/self-hosting/move-to-cloud)
- [What goes home](/self-hosting/what-goes-home)
- [Casama Link overview](/guide/casama-link)
- [Use your server on your phone](/self-hosting/remote-access)
- [Computer providers](/self-hosting/computers#casama-link-computers)
- [Configuration](/self-hosting/configuration#casama-link)
- [Usage, budgets and plans](/guide/usage)
- [CLI](/develop/cli)
