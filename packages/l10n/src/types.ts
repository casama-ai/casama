/**
 * Shared types for l10n-kit. An adapter turns one file format into translation units and writes
 * translated files back. Everything else (lock file, memory, packets, checks) works on units.
 */

/**
 * How the text of a unit is structured, which decides what the checks compare.
 * - `icu`: an ICU message (`{name}`, `{n, plural, one{…} other{…}}`, `{x, select, …}`).
 * - `plain`: plain text; only the unit's token patterns (see `tokens`) are compared.
 * - `html`: text that may hold inline HTML tags; tags and their attributes must survive.
 * - `markdown`: one Markdown block's text; inline code, link targets and tags must survive.
 */
export type MessageKind = "icu" | "plain" | "html" | "markdown";

/**
 * Placeholder syntaxes that must appear in the translation exactly as often as in the English.
 * - `brace`: `{name}` and `{}` (EasyLocalization, plain JSON catalogs).
 * - `printf`: `%@`, `%d`, `%1$s`, `%lld` (Apple and Android).
 * - `chrome`: `$name$` and `$1` (chrome.i18n messages).
 * - `mustache`: `{{ expr }}` (VitePress and Vue).
 */
export type TokenSet = "brace" | "printf" | "chrome" | "mustache";

/** One translatable string. */
export interface Unit {
  /** Unique within its file. Stable for key-value formats; derived from the text for documents. */
  key: string;
  /** The English source text. */
  text: string;
  kind: MessageKind;
  /** What the string is for, shown to the translator. */
  description?: string;
  /** Named placeholders and an example value each, shown to the translator. */
  placeholders?: Record<string, { type?: string; example?: string }>;
  /** Hard limit in characters (Unicode code points). The surface's `limits` can also set it. */
  maxLength?: number;
  /** Extra token patterns to compare, on top of what `kind` implies. */
  tokens?: TokenSet[];
  /** A short format note for the translator, such as "Android plural: keep %d". */
  note?: string;
}

/** What an adapter knows about the file it is working on. */
export interface AdapterContext {
  /** The surface's `options` from l10n.config.json. */
  options: Record<string, unknown>;
  /** Source locale code, such as "en". */
  sourceLocale: string;
  /** File path relative to the project root, for error messages. */
  path: string;
}

/** Context for reading or writing one target locale. */
export interface TargetContext extends AdapterContext {
  /** Target locale as a BCP 47 code from locales.json, such as "pt-BR" or "zh-Hant". */
  locale: string;
  /**
   * The code the surface's `localeMap` maps it to (or `locale` unchanged), such as "pt" for
   * Flutter's app_pt.arb. Adapters that write a locale into the file use this one.
   */
  mappedLocale: string;
}

/**
 * Translations read back from an existing target file.
 * - `keys`: key-value formats return each unit key with its translated text.
 * - `ordered`: document formats return each segment's text in the order `read()` returns units.
 *   The engine pairs them with the keys it wrote last time (kept in the lock file).
 */
export type TargetRead =
  | { kind: "keys"; values: Map<string, string> }
  | { kind: "ordered"; values: string[] };

export interface WriteInput {
  /** The English source file's content. */
  source: string;
  /** The current target file's content, or null when there is none yet. */
  previous: string | null;
  /**
   * Unit key → translated text, only for translated units. Key-value adapters leave the other
   * keys out (the app falls back to English). Document adapters write the English for them.
   */
  translations: Map<string, string>;
}

export interface Adapter {
  /** The name used in l10n.config.json, such as "arb". */
  id: string;
  /**
   * `kv`: units have stable keys, and a target file can be read back by key.
   * `doc`: units are segments of a document, keyed by their text; read back by position.
   */
  mode: "kv" | "doc";
  /**
   * True when one file holds every locale (Apple .xcstrings). The target path is then the source
   * path, and `write` merges one locale into `previous` (which starts as the source).
   */
  multiLocale?: boolean;
  /** Units in the English source file, in file order. Throws AdapterError on a broken file. */
  read(content: string, ctx: AdapterContext): Unit[];
  /** Translations already in a target file. */
  readTarget(content: string, ctx: TargetContext): TargetRead;
  /** The target file's new content. */
  write(input: WriteInput, ctx: TargetContext): string;
}

export class AdapterError extends Error {
  readonly path: string;
  constructor(path: string, message: string) {
    super(`${path}: ${message}`);
    this.name = "AdapterError";
    this.path = path;
  }
}
