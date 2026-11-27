import { createHash } from "node:crypto";

/** A short, stable hash of a text (12 hex characters). */
export function hashText(text: string): string {
  return createHash("sha256").update(text, "utf8").digest("hex").slice(0, 12);
}

/**
 * The key of a document segment: a hash of its text, with `~2`, `~3` … for repeats in the same
 * file. Document adapters call it in file order with one `seen` map per file.
 */
export function segmentKey(prefix: string, text: string, seen: Map<string, number>): string {
  const base = `${prefix}${hashText(text).slice(0, 8)}`;
  const n = (seen.get(base) ?? 0) + 1;
  seen.set(base, n);
  return n === 1 ? base : `${base}~${n}`;
}

/** Length in Unicode code points, which is how store limits count. */
export function charLength(text: string): number {
  return [...text].length;
}

/** Display width: East Asian wide and full-width characters count as 2. */
export function displayWidth(text: string): number {
  let w = 0;
  for (const ch of text) {
    const c = ch.codePointAt(0) ?? 0;
    const wide =
      (c >= 0x1100 && c <= 0x115f) ||
      (c >= 0x2e80 && c <= 0xa4cf) ||
      (c >= 0xac00 && c <= 0xd7a3) ||
      (c >= 0xf900 && c <= 0xfaff) ||
      (c >= 0xfe30 && c <= 0xfe4f) ||
      (c >= 0xff00 && c <= 0xff60) ||
      (c >= 0xffe0 && c <= 0xffe6) ||
      (c >= 0x1f300 && c <= 0x1faff) ||
      (c >= 0x20000 && c <= 0x3fffd);
    w += wide ? 2 : 1;
  }
  return w;
}

/** Number of words, counting each CJK character as one word. */
export function wordCount(text: string): number {
  // Kana U+3040–30FF, CJK U+3400–9FFF and Hangul U+AC00–D7A3: one word per character.
  const cjk = text.match(/[぀-ヿ㐀-鿿가-힣]/g)?.length ?? 0;
  const rest = text.replace(/[぀-ヿ㐀-鿿가-힣]/g, " ");
  return cjk + (rest.match(/[\p{L}\p{N}][\p{L}\p{N}'’-]*/gu)?.length ?? 0);
}

/** A glob over plain names (keys): `*` matches anything, `?` one character. */
export function keyGlob(pattern: string): RegExp {
  const re = pattern
    .replace(/[.+^${}()|[\]\\]/g, "\\$&")
    .replace(/\*/g, ".*")
    .replace(/\?/g, ".");
  return new RegExp(`^${re}$`);
}

export function matchesAny(key: string, patterns: string[] | undefined): boolean {
  if (!patterns?.length) return false;
  return patterns.some((p) => keyGlob(p).test(key));
}

/** JSON with two-space indent and a final newline, as every file the kit writes. */
export function jsonText(value: unknown): string {
  return `${JSON.stringify(value, null, 2)}\n`;
}

/** Sorts an object's keys (for stable lock and memory files). */
export function sortedObject<T>(obj: Record<string, T>): Record<string, T> {
  const out: Record<string, T> = {};
  for (const k of Object.keys(obj).sort()) out[k] = obj[k] as T;
  return out;
}

/** The language subtag: "pt-BR" → "pt", "zh_Hant" → "zh". */
export function languageOf(locale: string): string {
  return (locale.split(/[-_]/)[0] ?? locale).toLowerCase();
}
