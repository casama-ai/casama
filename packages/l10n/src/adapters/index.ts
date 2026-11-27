import type { Adapter } from "../types.ts";
import { androidStringsAdapter } from "./android-strings.ts";
import { appleStringsAdapter } from "./apple-strings.ts";
import { arbAdapter } from "./arb.ts";
import { chromeMessagesAdapter } from "./chrome-messages.ts";
import { htmlAdapter } from "./html.ts";
import { jsonAdapter } from "./json.ts";
import { markdownAdapter } from "./markdown.ts";
import { textAdapter } from "./text.ts";
import { xcstringsAdapter } from "./xcstrings.ts";

const builtIn: Adapter[] = [
  arbAdapter,
  jsonAdapter,
  textAdapter,
  markdownAdapter,
  htmlAdapter,
  appleStringsAdapter,
  xcstringsAdapter,
  androidStringsAdapter,
  chromeMessagesAdapter,
];

const registry = new Map<string, Adapter>(builtIn.map((a) => [a.id, a]));

/** Adds or replaces an adapter (for formats outside the kit). */
export function registerAdapter(adapter: Adapter): void {
  registry.set(adapter.id, adapter);
}

export function getAdapter(id: string): Adapter {
  const a = registry.get(id);
  if (!a) throw new Error(`Unknown adapter "${id}". Known: ${[...registry.keys()].join(", ")}`);
  return a;
}

export function adapterIds(): string[] {
  return [...registry.keys()];
}

export {
  androidStringsAdapter,
  appleStringsAdapter,
  arbAdapter,
  chromeMessagesAdapter,
  htmlAdapter,
  jsonAdapter,
  markdownAdapter,
  textAdapter,
  xcstringsAdapter,
};
