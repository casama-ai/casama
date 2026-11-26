# What goes home

What a self-hosted Casama sends to us. Your chats, files and memory stay on your server.

## Your server

Every self-hosted server, including the desktop app's, sends one thing to Casama on its own: a
**daily license check-in**. It carries your license key (which names your Casama account or your
company), your server's instance id, the engine version, and two numbers: how many members and how
many bots the server has. Never names, chats, files or memory. It goes to `api.casama.ai`
(`CASAMA_LICENSE_SERVER`) and renews your key. It can't be turned off while the server uses an
online key. An offline business key doesn't check in.

If a check-in fails because you're offline, nothing changes until the key runs out. If Casama
revokes a license, the next check-in puts the server into the expired state: your data stays
readable and exportable, and new bot runs stop.

Everything else from the server is off unless you turn it on:

- **Usage ping:** off by default. With `TELEMETRY=on`, the server sends once a week a random
  instance id, the Casama version, and the number of bots and users active in the last 7 days.
- **Product analytics and error reports:** off unless you set your own keys. They go where you point
  them.
- **`DO_NOT_TRACK=1`** turns off everything optional.

A health heartbeat for business servers is planned for a later release: versions, image digests,
migration state and service health, never chats, files or memory. It will be on by default, with one
setting to turn it off.

## Things you use

These talk to Casama or to others only because of what they do:

| Feature | What leaves your server | Turn it off |
| --- | --- | --- |
| The gallery | Downloads the public catalog from `gallery.casama.ai` and use counts from `api.casama.ai`. Your installs aren't sent | `GALLERY_URL=off`, `GALLERY_STATS_URL=off` |
| [Casama Link](/self-hosting/remote-access) | The server's name, address and check-ins | Off until you turn it on |
| Phone notifications | The store apps can only get notifications through Casama's push relay, so a notification for your phone passes through Casama Cloud on its way. Nothing is stored there: not the device tokens, not the text | Turn on private notifications to send them without the words |
| [Casama Cloud models](#casama-cloud-models) | Prompts and replies for the bots you switch, passing through | Off until an admin turns it on |
| [Cloud computers and credits](/self-hosting/casama-link-cloud) | Computer commands and model calls | Off until you add a key |
| [Moving to or from Casama Cloud](#when-you-move-to-casama-cloud) | The whole workspace, once | Only when you start a move |
| Models | Your conversations go to the model provider you chose. A local model keeps them on your machine | Your choice of model |
| Apps and web search | What a bot sends to the services you connect | Your connections |

Signing in with your Casama account to get a license is a normal sign-in to Casama Cloud, covered by
our [privacy policy](https://casama.ai/privacy).

## Casama Cloud models

Off until a server admin turns it on under **Settings → Models → Casama Cloud**. Then, for the
bots and jobs that use it:

- **Passes through:** the messages a bot sends to the model, and its reply, go through Casama Cloud
  to the model provider. Casama doesn't store them.
- **Recorded:** the server's name, the model, the token counts and the cost. They show on the paying
  workspace's Cloud bill and on your server's Usage screen. Calls made for a person carry an opaque
  id, so a per-person daily limit can work.
- **Also sent:** a daily check of the plan, usage left and seats, and the server's member count from
  the license check-in.
- **Stays home:** bots, chats, memory, files and computers. Jobs that keep your own keys, such as
  live voice, phone calls and video, never go to Casama.

Members of a business or trial server are told once, the first time a bot of theirs answers through
Casama Cloud. Turning it off stops all of this at once. See
[Casama Cloud models](/self-hosting/casama-link-cloud#use-casama-cloud-models).

## When you move to Casama Cloud

Only when you start a move, the server sends the workspace to Casama Cloud, server to server, once:
bots, chats and runs, memory, routines, files, apps and their data, plugins, settings and each
computer's home folder. Model and chat app keys go only with **Bring my keys** ticked, sealed so
only Casama Cloud can read them. Casama Cloud then stores the workspace like any other workspace
and bills it as one. Moving back to your own server sends it the other way. See
[Move to Casama Cloud](/self-hosting/move-to-cloud).

## The official apps

The Casama apps connected to your server send only crash reports and one anonymous "the app was used
today" ping a day. No screens, no events, no account id. Turning off **Settings → Privacy → Share
Usage Data** stops them. See [Privacy and security](/guide/privacy).

## Related

- [Licenses](/self-hosting/licenses)
- [Move to Casama Cloud](/self-hosting/move-to-cloud)
- [Configuration](/self-hosting/configuration#telemetry-and-observability)
- [Privacy and security](/guide/privacy)
