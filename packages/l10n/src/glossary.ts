/**
 * The glossary (`l10n/glossary.json`). English is the source; each term says how it is handled:
 *
 * ```json
 * {
 *   "version": 1,
 *   "sourceLocale": "en",
 *   "locales": ["es", "pt-BR", "fr", "de", "ja", "ko"],
 *   "terms": [
 *     {
 *       "id": "brief",
 *       "term": "brief",
 *       "variants": ["briefs", "morning brief"],
 *       "rule": "translate-once-then-fixed",
 *       "caseSensitive": false,
 *       "definition": "A short summary a bot sends, usually in the morning.",
 *       "notes": "Never a bare ブリーフ in Japanese.",
 *       "translations": {
 *         "ja": { "term": "ブリーフィング", "forms": { "plural": "ブリーフィング" }, "avoid": ["ブリーフ"], "notes": "…", "reviewed": "sonnet-5.5" }
 *       }
 *     }
 *   ]
 * }
 * ```
 *
 * Rules:
 * - `keep`: never translated. A string whose English has the term must keep it exactly (error).
 * - `translate-once-then-fixed`: `translations.<locale>.term` (or one of its `forms`) must appear
 *   where the English uses the term (a warning, since grammar can change the word).
 * - `translate`: no fixed form; the definition and notes guide the translator.
 *
 * `avoid` words are checked only in strings whose English uses the term: an avoided word where
 * the fixed rendering is missing is an error; next to the fixed rendering it is a warning (the
 * string may mention something else, such as a server next to a computer).
 */
import { readFileSync } from "node:fs";
import { languageOf } from "./util.ts";

export type GlossaryRule = "keep" | "translate-once-then-fixed" | "translate";

export interface TermTranslation {
  term?: string;
  forms?: Record<string, string>;
  avoid?: string[];
  notes?: string;
  reviewed?: string | boolean;
}

export interface GlossaryTerm {
  id?: string;
  term: string;
  variants: string[];
  rule: GlossaryRule;
  caseSensitive: boolean;
  partOfSpeech?: string;
  category?: string;
  definition?: string;
  context?: string;
  notes?: string;
  translations: Record<string, TermTranslation>;
}

export interface Glossary {
  version: number;
  sourceLocale: string;
  locales: string[];
  terms: GlossaryTerm[];
}

export const EMPTY_GLOSSARY: Glossary = { version: 1, sourceLocale: "en", locales: [], terms: [] };

const RULES = new Set<GlossaryRule>(["keep", "translate-once-then-fixed", "translate"]);

export class GlossaryError extends Error {
  constructor(path: string, problems: string[]) {
    super(
      `${path} doesn't match the glossary format (packages/l10n/README.md, "Glossary"):\n  ${problems.slice(0, 20).join("\n  ")}${problems.length > 20 ? `\n  … and ${problems.length - 20} more` : ""}`,
    );
    this.name = "GlossaryError";
  }
}

const isObj = (v: unknown): v is Record<string, unknown> =>
  !!v && typeof v === "object" && !Array.isArray(v);
const isStrings = (v: unknown): v is string[] =>
  Array.isArray(v) && v.every((x) => typeof x === "string");

/** Checks and normalises a parsed glossary. Throws GlossaryError listing every problem. */
export function parseGlossary(raw: unknown, path = "glossary.json"): Glossary {
  const problems: string[] = [];
  if (!isObj(raw)) throw new GlossaryError(path, ["the top level must be an object"]);
  if (!Array.isArray(raw.terms)) throw new GlossaryError(path, ['"terms" must be a list']);
  if (raw.locales !== undefined && !isStrings(raw.locales))
    problems.push('"locales" must be a list of locale codes');
  const terms: GlossaryTerm[] = [];
  raw.terms.forEach((t, i) => {
    const where = isObj(t) && typeof t.id === "string" ? `terms[${i}] (${t.id})` : `terms[${i}]`;
    if (!isObj(t)) {
      problems.push(`${where} must be an object`);
      return;
    }
    if (typeof t.term !== "string" || !t.term.trim())
      problems.push(`${where}.term must be a non-empty string`);
    if (typeof t.rule !== "string" || !RULES.has(t.rule as GlossaryRule))
      problems.push(`${where}.rule must be one of ${[...RULES].join(", ")}`);
    if (t.variants !== undefined && !isStrings(t.variants))
      problems.push(`${where}.variants must be a list of strings`);
    if (t.caseSensitive !== undefined && typeof t.caseSensitive !== "boolean")
      problems.push(`${where}.caseSensitive must be true or false`);
    if (t.translations !== undefined && !isObj(t.translations))
      problems.push(`${where}.translations must be an object`);
    const translations: Record<string, TermTranslation> = {};
    for (const [locale, tr] of Object.entries(isObj(t.translations) ? t.translations : {})) {
      const at = `${where}.translations.${locale}`;
      if (!isObj(tr)) {
        problems.push(`${at} must be an object ({ term, forms, avoid, notes, reviewed })`);
        continue;
      }
      if (tr.term !== undefined && typeof tr.term !== "string")
        problems.push(`${at}.term must be a string`);
      if (tr.avoid !== undefined && !isStrings(tr.avoid))
        problems.push(`${at}.avoid must be a list of strings`);
      if (tr.notes !== undefined && typeof tr.notes !== "string")
        problems.push(`${at}.notes must be a string`);
      if (
        tr.forms !== undefined &&
        !(isObj(tr.forms) && Object.values(tr.forms).every((f) => typeof f === "string"))
      )
        problems.push(`${at}.forms must map names to strings`);
      translations[locale] = tr as TermTranslation;
    }
    for (const field of ["id", "partOfSpeech", "category", "definition", "context", "notes"])
      if (t[field] !== undefined && typeof t[field] !== "string")
        problems.push(`${where}.${field} must be a string`);
    terms.push({
      ...(typeof t.id === "string" ? { id: t.id } : {}),
      term: String(t.term ?? ""),
      variants: isStrings(t.variants) ? t.variants : [],
      rule: t.rule as GlossaryRule,
      caseSensitive: t.caseSensitive === true,
      ...(typeof t.partOfSpeech === "string" ? { partOfSpeech: t.partOfSpeech } : {}),
      ...(typeof t.category === "string" ? { category: t.category } : {}),
      ...(typeof t.definition === "string" ? { definition: t.definition } : {}),
      ...(typeof t.context === "string" ? { context: t.context } : {}),
      ...(typeof t.notes === "string" ? { notes: t.notes } : {}),
      translations,
    });
  });
  if (problems.length) throw new GlossaryError(path, problems);
  return {
    version: typeof raw.version === "number" ? raw.version : 1,
    sourceLocale: typeof raw.sourceLocale === "string" ? raw.sourceLocale : "en",
    locales: isStrings(raw.locales) ? raw.locales : [],
    terms,
  };
}

