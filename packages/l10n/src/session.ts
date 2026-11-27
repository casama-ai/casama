/** Caches what a command works with: source files, lock files and memories. */
import { type Project, type SurfaceConfig, sourceFiles } from "./config.ts";
import { Lock } from "./lock.ts";
import { Memory } from "./memory.ts";
import { type LoadedSource, loadSource } from "./state.ts";

export class Session {
  readonly project: Project;
  /** Hand edits found in target files were made by an AI reviewer, not a person: mark them `a`, not `r`. */
  aiEdits = false;
  private readonly locks = new Map<string, Lock>();
  private readonly memories = new Map<string, Memory>();
  private readonly sourcesBySurface = new Map<string, LoadedSource[]>();

  constructor(project: Project) {
    this.project = project;
  }

  surfaces(ids?: string[]): SurfaceConfig[] {
    const all = this.project.config.surfaces;
    if (!ids?.length) return all;
    const unknown = ids.filter((id) => !all.some((s) => s.id === id));
    if (unknown.length) throw new Error(`Unknown surface(s): ${unknown.join(", ")}`);
    return all.filter((s) => ids.includes(s.id));
  }

  /** Locales to work on: the given ones, else every locale with `translate: true`. */
  locales(
    wanted?: string[],
    filter: (l: { translate: boolean; ship: boolean }) => boolean = (l) => l.translate,
  ): string[] {
    const known = this.project.locales.locales;
    if (wanted?.length) {
      const unknown = wanted.filter((c) => !known.some((l) => l.code === c));
      if (unknown.length)
        throw new Error(`Unknown locale(s): ${unknown.join(", ")} (see locales.json)`);
      return wanted;
    }
    return known.filter(filter).map((l) => l.code);
  }

  lock(surface: SurfaceConfig): Lock {
    let l = this.locks.get(surface.id);
    if (!l) {
      l = new Lock(this.project.lockDir, surface.id);
      this.locks.set(surface.id, l);
    }
    return l;
  }

  memory(locale: string): Memory {
    let m = this.memories.get(locale);
    if (!m) {
      m = new Memory(this.project.memoryDirs, locale);
      this.memories.set(locale, m);
    }
    return m;
  }

  sources(surface: SurfaceConfig): LoadedSource[] {
    let s = this.sourcesBySurface.get(surface.id);
    if (!s) {
      s = sourceFiles(this.project, surface).map((f) => loadSource(this.project, surface, f));
      this.sourcesBySurface.set(surface.id, s);
    }
    return s;
  }

  /** Writes every changed lock and memory file. Returns the paths written. */
  save(): string[] {
    const written: string[] = [];
    for (const l of this.locks.values()) if (l.save()) written.push(l.path);
    for (const m of this.memories.values()) if (m.save()) written.push(`memory/${m.locale}.json`);
    return written;
  }
}
