# Quick start

Sign in, and give your first bot a task. About 10 minutes.

::: warning Self-hosting is paused
Self-hosting is paused while the Casama Engine moves to a separate license, so there is no server to start for now. Casama Cloud is the way to run Casama today.
:::

Get [Casama Cloud](https://casama.ai/download) in the app or at [app.casama.ai](https://app.casama.ai).
You can also start with nothing to install by messaging
[@casama_ai_bot](https://t.me/casama_ai_bot) on Telegram, emailing **get@casama.app**, or messaging
Casama on [Messenger](https://m.me/1539129842611601). See [Chat apps](/guide/chat-apps).

## 1. Install a client

- **Apps**: iOS, iPadOS, Android, macOS, Windows, Linux and the web. On a Mac, get the app from
  [casama.ai/download](https://casama.ai/download) if you want bots to use your Mac; see
  [which Mac app to get](/faq#should-i-get-the-mac-app-from-the-website-or-the-mac-app-store).
- **CLI**: `brew install stackwares/tap/casama`, or download a binary from the
  [releases page](https://github.com/casama-ai/casama-releases/releases). See [CLI](/develop/cli).

## 2. Sign in

**In the app:**

1. Tap **Let's Go**.
2. Tap **Continue with Email** → **Use a Password Instead** → **New here? Create an account**, and
   enter an email and password. You can also continue with Google or Apple.

**With the CLI:**

```sh
casama signup --email you@example.com
```

## 3. Models

Bots need a model. On Casama Cloud they already have one: Casama picks the models. If you'd rather
use your own provider account, open **Settings** → **Model keys**, tap **Add Key** and pick OpenAI,
Anthropic, Google, OpenRouter or another OpenAI-compatible provider.

With the CLI:

```sh
casama credential add --provider openrouter      # prompts for the key
```

## 4. Meet your first bot

The first time you sign in, the app asks **What should bots call you?**, then makes a workspace
named after you and a personal bot called Casama, and opens its chat. This is the bot's
**General** conversation, where quick questions, briefs and its suggestions land. The chat starts
empty, with tiles to **Connect your apps** and a few starter requests you can tap. Prefer to set
things up yourself? Choose **Set Up Manually** while the workspace is being made.

Your first bot has check-ins on: each morning it sends a brief, and during the day it looks for
things it could help with and offers them as suggestions you accept or dismiss. See
[Routines and triggers](/guide/routines#check-ins).

With the CLI:

```sh
casama org create "My team" && casama org use my-team
casama credential list                           # find your key's id
casama bot create Anna --credential <id>
casama chat Anna "Research the top three open-source vector databases and write a comparison to report.md"
```

## 5. Give it real work

Try a task that needs its computer:

> Find the five most-starred Rust web frameworks on GitHub, compare their latest releases, and save
> a table to `frameworks.md`.

Open the bot's computer to watch it work. When it wants to do something risky, an approval appears
in the chat and as a notification. What it makes, such as the table above, reports, pictures and
sites, is kept in the [Library](/guide/library).

::: tip Is it working?
Casama is open source. If it's useful to you, a
[star on GitHub](https://github.com/casama-ai/casama) helps other people find it.
:::

## Next steps

- Connect your tools: [Apps and connections](/guide/connections)
- Put it on a schedule: [Routines and triggers](/guide/routines)
- Decide what it may do on its own: [Autonomy and approvals](/guide/autonomy)
- Invite your team: [Workspaces and teams](/guide/workspaces)
- Reach it from Slack, Teams, Telegram and more: [Chat apps](/guide/chat-apps)
- Use it from your coding tool: [Connect AI apps](/guide/mcp)
