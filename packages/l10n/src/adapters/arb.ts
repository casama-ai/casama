/**
 * Flutter ARB files (Application Resource Bundle): a JSON object of ICU messages, with `@key`
 * metadata (description, placeholders) and `@@locale`. Only the template file carries metadata;
 * a translated file holds `@@locale` and the translated messages, in the template's key order.
 *
 * Options:
 * - `apostrophes` (default false): ICU apostrophe quoting, matching gen-l10n's `use-escaping`.
 */
import { type Adapter, AdapterError, type TargetContext, type Unit } from "../types.ts";

interface ArbMeta {
  description?: unknown;
  placeholders?: Record<string, { type?: unknown; example?: unknown }>;
  "x-maxLength"?: unknown;
}

function parseArb(content: string, path: string): Record<string, unknown> {
  let data: unknown;
  try {
    data = JSON.parse(content);
  } catch (e) {
    throw new AdapterError(path, `not valid JSON: ${(e as Error).message}`);
  }
  if (!data || typeof data !== "object" || Array.isArray(data))
    throw new AdapterError(path, "an ARB file must be a JSON object");
  return data as Record<string, unknown>;
}

/** gen-l10n wants `pt`, `zh_Hant`, `pt_BR`: underscores, never hyphens. */
export function arbLocale(code: string): string {
  return code.replace(/-/g, "_");
}

export const arbAdapter: Adapter = {
  id: "arb",
  mode: "kv",

  read(content, ctx) {
    const data = parseArb(content, ctx.path);
    const units: Unit[] = [];
    for (const [key, value] of Object.entries(data)) {
      if (key.startsWith("@")) continue;
      if (typeof value !== "string")
        throw new AdapterError(ctx.path, `${key} must be a string, not ${typeof value}`);
      const meta = (data[`@${key}`] ?? {}) as ArbMeta;
      const unit: Unit = { key, text: value, kind: "icu" };
      if (typeof meta.description === "string" && meta.description.trim())
        unit.description = meta.description.trim();
      if (meta.placeholders && typeof meta.placeholders === "object") {
        const ph: NonNullable<Unit["placeholders"]> = {};
        for (const [name, p] of Object.entries(meta.placeholders)) {
          const entry: { type?: string; example?: string } = {};
          if (p && typeof p.type === "string") entry.type = p.type;
          if (p && (typeof p.example === "string" || typeof p.example === "number"))
            entry.example = String(p.example);
          ph[name] = entry;
        }
        if (Object.keys(ph).length) unit.placeholders = ph;
      }
      if (typeof meta["x-maxLength"] === "number") unit.maxLength = meta["x-maxLength"];
      units.push(unit);
    }
    return units;
  },

  readTarget(content, ctx) {
    const data = parseArb(content, ctx.path);
    const values = new Map<string, string>();
    for (const [key, value] of Object.entries(data)) {
      if (key.startsWith("@")) continue;
      if (typeof value === "string") values.set(key, value);
    }
    return { kind: "keys", values };
  },

  write(input, ctx: TargetContext) {
    const source = parseArb(input.source, ctx.path);
    const out: Record<string, string> = { "@@locale": arbLocale(ctx.mappedLocale) };
    for (const key of Object.keys(source)) {
      if (key.startsWith("@")) continue;
      const t = input.translations.get(key);
      if (t !== undefined) out[key] = t;
    }
    return `${JSON.stringify(out, null, 2)}\n`;
  },
};
