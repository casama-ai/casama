import { describe, expect, it } from "vitest";
import { markdownAdapter } from "../src/adapters/markdown.ts";
import type { TargetContext } from "../src/types.ts";

const ctx: TargetContext = {
  options: {},
  sourceLocale: "en",
  path: "docs/page.md",
  locale: "de",
  mappedLocale: "de",
};

const read = (source: string, c = ctx) => markdownAdapter.read(source, c);
const texts = (source: string, c = ctx) => read(source, c).map((u) => u.text);

function write(source: string, map: (text: string) => string | undefined, c = ctx): string {
  const translations = new Map<string, string>();
  for (const u of read(source, c)) {
    const t = map(u.text);
    if (t !== undefined) translations.set(u.key, t);
  }
  return markdownAdapter.write({ source, previous: null, translations }, c);
}

/** Reading a written file back gives the translations (or the English), segment by segment. */
function expectRoundTrip(
  source: string,
  map: (text: string, i: number) => string | undefined,
  c = ctx,
) {
  const units = read(source, c);
  const translations = new Map<string, string>();
  units.forEach((u, i) => {
    const t = map(u.text, i);
    if (t !== undefined) translations.set(u.key, t);
  });
  const target = markdownAdapter.write({ source, previous: null, translations }, c);
  const back = markdownAdapter.readTarget(target, c);
  expect(back.kind).toBe("ordered");
  expect(back.values).toEqual(units.map((u) => translations.get(u.key) ?? u.text));
}

const doc = `---
title: Quick start
description: "Give your \\"first\\" bot a task"
outline: deep
---

# Quick start {#quick-start}

Sign in, and give your first bot
a task. See [the guide](/guide/start).

![A bot at work](/art/bot.webp)

<!-- A comment
with a blank line

inside -->

<figure class="casama-shot"><img src="/a.png" alt="x"></figure>

<Badge type="tip" text="new" />

## 1. Install ##

- First item
- Second item with a
  continuation line
  1. Nested item
- [ ] A task
- [x] A done task

  A second paragraph in the item.

  \`\`\`sh
  # not a heading
  - not a list
  \`\`\`

1) Numbered

> Find the five frameworks and save
> a table to \`frameworks.md\`.
> > Nested quote

| Name | What it does | Count |
|------|:------------:|------:|
| **API** | Runs the \\| pipe | 12 |
| - | https://example.com | {{ count }} |

::: warning Be careful
Do not reset the database.
:::

::: details
Hidden text.
:::

~~~~md
~~~
# still code
::: tip Not a title
~~~~

    indented code
    | a | b |

$$
E = mc^2 \\text{ not words}
$$

[ref]: https://example.com "Title"

***

[[toc]]

<<< @/snippets/example.ts

> [!NOTE]
> Something to note.

Last line.
`;

