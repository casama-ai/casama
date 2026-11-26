## 0.2.0

- Built on `casama_api` 0.2.0: every new API area has a getter on `CasamaClient` (for example
  `account`, `casamaLink`, `packs`, `sites`, `domains`, `mail`, `widgets`, `support`, `webhooks`).
- `CasamaClient.connect` takes an optional `userAgent`, also sent on sign-in calls.
- New library `package:casama_sdk/casama_link.dart`: link a self-hosted server to Casama Cloud and
  turn on remote access.
- Run events and ChatGPT sign-in follow the current API.

## 0.1.0

- Billing (plans, entitlements, purchases, Casama Link keys): `client.billing`.
- Privacy (data export, account deletion, workspace retention): `client.privacy`.
- Generated client for the Phase 7 and 8 API additions.

## 0.6.0

- First published version: the Casama API through Phase 6 (bots, chat, runs, computers, live view, autonomy, voice, desktop companion, admin).
