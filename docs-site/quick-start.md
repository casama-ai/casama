# Quick start

Sign in, and give your first bot a task. About 15 minutes.

Casama runs on Casama Cloud, or on your own computer or server. Most people start with Casama
Cloud.

Get [Casama Cloud](https://casama.ai/download) in the app or at
[app.casama.ai](https://app.casama.ai), and skip to [step 5](#_5-meet-your-first-bot). You can also
start with nothing to install by messaging [@casama_ai_bot](https://t.me/casama_ai_bot) on Telegram,
emailing **get@casama.app**, or messaging Casama on [Messenger](https://m.me/1539129842611601). See
[Chat apps](/guide/chat-apps).

## 1. Or run your own server

Free for one person's personal use; business use needs a [license](/self-hosting/licenses). Pick
one:

- **On your computer:** in the Mac app from casama.ai, or the Windows or Linux app, choose **Run on
  This Mac** (**Run on This Computer**) on the sign-in screen. See
  [Install on your computer](/self-hosting/desktop). The setup covers steps 2 to 4.
- **On a server:** run `casama selfhost install --domain casama.example.com` (or `--local`). See
  [Install on a server](/self-hosting/server).

## 2. Install a client

- **Apps**: iOS, iPadOS, Android, macOS, Windows, Linux and the web. On a Mac, get the app from
  [casama.ai/download](https://casama.ai/download) rather than the Mac App Store if you want bots
  to use your Mac or to run a server on it; see
  [which Mac app to get](/faq#should-i-get-the-mac-app-from-the-website-or-the-mac-app-store).
- **CLI**: `brew install stackwares/tap/casama`, or download a binary from the
  [releases page](https://github.com/casama-ai/casama-releases/releases). See [CLI](/develop/cli).

## 3. Sign in to your server

**In the app:**

1. Tap **Let's Go**.
2. Tap **More Options**, then the button that shows the current server (**Server:** followed by an
   address). Enter your server's address (for example `https://casama.example.com`, or the address
   `--local` printed) and tap **Connect**.
3. Tap **Continue with Email** → **Use a Password Instead** → **New here? Create an account**, and
   enter an email and password.

The first account on a server becomes its owner.

::: info Email links, Google and Apple
Signing in with an emailed link needs the server to send email, and Google and Apple sign-in need
them set up on the server. A new server has neither, so start with a password. See
[Configuration](/self-hosting/configuration).
:::

**With the CLI:**

```sh
casama config --api-url https://casama.example.com
casama signup --email you@example.com
```

## 4. Add a model

Bots need a model. On Casama Cloud they already have one. On your own server, open **Settings** →
**Model keys** and pick one of these:

- **Continue with ChatGPT** to use a ChatGPT plan you already pay for. This needs the desktop app,
  or `casama credential chatgpt` in the CLI.
- **Add Key** for OpenRouter, OpenAI, Anthropic, Google or xAI.
- **Add Key** → **OpenAI-compatible server** for a local model served by Ollama, LM Studio or vLLM.
  Use an address the server can reach: on a self-hosted server, that's the model machine's network
  address rather than `localhost`, allowed with `OUTBOUND_ALLOW_CIDRS`
  (see [Configuration](/self-hosting/configuration)). Calls to a local model cost nothing.

With the CLI:

```sh
casama credential add --provider openrouter      # prompts for the key
casama credential chatgpt                        # or sign in with a ChatGPT plan
casama credential add --provider openai_compatible --base-url http://192.168.1.20:11434/v1
```

## 5. Meet your first bot

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

## 6. Give it real work

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
