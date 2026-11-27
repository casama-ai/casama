/**
 * chrome.i18n message catalogs: `_locales/en/messages.json` in, `_locales/<xx>/messages.json` out.
 * Each key holds `message`, an optional `description` and the `placeholders` its `$name$` tokens
 * refer to. A translated file holds the translated keys in the source's order, each with its
 * message and the source's placeholders (Chrome looks them up in the locale's own file).
 *
 * A description saying "at most N characters" sets the length limit. The manifest's store keys
 * have the Chrome Web Store's limits by default.
 */
import { type Adapter, AdapterError, type Unit } from "../types.ts";
import { jsonText } from "../util.ts";

/** Chrome Web Store limits for the strings the manifest names. */
const STORE_LIMITS = new Map([
  ["extName", 75],
  ["extShortName", 12],
  ["extDescription", 132],
]);

interface Message {
  message: string;
  description?: unknown;
  placeholders?: Record<string, unknown>;
}

const isObject = (v: unknown): v is Record<string, unknown> =>
  !!v && typeof v === "object" && !Array.isArray(v);

function parseMessages(content: string, path: string): [string, Message][] {
  let data: unknown;
  try {
    data = JSON.parse(content.replace(/^\uFEFF/, ""));
  } catch (e) {
    throw new AdapterError(path, `not valid JSON: ${(e as Error).message}`);
  }
  if (!isObject(data)) throw new AdapterError(path, "a messages.json file must be a JSON object");
  return Object.entries(data).map(([key, value]) => {
    if (!isObject(value) || typeof value.message !== "string")
      throw new AdapterError(path, `${key} must be an object with a "message" string`);
    if (value.placeholders !== undefined && !isObject(value.placeholders))
      throw new AdapterError(path, `${key}: "placeholders" must be an object`);
    return [key, value as unknown as Message];
  });
}

/** The smaller of the key's store limit and the one its description states. */
function maxLengthOf(key: string, description: string): number | undefined {
  const stated = /at most (\d+) characters/i.exec(description)?.[1];
  const limits = [STORE_LIMITS.get(key), stated === undefined ? undefined : Number(stated)].filter(
    (n) => n !== undefined,
  );
  return limits.length ? Math.min(...limits) : undefined;
}

export const chromeMessagesAdapter: Adapter = {
  id: "chrome-messages",
  mode: "kv",

  read(content, ctx) {
    return parseMessages(content, ctx.path).map(([key, entry]) => {
      const unit: Unit = { key, text: entry.message, kind: "plain", tokens: ["chrome"] };
      const description = typeof entry.description === "string" ? entry.description.trim() : "";
      if (description) unit.description = description;
      const placeholders = Object.entries(entry.placeholders ?? {}).map(([name, p]) => {
        // Without an example, what the placeholder is filled with ("$1") is the best hint.
        const hint = isObject(p) ? (p.example ?? p.content) : undefined;
        return [name, typeof hint === "string" ? { example: hint } : {}] as const;
      });
      if (placeholders.length) unit.placeholders = Object.fromEntries(placeholders);
      const maxLength = maxLengthOf(key, description);
      if (maxLength !== undefined) unit.maxLength = maxLength;
      return unit;
    });
  },

  readTarget(content, ctx) {
    const values = new Map(
      parseMessages(content, ctx.path).map(([key, entry]) => [key, entry.message]),
    );
    return { kind: "keys", values };
  },

  write(input, ctx) {
    const out: [string, Message][] = [];
    for (const [key, entry] of parseMessages(input.source, ctx.path)) {
      const message = input.translations.get(key);
      if (message === undefined) continue;
      out.push([
        key,
        entry.placeholders ? { message, placeholders: entry.placeholders } : { message },
      ]);
    }
    return jsonText(Object.fromEntries(out));
  },
};
