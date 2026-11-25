import { beforeEach, describe, expect, it, vi } from "vitest";
import { pair, updateDevice } from "../src/background/act/device.ts";
import { dismissPairCard, PAIR_CARD_KEY, shouldOfferPairing } from "../src/lib/pair-card.ts";
import { installFakeChrome } from "./fake-chrome.ts";

const patches: Array<{ id: string; body: Record<string, unknown> }> = [];

vi.mock("../src/lib/session.ts", () => ({
  accessToken: async () => "token",
  clientFor: () => ({
    unwrap: async (p: Promise<unknown>) => p,
    POST: async () => ({ id: "dev-1", token: "tok" }),
    PATCH: async (_path: string, o: { params: { path: { id: string } }; body: never }) => {
      patches.push({ id: o.params.path.id, body: o.body });
      return {};
    },
  }),
}));
vi.mock("../src/background/act/runner.ts", () => ({
  abortInFlight: () => {},
  handleCall: async () => ({}),
  installRunner: () => {},
  setRunnerHost: () => {},
  stopAll: async () => {},
}));

const account = {
  id: "a1",
  server: "https://api.example.test",
  authUrl: "https://auth.example.test",
  anonKey: "anon",
  userId: "u1",
  email: "u1@example.test",
  refreshToken: "r",
  addedAt: "2026-11-25T00:00:00Z",
};

beforeEach(() => {
  patches.length = 0;
  installFakeChrome();
});

describe("pairing for all bots (D-549, A3)", () => {
  it("defaults to all_bots: true, with an empty list allowed", async () => {
    await pair(account, "org-1", []);
    expect(patches).toHaveLength(1);
    expect(patches[0]!.body).toMatchObject({ all_bots: true, allowed_bot_ids: [] });
  });

  it("keeps an explicit list with all_bots: false", async () => {
    await pair(account, "org-1", ["b1", "b2"], false);
    expect(patches[0]!.body).toMatchObject({ all_bots: false, allowed_bot_ids: ["b1", "b2"] });
  });

  it("unticking later PATCHes all_bots: false with the picked list", async () => {
    await pair(account, "org-1", []);
    await chrome.storage.local.set({ accounts: [account] });
    await updateDevice({ all_bots: false, allowed_bot_ids: ["b1"] });
    expect(patches[1]!.body).toEqual({ all_bots: false, allowed_bot_ids: ["b1"] });
    const stored = (await chrome.storage.local.get("actDevice")).actDevice as { allBots: boolean };
    expect(stored.allBots).toBe(false);
  });
});

describe("the pairing card after sign-in (D-549, A5)", () => {
  it("shows when unpaired, allowed and not dismissed", async () => {
    expect(await shouldOfferPairing()).toBe(true);
  });

  it("stays away once dismissed", async () => {
    await dismissPairCard();
    expect((await chrome.storage.local.get(PAIR_CARD_KEY))[PAIR_CARD_KEY]).toBe(true);
    expect(await shouldOfferPairing()).toBe(false);
  });

  it("stays away when this browser is already paired", async () => {
    await chrome.storage.local.set({ actDevice: { deviceId: "d" } });
    expect(await shouldOfferPairing()).toBe(false);
  });

  it("stays away when an administrator turned bots off here", async () => {
    (chrome.storage as unknown as { managed: unknown }).managed = {
      get: async () => ({ ActDisabled: true }),
    };
    expect(await shouldOfferPairing()).toBe(false);
  });
});
