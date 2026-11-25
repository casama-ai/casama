/**
 * Phase 3 Rich & Live Data Cards tests: renders real A2UI fixtures from packages/contracts/fixtures/
 * plus all 11 Casama core cards, live refresh, price watch, and Tier 2 generic structured fallback.
 */
import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { beforeAll, describe, expect, it, vi } from "vitest";
import { TIER1_CARDS } from "../src/lib/card-kit.ts";
import { renderSurface } from "../src/lib/cards.ts";

// Minimal DOM implementation for node environment so we can test actual DOM rendering without jsdom.
class FakeNode {
  childNodes: FakeNode[] = [];
  parentNode: FakeNode | null = null;
  textContent = "";
  get children(): FakeElement[] {
    return this.childNodes.filter((n): n is FakeElement => n instanceof FakeElement);
  }
  append(...nodes: (FakeNode | string)[]) {
    for (const n of nodes) {
      const node = typeof n === "string" ? new FakeText(n) : n;
      if (node instanceof FakeFragment) {
        this.append(...node.childNodes);
        continue;
      }
      node.parentNode = this;
      this.childNodes.push(node);
    }
  }
  replaceChildren(...nodes: (FakeNode | string)[]) {
    this.childNodes = [];
    this.append(...nodes);
  }
  replaceWith(other: FakeNode) {
    if (!this.parentNode) return;
    const i = this.parentNode.childNodes.indexOf(this);
    if (i >= 0) {
      other.parentNode = this.parentNode;
      this.parentNode.childNodes[i] = other;
    }
  }
  allText(): string {
    if (this instanceof FakeText) return this.textContent;
    const own = this.textContent;
    const kids = this.childNodes.map((c) => c.allText()).join(" ");
    return `${own} ${kids}`.trim();
  }
}

class FakeText extends FakeNode {
  constructor(text: string) {
    super();
    this.textContent = text;
  }
}

class FakeFragment extends FakeNode {
  querySelectorAll(_sel: string): FakeElement[] {
    return [];
  }
}

class FakeElement extends FakeNode {
  tagName: string;
  attrs = new Map<string, string>();
  listeners = new Map<string, Array<(e?: unknown) => void>>();
  dataset: Record<string, string> = {};
  className = "";
  disabled = false;
  checked = false;
  value = "";
  innerHTML = "";
  content = new FakeFragment();
  classList = {
    add: (c: string) => {
      if (!this.className.split(/\s+/).includes(c))
        this.className = `${this.className} ${c}`.trim();
    },
    remove: (c: string) => {
      this.className = this.className
        .split(/\s+/)
        .filter((x) => x !== c)
        .join(" ");
    },
    contains: (c: string) => this.className.split(/\s+/).includes(c),
  };
  constructor(tag: string) {
    super();
    this.tagName = tag.toUpperCase();
  }
  setAttribute(k: string, v: string) {
    this.attrs.set(k, v);
    if (k === "class") this.className = v;
    if (k.startsWith("data-")) this.dataset[k.slice(5)] = v;
  }
  getAttribute(k: string) {
    return this.attrs.get(k) ?? null;
  }
  addEventListener(type: string, fn: (e?: unknown) => void) {
    const arr = this.listeners.get(type) ?? [];
    arr.push(fn);
    this.listeners.set(type, arr);
  }
  async click() {
    for (const fn of this.listeners.get("click") ?? []) await fn();
  }
  querySelector(sel: string): FakeElement | null {
    return this.querySelectorAll(sel)[0] ?? null;
  }
  querySelectorAll(sel: string): FakeElement[] {
    const out: FakeElement[] = [];
    const match = (el: FakeElement) => {
      if (sel.startsWith("[data-testid=")) {
        const want = sel.slice(14, -2);
        return el.attrs.get("data-testid") === want;
      }
      if (sel.includes(",")) {
        return sel.split(",").some((s) => el.tagName === s.trim().toUpperCase());
      }
      return el.tagName === sel.toUpperCase();
    };
    const walk = (node: FakeNode) => {
      for (const c of node.childNodes) {
        if (c instanceof FakeElement) {
          if (match(c)) out.push(c);
          walk(c);
        }
      }
    };
    walk(this);
    return out;
  }
}

