import { once } from "node:events";
import { createServer, request, type Server } from "node:http";
import type { AddressInfo, Server as NetServer, Socket } from "node:net";
import { connect, createServer as createNetServer } from "node:net";
import { afterAll, beforeAll, describe, expect, it } from "vitest";
import { domainAllowed, isBlocked, isGitSsh, makeBlockList, portBlocked } from "../src/policy.ts";
import {
  EgressProxy,
  FLOOD_PER_HOST_PER_MINUTE,
  NONWEB_DISTINCT_PER_HOUR,
  SCAN_BLOCKED_PER_MINUTE,
  SSH_PER_MINUTE,
} from "../src/proxy.ts";

describe("policy", () => {
  const list = makeBlockList(["172.30.0.0/16"]);
  it.each([
    ["169.254.169.254", true],
    ["10.1.2.3", true],
    ["172.16.5.5", true],
    ["192.168.1.1", true],
    ["127.0.0.1", true],
    ["100.64.0.1", true],
    ["0.0.0.0", true],
    ["::1", true],
    ["fe80::1", true],
    ["fd00::1", true],
    ["::ffff:10.0.0.1", true],
    ["::ffff:169.254.169.254", true],
    ["not-an-ip", true],
    ["8.8.8.8", false],
    ["1.1.1.1", false],
    ["2606:4700:4700::1111", false],
  ])("%s blocked=%s", (ip, blocked) => expect(isBlocked(list, ip)).toBe(blocked));

  it("refuses only attack ports; SSH and databases stay open (D-542)", () => {
    for (const p of [23, 135, 139, 445, 3389, 5900]) expect(portBlocked(p)).toBe(true);
    for (const p of [22, 80, 443, 3306, 5432, 6379, 8000, 27017])
      expect(portBlocked(p)).toBe(false);
    expect(portBlocked(3389, [3389])).toBe(false);
    expect(isGitSsh("github.com", 22)).toBe(true);
    expect(isGitSsh("ssh.gitlab.com", 22)).toBe(true);
    expect(isGitSsh("github.com.evil.example", 22)).toBe(false);
    expect(isGitSsh("github.com", 443)).toBe(false);
  });

  it("applies allow and deny domain rules", () => {
    expect(domainAllowed("api.github.com", { allow: ["github.com"] })).toBe(true);
    expect(domainAllowed("evil.com", { allow: ["github.com"] })).toBe(false);
    expect(domainAllowed("ads.example.com", { deny: ["example.com"] })).toBe(false);
    expect(domainAllowed("anything.org", {})).toBe(true);
  });
});

