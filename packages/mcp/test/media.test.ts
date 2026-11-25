import { Client } from "@modelcontextprotocol/sdk/client/index.js";
import { InMemoryTransport } from "@modelcontextprotocol/sdk/inMemory.js";
import { afterAll, beforeAll, describe, expect, it } from "vitest";
import { CasamaApi, createCasamaMcpServer } from "../src/server.ts";

// A bot's reply pictures reach the AI app as image blocks (D-567): Gemini only saw `media:<id>`.
const ORG = "44444444-4444-4444-8444-444444444444";
const BOT = "55555555-5555-4555-8555-555555555555";
const CONV = "66666666-6666-4666-8666-666666666666";
const RUN = "77777777-7777-4777-8777-777777777777";
const PIC = "88888888-8888-4888-8888-888888888888";
const VIDEO = "99999999-9999-4999-8999-999999999999";
const PNG = new Uint8Array([0x89, 0x50, 0x4e, 0x47, 1, 2, 3]);

type Block = { type: string; text?: string; data?: string; mimeType?: string };

function fakeApi(calls: string[]) {
  return (async (url: string | URL, init?: RequestInit) => {
    const u = new URL(String(url));
    calls.push(`${init?.method ?? "GET"} ${u.pathname}`);
    const p = u.pathname;
    if (p === "/v1/orgs")
      return Response.json({ items: [{ id: ORG, name: "Home", slug: "home", role: "owner" }] });
    if (p === "/v1/bots")
      return Response.json({ items: [{ id: BOT, name: "Casama", org_id: ORG }] });
    if (p === "/v1/conversations") return Response.json({ id: CONV }, { status: 201 });
    if (p === `/v1/conversations/${CONV}/messages`)
      return Response.json({ run_id: RUN }, { status: 202 });
    if (p === `/v1/runs/${RUN}`) return Response.json({ status: "completed", bot_id: BOT });
    if (p === `/v1/runs/${RUN}/events`)
      return Response.json({
        items: [
          {
            type: "message.completed",
            payload: {
              content: [
                { type: "text", text: "Here's your cat." },
                {
                  type: "file",
                  path: `media:${PIC}`,
                  name: "cat.png",
                  mime_type: "image/png",
                  size: 7,
                },
                {
                  type: "file",
                  path: `media:${VIDEO}`,
                  name: "cat.mp4",
                  mime_type: "video/mp4",
                  size: 9,
                },
              ],
            },
          },
        ],
      });
    if (p === `/v1/media/${PIC}`)
      return new Response(PNG, { headers: { "content-type": "image/png" } });
    return Response.json({ title: "not found" }, { status: 404 });
  }) as typeof fetch;
}

describe("reply pictures", () => {
  const calls: string[] = [];
  let client: Client;

  beforeAll(async () => {
    const api = new CasamaApi({ apiUrl: "https://api.example", token: "t", fetch: fakeApi(calls) });
    const server = createCasamaMcpServer(api, {
      pollMs: 1,
      openLink: (path) => `https://app.example${path}`,
      mediaLink: (id) => `https://api.example/hooks/files/signed-${id}`,
    });
    const [a, b] = InMemoryTransport.createLinkedPair();
    await server.connect(a);
    client = new Client({ name: "test", version: "1.0.0" });
    await client.connect(b);
  });
  afterAll(async () => {
    await client?.close();
  });

  it("ask_bot attaches the bot's picture and names the video", async () => {
    const r = await client.callTool({
      name: "ask_bot",
      arguments: { bot: "Casama", message: "a cat" },
    });
    const content = r.content as Block[];
    const textBlock = content[0]?.text ?? "";
    expect(textBlock).toContain("Here's your cat.");
    expect(textBlock).toContain("pictures: 1 attached below");
    expect(textBlock).toContain(
      `files: cat.mp4 (video/mp4) (open in Casama: https://app.example/bots/${BOT}/chat?c=${CONV})`,
    );
    // Gemini draws only linked pictures, so each file is linked too.
    expect(textBlock).toContain(`![cat.png](https://api.example/hooks/files/signed-${PIC})`);
    expect(textBlock).toContain(`[cat.mp4](https://api.example/hooks/files/signed-${VIDEO})`);
    const images = content.filter((c) => c.type === "image");
    expect(images).toEqual([
      { type: "image", mimeType: "image/png", data: Buffer.from(PNG).toString("base64") },
    ]);
    // Only the picture is fetched; the video is too big a thing to send.
    expect(calls).not.toContain(`GET /v1/media/${VIDEO}`);
  });

  it("get_run attaches the picture too", async () => {
    const r = await client.callTool({ name: "get_run", arguments: { run_id: RUN } });
    const images = (r.content as Block[]).filter((c) => c.type === "image");
    expect(images).toHaveLength(1);
    expect(images[0]?.mimeType).toBe("image/png");
    const links = (r.content as Block[]).find((c) => c.text?.startsWith("Files from this run"));
    expect(links?.text).toContain(`![cat.png](https://api.example/hooks/files/signed-${PIC})`);
  });
});
