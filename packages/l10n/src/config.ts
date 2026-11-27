/**
 * The project's `l10n.config.json` and `locales.json`, and how source and target paths resolve.
 *
 * Paths in l10n.config.json are relative to the config file's folder, except surface `source`
 * and `target`, which are relative to the project root (`root`, default: the config folder's
 * parent, so a config in `<repo>/l10n/` points at `<repo>`).
 */
import { existsSync, globSync, readFileSync } from "node:fs";
import { homedir } from "node:os";
import { dirname, join, matchesGlob, relative, resolve, sep } from "node:path";
import { type Glossary, loadGlossary } from "./glossary.ts";
import { languageOf } from "./util.ts";

export interface LocaleEntry {
  /** BCP 47 code: "de", "pt-BR", "zh-Hant". */
  code: string;
  /** The language's own name, for pickers: "Deutsch". */
  name: string;
  /** Its English name: "German". */
  english: string;
  wave?: number;
  /** The translation task works on it. */
  translate: boolean;
  /** Release builds include it (the build switch). `check --shipped` requires it complete. */
  ship: boolean;
  dir?: "ltr" | "rtl";
}

export interface LocalesFile {
  source: string;
  /** The pseudo-locale for tests and debug builds, such as "en-XA". */
  pseudo?: string;
  locales: LocaleEntry[];
}

export interface SurfaceConfig {
  /** Short id, used in the lock file name and in reports: "app", "docs", "store-ios". */
  id: string;
  /** One paragraph shown to the translator: what this text is and who reads it. */
  context?: string;
  /** Adapter id: arb, json, text, markdown, html, apple-strings, xcstrings, android-strings, chrome-messages. */
  adapter: string;
  /** A file or a glob, relative to the project root. */
  source: string;
  /**
   * Where translations go. Tokens: {locale} (after localeMap), {locale_} (the same with "_"),
   * {lang} (language only), {path} (the source path below the glob's fixed part), {dir}, {name},
   * {stem}, {ext}. Ignored for multi-locale formats (xcstrings).
   */
  target: string;
  /** Source globs to leave out. */
  exclude?: string[];
  /** Adapter options. */
  options?: Record<string, unknown>;
  /** Keys never translated (they fall back to English), such as "admin*". */
  skipKeys?: string[];
  /** Keys that get the AI review pass ("*" for all). */
  highStakes?: string[];
  /** Key glob → maximum characters. */
  limits?: Record<string, number>;
  /** Keys whose translation may equal the English. */
  sameAllowed?: string[];
  /** Locale code → code used in paths and files ("pt-BR" → "pt" for app_pt.arb). */
  localeMap?: Record<string, string>;
  /** Only these locales (default: all). */
  locales?: string[];
  /**
   * Not translated yet: `prepare` skips it unless `--surface` names it. `check` and `report`
   * still count it, so the coverage report shows the whole picture.
   */
  paused?: boolean;
}

export interface ProjectConfig {
  /** Project root, relative to this file's folder. Default "..". */
  root?: string;
  locales?: string;
  glossary?: string;
  /** Folder of style guides: <locale>.md, else <language>.md. */
  styleDir?: string;
  /** A Markdown file about the product, put at the top of every packet. */
  brief?: string;
  lockDir?: string;
  memoryDir?: string;
  /** More translation memory folders to read (shared across projects). "~" is allowed. */
  sharedMemory?: string[];
  /** Where prepare writes runs. Keep it out of git. */
  workDir?: string;
  /** English words per packet. Default 4000. */
  packetWords?: number;
  surfaces: SurfaceConfig[];
}

export interface Project {
  configPath: string;
  configDir: string;
  root: string;
  config: ProjectConfig;
  locales: LocalesFile;
  glossary: Glossary;
  styleDir: string;
  briefPath: string | null;
  lockDir: string;
  memoryDirs: string[];
  workDir: string;
  packetWords: number;
}

