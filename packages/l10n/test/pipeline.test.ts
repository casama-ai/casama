/**
 * The whole loop on a tiny project, with fake agent answers: prepare → result files → apply →
 * check → report, plus failures and retries, stale strings, hand edits, the review pass, memory
 * reuse and the pseudo-locale.
 */
import { existsSync, mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { dirname, join } from "node:path";
import { afterEach, beforeEach, describe, expect, it } from "vitest";
import { apply } from "../src/apply.ts";
import { loadProject } from "../src/config.ts";
import type { Manifest } from "../src/prepare.ts";
import { prepare } from "../src/prepare.ts";
import { writePseudo } from "../src/pseudo.ts";
import { check, report } from "../src/report.ts";
import { Session } from "../src/session.ts";

let root: string;

function write(rel: string, content: string) {
  const p = join(root, rel);
  mkdirSync(dirname(p), { recursive: true });
  writeFileSync(p, content);
}
const read = (rel: string) => readFileSync(join(root, rel), "utf8");
const session = () => new Session(loadProject(join(root, "l10n/l10n.config.json")));
const manifestOf = (runDir: string) =>
  JSON.parse(readFileSync(join(runDir, "manifest.json"), "utf8")) as Manifest;

/** Fake translations: German-ish for each English text, keeping placeholders. */
const FAKE: Record<string, string> = {
  Cancel: "Abbrechen",
  "Try again": "Erneut versuchen",
  "Hello {name}": "Hallo {name}",
  "{n, plural, =1{1 file} other{{n} files}}": "{n, plural, one{1 Datei} other{{n} Dateien}}",
  "Pay now": "Jetzt bezahlen",
  "Casama: AI bots": "Casama: KI-Bots",
  "Getting started": "Erste Schritte",
  "Run `casama login` first.": "Führe zuerst `casama login` aus.",
};

function answer(runDir: string, override: Record<string, string> = {}) {
  const m = manifestOf(runDir);
  const s = session();
  for (const p of m.packets) {
    const translations: Record<string, string> = {};
    for (const item of p.items) {
      const surface = s.surfaces([item.surface])[0];
      const unit =
        surface &&
        s
          .sources(surface)
          .flatMap((x) => x.units)
          .find((u) => u.fullKey === item.key);
      const en = unit?.text ?? "";
      translations[item.id] = override[en] ?? FAKE[en] ?? `DE ${en}`;
    }
    writeFileSync(
      join(runDir, p.result),
      JSON.stringify({ packet: p.id, locale: p.locale, translations }),
    );
  }
}

beforeEach(() => {
  root = mkdtempSync(join(tmpdir(), "l10n-kit-"));
  write(
    "l10n/l10n.config.json",
    JSON.stringify({
      brief: "brief.md",
      surfaces: [
        {
          id: "app",
          adapter: "arb",
          source: "app/l10n/app_en.arb",
          target: "app/l10n/app_{locale_}.arb",
          localeMap: { "pt-BR": "pt" },
          skipKeys: ["admin*"],
          highStakes: ["pay*"],
        },
        {
          id: "store",
          adapter: "text",
          source: "store/en-US/*.txt",
          target: "store/{locale}/{path}",
          limits: { "name.txt": 30 },
        },
        { id: "docs", adapter: "markdown", source: "docs/**/*.md", target: "docs/{locale}/{path}" },
        {
          id: "later",
          adapter: "text",
          source: "later/en/*.txt",
          target: "later/{locale}/{path}",
          paused: true,
        },
      ],
    }),
  );
  write(
    "l10n/locales.json",
    JSON.stringify({
      source: "en",
      pseudo: "en-XA",
      locales: [
        { code: "de", name: "Deutsch", english: "German", translate: true, ship: false },
        {
          code: "pt-BR",
          name: "Português",
          english: "Portuguese (Brazil)",
          translate: false,
          ship: false,
        },
      ],
    }),
  );
  write("l10n/brief.md", "Casama is an app where people give AI bots jobs.");
  write(
    "l10n/glossary.json",
    JSON.stringify({
      version: 1,
      sourceLocale: "en",
      locales: ["de"],
      terms: [
        {
          id: "casama",
          term: "Casama",
          variants: [],
          rule: "keep",
          caseSensitive: true,
          translations: {},
        },
      ],
    }),
  );
  write("l10n/style/de.md", "Use du.");
  write(
    "app/l10n/app_en.arb",
    JSON.stringify(
      {
        "@@locale": "en",
        cancel: "Cancel",
        "@cancel": { description: "Closes a sheet." },
        retry: "Try again",
        hello: "Hello {name}",
        files: "{n, plural, =1{1 file} other{{n} files}}",
        payNow: "Pay now",
        adminOnly: "Owner only",
      },
      null,
      2,
    ),
  );
  write("store/en-US/name.txt", "Casama: AI bots\n");
  write(
    "docs/start.md",
    "# Getting started\n\nRun `casama login` first.\n\n```sh\ncasama login\n```\n",
  );
  write("later/en/a.txt", "Later\n");
});

afterEach(() => rmSync(root, { recursive: true, force: true }));

describe("a translation run", () => {
  it("prepares packets with everything the agent needs", () => {
    const r = prepare(session());
    expect(r.runDir).toBeTruthy();
    expect(r.perLocale.de).toMatchObject({ strings: 8, packets: 1 });
    expect(r.perLocale["pt-BR"]).toBeUndefined(); // translate: false
    const packet = readFileSync(join(r.runDir as string, "de-001.md"), "utf8");
    expect(packet).toContain("Casama is an app where people give AI bots jobs.");
    expect(packet).toContain("Use du.");
    expect(packet).toContain('"description":"Closes a sheet."');
    expect(packet).toContain('"plural":"German plural forms: one, other"');
    expect(packet).toContain('"maxLength":30');
    expect(packet).toContain("de-001.result.json");
    expect(packet).not.toContain("Owner only"); // skipKeys
    expect(packet).not.toContain("Later"); // paused surface
    expect(packet).toContain("`Casama`"); // keep list
  });

  it("applies good results, writes every format, and reports 100%", () => {
    const run = prepare(session()).runDir as string;
    answer(run);
    const r = apply(session(), [run]);
    expect(r.failed).toEqual([]);
    expect(r.applied).toBe(8);
    expect(JSON.parse(read("app/l10n/app_de.arb"))).toEqual({
      "@@locale": "de",
      cancel: "Abbrechen",
      retry: "Erneut versuchen",
      hello: "Hallo {name}",
      files: "{n, plural, one{1 Datei} other{{n} Dateien}}",
      payNow: "Jetzt bezahlen",
    });
    expect(read("store/de/name.txt")).toBe("Casama: KI-Bots\n");
    expect(read("docs/de/start.md")).toBe(
      "# Erste Schritte\n\nFühre zuerst `casama login` aus.\n\n```sh\ncasama login\n```\n",
    );
    expect(existsSync(join(root, "l10n/lock/app.json"))).toBe(true);
    expect(JSON.parse(read("l10n/memory/de.json")).entries.Cancel).toEqual({ t: "Abbrechen" });

    const c = check(session(), {
      locales: ["de"],
      complete: true,
      surfaces: ["app", "store", "docs"],
    });
    expect(c.errors).toBe(0);
    expect(c.ok).toBe(true);
    const rep = report(session(), { locales: ["de"] });
    expect(rep.coverage.find((x) => x.surface === "app")?.percent).toBe(100);
    expect(rep.coverage.find((x) => x.surface === "later")?.percent).toBe(0);

    // Nothing left to do.
    expect(prepare(session()).runDir).toBeNull();
  });

  it("rejects broken strings, sends them back with the reason, and flags repeat failures", () => {
    const run = prepare(session()).runDir as string;
    answer(run, {
      "Hello {name}": "Hallo {nom}",
      "{n, plural, =1{1 file} other{{n} files}}": "{n, plural, one{1 Datei} other{Dateien}",
      "Casama: AI bots": "Kasama: KI-Bots, die für dich arbeiten",
    });
    const r = apply(session(), [run]);
    expect(r.failed.map((f) => f.key).sort()).toEqual(["files", "hello", "name.txt"]);
    expect(existsSync(join(root, "store/de/name.txt"))).toBe(false);
    expect(JSON.parse(read("app/l10n/app_de.arb")).hello).toBeUndefined();

    const again = prepare(session(), { runId: "retry" });
    expect(again.perLocale.de?.strings).toBe(3);
    const packet = readFileSync(join(again.runDir as string, "de-001.md"), "utf8");
    expect(packet).toMatch(/"retry":"[^"]*\{nom\}/);

    answer(again.runDir as string, { "Hello {name}": "Hallo {nom}" });
    const r2 = apply(session(), [again.runDir as string]);
    expect(r2.failed).toEqual([expect.objectContaining({ key: "hello", count: 2 })]);
    expect(
      report(session(), { locales: ["de"] }).coverage.find((c) => c.surface === "app")?.stuck,
    ).toBe(1);
  });

  it("finds stale strings and gives the translator the old translation", () => {
    const run = prepare(session()).runDir as string;
    answer(run);
    apply(session(), [run]);
    const arb = JSON.parse(read("app/l10n/app_en.arb"));
    arb.retry = "Try again later";
    write("app/l10n/app_en.arb", JSON.stringify(arb, null, 2));

    expect(check(session(), { locales: ["de"], complete: true }).incomplete).toEqual(["de"]);
    const next = prepare(session(), { runId: "stale" });
    expect(next.perLocale.de?.strings).toBe(1);
    const packet = readFileSync(join(next.runDir as string, "de-001.md"), "utf8");
    expect(packet).toContain('"previous":"Erneut versuchen"');
  });

  it("keeps hand edits and marks them reviewed", () => {
    const run = prepare(session()).runDir as string;
    answer(run);
    apply(session(), [run]);
    const de = JSON.parse(read("app/l10n/app_de.arb"));
    de.cancel = "Lieber nicht";
    write("app/l10n/app_de.arb", JSON.stringify(de, null, 2));
    write("docs/de/start.md", read("docs/de/start.md").replace("Erste Schritte", "Los geht's"));

    const r = prepare(session(), { runId: "edits" });
    expect(r.edits).toBe(2);
    const lock = JSON.parse(read("l10n/lock/app.json"));
    expect(lock.locales.de.entries.cancel).toMatch(/ r$/);
    expect(JSON.parse(read("l10n/memory/de.json")).entries.Cancel).toEqual({
      t: "Lieber nicht",
      r: true,
    });
    const docsLock = JSON.parse(read("l10n/lock/docs.json"));
    expect(Object.values(docsLock.locales.de.entries).some((e) => String(e).endsWith(" r"))).toBe(
      true,
    );

    // A later write keeps the edit.
    const arb = JSON.parse(read("app/l10n/app_en.arb"));
    arb.newKey = "New thing";
    write("app/l10n/app_en.arb", JSON.stringify(arb, null, 2));
    const next = prepare(session(), { runId: "after-edit" });
    answer(next.runDir as string);
    apply(session(), [next.runDir as string]);
    expect(JSON.parse(read("app/l10n/app_de.arb")).cancel).toBe("Lieber nicht");
    expect(read("docs/de/start.md")).toContain("# Los geht's");
  });

  it("runs the review pass on high-stakes strings", () => {
    const run = prepare(session()).runDir as string;
    answer(run);
    apply(session(), [run]);
    const review = prepare(session(), { review: true, runId: "review" });
    const m = manifestOf(review.runDir as string);
    expect(m.mode).toBe("review");
    // payNow is high-stakes; retry and files passed with warnings (a long label, a dropped =1).
    expect(m.packets.flatMap((p) => p.items.map((i) => i.key))).toEqual([
      "retry",
      "files",
      "payNow",
    ]);
    const packet = readFileSync(join(review.runDir as string, "de-001.md"), "utf8");
    expect(packet).toContain('"translation":"Jetzt bezahlen"');
    const id = m.packets[0]?.items.find((i) => i.key === "payNow")?.id as string;
    writeFileSync(
      join(review.runDir as string, "de-001.result.json"),
      JSON.stringify({
        packet: "de-001",
        translations: { [id]: "Jetzt zahlen" },
        notes: { [id]: "shorter" },
      }),
    );
    const r = apply(session(), [review.runDir as string]);
    expect(r.changedByReview).toBe(1);
    expect(r.approvedByReview).toBe(2);
    expect(r.notes).toEqual([{ locale: "de", key: "payNow", note: "shorter" }]);
    expect(JSON.parse(read("app/l10n/app_de.arb")).payNow).toBe("Jetzt zahlen");
    expect(JSON.parse(read("l10n/lock/app.json")).locales.de.entries.payNow).toMatch(/ aw?$/);
    expect(prepare(session(), { review: true, runId: "review2" }).runDir).toBeNull();
  });

  it("ignores and reports answers under counted ids, so a slip can't shift answers", () => {
    const run = prepare(session()).runDir as string;
    const m = manifestOf(run);
    const items = m.packets[0]?.items ?? [];
    expect(items.every((i) => /^s\d+-[A-Za-z0-9_-]{3}$/.test(i.id))).toBe(true);
    // A translator who counts writes s1, s2… instead of copying each item's id.
    const counted = Object.fromEntries(items.map((_, n) => [`s${n + 1}`, "Falsch"]));
    writeFileSync(
      join(run, "de-001.result.json"),
      JSON.stringify({ packet: "de-001", translations: counted }),
    );
    const r = apply(session(), [run]);
    expect(r.applied).toBe(0);
    expect(r.unknownIds).toEqual([{ file: "de-001.result.json", ids: Object.keys(counted) }]);
    expect(r.unanswered).toBe(items.length);
  });

  it("reports malformed review ids and approves nothing in that answer", () => {
    const run = prepare(session()).runDir as string;
    answer(run);
    apply(session(), [run]);
    const review = prepare(session(), { review: true, runId: "review-bad" });
    writeFileSync(
      join(review.runDir as string, "de-001.result.json"),
      JSON.stringify({ packet: "de-001", translations: { "item-1": "Neu" } }),
    );
    const r = apply(session(), [review.runDir as string]);
    expect(r.unknownIds).toEqual([{ file: "de-001.result.json", ids: ["item-1"] }]);
    expect(r.approvedByReview).toBe(0);
    expect(r.changedByReview).toBe(0);
  });

  it("keeps the lock file's locale order when it saves", () => {
    const run = prepare(session()).runDir as string;
    answer(run);
    apply(session(), [run]);
    const lockPath = "l10n/lock/app.json";
    const lock = JSON.parse(read(lockPath));
    write(lockPath, JSON.stringify({ ...lock, locales: { zz: lock.locales.de, ...lock.locales } }));
    const review = prepare(session(), { review: true, runId: "order" });
    const id = manifestOf(review.runDir as string).packets[0]?.items[0]?.id as string;
    writeFileSync(
      join(review.runDir as string, "de-001.result.json"),
      JSON.stringify({ packet: "de-001", translations: { [id]: "Geändert" } }),
    );
    expect(apply(session(), [review.runDir as string]).changedByReview).toBe(1);
    expect(Object.keys(JSON.parse(read(lockPath)).locales)).toEqual(["zz", "de"]);
  });

  it("records hand edits as AI-reviewed with aiEdits, as person-reviewed without", () => {
    const run = prepare(session()).runDir as string;
    answer(run);
    apply(session(), [run]);
    const arb = JSON.parse(read("app/l10n/app_de.arb"));
    arb.cancel = "Abbruch";
    arb.retry = "Nochmal";
    write("app/l10n/app_de.arb", JSON.stringify(arb));
    const ai = session();
    ai.aiEdits = true;
    prepare(ai, { runId: "edits-ai" });
    ai.save();
    const e = JSON.parse(read("l10n/lock/app.json")).locales.de.entries;
    const flags = (k: string) => (e[k] as string).split(" ")[2] ?? "";
    const edited = Object.keys(e).filter((k) => /a/.test(flags(k)) && !/r/.test(flags(k)));
    expect(edited.length).toBeGreaterThan(0);
    expect(Object.values(e).some((v) => / r/.test(v as string))).toBe(false);
  });

  it("reuses exact memory matches for short text without the agent", () => {
    write(
      "l10n/memory/pt-BR.json",
      JSON.stringify({
        version: 1,
        locale: "pt-BR",
        entries: { Cancel: { t: "Cancelar", r: true } },
      }),
    );
    const r = prepare(session(), { locales: ["pt-BR"], surfaces: ["app"] });
    expect(r.perLocale["pt-BR"]).toMatchObject({ auto: 1, strings: 4 });
    const run = r.runDir as string;
    answer(run);
    apply(session(), [run]);
    expect(JSON.parse(read("app/l10n/app_pt.arb"))).toMatchObject({
      "@@locale": "pt",
      cancel: "Cancelar",
    });
  });

  it("gates releases on shipped locales only", () => {
    expect(check(session(), { shipped: true }).ok).toBe(true); // nothing ships
    const locales = JSON.parse(read("l10n/locales.json"));
    locales.locales[0].ship = true;
    write("l10n/locales.json", JSON.stringify(locales));
    const gate = check(session(), { shipped: true, surfaces: ["app"] });
    expect(gate.ok).toBe(false);
    expect(gate.incomplete).toEqual(["de"]);
  });

  it("writes the pseudo-locale without touching the lock", () => {
    const written = writePseudo(session(), { surfaces: ["app", "docs"] });
    expect(written.sort()).toEqual(["app/l10n/app_en_XA.arb", "docs/en-XA/start.md"]);
    const arb = JSON.parse(read("app/l10n/app_en_XA.arb"));
    expect(arb.hello).toBe("⟦Ĥéļļó {name} óñ⟧");
    expect(arb.files).toBe("⟦{n, plural, =1{1 fíļé} other{{n} fíļéš}} óñ⟧");
    expect(read("docs/en-XA/start.md")).toContain("`casama login`");
    expect(existsSync(join(root, "l10n/lock/app.json"))).toBe(false);
  });
});
