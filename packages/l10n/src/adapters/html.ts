/**
 * HTML pages and fragments. A small tokenizer builds a loose element tree, and writing swaps only
 * the translatable ranges of the source, so everything else stays byte-identical.
 *
 * A segment is either the inner HTML of a block with no blocks inside it, a run of text and inline
 * elements next to blocks, or the value of a translatable attribute. Attributes of elements that
 * sit inside a text segment are part of that segment's HTML (the translator changes them there).
 *
 * Options:
 * - `attributes` (default []): extra attribute names to translate on any element.
 * - `separate` (default []): containers, as tag names ("nav") or classes (".stores"), whose child
 *   elements are each their own segment. For rows of links and buttons with no sentence around
 *   them, which would otherwise be one long segment.
 */
import type { Adapter, AdapterContext, Unit } from "../types.ts";
import { segmentKey } from "../util.ts";

const set = (names: string) => new Set(names.split(" "));

const BLOCK = set(
  "address article aside blockquote details dialog dd div dl dt fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 header hgroup hr li main nav ol p pre section table tbody thead tfoot tr td th ul title head body html select option button summary label legend caption",
);
/** Never part of a sentence, so they also end a run of text. */
const APART = set("script style template textarea");
/** Their content is copied verbatim; their own attributes are still translated. */
const VERBATIM = set("script style code pre kbd samp svg math template textarea");
const VOID = set("area base br col embed hr img input keygen link meta param source track wbr");
/** Elements whose content is not markup. Only `title` holds text. */
const RAW = set("script style textarea title");
const TEXT_ATTRS = set("alt title placeholder aria-label aria-description");
const META_NAMES = set(
  "description og:title og:description twitter:title twitter:description apple-mobile-web-app-title",
);

/** Start tags that close an open element: [closes these, but not past one of these]. */
const CLOSES_P = set(
  "address article aside blockquote details div dl fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 header hgroup hr main menu nav ol p pre section table ul",
);
const IMPLIED_END: Record<string, [Set<string>, Set<string>]> = {
  li: [set("li"), set("ul ol menu")],
  dt: [set("dt dd"), set("dl")],
  dd: [set("dt dd"), set("dl")],
  tr: [set("tr"), set("table")],
  td: [set("td th"), set("tr table")],
  th: [set("td th"), set("tr table")],
  thead: [set("thead tbody tfoot"), set("table")],
  tbody: [set("thead tbody tfoot"), set("table")],
  tfoot: [set("thead tbody tfoot"), set("table")],
  option: [set("option"), set("select optgroup datalist")],
  optgroup: [set("optgroup"), set("select")],
  body: [set("head"), set("html")],
};

interface Attr {
  name: string;
  value: string;
  /** Range of the value, without its quotes. */
  start: number;
  end: number;
  quote: '"' | "'" | "";
}

interface Element {
  type: "element";
  name: string;
  attrs: Attr[];
  start: number;
  /** Where the content begins and ends (before the end tag). */
  openEnd: number;
  contentEnd: number;
  end: number;
  children: Node[];
}

/** Text, or something that is never text: a comment, a doctype, raw script, a stray end tag. */
type Node = Element | { type: "text" | "other"; start: number; end: number };

// ---------------------------------------------------------------------------------------------
// Parsing

