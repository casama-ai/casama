/**
 * Work packets: self-contained Markdown files an agent reads and answers with one JSON file.
 * A packet holds the rules, the product brief, the language's style guide, the glossary entries
 * its strings use, and the strings themselves with their context.
 */
import type { GlossaryHit } from "./glossary.ts";
import type { MessageKind } from "./types.ts";

export interface PacketItem {
  id: string;
  surface: string;
  key: string;
  en: string;
  format: MessageKind;
  description?: string;
  placeholders?: Record<string, { type?: string; example?: string }>;
  maxLength?: number;
  note?: string;
  plural?: string;
  glossary?: string[];
  memory?: { en: string; translation: string; match: number; reviewed?: boolean }[];
  /** The current translation of a string whose English changed (translate mode). */
  previous?: string;
  /** Why the last attempt was rejected. */
  retry?: string;
  /** Neighbouring strings that aren't in this packet. */
  context?: string[];
  /** Review mode: the translation to review, and the checks' warnings. */
  translation?: string;
  warnings?: string[];
}

export interface PacketInput {
  id: string;
  mode: "translate" | "review";
  locale: string;
  localeName: string;
  resultPath: string;
  productBrief: string | null;
  styleGuide: string | null;
  surfaces: { id: string; context?: string }[];
  glossaryRows: GlossaryHit[];
  keep: string[];
  items: PacketItem[];
}

function kindRules(items: PacketItem[]): string[] {
  const kinds = new Set(items.map((i) => i.format));
  const rules: string[] = [];
  if (kinds.has("icu"))
    rules.push(
      "`format: icu` strings are ICU messages. Keep every `{placeholder}` spelled exactly the same. In `{n, plural, …}` and `{x, select, …}` keep the variable name and the word `plural`/`select`, and translate only the text inside each branch. Keep every select branch. A plural must have `other`. Give the plural forms your language needs (see `plural` on the item); you may drop `=1` or `one` only if your language has no such form. Never translate text inside `{…}` that is not inside a branch.",
    );
  if (kinds.has("html"))
    rules.push(
      "`format: html` strings hold inline HTML. Keep every tag and attribute exactly as written (class, href, id, aria-*). Translate only the visible text, and `alt`/`title` text. You may move a tag pair to fit your word order.",
    );
  if (kinds.has("markdown"))
    rules.push(
      "`format: markdown` strings are one Markdown block each. Keep inline `code`, link targets `](…)`, `{{ … }}` and `{#anchors}` exactly. Translate link text. Keep `**bold**` and `*emphasis*` markers around the matching words. Never add a line break.",
    );
  if (items.some((i) => i.format === "plain"))
    rules.push(
      "`format: plain` strings are plain text. Keep placeholders such as `%@`, `%d`, `%1$s`, `$NAME$`, `$1`, `{name}` and `{}` exactly, as often as the English has them. Keep line breaks where the English has them.",
    );
  return rules;
}

