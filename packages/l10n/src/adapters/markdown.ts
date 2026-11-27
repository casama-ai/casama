/**
 * Markdown documents, including VitePress extras (front matter, `:::` containers, `{#anchors}`).
 * A line-based segmenter finds the translatable ranges; writing swaps only those ranges, so code,
 * markers and blank lines stay byte-identical. A wrapped paragraph is translated as one line.
 *
 * A translation that would start another kind of block at the start of a line ("1. Januar …") is
 * written with a backslash escape, and the segmenter drops that escape again when reading.
 *
 * Options:
 * - `frontMatter` (default ["title", "description"]): top-level front matter fields to translate.
 */
import type { Adapter, AdapterContext, Unit } from "../types.ts";
import { segmentKey } from "../util.ts";

/** One translatable range of the source. */
interface Segment {
  start: number;
  end: number;
  /** The unit text: one line, without escapes or quoting. */
  text: string;
  /** Front matter only: the field name and how its value is quoted. */
  field?: string;
  quote?: '"' | "'" | "";
  /** The range starts a block, so a translation may need a leading escape. */
  lead?: boolean;
  /** A table cell: pipes are escaped in the file. */
  cell?: boolean;
}

interface Line {
  start: number;
  text: string;
}

// ---------------------------------------------------------------------------------------------
// Block patterns. Each one is matched against a line without its indentation.

const FENCE = /^(`{3,}(?=[^`]*$)|~{3,})/;
const CONTAINER = /^:{3,}/;
const HEADING = /^(#{1,6})(?:[ \t]+|$)/;
const RULE = /^([-*_])(?:[ \t]*\1){2,}[ \t]*$/;
/** The underline of a `Title\n===` heading. */
const SETEXT = /^(?:=+|-+)[ \t]*$/;
const LIST = /^([-*+]|(\d{1,9})[.)])([ \t]+|$)/;
const TASK = /^\[[ xX]\](?:[ \t]+|$)/;
const REFERENCE =
  /^\[(?!\^)[^\]]+\]:[ \t]*(?:<[^>]*>|\S+)(?:[ \t]+(?:"[^"]*"|'[^']*'|\([^)]*\)))?[ \t]*$/;
const FOOTNOTE = /^\[\^[^\]\s]+\]:[ \t]*/;
/** VitePress snippet imports and the table of contents, and GitHub's `> [!NOTE]` marker. */
const DIRECTIVE = /^(?:<<<|\[\[toc\]\][ \t]*$|\[![A-Za-z]+\][ \t]*$)/i;
const TABLE_DELIMITER = /^\|?[ \t]*:?-+:?[ \t]*(?:\|[ \t]*:?-+:?[ \t]*)*\|?[ \t]*$/;

const BLOCK_TAGS =
  "address|article|aside|base|basefont|blockquote|body|caption|center|col|colgroup|dd|details|dialog|dir|div|dl|dt|fieldset|figcaption|figure|footer|form|frame|frameset|h[1-6]|head|header|hr|html|iframe|legend|li|link|main|menu|menuitem|nav|noframes|ol|optgroup|option|p|param|search|section|summary|table|tbody|td|tfoot|th|thead|title|tr|track|ul";
const ATTRIBUTE = `\\s+[^\\s"'=<>\`/]+(?:\\s*=\\s*(?:"[^"]*"|'[^']*'|[^\\s"'=<>\`]+))?`;

/** Raw HTML blocks, as CommonMark sorts them. `end: null` means "until a blank line". */
const HTML_BLOCKS: { open: RegExp; end: RegExp | null; interrupts: boolean }[] = [
  {
    open: /^<(?:script|pre|style|textarea)(?=\s|>|$)/i,
    end: /<\/(?:script|pre|style|textarea)>/i,
    interrupts: true,
  },
  { open: /^<!--/, end: /-->/, interrupts: true },
  { open: /^<\?/, end: /\?>/, interrupts: true },
  { open: /^<!\[CDATA\[/, end: /\]\]>/, interrupts: true },
  { open: /^<![A-Za-z]/, end: />/, interrupts: true },
  { open: new RegExp(`^</?(?:${BLOCK_TAGS})(?=\\s|/?>|$)`, "i"), end: null, interrupts: true },
  // Any other tag (or Vue component) alone on its line, or one that closes on a later line.
  {
    open: new RegExp(`^(?:<[A-Za-z][\\w.-]*(?:${ATTRIBUTE})*\\s*/?>|</[A-Za-z][\\w.-]*\\s*>)\\s*$`),
    end: null,
    interrupts: false,
  },
  { open: /^<[A-Za-z][\w.-]*(?:\s[^<>]*)?$/, end: null, interrupts: false },
];

