# The in-app browser (phones and Mac): what a store release needs

For the first update after 1.0 that carries the in-app browser on iPhone, iPad, Android and Mac
(docs/IN-APP-BROWSER-PLAN.md, D-476, D-508). Until 1.0 is approved and this release goes out,
public 1.0 store builds don't contain it (`scripts/app-browser-switch.sh off`). Nothing here is
submitted without Oliver's yes.

Windows (docs/WINDOWS-BROWSER-PLAN.md, D-547) has its own checklist, Microsoft Store certification
notes and text in [`windows.md`](windows.md).

Apple (2.3.1 / 2.5.19) and Google Play ("Deceptive Behavior") forbid hidden features switched on
later. So the release that carries it describes it up front: to reviewers, in the listing, in the
privacy answers, in the onboarding consent (v2, naming web pages), and on the privacy page.

## Checklist

- [ ] Build switch on for all five parts (`scripts/app-browser-switch.sh status` says `on` for ios,
      macos, android, linux; build includes `--dart-define=CASAMA_APP_BROWSER=true`).
- [ ] Server stage is `on` for `ios`, `android`, `macos` (and `linux` once Phase L1 live check passes),
      with `reasons.asked = true` and `reasons.blocked = true`.
- [ ] Review notes below pasted into App Store Connect (iOS and macOS "Notes for Review") and Play
      Console ("App access" instructions).
- [ ] Review account has a bot ready so a reviewer can test the browser and choice card in one minute.
- [ ] App Store "App Privacy" (shared by iPhone and Mac): **Browsing History** added (linked,
      App Functionality, not used for tracking). Both `client/ios/Runner/PrivacyInfo.xcprivacy` and
      `client/macos/Runner/PrivacyInfo.xcprivacy` carry `NSPrivacyCollectedDataTypeBrowsingHistory`.
- [ ] Play "Data safety": **Web browsing history** collected, not shared, for App functionality;
      encrypted in transit; deletion available.
- [ ] `site/privacy.html` updated from `privacy-section.md` with Oliver's date and deployed.
- [ ] Listing "What's new" and description updated from `listing.md`.
- [ ] `docs-site/guide/in-app-browser.md` deployed with the web deploy.
- [ ] `docs/STORES.md` updated as each store answers.

## Review notes — iOS & Android (paste, then fill in the account)

> **New in this version: an in-app browser your bot can use while you watch.**
>
> Casama bots already browse the web on their own cloud computer. This version adds a small browser
> inside the app (WKWebView on iOS, Android System WebView on Android) that a bot can use on the
> device while you watch. It pairs automatically after sign-in and is controlled in Settings → Device
> Connections → Browser on This Phone.
>
> **Consent:** The onboarding screen ("Your chats go to AI companies") discloses that web pages bots
> open for you are sent to our server and the AI model so the bot can act, and existing users confirm
> the updated disclosure once. The browser choice card also states this inline.
>
> **How to try it (about one minute):**
> 1. Sign in with the review account below and accept the AI consent screen.
> 2. Open the chat with "Shopper" and send: "Open example.com on my phone and tell me the heading."
> 3. A live card appears in the chat. Tap it to open the full browser with Stop and Take Over.
> 4. When a site requires sign-in or blocks the bot's computer, a choice card appears offering
>    "On this phone" or "On Shopper's computer" (plus Chrome if connected), with "Remember for this site".
>
> **Safety:**
> - Works only while that chat is open on screen. Leaving the chat or app stops it immediately.
> - Touching the page pauses the bot. Steps that send, post, delete, share or sign in ask first.
> - Purchases and password changes are handed to the user. Password, card and code fields are never read.
> - Banking, health, password manager and government ID sites are off by default.
> - Sign-ins and cookies stay in a separate device-only store; never uploaded. Page script ships in the app.
>
> Review account: (email and password from the vault item "App review account")

## Review notes — Mac App Store (paste, then fill in the account)

> **New in this version: an in-app browser your bot can use on your Mac while you watch.**
>
> This version adds a native WKWebView browser inside the Mac app (macOS 14 and later, sandboxed —
> runs entirely inside the app with no external process). It pairs automatically at sign-in and can
> be configured or switched off in Settings → Device Connections → Browser on This Mac.
>
> **How to try it (about one minute):**
> 1. Sign in with the review account below and accept the AI consent screen.
> 2. Open the chat with "Shopper" and send: "Open example.com on my Mac and tell me the heading."
> 3. A live card appears in the chat; click it for the full browser with Stop and Take Over.
> 4. When a site requires sign-in or blocks the bot's computer, a choice card lets you pick "On this
>    Mac", "In your Chrome" (if connected), or "On Shopper's computer".
>
> **Safety:**
> - Works only while the Casama Mac window is open; closing the window or quitting stops it.
> - Clicking or typing on the page pauses the bot. Risky steps ask first; purchases and password
>   changes are handed to the user; password/card/code fields are never read.
> - Separate `WKWebsiteDataStore` on macOS 14+ (disabled on macOS 13.x). Page script ships inside the app.
>
> Review account: (email and password from the vault item "App review account")
