import { describe, expect, it } from "vitest";
import { checkTranslation, hasErrors, type Issue } from "../src/checks.ts";
import { type Glossary, GlossaryError, parseGlossary } from "../src/glossary.ts";
import type { Unit } from "../src/types.ts";

const icu = (text: string): Unit => ({ key: "k", text, kind: "icu" });
const errors = (issues: Issue[]) => issues.filter((i) => i.severity === "error").map((i) => i.code);
const warnings = (issues: Issue[]) =>
  issues.filter((i) => i.severity === "warning").map((i) => i.code);

const glossary: Glossary = parseGlossary({
  version: 1,
  sourceLocale: "en",
  locales: ["de", "ja", "es"],
  terms: [
    {
      id: "casama",
      term: "Casama",
      variants: [],
      rule: "keep",
      caseSensitive: true,
      translations: {},
    },
    {
      id: "cloud",
      term: "Casama Cloud",
      variants: [],
      rule: "keep",
      caseSensitive: true,
      translations: {},
    },
    {
      id: "brief",
      term: "brief",
      variants: ["morning brief"],
      rule: "translate-once-then-fixed",
      translations: {
        ja: { term: "ブリーフィング", avoid: ["ブリーフ"] },
        de: { term: "Briefing", forms: { plural: "Briefings" } },
      },
    },
    {
      id: "bot",
      term: "bot",
      variants: ["bots"],
      rule: "translate-once-then-fixed",
      translations: { de: { term: "Bot" } },
    },
    {
      id: "computer",
      term: "computer",
      variants: [],
      rule: "translate-once-then-fixed",
      translations: {
        es: {
          term: "computadora",
          forms: { plural: "computadoras" },
          avoid: ["servidor", "ordenador"],
        },
      },
    },
  ],
});

describe("placeholders and ICU", () => {
  it("accepts a good translation", () => {
    const r = checkTranslation(
      icu("{n, plural, =1{1 file} other{{n} files}}"),
      "{n, plural, one{1 Datei} other{{n} Dateien}}",
      { locale: "de" },
    );
    expect(hasErrors(r)).toBe(false);
  });

  it("catches a missing or renamed placeholder", () => {
    expect(errors(checkTranslation(icu("Hello {name}"), "Hallo", { locale: "de" }))).toContain(
      "placeholder",
    );
    expect(
      errors(checkTranslation(icu("Hello {name}"), "Hallo {nom}", { locale: "de" })),
    ).toContain("placeholder");
  });

  it("catches a placeholder dropped from one branch", () => {
    const r = checkTranslation(
      icu("{n, plural, =1{1 file} other{{n} files}}"),
      "{n, plural, =1{1 Datei} other{Dateien}}",
      { locale: "de" },
    );
    expect(r.some((i) => i.code === "placeholder")).toBe(true);
  });

  it("fails a dropped =0 branch but only warns about a dropped =1", () => {
    const src = icu("{n, plural, =0{No files yet} =1{1 file} other{{n} files}}");
    expect(
      errors(
        checkTranslation(src, "{n, plural, =1{1 个文件} other{{n} 个文件}}", { locale: "zh-Hans" }),
      ),
    ).toContain("plural");
    const kept = checkTranslation(src, "{n, plural, =0{还没有文件} other{{n} 个文件}}", {
      locale: "zh-Hans",
    });
    expect(hasErrors(kept)).toBe(false);
  });

  it("catches ICU syntax errors", () => {
    expect(
      errors(
        checkTranslation(icu("{n, plural, one{x} other{y}}"), "{n, plural, one{x} other{y}", {
          locale: "de",
        }),
      ),
    ).toEqual(["icu-syntax"]);
  });

  it("catches a translated plural keyword and a missing other", () => {
    expect(
      hasErrors(
        checkTranslation(icu("{n, plural, one{a} other{b}}"), "{n, Plural, one{a} other{b}}", {
          locale: "de",
        }),
      ),
    ).toBe(true);
    expect(
      errors(
        checkTranslation(icu("{n, plural, one{a} other{b}}"), "{n, select, one{a} other{b}}", {
          locale: "de",
        }),
      ),
    ).toContain("icu-structure");
    expect(
      errors(
        checkTranslation(icu("{n, plural, one{a} other{b}}"), "{n, plural, one{a}}", {
          locale: "de",
        }),
      ),
    ).toContain("plural");
  });

  it("needs the plural forms the language uses", () => {
    const src = icu("{n, plural, =1{1 file} other{{n} files}}");
    const ru = checkTranslation(src, "{n, plural, one{{n} файл} other{{n} файла}}", {
      locale: "ru",
    });
    expect(
      ru
        .filter((i) => i.severity === "error")
        .map((i) => i.message)
        .join(" "),
    ).toMatch(/few/);
    const ruOk = checkTranslation(
      src,
      "{n, plural, one{{n} файл} few{{n} файла} many{{n} файлов} other{{n} файла}}",
      { locale: "ru" },
    );
    expect(hasErrors(ruOk)).toBe(false);
  });

  it("lets Japanese drop one and =1 with only warnings", () => {
    const r = checkTranslation(
      icu("{n, plural, =1{1 file} other{{n} files}}"),
      "{n, plural, other{{n}件のファイル}}",
      { locale: "ja" },
    );
    expect(hasErrors(r)).toBe(false);
    expect(warnings(r)).toContain("plural");
    const extra = checkTranslation(
      icu("{n, plural, one{1 file} other{{n} files}}"),
      "{n, plural, one{1件} other{{n}件}}",
      { locale: "ja" },
    );
    expect(warnings(extra)).toContain("plural");
  });

  it("checks select branches exactly", () => {
    const src = icu("{g, select, male{He} female{She} other{They}}");
    expect(
      errors(checkTranslation(src, "{g, select, male{Er} other{Sie}}", { locale: "de" })),
    ).toContain("select");
  });

  it("compares printf and chrome tokens", () => {
    const printf: Unit = {
      key: "k",
      text: "%1$@ sent %2$lld files",
      kind: "plain",
      tokens: ["printf"],
    };
    expect(
      hasErrors(checkTranslation(printf, "%1$@ hat %2$lld Dateien gesendet", { locale: "de" })),
    ).toBe(false);
    expect(
      errors(checkTranslation(printf, "%1$@ hat Dateien gesendet", { locale: "de" })),
    ).toContain("placeholder");
    const chrome: Unit = { key: "k", text: "Open $SITE$", kind: "plain", tokens: ["chrome"] };
    expect(errors(checkTranslation(chrome, "$SITE$ öffnen $1", { locale: "de" }))).toContain(
      "placeholder",
    );
    const pct: Unit = { key: "k", text: "50% off", kind: "plain" };
    expect(hasErrors(checkTranslation(pct, "50 % Rabatt", { locale: "de" }))).toBe(false);
  });
});