/** Whether a line starting with this text would be something other than a paragraph. */
function startsBlock(text: string): boolean {
  return (
    [FENCE, CONTAINER, HEADING, RULE, SETEXT, LIST, REFERENCE, FOOTNOTE, DIRECTIVE].some((re) =>
      re.test(text),
    ) ||
    text.startsWith(">") ||
    text.startsWith("$$") ||
    HTML_BLOCKS.some((h) => h.open.test(text))
  );
}

function escapeLead(text: string): string {
  if (!startsBlock(text)) return text;
  // "1. x" is escaped at the dot, since a backslash before a digit means nothing.
  return /^\d{1,9}[.)]/.test(text) ? text.replace(/^(\d+)/, "$1\\") : `\\${text}`;
}

function unescapeLead(text: string): string {
  let plain = text;
  if (/^\d{1,9}\\[.)]/.test(text)) plain = text.replace("\\", "");
  else if (text.startsWith("\\")) plain = text.slice(1);
  return plain !== text && startsBlock(plain) ? plain : text;
}

/** Whether there is anything to translate: a letter outside URLs, tags and `{{ … }}`. */
function hasLetters(text: string): boolean {
  const rest = text
    .replace(/\{\{.*?\}\}/g, " ")
    .replace(/<!--.*?-->/g, " ")
    .replace(/<\/?[A-Za-z][^<>]*>/g, " ")
    .replace(/\]\((?:[^()]|\([^()]*\))*\)/g, "] ")
    .replace(/\bhttps?:\/\/\S+/g, " ")
    .replace(/&#?\w+;/g, " ");
  return /\p{L}/u.test(rest);
}

// ---------------------------------------------------------------------------------------------
// Front matter

const YAML_KEYWORD = /^(?:true|false|null|yes|no|on|off|~)$/i;

