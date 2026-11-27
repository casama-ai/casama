import { describe, expect, it } from "vitest";
import { androidStringsAdapter as adapter } from "../src/adapters/android-strings.ts";
import { icuToPlural } from "../src/icu.ts";
import { AdapterError, type TargetContext } from "../src/types.ts";

const ctx: TargetContext = {
  options: {},
  sourceLocale: "en",
  path: "res/values/strings.xml",
  locale: "ja",
  mappedLocale: "ja",
};

const SOURCE = `<?xml version="1.0" encoding="utf-8"?>
<!-- File header -->
<resources xmlns:xliff="urn:oasis:names:tc:xliff:document:1.2" xmlns:tools="http://schemas.android.com/tools">
    <!-- The app's name -->
    <string name="app_name" translatable="false">Casama</string>
    <!--  Greeting on the home screen  -->
    <string name="hello" formatted="false" tools:ignore="TypographyDashes">Hello</string>
    <string name="escapes">Don\\'t say \\"no\\"\\nTab\\there \\@ \\? \\\\ \\u00e9</string>
    <string name="entities">Ben &amp; Jerry &lt;3 &gt; &quot;q&quot; &apos;a&apos; &#65;&#x42;</string>
    <string name="cdata"><![CDATA[Read <a href="https://casama.ai">this</a> & that]]></string>
    <string name="cdata_plain"><![CDATA[1 < 2 && 3]]></string>
    <string name="bold">Tap <b>Allow</b> to go &amp; see</string>
    <string name="xliff">Ask <xliff:g id="bot" example="Bob">%1$s</xliff:g> now</string>
    <string name="quoted">"  Two  spaces  "</string>
    <string name="wrapped">Several
        lines   here</string>
    <string name="reference">@string/app_name</string>
    <string name="skipped_by_option">Nope</string>

    <plurals name="bots">
        <item quantity="one">%d bot isn\\'t ready</item>
        <item quantity="other">%d bots aren\\'t ready</item>
    </plurals>
    <string-array name="days">
        <item>Monday</item>
        <item>Tuesday</item>
    </string-array>
    <string-array name="capabilities" translatable="false">
        <item>casama_wear</item>
    </string-array>
    <color name="accent">#fff</color>
</resources>
`;

const options = { skip: ["skipped_by_option"] };
const units = adapter.read(SOURCE, { ...ctx, options });
const byKey = new Map(units.map((u) => [u.key, u]));

const write = (translations: Record<string, string>, source = SOURCE): string =>
  adapter.write(
    { source, previous: null, translations: new Map(Object.entries(translations)) },
    { ...ctx, options },
  );
const readBack = (xml: string): Record<string, string> => {
  const target = adapter.readTarget(xml, ctx);
  if (target.kind !== "keys") throw new Error("expected keys");
  return Object.fromEntries(target.values);
};

describe("android-strings read", () => {
  it("lists translatable entries in file order", () => {
    expect(units.map((u) => u.key)).toEqual([
      "hello",
      "escapes",
      "entities",
      "cdata",
      "cdata_plain",
      "bold",
      "xliff",
      "quoted",
      "wrapped",
      "bots",
      "days[0]",
      "days[1]",
    ]);
  });

  it("decodes escapes, entities, CDATA, quoting and whitespace", () => {
    expect(byKey.get("escapes")?.text).toBe('Don\'t say "no"\nTab\there @ ? \\ é');
    expect(byKey.get("entities")?.text).toBe("Ben & Jerry <3 > \"q\" 'a' AB");
    expect(byKey.get("cdata")?.text).toBe('Read <a href="https://casama.ai">this</a> & that');
    expect(byKey.get("cdata_plain")?.text).toBe("1 < 2 && 3");
    expect(byKey.get("quoted")?.text).toBe("  Two  spaces  ");
    expect(byKey.get("wrapped")?.text).toBe("Several lines here");
  });

  it("keeps inline markup as written and marks it html", () => {
    expect(byKey.get("bold")).toMatchObject({ kind: "html", text: "Tap <b>Allow</b> to go & see" });
    expect(byKey.get("xliff")).toMatchObject({
      kind: "html",
      text: 'Ask <xliff:g id="bot" example="Bob">%1$s</xliff:g> now',
    });
    expect(byKey.get("cdata")?.kind).toBe("html");
    expect(byKey.get("cdata_plain")?.kind).toBe("plain");
    expect(units.every((u) => u.tokens?.join() === "printf")).toBe(true);
  });

  it("takes the comment right before an element as its description", () => {
    expect(byKey.get("hello")?.description).toBe("Greeting on the home screen");
    expect(byKey.get("escapes")?.description).toBeUndefined();
  });

  it("turns plurals into one ICU unit", () => {
    expect(byKey.get("bots")).toMatchObject({
      kind: "icu",
      text: "{count, plural, one{%d bot isn't ready} other{%d bots aren't ready}}",
    });
    expect(byKey.get("bots")?.note).toContain("Android plural");
  });

  it("rejects broken files", () => {
    for (const bad of [
      "<resources><string name='a'>x</resources>",
      "<resources><string name='a'>x</string>",
      "<other/>",
      "<resources><string>x</string></resources>",
      "<resources><string name='a'>x</string><string name='a'>y</string></resources>",
    ])
      expect(() => adapter.read(bad, ctx)).toThrow(AdapterError);
  });
});

