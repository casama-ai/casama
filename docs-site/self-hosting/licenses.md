# Licenses

A self-hosted Casama server runs under a license key. There are three kinds.

| | Personal | Trial | Business |
| --- | --- | --- | --- |
| **Who it's for** | One person, personal use, on your own computer or server | Evaluating Casama for a business | Work and companies |
| **Price** | Free | Free | $29 per active user a month, or $24 a month billed yearly. [Contact us](mailto:partners@casama.ai) |
| **How you get it** | Sign in with your Casama account | Ask on [casama.ai/self-hosted](https://casama.ai/self-hosted); the key comes by email | Write to [partners@casama.ai](mailto:partners@casama.ai); the key comes by email |
| **Lasts** | 30 days, renews itself online | 30 days | As agreed |
| **People** | One member | Set by the key | Active users up to the seats |

## Personal

The personal license is free. It's for one person and for personal use, not for work or a business.
It covers your own computer or your own server.

It includes what a Casama Cloud Pro user has, without Casama Cloud's models: one member, as many
bots as your machine runs, your own provider keys and OpenAI-compatible endpoints (local ones
included), and a [Casama Link](/self-hosting/remote-access) address.

Workspace sharing, single sign-on and audit export need a business license. Inviting a second person
asks for one.

**To get it**, sign in with your Casama account when your server asks. In the desktop app this is a
step of the setup. On a server, use the Casama app connected to it, or run
`casama selfhost license personal`. If you don't have a Casama account yet, you can make one in the
same step: asking for a personal license lets your email address past the invite list.

## Business

A business needs a paid license for each active user: $29 per active user a month, or $24 a month
billed yearly. An active user is a member who used the server that month. Write to
[partners@casama.ai](mailto:partners@casama.ai). An annual license can add single sign-on, audit-log
forwarding and an offline key.

### Try it first

Enter your email address on [casama.ai/self-hosted](https://casama.ai/self-hosted) and we email you
a 30-day trial key. The key ties itself to your server the first time it renews.

### Seats

A business license counts active users. When every seat is taken, adding a member fails with
`license_seats` until you have more seats or remove someone.

### Offline keys

An offline key, part of an annual license, doesn't renew online. Enter it like any other key. Ask for
a new one before it expires.

## Enter a key

Do one of these:

- Open the Casama app connected to your server and choose to enter a business key.
- Run `casama selfhost license` on the server.
- Put it in `.env` as `CASAMA_LICENSE_KEY`, then run `casama selfhost up`.

While a server has no license, anyone who can reach it can enter the first one. After that, only an
instance owner can change it. A key you set in the app or with the CLI is stored in the database and
wins over the one in `.env` when it's newer.

## Renewal

Personal and trial keys last 30 days. From day 20 the server renews them in the background at
`api.casama.ai`. It needs outbound HTTPS now and then. The renewal sends only what
[What goes home](/self-hosting/what-goes-home) lists.

## When a license runs out

Your data is never locked. Signing in, reading, exporting and backups keep working.

| When | What happens |
| --- | --- |
| Before it expires | Everything works |
| 14 days after it expires (grace) | Everything works, and a banner says how to renew |
| After the grace period | New bot runs stop with `license_expired`. Reading, export and backups keep working |

Renew or enter a new key and bots work again.

## Moving to a new computer

You get one personal license per account. To move, install Casama on the new computer or server and
sign in with the same Casama account. The license moves there, and the old server stops renewing it.
The old server's key lasts until it expires, then the grace period applies.

To take your data with you, [back up](/self-hosting/operations#back-up-your-server) the old server
and restore it on the new one.

## Check your license

The app shows the license's state. `casama selfhost license` shows it in a terminal. The server also
answers without sign-in:

```sh
curl https://casama.example.com/v1/selfhost/status
```

It returns the state (`setup`, `active`, `grace` or `expired`), the edition, when the key expires,
when the grace period ends, the members and seats, and the engine version.

## Terms

The license doesn't allow removing or getting around the license check, sharing a key, or offering
the engine to others as a hosted service. The full terms come with the license, and
[LICENSING.md](https://github.com/casama-ai/casama/blob/main/LICENSING.md) lists what is open
source.

## Related

- [Self-hosting](/self-hosting/)
- [Updates and rollback](/self-hosting/updates)
- [What goes home](/self-hosting/what-goes-home)
