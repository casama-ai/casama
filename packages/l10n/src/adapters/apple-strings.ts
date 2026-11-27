/**
 * Apple `.strings` files (`Localizable.strings`, `InfoPlist.strings`): `"key" = "value";` entries
 * with `/* … *\/` and `//` comments. Keys may also be bare identifiers. A translated file is the
 * source file's structure with the values replaced; an entry without a translation is left out,
 * together with its comment, so the system falls back to English.
 *
 * A comment belongs to an entry when no blank line separates them; it becomes the description.
 * Other comments (such as a file header followed by a blank line) are always kept.
 */
import { type Adapter, AdapterError, type Unit } from "../types.ts";

interface Entry {
  key: string;
  value: string;
  description: string;
  /** Start of the line that holds the entry's comment, or the entry itself. */
  start: number;
  /** The value as written, between its quotes. */
  valueStart: number;
  valueEnd: number;
  /** After the entry's last line, newline included. */
  end: number;
}

interface Comment {
  start: number;
  end: number;
}

const BARE_KEY = /[A-Za-z0-9_$.:/-]+/y;
/** Whatever follows the `;` on the same line (spaces and comments), with the newline. */
const REST_OF_LINE = /[ \t]*(?:\/\*(?:[^*]|\*(?!\/))*\*\/[ \t]*)*(?:\/\/[^\n]*)?(?:\r?\n|$)/y;
const BLANK_LINE = /\n[ \t\r]*\n/;

function parseStrings(content: string, path: string): { text: string; entries: Entry[] } {
  const text = content.replace(/^﻿/, "");
  const entries: Entry[] = [];
  let pos = 0;

  const fail = (message: string, at = pos): never => {
    const line = text.slice(0, at).split("\n").length;
    throw new AdapterError(path, `line ${line}: ${message}`);
  };

  /** Skips whitespace and comments, and returns the comments. */
  const trivia = (): Comment[] => {
    const comments: Comment[] = [];
    while (pos < text.length) {
      if (/\s/.test(text[pos] as string)) {
        pos++;
        continue;
      }
      const start = pos;
      if (text.startsWith("/*", pos)) {
        const close = text.indexOf("*/", pos + 2);
        if (close === -1) fail("a comment is never closed");
        pos = close + 2;
      } else if (text.startsWith("//", pos)) {
        while (pos < text.length && text[pos] !== "\n" && text[pos] !== "\r") pos++;
      } else break;
      comments.push({ start, end: pos });
    }
    return comments;
  };

  /** Reads a quoted string starting at `pos` and decodes its escapes. */
  const quoted = (): string => {
    const open = pos++;
    let out = "";
    while (pos < text.length) {
      const c = text[pos] as string;
      if (c === '"') {
        pos++;
        return out;
      }
      if (c !== "\\") {
        out += c;
        pos++;
        continue;
      }
      const next = text[pos + 1] ?? "";
      if (next === "U" || next === "u") {
        const hex = text.slice(pos + 2, pos + 6);
        if (!/^[0-9A-Fa-f]{4}$/.test(hex)) fail(`\\${next} needs four hex digits`);
        out += String.fromCharCode(Number.parseInt(hex, 16));
        pos += 6;
        continue;
      }
      // Any other escaped character, `\"` and `\\` included, stands for itself.
      out += next === "n" ? "\n" : next === "t" ? "\t" : next === "r" ? "\r" : next;
      pos += 2;
    }
    return fail("a string is never closed", open);
  };

  const key = (): string => {
    if (text[pos] === '"') return quoted();
    BARE_KEY.lastIndex = pos;
    const bare = BARE_KEY.exec(text)?.[0] ?? fail("expected a key");
    pos += bare.length;
    return bare;
  };

  const expect = (char: string) => {
    trivia();
    if (text[pos] !== char) fail(`expected ${char}`);
  };

  let previousEnd = 0;
  for (;;) {
    const comments = trivia();
    if (pos >= text.length) break;

    // The comments directly above the entry, walking up until a blank line.
    let top = pos;
    const attached: string[] = [];
    for (const c of comments.reverse()) {
      if (BLANK_LINE.test(text.slice(c.end, top))) break;
      attached.unshift(commentText(text.slice(c.start, c.end)));
      top = c.start;
    }
    const start = Math.max(previousEnd, text.lastIndexOf("\n", top - 1) + 1);

    const name = key();
    expect("=");
    pos++;
    expect('"');
    const valueStart = pos + 1;
    const value = quoted();
    const valueEnd = pos - 1;
    expect(";");
    pos++;
    REST_OF_LINE.lastIndex = pos;
    pos += (REST_OF_LINE.exec(text) ?? /^[ \t]*/.exec(text.slice(pos)))?.[0].length ?? 0;
    previousEnd = pos;

    const description = attached.filter(Boolean).join("\n");
    entries.push({ key: name, value, description, start, valueStart, valueEnd, end: pos });
  }
  return { text, entries };
}

/** A comment without its delimiters. */
function commentText(comment: string): string {
  const body = comment.startsWith("//") ? comment.slice(2) : comment.slice(2, -2);
  return body
    .split("\n")
    .map((line) => line.trim())
    .join("\n")
    .trim();
}

function encode(value: string): string {
  return value
    .replace(/\\/g, "\\\\")
    .replace(/"/g, '\\"')
    .replace(/\n/g, "\\n")
    .replace(/\r/g, "\\r")
    .replace(/\t/g, "\\t");
}

const hasComment = (trivia: string) => /\/[*/]/.test(trivia);

export const appleStringsAdapter: Adapter = {
  id: "apple-strings",
  mode: "kv",

  read(content, ctx) {
    const seen = new Set<string>();
    return parseStrings(content, ctx.path).entries.map((e) => {
      if (seen.has(e.key)) throw new AdapterError(ctx.path, `${e.key} appears twice`);
      seen.add(e.key);
      const unit: Unit = { key: e.key, text: e.value, kind: "plain", tokens: ["printf"] };
      if (e.description) unit.description = e.description;
      return unit;
    });
  },

  readTarget(content, ctx) {
    const { entries } = parseStrings(content, ctx.path);
    return { kind: "keys", values: new Map(entries.map((e) => [e.key, e.value])) };
  },

  write(input, ctx) {
    const { text, entries } = parseStrings(input.source, ctx.path);
    let out = "";
    let previousEnd = 0;
    let dropped = false;
    /** Adds the blank lines and comments between entries, without doubling a gap left by a drop. */
    const between = (trivia: string) => {
      const doubled = dropped && (out === "" || BLANK_LINE.test(out.slice(out.trimEnd().length)));
      out += doubled ? trivia.replace(/^(?:[ \t]*\r?\n)+/, "") : trivia;
    };

    for (const e of entries) {
      const lead = text.slice(previousEnd, e.start);
      previousEnd = e.end;
      const t = input.translations.get(e.key);
      if (t === undefined) {
        // The entry and its comment go; a free-standing comment above them stays.
        if (hasComment(lead)) between(lead);
        dropped = true;
        continue;
      }
      between(lead);
      // An unchanged value keeps its own spelling (such as a `\U00E9` escape).
      const value = t === e.value ? text.slice(e.valueStart, e.valueEnd) : encode(t);
      out += text.slice(e.start, e.valueStart) + value + text.slice(e.valueEnd, e.end);
      dropped = false;
    }

    const tail = text.slice(previousEnd);
    if (!dropped || hasComment(tail)) between(tail);
    else out = out.replace(/(\r?\n)(?:[ \t]*\r?\n)+$/, "$1");
    return out.endsWith("\n") ? out : `${out}\n`;
  },
};