describe("HTML and Markdown", () => {
  it("keeps tags and attributes, allows reordering", () => {
    const u: Unit = { key: "k", text: 'Get <b>more</b> with <a href="/pro">Pro</a>', kind: "html" };
    expect(
      hasErrors(checkTranslation(u, '<a href="/pro">Pro</a>で<b>もっと</b>', { locale: "ja" })),
    ).toBe(false);
    expect(
      errors(checkTranslation(u, 'Mehr mit <a href="/de/pro">Pro</a>', { locale: "de" })),
    ).toContain("tags");
    expect(
      errors(checkTranslation(u, 'Hol dir <b>mehr</b> mit <a href="/pro">Pro', { locale: "de" })),
    ).toContain("tags");
  });

  it("allows translated alt and title attributes", () => {
    const u: Unit = { key: "k", text: '<img src="a.png" alt="A cat"> Hello', kind: "html" };
    expect(
      hasErrors(checkTranslation(u, '<img src="a.png" alt="Eine Katze"> Hallo', { locale: "de" })),
    ).toBe(false);
  });

  it("keeps inline code, link targets and one line", () => {
    const u: Unit = {
      key: "k",
      text: "Run `casama login` and see [the guide](/guide/start).",
      kind: "markdown",
    };
    expect(
      hasErrors(
        checkTranslation(u, "Führe `casama login` aus und lies [die Anleitung](/guide/start).", {
          locale: "de",
        }),
      ),
    ).toBe(false);
    expect(
      errors(
        checkTranslation(u, "Führe `casama anmelden` aus und lies [die Anleitung](/guide/start).", {
          locale: "de",
        }),
      ),
    ).toContain("markdown");
    expect(
      errors(
        checkTranslation(u, "Führe `casama login` aus und lies [die Anleitung](/de/guide).", {
          locale: "de",
        }),
      ),
    ).toContain("markdown");
    expect(
      errors(
        checkTranslation(u, "Führe `casama login` aus.\n[die Anleitung](/guide/start).", {
          locale: "de",
        }),
      ),
    ).toContain("line-breaks");
    expect(errors(checkTranslation(u, "1.", { locale: "de" }))).toContain("no-letters");
  });
});

