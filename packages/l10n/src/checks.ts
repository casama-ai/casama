/**
 * The checks every translation goes through before it is written (`apply`) and again in `check`.
 * Errors block a string; warnings are recorded and shown to the reviewer.
 */
import {
  avoidFor,
  containsName,
  type Glossary,
  keptNames,
  renderingsFor,
  usesTerm,
  withoutPlaceholders,
} from "./glossary.ts";
import {
  type IcuArg,
  type IcuNode,
  type IcuVariant,
  icuArguments,
  icuBranchingArgs,
  icuVariants,
  parseIcu,
} from "./icu.ts";
import { pluralInfo } from "./plural.ts";
import type { TokenSet, Unit } from "./types.ts";
import { charLength, displayWidth, languageOf } from "./util.ts";

export type Severity = "error" | "warning";

export interface Issue {
  severity: Severity;
  code: string;
  message: string;
}

export interface CheckOptions {
  locale: string;
  sourceLocale?: string;
  glossary?: Glossary;
  /** A limit from the surface config; the smaller of this and the unit's own wins. */
  maxLength?: number;
  /** The translation may equal the English (names, codes). */
  sameAllowed?: boolean;
  /** ICU apostrophe quoting (see IcuOptions). */
  apostrophes?: boolean;
}

const TOKEN_PATTERNS: Record<TokenSet, RegExp> = {
  brace: /\{[A-Za-z0-9_.]*\}/g,
  printf: /%(?:\d+\$)?[-+0#]*\d*(?:\.\d+)?(?:hh|h|ll|l|q|L|z|j|t)?[@dDiuUxXoOfFeEgGcCsSpaA]|%%/g,
  chrome: /\$[A-Za-z0-9_]+\$|\$\d/g,
  mustache: /\{\{[^{}]*\}\}/g,
};

/** Languages written mostly without Latin letters: leftover English stands out in them. */
const NON_LATIN = new Set([
  "ja",
  "ko",
  "zh",
  "yue",
  "ar",
  "he",
  "fa",
  "ur",
  "hi",
  "bn",
  "ta",
  "te",
  "ml",
  "mr",
  "gu",
  "kn",
  "th",
  "lo",
  "km",
  "my",
  "ru",
  "uk",
  "be",
  "bg",
  "sr",
  "mk",
  "el",
  "ka",
  "hy",
  "am",
]);

const VOID_TAGS = new Set([
  "br",
  "img",
  "hr",
  "wbr",
  "input",
  "meta",
  "link",
  "source",
  "area",
  "col",
  "embed",
  "track",
]);
const TRANSLATABLE_ATTRS =
  /\s(alt|title|aria-label|aria-description|placeholder|label)\s*=\s*("[^"]*"|'[^']*')/gi;

export function checkTranslation(unit: Unit, target: string, opts: CheckOptions): Issue[] {
  const issues: Issue[] = [];
  const add = (severity: Severity, code: string, message: string) => {
    if (!issues.some((i) => i.code === code && i.message === message))
      issues.push({ severity, code, message });
  };

  if (!target.trim()) {
    add("error", "empty", "The translation is empty.");
    return issues;
  }

  const source = unit.text;
  // A document segment with no letters vanishes when the page is read back, which would shift
  // every later segment, so it is never accepted.
  if (
    (unit.kind === "markdown" || unit.kind === "html") &&
    /\p{L}/u.test(source) &&
    !/\p{L}/u.test(target)
  ) {
    add("error", "no-letters", "The translation has no words in it.");
    return issues;
  }
  let srcIcu: IcuNode[] | null = null;
  let tgtIcu: IcuNode[] | null = null;
  if (unit.kind === "icu") {
    try {
      srcIcu = parseIcu(source, { apostrophes: opts.apostrophes });
    } catch {
      srcIcu = null; // A broken source message: compare it as plain text instead.
    }
    if (srcIcu) {
      try {
        tgtIcu = parseIcu(target, { apostrophes: opts.apostrophes });
      } catch (e) {
        add("error", "icu-syntax", `The ICU message doesn't parse: ${(e as Error).message}.`);
        return issues;
      }
      compareIcu(srcIcu, tgtIcu, unit, opts.locale, add);
    }
  }

  // Placeholder tokens other than ICU arguments.
  const tokenSets: TokenSet[] = [...(unit.tokens ?? [])];
  if (unit.kind === "plain" && !unit.tokens) tokenSets.push("brace");
  if (unit.kind === "markdown" && !tokenSets.includes("mustache")) tokenSets.push("mustache");
  if (srcIcu && tgtIcu)
    compareVariantTokens(
      srcIcu,
      tgtIcu,
      tokenSets.filter((t) => t !== "brace"),
      add,
    );
  else compareTokens(source, target, tokenSets, add);

  if (unit.kind === "html" || unit.kind === "markdown" || /<\/?[A-Za-z][^<>]*>/.test(source))
    compareTags(source, target, add);
  if (unit.kind === "markdown") compareMarkdown(source, target, add);
  if (unit.kind !== "icu" || !srcIcu) {
    // Document segments are one line, and a single-line string must stay one line. Longer text
    // (a store description) may reflow a little, so a different count there is only a warning.
    const lines = (s: string) => s.split("\n").length;
    const ls = lines(source);
    const lt = lines(target);
    if (ls !== lt) {
      const severity: Severity =
        unit.kind === "markdown" || ls === 1 || lt === 1 ? "error" : "warning";
      add(severity, "line-breaks", `The English has ${ls} line(s); the translation has ${lt}.`);
    }
  }

  // Length.
  const limits = [unit.maxLength, opts.maxLength].filter((n): n is number => typeof n === "number");
  if (limits.length) {
    const max = Math.min(...limits);
    const len = tgtIcu ? longestVariant(tgtIcu) : charLength(target);
    if (len > max) add("error", "too-long", `${len} characters; the limit is ${max}.`);
  }
  const plainSource = source.replace(/\{[^{}]*\}/g, "").trim();
  if (
    !srcIcu?.some((n) => typeof n !== "string") &&
    plainSource.split(/\s+/).filter(Boolean).length <= 3 &&
    displayWidth(target) > 8 &&
    displayWidth(target) > displayWidth(source) * 1.6
  ) {
    add(
      "warning",
      "long-label",
      `Much longer than the English label (${displayWidth(target)} vs ${displayWidth(source)} wide); look for a shorter word.`,
    );
  }

  // Leading and trailing whitespace.
  if (/^\s/.test(source) !== /^\s/.test(target) || /\s$/.test(source) !== /\s$/.test(target))
    add("warning", "whitespace", "Leading or trailing spaces differ from the English.");

  // Left in English.
  const sameLanguage = languageOf(opts.locale) === languageOf(opts.sourceLocale ?? "en");
  if (!sameLanguage && !opts.sameAllowed && target.trim() === source.trim()) {
    const words = translatableWords(source, opts.glossary);
    // Short labels are often the same in both ("Name (optional)", "Check-in {time}"): a person
    // or the review pass decides. Longer text left in English is a miss.
    if (words > 3) add("error", "untranslated", "The translation is the English text unchanged.");
    else if (words >= 1)
      add(
        "warning",
        "untranslated",
        "The translation is the English text unchanged; fine only if the language uses the same words.",
      );
  }
  if (!sameLanguage && NON_LATIN.has(languageOf(opts.locale))) {
    const run = englishRun(target, opts.glossary);
    if (run) add("warning", "english-left", `English words left in the translation: "${run}".`);
  }

  if (opts.glossary) checkGlossary(source, target, opts.locale, opts.glossary, add);
  return issues;
}

type Add = (severity: Severity, code: string, message: string) => void;

function argLabel(a: IcuArg): string {
  return a.type ? `{${a.name}, ${a.type}}` : `{${a.name}}`;
}

function compareIcu(src: IcuNode[], tgt: IcuNode[], unit: Unit, locale: string, add: Add): void {
  const sArgs = icuArguments(src);
  const tArgs = icuArguments(tgt);
  for (const [name] of tArgs)
    if (!sArgs.has(name))
      add(
        "error",
        "placeholder",
        `{${name}} is not in the English; keep placeholder names exactly as they are.`,
      );
  for (const [name, type] of sArgs) {
    if (!tArgs.has(name)) add("error", "placeholder", `{${name}} is missing.`);
    else if (
      type !== tArgs.get(name) &&
      (type === "plural" ||
        type === "select" ||
        type === "selectordinal" ||
        tArgs.get(name) === "plural" ||
        tArgs.get(name) === "select")
    )
      add(
        "error",
        "icu-structure",
        `{${name}} must stay a ${type ?? "plain placeholder"}, not ${tArgs.get(name) ?? "a plain placeholder"}.`,
      );
  }

  const sBranching = new Map<string, IcuArg>();
  for (const a of icuBranchingArgs(src)) if (!sBranching.has(a.name)) sBranching.set(a.name, a);
  const info = pluralInfo(locale);
  for (const t of icuBranchingArgs(tgt)) {
    const s = sBranching.get(t.name);
    if (!s || s.type !== t.type) continue;
    const sKeys = new Set(s.branches?.map((b) => b.key));
    const tKeys = new Set(t.branches?.map((b) => b.key));
    if (!tKeys.has("other")) add("error", "plural", `${argLabel(t)} needs an "other" branch.`);
    if (t.type === "select") {
      for (const k of sKeys)
        if (!tKeys.has(k)) add("error", "select", `${argLabel(t)} lost the "${k}" branch.`);
      for (const k of tKeys)
        if (!sKeys.has(k))
          add("error", "select", `${argLabel(t)} has a "${k}" branch the English doesn't have.`);
      continue;
    }
    if (t.type !== "plural") continue;
    for (const k of sKeys)
      if (k.startsWith("=") && !tKeys.has(k))
        // "=0" is wording of its own ("No runs yet"), never just the number: no plural category
        // covers it, so losing it turns the message into "0 runs".
        add(
          k === "=0" ? "error" : "warning",
          "plural",
          k === "=0"
            ? `${argLabel(t)} dropped the "=0" branch; keep it with its own wording.`
            : `${argLabel(t)} dropped the exact "${k}" branch; fine only if your language doesn't need it.`,
        );
    for (const k of tKeys) {
      if (k.startsWith("=")) continue;
      if (!info.allowed.includes(k))
        add("warning", "plural", `${argLabel(t)} has a "${k}" branch, which ${locale} never uses.`);
    }
    for (const cat of info.required) {
      if (tKeys.has(cat)) continue;
      const exact = cat === "one" ? "=1" : cat === "zero" ? "=0" : cat === "two" ? "=2" : null;
      const sourceDistinguishes = sKeys.has(cat) || (exact !== null && sKeys.has(exact));
      if (cat === "one" && tKeys.has("=1"))
        add(
          "warning",
          "plural",
          `${argLabel(t)} has "=1" but not "one"; ${locale} uses "one" for more numbers than 1.`,
        );
      else if (!sourceDistinguishes && cat === "one")
        add("warning", "plural", `${argLabel(t)} has no "one" branch, which ${locale} needs.`);
      else
        add(
          "error",
          "plural",
          `${argLabel(t)} needs a "${cat}" branch in ${locale} (it uses ${info.required.join(", ")}).`,
        );
    }
  }

  // Each way through the translation must still show the placeholders the English shows.
  const sv = icuVariants(src);
  const tv = icuVariants(tgt);
  if (!sv || !tv) return;
  const keysByArg = new Map<string, Set<string>>();
  for (const [name, a] of sBranching) keysByArg.set(name, new Set(a.branches?.map((b) => b.key)));
  for (const t of tv) {
    const match = matchVariant(sv, t, keysByArg);
    if (!match) continue;
    for (const arg of match.variant.args) {
      if (t.args.has(arg)) continue;
      const where = [...t.choices].map(([n, k]) => `${n}=${k}`).join(", ");
      const countArg = [...t.choices.keys()].includes(arg);
      const severity: Severity = match.exact && !countArg ? "error" : "warning";
      add(
        severity,
        "placeholder",
        `The "${where}" branch doesn't show {${arg}}, which the English shows there.`,
      );
    }
  }
  void unit;
}

/** The English path a translated path corresponds to (same keys, else "=1" for "one", else "other"). */
function matchVariant(
  sv: IcuVariant[],
  t: IcuVariant,
  keysByArg: Map<string, Set<string>>,
): { variant: IcuVariant; exact: boolean } | null {
  let exact = true;
  const want = new Map<string, string>();
  for (const [name, key] of t.choices) {
    const keys = keysByArg.get(name);
    if (!keys) continue;
    if (keys.has(key)) want.set(name, key);
    else {
      exact = false;
      const alias = key === "one" ? "=1" : key === "zero" ? "=0" : key === "two" ? "=2" : null;
      want.set(name, alias && keys.has(alias) ? alias : "other");
    }
  }
  const variant = sv.find((v) =>
    [...v.choices].every(([n, k]) => !want.has(n) || want.get(n) === k),
  );
  return variant ? { variant, exact } : null;
}

function tokens(text: string, sets: TokenSet[]): string[] {
  const out: string[] = [];
  for (const s of sets) for (const m of text.matchAll(TOKEN_PATTERNS[s])) out.push(m[0]);
  return out.sort();
}

function multisetDiff(a: string[], b: string[]): string[] {
  const rest = [...b];
  const missing: string[] = [];
  for (const x of a) {
    const i = rest.indexOf(x);
    if (i === -1) missing.push(x);
    else rest.splice(i, 1);
  }
  return missing;
}

function compareTokens(source: string, target: string, sets: TokenSet[], add: Add): void {
  if (!sets.length) return;
  const s = tokens(source, sets);
  const t = tokens(target, sets);
  const missing = multisetDiff(s, t);
  const extra = multisetDiff(t, s);
  if (missing.length) add("error", "placeholder", `Missing placeholder(s): ${missing.join(" ")}.`);
  if (extra.length)
    add("error", "placeholder", `Placeholder(s) not in the English: ${extra.join(" ")}.`);
}

function compareVariantTokens(src: IcuNode[], tgt: IcuNode[], sets: TokenSet[], add: Add): void {
  if (!sets.length) return;
  const sv = icuVariants(src);
  const tv = icuVariants(tgt);
  if (!sv || !tv) return;
  const allSource = new Set(sv.flatMap((v) => tokens(v.literal, sets)));
  const keysByArg = new Map<string, Set<string>>();
  for (const a of icuBranchingArgs(src))
    keysByArg.set(a.name, new Set(a.branches?.map((b) => b.key)));
  for (const t of tv) {
    const tt = tokens(t.literal, sets);
    for (const x of tt)
      if (!allSource.has(x)) add("error", "placeholder", `Placeholder ${x} is not in the English.`);
    const match = matchVariant(sv, t, keysByArg);
    if (!match) continue;
    const missing = multisetDiff(tokens(match.variant.literal, sets), tt);
    if (missing.length)
      add(
        match.exact ? "error" : "warning",
        "placeholder",
        `A branch is missing ${missing.join(" ")}.`,
      );
  }
}

function longestVariant(nodes: IcuNode[]): number {
  const v = icuVariants(nodes);
  if (!v) return 0;
  return Math.max(
    0,
    ...v.map((x) => charLength(x.literal) + [...x.args].reduce((n, a) => n + a.length + 2, 0)),
  );
}

function tagList(text: string): { tags: string[]; nestingOk: boolean } {
  const tags: string[] = [];
  const stack: string[] = [];
  let nestingOk = true;
  for (const m of text.matchAll(/<(\/?)([A-Za-z][\w:-]*)((?:[^<>"']|"[^"]*"|'[^']*')*?)(\/?)>/g)) {
    const closing = m[1] === "/";
    const name = (m[2] ?? "").toLowerCase();
    const attrs = (m[3] ?? "").replace(TRANSLATABLE_ATTRS, "").replace(/\s+/g, " ").trim();
    tags.push(closing ? `</${name}>` : `<${name}${attrs ? ` ${attrs}` : ""}>`);
    if (VOID_TAGS.has(name) || m[4] === "/") continue;
    if (!closing) stack.push(name);
    else if (stack.pop() !== name) nestingOk = false;
  }
  if (stack.length) nestingOk = false;
  return { tags: tags.sort(), nestingOk };
}

function compareTags(source: string, target: string, add: Add): void {
  const s = tagList(source);
  const t = tagList(target);
  const missing = multisetDiff(s.tags, t.tags);
  const extra = multisetDiff(t.tags, s.tags);
  if (missing.length) add("error", "tags", `Missing or changed tag(s): ${missing.join(" ")}.`);
  if (extra.length) add("error", "tags", `Tag(s) not in the English: ${extra.join(" ")}.`);
  if (s.nestingOk && !t.nestingOk) add("error", "tags", "Tags are not properly opened and closed.");
}

function compareMarkdown(source: string, target: string, add: Add): void {
  const code = (s: string) => [...s.matchAll(/`+[^`]+`+/g)].map((m) => m[0]).sort();
  const links = (s: string) =>
    [...s.matchAll(/\]\(([^)\s]+)(?:\s+"[^"]*")?\)/g)].map((m) => m[1] ?? "").sort();
  const anchors = (s: string) => [...s.matchAll(/\{#[^}]+\}/g)].map((m) => m[0]).sort();
  const missingCode = multisetDiff(code(source), code(target));
  if (missingCode.length)
    add("error", "markdown", `Inline code must stay exactly as written: ${missingCode.join(" ")}.`);
  const missingLinks = multisetDiff(links(source), links(target));
  if (missingLinks.length)
    add("error", "markdown", `Link target(s) changed or missing: ${missingLinks.join(" ")}.`);
  const extraLinks = multisetDiff(links(target), links(source));
  if (extraLinks.length)
    add("error", "markdown", `Link target(s) not in the English: ${extraLinks.join(" ")}.`);
  if (multisetDiff(anchors(source), anchors(target)).length)
    add("error", "markdown", "A heading anchor {#…} changed.");
  const marks = (s: string) => (s.match(/\*\*|__/g) ?? []).length;
  if (marks(source) !== marks(target))
    add("warning", "markdown", "Bold markers (**) differ from the English.");
}

/** Strips what never needs translating: placeholders, tags, code, links, kept names. */
function strip(text: string, glossary?: Glossary): string {
  let s = text
    .replace(/\{[^{}]*\}/g, " ")
    .replace(/<[^<>]*>/g, " ")
    .replace(/`[^`]*`/g, " ")
    .replace(/\]\([^)]*\)/g, "] ")
    .replace(/https?:\/\/\S+/g, " ")
    .replace(/[\w.+-]+@[\w-]+\.[\w.]+/g, " ")
    .replace(/%(?:\d+\$)?[a-zA-Z@]+|\$[A-Za-z0-9_]+\$/g, " ");
  for (const name of glossary ? keptNames(glossary) : []) s = s.split(name).join(" ");
  return s;
}

function translatableWords(source: string, glossary?: Glossary): number {
  return (strip(source, glossary).match(/\p{L}{2,}/gu) ?? []).length;
}

function englishRun(target: string, glossary?: Glossary): string | null {
  const m = strip(target, glossary).match(/(?:\b[A-Za-z][a-z']+\b[ ,]+){3,}\b[A-Za-z][a-z']+\b/);
  return m ? m[0] : null;
}

function checkGlossary(
  source: string,
  target: string,
  locale: string,
  glossary: Glossary,
  add: Add,
): void {
  source = forTerms(source);
  target = forTerms(target);
  const lower = target.toLowerCase();
  for (const term of glossary.terms) {
    if (term.rule === "keep") {
      if (!containsName(source, term.term)) continue;
      const want = renderingsFor(term, locale);
      if (!want.some((w) => target.includes(w)))
        add("error", "glossary", `Keep "${want[0] ?? term.term}" exactly as written.`);
      continue;
    }
    if (!usesTerm(source, term)) continue;
    const renderings = term.rule === "translate-once-then-fixed" ? renderingsFor(term, locale) : [];
    const hasRendering = renderings.some((r) => lower.includes(r.toLowerCase()));
    if (renderings.length && !hasRendering)
      add("warning", "glossary", `"${term.term}" is "${renderings[0]}" in the glossary.`);
    // Avoided words, outside the term's own renderings (ブリーフィング contains ブリーフ).
    let rest = target;
    for (const r of [...renderings].sort((a, b) => b.length - a.length))
      rest = rest.split(r).join(" ");
    // Always a warning: English words carry several senses ("plan" the subscription or a
    // project plan, "run" the noun or the verb, "memory" the feature or RAM), and a check can't
    // tell which one a string means. The review pass decides; an error here pushed the
    // translator into wrong words to get past it (first German run, 2026-11-27).
    for (const bad of avoidFor(term, locale)) {
      if (!containsLoose(rest, bad)) continue;
      add(
        "warning",
        "glossary",
        hasRendering
          ? `"${bad}" is on the avoid list for "${term.term}"; fine only if it means something else here.`
          : `"${bad}" is on the avoid list for "${term.term}"${renderings[0] ? ` (glossary: "${renderings[0]}")` : ""}; fine only if the English means something else here.`,
      );
    }
  }
}

/**
 * Text as glossary checks read it: no placeholders, and no web addresses, domains or email
 * addresses, so the "ai" in casama.ai is not the word "AI".
 */
function forTerms(text: string): string {
  return withoutPlaceholders(text)
    .replace(/[\w.+-]+@[\w-]+(?:\.[\w-]+)+/g, " ")
    .replace(/(?:https?:\/\/)?[\w-]+(?:\.[\w-]+)*\.[A-Za-z]{2,}\b(?:\/\S*)?/g, " ");
}

/** Case-insensitive; Latin words must start at a word boundary, other scripts match anywhere. */
function containsLoose(text: string, word: string): boolean {
  if (!/^[\p{Script=Latin}\s'’-]+$/u.test(word)) return text.includes(word);
  const esc = word.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  return new RegExp(`(^|[^\\p{L}])${esc}`, "iu").test(text);
}

export function hasErrors(issues: Issue[]): boolean {
  return issues.some((i) => i.severity === "error");
}

export function describeIssues(issues: Issue[]): string {
  return issues.map((i) => `${i.severity === "error" ? "✗" : "!"} ${i.message}`).join(" ");
}
