#!/usr/bin/env node
/**
 * l10n-kit: prepare → (an agent translates) → apply → check → report.
 */
import { writeFileSync } from "node:fs";
import { relative, resolve } from "node:path";
import { apply } from "./apply.ts";
import { findConfig, loadProject } from "./config.ts";
import { prepare } from "./prepare.ts";
import { writePseudo } from "./pseudo.ts";
import { check, report } from "./report.ts";
import { Session } from "./session.ts";
import { jsonText } from "./util.ts";

const HELP = `l10n-kit: find new strings, write packets for an agent to translate, check and merge the results.

Usage: l10n-kit <command> [options]

Commands
  prepare             Write work packets for every missing or stale string.
    --review            Instead, packets for the AI review pass (high-stakes and flagged strings).
    --max-words <n>     English words per packet (default from config, else 4000).
    --limit <n>         At most n strings per locale (for a trial run).
  apply <run|files…>  Check an agent's result files and write what passes.
    --reviewed          A person (native reviewer) checked these: mark them reviewed.
  check               Run every check on existing translations. Exit 1 on any error.
    --shipped           The release gate: only locales with "ship": true, and they must be complete.
    --complete          Also fail when anything is missing or stale.
    --warnings          Print warnings too.
  report              Percent translated and reviewed, per locale and surface.
    --out <file>        Also write it as JSON (the nightly task's status file).
  pseudo              Write the pseudo-locale files (accented, longer, in ⟦ ⟧) for tests.

Options for every command
  --config <file>     l10n.config.json (default: found from the current folder upward)
  --locale <a,b>      Only these locales (default: every locale with "translate": true)
  --surface <a,b>     Only these surfaces
  --json              Print the result as JSON
  --ai-edits          Hand edits in the target files were made by an AI reviewer: record them
                      as AI-reviewed (\`a\`), not as checked by a person (\`r\`)

Exit codes: 0 fine, 1 checks failed, 2 usage or setup error.`;

interface Args {
  command: string;
  positional: string[];
  flags: Map<string, string | true>;
}

function parseArgs(argv: string[]): Args {
  // Options may come before or after the command.
  const rest = argv;
  const positional: string[] = [];
  const flags = new Map<string, string | true>();
  const valued = new Set(["config", "locale", "surface", "max-words", "limit", "out", "run-id"]);
  for (let i = 0; i < rest.length; i++) {
    const a = rest[i] as string;
    if (!a.startsWith("--")) {
      positional.push(a);
      continue;
    }
    const [name, inline] = a.slice(2).split("=", 2) as [string, string | undefined];
    if (inline !== undefined) flags.set(name, inline);
    else if (valued.has(name)) {
      const v = rest[++i];
      if (v === undefined) throw new UsageError(`--${name} needs a value`);
      flags.set(name, v);
    } else flags.set(name, true);
  }
  const command = positional.shift() ?? "help";
  return { command, positional, flags };
}

class UsageError extends Error {}

function list(v: string | true | undefined): string[] | undefined {
  return typeof v === "string"
    ? v
        .split(",")
        .map((s) => s.trim())
        .filter(Boolean)
    : undefined;
}

function num(v: string | true | undefined): number | undefined {
  if (typeof v !== "string") return undefined;
  const n = Number(v);
  if (!Number.isInteger(n) || n <= 0)
    throw new UsageError(`expected a positive number, got "${v}"`);
  return n;
}

function pad(s: string | number, n: number): string {
  return String(s).padEnd(n);
}

