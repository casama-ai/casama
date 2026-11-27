import { describe, expect, it } from "vitest";
import { arbAdapter } from "../src/adapters/arb.ts";
import { jsonAdapter } from "../src/adapters/json.ts";
import { textAdapter } from "../src/adapters/text.ts";
import type { TargetContext } from "../src/types.ts";

const ctx = (options: Record<string, unknown> = {}, mappedLocale = "de"): TargetContext => ({
  options,
  sourceLocale: "en",
  path: "x",
  locale: mappedLocale,
  mappedLocale,
});

const ARB = `{
  "@@locale": "en",
  "appTitle": "Casama",
  "cancel": "Cancel",
  "@cancel": {"description": "Button that closes a sheet."},
  "files": "{n, plural, =1{1 file} other{{n} files}}",
  "@files": {"placeholders": {"n": {"type": "int", "example": "3"}}},
  "hello": "Hello {name}",
  "@hello": {"placeholders": {"name": {"type": "String"}}, "x-maxLength": 20}
}
`;

describe("arb", () => {
  it("reads messages with their metadata", () => {
    const units = arbAdapter.read(ARB, ctx());
    expect(units.map((u) => u.key)).toEqual(["appTitle", "cancel", "files", "hello"]);
    expect(units[1]?.description).toBe("Button that closes a sheet.");
    expect(units[2]?.placeholders).toEqual({ n: { type: "int", example: "3" } });
    expect(units[3]?.maxLength).toBe(20);
    expect(units.every((u) => u.kind === "icu")).toBe(true);
  });

  it("writes translated keys in source order with gen-l10n's locale", () => {
    const t = new Map([
      ["hello", "Hallo {name}"],
      ["cancel", "Abbrechen"],
    ]);
    const out = arbAdapter.write(
      { source: ARB, previous: null, translations: t },
      ctx({}, "pt-BR"),
    );
    expect(out).toBe(
      `{\n  "@@locale": "pt_BR",\n  "cancel": "Abbrechen",\n  "hello": "Hallo {name}"\n}\n`,
    );
    const back = arbAdapter.readTarget(out, ctx());
    expect(back).toEqual({ kind: "keys", values: t });
    // Writing what was read gives the same file back.
    expect(
      arbAdapter.write(
        {
          source: ARB,
          previous: out,
          translations: back.kind === "keys" ? back.values : new Map(),
        },
        ctx({}, "pt-BR"),
      ),
    ).toBe(out);
  });

  it("refuses a broken file", () => {
    expect(() => arbAdapter.read("{", ctx())).toThrow(/not valid JSON/);
    expect(() => arbAdapter.read('{"a": 1}', ctx())).toThrow(/must be a string/);
  });
});

const CATALOG = JSON.stringify(
  { push: { reply: { title: "{bot} replied" }, done: "Done" }, steps: ["One", "Two"], count: 3 },
  null,
  2,
);

describe("json catalog", () => {
  it("reads string leaves as dotted keys", () => {
    const units = jsonAdapter.read(CATALOG, ctx({ messageFormat: "icu" }));
    expect(units.map((u) => [u.key, u.text, u.kind])).toEqual([
      ["push.reply.title", "{bot} replied", "icu"],
      ["push.done", "Done", "icu"],
      ["steps.0", "One", "icu"],
      ["steps.1", "Two", "icu"],
    ]);
  });

  it("writes the source's shape with only translated strings, lists only when complete", () => {
    const out = jsonAdapter.write(
      {
        source: CATALOG,
        previous: null,
        translations: new Map([
          ["push.reply.title", "{bot} hat geantwortet"],
          ["steps.0", "Eins"],
        ]),
      },
      ctx(),
    );
    expect(JSON.parse(out)).toEqual({ push: { reply: { title: "{bot} hat geantwortet" } } });
    const full = jsonAdapter.write(
      {
        source: CATALOG,
        previous: null,
        translations: new Map([
          ["steps.0", "Eins"],
          ["steps.1", "Zwei"],
        ]),
      },
      ctx(),
    );
    expect(JSON.parse(full)).toEqual({ steps: ["Eins", "Zwei"] });
    const back = jsonAdapter.readTarget(full, ctx());
    expect(back.kind === "keys" && [...back.values]).toEqual([
      ["steps.0", "Eins"],
      ["steps.1", "Zwei"],
    ]);
  });
});

const GALLERY = JSON.stringify({
  schema: 1,
  items: [
    {
      id: "amplitude",
      name: "Amplitude",
      description: "Ask about your analytics.",
      examples: ["Signups last week?"],
      document: { capabilities: ["Query charts"], url: "https://x" },
      size: 1,
    },
    { id: "notion", name: "Notion", description: "Search your notes." },
  ],
});

describe("json items (gallery overlays)", () => {
  const options = {
    items: {
      path: "items",
      id: "id",
      fields: ["name", "description", "examples", "document.capabilities"],
    },
  };
  it("reads the listed fields per item", () => {
    expect(jsonAdapter.read(GALLERY, ctx(options)).map((u) => u.key)).toEqual([
      "amplitude.name",
      "amplitude.description",
      "amplitude.examples.0",
      "amplitude.document.capabilities.0",
      "notion.name",
      "notion.description",
    ]);
  });
  it("writes an overlay keyed by id", () => {
    const t = new Map([
      ["amplitude.description", "Frag nach deinen Analysen."],
      ["amplitude.document.capabilities.0", "Diagramme abfragen"],
      ["notion.description", "Durchsuche deine Notizen."],
    ]);
    const out = jsonAdapter.write(
      { source: GALLERY, previous: null, translations: t },
      ctx(options),
    );
    expect(JSON.parse(out)).toEqual({
      amplitude: {
        description: "Frag nach deinen Analysen.",
        document: { capabilities: ["Diagramme abfragen"] },
      },
      notion: { description: "Durchsuche deine Notizen." },
    });
    const back = jsonAdapter.readTarget(out, ctx(options));
    expect(back.kind === "keys" && Object.fromEntries(back.values)).toEqual(Object.fromEntries(t));
  });
  it("needs fields", () => {
    expect(() => jsonAdapter.read(GALLERY, ctx({ items: { fields: [] } }))).toThrow(/fields/);
  });
});

describe("text", () => {
  it("treats the whole file as one string and keeps its final newline", () => {
    const units = textAdapter.read("Casama: AI bots\n", ctx({ maxLength: 30 }));
    expect(units).toEqual([{ key: "", text: "Casama: AI bots", kind: "plain", maxLength: 30 }]);
    const out = textAdapter.write(
      {
        source: "Casama: AI bots\n",
        previous: null,
        translations: new Map([["", "Casama: KI-Bots"]]),
      },
      ctx(),
    );
    expect(out).toBe("Casama: KI-Bots\n");
    expect(textAdapter.readTarget(out, ctx())).toEqual({
      kind: "keys",
      values: new Map([["", "Casama: KI-Bots"]]),
    });
  });
});
