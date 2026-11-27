/**
 * CLDR plural categories per language, for whole numbers (what UI counts use).
 *
 * `required`: the categories a translation must give, or the grammar is wrong for some numbers.
 * `allowed`: categories the language can ever select. Spanish, French, Italian, Portuguese and
 * Catalan also have `many` (for 1,000,000 and compact numbers), allowed but not required.
 *
 * Source: CLDR plural rules (unicode.org/cldr/charts/latest/supplemental/language_plural_rules).
 */
import { languageOf } from "./util.ts";

interface PluralInfo {
  required: string[];
  allowed: string[];
}

const ONE_OTHER = ["one", "other"];
const OTHER = ["other"];

const TABLE: Record<string, string[]> = {
  // one/other
  en: ONE_OTHER,
  de: ONE_OTHER,
  nl: ONE_OTHER,
  sv: ONE_OTHER,
  da: ONE_OTHER,
  nb: ONE_OTHER,
  no: ONE_OTHER,
  fi: ONE_OTHER,
  et: ONE_OTHER,
  el: ONE_OTHER,
  hu: ONE_OTHER,
  bg: ONE_OTHER,
  tr: ONE_OTHER,
  hi: ONE_OTHER,
  bn: ONE_OTHER,
  ur: ONE_OTHER,
  fa: ONE_OTHER,
  sw: ONE_OTHER,
  fil: ONE_OTHER,
  tl: ONE_OTHER,
  ka: ONE_OTHER,
  az: ONE_OTHER,
  kk: ONE_OTHER,
  uz: ONE_OTHER,
  ta: ONE_OTHER,
  te: ONE_OTHER,
  ml: ONE_OTHER,
  mr: ONE_OTHER,
  gu: ONE_OTHER,
  kn: ONE_OTHER,
  af: ONE_OTHER,
  sq: ONE_OTHER,
  eu: ONE_OTHER,
  gl: ONE_OTHER,
  is: ONE_OTHER,
  mn: ONE_OTHER,
  es: ONE_OTHER,
  fr: ONE_OTHER,
  it: ONE_OTHER,
  pt: ONE_OTHER,
  ca: ONE_OTHER,
  // other only
  ja: OTHER,
  ko: OTHER,
  zh: OTHER,
  vi: OTHER,
  id: OTHER,
  ms: OTHER,
  th: OTHER,
  my: OTHER,
  km: OTHER,
  lo: OTHER,
  yue: OTHER,
  // more forms
  ru: ["one", "few", "many", "other"],
  uk: ["one", "few", "many", "other"],
  be: ["one", "few", "many", "other"],
  pl: ["one", "few", "many", "other"],
  lt: ["one", "few", "many", "other"],
  cs: ["one", "few", "other"],
  sk: ["one", "few", "other"],
  ro: ["one", "few", "other"],
  hr: ["one", "few", "other"],
  sr: ["one", "few", "other"],
  bs: ["one", "few", "other"],
  sl: ["one", "two", "few", "other"],
  he: ["one", "two", "other"],
  lv: ["zero", "one", "other"],
  ga: ["one", "two", "few", "many", "other"],
  ar: ["zero", "one", "two", "few", "many", "other"],
  cy: ["zero", "one", "two", "few", "many", "other"],
};

const ALSO_MANY = new Set(["es", "fr", "it", "pt", "ca"]);

/** Plural categories for a locale; unknown languages get one/other with everything allowed. */
export function pluralInfo(locale: string): PluralInfo & { known: boolean } {
  const lang = languageOf(locale);
  const required = TABLE[lang];
  if (!required)
    return {
      required: ["other"],
      allowed: ["zero", "one", "two", "few", "many", "other"],
      known: false,
    };
  const allowed = ALSO_MANY.has(lang) ? [...required, "many"] : required;
  return { required, allowed, known: true };
}

/** "one, few, many, other" — for the translator's notes. */
export function pluralHint(locale: string): string {
  const info = pluralInfo(locale);
  if (!info.known) return "";
  return info.required.join(", ");
}
