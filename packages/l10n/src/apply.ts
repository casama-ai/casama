/**
 * `l10n-kit apply`: reads an agent's result files, checks every string against the current
 * English, writes what passes into the locale files, and records the rest as failures that the
 * next `prepare` sends back with the reason.
 */
import { existsSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { basename, dirname, join } from "node:path";
import { checkTranslation, describeIssues, hasErrors, type Issue } from "./checks.ts";
import { apostrophesFor, localeEntry } from "./config.ts";
import { parseResult } from "./packets.ts";
import type { Manifest, ManifestItem } from "./prepare.ts";
import type { Session } from "./session.ts";
import {
  type FileState,
  type LoadedSource,
  loadState,
  type NewTranslation,
  writeState,
} from "./state.ts";
import { jsonText, matchesAny } from "./util.ts";

export interface ApplyOptions {
  /** A person (a native reviewer) checked these: mark them reviewed. */
  reviewed?: boolean;
}

export interface ApplyFailure {
  locale: string;
  surface: string;
  key: string;
  reason: string;
  /** How many times in a row this string failed. Two or more: a person should look. */
  count: number;
}

export interface ApplySummary {
  runDir: string;
  mode: "translate" | "review";
  applied: number;
  changedByReview: number;
  approvedByReview: number;
  failed: ApplyFailure[];
  warnings: { locale: string; surface: string; key: string; message: string }[];
  /** In a packet but not in its result. */
  unanswered: number;
  /** Answers under an id that matches no string in their packet (a miscounted or made-up id). */
  unknownIds: { file: string; ids: string[] }[];
  /** The English changed or went away after prepare. */
  skipped: { locale: string; key: string; why: string }[];
  /** Packets without a result file yet. */
  waiting: string[];
  filesWritten: string[];
  notes: { locale: string; key: string; note: string }[];
}

/** The run folder and result files from the command's arguments. */
function resolveInputs(inputs: string[]): { runDir: string; results: Set<string> | null } {
  if (!inputs.length) throw new Error("Give a run folder (from prepare) or result files.");
  const first = inputs[0] as string;
  if (statSync(first).isDirectory()) {
    if (inputs.length > 1) throw new Error("Give one run folder, or result files from one run.");
    return { runDir: first, results: null };
  }
  const runDir = dirname(first);
  for (const f of inputs)
    if (dirname(f) !== runDir)
      throw new Error("All result files must come from the same run folder.");
  return { runDir, results: new Set(inputs.map((f) => basename(f))) };
}

export function apply(session: Session, inputs: string[], opts: ApplyOptions = {}): ApplySummary {
  const { runDir, results } = resolveInputs(inputs);
  const manifestPath = join(runDir, "manifest.json");
  if (!existsSync(manifestPath))
    throw new Error(`No manifest.json in ${runDir}; is this a run folder from prepare?`);
  const manifest = JSON.parse(readFileSync(manifestPath, "utf8")) as Manifest;
  const project = session.project;
  const summary: ApplySummary = {
    runDir,
    mode: manifest.mode,
    applied: 0,
    changedByReview: 0,
    approvedByReview: 0,
    failed: [],
    warnings: [],
    unanswered: 0,
    unknownIds: [],
    skipped: [],
    waiting: [],
    filesWritten: [],
    notes: [],
  };

  // Which result files to read, and the items each answers.
  const batches: { resultFile: string; locale: string; items: ManifestItem[]; review: boolean }[] =
    [];
  for (const a of manifest.auto)
    batches.push({ resultFile: a.file, locale: a.locale, items: a.items, review: false });
  for (const p of manifest.packets)
    batches.push({
      resultFile: p.result,
      locale: p.locale,
      items: p.items,
      review: manifest.mode === "review",
    });
  const present = new Set(readdirSync(runDir));

  // Collected updates per (surface, file, locale).
  type Pending = { state: FileState; updates: Map<string, NewTranslation> };
  const pending = new Map<string, Pending>();
  const stateFor = (surfaceId: string, file: string, locale: string): Pending | null => {
    const id = `${surfaceId}|${file}|${locale}`;
    const hit = pending.get(id);
    if (hit) return hit;
    const surface = project.config.surfaces.find((s) => s.id === surfaceId);
    if (!surface) return null;
    const source: LoadedSource | undefined = session
      .sources(surface)
      .find((s) => s.file.rel === file);
    if (!source) return null;
    const state = loadState(
      project,
      source,
      locale,
      session.lock(surface),
      session.memory(locale),
      {
        aiEdits: session.aiEdits,
      },
    );
    const p = { state, updates: new Map<string, NewTranslation>() };
    pending.set(id, p);
    return p;
  };

  for (const batch of batches) {
    if (results && !results.has(batch.resultFile)) continue;
    if (!present.has(batch.resultFile)) {
      if (!batch.resultFile.endsWith("-auto.result.json")) summary.waiting.push(batch.resultFile);
      continue;
    }
    const result = parseResult(
      readFileSync(join(runDir, batch.resultFile), "utf8"),
      batch.resultFile,
    );
    const known = new Set(batch.items.map((i) => i.id));
    const unknown = Object.keys(result.translations ?? {}).filter((id) => !known.has(id));
    if (unknown.length) summary.unknownIds.push({ file: batch.resultFile, ids: unknown });
    // A review answer with ids we don't know may have shifted: approve nothing in it by silence.
    const trustSilence = !(batch.review && unknown.length);
    for (const [id, note] of Object.entries(result.notes ?? {})) {
      const item = batch.items.find((i) => i.id === id);
      if (item && typeof note === "string")
        summary.notes.push({ locale: batch.locale, key: item.key, note });
    }
    for (const item of batch.items) {
      const p = stateFor(item.surface, item.file, batch.locale);
      const surface = project.config.surfaces.find((s) => s.id === item.surface);
      const unit = p?.state.source.units.find((u) => u.fullKey === item.key);
      if (!p || !surface || !unit) {
        summary.skipped.push({
          locale: batch.locale,
          key: item.key,
          why: "no longer in the English",
        });
        continue;
      }
      if (unit.hash !== item.src) {
        summary.skipped.push({
          locale: batch.locale,
          key: item.key,
          why: "the English changed after prepare",
        });
        continue;
      }
      const lock = session.lock(surface);
      const entry = lock.locale(batch.locale).entries.get(item.key);
      const text = result.translations[item.id];

      if (batch.review && text === undefined) {
        if (!trustSilence) continue;
        // Approved as it is.
        const current = p.state.values.get(item.key);
        if (entry && current !== undefined) {
          lock.set(batch.locale, item.key, {
            ...entry,
            ai: true,
            reviewed: entry.reviewed || !!opts.reviewed,
          });
          summary.approvedByReview++;
        }
        continue;
      }
      if (text === undefined) {
        summary.unanswered++;
        continue;
      }
      const issues: Issue[] = checkTranslation(unit, text, {
        locale: batch.locale,
        sourceLocale: project.locales.source,
        glossary: project.glossary,
        sameAllowed:
          matchesAny(item.key, surface.sameAllowed) ||
          matchesAny(unit.unitKey, surface.sameAllowed),
        apostrophes: apostrophesFor(surface),
      });
      if (hasErrors(issues)) {
        const reason = describeIssues(issues.filter((i) => i.severity === "error"));
        const f = lock.fail(batch.locale, item.key, unit.hash, reason);
        summary.failed.push({
          locale: batch.locale,
          surface: item.surface,
          key: item.key,
          reason,
          count: f.count,
        });
        continue;
      }
      for (const w of issues)
        summary.warnings.push({
          locale: batch.locale,
          surface: item.surface,
          key: item.key,
          message: w.message,
        });
      const unchanged = batch.review && text === p.state.values.get(item.key);
      p.updates.set(item.key, {
        text,
        reviewed: !!opts.reviewed || (unchanged && !!entry?.reviewed),
        ai: batch.review,
        warn: issues.length > 0,
      });
      if (batch.review) summary.changedByReview += unchanged ? 0 : 1;
      else summary.applied++;
      session.memory(batch.locale).add(unit.text, text, !!opts.reviewed);
    }
  }

  for (const { state, updates } of pending.values()) {
    if (!updates.size) continue;
    const lock = session.lock(state.source.surface);
    if (writeState(state, updates, lock)) summary.filesWritten.push(state.target.rel);
  }

  // Forget lock entries for strings that left the English.
  const touched = new Set(
    [...pending.values()]
      .filter((p) => p.updates.size)
      .map((p) => `${p.state.source.surface.id}|${p.state.locale}`),
  );
  for (const id of touched) {
    const [surfaceId, locale] = id.split("|") as [string, string];
    const surface = project.config.surfaces.find((s) => s.id === surfaceId);
    if (!surface) continue;
    const sources = session.sources(surface);
    const keys = new Set(sources.flatMap((s) => s.units.map((u) => u.fullKey)));
    session.lock(surface).prune(locale, keys, new Set(sources.map((s) => s.file.rel)));
  }

  session.save();
  writeFileSync(
    join(runDir, "apply-report.json"),
    jsonText({
      ...summary,
      at: new Date().toISOString(),
      locales: [...new Set(batches.map((b) => b.locale))].map(
        (l) => localeEntry(project, l)?.english ?? l,
      ),
    }),
  );
  return summary;
}
