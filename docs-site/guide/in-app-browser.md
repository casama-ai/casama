# A browser your bots can use on your phone, Mac or Linux computer

Your bots already browse on their own computer. On iPhone, iPad, Android, Mac (macOS 14 and later)
and Linux (with WebKitGTK 4.1, 2.40 or newer), they can also use a small browser right inside
Casama while you watch.

## When it's used

For ordinary research and background routines, bots keep using their own computer so they can work
while you do other things. Casama uses or offers your device's browser when it helps:

- **You ask for it.** Say "open booking.com on my phone", "on my Mac", "on my computer", or "here".
- **A site needs your sign-in or blocks the bot's computer.** Casama shows a **Browser Choice** card
  right in the chat: **On this phone / On this Mac / On this computer**, **In your Chrome** (if
  Casama for Chrome is online), or **On your bot's computer**, with **Remember for this site**. Even
  when a site uses a block page Casama didn't recognize automatically, the bot offers this card so
  you decide.
- **A site you remembered for this device.** Once you pick "Remember for this site" (or add a site
  in Settings), your bots open it there directly without asking.
- **You chose "Always this device".** Then every page a bot opens in a chat you have open goes to
  this browser, so you watch everything it does. Its own computer is used only when you ask for it,
  for things this browser can't do, or when you aren't in the chat (routines keep running there).

## The browser button

A **globe button** sits in the top bar of a bot's chat, next to the call button, wherever this
device's browser is ready. Tap it to open the browser: the page a bot is using, or else your own
browsing with an address field. Long-press it (right-click on a computer) for **Bots browse here**,
the same switch as **Always this device** in Settings. The button is tinted while it's on.

If you have the same chat open on more than one device (for example your phone and your Mac or Linux
computer), Casama opens the in-app browser on the device you sent your last message from.

## Setup and settings

There is no manual pairing step: once you sign in on a supported phone, Mac or Linux computer, it is
ready for all your bots. You can adjust it any time in **Settings → Device Connections → Browser on
This Phone** (or **Browser on This Mac** / **Browser on This Computer**):

- **When a bot needs a browser:** **Always this device**, **Ask when it helps** (default),
  **Always the bot's computer**, or **Prefer this device** (sign-ins and blocked sites only).
- **Bots that may use it:** **All your bots** (default), or turn that off to pick individual bots.
- **Sites:** view and remove remembered sites (**Always**, **Bot's computer (don't ask)**, or
  **Never**).
- **Sign in to a site:** open a site yourself, sign in, and tap **Let My Bots Use This Site**.
  Nothing you browse yourself is sent anywhere.
- **Clear Browsing Data:** signs this browser out of every site.

## While a bot works there

- On phones and narrow windows, a small card in the chat shows the page; tap it for the full view.
  On wide screens (tablets, Mac and Linux), the browser opens in the side panel beside the chat with
  icon buttons for **Take Over**, **Hand Back** and **Stop**.
- While a bot is driving the page, a glowing frame in your brand color wraps the page and the bot's
  cursor shows where it clicks and types. When the bot pauses to ask or hand over, the frame turns a
  steady amber. (With Reduce Motion on, the frame stays steady.)
- **Touch or click the page and the bot pauses.** Tap **Hand Back** when you're done.
- Before a step that sends, posts, deletes, shares or signs in, the bot asks.
- **Signing in:** when a site asks for a login, the bot shows a sign-in card with **Sign In on
  Page** (you take over and type it yourself) or **Share Login** (saved in the vault for that bot
  and site so Casama fills it in on that site's host only; the bot never sees the password). Google,
  Apple, Microsoft and PayPal always ask you to sign in on the page yourself.
- Purchases and password changes are yours to finish: the bot stops and tells you what's left.
- You type card numbers and one-time codes yourself; a bot never sees passwords, card numbers or
  codes.
- **Stop** ends it at once.

## Good to know

- **Phones:** works while that chat is open on screen, and keeps your phone's screen awake while the
  bot works. If your connection drops briefly or you switch away for a moment, Casama waits up to
  30 seconds for the device to come back before stopping.
- **Mac and Linux:** works while the Casama window is open, even if it's behind another app.
  Closing or minimizing the window, or quitting, stops it. Mac requires **macOS 14 or later**; Linux
  uses the computer's **WebKitGTK 4.1 (2.40 or newer)** and starts normally without it (Settings →
  Device Connections shows the install command for your distro if it isn't installed). On Linux X11
  the live page shows inline with a native cursor; on Wayland the view shows live screenshots and
  opens a separate window when you take over or sign in.
- **Windows:** use [Casama for Chrome](/guide/chrome) for your own signed-in browser.
- Sign-ins stay in Casama's own cookie store on your device; Safari and Chrome sign-ins aren't
  shared.
- Banking, health, password manager and government ID sites stay off unless you switch a kind on,
  and then every visit asks.
- Signing out unpairs your device automatically. Workspace admins can switch the feature off in
  **Workspace settings → Privacy**.

## Related

- [Computers](/guide/computers)
- [Your own computer](/guide/companion)
- [Casama for Chrome](/guide/chrome)
- [Privacy and security](/guide/privacy)
