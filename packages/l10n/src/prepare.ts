/**
 * `l10n-kit prepare`: finds what is missing or stale (or, with `review`, what needs the AI review)
 * and writes a run folder: one Markdown packet per ~4,000 English words, a manifest, and an
 * `auto.result.json` with exact memory matches for short text.
 */
import { createHash } from "node:crypto";
import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { join, relative } from "node:path";
import { localeEntry, type SurfaceConfig, styleGuidePath } from "./config.ts";
import { type GlossaryHit, glossaryHits } from "./glossary.ts";
import { hasIcuSyntax } from "./icu.ts";
import { type PacketItem, renderPacket } from "./packets.ts";
import { pluralHint } from "./plural.ts";
import type { Session } from "./session.ts";
import { loadState, type SourceUnit } from "./state.ts";
import { jsonText, matchesAny, wordCount } from "./util.ts";

export interface PrepareOptions {
  locales?: string[];
  surfaces?: string[];
  review?: boolean;
  /** English words per packet. */
  maxWords?: number;
  /** At most this many strings per locale (for a trial run). */
  limit?: number;
  /** Run folder name; default a timestamp. */
  runId?: string;
}

export interface ManifestItem {
  id: string;
  surface: string;
  /** Source file, relative to the project root. */
  file: string;
  key: string;
  /** Hash of the English when the packet was made. */
  src: string;
}

export interface ManifestPacket {
  id: string;
  locale: string;
  file: string;
  result: string;
  words: number;
  items: ManifestItem[];
}

export interface Manifest {
  version: 1;
  runId: string;
  mode: "translate" | "review";
  createdAt: string;
  config: string;
  packets: ManifestPacket[];
  /** Exact memory matches, applied together with the packets' results. */
  auto: { file: string; locale: string; items: ManifestItem[] }[];
}

export interface PrepareSummary {
  runDir: string | null;
  manifest: Manifest | null;
  perLocale: Record<string, { strings: number; words: number; packets: number; auto: number }>;
  edits: number;
  saved: string[];
}

interface Todo {
  surface: SurfaceConfig;
  file: string;
  unit: SourceUnit;
  neighbours: SourceUnit[];
  previous?: string;
  retry?: string;
  translation?: string;
  warnings?: string[];
}

/** Up to 2 before and 1 after: what the translator sees around a string out of its context. */
function neighboursOf(units: SourceUnit[], i: number): SourceUnit[] {
  return [units[i - 2], units[i - 1], units[i + 1]].filter((u): u is SourceUnit => !!u);
}

function timestamp(): string {
  return new Date().toISOString().replace(/[-:]/g, "").replace(/\..*/, "").replace("T", "-");
}

const SHORT_WORDS = 6;

