import { describe, expect, it } from "vitest";
import { htmlAdapter } from "../src/adapters/html.ts";
import type { TargetContext } from "../src/types.ts";

const ctx: TargetContext = {
  options: {},
  sourceLocale: "en",
  path: "site/index.html",
  locale: "de",
  mappedLocale: "de",
};

const read = (source: string, c = ctx) => htmlAdapter.read(source, c);
const texts = (source: string, c = ctx) => read(source, c).map((u) => u.text);

function translationsFor(
  source: string,
  map: (text: string, i: number) => string | undefined,
  c = ctx,
) {
  const translations = new Map<string, string>();
  read(source, c).forEach((u, i) => {
    const t = map(u.text, i);
    if (t !== undefined) translations.set(u.key, t);
  });
  return translations;
}

const write = (source: string, map: (text: string, i: number) => string | undefined, c = ctx) =>
  htmlAdapter.write({ source, previous: null, translations: translationsFor(source, map, c) }, c);

/** Reading a written file back gives the translations (or the English), segment by segment. */
function expectRoundTrip(source: string, map: (text: string, i: number) => string | undefined) {
  const translations = translationsFor(source, map);
  const target = htmlAdapter.write({ source, previous: null, translations }, ctx);
  const back = htmlAdapter.readTarget(target, ctx);
  expect(back.kind).toBe("ordered");
  expect(back.values).toEqual(read(source).map((u) => translations.get(u.key) ?? u.text));
}

const pre = `<pre><code>npm install <b>casama</b>
  # Do not translate
</code></pre>`;
const script = `<script type="application/ld+json">{"name":"Download <p>Casama</p>"}</script>`;

const page = `<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Download Casama</title>
  <meta name="description" content="Get Casama on every device.">
  <meta property="og:title" content='Casama&#39;s apps'>
  <meta property="og:image" content="https://casama.ai/og.png">
  ${script}
  <style>p::before { content: "Hi"; }</style>
</head>
<body>
  <!-- <p>A comment</p> -->
  <header>
    <nav aria-label="Main">
      <a href="/" aria-label="Home page"><img src="/logo.svg" alt="Casama"> Casama</a>
      <a href="/pricing">Pricing</a>
    </nav>
  </header>
  <main>
    <h1><span class="ph">Your bots,</span>
      <span class="ph">everywhere.</span></h1>
    <p>Sign in once &amp; your bots are on <strong>every</strong>
       device.&nbsp;Run <code>casama login</code>.</p>
    ${pre}
    <p translate="no" title="Brand">Casama Engine</p>
    <div class="notranslate"><p>Keep me</p></div>
    <figure><img src="/a.webp" alt="A bot at its computer"><figcaption>Live view</figcaption></figure>
    <div>Hello <em>there</em><p>Inside</p> Goodbye</div>
    <ul>
      <li><a href="/ios">iPhone</a></li>
      <li><code>brew</code></li>
      <li>42 &times; 2</li>
    </ul>
    <form><input type="email" placeholder="Your email"><button>Join</button></form>
    <select><option value="1" label="One plan">Plus plan</option></select>
    <textarea placeholder="Your message">Prefilled</textarea>
    <svg viewBox="0 0 1 1" aria-label="Spinner"><title>Loading</title></svg>
  </main>
</body>
</html>
`;

describe("html read", () => {
  it("lists the segments of a page in document order", () => {
    expect(texts(page)).toEqual([
      "Download Casama",
      "Get Casama on every device.",
      "Casama's apps",
      "Main",
      '<a href="/" aria-label="Home page"><img src="/logo.svg" alt="Casama"> Casama</a> <a href="/pricing">Pricing</a>',
      '<span class="ph">Your bots,</span> <span class="ph">everywhere.</span>',
      "Sign in once &amp; your bots are on <strong>every</strong> device.&nbsp;Run <code>casama login</code>.",
      "A bot at its computer",
      "Live view",
      "Hello <em>there</em>",
      "Inside",
      "Goodbye",
      '<a href="/ios">iPhone</a>',
      "Your email",
      "Join",
      "One plan",
      "Plus plan",
      "Your message",
      "Spinner",
    ]);
  });

  it("marks text and attribute units, with stable keys", () => {
    const source = '<p title="Same">Same</p><p title="Same">Same</p>';
    const units = read(source);
    expect(units.map((u) => u.kind)).toEqual(["plain", "html", "plain", "html"]);
    expect(units[0]?.key).toMatch(/^a\.[0-9a-f]{8}$/);
    expect(units[2]?.key).toBe(`${units[0]?.key}~2`);
    expect(units[3]?.key).toBe(`${units[1]?.key}~2`);
    expect(read(source)).toEqual(units);
  });

  it("works on fragments", () => {
    expect(texts("Hello <b>world</b>")).toEqual(["Hello <b>world</b>"]);
    expect(texts('<a href="/x" title="Tip">Go</a>\n')).toEqual(["Tip", "Go"]);
    expect(texts("<span>One</span> <span>Two</span>")).toEqual([
      "<span>One</span> <span>Two</span>",
    ]);
    expect(texts("<p>if a < b, then</p>")).toEqual(["if a < b, then"]);
  });

  it("leaves comments at the edges of a segment outside it", () => {
    expect(
      texts("<nav><!-- a -->\n  <a>One</a> <!-- b --> <a>Two</a>\n  <!-- c --></nav>"),
    ).toEqual(["<a>One</a> <!-- b --> <a>Two</a>"]);
  });

  it("splits a link that wraps blocks", () => {
    expect(texts('<a href="/x"><h3>Title</h3><p>Body</p></a>')).toEqual(["Title", "Body"]);
  });

  it("closes paragraphs, list items and cells that have no end tag", () => {
    expect(
      texts(
        "<ul><li>One<li>Two</ul><p>Three<p>Four<table><tr><td>Five<td>Six<tr><td>Seven</table>",
      ),
    ).toEqual(["One", "Two", "Three", "Four", "Five", "Six", "Seven"]);
  });

  it("translates extra attributes from the options", () => {
    const source = '<div data-tip="Copy it" data-id="abc">x</div>';
    expect(texts(source)).toEqual(["x"]);
    expect(texts(source, { ...ctx, options: { attributes: ["data-tip"] } })).toEqual([
      "Copy it",
      "x",
    ]);
  });

  it("never throws on broken input", () => {
    for (const source of [
      "<p>Open",
      '<p title="x',
      "<!-- open",
      "<script>var a",
      "</p>Stray",
      "<",
      "<div><span></div>Text",
    ])
      expect(write(source, () => undefined)).toBe(source);
  });
});

