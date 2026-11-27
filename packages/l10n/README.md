# @casama/l10n (l10n-kit)

The bookkeeping half of an AI translation pipeline. An agent does the translating; the kit does
everything else:

- finds strings that are new, changed or missing in each language;
- writes **work packets**: self-contained Markdown files with the strings, their context, the
  glossary entries they use, the language's style guide and translation-memory suggestions;
- **checks** every answer (ICU messages and plural forms, placeholders, HTML tags, Markdown, length
  limits, glossary terms, brand names, untranslated copies) and merges what passes;
- keeps a **lock file** (what each translation was made from) and a **translation memory**.

The kit never calls a model. Any agent that can read a file and write one can translate.

```sh
npx @casama/l10n prepare            # or: l10n-kit prepare
```

## A translation pass

```sh
l10n-kit prepare --locale de        # 1. write packets for what is missing or stale
#                                     2. an agent translates each <locale>-NNN.md packet and
#                                        writes <locale>-NNN.result.json next to it
l10n-kit apply l10n/work/<run>      # 3. check the answers, write what passes
l10n-kit prepare --locale de        # 4. rejected strings come back with the reason; repeat
l10n-kit prepare --review           # 5. packets for the review pass (high-stakes and flagged)
l10n-kit apply l10n/work/<run>-review
l10n-kit check                      # 6. every translation still passes
l10n-kit report                     # 7. percent done per locale and surface
```

Commands and options (`l10n-kit help` prints the same):

| Command | What it does |
|---|---|
| `prepare` | Writes a run folder: packets, `manifest.json`, and `<locale>-auto.result.json` with exact memory matches for short text. `--review` makes review packets instead. `--max-words`, `--limit` |
| `apply <run or result files>` | Checks each answer against the current English and writes what passes. A failure is recorded with its reason; the next `prepare` sends it back. A string that fails twice is marked stuck. `--reviewed` marks the answers as checked by a person |
| `check` | Runs every check on the translations in the files. Exit 1 on an error. `--shipped` is the release gate: only locales with `"ship": true`, and they must be complete. `--complete` fails on missing or stale strings too |
| `report` | Percent translated, reviewed, stale, missing and failed, per locale and surface. `--out <file>` also writes JSON |
| `pseudo` | Writes the pseudo-locale (`en-XA`): accented, about 40% longer, wrapped in `⟦ ⟧`, placeholders untouched. Text without the brackets on screen was never localized |

Every command takes `--config <file>` (default: `l10n/l10n.config.json` or `l10n.config.json`,
found from the current folder upward), `--locale a,b`, `--surface a,b` and `--json`. Exit codes:
0 fine, 1 checks failed, 2 usage or setup error.

## Formats

| Adapter | Files | Notes |
|---|---|---|
| `arb` | Flutter ARB | ICU messages, `@key` descriptions and placeholders. Writes `@@locale` and the translated keys in the template's order. Option `apostrophes` matches gen-l10n's `use-escaping` |
| `json` | JSON catalogs, gallery-style lists | Flat or nested. `messageFormat: "icu"` for ICU catalogs. `items: { path, id, fields }` reads a list and writes an overlay `{ id: { field } }` |
| `text` | One string per file | Store listing folders (`name.txt`, `subtitle.txt`, …) |
| `markdown` | Docs and blog pages | Front matter fields (`frontMatter`, default title and description), headings, paragraphs, lists, tables, VitePress containers. Code blocks stay byte-identical |
| `html` | Pages and fragments | Text blocks with their inline tags, plus `alt`, `title`, `aria-label`, `placeholder` and meta descriptions. `<script>`, `<code>`, `translate="no"` stay untouched. Option `separate` (such as `["nav", ".stores"]`) makes each child of those containers its own segment |
| `apple-strings` | `.strings`, `InfoPlist.strings` | Comments become descriptions. Untranslated keys are left out, so iOS falls back to English |
| `xcstrings` | Xcode String Catalogs | One file for every language; plural variations become ICU plurals for the translator |
| `android-strings` | `res/values/strings.xml` | Strings, plurals (as ICU), string arrays; Android escaping; `translatable="false"` skipped |
| `chrome-messages` | `_locales/<xx>/messages.json` | Placeholders copied to each locale; store limits from the descriptions |

Key-value formats keep a person's edit to a translated file: the kit sees that the text no longer
matches what it wrote, keeps it and marks it reviewed. Document formats (Markdown, HTML) do the
same when the page's structure is unchanged; fix a page's wording, not its structure.

When the edits were made by an AI reviewer, not a person, pass `--ai-edits` to the first
`prepare` or `apply` that sees them: they are then marked `a` (AI-reviewed) instead of `r`, so a
native reviewer's queue still includes them. Whichever command runs first records the edits, so
add the flag to that one.

A new format is one object that implements `Adapter` (`src/types.ts`): `read` the English into
units, `readTarget` a translated file back, and `write` one. Register it with `registerAdapter`.

