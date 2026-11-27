/**
 * Plain text files where the whole file is one string: store listing folders (fastlane style:
 * `name.txt`, `subtitle.txt`, `description.txt`, …). Use a glob source, and set limits per file
 * name in the surface's `limits` (`{ "name.txt": 30, "keywords.txt": 100 }`).
 *
 * Options:
 * - `maxLength`: a limit for every file of the surface.
 */
import type { Adapter, Unit } from "../types.ts";

/** The file's text without its final newline. */
function body(content: string): string {
  return content.replace(/\r?\n$/, "");
}

export const textAdapter: Adapter = {
  id: "text",
  mode: "kv",

  read(content, ctx) {
    const text = body(content);
    if (!text.trim()) return [];
    const unit: Unit = { key: "", text, kind: "plain" };
    if (typeof ctx.options.maxLength === "number") unit.maxLength = ctx.options.maxLength;
    return [unit];
  },

  readTarget(content) {
    return { kind: "keys", values: new Map([["", body(content)]]) };
  },

  write(input) {
    const t = input.translations.get("") ?? "";
    const eol = /\r\n$/.test(input.source) ? "\r\n" : /\n$/.test(input.source) ? "\n" : "";
    return t + eol;
  },
};
