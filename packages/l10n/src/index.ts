/**
 * l10n-kit as a library. The CLI (`l10n-kit`) is a thin wrapper around these.
 *
 *   const session = new Session(loadProject("l10n/l10n.config.json"));
 *   const run = prepare(session, { locales: ["de"] });
 *   // … an agent writes the result files …
 *   apply(new Session(loadProject("l10n/l10n.config.json")), [run.runDir]);
 */

export * from "./adapters/index.ts";
export { adapterIds, getAdapter, registerAdapter } from "./adapters/index.ts";
export { type ApplyOptions, type ApplySummary, apply } from "./apply.ts";
export * from "./checks.ts";
export * from "./config.ts";
export * from "./glossary.ts";
export * from "./icu.ts";
export { type Failure, type LocaleLock, Lock, type LockEntry } from "./lock.ts";
export { type FuzzyMatch, Memory, type MemoryEntry } from "./memory.ts";
export { type PacketItem, parseResult, renderPacket } from "./packets.ts";
export * from "./plural.ts";
export { type Manifest, type PrepareOptions, type PrepareSummary, prepare } from "./prepare.ts";
export { pseudoText, writePseudo } from "./pseudo.ts";
export { type CheckSummary, type Coverage, check, report } from "./report.ts";
export { Session } from "./session.ts";
export * from "./types.ts";
export { charLength, displayWidth, hashText, segmentKey, wordCount } from "./util.ts";
