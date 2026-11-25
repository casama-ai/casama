import { existsSync, readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";
import { DEV_EXTENSION_ID, EDGE_EXTENSION_ID, OPERA_EXTENSION_ID } from "../src/manifest.ts";

const at = (path: string) => new URL(`../../../${path}`, import.meta.url);
const read = (path: string) => readFileSync(at(path), "utf8");
// The server and its compose file are engine (ENGINE-SPLIT-PLAN §6.3): not in the public repo.
const hasEngine = existsSync(at("apps/server/src/env.ts"));

describe("Casama for Chrome's id", () => {
  it("is the one the web app allows", () => {
    expect(read("client/lib/core/chrome_extension.dart").replace(/\s+/g, "")).toContain(
      `constchromeExtensionIds=['${DEV_EXTENSION_ID}','${EDGE_EXTENSION_ID}','${OPERA_EXTENSION_ID}',];`,
    );
  });

  it.skipIf(!hasEngine)("is the one the server and the compose file allow", () => {
    const ids = `${DEV_EXTENSION_ID},${EDGE_EXTENSION_ID},${OPERA_EXTENSION_ID}`;
    // Whitespace-blind: the formatter may wrap the zod chain over several lines.
    expect(read("apps/server/src/env.ts").replace(/\s+/g, "")).toContain(
      `CHROME_EXTENSION_IDS:z.string().default("${ids}"`,
    );
    expect(read("infra/compose/docker-compose.yml")).toContain(
      `CHROME_EXTENSION_IDS: \${CHROME_EXTENSION_IDS:-${ids}}`,
    );
  });
});
