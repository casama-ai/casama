/**
 * Generates the Dart API client from the OpenAPI document:
 *   dart/casama_api            REST client (openapi-generator dart-dio + json_serializable)
 *   dart/casama_sdk/lib/src/generated/run_events.dart   sealed run event types
 * Never edit generated files by hand; change packages/contracts and rerun `pnpm gen`.
 */
import { execFileSync } from "node:child_process";
import {
  copyFileSync,
  existsSync,
  mkdirSync,
  mkdtempSync,
  readdirSync,
  readFileSync,
  renameSync,
  rmSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { createRequire } from "node:module";
import { tmpdir } from "node:os";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { OpenAPIHono } from "@hono/zod-openapi";
import { eventComponentName, RUN_EVENT_TYPES } from "../events.ts";
import { openApiConfig, registerComponents } from "../openapi.ts";
import { routes } from "../routes/index.ts";

const contractsDir = fileURLToPath(new URL("../..", import.meta.url));
const root = fileURLToPath(new URL("../../../../", import.meta.url));
const apiDir = join(root, "dart/casama_api");
const sdkGenDir = join(root, "dart/casama_sdk/lib/src/generated");

function isValidJar(filePath: string): boolean {
  if (!existsSync(filePath)) return false;
  try {
    if (statSync(filePath).size < 1_000_000) return false;
    const buf = readFileSync(filePath).subarray(0, 4);
    return buf[0] === 0x50 && buf[1] === 0x4b && buf[2] === 0x03 && buf[3] === 0x04;
  } catch {
    return false;
  }
}

/**
 * Ensures the pinned openapi-generator-cli jar is present and valid before invoking the CLI.
 * Prevents transient Maven Central download failures on fresh CI runners ("Unable to access jarfile").
 */
async function ensureOpenApiGeneratorJar() {
  const cfg = JSON.parse(readFileSync(join(contractsDir, "openapitools.json"), "utf8")) as {
    "generator-cli"?: { version?: string };
  };
  const version = cfg["generator-cli"]?.version;
  if (!version) return;

  const req = createRequire(import.meta.url);
  const cliDir = dirname(req.resolve("@openapitools/openapi-generator-cli/package.json"));
  const versionsDir = join(cliDir, "versions");
  const jarPath = join(versionsDir, `${version}.jar`);
  if (isValidJar(jarPath)) return;

  mkdirSync(versionsDir, { recursive: true });
  const cacheDir = process.env.OPENAPI_GENERATOR_CACHE_DIR;
  const cachedJar = cacheDir ? join(cacheDir, `${version}.jar`) : null;
  if (cachedJar && isValidJar(cachedJar)) {
    copyFileSync(cachedJar, jarPath);
    return;
  }

  const url = `https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${version}/openapi-generator-cli-${version}.jar`;
  let lastErr: unknown;
  for (let attempt = 1; attempt <= 4; attempt++) {
    try {
      const res = await fetch(url);
      if (!res.ok) throw new Error(`HTTP ${res.status} fetching ${url}`);
      const bytes = Buffer.from(await res.arrayBuffer());
      const tmpJar = `${jarPath}.tmp.${process.pid}`;
      writeFileSync(tmpJar, bytes);
      if (!isValidJar(tmpJar)) {
        rmSync(tmpJar, { force: true });
        throw new Error(`Downloaded jar (${bytes.length} bytes) failed ZIP validation`);
      }
      renameSync(tmpJar, jarPath);
      if (cacheDir && cachedJar) {
        mkdirSync(cacheDir, { recursive: true });
        copyFileSync(jarPath, cachedJar);
      }
      return;
    } catch (err) {
      lastErr = err;
      if (attempt < 4) {
        await new Promise((r) => setTimeout(r, attempt * 2000));
      }
    }
  }
  throw new Error(
    `Failed to download openapi-generator-cli ${version}.jar after 4 attempts: ${String(lastErr)}`,
  );
}

// 1. OpenAPI 3.0 document for the generator, without the oneOf union it cannot model.
const app = new OpenAPIHono();
registerComponents(app);
for (const route of Object.values(routes)) app.openAPIRegistry.registerPath(route);
const doc = app.getOpenAPIDocument({ ...openApiConfig, openapi: "3.0.3" });
if (doc.components?.schemas) delete doc.components.schemas.RunEvent;
// A field that is one of several plain values (`"all"` or a list of ids) is a plain JSON value in
// Dart: dart-dio can't model a union without a discriminator and writes a class that won't compile.
for (const schema of Object.values(doc.components?.schemas ?? {})) {
  const props = (schema as { properties?: Record<string, Record<string, unknown>> }).properties;
  for (const [name, prop] of Object.entries(props ?? {})) {
    const members = (prop.anyOf ?? prop.oneOf) as Array<Record<string, unknown>> | undefined;
    if (members?.length && members.every((m) => !("$ref" in m) && m.type !== "object"))
      (props as Record<string, unknown>)[name] = { description: prop.description };
  }
}
const tmp = mkdtempSync(join(tmpdir(), "casama-gen-"));
const specPath = join(tmp, "openapi.json");
writeFileSync(specPath, JSON.stringify(doc));

// 2. REST client.
await ensureOpenApiGeneratorJar();
rmSync(join(apiDir, "lib"), { recursive: true, force: true });
execFileSync(
  "npx",
  [
    "openapi-generator-cli",
    "generate",
    "-i",
    specPath,
    "-g",
    "dart-dio",
    "-o",
    apiDir,
    "--global-property=apiTests=false,modelTests=false,apiDocs=false,modelDocs=false",
    "--additional-properties=pubName=casama_api,pubVersion=0.1.0,serializationLibrary=json_serializable",
    // An enum member named `value` would clash with the generated enum's own `value` field.
    "--enum-name-mappings=value=plain",
  ],
  { stdio: ["ignore", "ignore", "inherit"], cwd: contractsDir },
);
// Join the Dart workspace.
const pubspecPath = join(apiDir, "pubspec.yaml");
let pubspec = readFileSync(pubspecPath, "utf8")
  .replace(
    /^homepage:.*\n/m,
    "homepage: https://github.com/casama-ai/casama\nrepository: https://github.com/casama-ai/casama/tree/main/dart/casama_api\nissue_tracker: https://github.com/casama-ai/casama/issues\n",
  )
  .replace(
    /^description:.*$/m,
    "description: Generated REST client for the Casama API (dio + json_serializable), used by casama_sdk. Do not edit by hand.",
  )
  .replace(/sdk: '.*'/, "sdk: ^3.13.0");
// Pin generated dependencies at their latest versions (policy: new deps at latest compatible).
const PINS: Record<string, string> = {
  dio: "^5.11.1",
  copy_with_extension: "^18.0.0",
  json_annotation: "^4.12.0",
  // build_runner 2.17 needs build 5; copy_with_extension_gen 18 still needs build 4 (D-061).
  build_runner: "^2.16.2",
  copy_with_extension_gen: "^18.0.0",
  json_serializable: "^6.15.2",
  test: "^1.33.0",
};
for (const [name, version] of Object.entries(PINS))
  pubspec = pubspec.replace(new RegExp(`^(\\s+${name}:).*$`, "m"), `$1 ${version}`);
if (!pubspec.includes("resolution: workspace"))
  pubspec = pubspec.replace(/environment:/, "resolution: workspace\n\nenvironment:");
writeFileSync(pubspecPath, pubspec);
rmSync(join(apiDir, ".travis.yml"), { force: true });
rmSync(join(apiDir, "doc"), { recursive: true, force: true });
rmSync(join(apiDir, "test"), { recursive: true, force: true });
rmSync(join(apiDir, "git_push.sh"), { force: true });

// Free-form JSON objects may hold nulls: Map<String, Object> -> Map<String, Object?>.
const walk = (dir: string): string[] =>
  readdirSync(dir, { withFileTypes: true }).flatMap((e) =>
    e.isDirectory() ? walk(join(dir, e.name)) : [join(dir, e.name)],
  );
for (const file of walk(join(apiDir, "lib")).filter(
  (f) => f.endsWith(".dart") && !f.endsWith(".g.dart"),
)) {
  const src = readFileSync(file, "utf8");
  let out = src.replaceAll("Map<String, Object>", "Map<String, Object?>");
  // Dart optional parameter defaults must be compile-time constants.
  out = out.replace(/(\bthis\.\w+\s*=\s*)\[\]/g, "$1const []");
  // The generator imports the error model into every API file; drop it where unused (pub.dev lints).
  const problemImport = "import 'package:casama_api/src/model/problem.dart';\n";
  if (out.includes(problemImport) && !/\bProblem\b/.test(out.replace(problemImport, "")))
    out = out.replace(problemImport, "");
  if (out !== src) writeFileSync(file, out);
}

// 3. Sealed run event types dispatching to the generated classes.
const snake = (s: string) => s.replace(/([a-z0-9])([A-Z])/g, "$1_$2").toLowerCase();
const variants = RUN_EVENT_TYPES.map((type) => {
  const cls = eventComponentName(type);
  return { type, cls, item: `${cls.replace(/Event$/, "")}Item`, file: snake(cls) };
});
const lines = [
  "// GENERATED by packages/contracts/src/scripts/gen-dart.ts. DO NOT EDIT.",
  "// ignore_for_file: directives_ordering",
  "",
  "import 'package:casama_api/casama_api.dart';",
  "",
  "/// All run event types known to this client version.",
  `const knownRunEventTypes = <String>{${variants.map((v) => `'${v.type}'`).join(", ")}};`,
  "",
  "/// A run event: the envelope plus, for known types, the typed event.",
  "/// Unknown types parse to [UnknownRunEventItem] so newer servers never break older clients.",
  "sealed class RunEventItem {",
  "  const RunEventItem(this.envelope);",
  "  final RunEventEnvelope envelope;",
  "  String get runId => envelope.runId;",
  "  int get seq => envelope.seq;",
  "  String get type => envelope.type;",
  "",
  "  static RunEventItem fromJson(Map<String, dynamic> json) {",
  "    final envelope = RunEventEnvelope.fromJson(json);",
  "    switch (envelope.type) {",
  ...variants.map(
    (v) => `      case '${v.type}':\n        return ${v.item}(envelope, ${v.cls}.fromJson(json));`,
  ),
  "      default:",
  "        return UnknownRunEventItem(envelope);",
  "    }",
  "  }",
  "}",
  "",
  ...variants.flatMap((v) => [
    `final class ${v.item} extends RunEventItem {`,
    `  const ${v.item}(super.envelope, this.event);`,
    `  final ${v.cls} event;`,
    "}",
    "",
  ]),
  "final class UnknownRunEventItem extends RunEventItem {",
  "  const UnknownRunEventItem(super.envelope);",
  "}",
  "",
];
mkdirSync(sdkGenDir, { recursive: true });
writeFileSync(join(sdkGenDir, "run_events.dart"), lines.join("\n"));
rmSync(tmp, { recursive: true, force: true });

// 4. json_serializable code.
execFileSync("dart", ["pub", "get"], { cwd: join(root, "dart"), stdio: "inherit" });
execFileSync("dart", ["run", "build_runner", "build", "--delete-conflicting-outputs"], {
  cwd: apiDir,
  stdio: "inherit",
});
console.log("Dart client generated.");