describe("android-strings write", () => {
  it("round-trips the English", () => {
    const english = Object.fromEntries(units.map((u) => [u.key, u.text]));
    const xml = write(english);
    expect(readBack(xml)).toEqual(english);
    expect(adapter.read(xml, ctx).map((u) => u.kind)).toEqual(units.map((u) => u.kind));
  });

  it("round-trips awkward translations", () => {
    const awkward = [
      'L\'été "chaud" & <froid>',
      "@bot 今日は\n二行目です",
      "?何ですか\t\\n はそのまま",
      " leading, double  space, trailing ",
      "a ]]> b &lt; c",
      "A & B; &nbsp; R&D",
      "\r bell\u0007 😀",
      "",
    ];
    for (const text of awkward) {
      // "&lt;" in a plain value is an entity by design, so it reads back as the character.
      const expected = text.replace("&lt;", "<");
      for (const key of ["hello", "cdata", "cdata_plain", "days[0]"]) {
        const all = {
          [key]: text,
          "days[1]": "火曜日",
          ...(key === "days[0]" ? {} : { "days[0]": "月曜日" }),
        };
        const got = readBack(write(all));
        // CDATA is verbatim (nothing in it is an entity) unless the text cannot stand in it.
        const unfit = ["'", '"', "]]>", "\r", "\u0007"].some((s) => text.includes(s));
        const verbatim = key.startsWith("cdata") && !unfit;
        expect(got[key], `${key}: ${JSON.stringify(text)}`).toBe(verbatim ? text : expected);
      }
    }
  });

  it("round-trips markup, escaping only the text around it", () => {
    const bold = '<b>許可</b>を押して & 1 < 2、it\'s "ok"';
    const xliff = '<xliff:g id="bot" example="Bob">%1$s</xliff:g>  に聞く &lt;b> <br/>';
    const xml = write({ bold, xliff });
    expect(xml).toContain('<b>許可</b>を押して &amp; 1 &lt; 2、it\\\'s \\"ok\\"');
    expect(xml).toContain('"<xliff:g id="bot" example="Bob">%1$s</xliff:g>  に聞く &lt;b> <br/>"');
    expect(readBack(xml)).toEqual({ bold, xliff });
  });

  it("refuses unbalanced markup", () => {
    expect(() => write({ bold: "<b>oops" })).toThrow(/bold/);
    expect(() => write({ bold: "oops</b>" })).toThrow(AdapterError);
  });

  it("keeps CDATA unless Android could not read it", () => {
    expect(write({ cdata: '<a href="x">これ</a>' })).toContain('<![CDATA[<a href="x">これ</a>]]>');
    const fallback = write({ cdata: "<i>l'app</i>" });
    expect(fallback).toContain("&lt;i>l\\'app&lt;/i>");
    expect(readBack(fallback)).toEqual({ cdata: "<i>l'app</i>" });
    const quoted = write({ cdata_plain: 'say "hi"' });
    expect(quoted).toContain('say \\"hi\\"');
    expect(readBack(quoted)).toEqual({ cdata_plain: 'say "hi"' });
  });

  it("writes only translated keys, in source order, with the source's attributes", () => {
    const xml = write({
      "days[0]": "月",
      hello: "こんにちは",
      "days[1]": "火",
      unknown: "x",
      app_name: "x",
    });
    expect(xml).toBe(`<?xml version="1.0" encoding="utf-8"?>
<resources xmlns:xliff="urn:oasis:names:tc:xliff:document:1.2" xmlns:tools="http://schemas.android.com/tools">
    <string name="hello" formatted="false">こんにちは</string>
    <string-array name="days">
        <item>月</item>
        <item>火</item>
    </string-array>
</resources>
`);
  });

  it("omits a partly translated array", () => {
    const xml = write({ "days[0]": "月" });
    expect(xml).not.toContain("string-array");
    expect(readBack(xml)).toEqual({});
  });

  it("copies reference items of an array as they are", () => {
    const source = `<resources><string-array name="a"><item>@string/x</item><item>Two</item></string-array></resources>`;
    expect(adapter.read(source, ctx).map((u) => u.key)).toEqual(["a[1]"]);
    const xml = write({ "a[1]": "二" }, source);
    expect(xml).toContain("<item>@string/x</item>\n        <item>二</item>");
    expect(readBack(xml)).toEqual({ "a[1]": "二" });
  });

  it("writes every plural quantity a language needs", () => {
    const bots =
      "{count, plural, one{%d бот не готов} few{%d бота не готовы} many{%d ботов не готовы} other{%d бота l'не готовы}}";
    const xml = write({ bots });
    expect(xml).toContain('<item quantity="few">%d бота не готовы</item>');
    expect(xml).toContain('<item quantity="many">%d ботов не готовы</item>');
    expect(xml).toContain("l\\'не");
    expect(readBack(xml)).toEqual({ bots });
    expect(Object.keys(icuToPlural(readBack(xml).bots as string)?.cases ?? {})).toEqual([
      "one",
      "few",
      "many",
      "other",
    ]);
  });

  it("keeps markup inside plural items", () => {
    const source = `<resources><plurals name="p"><item quantity="other"><b>%d</b> files</item></plurals></resources>`;
    const p = "{count, plural, one{<b>%d</b> файл} other{<b>%d</b> файла}}";
    const xml = write({ p }, source);
    expect(xml).toContain('<item quantity="one"><b>%d</b> файл</item>');
    expect(readBack(xml)).toEqual({ p });
  });

  it("refuses a plural Android cannot hold, naming the key", () => {
    expect(() => write({ bots: "%d bots" })).toThrow(/bots/);
    expect(() => write({ bots: "{count, plural, =0{none} other{%d}}" })).toThrow(/bots.*=0/);
  });

  it("writes an empty file when nothing is translated", () => {
    expect(write({}, "<resources/>")).toBe(
      '<?xml version="1.0" encoding="utf-8"?>\n<resources>\n</resources>\n',
    );
  });
});
