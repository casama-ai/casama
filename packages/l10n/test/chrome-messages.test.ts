import { describe, expect, it } from "vitest";
import { chromeMessagesAdapter as adapter } from "../src/adapters/chrome-messages.ts";
import { AdapterError, type TargetContext } from "../src/types.ts";

const ctx: TargetContext = {
  options: {},
  sourceLocale: "en",
  path: "_locales/en/messages.json",
  locale: "ja",
  mappedLocale: "ja",
};

const placeholders = { bot: { content: "$1", example: "Bob" }, count: { content: "$2" } };

const SOURCE = JSON.stringify({
  extName: { message: "Casama", description: "The extension's name." },
  extShortName: { message: "Casama" },
  extDescription: {
    message: "Ask your bots.",
    description: "The store summary, at most 112 characters.",
  },
  actionTitle: { message: "Casama", description: " Tooltip. At most 40 Characters. " },
  waiting: { message: "$bot$ has $count$ questions, $$5", placeholders },
});

const write = (translations: Record<string, string>): string =>
  adapter.write(
    { source: SOURCE, previous: null, translations: new Map(Object.entries(translations)) },
    ctx,
  );

describe("chrome-messages", () => {
  const units = adapter.read(SOURCE, ctx);
  const byKey = new Map(units.map((u) => [u.key, u]));

  it("reads each message as a plain unit with chrome tokens", () => {
    expect(units.map((u) => u.key)).toEqual([
      "extName",
      "extShortName",
      "extDescription",
      "actionTitle",
      "waiting",
    ]);
    expect(byKey.get("waiting")).toEqual({
      key: "waiting",
      text: "$bot$ has $count$ questions, $$5",
      kind: "plain",
      tokens: ["chrome"],
      placeholders: { bot: { example: "Bob" }, count: { example: "$2" } },
    });
    expect(byKey.get("actionTitle")?.description).toBe("Tooltip. At most 40 Characters.");
  });

  it("sets length limits from the store keys and descriptions", () => {
    expect(units.map((u) => u.maxLength)).toEqual([75, 12, 112, 40, undefined]);
    const larger = JSON.stringify({
      extDescription: { message: "x", description: "at most 500 characters" },
    });
    expect(adapter.read(larger, ctx)[0]?.maxLength).toBe(132);
  });

  it("writes translated keys in source order, with placeholders and no descriptions", () => {
    const out = write({ waiting: "$bot$から$count$件の質問", extName: "カサマ" });
    expect(out).toBe(
      `${JSON.stringify({ extName: { message: "カサマ" }, waiting: { message: "$bot$から$count$件の質問", placeholders } }, null, 2)}\n`,
    );
  });

  it("round-trips awkward text", () => {
    const translations = {
      extName: 'L\'été "chaud" & <froid>',
      extShortName: "@短い",
      extDescription: "一行目\n二行目\t\\n",
      actionTitle: "",
      waiting: "$$ $bot$ $1",
    };
    const target = adapter.readTarget(write(translations), ctx);
    expect(target).toEqual({ kind: "keys", values: new Map(Object.entries(translations)) });
  });

  it("rejects broken files", () => {
    for (const bad of [
      "{",
      "[]",
      '{"a":"b"}',
      '{"a":{}}',
      '{"a":{"message":"x","placeholders":[]}}',
    ])
      expect(() => adapter.read(bad, ctx)).toThrow(AdapterError);
  });
});
