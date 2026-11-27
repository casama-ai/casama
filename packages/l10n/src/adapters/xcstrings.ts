/**
 * Xcode String Catalogs (`.xcstrings`): one JSON file holding every language. Units come from the
 * source language (or the key itself, when the key is its own English). A plural variation is one
 * ICU plural unit; a device variation is one unit per device, keyed `<key>#device.<name>`.
 *
 * Writing changes only the target locale's localizations and keeps Xcode's formatting: `"k" : v`,
 * empty objects over two lines, localizations and variations sorted, the order of `strings` as it
 * was, and a final newline only when the file already had one (Xcode writes none).
 *
 * Not supported yet, so these keys give no units and are never touched:
 * - `substitutions` (several plurals inside one string);
 * - `stringSet` (App Shortcuts phrase lists in `AppShortcuts.xcstrings`).
 */
import { icuToPlural, pluralToIcu } from "../icu.ts";
import { type Adapter, AdapterError, type Unit } from "../types.ts";

/** JSON with objects as Maps: a plain object would move keys such as "100" to the front. */
type Json = string | number | boolean | null | Json[] | JsonMap;
type JsonMap = Map<string, Json>;

/** One translatable place in a catalog entry. */
interface Slot {
  unitKey: string;
  device?: string;
  plural: boolean;
  /** The English text; an ICU plural when `plural`. */
  text: string;
}

const CATEGORIES = ["zero", "one", "two", "few", "many", "other"];
const PLURAL_NOTE =
  "Plural: give every plural category your language needs; keep %lld / %@ inside each branch.";