describe("proxy", () => {
  let target: Server;
  let targetPort: number;
  let proxyServer: Server;
  let proxyPort: number;
  let control: Server;
  let controlPort: number;
  const DNS: Record<string, string[]> = {
    "public.test": ["127.0.0.1"], // exempt below, stands in for a public site
    "metadata.test": ["169.254.169.254"],
    "rebind.test": ["127.0.0.1", "10.0.0.5"],
  };
  const proxy = new EgressProxy({
    controlToken: "control-token-0123456789",
    exemptCidrs: ["127.0.0.1/32"],
    resolve: async (h) => {
      const r = DNS[h];
      if (!r) throw new Error("NXDOMAIN");
      return r;
    },
  });

  const auth = (ref: string, token: string) =>
    `Basic ${Buffer.from(`${ref}:${token}`).toString("base64")}`;

  function viaProxy(url: string, proxyAuth?: string) {
    return new Promise<{ status: number; body: string; headers: Record<string, unknown> }>(
      (resolve, reject) => {
        const req = request(
          {
            host: "127.0.0.1",
            port: proxyPort,
            method: "GET",
            path: url,
            headers: proxyAuth ? { "proxy-authorization": proxyAuth } : {},
          },
          (res) => {
            let body = "";
            res.on("data", (d) => (body += d));
            res.on("end", () =>
              resolve({ status: res.statusCode ?? 0, body, headers: res.headers }),
            );
          },
        );
        req.on("error", reject);
        req.end();
      },
    );
  }

  function connectVia(target: string, proxyAuth: string) {
    return new Promise<string>((resolve, reject) => {
      const s = connect(proxyPort, "127.0.0.1", () => {
        s.write(
          `CONNECT ${target} HTTP/1.1\r\nHost: ${target}\r\nProxy-Authorization: ${proxyAuth}\r\n\r\n`,
        );
      });
      let data = "";
      s.on("data", (d) => {
        data += d;
        if (data.includes("\r\n\r\n")) {
          resolve(data.split("\r\n")[0] ?? "");
          s.destroy();
        }
      });
      s.on("error", reject);
    });
  }

  beforeAll(async () => {
    target = createServer((req, res) => res.end(`hello from ${req.headers.host}`)).listen(
      0,
      "127.0.0.1",
    );
    await once(target, "listening");
    targetPort = (target.address() as AddressInfo).port;
    DNS["public.test"] = ["127.0.0.1"];
    proxyServer = proxy.createProxyServer().listen(0, "127.0.0.1");
    control = proxy.createControlServer().listen(0, "127.0.0.1");
    await Promise.all([once(proxyServer, "listening"), once(control, "listening")]);
    proxyPort = (proxyServer.address() as AddressInfo).port;
    controlPort = (control.address() as AddressInfo).port;
    const reg = await fetch(`http://127.0.0.1:${controlPort}/computers/c1`, {
      method: "PUT",
      headers: { authorization: "Bearer control-token-0123456789" },
      body: JSON.stringify({ token: "computer-token-0123456789", connectionsPerMinute: 20 }),
    });
    expect(reg.status).toBe(200);
  });
  afterAll(() => {
    target.close();
    proxyServer.close();
    control.close();
  });

  const good = () => auth("c1", "computer-token-0123456789");

  it("requires per-computer auth", async () => {
    expect((await viaProxy(`http://public.test:${targetPort}/`)).status).toBe(407);
    expect(
      (await viaProxy(`http://public.test:${targetPort}/`, auth("c1", "wrong-token-xxxxxxxxxx")))
        .status,
    ).toBe(407);
  });

  it("forwards allowed HTTP requests to the vetted address", async () => {
    const r = await viaProxy(`http://public.test:${targetPort}/x`, good());
    expect(r.status).toBe(200);
    expect(r.body).toBe(`hello from public.test:${targetPort}`);
  });

  it("blocks cloud metadata, private ranges and DNS rebinding", async () => {
    for (const host of ["metadata.test", "169.254.169.254", "10.0.0.1", "rebind.test", "[::1]"]) {
      const r = await viaProxy(`http://${host}/latest/meta-data/`, good());
      expect(r.status, host).toBe(403);
    }
    expect(await connectVia("169.254.169.254:80", good())).toContain("403");
    expect(await connectVia("rebind.test:443", good())).toContain("403");
  });

  it("tunnels CONNECT to allowed hosts", async () => {
    expect(await connectVia(`public.test:${targetPort}`, good())).toContain("200");
  });

  it("rate-limits new connections per computer", async () => {
    let limited = false;
    for (let i = 0; i < 30 && !limited; i++)
      limited = (await viaProxy(`http://public.test:${targetPort}/`, good())).status === 429;
    expect(limited).toBe(true);
  });

  it("protects the control API", async () => {
    expect(
      (await fetch(`http://127.0.0.1:${controlPort}/computers/c2`, { method: "PUT", body: "{}" }))
        .status,
    ).toBe(401);
  });
});

