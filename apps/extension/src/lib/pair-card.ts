/**
 * The "Let bots use this browser" card after sign-in (D-549, A5). It shows while
 * this browser isn't paired, an administrator hasn't turned bots off here, and the person hasn't
 * dismissed it with "Not now". Pairing stays an explicit button press (the card, or More → Your browser).
 */

import { getManaged } from "./act/managed.ts";
import { FEATURES } from "./browser.ts";

export const PAIR_CARD_KEY = "pairCardDismissed";

/** Whether to show the card now. */
export async function shouldOfferPairing(): Promise<boolean> {
  if (!FEATURES.act) return false;
  const got = await chrome.storage.local.get([PAIR_CARD_KEY, "actDevice"]);
  if (got[PAIR_CARD_KEY] || got.actDevice) return false;
  return !(await getManaged()).ActDisabled;
}

/** "Not now" dismisses it for good; pairing removes it by itself. */
export async function dismissPairCard(): Promise<void> {
  await chrome.storage.local.set({ [PAIR_CARD_KEY]: true });
}