function parseJson(content: string, path: string): Json {
  const text = content.replace(/^\uFEFF/, "");
  try {
    JSON.parse(text); // for an error message about the file as it is
  } catch (e) {
    throw new AdapterError(path, `not valid JSON: ${(e as Error).message}`);
  }
  // Prefix every key, so none looks like an array index and the file's order survives.
  const marked = text.replace(
    /"[^"\\]*(?:\\.[^"\\]*)*"(\s*:)?/g,
    (token: string, colon?: string) => (colon === undefined ? token : `"~${token.slice(1)}`),
  );
  return JSON.parse(marked, (_key, value: unknown) =>
    value && typeof value === "object" && !Array.isArray(value)
      ? new Map(Object.entries(value).map(([k, v]) => [k.slice(1), v as Json]))
      : value,
  ) as Json;
}

/** Xcode's JSON style. */
function stringify(value: Json, indent: string): string {
  const inner = `${indent}  `;
  const block = (open: string, items: string[], close: string) =>
    `${open}\n${items.length ? items.map((i) => inner + i).join(",\n") : ""}\n${indent}${close}`;
  if (value instanceof Map) {
    const items = [...value].map(([k, v]) => `${JSON.stringify(k)} : ${stringify(v, inner)}`);
    return block("{", items, "}");
  }
  if (Array.isArray(value))
    return block(
      "[",
      value.map((v) => stringify(v, inner)),
      "]",
    );
  return JSON.stringify(value);
}

const asMap = (value: Json | undefined): JsonMap | undefined =>
  value instanceof Map ? value : undefined;

function at(value: Json | undefined, ...keys: string[]): Json | undefined {
  let node = value;
  for (const k of keys) node = asMap(node)?.get(k);
  return node;
}

/** Keys in code unit order, as Xcode sorts them ("zh-HK" before "zh-Hans"). */
function sorted(map: Iterable<[string, Json]>): JsonMap {
  return new Map([...map].sort(([a], [b]) => (a < b ? -1 : a > b ? 1 : 0)));
}

function parseCatalog(content: string, path: string, fallbackLanguage: string) {
  const doc = asMap(parseJson(content, path));
  const strings = asMap(doc?.get("strings"));
  if (!doc || !strings)
    throw new AdapterError(path, 'a string catalog must be a JSON object with "strings"');
  const entries: [string, JsonMap][] = [];
  for (const [key, value] of strings) {
    if (!(value instanceof Map)) throw new AdapterError(path, `${key} must be an object`);
    entries.push([key, value]);
  }
  const language = doc.get("sourceLanguage");
  return {
    doc,
    entries,
    sourceLanguage: typeof language === "string" ? language : fallbackLanguage,
  };
}

/** A string unit's value. In a translation, a "new" unit still holds the English: not one. */
function unitValue(node: Json | undefined, translated: boolean): string | undefined {
  const value = at(node, "stringUnit", "value");
  if (translated && at(node, "stringUnit", "state") === "new") return undefined;
  return typeof value === "string" ? value : undefined;
}

/** A plural variation's texts by category, in file order; undefined when there is none whole. */
function pluralCases(node: Json | undefined, translated: boolean): [string, string][] | undefined {
  const plural = asMap(at(node, "variations", "plural"));
  if (!plural?.size) return undefined;
  const cases: [string, string][] = [];
  for (const [category, branch] of plural) {
    const value = unitValue(branch, translated);
    if (value === undefined) return undefined;
    cases.push([category, value]);
  }
  return cases;
}

const toIcu = (cases: [string, string][]) => pluralToIcu("count", Object.fromEntries(cases));

/** The units one entry gives, judged by its source language. */
function slotsOf(key: string, entry: JsonMap, sourceLanguage: string): Slot[] {
  if (entry.get("shouldTranslate") === false) return [];
  const source = asMap(at(entry, "localizations", sourceLanguage));
  if (source?.has("substitutions") || source?.has("stringSet")) return [];

  const slot = (unitKey: string, node: Json | undefined, device?: string): Slot[] => {
    const cases = pluralCases(node, false);
    const text = cases ? toIcu(cases) : unitValue(node, false);
    if (!text) return [];
    return [{ unitKey, text, plural: cases !== undefined, ...(device ? { device } : {}) }];
  };

  if (!source?.has("variations")) {
    // No source text: the key is its own English.
    const text = unitValue(source, false) ?? key;
    return text ? [{ unitKey: key, text, plural: false }] : [];
  }
  const devices = asMap(at(source, "variations", "device"));
  if (!devices) return slot(key, source);
  return [...devices].flatMap(([name, node]) =>
    asMap(node)?.has("substitutions") ? [] : slot(`${key}#device.${name}`, node, name),
  );
}

/** The localization (or device variation) that holds one translation. */
function localized(slot: Slot, translation: string, path: string): JsonMap {
  const stringUnit = (value: string): JsonMap =>
    new Map([
      [
        "stringUnit",
        new Map([
          ["state", "translated"],
          ["value", value],
        ]),
      ],
    ]);
  if (!slot.plural) return stringUnit(translation);

  const plural = icuToPlural(translation);
  if (!plural)
    throw new AdapterError(path, `${slot.unitKey}: the translation must be one ICU plural message`);
  const cases = Object.entries(plural.cases);
  const unknown = cases.find(([category]) => !CATEGORIES.includes(category));
  if (unknown)
    throw new AdapterError(
      path,
      `${slot.unitKey}: string catalogs have no plural category ${unknown[0]}`,
    );
  if (!("other" in plural.cases))
    throw new AdapterError(path, `${slot.unitKey}: the plural has no "other" category`);
  const branches = sorted(cases.map(([category, value]) => [category, stringUnit(value)]));
  return new Map([["variations", new Map([["plural", branches]])]]);
}

/** Sets an entry's localizations, putting a new key where Xcode's sorted order has it. */
function setLocalizations(entry: JsonMap, localizations: JsonMap): void {
  if (entry.has("localizations")) {
    entry.set("localizations", localizations);
    return;
  }
  const pairs = [...entry];
  const after = pairs.findIndex(([k]) => k > "localizations");
  pairs.splice(after === -1 ? pairs.length : after, 0, ["localizations", localizations]);
  entry.clear();
  for (const [k, v] of pairs) entry.set(k, v);
}

export const xcstringsAdapter: Adapter = {
  id: "xcstrings",
  mode: "kv",
  multiLocale: true,

  read(content, ctx) {
    const { entries, sourceLanguage } = parseCatalog(content, ctx.path, ctx.sourceLocale);
    return entries.flatMap(([key, entry]) => {
      const comment = entry.get("comment");
      return slotsOf(key, entry, sourceLanguage).map((slot) => {
        const unit: Unit = {
          key: slot.unitKey,
          text: slot.text,
          kind: slot.plural ? "icu" : "plain",
          tokens: ["printf"],
        };
        if (typeof comment === "string" && comment.trim()) unit.description = comment.trim();
        if (slot.plural) unit.note = PLURAL_NOTE;
        return unit;
      });
    });
  },

  readTarget(content, ctx) {
    const { entries, sourceLanguage } = parseCatalog(content, ctx.path, ctx.sourceLocale);
    const values = new Map<string, string>();
    for (const [key, entry] of entries) {
      const target = asMap(at(entry, "localizations", ctx.mappedLocale));
      if (!target || target.has("substitutions")) continue;
      for (const slot of slotsOf(key, entry, sourceLanguage)) {
        const node = slot.device ? at(target, "variations", "device", slot.device) : target;
        // CLDR order, whatever order the file has, so a translation reads back as it was written.
        const cases = slot.plural
          ? pluralCases(node, true)?.sort(
              ([a], [b]) => CATEGORIES.indexOf(a) - CATEGORIES.indexOf(b),
            )
          : undefined;
        const value = slot.plural ? cases && toIcu(cases) : unitValue(node, true);
        if (value !== undefined) values.set(slot.unitKey, value);
      }
    }
    return { kind: "keys", values };
  },

  write(input, ctx) {
    const content = input.previous ?? input.source;
    const { doc, entries, sourceLanguage } = parseCatalog(content, ctx.path, ctx.sourceLocale);
    const locale = ctx.mappedLocale;
    if (locale === sourceLanguage)
      throw new AdapterError(ctx.path, `${locale} is the catalog's source language`);

    for (const [key, entry] of entries) {
      const done = slotsOf(key, entry, sourceLanguage).flatMap((slot) => {
        const t = input.translations.get(slot.unitKey);
        return t === undefined ? [] : [{ slot, node: localized(slot, t, ctx.path) }];
      });
      const first = done[0];
      if (!first) continue;
      const localizations: JsonMap = new Map(asMap(entry.get("localizations")));
      if (!first.slot.device) localizations.set(locale, first.node);
      else {
        // Devices without a new translation keep what they have.
        const devices: JsonMap = new Map(
          asMap(at(localizations.get(locale), "variations", "device")),
        );
        for (const { slot, node } of done) devices.set(slot.device as string, node);
        localizations.set(
          locale,
          new Map([["variations", new Map([["device", sorted(devices)]])]]),
        );
      }
      setLocalizations(entry, sorted(localizations));
    }

    const text = stringify(doc, "");
    return content.endsWith("\n") ? `${text}\n` : text;
  },
};
