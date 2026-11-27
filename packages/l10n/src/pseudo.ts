/**
 * The pseudo-locale (`en-XA` by default): every string accented, about 40% longer and wrapped in
 * ⟦ ⟧, with placeholders, tags and code left alone. Text on screen without the brackets was never
 * localized; text cut off at the bracket doesn't fit. Written for tests and debug builds only; the
 * lock file never records it.
 */

import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname } from "node:path";
import { apostrophesFor, targetFile } from "./config.ts";
import { icuVariants, mapIcuLiterals, parseIcu, stringifyIcu } from "./icu.ts";
import type { Session } from "./session.ts";
import { targetContext } from "./state.ts";
import type { Unit } from "./types.ts";

/**
 * Only letters that common UI fonts draw (b, f, m, q, v and x stay plain): a letter a font lacks
 * is drawn by another face, or as an empty box in Flutter tests, and measures differently.
 */
const ACCENTS: Record<string, string> = {
  a: "á",
  c: "ç",
  d: "ð",
  e: "é",
  g: "ĝ",
  h: "ĥ",
  i: "í",
  j: "ĵ",
  k: "ķ",
  l: "ļ",
  n: "ñ",
  o: "ó",
  p: "þ",
  r: "ŕ",
  s: "š",
  t: "ť",
  u: "ú",
  w: "ŵ",
  y: "ý",
  z: "ž",
  A: "Á",
  C: "Ç",
  D: "Ð",
  E: "É",
  G: "Ĝ",
  H: "Ĥ",
  I: "Í",
  J: "Ĵ",
  K: "Ķ",
  L: "Ļ",
  N: "Ñ",
  O: "Ó",
  P: "Þ",
  R: "Ŕ",
  S: "Š",
  T: "Ť",
  U: "Ú",
  W: "Ŵ",
  Y: "Ý",
  Z: "Ž",
};

/** Parts of a text that must not change: placeholders, tags, entities, code, links, URLs. */
const PROTECTED =
  /<[^<>]*>|&[#\w]+;|`[^`]*`|\]\([^)]*\)|\{\{[^{}]*\}\}|\{#[^}]*\}|\{[A-Za-z0-9_.]*\}|%(?:\d+\$)?[-+0#]*\d*(?:\.\d+)?(?:ll|l|h)?[@dDiuUxXoOfFeEgGcCsS]|\$[A-Za-z0-9_]+\$|\$\d|https?:\/\/\S+|\\[nt"'\\]/g;

function accent(text: string): string {
  let out = "";
  let last = 0;
  for (const m of text.matchAll(PROTECTED)) {
    out += [...text.slice(last, m.index)].map((ch) => ACCENTS[ch] ?? ch).join("");
    out += m[0];
    last = (m.index ?? 0) + m[0].length;
  }
  return out + [...text.slice(last)].map((ch) => ACCENTS[ch] ?? ch).join("");
}

/** The padding: words with letters of ordinary widths, so lines wrap and measure like real text. */
const FILLER = "óñé ťŵó ťĥŕéé fóúŕ fívé šíx šévéñ éíĝĥť ñíñé ťéñ ";

/** About 40% of the text's letters more, as filler words. */
function pad(text: string): string {
  const letters = (text.match(/\p{L}/gu) ?? []).length;
  if (!letters) return "";
  const length = Math.max(1, Math.round(letters * 0.4));
  return ` ${FILLER.repeat(Math.ceil(length / FILLER.length))
    .slice(0, length)
    .trimEnd()}`;
}

/** The pseudo-locale version of one string. */
export function pseudoText(unit: Pick<Unit, "text" | "kind">, apostrophes = false): string {
  if (unit.kind === "icu") {
    try {
      const nodes = parseIcu(unit.text, { apostrophes });
      // Pad by the longest way through the message, so a plural gets padded too.
      const literal = (icuVariants(nodes) ?? []).reduce(
        (a, v) => (v.literal.length > a.length ? v.literal : a),
        "",
      );
      return `⟦${stringifyIcu(mapIcuLiterals(nodes, accent))}${pad(literal)}⟧`;
    } catch {
      // Not valid ICU: treat it as plain text.
    }
  }
  return `⟦${accent(unit.text)}${pad(unit.text)}⟧`;
}

/** Writes the pseudo-locale files for the chosen surfaces. Returns the files written. */
export function writePseudo(
  session: Session,
  opts: { surfaces?: string[]; locale?: string } = {},
): string[] {
  const project = session.project;
  const locale = opts.locale ?? project.locales.pseudo;
  if (!locale) throw new Error('Set "pseudo" in locales.json (such as "en-XA") or pass --locale.');
  const written: string[] = [];
  for (const surface of session.surfaces(opts.surfaces)) {
    for (const source of session.sources(surface)) {
      const target = targetFile(
        project,
        surface,
        source.file,
        locale,
        !!source.adapter.multiLocale,
      );
      const translations = new Map<string, string>();
      for (const u of source.units)
        translations.set(u.unitKey, pseudoText(u, apostrophesFor(surface)));
      const tctx = targetContext(source, locale, target.rel);
      const previous = existsSync(target.abs) ? readFileSync(target.abs, "utf8") : null;
      const out = source.adapter.write({ source: source.content, previous, translations }, tctx);
      if (out === previous) continue;
      mkdirSync(dirname(target.abs), { recursive: true });
      writeFileSync(target.abs, out);
      written.push(target.rel);
    }
  }
  return written;
}