export function prepare(session: Session, opts: PrepareOptions = {}): PrepareSummary {
  const project = session.project;
  const mode = opts.review ? "review" : "translate";
  const locales = session.locales(opts.locales);
  // Paused surfaces only run when asked for by name.
  const surfaces = session
    .surfaces(opts.surfaces)
    .filter((s) => !s.paused || opts.surfaces?.includes(s.id));
  const todos = new Map<string, Todo[]>();
  let edits = 0;

  for (const surface of surfaces) {
    const lock = session.lock(surface);
    for (const source of session.sources(surface)) {
      for (const locale of locales) {
        if (surface.locales && !surface.locales.includes(locale)) continue;
        const memory = session.memory(locale);
        const state = loadState(project, source, locale, lock, memory, {
          aiEdits: session.aiEdits,
        });
        edits += state.edits.length;
        const ll = lock.locale(locale);
        const list = todos.get(locale) ?? [];
        for (const u of source.units) {
          const st = state.status.get(u.fullKey);
          const entry = ll.entries.get(u.fullKey);
          const todo: Todo = {
            surface,
            file: source.file.rel,
            unit: u,
            neighbours: neighboursOf(source.units, u.index),
          };
          if (mode === "translate") {
            if (st === "done") continue;
            if (st === "stale") todo.previous = state.values.get(u.fullKey);
            const failed = ll.failed.get(u.fullKey);
            if (failed && failed.src === u.hash) todo.retry = failed.reason;
          } else {
            if (st !== "done" || !entry || entry.ai || entry.reviewed) continue;
            const stakes =
              matchesAny(u.fullKey, surface.highStakes) ||
              matchesAny(u.unitKey, surface.highStakes);
            if (!stakes && !entry.warn) continue;
            todo.translation = state.values.get(u.fullKey);
          }
          list.push(todo);
        }
        todos.set(locale, list);
      }
    }
  }

  const summary: PrepareSummary = { runDir: null, manifest: null, perLocale: {}, edits, saved: [] };
  const total = [...todos.values()].reduce((n, l) => n + l.length, 0);
  if (!total) {
    summary.saved = session.save();
    return summary;
  }

  const runId = opts.runId ?? `${timestamp()}${mode === "review" ? "-review" : ""}`;
  const runDir = join(project.workDir, runId);
  if (existsSync(join(runDir, "manifest.json"))) throw new Error(`${runDir} already has a run`);
  mkdirSync(runDir, { recursive: true });
  const manifest: Manifest = {
    version: 1,
    runId,
    mode,
    createdAt: new Date().toISOString(),
    config: relative(runDir, project.configPath),
    packets: [],
    auto: [],
  };
  const productBrief =
    project.briefPath && existsSync(project.briefPath)
      ? readFileSync(project.briefPath, "utf8")
      : null;
  const maxWords = opts.maxWords ?? project.packetWords;
  let seq = 0;

  for (const locale of locales) {
    let list = todos.get(locale) ?? [];
    if (opts.limit) list = list.slice(0, opts.limit);
    if (!list.length) continue;
    const entry = localeEntry(project, locale);
    const localeName = entry?.english ?? locale;
    const memory = session.memory(locale);
    const stylePath = styleGuidePath(project, locale);
    const styleGuide = stylePath ? readFileSync(stylePath, "utf8") : null;
    const stats = { strings: 0, words: 0, packets: 0, auto: 0 };

    // Exact memory matches on short text need no agent.
    const auto: Record<string, string> = {};
    const autoItems: ManifestItem[] = [];
    if (mode === "translate") {
      list = list.filter((t) => {
        const hit = memory.get(t.unit.text);
        if (!hit || t.retry || wordCount(t.unit.text) > SHORT_WORDS || t.unit.kind === "markdown")
          return true;
        const id = itemId(++seq, t.unit.fullKey);
        auto[id] = hit.t;
        autoItems.push({
          id,
          surface: t.surface.id,
          file: t.file,
          key: t.unit.fullKey,
          src: t.unit.hash,
        });
        return false;
      });
      if (autoItems.length) {
        const file = `${locale}-auto.result.json`;
        writeFileSync(
          join(runDir, file),
          jsonText({ packet: `${locale}-auto`, locale, translations: auto }),
        );
        manifest.auto.push({ file, locale, items: autoItems });
        stats.auto = autoItems.length;
      }
    }

    // Split into packets of about maxWords English words, keeping file order.
    const chunks: Todo[][] = [];
    let cur: Todo[] = [];
    let words = 0;
    for (const t of list) {
      const w = wordCount(t.unit.text) + 3; // a little for each item's context
      if (cur.length && words + w > maxWords) {
        chunks.push(cur);
        cur = [];
        words = 0;
      }
      cur.push(t);
      words += w;
    }
    if (cur.length) chunks.push(cur);

    chunks.forEach((chunk, ci) => {
      const id = `${locale}-${String(ci + 1).padStart(3, "0")}`;
      const inPacket = new Set(chunk.map((t) => `${t.surface.id}|${t.unit.fullKey}`));
      const items: PacketItem[] = [];
      const mItems: ManifestItem[] = [];
      const keep = new Set<string>();
      const rows = new Map<string, GlossaryHit>();
      let packetWords = 0;
      for (const t of chunk) {
        const u = t.unit;
        const sid = itemId(++seq, u.fullKey);
        const item: PacketItem = {
          id: sid,
          surface: t.surface.id,
          key: u.fullKey,
          en: u.text,
          format: u.kind,
        };
        if (u.description) item.description = u.description;
        if (u.placeholders) item.placeholders = u.placeholders;
        if (u.maxLength !== undefined) item.maxLength = u.maxLength;
        if (u.note) item.note = u.note;
        if (u.kind === "icu" && /,\s*plural\s*,/.test(u.text) && hasIcuSyntax(u.text)) {
          const hint = pluralHint(locale);
          if (hint) item.plural = `${localeName} plural forms: ${hint}`;
        }
        const hits = glossaryHits(project.glossary, u.text, locale);
        for (const k of hits.keep) keep.add(k);
        const g: string[] = [];
        for (const h of hits.terms) {
          rows.set(h.en, h);
          g.push(h.target ? `${h.en} → ${h.target}` : h.en);
        }
        if (g.length) item.glossary = g;
        if (mode === "translate") {
          const fuzzy = memory.fuzzy(u.text);
          if (fuzzy.length)
            item.memory = fuzzy.map((f) => ({
              en: f.en,
              translation: f.t,
              match: f.score,
              ...(f.reviewed ? { reviewed: true } : {}),
            }));
          if (t.previous !== undefined) item.previous = t.previous;
          if (t.retry) item.retry = t.retry;
        } else {
          if (t.translation !== undefined) item.translation = t.translation;
        }
        const context = t.neighbours
          .filter((n) => !inPacket.has(`${t.surface.id}|${n.fullKey}`))
          .map(
            (n) =>
              `${n.unitKey || n.fullKey}: ${n.text.length > 100 ? `${n.text.slice(0, 100)}…` : n.text}`,
          );
        if (context.length) item.context = context;
        items.push(item);
        mItems.push({ id: sid, surface: t.surface.id, file: t.file, key: u.fullKey, src: u.hash });
        packetWords += wordCount(u.text);
      }
      const file = `${id}.md`;
      const result = `${id}.result.json`;
      const surfaceIds = [...new Set(chunk.map((t) => t.surface.id))];
      const text = renderPacket({
        id,
        mode,
        locale,
        localeName,
        resultPath: join(runDir, result),
        productBrief,
        styleGuide,
        surfaces: surfaceIds.map((sid) => {
          const s = project.config.surfaces.find((x) => x.id === sid);
          return s?.context ? { id: sid, context: s.context } : { id: sid };
        }),
        glossaryRows: [...rows.values()],
        keep: [...keep],
        items,
      });
      writeFileSync(join(runDir, file), text);
      manifest.packets.push({ id, locale, file, result, words: packetWords, items: mItems });
      stats.packets++;
      stats.strings += items.length;
      stats.words += packetWords;
    });
    summary.perLocale[locale] = stats;
  }

  writeFileSync(join(runDir, "manifest.json"), jsonText(manifest));
  summary.runDir = runDir;
  summary.manifest = manifest;
  summary.saved = session.save();
  return summary;
}

/**
 * An item's id in a packet: its number plus three characters taken from its key ("s12-k7f").
 * The translator has to copy each id from the item it translated, so one miscounted answer
 * can't shift every answer after it onto the wrong string (it happened once in the first
 * Korean run, 2026-11-27): a counted id matches no string and is reported instead.
 */
export function itemId(seq: number, key: string): string {
  return `s${seq}-${createHash("sha1").update(key).digest("base64url").slice(0, 3)}`;
}