beforeAll(() => {
  const doc = {
    createElement: (tag: string) => {
      const el = new FakeElement(tag);
      if (tag === "template") {
        Object.defineProperty(el, "innerHTML", {
          set(v: string) {
            el.content = new FakeFragment();
            el.content.append(new FakeText(String(v).replace(/<[^>]+>/g, " ")));
          },
          get() {
            return "";
          },
        });
      }
      return el;
    },
    createElementNS: (_ns: string, tag: string) => new FakeElement(tag),
    createTextNode: (t: string) => new FakeText(t),
    createDocumentFragment: () => new FakeFragment(),
  };
  (globalThis as unknown as Record<string, unknown>).document = doc;
});

function loadFixtureCards(file: string): Array<Record<string, unknown>> {
  const full = resolve(import.meta.dirname, "../../../packages/contracts/fixtures", file);
  const raw = JSON.parse(readFileSync(full, "utf8")) as unknown;
  const arr = Array.isArray(raw)
    ? raw
    : ((raw as Record<string, unknown>).cards ??
      (raw as Record<string, unknown>).cases ??
      (raw as Record<string, unknown>).fixtures ??
      Object.values(raw as Record<string, unknown>));
  return (arr as Array<Record<string, unknown>>)
    .map((x) =>
      x && typeof x === "object" && "card" in x ? (x.card as Record<string, unknown>) : x,
    )
    .filter(
      (x): x is Record<string, unknown> =>
        !!x && typeof x === "object" && typeof x.component === "string",
    );
}

function surfaceFor(comp: Record<string, unknown>) {
  return [
    { version: "1.0", createSurface: { surfaceId: "s1", catalogId: "casama" } },
    {
      version: "1.0",
      updateComponents: {
        surfaceId: "s1",
        components: [{ ...comp, id: "root" }],
      },
    },
  ];
}

