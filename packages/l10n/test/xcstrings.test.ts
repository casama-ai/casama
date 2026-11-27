import { describe, expect, it } from "vitest";
import { xcstringsAdapter as adapter } from "../src/adapters/xcstrings.ts";
import { AdapterError, type TargetContext } from "../src/types.ts";

const context = (locale: string): TargetContext => ({
  options: {},
  sourceLocale: "en",
  path: "Localizable.xcstrings",
  locale,
  mappedLocale: locale,
});
const de = context("de");

type Node = Record<string, unknown>;
const unit = (value: string, state = "translated"): Node => ({ stringUnit: { state, value } });
const plural = (cases: Record<string, string>): Node => ({
  variations: {
    plural: Object.fromEntries(Object.entries(cases).map(([k, v]) => [k, unit(v)])),
  },
});
const device = (devices: Record<string, Node>): Node => ({ variations: { device: devices } });
const catalog = (strings: Record<string, Node>) =>
  JSON.stringify({ sourceLanguage: "en", strings, version: "1.0" });

/** Exactly as Xcode writes a catalog (xcstringstool leaves off the final newline). */
const XCODE = `{
  "sourceLanguage" : "en",
  "strings" : {
    "Zebra" : {

    },
    "100" : {
      "shouldTranslate" : false
    },
    "Hello" : {
      "comment" : "Greeting on the home screen, with a \\"quote\\": and https://casama.ai/ {x}",
      "extractionState" : "manual",
      "localizations" : {
        "en" : {
          "stringUnit" : {
            "state" : "translated",
            "value" : "Hello there"
          }
        },
        "fr" : {
          "stringUnit" : {
            "state" : "translated",
            "value" : "Salut\\n"
          }
        }
      }
    },
    "%lld bots" : {
      "localizations" : {
        "en" : {
          "variations" : {
            "plural" : {
              "one" : {
                "stringUnit" : {
                  "state" : "translated",
                  "value" : "%lld bot"
                }
              },
              "other" : {
                "stringUnit" : {
                  "state" : "translated",
                  "value" : "%lld bots"
                }
              }
            }
          }
        }
      }
    }
  },
  "version" : "1.0"
}
`;

const write = (translations: [string, string][], source = XCODE, ctx = de) =>
  adapter.write({ source, previous: source, translations: new Map(translations) }, ctx);
const values = (content: string, ctx = de) => {
  const read = adapter.readTarget(content, ctx);
  if (read.kind !== "keys") throw new Error("expected keys");
  return read.values;
};

