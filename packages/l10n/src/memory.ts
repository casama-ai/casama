/**
 * Translation memory: one file per locale (`<memoryDir>/<locale>.json`), English text →
 * translation. The first folder is the project's own and is written; more folders (shared across
 * projects) are only read.
 *
 * ```json
 * { "version": 1, "locale": "de", "entries": { "Cancel": { "t": "Abbrechen", "r": true } } }
 * ```
 *
 * `r` marks a translation a person reviewed. A reviewed entry is never replaced by an unreviewed
 * one. Exact matches on short text are reused automatically by `prepare`; similar texts are shown
 * to the translator as suggestions.
 */
import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { jsonText, sortedObject } from "./util.ts";

export interface MemoryEntry {
  t: string;
  r?: boolean;
}

export interface FuzzyMatch {
  en: string;
  t: string;
  score: number;
  reviewed: boolean;
}

function words(text: string): string[] {
  return text.toLowerCase().match(/[\p{L}\p{N}]+/gu) ?? [];
}

export class Memory {
  readonly locale: string;
  private readonly own = new Map<string, MemoryEntry>();
  private readonly shared = new Map<string, MemoryEntry>();
  private readonly ownPath: string;
  private index: Map<string, string[]> | null = null;
  dirty = false;

  constructor(dirs: string[], locale: string) {
    this.locale = locale;
    this.ownPath = join(dirs[0] ?? ".", `${locale}.json`);
    dirs.forEach((dir, i) => {
      const p = join(dir, `${locale}.json`);
      if (!existsSync(p)) return;
      const data = JSON.parse(readFileSync(p, "utf8")) as { entries?: Record<string, MemoryEntry> };
      const target = i === 0 ? this.own : this.shared;
      for (const [en, e] of Object.entries(data.entries ?? {}))
        if (e && typeof e.t === "string") target.set(en, e);
    });
  }

  get(en: string): MemoryEntry | undefined {
    const own = this.own.get(en);
    const shared = this.shared.get(en);
    if (own && (own.r || !shared?.r)) return own;
    return shared ?? own;
  }

  add(en: string, t: string, reviewed = false): void {
    const prev = this.own.get(en);
    if (prev?.r && !reviewed) return;
    if (prev && prev.t === t && !!prev.r === reviewed) return;
    this.own.set(en, reviewed ? { t, r: true } : { t });
    this.index = null;
    this.dirty = true;
  }

  /** Up to `limit` similar English texts (word overlap, Dice coefficient ≥ `min`). */
  fuzzy(en: string, limit = 2, min = 0.6): FuzzyMatch[] {
    const mine = words(en);
    if (!mine.length) return [];
    const index = this.buildIndex();
    const counts = new Map<string, number>();
    for (const w of new Set(mine)) {
      const list = index.get(w);
      if (!list || list.length > 400) continue; // too common to tell texts apart
      for (const cand of list) counts.set(cand, (counts.get(cand) ?? 0) + 1);
    }
    const out: FuzzyMatch[] = [];
    for (const [cand] of counts) {
      if (cand === en) continue;
      const theirs = words(cand);
      const rest = [...theirs];
      let common = 0;
      for (const w of mine) {
        const i = rest.indexOf(w);
        if (i !== -1) {
          common++;
          rest.splice(i, 1);
        }
      }
      const score = (2 * common) / (mine.length + theirs.length);
      if (score < min) continue;
      const e = this.get(cand);
      if (e) out.push({ en: cand, t: e.t, score: Math.round(score * 100) / 100, reviewed: !!e.r });
    }
    return out.sort((a, b) => b.score - a.score).slice(0, limit);
  }

  private buildIndex(): Map<string, string[]> {
    if (this.index) return this.index;
    const index = new Map<string, string[]>();
    for (const en of new Set([...this.own.keys(), ...this.shared.keys()]))
      for (const w of new Set(words(en))) {
        const list = index.get(w);
        if (list) list.push(en);
        else index.set(w, [en]);
      }
    this.index = index;
    return index;
  }

  get size(): number {
    return new Set([...this.own.keys(), ...this.shared.keys()]).size;
  }

  save(): boolean {
    if (!this.dirty) return false;
    const entries = sortedObject(Object.fromEntries(this.own));
    mkdirSync(dirname(this.ownPath), { recursive: true });
    writeFileSync(this.ownPath, jsonText({ version: 1, locale: this.locale, entries }));
    this.dirty = false;
    return true;
  }
}
