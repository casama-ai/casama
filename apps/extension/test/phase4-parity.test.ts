/**
 * Unit tests for Phase 4: Floating Screen Card, Bot Cursor (panel + Chrome Act overlay),
 * and Usage reset countdown.
 */
import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { afterEach, beforeAll, describe, expect, it, vi } from "vitest";
import { formatResetCountdown } from "../src/panel/more.ts";
import { BotCursorOverlay, isScreenTool } from "../src/panel/screen-card.ts";

class MiniNode {
  childNodes: MiniNode[] = [];
  textContent = "";
  append(...nodes: (MiniNode | string)[]) {
    for (const n of nodes) {
      this.childNodes.push(
        typeof n === "string" ? Object.assign(new MiniNode(), { textContent: n }) : n,
      );
    }
  }
}

class MiniEl extends MiniNode {
  tagName: string;
  className = "";
  hidden = false;
  offsetWidth = 10;
  style: Record<string, string> = {};
  attrs = new Map<string, string>();
  classList = {
    add: (...cs: string[]) => {
      const set = new Set(this.className.split(/\s+/).filter(Boolean));
      for (const c of cs) set.add(c);
      this.className = [...set].join(" ");
    },
    remove: (...cs: string[]) => {
      const set = new Set(this.className.split(/\s+/).filter(Boolean));
      for (const c of cs) set.delete(c);
      this.className = [...set].join(" ");
    },
    contains: (c: string) => this.className.split(/\s+/).includes(c),
  };
  constructor(tag: string) {
    super();
    this.tagName = tag.toUpperCase();
  }
  setAttribute(k: string, v: string) {
    this.attrs.set(k, v);
  }
  querySelector(sel: string): MiniEl | null {
    const cls = sel.startsWith(".") ? sel.slice(1) : "";
    for (const c of this.childNodes) {
      if (c instanceof MiniEl) {
        if (cls && c.classList.contains(cls)) return c;
        const found = c.querySelector(sel);
        if (found) return found;
      }
    }
    return null;
  }
}

beforeAll(() => {
  (globalThis as Record<string, unknown>).document = {
    createElement: (tag: string) => new MiniEl(tag),
    createTextNode: (t: string) => Object.assign(new MiniNode(), { textContent: t }),
  };
});

afterEach(() => {
  vi.useRealTimers();
});

describe("Phase 4: Screen Card & Bot Cursor", () => {
  it("detects screen-using tool names", () => {
    expect(isScreenTool("browser.click")).toBe(true);
    expect(isScreenTool("browser__open_url")).toBe(true);
    expect(isScreenTool("desktop.screenshot")).toBe(true);
    expect(isScreenTool("screen_tap")).toBe(true);
    expect(isScreenTool("computer-type")).toBe(true);
    expect(isScreenTool("web_search")).toBe(false);
    expect(isScreenTool("gmail_list")).toBe(false);
  });

  it("positions BotCursorOverlay, toggles typing dots, triggers click ripple, and auto-hides", () => {
    vi.useFakeTimers();
    const overlay = new BotCursorOverlay();
    const layer = overlay.el as unknown as MiniEl;
    const pointer = layer.querySelector(".bot-cursor") as MiniEl;
    const dots = layer.querySelector(".bot-cursor-dots") as MiniEl;
    const ripple = layer.querySelector(".bot-cursor-ripple") as MiniEl;

    expect(pointer.hidden).toBe(true);

    overlay.move({ computer_id: "c1", action: "click", x: 640, y: 400, width: 1280, height: 800 });
    expect(pointer.hidden).toBe(false);
    expect(pointer.style.left).toBe("50.00%");
    expect(pointer.style.top).toBe("50.00%");
    expect(dots.hidden).toBe(true);
    expect(ripple.hidden).toBe(false);
    expect(ripple.classList.contains("pop")).toBe(true);

    overlay.move({ computer_id: "c1", action: "type", x: 1500, y: -20, width: 1000, height: 800 });
    expect(pointer.style.left).toBe("100.00%");
    expect(pointer.style.top).toBe("0.00%");
    expect(dots.hidden).toBe(false);

    vi.advanceTimersByTime(3100);
    expect(pointer.hidden).toBe(true);
    expect(ripple.hidden).toBe(true);
    overlay.destroy();
  });

  it("includes Bot Cursor animations and prefers-reduced-motion in Chrome Act overlay", () => {
    const src = readFileSync(resolve(__dirname, "../src/background/act/overlay.ts"), "utf8");
    expect(src).toContain("window.__casamaOverlay");
    expect(src).toContain("prefers-reduced-motion:reduce");
    expect(src).toContain("moveOverlayCursor");
    expect(src).toContain(".cur");
    expect(src).toContain(".rip");
  });
});

describe("Phase 4: Usage reset countdown", () => {
  it("formats upcoming reset times cleanly", () => {
    vi.useFakeTimers();
    vi.setSystemTime(new Date("2026-11-22T12:00:00Z"));
    expect(formatResetCountdown("2026-11-22T12:35:00Z")).toBe("in 35m");
    expect(formatResetCountdown("2026-11-22T14:00:00Z")).toBe("in 2h");
    expect(formatResetCountdown("2026-11-22T14:25:00Z")).toBe("in 2h 25m");
    expect(formatResetCountdown("2026-11-22T11:00:00Z")).toBe("soon");
    expect(formatResetCountdown("not-a-date")).toBe("soon");
  });
});