export function renderPacket(p: PacketInput): string {
  const review = p.mode === "review";
  const lines: string[] = [];
  const shape = review
    ? `{"packet": "${p.id}", "locale": "${p.locale}", "translations": {"s12-Qx4": "corrected text"}, "notes": {"s12-Qx4": "why"}}`
    : `{"packet": "${p.id}", "locale": "${p.locale}", "translations": {"s1-k7f": "…", "s2-Bq0": "…"}}`;
  lines.push(
    `# ${review ? "Review" : "Translation"} packet ${p.id}: ${p.localeName} (\`${p.locale}\`)`,
    "",
  );
  if (review) {
    lines.push(
      `Review these ${p.items.length} translations from English into ${p.localeName}. Each item has the English (\`en\`) and the current translation (\`translation\`). Read them as a native ${p.localeName} speaker and product writer. Fix wrong meaning, a dropped condition or promise, wrong terms (see the glossary), unnatural or stiff wording, wrong tone or form of address, and text that is too long for its place. Leave good translations alone.`,
      "",
      "Write your answer as one JSON file:",
      "",
      `- Path: \`${p.resultPath}\``,
      `- Shape: \`${shape}\``,
      "- List only the strings you change, by their `id`, with the whole corrected text. Give a short reason for each in `notes`. Every string you don't list counts as approved.",
      "",
    );
  } else {
    lines.push(
      `Translate these ${p.items.length} strings from English into ${p.localeName}. They are real product text. Write the way a native ${p.localeName} product writer would: natural, plain and friendly, never word for word. Follow the style guide and the glossary below.`,
      "",
      "Write your answer as one JSON file:",
      "",
      `- Path: \`${p.resultPath}\``,
      `- Shape: \`${shape}\``,
      "- Give every item, by its `id`, copied exactly from that item (ids are not in counting order). The value is the translated text only.",
      "- Write the file yourself. Do not change any other file.",
      "",
    );
  }
  lines.push("## Rules", "");
  const rules = [
    "Keep brand and product names exactly as written (see “Keep as written”).",
    ...kindRules(p.items),
    "`maxLength` is a hard limit in characters. Stay under it, even if you must shorten.",
    "Short labels (buttons, tabs, titles) should stay about as short as the English.",
    "`description`, `note` and `context` are there to help you; never translate or copy them.",
    "`memory` shows earlier translations of similar English. Reuse their wording when it fits; the English may differ, so check.",
    "`previous` is the current translation of English that has since changed. Update it to match the new English.",
    "`retry` says why your last attempt was rejected. Fix that.",
  ];
  for (const r of rules) lines.push(`- ${r}`);
  lines.push("");
  if (p.productBrief) lines.push("## The product", "", p.productBrief.trim(), "");
  if (p.surfaces.some((s) => s.context)) {
    lines.push("## Where these strings appear", "");
    for (const s of p.surfaces) if (s.context) lines.push(`- \`${s.id}\`: ${s.context}`);
    lines.push("");
  }
  lines.push(`## Style guide (${p.localeName})`, "");
  lines.push(
    p.styleGuide?.trim() ||
      "No style guide yet. Use a friendly, plain, modern tone and your language's usual punctuation.",
    "",
  );
  if (p.keep.length)
    lines.push("## Keep as written", "", p.keep.map((k) => `\`${k}\``).join(", "), "");
  if (p.glossaryRows.length) {
    lines.push(
      "## Glossary",
      "",
      `| English | ${p.localeName} | Never write | Note |`,
      "|---|---|---|---|",
    );
    const cell = (s: string) => s.replace(/\|/g, "\\|").replace(/\n/g, " ");
    for (const r of p.glossaryRows) {
      const forms = Object.entries(r.forms ?? {}).map(([k, v]) => `${k}: ${v}`);
      const target = r.target
        ? `${r.target}${forms.length ? ` (${forms.join("; ")})` : ""}`
        : r.rule === "translate"
          ? "(translate in context)"
          : "";
      lines.push(
        `| ${cell(r.en)} | ${cell(target)} | ${cell(r.avoid.join(", "))} | ${cell(r.note ?? "")} |`,
      );
    }
    lines.push("");
  }
  // One item per line keeps the packet small; `surface` is left out when there is only one.
  const oneSurface = new Set(p.items.map((i) => i.surface)).size === 1;
  const rows = p.items.map((i) => JSON.stringify(oneSurface ? { ...i, surface: undefined } : i));
  if (oneSurface && p.items[0])
    lines.push(`## Strings (${p.items.length}, all from \`${p.items[0].surface}\`)`);
  else lines.push(`## Strings (${p.items.length})`);
  lines.push("", "```json", `[\n${rows.join(",\n")}\n]`, "```", "");
  return lines.join("\n");
}

export interface ResultFile {
  packet?: string;
  locale?: string;
  translations: Record<string, string>;
  notes?: Record<string, string>;
}

/** Reads an agent's result, forgiving a Markdown code fence around the JSON. */
export function parseResult(text: string, path: string): ResultFile {
  let body = text.trim();
  const fence = /^```(?:json)?\s*\n([\s\S]*?)\n```\s*$/.exec(body);
  if (fence) body = fence[1] ?? "";
  let data: unknown;
  try {
    data = JSON.parse(body);
  } catch (e) {
    throw new Error(`${path}: not valid JSON (${(e as Error).message})`);
  }
  if (!data || typeof data !== "object") throw new Error(`${path}: expected a JSON object`);
  const obj = data as Record<string, unknown>;
  const raw = (
    obj.translations && typeof obj.translations === "object" ? obj.translations : obj
  ) as Record<string, unknown>;
  const translations: Record<string, string> = {};
  // Keep every string answer, even with a malformed id, so apply reports it as unknown
  // instead of silently treating the item as approved.
  const meta = new Set(["packet", "locale", "notes", "translations"]);
  const bare = raw === obj;
  for (const [k, v] of Object.entries(raw))
    if (typeof v === "string" && !(bare && meta.has(k))) translations[k] = v;
  const out: ResultFile = { translations };
  if (typeof obj.packet === "string") out.packet = obj.packet;
  if (typeof obj.locale === "string") out.locale = obj.locale;
  if (obj.notes && typeof obj.notes === "object") out.notes = obj.notes as Record<string, string>;
  return out;
}
