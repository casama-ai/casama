# Move to Casama Cloud

Move a whole workspace from your own server to Casama Cloud, or back. Your bots, chats, memory,
routines, files and computers come along. Nothing changes until you confirm a screen that says what
will change, and the old side stays intact until the move is done.

If you only want Casama's models and want to keep your server, see
[Casama Cloud models](/self-hosting/casama-link-cloud#use-casama-cloud-models) instead.

Only the workspace's owner can move it.

## Move to Casama Cloud

1. Open **Settings** and choose **Move to Casama Cloud**.
2. Choose **Move to Casama Cloud**, sign in with your Casama account, and pick where it goes:
   - **A new workspace** starts empty on Casama Cloud, named after you.
   - **A workspace you already have** takes the moved items next to what's there. Nothing is
     overwritten, and names that clash get "(moved)". The workspace that already pays for Cloud
     models is a good choice.
3. Read the check screen. It is free and changes nothing, and takes under 30 seconds.
4. Choose **Start Move**.
5. Watch the progress, or close the app. The move carries on without it, and you get a notification
   when it's done or needs you.

The move goes from your server to Casama Cloud, never through your phone.

### The check screen

- **Ready to Move** shows the size and about how long it takes, and how long your bots pause near
  the end. If the pause is long, it says so, and you can pick a quiet time.
- **What comes along** counts bots, chats, memories, routines, files, computers and people.
- **What needs you afterwards** lists what you do on the other side (see below).
- **This workspace doesn't fit the plan there** shows what's over, and which plan fits: people, bots,
  computers or storage. Choose the plan on Casama Cloud, then choose **Check Again**.
- **Update this server first** shows when your server is older than the one you're moving to. Update
  it (`casama selfhost update`, or the desktop app), then check again.
- **Bring my keys** is on by default. See below.

### What happens during a move

1. **Copying.** Files and computer home folders copy while everything keeps working.
2. **Pausing.** Bots, routines and channels pause for a short time, and chat becomes read-only. The
   last changes copy, then everything switches over. Typically about 2 minutes for a personal
   server.
3. **Importing.** Casama Cloud brings it in and the app switches to Cloud by itself.

A sender that calls your old server's webhooks during the pause is told to try again later.

## What moves and what doesn't

| Comes along | Needs you afterwards |
| --- | --- |
| Bots, chats, runs and events | App connections (Google, Slack and the like): sign in to them again. They belong to your server's own app registrations and can't move |
| Memory (searchable at once by words; **Memory is catching up** until re-indexing ends, a few minutes) | ChatGPT plans linked to a person: sign in to ChatGPT again |
| Routines, files, apps and their data, plugins, settings | People: members are matched to Casama accounts by email. Others get an email invite and show as "(invited)" until they accept |
| Each computer's home folder | Computers start fresh, with the home folder restored. Packages you installed on the system aren't there |
| Model and chat app keys, with **Bring my keys** | Approvals, full access and device access start from the new server's defaults. Check them for each bot |

Plugins and apps go through the same checks as a gallery install when they arrive.

### Bring My Keys

With **Bring my keys** on, your model keys and chat app keys (Telegram, Slack and so on) travel
server to server, sealed so only the new server can read them. A Telegram bot is pointed at its new
home when its key comes along. With it off, you add the keys again on the other side. The check
screen says how many keys go.

## The pause

For a typical personal server the pause is under 5 minutes, and the check screen tells you the real
number first. While it lasts, bots, routines and channels wait, and chat is read-only. A sender that
calls your webhooks during it gets a "try again later" answer and retries. Nothing runs twice: after
the switch, only one server runs your routines and channels.

## The old server afterwards

- It becomes **read-only**, with "This workspace moved" and a button to sign in to Casama Cloud, or
  to **View the Old Copy**.
- Its routines, channels and Casama Cloud models are off.
- For 30 days it **forwards incoming webhooks** to Casama Cloud, as long as it keeps running. Give
  each sender the new webhook address when you can; the checklist lists them.
- Other devices signed in to it see **This workspace moved**, with one tap to switch.
- After 30 days, remove it. In the desktop app, that's one tap.
- Apps too old to know about moves still show a plain message: "This workspace moved. Update the
  app or sign in at casama.ai".

A workspace moves once. Starting the same move again says when it already moved, instead of making a
copy.

## When something goes wrong

If a move stops, the screen says **The move stopped** and "Nothing changed here: this workspace
keeps working." Your old server carries on by itself, the half-made copy on the other side is
removed, and nothing is charged. Choose **Try Again**: it picks up where it stopped, keeping what
already arrived. If the move code ran out, it asks for a new one.

## Move to my own server

For people who want to leave Casama Cloud, or move between two servers of their own.

1. On the server that will receive the workspace, open **Settings** and choose **Bring a Workspace
   Here**. It shows the server's address and a move code. The code works once, until the time shown.
   No server yet? In the desktop apps that can install one (the Mac app from casama.ai, Windows and
   Linux), choose **Install Casama Server** first. The Mac App Store, iOS, Android and web apps only
   take an address of a server that already runs.
2. On the workspace you're moving, open **Settings** and choose **Move to My Own Server**.
3. Enter the address and the move code, then choose **Check**.
4. Read the check screen as above, then choose **Start Move**.

The same check, pause and switch run, in the other direction. Then:

- The Casama Cloud workspace becomes read-only for 30 days, then follows the usual deletion grace.
  See [Privacy and security](/guide/privacy).

## Subscriptions

Plans stay where they are. A move never moves a payment.

- **Moving to Casama Cloud:** your bots run on the workspace's Cloud plan. If you paid for a business
  license for the old server, cancel it once you no longer need it. See
  [Licenses](/self-hosting/licenses).
- **Moving back to your own server:** your Casama Cloud plan keeps renewing. Choose **Manage Plan** on
  the final screen and cancel it once you're settled. If you want Casama's models on your server,
  keep it and turn on Casama Cloud models.
- **Plans bought in an app store** can't be cancelled by Casama. **Manage Plan** opens the store's
  subscription page.

## Related

- [Casama Cloud models, computers and credits](/self-hosting/casama-link-cloud)
- [What goes home](/self-hosting/what-goes-home#when-you-move-to-casama-cloud)
- [Licenses](/self-hosting/licenses)
- [Updates and rollback](/self-hosting/updates)
- [Operations](/self-hosting/operations)