function main(argv: string[]): number {
  const args = parseArgs(argv);
  if (args.command === "help" || args.flags.has("help") || args.flags.has("h")) {
    console.log(HELP);
    return 0;
  }
  const configPath =
    (args.flags.get("config") as string | undefined) ?? process.env.L10N_CONFIG ?? findConfig();
  if (!configPath) throw new UsageError("No l10n.config.json found here or above; pass --config.");
  const session = new Session(loadProject(configPath));
  session.aiEdits = args.flags.has("ai-edits");
  const json = args.flags.has("json");
  const locales = list(args.flags.get("locale"));
  const surfaces = list(args.flags.get("surface"));
  const rel = (p: string) => relative(process.cwd(), p) || ".";

  switch (args.command) {
    case "prepare": {
      const r = prepare(session, {
        locales,
        surfaces,
        review: args.flags.has("review"),
        maxWords: num(args.flags.get("max-words")),
        limit: num(args.flags.get("limit")),
        runId: args.flags.get("run-id") as string | undefined,
      });
      if (json) {
        console.log(
          JSON.stringify({ runDir: r.runDir, perLocale: r.perLocale, edits: r.edits }, null, 2),
        );
        return 0;
      }
      if (r.edits) console.log(`Kept ${r.edits} hand edit(s) and marked them reviewed.`);
      if (!r.runDir) {
        console.log(
          args.flags.has("review")
            ? "Nothing to review."
            : "Everything is translated. Nothing to do.",
        );
        return 0;
      }
      console.log(`Run folder: ${rel(r.runDir)}`);
      for (const [locale, s] of Object.entries(r.perLocale))
        console.log(
          `  ${pad(locale, 8)} ${s.strings} strings, ${s.words} words, ${s.packets} packet(s)${s.auto ? `, ${s.auto} reused from memory` : ""}`,
        );
      console.log(
        `\nNext: give each <locale>-NNN.md packet to the translating agent. It writes <locale>-NNN.result.json next to it.\nThen: l10n-kit apply ${rel(r.runDir)}`,
      );
      return 0;
    }

    case "apply": {
      const r = apply(
        session,
        args.positional.map((p) => resolve(p)),
        { reviewed: args.flags.has("reviewed") },
      );
      if (json) {
        console.log(JSON.stringify(r, null, 2));
        return 0;
      }
      if (r.mode === "review")
        console.log(`Review: ${r.approvedByReview} approved, ${r.changedByReview} changed.`);
      else console.log(`Applied ${r.applied} translation(s).`);
      if (r.filesWritten.length)
        console.log(`Wrote ${r.filesWritten.length} file(s):\n  ${r.filesWritten.join("\n  ")}`);
      if (r.failed.length) {
        console.log(
          `\n${r.failed.length} string(s) failed the checks. The next prepare sends them back with the reason:`,
        );
        for (const f of r.failed.slice(0, 50))
          console.log(
            `  ${f.locale} ${f.surface}/${f.key}${f.count >= 2 ? " (failed twice: needs a person)" : ""}: ${f.reason}`,
          );
        if (r.failed.length > 50)
          console.log(`  … and ${r.failed.length - 50} more (see apply-report.json)`);
      }
      if (r.warnings.length)
        console.log(
          `\n${r.warnings.length} warning(s) (in apply-report.json; the review pass looks at them).`,
        );
      if (r.unanswered)
        console.log(`${r.unanswered} string(s) had no answer in their result file.`);
      for (const u of r.unknownIds)
        console.log(
          `${u.file}: ${u.ids.length} answer(s) under ids that match no string (${u.ids.slice(0, 5).join(", ")}${u.ids.length > 5 ? ", …" : ""}). They were ignored: copy each id from its item, never count.`,
        );
      if (r.skipped.length)
        console.log(
          `${r.skipped.length} string(s) skipped because the English changed after prepare.`,
        );
      if (r.waiting.length) console.log(`Waiting for: ${r.waiting.join(", ")}`);
      return 0;
    }

    case "check": {
      const r = check(session, {
        locales,
        surfaces,
        shipped: args.flags.has("shipped"),
        complete: args.flags.has("complete"),
      });
      if (json) {
        console.log(JSON.stringify(r, null, 2));
        return r.ok ? 0 : 1;
      }
      if (args.flags.has("shipped") && !r.locales.length) {
        console.log('No locale has "ship": true. Nothing to check.');
        return 0;
      }
      const shown = r.issues.filter((i) => i.severity === "error" || args.flags.has("warnings"));
      for (const i of shown.slice(0, 200))
        console.log(
          `${i.severity === "error" ? "✗" : "!"} ${i.locale} ${i.surface}/${i.key} (${i.file}): ${i.message}`,
        );
      if (shown.length > 200) console.log(`… and ${shown.length - 200} more (use --json)`);
      for (const c of r.coverage)
        if (r.incomplete.includes(c.locale) && c.stale + c.missing > 0)
          console.log(`✗ ${c.locale} ${c.surface}: ${c.missing} missing, ${c.stale} stale`);
      console.log(
        `${r.errors} error(s), ${r.warnings} warning(s) in ${r.locales.join(", ") || "no locales"}.`,
      );
      if (r.incomplete.length)
        console.log(`Incomplete: ${r.incomplete.join(", ")}. Run the translation task first.`);
      return r.ok ? 0 : 1;
    }

    case "report": {
      const r = report(session, { locales, surfaces });
      const out = args.flags.get("out");
      if (typeof out === "string") writeFileSync(resolve(out), jsonText(r));
      if (json) {
        console.log(JSON.stringify(r, null, 2));
        return 0;
      }
      console.log(
        `${pad("surface", 18)}${pad("locale", 9)}${pad("done", 8)}${pad("reviewed", 10)}${pad("stale", 7)}${pad("missing", 9)}failed`,
      );
      for (const c of r.coverage)
        console.log(
          `${pad(c.surface, 18)}${pad(c.locale, 9)}${pad(`${c.percent}%`, 8)}${pad(c.reviewed, 10)}${pad(c.stale, 7)}${pad(c.missing, 9)}${c.failed}${c.stuck ? ` (${c.stuck} stuck)` : ""}`,
        );
      console.log("");
      for (const t of r.totals)
        console.log(
          `${pad(t.locale, 9)} ${t.percent}% of ${t.strings} strings (${t.wordsDone}/${t.words} words), ${t.reviewed} reviewed`,
        );
      return 0;
    }

    case "pseudo": {
      const written = writePseudo(session, { surfaces, locale: locales?.[0] });
      if (json) console.log(JSON.stringify({ written }, null, 2));
      else
        console.log(
          written.length
            ? `Wrote:\n  ${written.join("\n  ")}`
            : "Pseudo-locale files are up to date.",
        );
      return 0;
    }

    default:
      throw new UsageError(`Unknown command "${args.command}". Run l10n-kit help.`);
  }
}

try {
  process.exitCode = main(process.argv.slice(2));
} catch (e) {
  console.error(`l10n-kit: ${(e as Error).message}`);
  process.exitCode = 2;
}