describe("abuse controls (D-094)", () => {
  const reports: Array<{ computer: string; kind: string; target: string }> = [];
  const proxy = new EgressProxy({
    controlToken: "control-token-0123456789",
    exemptCidrs: ["127.0.0.1/32"],
    resolve: async () => ["127.0.0.1"],
    abuse: { report: (computer, kind, target) => reports.push({ computer, kind, target }) },
  });
  proxy.computers.set("c9", {
    ref: "c9",
    token: "computer-token-0123456789",
    connectionsPerMinute: 3,
  });
  let port = 0;
  let server: Server;
  const auth = `Basic ${Buffer.from("c9:computer-token-0123456789").toString("base64")}`;
  const tunnel = (target: string) =>
    new Promise<string>((resolve, reject) => {
      const s = connect(port, "127.0.0.1", () =>
        s.write(
          `CONNECT ${target} HTTP/1.1\r\nHost: ${target}\r\nProxy-Authorization: ${auth}\r\n\r\n`,
        ),
      );
      let data = "";
      s.on("data", (d) => {
        data += d;
        if (data.includes("\r\n\r\n")) {
          resolve(data.split("\r\n")[0] ?? "");
          s.destroy();
        }
      });
      s.on("error", reject);
      s.on("close", () => resolve(data.split("\r\n")[0] ?? ""));
    });

  beforeAll(async () => {
    server = proxy.createProxyServer().listen(0, "127.0.0.1");
    await once(server, "listening");
    port = (server.address() as AddressInfo).port;
  });
  afterAll(() => server.close());

  it("refuses SMTP, Stratum ports and mining pools, and reports them", async () => {
    expect(await tunnel("smtp.example.com:25")).toContain("403");
    expect(await tunnel("example.com:3333")).toContain("403");
    expect(await tunnel("xmr-eu1.nanopool.org:443")).toContain("403");
    expect(reports.map((r) => r.kind)).toEqual(["blocked_port", "mining_pool", "mining_pool"]);
    expect(reports[2]).toEqual({
      computer: "c9",
      kind: "mining_pool",
      target: "xmr-eu1.nanopool.org:443",
    });
  });

  it("reports a connection flood once a minute", async () => {
    reports.length = 0;
    for (let i = 0; i < 8; i++) await tunnel("public.example:443").catch(() => "");
    expect(reports.filter((r) => r.kind === "egress_flood")).toHaveLength(1);
  });
});

