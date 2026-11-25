import { describe, expect, it } from "vitest";
import { isCronSyntax } from "../src/cron.ts";
import { BOT_TEMPLATES } from "../src/templates.ts";

describe("templates", () => {
  it("ships starter personas with unique ids, real instructions and valid schedules", () => {
    expect(BOT_TEMPLATES.length).toBeGreaterThanOrEqual(20);
    expect(new Set(BOT_TEMPLATES.map((t) => t.id)).size).toBe(BOT_TEMPLATES.length);
    const mascots = [
      "winky",
      "sleepy",
      "starry",
      "lovey",
      "cool",
      "thinker",
      "giggly",
      "shy",
      "focused",
      "wow",
    ];
    for (const t of BOT_TEMPLATES) {
      expect(t.persona.length).toBeGreaterThan(200);
      expect(t.starters.length).toBeGreaterThanOrEqual(2);
      expect(mascots).toContain(t.mascot);
      for (const r of t.routines ?? []) expect(isCronSyntax(r.schedule_cron)).toBe(true);
    }
  });
});
