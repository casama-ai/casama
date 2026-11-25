/**
 * Unit tests for Phase 2 Chat parity features (docs/EXTENSION-PARITY-AND-FIXES-PLAN.md §5 Phase 2).
 */
import { describe, expect, it } from "vitest";
import {
  computerPlacesOf,
  extractOfferedServer,
  formatDuration,
  formatReplyUsage,
  friendlyToolName,
} from "../src/panel/chat-widgets.ts";

describe("Phase 2: Chat parity helpers", () => {
  it("formats wire tool names cleanly", () => {
    expect(friendlyToolName("browser__open_url")).toBe("browser · open url");
    expect(friendlyToolName("web_search")).toBe("web search");
  });

  it("extracts OfferedServer info from app:route context (D-473)", () => {
    expect(
      extractOfferedServer({ server: { name: "Linear", url: "https://mcp.linear.app/sse" } }),
    ).toEqual({
      name: "Linear",
      url: "https://mcp.linear.app/sse",
      command: undefined,
    });
    expect(extractOfferedServer({ server_url: "https://mcp.notion.com/mcp" })).toEqual({
      name: "mcp.notion.com",
      url: "https://mcp.notion.com/mcp",
      command: undefined,
    });
    expect(extractOfferedServer({ name: "Git", command: "npx" })).toEqual({
      name: "Git",
      url: undefined,
      command: "npx",
    });
    expect(extractOfferedServer({ path: "/settings/billing" })).toBeNull();
  });

  it("formats call durations and reply usage lines", () => {
    expect(formatDuration(0)).toBe("0s");
    expect(formatDuration(45)).toBe("45s");
    expect(formatDuration(135)).toBe("2m 15s");
    expect(formatReplyUsage({ tokens_in: 1200, tokens_out: 300, cost_usd: 0.024 })).toBe(
      "1,500 tokens · $0.024",
    );
    expect(formatReplyUsage({ tokens_in: 50, tokens_out: 20, cost_usd: 0.002 })).toBe(
      "70 tokens · <$0.01",
    );
    expect(formatReplyUsage({ tokens_in: 0, tokens_out: 0, cost_usd: 0 })).toBe("");
  });

  it("builds computer place choices scoped to the active bot (D-483)", () => {
    const comps = [
      { id: "c1", name: "Bot A box", kind: "private", owner_bot_id: "bot-a" },
      { id: "c2", name: "Bot B box", kind: "private", owner_bot_id: "bot-b" },
      { id: "c3", name: "Oliver's MacBook Pro", kind: "local", owner_bot_id: null },
      { id: "c4", name: "Team runner", kind: "team", owner_bot_id: null },
    ] as never[];
    const places = computerPlacesOf(comps, "bot-a");
    expect(places.map((p) => p.label)).toEqual([
      "Auto place",
      "Bot A box",
      "Oliver's MacBook Pro (yours)",
      "Team runner",
    ]);
  });
});
