/**
 * `l10n-kit check` (every translation still passes, and shipped locales are complete) and
 * `l10n-kit report` (percent done per locale and surface). Both only read; they never write.
 */
import { checkTranslation, type Issue } from "./checks.ts";
import { apostrophesFor } from "./config.ts";
import type { Session } from "./session.ts";
import { loadState } from "./state.ts";
import { matchesAny, wordCount } from "./util.ts";

export interface Coverage {
  surface: string;
  locale: string;
  strings: number;
  done: number;
  stale: number;
  missing: number;
  reviewed: number;
  aiReviewed: number;
  failed: number;
  /** Failed two or more times in a row: needs a person. */
  stuck: number;
  words: number;
  wordsDone: number;
  /** Percent of strings translated and current. */
  percent: number;
}

export interface CheckIssue extends Issue {
  locale: string;
  surface: string;
  key: string;
  file: string;
}

export interface CheckSummary {
  locales: string[];
  coverage: Coverage[];
  issues: CheckIssue[];
  errors: number;
  warnings: number;
  /** Locales with missing or stale strings (when completeness was asked for). */
  incomplete: string[];
  ok: boolean;
}

export interface CheckOptions {
  locales?: string[];
  surfaces?: string[];
  /** Only locales with `ship: true`, and they must be complete (the release gate). */
  shipped?: boolean;
  /** Fail when anything is missing or stale. */
  complete?: boolean;
  /** Skip running the checks on each translation (report only needs counts). */
  countsOnly?: boolean;
}

function percent(done: number, total: number): number {
  return total ? Math.floor((done / total) * 1000) / 10 : 100;
}

export function check(session: Session, opts: CheckOptions = {}): CheckSummary {
  const project = session.project;
  const locales = opts.shipped
    ? session.locales(opts.locales, (l) => l.ship)
    : session.locales(opts.locales, (l) => l.translate || l.ship);
  const coverage: Coverage[] = [];
  const issues: CheckIssue[] = [];

  for (const surface of session.surfaces(opts.surfaces)) {
    const lock = session.lock(surface);
    const sources = session.sources(surface);
    for (const locale of locales) {
      if (surface.locales && !surface.locales.includes(locale)) continue;
      const c: Coverage = {
        surface: surface.id,
        locale,
        strings: 0,
        done: 0,
        stale: 0,
        missing: 0,
        reviewed: 0,
        aiReviewed: 0,
        failed: 0,
        stuck: 0,
        words: 0,
        wordsDone: 0,
        percent: 0,
      };
      const ll = lock.locale(locale);
      for (const source of sources) {
        const state = loadState(project, source, locale, lock, null);
        for (const u of source.units) {
          const st = state.status.get(u.fullKey) ?? "missing";
          const words = wordCount(u.text);
          c.strings++;
          c.words += words;
          c[st]++;
          const entry = ll.entries.get(u.fullKey);
          const failure = ll.failed.get(u.fullKey);
          if (failure && failure.src === u.hash && st !== "done") {
            c.failed++;
            if (failure.count >= 2) c.stuck++;
          }
          if (st !== "done") continue;
          c.wordsDone += words;
          if (entry?.reviewed) c.reviewed++;
          if (entry?.ai) c.aiReviewed++;
          if (opts.countsOnly) continue;
          const text = state.values.get(u.fullKey) ?? "";
          const found = checkTranslation(u, text, {
            locale,
            sourceLocale: project.locales.source,
            glossary: project.glossary,
            sameAllowed:
              matchesAny(u.fullKey, surface.sameAllowed) ||
              matchesAny(u.unitKey, surface.sameAllowed),
            apostrophes: apostrophesFor(surface),
          });
          for (const i of found)
            issues.push({
              ...i,
              locale,
              surface: surface.id,
              key: u.fullKey,
              file: state.target.rel,
            });
        }
      }
      c.percent = percent(c.done, c.strings);
      coverage.push(c);
    }
  }

  const errors = issues.filter((i) => i.severity === "error").length;
  const incomplete =
    opts.shipped || opts.complete
      ? [...new Set(coverage.filter((c) => c.stale + c.missing > 0).map((c) => c.locale))]
      : [];
  return {
    locales,
    coverage,
    issues,
    errors,
    warnings: issues.length - errors,
    incomplete,
    ok: errors === 0 && incomplete.length === 0,
  };
}

/** Coverage per locale and surface, plus a total per locale. */
export function report(session: Session, opts: { locales?: string[]; surfaces?: string[] } = {}) {
  const result = check(session, { ...opts, countsOnly: true });
  const byLocale = new Map<
    string,
    { strings: number; done: number; reviewed: number; words: number; wordsDone: number }
  >();
  for (const c of result.coverage) {
    const t = byLocale.get(c.locale) ?? {
      strings: 0,
      done: 0,
      reviewed: 0,
      words: 0,
      wordsDone: 0,
    };
    t.strings += c.strings;
    t.done += c.done;
    t.reviewed += c.reviewed;
    t.words += c.words;
    t.wordsDone += c.wordsDone;
    byLocale.set(c.locale, t);
  }
  const totals = [...byLocale].map(([locale, t]) => ({
    locale,
    ...t,
    percent: percent(t.done, t.strings),
  }));
  return { generatedAt: new Date().toISOString(), coverage: result.coverage, totals };
}