describe("markdown read", () => {
  it("lists the segments in file order", () => {
    expect(texts(doc)).toEqual([
      "Quick start",
      'Give your "first" bot a task',
      "Quick start",
      "Sign in, and give your first bot a task. See [the guide](/guide/start).",
      "![A bot at work](/art/bot.webp)",
      "1. Install",
      "First item",
      "Second item with a continuation line",
      "Nested item",
      "A task",
      "A done task",
      "A second paragraph in the item.",
      "Numbered",
      "Find the five frameworks and save a table to `frameworks.md`.",
      "Nested quote",
      "Name",
      "What it does",
      "Count",
      "**API**",
      "Runs the | pipe",
      "Be careful",
      "Do not reset the database.",
      "Hidden text.",
      "Something to note.",
      "Last line.",
    ]);
  });

  it("sets kinds, tokens and front matter keys", () => {
    const [title, description, heading] = read(doc);
    expect(title).toEqual({ key: "fm.title", text: "Quick start", kind: "plain" });
    expect(description?.key).toBe("fm.description");
    expect(heading?.kind).toBe("markdown");
    expect(heading?.tokens).toEqual(["mustache"]);
    expect(heading?.key).toMatch(/^[0-9a-f]{8}$/);
  });

  it("keeps keys stable and numbers repeats", () => {
    const source = "Same text\n\nOther\n\nSame text\n";
    const keys = read(source).map((u) => u.key);
    expect(keys).toEqual(read(source).map((u) => u.key));
    expect(keys[2]).toBe(`${keys[0]}~2`);
  });

  it("translates the configured front matter fields only", () => {
    const source =
      "---\ntitle: Hi\ntagline: 'Bots''n more'\nsummary: >\n  block\nlayout: home\nhero:\n  text: Nested\n---\n";
    const c = { ...ctx, options: { frontMatter: ["tagline", "summary", "hero", "text"] } };
    expect(read(source, c).map((u) => [u.key, u.text])).toEqual([["fm.tagline", "Bots'n more"]]);
    expect(write(source, () => "L'été", c)).toContain("tagline: 'L''été'\n");
  });

  it("leaves letter-free segments and multi-line plain scalars alone", () => {
    expect(
      texts(
        "---\ntitle: a long\n  folded value\n---\n\n123\n\n{{ expr }}\n\nhttps://casama.ai\n\n![](/a.png)\n",
      ),
    ).toEqual([]);
  });

  it("ends a segment at a hard line break", () => {
    const source = "One  \ntwo\\\nthree\n";
    expect(texts(source)).toEqual(["One", "two", "three"]);
    expect(write(source, (t) => t.toUpperCase())).toBe("ONE  \nTWO\\\nTHREE\n");
  });

  it("does not end a paragraph at a wrapped number", () => {
    expect(texts("It started in\n2026. Then it grew.\n")).toEqual([
      "It started in 2026. Then it grew.",
    ]);
  });

  it("treats an inline tag followed by text as a paragraph", () => {
    expect(texts("<kbd>Esc</kbd> closes it.\n")).toEqual(["<kbd>Esc</kbd> closes it."]);
  });

  it("reads an unclosed fence to the end", () => {
    expect(texts("Text\n\n```\ncode\n\nmore code")).toEqual(["Text"]);
  });

  it("ends a fence with the quote that holds it", () => {
    expect(texts("> ```\n> code\n\nAfter\n")).toEqual(["After"]);
  });

  it("finds a list that comes back after a quote inside an item", () => {
    const source = "- item\n  - sub\n\n    > quoted\n\n    Still in the sub item.\n";
    expect(texts(source)).toEqual(["item", "sub", "quoted", "Still in the sub item."]);
  });

  it("keeps footnote markers outside the segment", () => {
    expect(write("Text[^1]\n\n[^1]: The note.\n", (t) => `[DE] ${t}`)).toBe(
      "[DE] Text[^1]\n\n[^1]: [DE] The note.\n",
    );
  });
});