/** Reads a start tag at `from` (a `<` followed by a letter). */
function readTag(
  src: string,
  from: number,
): { el: Element; selfClosing: boolean; complete: boolean } {
  const nameRe = /[^\s/>]+/y;
  nameRe.lastIndex = from + 1;
  const name = (nameRe.exec(src)?.[0] ?? "").toLowerCase();
  const attrs: Attr[] = [];
  const attrRe =
    /[\s/]*([^\s/>][^\s/>=]*)(?:\s*=\s*(?:"([^"]*)(?:"|$)|'([^']*)(?:'|$)|([^\s>]+)))?/y;
  let i = nameRe.lastIndex;
  for (;;) {
    attrRe.lastIndex = i;
    const m = attrRe.exec(src);
    if (!m) break;
    i = attrRe.lastIndex;
    const value = m[2] ?? m[3] ?? m[4];
    if (value === undefined) continue;
    const quote = m[2] !== undefined ? '"' : m[3] !== undefined ? "'" : "";
    // A quoted value ends before its closing quote, which the match includes.
    const end = quote && src[i - 1] === quote ? i - 1 : i;
    attrs.push({ name: (m[1] ?? "").toLowerCase(), value, start: end - value.length, end, quote });
  }
  const tail = /[\s/]*>/y;
  tail.lastIndex = i;
  const close = tail.exec(src)?.[0];
  const openEnd = close === undefined ? src.length : i + close.length;
  const el: Element = {
    type: "element",
    name,
    attrs,
    start: from,
    openEnd,
    contentEnd: openEnd,
    end: openEnd,
    children: [],
  };
  return { el, selfClosing: close?.includes("/") ?? false, complete: close !== undefined };
}

/** A loose tree: unclosed and stray tags are tolerated, as browsers do. */
function parse(src: string): Node[] {
  const root: Node[] = [];
  const stack: Element[] = [];
  const append = (node: Node) => (stack[stack.length - 1]?.children ?? root).push(node);
  /** Closes the element at `index` and everything opened inside it. */
  const closeFrom = (index: number, at: number) => {
    for (const el of stack.splice(index)) el.contentEnd = el.end = at;
  };
  /** The index just past `needle`, or the end of the input. */
  const past = (needle: string, from: number) => {
    const at = src.indexOf(needle, from);
    return at < 0 ? src.length : at + needle.length;
  };

  const markup = /<(?=[A-Za-z!?]|\/[A-Za-z])/g;
  let i = 0;
  while (i < src.length) {
    markup.lastIndex = i;
    const at = markup.exec(src)?.index ?? src.length;
    if (at > i) append({ type: "text", start: i, end: at });
    if (at >= src.length) break;

    if (src.startsWith("<!--", at)) {
      i = past("-->", at + 2);
      append({ type: "other", start: at, end: i });
    } else if (src[at + 1] === "!" || src[at + 1] === "?") {
      i = past(src.startsWith("<![CDATA[", at) ? "]]>" : ">", at);
      append({ type: "other", start: at, end: i });
    } else if (src[at + 1] === "/") {
      i = past(">", at);
      const name = /^<\/([^\s/>]+)/.exec(src.slice(at, i))?.[1]?.toLowerCase();
      let index = stack.length - 1;
      while (index >= 0 && stack[index]?.name !== name) index--;
      const el = stack[index];
      if (el) {
        closeFrom(index, at);
        el.end = i; // this one has a real end tag
      } else append({ type: "other", start: at, end: i });
    } else {
      const { el, selfClosing, complete } = readTag(src, at);
      i = el.openEnd;
      if (!complete) {
        append({ type: "other", start: at, end: src.length });
        break;
      }
      if (CLOSES_P.has(el.name) && stack[stack.length - 1]?.name === "p")
        closeFrom(stack.length - 1, at);
      const implied = IMPLIED_END[el.name];
      if (implied) {
        for (let index = stack.length - 1; index >= 0; index--) {
          const open = stack[index]?.name ?? "";
          if (implied[1].has(open)) break;
          if (implied[0].has(open)) {
            closeFrom(index, at);
            break;
          }
        }
      }
      append(el);
      if (VOID.has(el.name) || selfClosing) continue;
      if (RAW.has(el.name)) {
        const endTag = new RegExp(`</${el.name}(?=[\\s/>])`, "gi");
        endTag.lastIndex = i;
        const stop = endTag.exec(src)?.index ?? src.length;
        if (stop > i)
          el.children.push({ type: el.name === "title" ? "text" : "other", start: i, end: stop });
        el.contentEnd = stop;
        i = el.end = stop < src.length ? past(">", stop) : stop;
      } else stack.push(el);
    }
  }
  closeFrom(0, src.length);
  return root;
}

// ---------------------------------------------------------------------------------------------
// Segmenting

interface Segment {
  start: number;
  end: number;
  text: string;
  /** Set for an attribute value: its quote character ("" when the source has none). */
  quote?: '"' | "'" | "";
}

/** Whether there is anything to translate: a letter outside entities, URLs and `{{ … }}`. */
function hasLetters(text: string): boolean {
  return /\p{L}/u.test(text.replace(/\{\{[\s\S]*?\}\}|&#?\w+;|\bhttps?:\/\/\S+/g, " "));
}

/** Whitespace that spans lines becomes one space, so a unit's text is always one line. */
function oneLine(text: string): string {
  return text.replace(/[ \t\f\r\n]*[\r\n][ \t\f\r\n]*/g, " ");
}

const SPACE = /[ \t\f\r\n]/;

/** The entities that stand for a quote character inside a value delimited by it. */
const QUOTE_ENTITY = { '"': /&quot;/g, "'": /&#39;|&apos;/g } as const;

function segments(src: string, ctx: AdapterContext): Segment[] {
  const option = ctx.options.attributes;
  const extra = new Set(Array.isArray(option) ? option.map((a) => String(a).toLowerCase()) : []);
  const found: Segment[] = [];
  const list = Array.isArray(ctx.options.separate) ? ctx.options.separate.map(String) : [];
  const separate = new Set(list.map((s) => s.toLowerCase()));

  const attr = (el: Element, name: string) => el.attrs.find((a) => a.name === name)?.value;
  /** Marked by the author as not to be translated, subtree and attributes included. */
  const optedOut = (el: Element) =>
    attr(el, "translate")?.toLowerCase() === "no" ||
    (attr(el, "class")?.split(/\s+/).includes("notranslate") ?? false);
  const opaque = (el: Element) => optedOut(el) || VERBATIM.has(el.name);
  /** A container whose child elements are never joined into one segment. */
  const separates = (el: Element): boolean =>
    separate.has(el.name) ||
    !!attr(el, "class")
      ?.split(/\s+/)
      .some((c) => separate.has(`.${c.toLowerCase()}`));
  const isBlank = (node: Node) =>
    node.type === "text" && /^[ \t\f\r\n]*$/.test(src.slice(node.start, node.end));

  /** Whether an element must be handled as a block of its own. */
  const breaks = (el: Element): boolean =>
    BLOCK.has(el.name) || APART.has(el.name) || (!opaque(el) && hasBlockInside(el));
  const hasBlockInside = (el: Element): boolean =>
    el.children.some((c) => c.type === "element" && (separates(el) || breaks(c)));
  const hasText = (nodes: Node[]): boolean =>
    nodes.some((node) => {
      if (node.type === "text") return hasLetters(src.slice(node.start, node.end));
      return node.type === "element" && !opaque(node) && hasText(node.children);
    });

  /** The nodes without whitespace and comments, which stay outside a segment at its edges. */
  const significant = (nodes: Node[]) =>
    nodes.filter((node) => node.type !== "other" && !isBlank(node));
  /** One segment from the first to the last of these nodes, trimmed. */
  const addText = (parts: Node[]) => {
    let start = parts[0]?.start ?? 0;
    let end = parts[parts.length - 1]?.end ?? 0;
    while (start < end && SPACE.test(src[start] ?? "")) start++;
    while (end > start && SPACE.test(src[end - 1] ?? "")) end--;
    found.push({ start, end, text: oneLine(src.slice(start, end)) });
  };

  const addAttributes = (el: Element) => {
    const meta =
      el.name === "meta" ? (attr(el, "name") ?? attr(el, "property"))?.toLowerCase() : undefined;
    for (const a of el.attrs) {
      const wanted =
        TEXT_ATTRS.has(a.name) ||
        extra.has(a.name) ||
        (a.name === "label" && (el.name === "option" || el.name === "track")) ||
        (a.name === "content" && meta !== undefined && META_NAMES.has(meta));
      if (!wanted || !hasLetters(a.value)) continue;
      const text = a.quote ? a.value.replace(QUOTE_ENTITY[a.quote], a.quote) : a.value;
      found.push({ start: a.start, end: a.end, text: oneLine(text), quote: a.quote });
    }
  };

  const visit = (el: Element) => {
    if (optedOut(el)) return;
    addAttributes(el);
    if (VERBATIM.has(el.name)) return;
    if (!hasBlockInside(el) && hasText(el.children)) addText(significant(el.children));
    else visitChildren(el.children, separates(el));
  };

  /** Splits mixed content into blocks and the runs of inline content between them. */
  const visitChildren = (nodes: Node[], apart = false) => {
    let run: Node[] = [];
    const flush = () => {
      const parts = significant(run);
      run = [];
      // An element standing alone is its own segment, without its tags.
      const alone = parts.length === 1 && parts[0]?.type === "element";
      if (!alone && hasText(parts)) addText(parts);
      else for (const node of parts) if (node.type === "element") visit(node);
    };
    for (const node of nodes) {
      if (node.type === "element" && (apart || breaks(node))) {
        flush();
        visit(node);
      } else run.push(node);
    }
    flush();
  };

  visitChildren(parse(src));
  return found;
}

function encode(segment: Segment, translation: string): string {
  const text = translation.replace(/\s*[\r\n]+\s*/g, " ");
  if (segment.quote === undefined) return text;
  const quote = segment.quote || '"';
  const escaped = text.replaceAll(quote, quote === '"' ? "&quot;" : "&#39;");
  // A value that had no quotes gets them, since the translation may hold spaces.
  return segment.quote ? escaped : `"${escaped}"`;
}

function units(content: string, ctx: AdapterContext): { unit: Unit; segment: Segment }[] {
  const seen = new Map<string, number>();
  return segments(content, ctx).map((segment) => {
    const attribute = segment.quote !== undefined;
    const unit: Unit = {
      key: segmentKey(attribute ? "a." : "", segment.text, seen),
      text: segment.text,
      kind: attribute ? "plain" : "html",
    };
    return { unit, segment };
  });
}

export const htmlAdapter: Adapter = {
  id: "html",
  mode: "doc",

  read(content, ctx) {
    return units(content, ctx).map((u) => u.unit);
  },

  readTarget(content, ctx) {
    return { kind: "ordered", values: segments(content, ctx).map((s) => s.text) };
  },

  write(input, ctx) {
    let out = "";
    let copied = 0;
    for (const { unit, segment } of units(input.source, ctx)) {
      const translation = input.translations.get(unit.key);
      if (translation === undefined) continue;
      out += input.source.slice(copied, segment.start) + encode(segment, translation);
      copied = segment.end;
    }
    return out + input.source.slice(copied);
  },
};
