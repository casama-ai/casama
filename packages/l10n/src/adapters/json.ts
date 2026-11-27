/**
 * JSON key-value files: message catalogs (flat or nested) and overlays built from a list of
 * items, such as gallery catalogs.
 *
 * Options:
 * - `messageFormat`: "plain" (default) or "icu" (the server's message catalog).
 * - `apostrophes`: ICU apostrophe quoting (default true for "icu", as intl-messageformat does).
 * - `descriptions`: an `@name` entry beside `name` describes it, as in ARB files:
 *   `{ "title": "Done", "@title": { "description": "…", "placeholders": {…}, "maxLength": 40 } }`.
 *   `@` entries are never translated and never written to a target.
 * - `items`: read a list instead of a catalog: `{ "path": "items", "id": "id",
 *   "fields": ["name", "description", "examples", "document.capabilities"] }`. Each field may be a
 *   string or a list of strings. The target is an overlay: `{ "<id>": { "name": "…", … } }`.
 *
 * Keys are paths joined with ".", list positions included (`welcome.steps.0`). A target holds only
 * translated strings, in the source's shape; a list is written only when every entry in it is
 * translated, so a reader never gets a half-English list.
 */
import { type Adapter, type AdapterContext, AdapterError, type Unit } from "../types.ts";

type Json = null | boolean | number | string | Json[] | { [k: string]: Json };

interface ItemsOption {
  path?: string;
  id?: string;
  fields: string[];
}

function parse(content: string, path: string): Json {
  try {
    return JSON.parse(content) as Json;
  } catch (e) {
    throw new AdapterError(path, `not valid JSON: ${(e as Error).message}`);
  }
}

function isObject(v: Json | undefined): v is { [k: string]: Json } {
  return !!v && typeof v === "object" && !Array.isArray(v);
}

function getPath(value: Json | undefined, path: string): Json | undefined {
  if (!path) return value;
  let cur = value;
  for (const part of path.split(".")) {
    if (Array.isArray(cur)) cur = cur[Number(part)];
    else if (isObject(cur)) cur = cur[part];
    else return undefined;
  }
  return cur;
}

/** Every string leaf under `value`, keyed by its path below `prefix`. */
function leaves(value: Json | undefined, prefix: string, out: Map<string, string>): void {
  if (typeof value === "string") {
    out.set(prefix, value);
  } else if (Array.isArray(value)) {
    value.forEach((v, i) => {
      leaves(v, prefix ? `${prefix}.${i}` : String(i), out);
    });
  } else if (isObject(value)) {
    for (const [k, v] of Object.entries(value)) leaves(v, prefix ? `${prefix}.${k}` : k, out);
  }
}

/** What an `@name` entry says about the string beside it. */
type Meta = Pick<Unit, "description" | "placeholders" | "maxLength">;

/**
 * The catalog without its `@name` entries, which are collected into `meta` by the key they
 * describe. An entry that describes nothing is a mistake (a renamed or misspelled key).
 */
function takeMeta(value: Json, prefix: string, meta: Map<string, Meta>, path: string): Json {
  const below = (k: string) => (prefix ? `${prefix}.${k}` : k);
  if (Array.isArray(value)) return value.map((v, i) => takeMeta(v, below(String(i)), meta, path));
  if (!isObject(value)) return value;
  const out: { [k: string]: Json } = {};
  for (const [k, v] of Object.entries(value)) {
    if (!k.startsWith("@")) {
      out[k] = takeMeta(v, below(k), meta, path);
      continue;
    }
    const name = k.slice(1);
    if (typeof value[name] !== "string")
      throw new AdapterError(path, `"${below(k)}" describes no string named "${below(name)}"`);
    if (!isObject(v)) throw new AdapterError(path, `"${below(k)}" must be an object`);
    const entry: Meta = {};
    if (typeof v.description === "string") entry.description = v.description;
    if (isObject(v.placeholders))
      entry.placeholders = v.placeholders as NonNullable<Unit["placeholders"]>;
    if (typeof v.maxLength === "number") entry.maxLength = v.maxLength;
    meta.set(below(name), entry);
  }
  return out;
}