describe("markdown write", () => {
  const crlf = doc.replace(/\n/g, "\r\n");

  it("returns the source byte for byte without translations", () => {
    for (const source of [doc, crlf, `﻿${doc}`, "", "no newline", "---\nnot front matter\n"])
      expect(write(source, () => undefined)).toBe(source);
  });

  it("swaps segments and nothing else", () => {
    const out = write(doc, (t) => `[DE] ${t}`);
    expect(out).toContain(
      '---\ntitle: "[DE] Quick start"\ndescription: "[DE] Give your \\"first\\" bot a task"\noutline: deep\n---\n',
    );
    expect(out).toContain("# [DE] Quick start {#quick-start}\n");
    expect(out).toContain(
      "\n[DE] Sign in, and give your first bot a task. See [the guide](/guide/start).\n\n",
    );
    expect(out).toContain("## [DE] 1. Install ##\n");
    expect(out).toContain(
      "- [DE] Second item with a continuation line\n  1. [DE] Nested item\n- [ ] [DE] A task\n- [x] [DE] A done task\n",
    );
    expect(out).toContain("\n  [DE] A second paragraph in the item.\n");
    expect(out).toContain(
      "> [DE] Find the five frameworks and save a table to `frameworks.md`.\n> > [DE] Nested quote\n",
    );
    expect(out).toContain(
      "| [DE] **API** | [DE] Runs the \\| pipe | 12 |\n| - | https://example.com | {{ count }} |\n",
    );
    expect(out).toContain("|------|:------------:|------:|\n");
    expect(out).toContain("::: warning [DE] Be careful\n[DE] Do not reset the database.\n:::\n");
    for (const untouched of [
      "  ```sh\n  # not a heading\n  - not a list\n  ```\n",
      "~~~~md\n~~~\n# still code\n::: tip Not a title\n~~~~\n",
      "    indented code\n    | a | b |\n",
      "$$\nE = mc^2 \\text{ not words}\n$$\n",
      "<!-- A comment\nwith a blank line\n\ninside -->\n",
      '<figure class="casama-shot"><img src="/a.png" alt="x"></figure>\n',
      '[ref]: https://example.com "Title"\n\n***\n\n[[toc]]\n\n<<< @/snippets/example.ts\n\n> [!NOTE]\n',
    ])
      expect(out).toContain(untouched);
  });

  it("keeps CRLF line endings", () => {
    const out = write(crlf, (t) => `[DE] ${t}`);
    expect(out).toBe(write(doc, (t) => `[DE] ${t}`).replace(/\n/g, "\r\n"));
    expect(out.replace(/\r\n/g, "")).not.toMatch(/[\r\n]/);
  });

  it("quotes an unquoted front matter value only when needed", () => {
    const source = "---\ntitle: Hello  # note\n---\n";
    expect(write(source, () => "Hallo Welt")).toBe("---\ntitle: Hallo Welt  # note\n---\n");
    expect(write(source, () => "Hallo: Welt")).toBe('---\ntitle: "Hallo: Welt"  # note\n---\n');
    expect(write(source, () => "C# lernen")).toBe('---\ntitle: "C# lernen"  # note\n---\n');
    expect(write(source, () => '"Hallo"')).toBe('---\ntitle: "\\"Hallo\\""  # note\n---\n');
  });

  it("escapes a translation that would start another block", () => {
    expect(write("On January 1 we start.\n", () => "1. Januar geht es los.")).toBe(
      "1\\. Januar geht es los.\n",
    );
    expect(write("- Minus\n", () => "- Strich")).toBe("- \\- Strich\n");
  });

  it("does not let a translation add lines", () => {
    expect(write("Hello\n", () => "Hal\nlo")).toBe("Hal lo\n");
  });

  it("reads a written file back segment by segment", () => {
    expectRoundTrip(doc, () => undefined);
    expectRoundTrip(crlf, (t) => `[DE] ${t}`);
    expectRoundTrip(doc, (t) => `こんにちは *${t}* \`code\` [link](/x) <em>強調</em>`);
    expectRoundTrip(doc, (t, i) => (i % 2 ? `„${t}“: #1` : undefined));
    expectRoundTrip(doc, (t) => `<strong>${t}</strong> a | b`);
    for (const lead of [
      "1. ",
      "2026) ",
      "- ",
      "* ",
      "+ ",
      "# ",
      "> ",
      "```",
      ":::tip ",
      "$$",
      "<div>",
      "[x]: ",
      "[^1]: ",
      "[[toc]] ",
      "<<< ",
      "[!TIP]",
    ])
      expectRoundTrip(doc, (t) =>
        lead === "[!TIP]" || lead === "[x]: " ? `${lead}Wort` : `${lead}Wort ${t}`,
      );
  });

  it("reads a table whose header cells are empty", () => {
    const source = "| | |\n|---|---|\n| Made by | Stackwares |\n| | Free |\n";
    expect(texts(source)).toEqual(["Made by", "Stackwares", "Free"]);
    expectRoundTrip(source, (t) => `[DE] ${t}`);
  });

  it("round-trips a table without outer pipes", () => {
    const source = "Name | Use\n---- | ---\nAPI | Serves\n\nAfter.\n";
    expect(texts(source)).toEqual(["Name", "Use", "API", "Serves", "After."]);
    expectRoundTrip(source, (t) => `- ${t} |`);
  });
});