export interface SourceFile {
  abs: string;
  /** Relative to the project root, with "/". */
  rel: string;
  /** Relative to the glob's fixed part (the file name for a plain path), with "/". */
  path: string;
}

const CONFIG_NAMES = [join("l10n", "l10n.config.json"), "l10n.config.json"];

/** Finds l10n.config.json from a folder upward. */
export function findConfig(from: string = process.cwd()): string | null {
  let dir = resolve(from);
  for (;;) {
    for (const name of CONFIG_NAMES) {
      const p = join(dir, name);
      if (existsSync(p)) return p;
    }
    const up = dirname(dir);
    if (up === dir) return null;
    dir = up;
  }
}

function readJson<T>(path: string): T {
  try {
    return JSON.parse(readFileSync(path, "utf8")) as T;
  } catch (e) {
    throw new Error(`${path}: ${(e as Error).message}`);
  }
}

function expandHome(p: string): string {
  return p.startsWith("~/") ? join(homedir(), p.slice(2)) : p;
}

export function loadProject(configPath: string): Project {
  const abs = resolve(configPath);
  const config = readJson<ProjectConfig>(abs);
  const configDir = dirname(abs);
  const at = (p: string | undefined, fallback: string) =>
    resolve(configDir, expandHome(p ?? fallback));
  if (!Array.isArray(config.surfaces)) throw new Error(`${abs}: "surfaces" must be a list`);
  const ids = new Set<string>();
  for (const s of config.surfaces) {
    if (!s.id || !s.adapter || !s.source)
      throw new Error(`${abs}: every surface needs id, adapter and source`);
    if (ids.has(s.id)) throw new Error(`${abs}: surface "${s.id}" appears twice`);
    ids.add(s.id);
  }
  const localesPath = at(config.locales, "locales.json");
  const locales = readJson<LocalesFile>(localesPath);
  if (!Array.isArray(locales.locales)) throw new Error(`${localesPath}: "locales" must be a list`);
  return {
    configPath: abs,
    configDir,
    root: at(config.root, ".."),
    config,
    locales: { ...locales, source: locales.source ?? "en" },
    glossary: loadGlossary(at(config.glossary, "glossary.json")),
    styleDir: at(config.styleDir, "style"),
    briefPath: config.brief ? at(config.brief, config.brief) : null,
    lockDir: at(config.lockDir, "lock"),
    memoryDirs: [
      at(config.memoryDir, "memory"),
      ...(config.sharedMemory ?? []).map((p) => at(p, p)),
    ],
    workDir: at(config.workDir, "work"),
    packetWords: config.packetWords ?? 4000,
  };
}

export function localeEntry(project: Project, code: string): LocaleEntry | undefined {
  return project.locales.locales.find((l) => l.code === code);
}

export function mappedLocale(surface: SurfaceConfig, locale: string): string {
  return surface.localeMap?.[locale] ?? locale;
}

