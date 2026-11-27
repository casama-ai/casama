/**
 * Android string resources: `res/values/strings.xml` in, `res/values-<xx>/strings.xml` out.
 * Reads `<string>`, `<plurals>` (one ICU plural unit each) and `<string-array>` (one unit per
 * item, `name[0]`, `name[1]` …). A translated file holds only the translated entries, in the
 * source's order; Android falls back to the default resources for the rest.
 *
 * Unit text is what the app shows: Android escapes, quoting, whitespace collapsing and XML
 * entities are undone. Inline markup (`<b>`, `<xliff:g>`) stays as raw XML and makes the unit
 * "html". CDATA content is taken verbatim. Elements with `translatable="false"`, values that only
 * point at another resource (`@string/x`) and names in `options.skip` are left alone.
 *
 * Options:
 * - `skip` (string[]): resource names never to translate.
 */
import { icuToPlural, pluralToIcu } from "../icu.ts";
import { type Adapter, type AdapterContext, AdapterError, type Unit } from "../types.ts";

const PLURAL_NOTE =
  "Android plural: give every quantity your language needs; keep %d / %1$d in each.";
const QUANTITIES = new Set(["zero", "one", "two", "few", "many", "other"]);

// ---------------------------------------------------------------------------------------------
// A small XML reader: enough for resource files, keeping each tag as written.

interface XmlElement {
  type: "element";
  name: string;
  /** Name and raw (still XML-escaped) value, in source order. */
  attrs: [string, string][];
  /** The start tag as written. */
  open: string;
  /** The end tag as written; empty for a self-closing element. */
  close: string;
  children: XmlNode[];
}

type XmlNode = XmlElement | { type: "text" | "cdata" | "comment"; text: string };