describe("Phase 3: Rich & Live Data Cards", () => {
  it("renders every real contract fixture card without falling back to the dead-end message", () => {
    const files = [
      "composed-cards.json",
      "fare-cards.json",
      "live-cards.json",
      "stays-products-cards.json",
    ];
    let total = 0;
    for (const f of files) {
      const cards = loadFixtureCards(f);
      expect(cards.length).toBeGreaterThan(0);
      for (const c of cards) {
        const el = renderSurface("s1", surfaceFor(c), {
          openUrl: "https://app.casama.ai/chat",
        }) as unknown as FakeElement;
        const txt = el.allText();
        expect(txt, `${f} -> ${c.component}`).not.toContain("This card opens in the Casama app.");
        expect(txt.length, `${f} -> ${c.component}`).toBeGreaterThan(0);
        total++;
      }
    }
    expect(total).toBeGreaterThan(40);
  });

  it("renders all 11 Casama core cards natively and fires interactive actions", async () => {
    const actions: Array<{ text: string; name: string; context: Record<string, unknown> }> = [];
    const onAction = async (
      text: string,
      a: { name: string; context: Record<string, unknown> },
    ) => {
      actions.push({ text, name: a.name, context: a.context });
    };

    const coreCards: Array<Record<string, unknown>> = [
      {
        component: "Map",
        center: { lat: 14.5995, lng: 120.9842 },
        markers: [{ lat: 14.5995, lng: 120.9842, label: "Manila" }],
      },
      {
        component: "MessageDraft",
        kind: "email",
        app: "gmail",
        to: ["a@b.com"],
        subject: "Hello",
        body: "World",
      },
      { component: "Event", title: "Standup", start: "2026-11-23T09:00:00Z", location: "Zoom" },
      {
        component: "Agenda",
        title: "Today",
        events: [{ title: "Sync", start: "2026-11-23T10:00:00Z" }],
      },
      {
        component: "MessageList",
        title: "Inbox",
        messages: [{ id: "m1", from: "Alice", subject: "Hi", preview: "Checking in" }],
      },
      {
        component: "Checklist",
        title: "Packing",
        items: [{ id: "i1", text: "Passport", done: true }],
      },
      {
        component: "Stats",
        title: "Sales",
        stats: [{ label: "Revenue", value: "$42k", change: "+12%", trend: "up" }],
        chart: { type: "bar", labels: ["M", "T", "W"], series: [{ values: [10, 20, 15] }] },
      },
      {
        component: "Results",
        title: "Coffee",
        items: [{ id: "r1", title: "Yardstick", rating: 4.8 }],
        choose: true,
      },
      {
        component: "PersonPicker",
        label: "Which Sarah?",
        people: [{ id: "p1", name: "Sarah Lee", detail: "s@x.com" }],
      },
      {
        component: "Schedule",
        kind: "routine",
        title: "Morning brief",
        when: "Daily at 8:00",
        ref: "r-1",
      },
      {
        component: "Details",
        title: "Receipt",
        rows: [{ label: "Total", value: "$19.00" }],
        footer: "Paid",
      },
    ];

    for (const c of coreCards) {
      expect(TIER1_CARDS.has(String(c.component))).toBe(true);
      const el = renderSurface("s1", surfaceFor(c), { onAction }) as unknown as FakeElement;
      expect(el.querySelector(`[data-testid="card-${c.component}"]`)).not.toBeNull();
    }

    // Trigger MessageDraft Send action
    const draftEl = renderSurface("s1", surfaceFor(coreCards[1]!), {
      onAction,
    }) as unknown as FakeElement;
    const sendBtn = draftEl.querySelector('[data-testid="draft-send"]');
    expect(sendBtn).not.toBeNull();
    await sendBtn!.click();
    expect(actions[0]?.name).toBe("draft.send");
    expect(actions[0]?.text).toBe("Send");
  });

  it("supports live refresh (↻) and Fares price-watch toggle", async () => {
    const onRefresh = vi.fn(async () => ({
      component: "Fares",
      from: { code: "MNL" },
      to: { code: "NRT" },
      cheapest: 5500,
      currency: "PHP",
      options: [{ airline: "ANA", price: 5500, stops: 0 }],
      live: { id: "lc-1", fetched_at: "2026-11-22T15:00:00Z", source: { name: "Google Flights" } },
    }));
    const onWatch = vi.fn(async () => true);

    const card = {
      component: "Fares",
      from: { code: "MNL" },
      to: { code: "NRT" },
      cheapest: 6692,
      currency: "PHP",
      options: [{ airline: "ANA", price: 6692, stops: 0 }],
      live: { id: "lc-1", fetched_at: "2026-11-22T14:00:00Z", source: { name: "Google Flights" } },
    };

    const el = renderSurface("s1", surfaceFor(card), {
      onRefreshLiveCard: onRefresh,
      onWatchLiveCard: onWatch,
    }) as unknown as FakeElement;

    const watchBtn = el.querySelector('[data-testid="rc-watch"]');
    expect(watchBtn).not.toBeNull();
    await watchBtn!.click();
    expect(onWatch).toHaveBeenCalledWith("lc-1", true);

    const refreshBtn = el.querySelector('[data-testid="rc-refresh"]');
    expect(refreshBtn).not.toBeNull();
    await refreshBtn!.click();
    expect(onRefresh).toHaveBeenCalledWith("lc-1");
    expect(el.allText()).toContain("5,500");
  });

  it("renders future/unknown plugin cards cleanly via Tier 2 generic structured fallback", () => {
    const futureCard = {
      component: "SolarPanelTelemetry",
      title: "Roof Array",
      subtitle: "Live generation",
      watts: 4200,
      batteryPct: 88,
      panels: [
        { name: "East", status: "OK" },
        { name: "West", status: "OK" },
      ],
    };
    const el = renderSurface("s1", surfaceFor(futureCard), {
      openUrl: "https://app.casama.ai/chat",
    }) as unknown as FakeElement;
    expect(el.querySelector('[data-testid="card-generic"]')).not.toBeNull();
    expect(el.allText()).toContain("Roof Array");
    expect(el.allText()).toContain("4200");
    expect(el.allText()).toContain("East");
  });
});
