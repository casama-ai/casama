/**
 * Where each string stands for one file and locale: what is translated, stale or missing, and
 * which translations a person edited by hand. Also writes a target file and its lock entries.
 */
import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname } from "node:path";
import { getAdapter } from "./adapters/index.ts";
import {
  fullKey,
  mappedLocale,
  type Project,
  type SourceFile,
  type SurfaceConfig,
  targetFile,
} from "./config.ts";
import type { Lock } from "./lock.ts";
import type { Memory } from "./memory.ts";
import type { Adapter, AdapterContext, TargetContext, Unit } from "./types.ts";
import { hashText, matchesAny } from "./util.ts";

export interface SourceUnit extends Unit {
  /** The key in the lock file, memory and packets. */
  fullKey: string;
  /** Hash of the English text. */
  hash: string;
  /** The key the adapter gave it (the full key without the file prefix). */
  unitKey: string;
  /** Position in the file, for neighbouring context. */
  index: number;
}

export type UnitStatus = "done" | "stale" | "missing";

export interface LoadedSource {
  surface: SurfaceConfig;
  adapter: Adapter;
  file: SourceFile;
  content: string;
  units: SourceUnit[];
  ctx: AdapterContext;
}

export interface FileState {
  source: LoadedSource;
  locale: string;
  target: { abs: string; rel: string; content: string | null };
  /** Current translation per full key (only text that counts as a translation). */
  values: Map<string, string>;
  status: Map<string, UnitStatus>;
  /** Keys adopted as hand edits while loading (the lock was updated). */
  edits: string[];
  /** Set when a document target couldn't be lined up with what the kit last wrote. */
  misaligned: boolean;
}

/** Reads a source file into units, applying the surface's skipKeys and limits. */
export function loadSource(
  project: Project,
  surface: SurfaceConfig,
  file: SourceFile,
): LoadedSource {
  const adapter = getAdapter(surface.adapter);
  const content = readFileSync(file.abs, "utf8");
  const ctx: AdapterContext = {
    options: surface.options ?? {},
    sourceLocale: project.locales.source,
    path: file.rel,
  };
  const units: SourceUnit[] = [];
  adapter.read(content, ctx).forEach((u, i) => {
    const key = fullKey(surface, file, u.key);
    if (matchesAny(key, surface.skipKeys) || (u.key && matchesAny(u.key, surface.skipKeys))) return;
    const unit: SourceUnit = {
      ...u,
      fullKey: key,
      unitKey: u.key,
      hash: hashText(u.text),
      index: i,
    };
    for (const [pattern, max] of Object.entries(surface.limits ?? {}))
      if (matchesAny(key, [pattern]) && (unit.maxLength === undefined || max < unit.maxLength))
        unit.maxLength = max;
    units.push(unit);
  });
  return { surface, adapter, file, content, units, ctx };
}

export function targetContext(source: LoadedSource, locale: string, rel: string): TargetContext {
  return { ...source.ctx, path: rel, locale, mappedLocale: mappedLocale(source.surface, locale) };
}

/** Reads a target file back as full key → text (aligning document segments by the lock's order). */
function readValues(
  source: LoadedSource,
  content: string,
  tctx: TargetContext,
  order: string[] | undefined,
): { values: Map<string, string>; misaligned: boolean } {
  const read = source.adapter.readTarget(content, tctx);
  const values = new Map<string, string>();
  if (read.kind === "keys") {
    for (const [k, v] of read.values) values.set(fullKey(source.surface, source.file, k), v);
    return { values, misaligned: false };
  }
  if (!order || order.length !== read.values.length)
    return { values, misaligned: read.values.length > 0 };
  order.forEach((k, i) => {
    values.set(k, read.values[i] as string);
  });
  return { values, misaligned: false };
}

