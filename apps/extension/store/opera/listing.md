# Opera Add-ons listing: Casama

Everything `addons.opera.com` asks for, ready to paste (`docs/SAFARI-AND-OPERA-EXTENSIONS-PLAN.md`, Track A). Opera runs the Chromium MV3 extension (`apps/extension/dist/casama-opera-<version>.zip`, built unminified via `scripts/build-extension.sh opera` to satisfy Opera's strict no-minification/obfuscation review policy). Inside Opera, the extension identifies itself as **Casama for Opera** and points shortcut settings to `opera://extensions/shortcuts`.

## Package

- Build: `CASAMA_OFFICIAL_BUILD=1 scripts/build-extension.sh opera` → `apps/extension/dist/casama-opera-<version>.zip` (unminified Chromium MV3, zero source maps, same manifest and permissions as Chrome Web Store).
- Source repository (for Opera reviewers): https://github.com/casama-ai/casama (AGPL-3.0; extension source in `apps/extension/`).
- Once Opera assigns the extension's 32-character ID, add it to `CHROME_EXTENSION_IDS` (`apps/server/src/env.ts` + production `.env`), `client/lib/core/chrome_extension.dart` (`chromeExtensionIds`), and `apps/extension/test/ids.test.ts`.

## Store metadata

| Field | Value |
|---|---|
| Name | Casama (never "Opera Casama" — Opera branding policy) |
| Category | Productivity |
| Summary (short description) | Connect your Opera browser to your Casama AI bots to ask about any page, save to your Library, and handle approvals without leaving your tab. |
| Privacy policy URL | https://casama.ai/privacy#chrome |
| Website | https://casama.ai |
| Support email | support@casama.ai |
| Screenshots (1280×800) | `store/screenshot-1-chat.png` … `store/screenshot-5-settings.png` |
| Icon | `public/icons/icon-128.png` |

### Description

```text
Casama connects your browser to your Casama AI bots.

ASK ABOUT ANY PAGE
Open the Casama side panel and ask any of your bots about the tab you are viewing. The page address and selected text are included only when you send a message; toggle full page text, PDF text, YouTube captions, or a screenshot whenever you need them. Every message shows exactly what context was sent.

SAVE WHAT MATTERS
Save any page to your Casama Library as Markdown, a PDF, or a screenshot, add it to a bot's knowledge, or create a task from it. Offline saves sync automatically when you reconnect.

LET BOTS WORK IN YOUR BROWSER
Optional browser actions let a bot you authorize open pages and carry out steps in its own collapsed tab group, with clear per-site permissions and instant stop controls.

STAY IN THE LOOP
Review approvals, answer bot questions, and manage active runs right from the Inbox tab and toolbar badge.

PRIVATE BY DESIGN
Casama reads a page only when you explicitly ask, never in the background. It never reads Casama's own pages or pages with password or payment fields, and you can add your own sites to a never-list.

Requires a Casama account (free to start at https://casama.ai).
```

## Notes for reviewers

```text
Casama needs a Casama account. Please use this test account on Casama Cloud:

  Email: review@casama.ai
  Password: <from Vaultwarden "Casama · store review account (review@casama.ai)">

Source code: This package is unminified and built directly from our public AGPL-3.0 repository at https://github.com/casama-ai/casama (directory: apps/extension, command: scripts/build-extension.sh opera).

Steps to test:
1. After installing, Settings opens in a tab. Click "Agree and continue", choose "On all sites", and click Continue.
2. In another tab, sign in at https://app.casama.ai with the account above (Continue with Email -> Use a Password Instead). Open Settings -> Sign In on Another Device, copy the sign-in link, and paste it under "Paste a sign-in link" in the extension's Settings.
3. Open any article, highlight a sentence, and click the Casama toolbar icon to open the side panel. Ask Anna a question and press Enter to see the streamed reply.
4. Open the Library tab and click "Markdown" to save the current page.

Pages are read only on explicit user action, never on password/card fields or Casama's own pages. No remote code is loaded or executed.
```