describe("scanning controls (D-542)", () => {
  const reports: Array<{ computer: string; kind: string; target: string }> = [];
  const denials: Array<{ computer: unknown; reason: unknown }> = [];
  const proxy = new EgressProxy({
    log: (e) => {
      if (e.event === "egress_denied") denials.push({ computer: e.computer, reason: e.reason });
    },
    controlToken: "control-token-0123456789",
    exemptCidrs: ["127.0.0.0/8"],
    // Small, so the test stays under the open-file limit; production uses SCAN_DISTINCT_PER_MINUTE.
    scanDistinctPerMinute: 12,
    // Each host name resolves to its own loopback address, so "h7" is 127.0.1.7.
    resolve: async (host) => {
      const n = /^h\d+$/.test(host) ? Number(host.slice(1)) : -1;
      return [n < 0 ? "127.0.0.1" : `127.0.${Math.floor(n / 250) + 1}.${(n % 250) + 1}`];
    },
    abuse: { report: (computer, kind, target) => reports.push({ computer, kind, target }) },
  });
  const register = (ref: string, extra: Partial<{ allowPorts: number[] }> = {}) =>
    proxy.computers.set(ref, {
      ref,
      token: "computer-token-0123456789",
      connectionsPerMinute: 10_000,
      ...extra,
    });
  let port = 0;
  let server: Server;
  const tunnel = (ref: string, target: string) =>
    new Promise<string>((resolve) => {
      const auth = `Basic ${Buffer.from(`${ref}:computer-token-0123456789`).toString("base64")}`;
      const s = connect(port, "127.0.0.1", () =>
        s.write(
          `CONNECT ${target} HTTP/1.1\r\nHost: ${target}\r\nProxy-Authorization: ${auth}\r\n\r\n`,
        ),
      );
      let data = "";
      s.on("data", (d) => {
        data += d;
        if (data.includes("\r\n\r\n")) {
          resolve(data.split("\r\n")[0] ?? "");
          s.destroy();
        }
      });
      s.on("error", () => resolve(data.split("\r\n")[0] ?? ""));
      s.on("close", () => resolve(data.split("\r\n")[0] ?? ""));
      // Upstreams on 127.0.x.y may not answer: a refusal comes back at once, so stop waiting.
      setTimeout(() => {
        resolve(data.split("\r\n")[0] ?? "");
        s.destroy();
      }, 2000);
    });

  beforeAll(async () => {
    server = proxy.createProxyServer().listen(0, "127.0.0.1");
    await once(server, "listening");
    port = (server.address() as AddressInfo).port;
  });
  afterAll(() => server.close());

  it("refuses RDP, telnet and SMB, but lets SSH and databases through", async () => {
    register("p1", { allowPorts: [5900] });
    expect(await tunnel("p1", "h1:3389")).toContain("403");
    expect(await tunnel("p1", "h2:23")).toContain("403");
    expect(await tunnel("p1", "h3:445")).toContain("403");
    expect(await tunnel("p1", "h4:22")).not.toMatch(/403|429/);
    expect(await tunnel("p1", "h5:5432")).not.toMatch(/403|429/);
    expect(await tunnel("p1", "h6:5900")).not.toMatch(/403|429/);
    // Blocked ports are reported once a minute, not once per attempt.
    expect(reports.filter((r) => r.computer === "p1" && r.kind === "blocked_port")).toHaveLength(1);
  });

  it("caps different non-web destinations an hour, but not repeat visits or git", async () => {
    register("p4");
    for (let i = 0; i < NONWEB_DISTINCT_PER_HOUR; i++)
      expect(await tunnel("p4", `h${100 + i}:5432`)).not.toContain("429");
    // The same servers again are fine; a new one past the cap is not.
    expect(await tunnel("p4", "h100:5432")).not.toContain("429");
    expect(await tunnel("p4", "github.com:22")).not.toContain("429");
    expect(await tunnel("p4", "h199:22")).toContain("429");
    expect(denials.filter((d) => d.computer === "p4" && d.reason === "port_limit")).toHaveLength(1);
    expect(reports.filter((r) => r.computer === "p4" && r.kind === "blocked_port")).toHaveLength(1);
  });

  it("caps new SSH connections a minute to one server (password guessing)", async () => {
    register("p5");
    await Promise.all(Array.from({ length: SSH_PER_MINUTE + 2 }, () => tunnel("p5", "h300:22")));
    expect(denials.filter((d) => d.computer === "p5" && d.reason === "port_limit")).toHaveLength(2);
  });

  it("treats many blocked-port hits in a minute as a flood", async () => {
    register("p2");
    await Promise.all(
      Array.from({ length: SCAN_BLOCKED_PER_MINUTE + 5 }, (_, i) => tunnel("p2", `h${i}:3389`)),
    );
    const mine = reports.filter((r) => r.computer === "p2");
    expect(mine.filter((r) => r.kind === "blocked_port")).toHaveLength(1);
    expect(mine.filter((r) => r.kind === "egress_flood")).toHaveLength(1);
  });

  it("refuses and reports a sweep across many addresses on web ports", async () => {
    register("p3");
    await Promise.all(Array.from({ length: 12 + 3 }, (_, i) => tunnel("p3", `h${i}:443`)));
    // The proxy's own log, not the client's view: replies race the client's timeout under load.
    expect(denials.filter((d) => d.computer === "p3" && d.reason === "scanning")).toHaveLength(3);
    expect(reports.filter((r) => r.computer === "p3" && r.kind === "egress_flood")).toHaveLength(1);
  });
});