const GLOB_CHARS = /[*?[{]/;

export function isGlob(surface: SurfaceConfig): boolean {
  return GLOB_CHARS.test(surface.source);
}

/** The part of a glob before its first wildcard segment. */
function globBase(pattern: string): string {
  const parts = pattern.split("/");
  const fixed: string[] = [];
  for (const p of parts) {
    if (GLOB_CHARS.test(p)) break;
    fixed.push(p);
  }
  return fixed.join("/");
}

function toPosix(p: string): string {
  return sep === "/" ? p : p.split(sep).join("/");
}

function fillTarget(surface: SurfaceConfig, file: SourceFile, locale: string): string {
  const mapped = mappedLocale(surface, locale);
  const name = file.path.split("/").pop() ?? file.path;
  const dot = name.lastIndexOf(".");
  const dir = file.path.includes("/") ? file.path.slice(0, file.path.lastIndexOf("/")) : "";
  return surface.target
    .replaceAll("{locale}", mapped)
    .replaceAll("{locale_}", mapped.replace(/-/g, "_"))
    .replaceAll("{lang}", languageOf(locale))
    .replaceAll("{path}", file.path)
    .replaceAll("{dir}", dir)
    .replaceAll("{name}", name)
    .replaceAll("{stem}", dot > 0 ? name.slice(0, dot) : name)
    .replaceAll("{ext}", dot > 0 ? name.slice(dot + 1) : "")
    .replace(/\/{2,}/g, "/");
}

/** Every locale the project knows, the pseudo-locale included. */
function allLocaleCodes(project: Project): string[] {
  const codes = project.locales.locales.map((l) => l.code);
  if (project.locales.pseudo) codes.push(project.locales.pseudo);
  return codes;
}

/** A regex matching any target path of the surface, so a glob never picks up translations. */
function targetMatcher(project: Project, surface: SurfaceConfig): (rel: string) => boolean {
  const res = allLocaleCodes(project).map((code) => {
    const mapped = mappedLocale(surface, code);
    const esc = (s: string) => s.replace(/[.+^$()|[\]\\]/g, "\\$&");
    const pattern = esc(surface.target)
      .replaceAll("\\{locale\\}", esc(mapped))
      .replaceAll("{locale}", esc(mapped))
      .replaceAll("{locale_}", esc(mapped.replace(/-/g, "_")))
      .replaceAll("{lang}", esc(languageOf(code)))
      .replaceAll("{path}", ".+")
      .replace(/\{(dir|name|stem|ext)\}/g, "[^/]*");
    return new RegExp(`^${pattern}$`);
  });
  return (rel) => res.some((re) => re.test(rel));
}

export function sourceFiles(project: Project, surface: SurfaceConfig): SourceFile[] {
  if (!isGlob(surface)) {
    const abs = resolve(project.root, surface.source);
    if (!existsSync(abs)) return [];
    const rel = toPosix(relative(project.root, abs));
    return [{ abs, rel, path: rel.split("/").pop() ?? rel }];
  }
  const base = globBase(surface.source);
  const isTarget = targetMatcher(project, surface);
  const excluded = (rel: string) =>
    /(^|\/)(node_modules|\.git)(\/|$)/.test(rel) ||
    !!surface.exclude?.some((g) => matchesGlob(rel, g));
  const files = globSync(surface.source, {
    cwd: project.root,
    exclude: (p: string) => excluded(toPosix(p)),
  })
    .map(toPosix)
    .filter((rel) => !excluded(rel))
    .filter((rel) => !isTarget(rel))
    .sort();
  return files.map((rel) => ({
    abs: resolve(project.root, rel),
    rel,
    path: base ? rel.slice(base.length).replace(/^\//, "") : rel,
  }));
}

export function targetFile(
  project: Project,
  surface: SurfaceConfig,
  file: SourceFile,
  locale: string,
  multiLocale: boolean,
): { abs: string; rel: string } {
  if (multiLocale) return { abs: file.abs, rel: file.rel };
  const rel = fillTarget(surface, file, locale);
  return { abs: resolve(project.root, rel), rel };
}

/** The key a unit has in the lock file, memory and packets. */
export function fullKey(surface: SurfaceConfig, file: SourceFile, unitKey: string): string {
  if (!unitKey) return file.path;
  return isGlob(surface) ? `${file.path}::${unitKey}` : unitKey;
}

/** The style guide for a locale ("pt-BR.md", else "pt.md"), or null. */
export function styleGuidePath(project: Project, locale: string): string | null {
  for (const name of [`${locale}.md`, `${languageOf(locale)}.md`]) {
    const p = join(project.styleDir, name);
    if (existsSync(p)) return p;
  }
  return null;
}

/** Whether ICU apostrophe quoting is on: the `apostrophes` option, else on for ICU JSON catalogs. */
export function apostrophesFor(surface: SurfaceConfig): boolean {
  const opt = surface.options?.apostrophes;
  if (typeof opt === "boolean") return opt;
  return surface.adapter === "json" && surface.options?.messageFormat === "icu";
}