describe("xcstrings", () => {
  it("holds every language in one file", () => {
    expect(adapter.multiLocale).toBe(true);
  });

  it("reads units from the source language, or from the key", () => {
    expect(adapter.read(XCODE, de)).toEqual([
      { key: "Zebra", text: "Zebra", kind: "plain", tokens: ["printf"] },
      {
        key: "Hello",
        text: "Hello there",
        kind: "plain",
        tokens: ["printf"],
        description: 'Greeting on the home screen, with a "quote": and https://casama.ai/ {x}',
      },
      {
        key: "%lld bots",
        text: "{count, plural, one{%lld bot} other{%lld bots}}",
        kind: "icu",
        tokens: ["printf"],
        note: expect.stringContaining("every plural category"),
      },
    ]);
  });

  it("writes an unchanged catalog byte for byte, with or without a final newline", () => {
    expect(write([])).toBe(XCODE);
    expect(write([], XCODE.trimEnd())).toBe(XCODE.trimEnd());
    expect(adapter.write({ source: XCODE, previous: null, translations: new Map() }, de)).toBe(
      XCODE,
    );
    // Writing a locale's own values back changes nothing either.
    expect(write([...values(XCODE, context("fr"))], XCODE, context("fr"))).toBe(XCODE);
  });

  it("merges one locale and leaves the others alone", () => {
    const out = write([
      ["Zebra", "Zebra (Tier)"],
      ["Hello", "Hallo"],
    ]);
    expect(out).toBe(
      XCODE.replace(
        `    "Zebra" : {

    },`,
        `    "Zebra" : {
      "localizations" : {
        "de" : {
          "stringUnit" : {
            "state" : "translated",
            "value" : "Zebra (Tier)"
          }
        }
      }
    },`,
      ).replace(
        `      "localizations" : {
        "en" : {
          "stringUnit" : {`,
        `      "localizations" : {
        "de" : {
          "stringUnit" : {
            "state" : "translated",
            "value" : "Hallo"
          }
        },
        "en" : {
          "stringUnit" : {`,
      ),
    );
    expect(values(out)).toEqual(
      new Map([
        ["Zebra", "Zebra (Tier)"],
        ["Hello", "Hallo"],
      ]),
    );
    expect(values(out, context("fr"))).toEqual(new Map([["Hello", "Salut\n"]]));
  });

  it("puts new localizations in Xcode's order", () => {
    const source = catalog({ a: { comment: "c", shouldTranslate: true } });
    const hans = write([["a", "x"]], source, context("zh-Hans"));
    const both = write([["a", "y"]], hans, context("zh-HK"));
    const entry = JSON.parse(both).strings.a;
    expect(Object.keys(entry)).toEqual(["comment", "localizations", "shouldTranslate"]);
    expect(Object.keys(entry.localizations)).toEqual(["zh-HK", "zh-Hans"]);
  });

  it("starts from the previous file, and writes the mapped locale", () => {
    const previous = write([["Hello", "Hallo"]]);
    const out = adapter.write(
      { source: XCODE, previous, translations: new Map([["Zebra", "Zebra"]]) },
      { ...context("no"), mappedLocale: "nb" },
    );
    expect(values(out).get("Hello")).toBe("Hallo");
    expect(values(out, context("nb"))).toEqual(new Map([["Zebra", "Zebra"]]));
    expect(JSON.parse(out).strings.Zebra.localizations.no).toBeUndefined();
  });

  it("converts plurals both ways, with the target language's own categories", () => {
    const ru =
      "{count, plural, one{%lld бот} few{%lld бота} many{%lld ботов} other{%lld бота {name}}}";
    const out = write([["%lld bots", ru]], XCODE, context("ru"));
    const written = JSON.parse(out).strings["%lld bots"].localizations;
    expect(Object.keys(written.ru.variations.plural)).toEqual(["few", "many", "one", "other"]);
    expect(written.ru.variations.plural.few).toEqual(unit("%lld бота"));
    expect(written.en).toEqual(JSON.parse(XCODE).strings["%lld bots"].localizations.en);
    expect(values(out, context("ru")).get("%lld bots")).toBe(ru);
    expect(write([["%lld bots", ru]], out, context("ru"))).toBe(out);
  });

  it.each([
    ["%lld Bots", "one ICU plural"],
    ["{count, plural, one{%lld Bot} other{%lld Bots}} da", "one ICU plural"],
    ["{count, plural, =0{Keine} other{%lld Bots}}", "no plural category =0"],
    ["{count, plural, one{%lld Bot}}", 'no "other"'],
  ])("rejects the plural translation %j, naming the key", (translation, message) => {
    expect(() => write([["%lld bots", translation]])).toThrow(AdapterError);
    expect(() => write([["%lld bots", translation]])).toThrow(`%lld bots: `);
    expect(() => write([["%lld bots", translation]])).toThrow(message);
  });

  const DEVICES = catalog({
    tap: {
      localizations: {
        en: device({
          iphone: unit("Tap"),
          mac: unit("Click"),
          other: plural({ one: "%lld tap", other: "%lld taps" }),
        }),
      },
    },
  });

  it("gives one unit per device, plural or not", () => {
    expect(adapter.read(DEVICES, de).map((u) => [u.key, u.kind, u.text])).toEqual([
      ["tap#device.iphone", "plain", "Tap"],
      ["tap#device.mac", "plain", "Click"],
      ["tap#device.other", "icu", "{count, plural, one{%lld tap} other{%lld taps}}"],
    ]);
  });

  it("writes device translations, keeping the devices that have none", () => {
    const some = write(
      [
        ["tap#device.mac", "Klicken"],
        ["tap#device.other", "{count, plural, one{%lld Tipp} other{%lld Tipps}}"],
      ],
      DEVICES,
    );
    const all = write([["tap#device.iphone", "Tippen"]], some);
    const localizations = JSON.parse(all).strings.tap.localizations;
    expect(localizations.de).toEqual(
      device({
        iphone: unit("Tippen"),
        mac: unit("Klicken"),
        other: plural({ one: "%lld Tipp", other: "%lld Tipps" }),
      }),
    );
    expect(Object.keys(localizations.de.variations.device)).toEqual(["iphone", "mac", "other"]);
    expect(localizations.en).toEqual(JSON.parse(DEVICES).strings.tap.localizations.en);
    expect(values(all)).toEqual(
      new Map([
        ["tap#device.iphone", "Tippen"],
        ["tap#device.mac", "Klicken"],
        ["tap#device.other", "{count, plural, one{%lld Tipp} other{%lld Tipps}}"],
      ]),
    );
  });

  it("skips what it cannot translate and never touches it", () => {
    const source = catalog({
      "": {},
      off: { shouldTranslate: false },
      subs: { localizations: { en: { ...unit("%#@files@"), substitutions: { files: {} } } } },
      shortcut: {
        localizations: { en: { stringSet: { state: "translated", values: ["Open"] } } },
      },
    });
    expect(adapter.read(source, de)).toEqual([]);
    const out = write(
      [
        ["off", "x"],
        ["subs", "x"],
        ["shortcut", "x"],
      ],
      source,
    );
    expect(JSON.parse(out)).toEqual(JSON.parse(source));
  });

  it("does not count a string still marked new as translated", () => {
    const source = catalog({ a: { localizations: { de: unit("a", "new") } } });
    expect(values(source)).toEqual(new Map());
    const review = catalog({ a: { localizations: { de: unit("ä", "needs_review") } } });
    expect(values(review)).toEqual(new Map([["a", "ä"]]));
  });

  it("refuses to write the source language or a broken file", () => {
    expect(() => write([["Hello", "Hi"]], XCODE, context("en"))).toThrow("source language");
    expect(() => adapter.read("{", de)).toThrow("not valid JSON");
    expect(() => adapter.read("[]", de)).toThrow(AdapterError);
    expect(() => adapter.read('{"strings":{"a":1}}', de)).toThrow("a must be an object");
  });
});