describe("flood controls (D-544)", () => {
  const reports: Array<{ computer: string; kind: string; target: string }> = [];
  const denials: Array<{ computer: unknown; reason: unknown }> = [];
  // Small limits so the test stays quick; production uses 300 a minute and 50 Mbit/s.
  const proxy = new EgressProxy({
    log: (e) => {
      if (e.event === "egress_denied") denials.push({ computer: e.computer, reason: e.reason });
    },
    controlToken: "control-token-0123456789",
    exemptCidrs: ["127.0.0.1/32"],
    resolve: async () => ["127.0.0.1"],
    abuse: { report: (computer, kind, target) => reports.push({ computer, kind, target }) },
    floodPerHostPerMinute: 5,
    uploadBitsPerSecond: 2_000_000, // 250 kB a second
    uploadBurstSeconds: 0.2, // 50 kB at full speed
  });
  const register = (ref: string) =>
    proxy.computers.set(ref, {
      ref,
      token: "computer-token-0123456789",
      connectionsPerMinute: 10_000,
    });
  const authFor = (ref: string) =>
    `Basic ${Buffer.from(`${ref}:computer-token-0123456789`).toString("base64")}`;
  let port = 0;
  let server: Server;
  // Counts what it receives and answers each connection with 2 MB at once (a download).
  let sinkPort = 0;
  let sink: NetServer;
  const received: number[] = [];

  /** Opens a tunnel; resolves with the reply's headers and the open socket. */
  const open = (ref: string, target: string) =>
    new Promise<{ line: string; headers: string; socket: Socket }>((resolve, reject) => {
      const s = connect(port, "127.0.0.1", () =>
        s.write(
          `CONNECT ${target} HTTP/1.1\r\nHost: ${target}\r\nProxy-Authorization: ${authFor(ref)}\r\n\r\n`,
        ),
      );
      let data = Buffer.alloc(0);
      const onData = (d: Buffer) => {
        data = Buffer.concat([data, d]);
        const end = data.indexOf("\r\n\r\n");
        if (end < 0) return;
        s.off("data", onData);
        s.pause();
        const headers = data.subarray(0, end).toString();
        const rest = data.subarray(end + 4);
        if (rest.length) s.unshift(rest);
        resolve({ line: headers.split("\r\n")[0] ?? "", headers, socket: s });
      };
      s.on("data", onData);
      s.on("error", reject);
    });

  beforeAll(async () => {
    server = proxy.createProxyServer().listen(0, "127.0.0.1");
    sink = createNetServer((s) => {
      let n = 0;
      s.on("data", (d: Buffer) => {
        n += d.length;
      });
      s.on("end", () => {
        received.push(n);
        s.end();
      });
      s.on("error", () => {});
      s.write(Buffer.alloc(2 * 1024 * 1024, 7));
    }).listen(0, "127.0.0.1");
    await Promise.all([once(server, "listening"), once(sink, "listening")]);
    port = (server.address() as AddressInfo).port;
    sinkPort = (sink.address() as AddressInfo).port;
  });
  afterAll(() => {
    server.close();
    sink.close();
  });

  it("caps new connections a minute to one host, with a flood report", async () => {
    expect(FLOOD_PER_HOST_PER_MINUTE).toBe(300);
    register("f1");
    const replies: string[] = [];
    for (let i = 0; i < 7; i++) {
      const t = await open("f1", `site.test:${sinkPort}`);
      replies.push(t.headers);
      t.socket.destroy();
    }
    expect(replies.slice(0, 5).every((l) => l.startsWith("HTTP/1.1 200"))).toBe(true);
    expect(replies[5]).toContain("429");
    expect(replies[5]).toContain("X-Casama-Egress: flood");
    // Another host is still fine.
    const other = await open("f1", `other.test:${sinkPort}`);
    expect(other.line).toContain("200");
    other.socket.destroy();
    expect(denials.filter((d) => d.computer === "f1" && d.reason === "flood")).toHaveLength(2);
    // Reported once a minute, as the kind the API already suspends on after three in an hour.
    expect(reports.filter((r) => r.computer === "f1")).toEqual([
      { computer: "f1", kind: "egress_flood", target: "host:site.test" },
    ]);
  });

  it("slows uploads to the cap without cutting them, and leaves downloads alone", async () => {
    register("f2");
    const t = await open("f2", `bulk.test:${sinkPort}`);
    expect(t.line).toContain("200");
    let down = 0;
    const started = Date.now();
    const downloaded = new Promise<number>((resolve) => {
      t.socket.on("data", (d: Buffer) => {
        down += d.length;
        if (down >= 2 * 1024 * 1024) resolve(Date.now() - started);
      });
    });
    const closed = new Promise<void>((resolve) => t.socket.on("close", () => resolve()));
    t.socket.resume();
    const size = 550_000; // 50 kB burst + 500 kB at 250 kB/s: about 2 s
    received.length = 0;
    t.socket.end(Buffer.alloc(size, 1));
    const downMs = await downloaded;
    await closed;
    const upMs = Date.now() - started;
    expect(received).toEqual([size]);
    expect(upMs).toBeGreaterThanOrEqual(1_500);
    // The 2 MB download isn't held back by the upload cap.
    expect(downMs).toBeLessThan(upMs);
    expect(denials.filter((d) => d.computer === "f2")).toEqual([]);
  });
});