export function loadState(
  project: Project,
  source: LoadedSource,
  locale: string,
  lock: Lock,
  memory: Memory | null,
  opts: { aiEdits?: boolean } = {},
): FileState {
  const target = targetFile(
    project,
    source.surface,
    source.file,
    locale,
    !!source.adapter.multiLocale,
  );
  const content = existsSync(target.abs) ? readFileSync(target.abs, "utf8") : null;
  const tctx = targetContext(source, locale, target.rel);
  const ll = lock.locale(locale);
  const doc = source.adapter.mode === "doc";
  let raw = new Map<string, string>();
  let misaligned = false;
  if (content !== null) {
    ({ values: raw, misaligned } = readValues(
      source,
      content,
      tctx,
      ll.order.get(source.file.rel),
    ));
  }
  const values = new Map<string, string>();
  const status = new Map<string, UnitStatus>();
  const edits: string[] = [];
  for (const u of source.units) {
    const entry = ll.entries.get(u.fullKey);
    let v = raw.get(u.fullKey);
    // A document we can't line up: fall back to the memory for strings the lock says we wrote.
    if (v === undefined && doc && misaligned && entry && memory) v = memory.get(u.text)?.t;
    if (v === undefined) {
      status.set(u.fullKey, "missing");
      continue;
    }
    if (!entry) {
      // In a document the English stands in for untranslated segments; that is not a translation.
      if (doc && v === u.text) {
        status.set(u.fullKey, "missing");
        continue;
      }
      // Text in the target the kit didn't write: a person (or another tool) translated it.
      lock.set(locale, u.fullKey, {
        src: u.hash,
        tgt: hashText(v),
        reviewed: !opts.aiEdits,
        ai: !!opts.aiEdits,
        warn: false,
      });
      memory?.add(u.text, v, !opts.aiEdits);
      edits.push(u.fullKey);
      values.set(u.fullKey, v);
      status.set(u.fullKey, "done");
      continue;
    }
    if (hashText(v) !== entry.tgt) {
      // Edited by hand since the kit wrote it: keep it, and count it as reviewed.
      lock.set(
        locale,
        u.fullKey,
        opts.aiEdits
          ? { ...entry, tgt: hashText(v), ai: true }
          : { ...entry, tgt: hashText(v), reviewed: true },
      );
      memory?.add(u.text, v, !opts.aiEdits);
      edits.push(u.fullKey);
    }
    values.set(u.fullKey, v);
    status.set(u.fullKey, entry.src === u.hash ? "done" : "stale");
  }
  return { source, locale, target: { ...target, content }, values, status, edits, misaligned };
}

export interface NewTranslation {
  text: string;
  reviewed: boolean;
  ai: boolean;
  warn: boolean;
}

/**
 * Writes the target file with the existing translations plus `updates`, and records each update
 * in the lock (hashing what reads back from the written file, so formatting can't look like an
 * edit). Returns true when the file changed.
 */
export function writeState(
  state: FileState,
  updates: Map<string, NewTranslation>,
  lock: Lock,
): boolean {
  const { source, locale } = state;
  const merged = new Map(state.values);
  for (const [k, t] of updates) merged.set(k, t.text);
  const byUnitKey = new Map<string, string>();
  for (const u of source.units) {
    const t = merged.get(u.fullKey);
    if (t !== undefined) byUnitKey.set(u.unitKey, t);
  }
  if (!byUnitKey.size && state.target.content === null) return false;

  const tctx = targetContext(source, locale, state.target.rel);
  // Multi-locale files are re-read so a write for another locale isn't lost.
  const previous = existsSync(state.target.abs) ? readFileSync(state.target.abs, "utf8") : null;
  const out = source.adapter.write(
    { source: source.content, previous, translations: byUnitKey },
    tctx,
  );
  const changed = out !== previous;
  if (changed) {
    mkdirSync(dirname(state.target.abs), { recursive: true });
    writeFileSync(state.target.abs, out);
  }

  const order = source.units.map((u) => u.fullKey);
  const { values: readBack } = readValues(source, out, tctx, order);
  if (source.adapter.mode === "doc") lock.setOrder(locale, source.file.rel, order);
  for (const u of source.units) {
    const t = updates.get(u.fullKey);
    if (!t) continue;
    const written = readBack.get(u.fullKey) ?? t.text;
    lock.set(locale, u.fullKey, {
      src: u.hash,
      tgt: hashText(written),
      reviewed: t.reviewed,
      ai: t.ai,
      warn: t.warn,
    });
    lock.clearFailure(locale, u.fullKey);
  }
  state.target.content = out;
  for (const [k, t] of updates) {
    state.values.set(k, t.text);
    state.status.set(k, "done");
  }
  return changed;
}