/** The source's shape with only translated strings; undefined when nothing is translated. */
function project(
  value: Json | undefined,
  prefix: string,
  t: Map<string, string>,
): Json | undefined {
  if (typeof value === "string") return t.get(prefix);
  if (Array.isArray(value)) {
    const items = value.map((v, i) => project(v, prefix ? `${prefix}.${i}` : String(i), t));
    return items.length && items.every((x) => x !== undefined) ? (items as Json[]) : undefined;
  }
  if (isObject(value)) {
    const out: { [k: string]: Json } = {};
    for (const [k, v] of Object.entries(value)) {
      const p = project(v, prefix ? `${prefix}.${k}` : k, t);
      if (p !== undefined) out[k] = p;
    }
    return Object.keys(out).length ? out : undefined;
  }
  return undefined;
}

function itemsOption(ctx: AdapterContext): ItemsOption | null {
  const raw = ctx.options.items as ItemsOption | undefined;
  if (!raw) return null;
  if (!Array.isArray(raw.fields) || !raw.fields.length)
    throw new AdapterError(ctx.path, "options.items.fields must list the fields to translate");
  return raw;
}

/** For items mode: the source's items as `{ id: { field: value } }`, in source order. */
function itemsAsOverlay(data: Json, ctx: AdapterContext, opt: ItemsOption): { [k: string]: Json } {
  const list = getPath(data, opt.path ?? "");
  if (!Array.isArray(list)) throw new AdapterError(ctx.path, `no list at "${opt.path ?? ""}"`);
  const idField = opt.id ?? "id";
  const out: { [k: string]: Json } = {};
  for (const item of list) {
    const id = isObject(item) ? item[idField] : undefined;
    if (typeof id !== "string" && typeof id !== "number") continue;
    const fields: { [k: string]: Json } = {};
    for (const f of opt.fields) {
      const v = getPath(item, f);
      if (v === undefined || v === null) continue;
      // Rebuild the field's nesting ("document.capabilities" → { document: { capabilities } }).
      const parts = f.split(".");
      let cur = fields;
      for (const p of parts.slice(0, -1)) {
        if (!isObject(cur[p])) cur[p] = {};
        cur = cur[p] as { [k: string]: Json };
      }
      cur[parts[parts.length - 1] as string] = v;
    }
    out[String(id)] = fields;
  }
  return out;
}

/** A catalog's strings: without its `@name` entries when the surface describes them that way. */
const catalog = (data: Json, ctx: AdapterContext, meta: Map<string, Meta>) =>
  ctx.options.descriptions === true ? takeMeta(data, "", meta, ctx.path) : data;

export const jsonAdapter: Adapter = {
  id: "json",
  mode: "kv",

  read(content, ctx) {
    const data = parse(content, ctx.path);
    const opt = itemsOption(ctx);
    const meta = new Map<string, Meta>();
    const shape = opt ? itemsAsOverlay(data, ctx, opt) : catalog(data, ctx, meta);
    const map = new Map<string, string>();
    leaves(shape, "", map);
    const icu = ctx.options.messageFormat === "icu";
    const units: Unit[] = [];
    for (const [key, text] of map) {
      if (!text.trim()) continue;
      units.push({
        ...meta.get(key),
        ...(icu ? { key, text, kind: "icu" } : { key, text, kind: "plain", tokens: ["brace"] }),
      });
    }
    return units;
  },

  readTarget(content, ctx) {
    const values = new Map<string, string>();
    leaves(catalog(parse(content, ctx.path), ctx, new Map()), "", values);
    return { kind: "keys", values };
  },

  write(input, ctx) {
    const data = parse(input.source, ctx.path);
    const opt = itemsOption(ctx);
    const shape = opt ? itemsAsOverlay(data, ctx, opt) : catalog(data, ctx, new Map());
    const out = project(shape, "", input.translations) ?? (Array.isArray(shape) ? [] : {});
    return `${JSON.stringify(out, null, 2)}\n`;
  },
};
