/**
 * The lock file: one per surface (`<lockDir>/<surface>.json`). For every locale and key it keeps
 * a hash of the English the translation was made from, a hash of the translation as written, and
 * flags. So the kit knows what is missing, what is stale (the English changed), and what a
 * person edited by hand (the file's text no longer matches the hash).
 *
 * ```json
 * {
 *   "version": 1,
 *   "surface": "app",
 *   "locales": {
 *     "de": {
 *       "entries": { "cancel": "3f1a9c0e2b7d 9be0c1a2f3d4 r" },
 *       "order": { "guide/start.md": ["guide/start.md::1a2b3c4d", "…"] },
 *       "failed": { "paywallTitle": { "src": "…", "count": 1, "reason": "…" } }
 *     }
 *   }
 * }
 * ```
 *
 * Flags: `r` reviewed by a person, `a` reviewed by an AI reviewer, `w` passed with warnings,
 * `-` none. `order` (document formats only) lists the segment keys of each written target file.
 */
import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { jsonText, sortedObject } from "./util.ts";

export interface LockEntry {
  src: string;
  tgt: string;
  reviewed: boolean;
  ai: boolean;
  warn: boolean;
}

export interface Failure {
  src: string;
  count: number;
  reason: string;
}

export interface LocaleLock {
  entries: Map<string, LockEntry>;
  order: Map<string, string[]>;
  failed: Map<string, Failure>;
}

interface LockJson {
  version: 1;
  surface: string;
  locales: Record<
    string,
    {
      entries?: Record<string, string>;
      order?: Record<string, string[]>;
      failed?: Record<string, Failure>;
    }
  >;
}

function parseEntry(raw: string): LockEntry {
  const [src = "", tgt = "", flags = "-"] = raw.split(" ");
  return {
    src,
    tgt,
    reviewed: flags.includes("r"),
    ai: flags.includes("a"),
    warn: flags.includes("w"),
  };
}

function formatEntry(e: LockEntry): string {
  const flags = `${e.reviewed ? "r" : ""}${e.ai ? "a" : ""}${e.warn ? "w" : ""}` || "-";
  return `${e.src} ${e.tgt} ${flags}`;
}

export class Lock {
  readonly path: string;
  readonly surface: string;
  private readonly locales = new Map<string, LocaleLock>();
  dirty = false;

  constructor(lockDir: string, surface: string) {
    this.surface = surface;
    this.path = join(lockDir, `${surface}.json`);
    if (!existsSync(this.path)) return;
    const data = JSON.parse(readFileSync(this.path, "utf8")) as LockJson;
    for (const [code, l] of Object.entries(data.locales ?? {})) {
      this.locales.set(code, {
        entries: new Map(Object.entries(l.entries ?? {}).map(([k, v]) => [k, parseEntry(v)])),
        order: new Map(Object.entries(l.order ?? {})),
        failed: new Map(Object.entries(l.failed ?? {})),
      });
    }
  }

  locale(code: string): LocaleLock {
    let l = this.locales.get(code);
    if (!l) {
      l = { entries: new Map(), order: new Map(), failed: new Map() };
      this.locales.set(code, l);
    }
    return l;
  }

  hasLocale(code: string): boolean {
    return this.locales.has(code);
  }

  set(code: string, key: string, entry: LockEntry): void {
    this.locale(code).entries.set(key, entry);
    this.dirty = true;
  }

  fail(code: string, key: string, src: string, reason: string): Failure {
    const failed = this.locale(code).failed;
    const prev = failed.get(key);
    const f = { src, count: prev && prev.src === src ? prev.count + 1 : 1, reason };
    failed.set(key, f);
    this.dirty = true;
    return f;
  }

  clearFailure(code: string, key: string): void {
    if (this.locale(code).failed.delete(key)) this.dirty = true;
  }

  setOrder(code: string, file: string, keys: string[]): void {
    this.locale(code).order.set(file, keys);
    this.dirty = true;
  }

  /** Drops entries and failures for keys no longer in the English. */
  prune(code: string, keep: Set<string>, files: Set<string>): void {
    const l = this.locale(code);
    for (const map of [l.entries, l.failed] as Map<string, unknown>[])
      for (const k of [...map.keys()])
        if (!keep.has(k)) {
          map.delete(k);
          this.dirty = true;
        }
    for (const f of [...l.order.keys()])
      if (!files.has(f)) {
        l.order.delete(f);
        this.dirty = true;
      }
  }

  save(): boolean {
    if (!this.dirty) return false;
    const out: LockJson = { version: 1, surface: this.surface, locales: {} };
    // Keep the file's own locale order (new locales go last) so a save doesn't reshuffle it.
    for (const code of this.locales.keys()) {
      const l = this.locales.get(code) as LocaleLock;
      if (!l.entries.size && !l.order.size && !l.failed.size) continue;
      const entries: Record<string, string> = {};
      for (const [k, e] of l.entries) entries[k] = formatEntry(e);
      const loc: LockJson["locales"][string] = { entries: sortedObject(entries) };
      if (l.order.size) loc.order = sortedObject(Object.fromEntries(l.order));
      if (l.failed.size) loc.failed = sortedObject(Object.fromEntries(l.failed));
      out.locales[code] = loc;
    }
    mkdirSync(dirname(this.path), { recursive: true });
    writeFileSync(this.path, jsonText(out));
    this.dirty = false;
    return true;
  }
}