## Configuration

`l10n.config.json` lists the project's surfaces:

```json
{
  "root": "..",
  "brief": "brief.md",
  "surfaces": [
    {
      "id": "app",
      "adapter": "arb",
      "source": "client/lib/l10n/app_en.arb",
      "target": "client/lib/l10n/app_{locale_}.arb",
      "localeMap": { "pt-BR": "pt" },
      "skipKeys": ["admin*"],
      "highStakes": ["paywall*", "plan*"]
    },
    {
      "id": "store",
      "adapter": "text",
      "source": "store/en-US/*.txt",
      "target": "store/{locale}/{path}",
      "limits": { "name.txt": 30, "subtitle.txt": 30 },
      "paused": true
    }
  ]
}
```

- Paths in a surface are relative to `root` (default: the config folder's parent). Other paths
  are relative to the config folder: `locales` (`locales.json`), `glossary` (`glossary.json`),
  `styleDir` (`style/`), `brief`, `lockDir` (`lock/`), `memoryDir` (`memory/`), `workDir`
  (`work/`, keep it out of git). `sharedMemory` lists more memory folders to read, shared across
  projects.
- `source` is a file or a glob. `target` tokens: `{locale}` (after `localeMap`), `{locale_}` (the
  same with `_`), `{lang}`, `{path}` (below the glob's fixed part), `{dir}`, `{name}`, `{stem}`,
  `{ext}`. A glob never picks up a target file.
- `skipKeys`: never translated. `highStakes`: get the review pass (`"*"` for all). `limits`: key
  glob → maximum characters. `sameAllowed`: keys whose translation may equal the English.
  `context`: one paragraph for the translator. `paused`: `prepare` skips it unless `--surface`
  names it. `locales`: only these locales. `options`: adapter options.

`locales.json`:

```json
{
  "source": "en",
  "pseudo": "en-XA",
  "locales": [
    { "code": "de", "name": "Deutsch", "english": "German", "wave": 1, "translate": true, "ship": false }
  ]
}
```

`translate`: `prepare` works on it by default. `ship`: release builds include it, and
`check --shipped` requires it complete.

Style guides are `style/<locale>.md` (else `style/<language>.md`). Each packet includes the whole
file.

## Glossary

`glossary.json`:

```json
{
  "version": 1,
  "sourceLocale": "en",
  "locales": ["de", "ja"],
  "terms": [
    {
      "id": "casama",
      "term": "Casama",
      "variants": [],
      "rule": "keep",
      "caseSensitive": true,
      "translations": {}
    },
    {
      "id": "brief",
      "term": "brief",
      "variants": ["briefs", "morning brief"],
      "rule": "translate-once-then-fixed",
      "caseSensitive": false,
      "definition": "A short summary a bot sends, usually in the morning.",
      "notes": "Never a bare ブリーフ in Japanese.",
      "translations": {
        "ja": {
          "term": "ブリーフィング",
          "forms": { "plural": "ブリーフィング" },
          "avoid": ["ブリーフ"],
          "notes": "…",
          "reviewed": "sonnet-5.5"
        }
      }
    }
  ]
}
```

- `rule: "keep"`: a string whose English has the term must keep it exactly (an error).
- `rule: "translate-once-then-fixed"`: where the English uses the term or a variant, the
  translation should use `translations.<locale>.term` or one of its `forms` (a warning, since
  grammar can change the word).
- `rule: "translate"`: no fixed form; the definition and notes guide the translator.
- `avoid` is checked only in strings whose English uses the term. An avoided word where the fixed
  rendering is missing is an error; next to the fixed rendering it is a warning.
- Optional fields: `partOfSpeech`, `category`, `definition`, `context`, `notes`. A locale entry
  for `pt-BR` falls back to `pt`.
- A glossary that doesn't match this shape stops every command with a list of the problems. A
  missing file is an empty glossary.

Packets include only the glossary entries their strings use.

## Lock file and memory

- `lock/<surface>.json`: per locale and key, a hash of the English the translation came from, a
  hash of the translation as written, and flags (`r` reviewed by a person, `a` reviewed by the AI
  review pass, `w` passed with warnings). Also the reasons strings failed, and for documents the
  order of segments last written.
- `memory/<locale>.json`: English → translation, with `r` for reviewed. Exact matches on short text
  (6 words or fewer) are reused without the agent; similar texts go into the packet as
  suggestions. A reviewed entry is never replaced by an unreviewed one.

Commit the lock and memory files with the translations.

## From code

```ts
import { apply, check, loadProject, prepare, report, Session } from "@casama/l10n";

const run = prepare(new Session(loadProject("l10n/l10n.config.json")), { locales: ["de"] });
// … an agent writes the result files …
apply(new Session(loadProject("l10n/l10n.config.json")), [run.runDir!]);
```

## License

Apache-2.0.