describe("length, copies, glossary", () => {
  it("enforces hard limits", () => {
    const u: Unit = { key: "name.txt", text: "Casama: AI bots", kind: "plain", maxLength: 30 };
    expect(
      errors(
        checkTranslation(u, "Casama: KI-Bots, die für dich arbeiten", { locale: "de", glossary }),
      ),
    ).toContain("too-long");
    expect(
      errors(
        checkTranslation(
          { ...u, maxLength: undefined },
          "Casama: KI-Bots, die für dich arbeiten und mehr",
          { locale: "de", maxLength: 30 },
        ),
      ),
    ).toContain("too-long");
  });

  it("warns on labels much longer than the English", () => {
    expect(
      warnings(checkTranslation(icu("Save"), "Speichern und schließen", { locale: "de" })),
    ).toContain("long-label");
  });

  it("catches untranslated copies, but not names", () => {
    expect(
      errors(
        checkTranslation(icu("Please try again a bit later"), "Please try again a bit later", {
          locale: "de",
        }),
      ),
    ).toContain("untranslated");
    // Short labels can be the same in both languages: a warning for the review pass.
    expect(
      warnings(checkTranslation(icu("Check-in {time}"), "Check-in {time}", { locale: "de" })),
    ).toContain("untranslated");
    expect(warnings(checkTranslation(icu("Cancel"), "Cancel", { locale: "de" }))).toContain(
      "untranslated",
    );
    expect(
      checkTranslation(icu("Casama Cloud"), "Casama Cloud", { locale: "de", glossary }),
    ).toEqual([]);
    expect(
      checkTranslation(icu("Try again later"), "Try again later", {
        locale: "de",
        sameAllowed: true,
      }),
    ).toEqual([]);
  });

  it("flags English left in a Japanese translation", () => {
    expect(
      warnings(
        checkTranslation(icu("Your bot is ready"), "Your bot is ready now です", { locale: "ja" }),
      ),
    ).toContain("english-left");
  });

  it("keeps brand names and fixed terms", () => {
    expect(
      errors(checkTranslation(icu("Open Casama"), "Öffne Kasama", { locale: "de", glossary })),
    ).toContain("glossary");
    expect(
      warnings(checkTranslation(icu("Your bot"), "Dein Assistent", { locale: "de", glossary })),
    ).toContain("glossary");
  });

  it("flags avoided words without tripping on the right term", () => {
    expect(
      warnings(
        checkTranslation(icu("Your daily brief"), "毎日のブリーフ", { locale: "ja", glossary }),
      ),
    ).toContain("glossary");
    expect(
      hasErrors(
        checkTranslation(icu("Your daily brief"), "毎日のブリーフィング", {
          locale: "ja",
          glossary,
        }),
      ),
    ).toBe(false);
  });

  it("rejects empty translations", () => {
    expect(errors(checkTranslation(icu("Save"), "  ", { locale: "de" }))).toEqual(["empty"]);
  });
});

describe("glossary avoid list and format", () => {
  it("warns on avoided words, which may carry another sense, and ignores web addresses", () => {
    const u = icu("Your bot's computer is on");
    expect(
      warnings(
        checkTranslation(u, "El ordenador de tu bot está encendido", { locale: "es", glossary }),
      ),
    ).toContain("glossary");
    const both = icu("The computer talks to the server");
    const r = checkTranslation(both, "La computadora habla con el servidor", {
      locale: "es",
      glossary,
    });
    expect(hasErrors(r)).toBe(false);
    expect(warnings(r)).toContain("glossary");
    // The ai in casama.ai is not the word AI.
    const ai = parseGlossary({
      version: 1,
      sourceLocale: "en",
      locales: ["de"],
      terms: [
        {
          id: "ai",
          term: "AI",
          variants: [],
          rule: "translate-once-then-fixed",
          caseSensitive: true,
          translations: { de: { term: "KI", avoid: ["AI"] } },
        },
      ],
    });
    expect(
      checkTranslation(icu("Buy one on casama.ai"), "Kauf eines auf casama.ai", {
        locale: "de",
        glossary: ai,
      }),
    ).toEqual([]);
    expect(
      warnings(
        checkTranslation(icu("Your AI teammate"), "Dein AI-Kollege", {
          locale: "de",
          glossary: ai,
        }),
      ),
    ).toContain("glossary");
    // A string about something else may use the word freely.
    expect(
      checkTranslation(icu("Restart the server"), "Reinicia el servidor", {
        locale: "es",
        glossary,
      }),
    ).toEqual([]);
  });

  it("accepts a fixed term's forms", () => {
    expect(
      warnings(checkTranslation(icu("Your briefs"), "Deine Briefings", { locale: "de", glossary })),
    ).not.toContain("glossary");
  });

  it("fails loudly on the wrong shape", () => {
    expect(() =>
      parseGlossary({ keep: ["Casama"], terms: [{ en: "bot", translations: { de: "Bot" } }] }),
    ).toThrow(GlossaryError);
    expect(() => parseGlossary({ keep: ["Casama"] })).toThrow(/terms/);
    expect(() => parseGlossary([])).toThrow(GlossaryError);
  });
});