/** One `key: value` line with a single-line scalar, or null for anything else. */
function frontMatterValue(line: Line, next: Line | undefined, fields: Set<string>): Segment | null {
  const m = /^([^\s:#][^:]*):([ \t]+)(.*?)[ \t]*$/.exec(line.text);
  if (!m) return null;
  const [, field = "", gap = "", raw = ""] = m;
  if (!fields.has(field)) return null;
  const start = line.start + field.length + 1 + gap.length;

  const double = /^"((?:[^"\\]|\\.)*)"(?=$|[ \t]+#)/.exec(raw);
  if (double) {
    const inner = double[1] ?? "";
    // Other escapes (\n, \u…) can't be round-tripped safely, so such a value stays English.
    if (inner.replace(/\\["\\]/g, "").includes("\\")) return null;
    return {
      start,
      end: start + double[0].length,
      text: inner.replace(/\\(["\\])/g, "$1"),
      field,
      quote: '"',
    };
  }
  const single = /^'((?:[^']|'')*)'(?=$|[ \t]+#)/.exec(raw);
  if (single) {
    const text = (single[1] ?? "").replace(/''/g, "'");
    return { start, end: start + single[0].length, text, field, quote: "'" };
  }
  // Block scalars, lists, anchors and values that continue on the next line are left alone.
  if (/^["'|>[\]{}&*!#%@`]/.test(raw) || (next && /^[ \t]+\S/.test(next.text))) return null;
  const value = raw.replace(/[ \t]+#.*$/, "");
  if (YAML_KEYWORD.test(value)) return null;
  return { start, end: start + value.length, text: value, field, quote: "" };
}

function encodeFrontMatter(text: string, quote: '"' | "'" | ""): string {
  if (quote === "'") return `'${text.replace(/'/g, "''")}'`;
  const unsafe =
    /: |:$|#|^[\s\-?:,[\]{}&*!|>'"%@`]|\s$/.test(text) ||
    YAML_KEYWORD.test(text) ||
    /^[+.]?\d/.test(text);
  if (quote === "" && !unsafe) return text;
  return `"${text.replace(/["\\]/g, "\\$&")}"`;
}

// ---------------------------------------------------------------------------------------------
// Body

/** Columns of leading whitespace (a tab goes to the next multiple of 4). */
function indentOf(text: string): number {
  let n = 0;
  for (const ch of text) {
    if (ch === " ") n++;
    else if (ch === "\t") n += 4 - (n % 4);
    else break;
  }
  return n;
}

/** Removes up to `max` blockquote markers. Indented ones only count inside a list. */
function stripQuotes(
  text: string,
  max: number,
  inList: boolean,
): { offset: number; depth: number } {
  const marker = inList ? /^[ \t]*>[ \t]?/ : /^[ \t]{0,3}>[ \t]?/;
  let offset = 0;
  let depth = 0;
  while (depth < max) {
    const m = marker.exec(text.slice(offset));
    if (!m) break;
    offset += m[0].length;
    depth++;
  }
  return { offset, depth };
}

/** Trimmed ranges of the cells in a table row (empty ones too), split at unescaped pipes. */
function cellRanges(row: string): { start: number; end: number }[] {
  const cells: { start: number; end: number }[] = [];
  let from = 0;
  for (let i = 0; i <= row.length; i++) {
    if (row[i] === "\\" && i + 1 < row.length) i++;
    else if (i === row.length || row[i] === "|") {
      const piece = row.slice(from, i);
      const start = from + (piece.length - piece.trimStart().length);
      // Nothing before a leading pipe or after a trailing one is not a cell.
      const outer = (from === 0 || i === row.length) && !piece.trim();
      if (!outer) cells.push({ start, end: start + piece.trim().length });
      from = i + 1;
    }
  }
  return cells;
}

/** The part of a heading that is text: no closing `#`s and no `{#anchor}`. */
function headingText(text: string): string {
  const anchor = /[ \t]*\{#[^{}]*\}$/;
  return text
    .trimEnd()
    .replace(anchor, "")
    .replace(/(?:^|[ \t]+)#+$/, "")
    .replace(anchor, "");
}

interface Paragraph {
  start: number;
  end: number;
  parts: string[];
  depth: number;
  /** Set when it began on a list marker line: later lines must be indented past this. */
  itemIndent: number | null;
}

function segmentBody(lines: Line[], add: (s: Segment) => void): void {
  let para: Paragraph | null = null;
  let fence: { mark: string; indent: number; depth: number } | null = null;
  let html: { end: RegExp | null; depth: number } | null = null;
  let math: { depth: number } | null = null;
  let table: { depth: number } | null = null;
  let lists: number[] = []; // content columns of the open list items, outermost first
  let depth = 0; // blockquote nesting
  const outer: number[][] = []; // the lists left open at each shallower quote depth
  const inList = () => lists.length > 0 || outer.slice(0, depth).some((l) => l?.length);

  const flush = () => {
    if (!para) return;
    add({ start: para.start, end: para.end, text: unescapeLead(para.parts.join(" ")), lead: true });
    para = null;
  };
  const popLists = (indent: number) => {
    while (lists.length && (lists[lists.length - 1] ?? 0) > indent) lists.pop();
  };
  /** A quote has its own lists; the ones around it come back when it ends. */
  const setDepth = (to: number) => {
    if (to > depth) {
      outer.length = depth;
      outer[depth] = lists;
      lists = [];
    } else if (to < depth) lists = outer[to] ?? [];
    depth = to;
  };
  const addRow = (row: string, at: number) => {
    cellRanges(row).forEach((c, i) => {
      const raw = row.slice(c.start, c.end).replace(/\\\|/g, "|");
      const lead = i === 0 && c.start === 0;
      add({
        start: at + c.start,
        end: at + c.end,
        text: lead ? unescapeLead(raw) : raw,
        lead,
        cell: true,
      });
    });
  };

  for (let n = 0; n < lines.length; n++) {
    const line = lines[n] as Line;

    // Inside a code, HTML or math block only that block's own quote markers are stripped.
    const open: { depth: number } | null = fence ?? html ?? math;
    if (open) {
      const q = stripQuotes(line.text, open.depth, inList());
      if (q.depth === open.depth) {
        const rest = line.text.slice(q.offset);
        const body = rest.trimStart();
        if (fence) {
          const m = /^(`{3,}|~{3,})[ \t]*$/.exec(body);
          const mark = m?.[1] ?? "";
          if (
            mark[0] === fence.mark[0] &&
            mark.length >= fence.mark.length &&
            indentOf(rest) < fence.indent + 4
          )
            fence = null;
          continue;
        }
        if (math) {
          if (body.includes("$$")) math = null;
          continue;
        }
        if (html?.end) {
          if (html.end.test(body)) html = null;
          continue;
        }
        if (body) continue;
        html = null; // a blank line ends this kind of HTML block
      } else {
        fence = html = math = null; // the quote that held the block has ended
      }
    }

    const q = stripQuotes(line.text, Infinity, inList());
    let rest = line.text.slice(q.offset);
    let at = line.start + q.offset;
    if (q.depth !== depth) {
      flush();
      table = null;
      if (q.depth > depth) popLists(indentOf(line.text));
      setDepth(q.depth);
    }
    if (!rest.trim()) {
      flush();
      table = null;
      continue;
    }

    let indent = indentOf(rest);
    let onMarkerLine = false;
    let itemIndent = 0;

    // Indented code. It can't interrupt a paragraph, and inside a list it needs 4 more columns.
    const base = lists[lists.length - 1] ?? 0;
    if (!para && indent >= base + 4) {
      table = null;
      continue;
    }

    at += rest.length - rest.trimStart().length;
    rest = rest.trimStart();

    if (table) {
      if (rest.includes("|") && !startsBlock(rest)) {
        addRow(rest.trimEnd(), at);
        continue;
      }
      table = null;
    }

    // Loops only to look again at what follows a list marker or a quote marker on the same line.
    for (;;) {
      const fenced = FENCE.exec(rest);
      if (fenced) {
        flush();
        popLists(indent);
        fence = { mark: fenced[1] ?? "```", indent, depth };
        break;
      }
      if (CONTAINER.test(rest)) {
        flush();
        popLists(indent);
        // "::: tip Some title {open}": only the title is text.
        const m = /^(:{3,}[ \t]*[\w-]+[ \t]+)(.*)$/.exec(rest);
        if (m) {
          const title = (m[2] ?? "").trimEnd().replace(/[ \t]*\{[^{}]*\}$/, "");
          const start = at + (m[1] ?? "").length;
          if (title) add({ start, end: start + title.length, text: title });
        }
        break;
      }
      if (rest.startsWith("$$")) {
        flush();
        popLists(indent);
        if (!rest.slice(2).includes("$$")) math = { depth };
        break;
      }
      const raw = HTML_BLOCKS.find((h) => h.open.test(rest));
      if (raw && (raw.interrupts || !para)) {
        flush();
        popLists(indent);
        if (!raw.end?.test(rest)) html = { end: raw.end, depth };
        break;
      }
      if (DIRECTIVE.test(rest)) {
        flush();
        break;
      }
      const heading = HEADING.exec(rest);
      if (heading) {
        flush();
        popLists(indent);
        const text = headingText(rest.slice(heading[0].length));
        const start = at + heading[0].length;
        if (text) add({ start, end: start + text.length, text });
        break;
      }
      if (RULE.test(rest) || (para && SETEXT.test(rest))) {
        flush();
        popLists(indent);
        break;
      }
      if (!para && REFERENCE.test(rest)) break;
      const footnote = para ? null : FOOTNOTE.exec(rest);
      if (footnote) {
        at += footnote[0].length;
        rest = rest.slice(footnote[0].length);
        if (!rest) break;
        onMarkerLine = true;
        itemIndent = indent;
      }

      const item = LIST.exec(rest);
      if (item) {
        const [whole, marker = "", number, space = ""] = item;
        const empty = rest.length === whole.length;
        // Inside a wrapped paragraph, "2026. " is just text. A sibling item may use any number.
        const sibling = lists.length > 0 && indent < (lists[lists.length - 1] ?? 0);
        if (!para || sibling || (!empty && (number === undefined || number === "1"))) {
          flush();
          popLists(indent);
          const column = indent + marker.length + (empty || space.length > 4 ? 1 : space.length);
          lists.push(column);
          let skip = whole.length;
          skip += TASK.exec(rest.slice(skip))?.[0].length ?? 0;
          at += skip;
          rest = rest.slice(skip);
          onMarkerLine = true;
          itemIndent = indent;
          indent = column;
          const inner = stripQuotes(rest, Infinity, true);
          if (inner.depth) {
            setDepth(depth + inner.depth);
            at += inner.offset;
            rest = rest.slice(inner.offset);
          }
          if (!rest.trim()) break;
          continue;
        }
      }

      // A table starts with a row followed by a delimiter row with as many cells.
      const next = lines[n + 1];
      if (rest.includes("|") && next) {
        const nq = stripQuotes(next.text, depth, inList());
        const delimiter = next.text.slice(nq.offset).trim();
        if (
          nq.depth === depth &&
          delimiter.includes("|") &&
          TABLE_DELIMITER.test(delimiter) &&
          cellRanges(delimiter).length === cellRanges(rest.trimEnd()).length
        ) {
          flush();
          addRow(rest.trimEnd(), at);
          table = { depth };
          n++; // the delimiter row
          break;
        }
      }

      // A paragraph line.
      if (para && !onMarkerLine && para.itemIndent !== null && indent <= para.itemIndent) flush();
      let text = rest.trimEnd();
      // Two trailing spaces or a backslash force a line break, which ends the segment.
      let hardBreak = / {2,}$/.test(rest);
      if ((/\\+$/.exec(text)?.[0].length ?? 0) % 2 === 1) {
        text = text.slice(0, -1).trimEnd();
        hardBreak = true;
      }
      if (text) {
        if (para) {
          para.parts.push(text);
          para.end = at + text.length;
        } else {
          if (!onMarkerLine) popLists(indent);
          para = {
            start: at,
            end: at + text.length,
            parts: [text],
            depth,
            itemIndent: onMarkerLine ? itemIndent : null,
          };
        }
      }
      if (hardBreak) flush();
      break;
    }
  }
  flush();
}

/** Every translatable range of a document, in file order. */
function segments(content: string, ctx: AdapterContext): Segment[] {
  const lines: Line[] = [];
  let offset = content.startsWith("\uFEFF") ? 1 : 0;
  for (const raw of content.slice(offset).split("\n")) {
    lines.push({ start: offset, text: raw.replace(/\r$/, "") });
    offset += raw.length + 1;
  }

  const found: Segment[] = [];
  const add = (s: Segment) => {
    if (hasLetters(s.text)) found.push(s);
  };

  let body = 0;
  if (lines[0]?.text.trimEnd() === "---") {
    const close = lines.findIndex((l, i) => i > 0 && l.text.trimEnd() === "---");
    if (close > 0) {
      const option = ctx.options.frontMatter;
      const fields = new Set(Array.isArray(option) ? option.map(String) : ["title", "description"]);
      for (let i = 1; i < close; i++) {
        const next = i + 1 < close ? lines[i + 1] : undefined;
        const value = frontMatterValue(lines[i] as Line, next, fields);
        if (!value) continue;
        add(value);
        fields.delete(value.field ?? ""); // one unit per field
      }
      body = close + 1;
    }
  }
  segmentBody(lines.slice(body), add);
  return found;
}

function encode(segment: Segment, translation: string): string {
  const text = translation.replace(/\s*[\r\n]+\s*/g, " "); // a segment is always one line
  if (segment.quote !== undefined) return encodeFrontMatter(text, segment.quote);
  const led = segment.lead ? escapeLead(text) : text;
  return segment.cell ? led.replace(/\\?\|/g, "\\|") : led;
}

function units(content: string, ctx: AdapterContext): { unit: Unit; segment: Segment }[] {
  const seen = new Map<string, number>();
  return segments(content, ctx).map((segment) => {
    const { text, field } = segment;
    const unit: Unit =
      field !== undefined
        ? { key: `fm.${field}`, text, kind: "plain" }
        : { key: segmentKey("", text, seen), text, kind: "markdown", tokens: ["mustache"] };
    return { unit, segment };
  });
}

export const markdownAdapter: Adapter = {
  id: "markdown",
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