const START_NAME = /<([^\s<>/!?="']+)/y;
const ATTRIBUTE = /\s+([^\s<>/="']+)\s*=\s*(?:"([^"]*)"|'([^']*)')/y;
const START_END = /\s*(\/?)>/y;
const END_TAG = /<\/([^\s<>/]+)\s*>/y;

function parseXml(content: string, path: string): XmlElement {
  const s = content.replace(/^\uFEFF/, "").replace(/\r\n?/g, "\n");
  const top: XmlElement = {
    type: "element",
    name: "",
    attrs: [],
    open: "",
    close: "",
    children: [],
  };
  const stack: XmlElement[] = [top];
  let i = 0;

  const fail = (what: string): never => {
    const line = s.slice(0, i).split("\n").length;
    throw new AdapterError(path, `not valid XML: ${what} (line ${line})`);
  };
  const add = (node: XmlNode) => (stack[stack.length - 1] as XmlElement).children.push(node);
  const match = (re: RegExp): RegExpExecArray | null => {
    re.lastIndex = i;
    const m = re.exec(s);
    if (m) i = re.lastIndex;
    return m;
  };
  /** Moves past `end`, returning what came between the opening marker and it. */
  const until = (opening: string, end: string): string => {
    const at = s.indexOf(end, i + opening.length);
    if (at === -1) fail(`${opening} is never closed`);
    const inner = s.slice(i + opening.length, at);
    i = at + end.length;
    return inner;
  };

  while (i < s.length) {
    if (s[i] !== "<") {
      const next = s.indexOf("<", i);
      const end = next === -1 ? s.length : next;
      add({ type: "text", text: s.slice(i, end) });
      i = end;
    } else if (s.startsWith("<!--", i)) add({ type: "comment", text: until("<!--", "-->") });
    else if (s.startsWith("<![CDATA[", i)) add({ type: "cdata", text: until("<![CDATA[", "]]>") });
    else if (s.startsWith("<?", i)) until("<?", "?>");
    else if (s.startsWith("<!", i)) until("<!", ">");
    else if (s.startsWith("</", i)) {
      const m = match(END_TAG) ?? fail("broken end tag");
      const el = stack.pop() as XmlElement;
      if (el === top || el.name !== m[1]) fail(`</${m[1]}> does not close <${el.name}>`);
      el.close = m[0];
    } else {
      const start = i;
      const name = (match(START_NAME) ?? fail("stray <"))[1] as string;
      const attrs: [string, string][] = [];
      for (let a = match(ATTRIBUTE); a; a = match(ATTRIBUTE))
        attrs.push([a[1] as string, a[2] ?? a[3] ?? ""]);
      const end = match(START_END) ?? fail(`broken <${name}> tag`);
      const el: XmlElement = {
        type: "element",
        name,
        attrs,
        open: s.slice(start, i),
        close: "",
        children: [],
      };
      add(el);
      if (!end[1]) stack.push(el);
    }
  }
  if (stack.length > 1) fail(`<${(stack[stack.length - 1] as XmlElement).name}> is never closed`);
  const roots = top.children.filter((n): n is XmlElement => n.type === "element");
  const root = roots[0];
  if (roots.length !== 1 || !root || root.name !== "resources")
    throw new AdapterError(path, "the root element must be <resources>");
  return root;
}

const ENTITY = /^&(lt|gt|amp|quot|apos|#[0-9]+|#x[0-9a-fA-F]+);/;
const NAMED: Record<string, string> = { lt: "<", gt: ">", amp: "&", quot: '"', apos: "'" };

/** The entity starting at `at`, as the character it stands for and its length; null if none. */
function entityAt(s: string, at: number): { char: string; length: number } | null {
  const m = ENTITY.exec(s.slice(at, at + 12));
  if (!m) return null;
  const body = m[1] as string;
  let char = NAMED[body];
  if (char === undefined) {
    const code = body[1] === "x" ? Number.parseInt(body.slice(2), 16) : Number(body.slice(1));
    if (code > 0x10ffff) return null;
    char = String.fromCodePoint(code);
  }
  return { char, length: m[0].length };
}

function decodeEntities(s: string): string {
  let out = "";
  for (let i = 0; i < s.length; i++) {
    const e = s[i] === "&" ? entityAt(s, i) : null;
    if (e) {
      out += e.char;
      i += e.length - 1;
    } else out += s[i];
  }
  return out;
}

// ---------------------------------------------------------------------------------------------
// Reading a value: XML entities, then Android's escapes, quotes and whitespace rules.

interface Value {
  text: string;
  /** Holds inline markup. */
  html: boolean;
  /** Written as one CDATA section. */
  cdata: boolean;
}

/** One character of a text node; `literal` ones came from an entity and mean only themselves. */
interface Char {
  c: string;
  literal: boolean;
}

function xmlChars(raw: string): Char[] {
  const out: Char[] = [];
  for (let i = 0; i < raw.length; ) {
    const e = raw[i] === "&" ? entityAt(raw, i) : null;
    if (e) {
      out.push({ c: e.char, literal: true });
      i += e.length;
    } else {
      const c = String.fromCodePoint(raw.codePointAt(i) as number);
      out.push({ c, literal: false });
      i += c.length;
    }
  }
  return out;
}

function decodeValue(el: XmlElement): Value {
  const html = el.children.some((n) => n.type === "element");
  const meaningful = el.children.filter(
    (n) => n.type !== "comment" && !(n.type === "text" && !n.text.trim()),
  );
  const cdata = meaningful.length === 1 && meaningful[0]?.type === "cdata";

  let out = "";
  let quoted = false;
  // Unquoted whitespace collapses to one space, and disappears at either end of the value.
  let space = false;
  const emit = (s: string) => {
    if (space && out) out += " ";
    space = false;
    out += s;
  };
  /** In markup, a literal `<` that would read as a tag has to stay an entity; so does `&amp;lt;`. */
  const literal = (c: string, rest: () => string) => {
    if (c === "&" && ENTITY.test(`&${rest()}`)) emit("&amp;");
    else if (c === "<" && html && /^[A-Za-z_/!?]/.test(rest())) emit("&lt;");
    else emit(c);
  };

  const text = (raw: string) => {
    const chars = xmlChars(raw);
    const rest = (from: number) => () =>
      chars
        .slice(from, from + 12)
        .map((x) => x.c)
        .join("");
    for (let i = 0; i < chars.length; i++) {
      const { c, literal: fromEntity } = chars[i] as Char;
      if (!fromEntity && c === "\\") {
        const next = chars[++i];
        if (!next) break;
        const hex = next.c === "u" ? /^[0-9a-fA-F]{4}/.exec(rest(i + 1)()) : null;
        if (hex) {
          i += 4;
          literal(String.fromCharCode(Number.parseInt(hex[0], 16)), rest(i + 1));
        } else if (next.c === "n") emit("\n");
        else if (next.c === "t") emit("\t");
        else literal(next.c, rest(i + 1));
      } else if (!fromEntity && c === '"') quoted = !quoted;
      else if (!fromEntity && !quoted && /[ \t\n]/.test(c)) space = true;
      else literal(c, rest(i + 1));
    }
  };

  const walk = (nodes: XmlNode[]) => {
    for (const n of nodes) {
      if (n.type === "text") {
        // Indentation around a lone CDATA section is not part of the value.
        if (!cdata || n.text.trim()) text(n.text);
      } else if (n.type === "cdata") emit(n.text);
      else if (n.type === "element") {
        emit(n.open);
        walk(n.children);
        if (n.close) emit(n.close);
      }
    }
  };
  walk(el.children);

  const markupInCdata = cdata && /<\/?[A-Za-z][^<>]*>/.test(out);
  return { text: out, html: html || markupInCdata, cdata };
}

/** True for a value that only points at another resource, such as `@string/app_name`. */
function isReference(el: XmlElement): boolean {
  if (el.children.some((n) => n.type === "element" || n.type === "cdata")) return false;
  const raw = el.children
    .map((n) => (n.type === "text" ? n.text : ""))
    .join("")
    .trim();
  return /^(?:@null|@empty|[@?][\w.:+]*\/[\w.]+|\?(?:[\w.]+:)?[A-Za-z_][\w.]*)$/.test(raw);
}

// ---------------------------------------------------------------------------------------------
// The resource entries of one file.

interface PluralItem {
  quantity: string;
  value: Value;
}

/** An array item: a translatable value, or a resource reference copied as it is. */
type ArrayItem = { value: Value } | { reference: string };

type Entry = { name: string; attrs: [string, string][]; description?: string } & (
  | { type: "string"; value: Value }
  | { type: "plurals"; items: PluralItem[] }
  | { type: "array"; items: ArrayItem[] }
);

const attr = (el: XmlElement, name: string): string | undefined => {
  const found = el.attrs.find(([n]) => n === name);
  return found ? decodeEntities(found[1]) : undefined;
};

const childItems = (el: XmlElement): XmlElement[] =>
  el.children.filter((n): n is XmlElement => n.type === "element" && n.name === "item");

function parseResources(
  content: string,
  ctx: AdapterContext,
): { root: XmlElement; entries: Entry[] } {
  const root = parseXml(content, ctx.path);
  const skip = new Set(Array.isArray(ctx.options.skip) ? (ctx.options.skip as unknown[]) : []);
  const entries: Entry[] = [];
  const seen = new Set<string>();
  let comment: string | undefined;

  for (const el of root.children) {
    if (el.type === "comment") comment = el.text.trim();
    if (el.type === "text" && el.text.trim()) comment = undefined;
    if (el.type !== "element") continue;
    const description = comment;
    comment = undefined;
    if (el.name !== "string" && el.name !== "plurals" && el.name !== "string-array") continue;
    const name = attr(el, "name");
    if (!name) throw new AdapterError(ctx.path, `a <${el.name}> has no name`);
    if (attr(el, "translatable") === "false" || skip.has(name)) continue;

    const base = { name, attrs: el.attrs, ...(description ? { description } : {}) };
    let entry: Entry;
    if (el.name === "string") {
      if (isReference(el)) continue;
      entry = { ...base, type: "string", value: decodeValue(el) };
    } else if (el.name === "plurals") {
      const items: PluralItem[] = childItems(el).map((item) => {
        const quantity = attr(item, "quantity");
        if (!quantity || !QUANTITIES.has(quantity))
          throw new AdapterError(
            ctx.path,
            `${name}: an <item> needs a quantity of ${[...QUANTITIES].join(", ")}`,
          );
        return { quantity, value: decodeValue(item) };
      });
      if (!items.length) continue;
      entry = { ...base, type: "plurals", items };
    } else {
      const items: ArrayItem[] = childItems(el).map((item) =>
        isReference(item)
          ? {
              reference: item.children
                .map((n) => (n.type === "text" ? n.text : ""))
                .join("")
                .trim(),
            }
          : { value: decodeValue(item) },
      );
      entry = { ...base, type: "array", items };
    }
    if (seen.has(name)) throw new AdapterError(ctx.path, `the name ${name} is used twice`);
    seen.add(name);
    entries.push(entry);
  }
  return { root, entries };
}

const pluralText = (items: PluralItem[]): string =>
  pluralToIcu("count", Object.fromEntries(items.map((i) => [i.quantity, i.value.text])));

/** Every translatable string of an entry, as unit key, text and whether it holds markup. */
function strings(entry: Entry): { key: string; text: string; html: boolean }[] {
  if (entry.type === "string") return [{ key: entry.name, ...entry.value }];
  if (entry.type === "plurals")
    return [
      {
        key: entry.name,
        text: pluralText(entry.items),
        html: entry.items.some((i) => i.value.html),
      },
    ];
  return entry.items.flatMap((item, n) =>
    "value" in item ? [{ key: `${entry.name}[${n}]`, ...item.value }] : [],
  );
}

// ---------------------------------------------------------------------------------------------
// Writing.

/** A start, end or self-closing tag inside a translated value. */
const INLINE_TAG =
  /<(\/?)([A-Za-z_][\w:.-]*)(?:\s+[\w:.-]+\s*=\s*(?:"[^"<]*"|'[^'<]*'))*\s*(\/?)>/g;

/** Android and XML escaping for a run of plain text. */
function escapeText(text: string): string {
  let out = "";
  for (let i = 0; i < text.length; i++) {
    const c = text[i] as string;
    if (c === "\\" || c === "'" || c === '"') out += `\\${c}`;
    else if (c === "\n") out += "\\n";
    else if (c === "\t") out += "\\t";
    else if (c < " ") out += `\\u${c.charCodeAt(0).toString(16).padStart(4, "0")}`;
    else if (c === "&") out += entityAt(text, i) ? "&" : "&amp;";
    else if (c === "<") out += "&lt;";
    else if (c === ">" && text.slice(i - 2, i) === "]]") out += "&gt;";
    else out += c;
  }
  return out;
}

/** The XML content of a `<string>` or `<item>` that Android reads back as `text`. */
function encodeValue(
  text: string,
  style: { html: boolean; cdata: boolean },
  fail: (why: string) => never,
): string {
  // CDATA is kept when the text can stand in it as it is. Android still reads quotes there (a bare
  // apostrophe breaks the build; a quotation mark outside a tag disappears), and XML cannot hold a
  // closing marker, a CR or other control characters, so such a translation is written escaped.
  const unfit = () =>
    text.includes("]]>") ||
    /(?<!\\)(?:\\\\)*'/.test(text) ||
    /(?<!\\)(?:\\\\)*"/.test(text.replace(INLINE_TAG, "")) ||
    [...text].some((c) => c < " " && c !== "\t" && c !== "\n");
  if (style.cdata && !unfit()) return `<![CDATA[${text}]]>`;

  const runs: string[] = [];
  let out = "";
  const run = (s: string) => {
    runs.push(s);
    out += escapeText(s);
  };
  if (style.html && !style.cdata) {
    const open: string[] = [];
    let last = 0;
    for (const m of text.matchAll(INLINE_TAG)) {
      const [tag, closing, name = "", selfClosing] = m;
      run(text.slice(last, m.index));
      out += tag;
      last = m.index + tag.length;
      if (closing) {
        if (open.pop() !== name) fail(`</${name}> has no matching <${name}>`);
      } else if (!selfClosing) open.push(name);
    }
    if (open.length) fail(`<${open[open.length - 1]}> is never closed`);
    run(text.slice(last));
  } else run(text);

  if (/^[@?]/.test(out)) out = `\\${out}`;
  // Android drops outer spaces and merges repeated ones unless the value is quoted.
  const quote = text.startsWith(" ") || text.endsWith(" ") || runs.some((r) => r.includes("  "));
  return quote ? `"${out}"` : out;
}

/** The source element's attributes, without `translatable` and the build tools' ones. */
function attributes(attrs: [string, string][]): string {
  return attrs
    .filter(([name]) => name !== "translatable" && !name.startsWith("tools:"))
    .map(([name, value]) => ` ${name}="${value.replace(/"/g, "&quot;")}"`)
    .join("");
}

export const androidStringsAdapter: Adapter = {
  id: "android-strings",
  mode: "kv",

  read(content, ctx) {
    const units: Unit[] = [];
    for (const entry of parseResources(content, ctx).entries) {
      for (const s of strings(entry)) {
        const plural = entry.type === "plurals";
        const unit: Unit = {
          key: s.key,
          text: s.text,
          kind: plural ? "icu" : s.html ? "html" : "plain",
          tokens: ["printf"],
        };
        if (entry.description) unit.description = entry.description;
        if (plural) unit.note = PLURAL_NOTE;
        units.push(unit);
      }
    }
    return units;
  },

  readTarget(content, ctx) {
    const values = new Map<string, string>();
    for (const entry of parseResources(content, ctx).entries)
      for (const s of strings(entry)) values.set(s.key, s.text);
    return { kind: "keys", values };
  },

  write(input, ctx) {
    const { root, entries } = parseResources(input.source, ctx);
    const namespaces = root.attrs.filter(([name]) => name.startsWith("xmlns:"));
    const lines = [
      '<?xml version="1.0" encoding="utf-8"?>',
      `<resources${attributes(namespaces)}>`,
    ];
    const failFor =
      (key: string) =>
      (why: string): never => {
        throw new AdapterError(ctx.path, `${key}: ${why}`);
      };

    for (const entry of entries) {
      const head = attributes(entry.attrs);
      if (entry.type === "string") {
        const t = input.translations.get(entry.name);
        if (t === undefined) continue;
        lines.push(
          `    <string${head}>${encodeValue(t, entry.value, failFor(entry.name))}</string>`,
        );
      } else if (entry.type === "plurals") {
        const t = input.translations.get(entry.name);
        if (t === undefined) continue;
        const fail = failFor(entry.name);
        const plural =
          icuToPlural(t) ?? fail("the translation must be one ICU plural, {count, plural, …}");
        lines.push(`    <plurals${head}>`);
        for (const [quantity, text] of Object.entries(plural.cases)) {
          if (!QUANTITIES.has(quantity)) fail(`Android has no plural quantity "${quantity}"`);
          // A quantity the English lacks (few, many) is written the way "other" is.
          const like =
            entry.items.find((i) => i.quantity === quantity) ??
            entry.items.find((i) => i.quantity === "other") ??
            (entry.items[0] as PluralItem);
          const markup = entry.items.some((i) => i.value.html && !i.value.cdata);
          const style = { html: markup, cdata: like.value.cdata };
          lines.push(
            `        <item quantity="${quantity}">${encodeValue(text, style, fail)}</item>`,
          );
        }
        lines.push("    </plurals>");
      } else {
        const keys = strings(entry).map((s) => s.key);
        if (!keys.length || !keys.every((k) => input.translations.has(k))) continue;
        lines.push(`    <string-array${head}>`);
        entry.items.forEach((item, n) => {
          const key = `${entry.name}[${n}]`;
          const body =
            "reference" in item
              ? item.reference
              : encodeValue(input.translations.get(key) as string, item.value, failFor(key));
          lines.push(`        <item>${body}</item>`);
        });
        lines.push("    </string-array>");
      }
    }
    lines.push("</resources>");
    return `${lines.join("\n")}\n`;
  },
};