/** Loads the glossary. A missing file is an empty glossary; a malformed one is an error. */
export function loadGlossary(path: string | null): Glossary {
  if (!path) return EMPTY_GLOSSARY;
  let text: string;
  try {
    text = readFileSync(path, "utf8");
  } catch (e) {
    if ((e as NodeJS.ErrnoException).code === "ENOENT") return EMPTY_GLOSSARY;
    throw e;
  }
  let raw: unknown;
  try {
    raw = JSON.parse(text);
  } catch (e) {
    throw new GlossaryError(path, [`not valid JSON: ${(e as Error).message}`]);
  }
  return parseGlossary(raw, path);
}

function escapeRe(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

/** The term's entry for a locale ("pt-BR", then "pt"). */
export function translationFor(term: GlossaryTerm, locale: string): TermTranslation | undefined {
  return term.translations[locale] ?? term.translations[languageOf(locale)];
}

/** Every accepted rendering of a term in a locale: the term and its forms. */
export function renderingsFor(term: GlossaryTerm, locale: string): string[] {
  const t = translationFor(term, locale);
  if (!t) return term.rule === "keep" ? [term.term] : [];
  const out = [t.term, ...Object.values(t.forms ?? {})].filter((x): x is string => !!x?.trim());
  return [...new Set(out)];
}

export function avoidFor(term: GlossaryTerm, locale: string): string[] {
  return translationFor(term, locale)?.avoid ?? [];
}

/** True when an English text uses the term or one of its variants (whole words, simple plurals). */
export function usesTerm(text: string, term: GlossaryTerm): boolean {
  const flags = term.caseSensitive ? "u" : "iu";
  return [term.term, ...term.variants].some((w) =>
    new RegExp(`(^|[^\\p{L}\\p{N}])${escapeRe(w)}(s|es)?(?=$|[^\\p{L}\\p{N}])`, flags).test(text),
  );
}

/** True when a text contains a kept name, exactly as written. */
export function containsName(text: string, name: string): boolean {
  return new RegExp(`(^|[^\\p{L}\\p{N}])${escapeRe(name)}(?=$|[^\\p{L}\\p{N}])`, "u").test(text);
}

/** Text without placeholders and ICU syntax, so `{bot}` or `{n, plural,` never count as words. */
export function withoutPlaceholders(text: string): string {
  return text
    .replace(/\{\s*[A-Za-z0-9_]+\s*,\s*[A-Za-z]+\s*,?/g, " ")
    .replace(/\{[A-Za-z0-9_.]*\}|%(?:\d+\$)?[@a-zA-Z]|\$[A-Za-z0-9_]+\$/g, " ");
}

/** Names kept as written (rule "keep"), longest first. */
export function keptNames(glossary: Glossary): string[] {
  return glossary.terms
    .filter((t) => t.rule === "keep")
    .map((t) => t.term)
    .sort((a, b) => b.length - a.length);
}

export interface GlossaryHit {
  en: string;
  rule: GlossaryRule;
  target?: string;
  forms?: Record<string, string>;
  avoid: string[];
  note?: string;
}

/** Glossary entries that apply to an English text, for the packet. */
export function glossaryHits(
  glossary: Glossary,
  text: string,
  locale: string,
): { keep: string[]; terms: GlossaryHit[] } {
  const keep: string[] = [];
  const terms: GlossaryHit[] = [];
  text = withoutPlaceholders(text);
  for (const t of glossary.terms) {
    if (t.rule === "keep") {
      if (containsName(text, t.term)) keep.push(t.term);
      continue;
    }
    if (!usesTerm(text, t)) continue;
    const tr = translationFor(t, locale);
    const note = [t.definition, tr?.notes ?? t.notes].filter(Boolean).join(" ");
    const hit: GlossaryHit = { en: t.term, rule: t.rule, avoid: tr?.avoid ?? [] };
    if (tr?.term) hit.target = tr.term;
    if (tr?.forms && Object.keys(tr.forms).length) hit.forms = tr.forms;
    if (note) hit.note = note;
    terms.push(hit);
  }
  return { keep, terms };
}