describe("html write", () => {
  it("returns the source byte for byte without translations", () => {
    for (const source of [page, page.replace(/\n/g, "\r\n"), `﻿${page}`])
      expect(write(source, () => undefined)).toBe(source);
  });

  it("swaps segments and nothing else", () => {
    const out = write(page, (t) => `[DE] ${t}`);
    expect(out).toContain('<html lang="en">');
    expect(out).toContain("<title>[DE] Download Casama</title>");
    expect(out).toContain('<meta name="description" content="[DE] Get Casama on every device.">');
    expect(out).toContain("content='[DE] Casama&#39;s apps'>");
    expect(out).toContain('<nav aria-label="[DE] Main">\n      [DE] <a href="/"');
    expect(out).toContain(
      '<h1>[DE] <span class="ph">Your bots,</span> <span class="ph">everywhere.</span></h1>',
    );
    expect(out).toContain(
      'alt="[DE] A bot at its computer"><figcaption>[DE] Live view</figcaption>',
    );
    expect(out).toContain("<div>[DE] Hello <em>there</em><p>[DE] Inside</p> [DE] Goodbye</div>");
    expect(out).toContain('<li>[DE] <a href="/ios">iPhone</a></li>');
    expect(out).toContain('<textarea placeholder="[DE] Your message">Prefilled</textarea>');
    for (const untouched of [
      pre,
      script,
      '<style>p::before { content: "Hi"; }</style>',
      "<!-- <p>A comment</p> -->",
      '<p translate="no" title="Brand">Casama Engine</p>',
      '<div class="notranslate"><p>Keep me</p></div>',
      "<li><code>brew</code></li>\n      <li>42 &times; 2</li>",
      "<title>Loading</title></svg>",
    ])
      expect(out).toContain(untouched);
  });

  it("escapes the attribute's own quote and adds quotes where there were none", () => {
    expect(write('<img alt="x">', () => `Er sagt "ja" & 'nein'`)).toBe(
      `<img alt="Er sagt &quot;ja&quot; & 'nein'">`,
    );
    expect(write("<img alt='x'>", () => "L'été")).toBe("<img alt='L&#39;été'>");
    expect(write("<img alt=Logo>", () => "Das Logo")).toBe('<img alt="Das Logo">');
  });

  it("keeps the whitespace around a segment and writes one line", () => {
    expect(write("<p>\r\n  Hello\r\n  there\r\n</p>\r\n", () => "Hallo\ndu")).toBe(
      "<p>\r\n  Hallo du\r\n</p>\r\n",
    );
  });

  it("reads a written file back segment by segment", () => {
    expectRoundTrip(page, () => undefined);
    expectRoundTrip(page, (t) => `[DE] ${t}`);
    expectRoundTrip(page, (t) => `こんにちは *${t}* \`x\` <a href="/y">リンク</a> "q" 'r' a < b`);
    expectRoundTrip(page, (t, i) => (i % 2 ? `„${t}“` : undefined));
  });

  it("gives each child of a `separate` container its own segment", () => {
    const rows =
      '<nav><a href="/a">Alpha</a> <a href="/b">Beta</a></nav>' +
      '<div class="cta row"><a href="/c">Sign <b>in</b></a> <a href="/d">Get it</a></div>' +
      '<p>One <a href="/e">sentence</a> here.</p>';
    expect(texts(rows)).toHaveLength(3);
    const apart = { ...ctx, options: { separate: ["nav", ".cta"] } };
    expect(texts(rows, apart)).toEqual([
      "Alpha",
      "Beta",
      "Sign <b>in</b>",
      "Get it",
      'One <a href="/e">sentence</a> here.',
    ]);
    expect(write(rows, (t) => (t === "Beta" ? "Zwei" : undefined), apart)).toBe(
      rows.replace("Beta", "Zwei"),
    );
  });
});
