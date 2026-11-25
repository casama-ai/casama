# The in-app browser on Windows: what the release needs

For the Windows release that turns on the in-app browser (docs/WINDOWS-BROWSER-PLAN.md, D-547,
D-548, W3). The Store package already carries it compiled in (`0.1.98.0`, Submission 1); it stays
dormant until `windows` joins the server stage, which is a production change that needs Oliver's
yes. Nothing here is submitted, deployed or switched on without that yes.

The Microsoft Store has no rule against WebView2, but its policy 10.1 ("Distinct function and value;
accurate representation") wants the listing to describe what the app does. So the listing,
certification notes, privacy page and guide describe the browser in the same release that turns it
on, as on the other stores.

## Checklist (in this order)

- [ ] The live chat run passed against a stack with this build (plan §7.1, "Live chat run").
- [ ] Windows package built with the switch on: `CASAMA_APP_BROWSER=1` (or
      `scripts/app-browser-switch.sh on`), so `scripts/package-windows.ps1` adds
      `--dart-define=CASAMA_APP_BROWSER=true`. Store build: `CASAMA_MSSTORE=1` plus the
      `MSSTORE_*` identity (docs/STORES.md, "Microsoft Store"). Release build: ask Oliver first.
- [ ] Notes for certification below pasted into Partner Center (Submission → Submission options).
- [ ] Description gets the feature line below; "What's new in this version" gets the line below.
- [ ] Privacy page: `site/privacy.html` section "A browser your bots can use…" gets Windows from
      the privacy text below (Oliver reads it and sets the date; legal text), deployed with the web.
- [ ] Guide: `docs-site/guide/in-app-browser.md` replaces its "Windows: use Casama for Chrome" line
      with the guide text below, deployed with the web.
- [ ] Server stage: `systems` gets `windows` (Admin → In-app browser, or `PUT /v1/admin/app-browser`).
      Production change: Oliver's yes. Start with `stage: "testers"` if the other systems allow it.
- [ ] `docs/STORES.md` Microsoft Store row updated as the Store answers.

## Notes for certification (paste, then fill in the account)

> **An in-app browser your bot can use on your PC while you watch.**
>
> Casama bots browse the web on their own cloud computer. This version can also use a browser area
> inside the Casama window on Windows, built on the Microsoft Edge WebView2 runtime that ships with
> Windows (version 120 or newer). It shows other websites only, never Casama's own screens. It pairs
> automatically after sign-in and can be configured or switched off in Settings → Device
> Connections → Browser on This PC.
>
> **How to try it (about one minute):**
> 1. Sign in with the review account below.
> 2. Open the chat with "Shopper" and send: "Open example.com on my PC and tell me the heading."
> 3. A card in the chat shows the page; click it for the full view with Stop and Take Over.
> 4. When a site needs a sign-in or blocks the bot's computer, a card lets you pick "On this PC",
>    "In your Chrome" (if Casama for Chrome is connected) or "On Shopper's computer".
>
> **Safety:**
> - Works only while the Casama window is open; minimizing or closing the window, or quitting,
>   stops it.
> - Clicking or typing on the page pauses the bot. Risky steps (send, post, delete, share, sign in)
>   ask first; purchases and password changes are handed to the user; password, card and code fields
>   are never read.
> - Its own WebView2 profile in `%LOCALAPPDATA%\Casama\app-browser`, apart from Edge; signing out
>   deletes it. Camera, microphone and location requests from pages are denied.
> - The page script ships inside the app and runs in an isolated world the page can't reach.
>
> Review account: (email and password from the vault item "App review account")

## What's new (under 170 characters)

Your bot can now browse right inside Casama on your PC while you watch. Choose where to open a site,
approve risky steps, and take over anytime.

## A line for the description's feature list

- **A browser your bot can use inside Casama.** Watch bots work on a page right inside Casama on
  your PC, pick whether a site opens on your PC or the bot's computer, approve risky steps, type
  your own passwords, and take over at any time.

## Not to claim

- Don't say it uses Edge or Chrome sign-ins: it keeps its own profile inside Casama.
- It needs the WebView2 runtime 120 or newer (built into Windows 11 and current Windows 10). Without
  it Casama runs without the built-in browser and Settings links to Microsoft's installer.
- x64 only today; don't claim Arm64.

## Privacy page text (the changed sentences)

- Heading: "A browser your bots can use on your phone or computer".
- First sentence: "On iPhone, iPad, Android, Mac (macOS 14 and later), Linux (with WebKitGTK 4.1,
  2.40 or newer) and Windows (with the Microsoft Edge WebView2 runtime 120 or newer), Casama
  includes a small browser inside the app … (Settings → Device Connections → Browser on This Phone,
  Browser on This Mac, Browser on This Computer, or Browser on This PC)."
- Controls: "On a Mac, Linux or Windows computer, it works only while the Casama window is open."
  and "Signing out unpairs your device automatically (and clears its Linux or Windows browser
  folders)."

## Guide text (replaces the Windows line in `docs-site/guide/in-app-browser.md`)

- **Windows:** works while the Casama window is open, even if it's behind another app; minimizing
  or closing the window, or quitting, stops it. It uses the **Microsoft Edge WebView2
  runtime (120 or newer)**, which comes with Windows 11; without it Casama starts normally and
  Settings → Device Connections links to Microsoft's installer. The card in the chat shows live
  pictures of the page; the full view shows the live page with the bot's cursor.
