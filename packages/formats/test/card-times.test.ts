/** Card times: ISO passes, what bots copy from mail and APIs is converted, words fail or drop. */
import { describe, expect, it } from "vitest";
import { checkComponents } from "../src/a2ui.ts";
import { isoTime } from "../src/live-cards.ts";

describe("isoTime", () => {
  it("keeps ISO forms as they are", () => {
    for (const s of [
      "2026-11-20",
      "2026-11-20T14:00",
      "2026-11-20 14:00",
      "2026-11-20T14:00:05.123Z",
      "2026-11-20T14:00:00+08:00",
    ])
      expect(isoTime(s)).toBe(s);
  });

  it("converts email dates, slashes and Unix times", () => {
    expect(isoTime("Thu, 20 Nov 2026 14:00:00 +0000")).toBe("2026-11-20T14:00:00.000Z");
    expect(isoTime("Thu, 20 Nov 2026 14:00:00 +0000 (UTC)")).toBe("2026-11-20T14:00:00.000Z");
    expect(isoTime(1795183200)).toBe("2026-11-20T14:00:00.000Z");
    expect(isoTime("1795183200000")).toBe("2026-11-20T14:00:00.000Z");
    expect(isoTime("2026/11/20 14:00")).toMatch(/^2026-11-2\dT/);
  });

  it("refuses words and bare clock times", () => {
    for (const v of ["yesterday", "2:30 PM", "1", "", 42, true, null])
      expect(isoTime(v)).toBeNull();
  });
});

describe("MessageList times (ui.show)", () => {
  const list = (time: unknown) => {
    const row: Record<string, unknown> = { id: "m1", from: "Sarah", subject: "Hi", time };
    checkComponents([{ id: "root", component: "MessageList", messages: [row] }], { fromBot: true });
    return row;
  };

  it("converts an email Date header instead of failing", () => {
    // Production: 'MessageList "ml", messages 1: time must be an ISO time like "2026-11-20T14:00".'
    expect(list("Thu, 20 Nov 2026 14:00:00 +0000").time).toBe("2026-11-20T14:00:00.000Z");
  });

  it("drops a time it can't read instead of refusing the list", () => {
    expect(list("Yesterday")).not.toHaveProperty("time");
  });

  it("still refuses an unreadable required time elsewhere", () => {
    expect(() =>
      checkComponents([{ id: "root", component: "Event", title: "x", start: "tomorrow" }], {
        fromBot: true,
      }),
    ).toThrow(/ISO time/);
  });
});
