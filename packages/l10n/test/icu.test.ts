import { describe, expect, it } from "vitest";
import {
  icuArguments,
  icuToPlural,
  icuVariants,
  mapIcuLiterals,
  parseIcu,
  pluralToIcu,
  stringifyIcu,
} from "../src/icu.ts";
import { pluralInfo } from "../src/plural.ts";

describe("parseIcu", () => {
  const messages = [
    "Plain text",
    "{page} · {app}",
    "{n, plural, =1{1 file} other{{n} files}}",
    "{count, plural, =0{No invites left} =1{1 invite left} other{{count} invites left}}",
    "{who, select, owner{You own it} other{{name} owns it}}",
    "{n, plural, offset:1 =0{Nobody} one{{name} only} other{{name} and # others}}",
    "{when, date, short} at {when, time, ::jmm}",
    "Don't stop: it's {n, plural, one{one} other{many}}",
    "{a, select, x{{b, plural, one{1 b} other{{b} bs}}} other{none}}",
  ];
  it.each(messages)("round-trips %s", (m) => {
    expect(stringifyIcu(parseIcu(m))).toBe(m);
  });

  it("treats apostrophes as plain text unless quoting is on", () => {
    expect(icuArguments(parseIcu("It's {n}")).has("n")).toBe(true);
    expect(icuArguments(parseIcu("Use '{name}' literally", { apostrophes: true })).size).toBe(0);
    expect(() => parseIcu("Use '{name}' literally")).not.toThrow();
  });

  it("rejects broken messages", () => {
    expect(() => parseIcu("{n, plural, one{x}")).toThrow(/missing/);
    expect(() => parseIcu("stray }")).toThrow(/unmatched/);
    expect(() => parseIcu("{n, plural, one {x} one {y}}")).toThrow(/twice/);
    expect(() => parseIcu("{n, plural, }")).toThrow(/no branches/);
  });

  it("lists every path with its placeholders", () => {
    const v = icuVariants(parseIcu("{name}: {n, plural, =1{1 file} other{{n} files}}"));
    expect(v?.map((x) => [x.choices.get("n"), [...x.args].sort(), x.literal])).toEqual([
      ["=1", ["name"], ": 1 file"],
      ["other", ["n", "name"], ":  files"],
    ]);
  });

  it("rewrites literal text only", () => {
    const out = stringifyIcu(
      mapIcuLiterals(parseIcu("Hi {n, plural, one{# cat} other{{n} cats}}"), (t) =>
        t.toUpperCase(),
      ),
    );
    expect(out).toBe("HI {n, plural, one{# CAT} other{{n} CATS}}");
  });

  it("converts plural maps both ways", () => {
    const icu = pluralToIcu("count", {
      one: "%d файл",
      few: "%d файла",
      many: "%d файлов",
      other: "%d файла",
    });
    expect(icuToPlural(icu)).toEqual({
      arg: "count",
      cases: { one: "%d файл", few: "%d файла", many: "%d файлов", other: "%d файла" },
    });
    expect(icuToPlural("not a plural")).toBeNull();
  });
});

describe("plural rules", () => {
  it("knows the wave-1 and wave-3 languages", () => {
    expect(pluralInfo("de").required).toEqual(["one", "other"]);
    expect(pluralInfo("pt-BR").allowed).toContain("many");
    expect(pluralInfo("ja").required).toEqual(["other"]);
    expect(pluralInfo("ar").required).toHaveLength(6);
    expect(pluralInfo("xx").known).toBe(false);
  });
});
