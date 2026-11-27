import { describe, expect, it } from "vitest";
import { appleStringsAdapter as adapter } from "../src/adapters/apple-strings.ts";
import { AdapterError, type TargetContext } from "../src/types.ts";

const ctx: TargetContext = {
  options: {},
  sourceLocale: "en",
  path: "en.lproj/Localizable.strings",
  locale: "de",
  mappedLocale: "de",
};

const SOURCE = String.raw`/* Localizable.strings
   Casama */

/* Button that saves the form */
"save" = "Save";

// Shown above the list
// of bots
"bots.title" = "Your \"bots\"";

/* MARK: Details */

"lines" = "One\nTwo\tthree \\ %1$@"; // trailing note
"cafe" = "Caf\U00E9";

NSCameraUsageDescription = "Casama uses the camera.";
`;

const values = (content: string) => {
  const read = adapter.readTarget(content, ctx);
  if (read.kind !== "keys") throw new Error("expected keys");
  return read.values;
};
const write = (translations: [string, string][], source = SOURCE) =>
  adapter.write({ source, previous: null, translations: new Map(translations) }, ctx);
const unchanged = (source: string) =>
  write(
    adapter.read(source, ctx).map((u) => [u.key, u.text]),
    source,
  );

describe("apple-strings", () => {
  it("reads units, with comments as descriptions", () => {
    const units = adapter.read(SOURCE, ctx);
    expect(units.map((u) => u.key)).toEqual([
      "save",
      "bots.title",
      "lines",
      "cafe",
      "NSCameraUsageDescription",
    ]);
    expect(units[0]).toEqual({
      key: "save",
      text: "Save",
      kind: "plain",
      tokens: ["printf"],
      description: "Button that saves the form",
    });
    expect(units[1]?.description).toBe("Shown above the list\nof bots");
    // A comment cut off by a blank line, or trailing another entry, describes nothing.
    expect(units[2]?.description).toBeUndefined();
    expect(units[3]?.description).toBeUndefined();
    expect(units[4]?.description).toBeUndefined();
  });

  it("decodes escapes", () => {
    const units = adapter.read(SOURCE, ctx);
    expect(units[1]?.text).toBe('Your "bots"');
    expect(units[2]?.text).toBe("One\nTwo\tthree \\ %1$@");
    expect(units[3]?.text).toBe("Café");
    expect(adapter.read(String.raw`"a" = "\r\UD83D\UDE00";`, ctx)[0]?.text).toBe("\r😀");
  });

  it("encodes escapes and leaves other characters as UTF-8", () => {
    const out = write([["a", 'Er sagte "Ja"\n\t\\ é 日本 😀']], '"a" = "x";\n');
    expect(out).toBe(`"a" = "Er sagte \\"Ja\\"\\n\\t\\\\ é 日本 😀";\n`);
    expect(values(out).get("a")).toBe('Er sagte "Ja"\n\t\\ é 日本 😀');
  });

  it("writes an unchanged file byte for byte", () => {
    expect(unchanged(SOURCE)).toBe(SOURCE);
    const crlf = SOURCE.replaceAll("\n", "\r\n");
    expect(unchanged(crlf)).toBe(crlf);
    const tight = '/* a */ "a" = "1"; "b" = "2"; /* two\nlines */\n"c"\n  =\n  "3";\n\n// end\n';
    expect(unchanged(tight)).toBe(tight);
  });

  it("strips a byte order mark and ends with a newline", () => {
    expect(unchanged('﻿"a" = "1";')).toBe('"a" = "1";\n');
  });

  it("writes a translation, leaving out untranslated entries and their comments", () => {
    const translations: [string, string][] = [
      ["bots.title", "Deine „Bots“"],
      ["NSCameraUsageDescription", "Casama nutzt die Kamera."],
    ];
    const out = write(translations);
    expect(out).toBe(`/* Localizable.strings
   Casama */

// Shown above the list
// of bots
"bots.title" = "Deine „Bots“";

/* MARK: Details */

NSCameraUsageDescription = "Casama nutzt die Kamera.";
`);
    expect(values(out)).toEqual(new Map(translations));
  });

  it("keeps the header and tidy gaps when entries at either end are left out", () => {
    const source =
      '/* Header */\n\n/* a */\n"a" = "1";\n\n/* b */\n"b" = "2";\n\n/* c */\n"c" = "3";\n';
    expect(write([["b", "zwei"]], source)).toBe('/* Header */\n\n/* b */\n"b" = "zwei";\n');
    expect(
      write(
        [
          ["a", "eins"],
          ["c", "drei"],
        ],
        source,
      ),
    ).toBe('/* Header */\n\n/* a */\n"a" = "eins";\n\n/* c */\n"c" = "drei";\n');
    expect(write([], source)).toBe("/* Header */\n");
    expect(write([["b", "zwei"]], '/* a */\n"a" = "1";\n\n"b" = "2";\n')).toBe('"b" = "zwei";\n');
  });

  it.each([
    ['"a" = "1"', "expected ;"],
    ['"a" "1";', "expected ="],
    ['"a" = 1;', 'expected "'],
    ['"a" = "1;', "never closed"],
    ["/* open", "never closed"],
    [String.raw`"a" = "\U12";`, "four hex digits"],
    ['"a" = "1";\n"a" = "2";', "appears twice"],
    ["{", "expected a key"],
  ])("rejects %j", (content, message) => {
    expect(() => adapter.read(content, ctx)).toThrow(AdapterError);
    expect(() => adapter.read(content, ctx)).toThrow(message);
  });
});
