import { lookup } from "node:dns/promises";
import {
  createServer,
  request as httpRequest,
  type IncomingMessage,
  type Server,
  type ServerResponse,
} from "node:http";
import { connect, isIP, type Socket } from "node:net";
import type { Readable, Writable } from "node:stream";
import {
  type DomainRules,
  domainAllowed,
  isBlocked,
  isGitSsh,
  MINING_POOL_DOMAINS,
  makeBlockList,
  makeExemptList,
  matchesDomain,
  portBlocked,
  SMTP_PORTS,
  STRATUM_PORTS,
  WEB_PORTS,
} from "./policy.ts";

export type AbuseKind = "mining_pool" | "blocked_port" | "egress_flood";

export interface ComputerRegistration {
  ref: string;
  token: string;
  rules?: DomainRules;
  /** New outbound connections per minute. */
  connectionsPerMinute?: number;
  /** Bytes per minute, both directions. */
  bytesPerMinute?: number;
  /** Ports reopened for this computer from the never-allowed list (abuse controls only). */
  allowPorts?: number[];
}

/** Blocked-port hits in a minute that count as scanning (reported as a flood). */
export const SCAN_BLOCKED_PER_MINUTE = 20;
/** Distinct destination addresses in a minute that count as scanning. */
export const SCAN_DISTINCT_PER_MINUTE = 150;
/**
 * Different destinations on non-web ports (SSH, databases, anything but 80/443/8080/8443) a computer
 * may reach in an hour. A person reaches a few of their own servers; a brute-forcer or scanner
 * reaches hundreds. Git hosts don't count.
 */
export const NONWEB_DISTINCT_PER_HOUR = 10;
/** New SSH connections a minute (password guessing needs many; git hosts don't count). */
export const SSH_PER_MINUTE = 30;
/**
 * New connections a minute from one computer to one destination host (D-544, plan §4.2). A browser
 * or crawler stays far below with keep-alive; a flood against one web site doesn't.
 */
export const FLOOD_PER_HOST_PER_MINUTE = 300;
/** Upload (computer to internet) rate per computer, in bits a second. Downloads aren't limited. */
export const UPLOAD_BITS_PER_SECOND = 50_000_000;
/**
 * Seconds of upload a computer may send at full speed before the cap applies (the bucket's size),
 * so a short push isn't slowed while any minute still averages close to the cap.
 */
export const UPLOAD_BURST_SECONDS = 10;

export interface ProxyOptions {
  /** Extra CIDRs to block, for example the internal service network. */
  blockedCidrs?: string[];
  /** Addresses exempt from blocking. Only for tests and local development; leave empty in production. */
  exemptCidrs?: string[];
  /** Token for the control API (registering computers). */
  controlToken: string;
  resolve?: (host: string) => Promise<string[]>;
  log?: (event: Record<string, unknown>) => void;
  /**
   * Abuse controls (Casama Cloud, D-094): refuse mail and mining ports and mining pools, and
   * report them (and rate-limit floods) through `report`.
   */
  abuse?: { report: (computer: string, kind: AbuseKind, target: string) => void };
  /** Distinct destinations a minute before a computer counts as sweeping (default 150). */
  scanDistinctPerMinute?: number;
  /**
   * New connections a minute per computer to one destination host (default 300; 0 turns it off).
   * Abuse controls only.
   */
  floodPerHostPerMinute?: number;
  /**
   * Upload cap per computer in bits a second (default 50 Mbit/s; 0 turns it off). Over it the proxy
   * stops reading from the computer until the average is back under, so nothing is cut. Abuse
   * controls only.
   */
  uploadBitsPerSecond?: number;
  /** Seconds of upload at full speed before the cap applies (default 10). */
  uploadBurstSeconds?: number;
}

interface Usage {
  windowStart: number;
  connections: number;
  bytes: number;
}

/**
 * Egress proxy: the only route out of a computer's network.
 * Forward proxy (absolute-URI HTTP and CONNECT) with per-computer auth, private-range blocking
 * on resolved addresses (connecting to the vetted IP defeats DNS rebinding), domain rules and rate limits.
 */
export class EgressProxy {
  readonly computers = new Map<string, ComputerRegistration>();
  private readonly usage = new Map<string, Usage>();
  private readonly blockList;
  private readonly exempt;
  private readonly resolve;
  private readonly log;
  private readonly controlToken;
  private readonly abuse;
  private readonly lastFlood = new Map<string, number>();
  private readonly lastBlocked = new Map<string, number>();
  private readonly scanDistinct: number;
  private readonly nonWeb = new Map<
    string,
    { hourStart: number; targets: Set<string>; minuteStart: number; ssh: number }
  >();
  private readonly scans = new Map<
    string,
    { windowStart: number; blocked: number; targets: Set<string> }
  >();
  private readonly floodPerHost: number;
  private readonly hostConnections = new Map<
    string,
    { windowStart: number; hosts: Map<string, number> }
  >();
  /** Upload rate in bytes a second (0 = no cap) and the bucket size in bytes. */
  private readonly uploadRate: number;
  private readonly uploadBurst: number;
  private readonly uploads = new Map<string, { tokens: number; at: number }>();

  constructor(opts: ProxyOptions) {
    this.abuse = opts.abuse;
    this.scanDistinct = opts.scanDistinctPerMinute ?? SCAN_DISTINCT_PER_MINUTE;
    this.floodPerHost = opts.floodPerHostPerMinute ?? FLOOD_PER_HOST_PER_MINUTE;
    this.uploadRate = (opts.uploadBitsPerSecond ?? UPLOAD_BITS_PER_SECOND) / 8;
    this.uploadBurst = this.uploadRate * (opts.uploadBurstSeconds ?? UPLOAD_BURST_SECONDS);
    this.blockList = makeBlockList(opts.blockedCidrs);
    this.exempt = opts.exemptCidrs?.length ? makeExemptList(opts.exemptCidrs) : null;
    this.controlToken = opts.controlToken;
    this.resolve =
      opts.resolve ??
      (async (host: string) =>
        (await lookup(host, { all: true, verbatim: true })).map((a) => a.address));
    this.log = opts.log ?? (() => {});
  }

  // --- auth, limits, policy -------------------------------------------------

  private authenticate(req: IncomingMessage): ComputerRegistration | null {
    const header = req.headers["proxy-authorization"];
    if (!header?.startsWith("Basic ")) return null;
    const [ref, token] = Buffer.from(header.slice(6), "base64").toString().split(":");
    const c = ref ? this.computers.get(ref) : undefined;
    return c && token && c.token === token ? c : null;
  }

  private meter(c: ComputerRegistration, connections: number, bytes: number) {
    const now = Date.now();
    let u = this.usage.get(c.ref);
    if (!u || now - u.windowStart >= 60_000) {
      u = { windowStart: now, connections: 0, bytes: 0 };
      this.usage.set(c.ref, u);
    }
    u.connections += connections;
    u.bytes += bytes;
    return (
      u.connections <= (c.connectionsPerMinute ?? 600) &&
      u.bytes <= (c.bytesPerMinute ?? 2 * 1024 * 1024 * 1024)
    );
  }

  /** Resolves and vets a destination; returns the address to connect to. */
  async vet(
    c: ComputerRegistration,
    host: string,
  ): Promise<{ ok: true; address: string } | { ok: false; reason: string }> {
    const bare = host.replace(/^\[|\]$/g, "");
    if (!domainAllowed(bare, c.rules ?? {})) return { ok: false, reason: "domain_not_allowed" };
    let addresses: string[];
    try {
      addresses = isIP(bare) ? [bare] : await this.resolve(bare);
    } catch {
      return { ok: false, reason: "dns_failed" };
    }
    if (addresses.length === 0) return { ok: false, reason: "dns_failed" };
    // Refuse if any address is internal: a mixed answer is a rebinding attempt.
    const blocked = (a: string) =>
      isBlocked(this.blockList, a) && !(this.exempt && isBlocked(this.exempt, a));
    if (addresses.some(blocked)) return { ok: false, reason: "blocked_address" };
    return { ok: true, address: addresses[0] as string };
  }

  /** Per-computer scan window: blocked hits and distinct destinations this minute. */
  private scanWindow(c: ComputerRegistration) {
    const now = Date.now();
    let w = this.scans.get(c.ref);
    if (!w || now - w.windowStart >= 60_000) {
      w = { windowStart: now, blocked: 0, targets: new Set() };
      this.scans.set(c.ref, w);
    }
    return w;
  }

  /** Abuse verdict for a destination, or null when it may proceed. */
  private abuseCheck(c: ComputerRegistration, host: string, port: number): AbuseKind | null {
    if (!this.abuse) return null;
    const h = host.replace(/^\[|\]$/g, "").toLowerCase();
    let kind: AbuseKind | null = null;
    if (MINING_POOL_DOMAINS.some((d) => matchesDomain(h, d)) || STRATUM_PORTS.includes(port))
      kind = "mining_pool";
    else if (SMTP_PORTS.includes(port) || portBlocked(port, c.allowPorts)) kind = "blocked_port";
    if (kind === "mining_pool") this.abuse.report(c.ref, kind, `${h}:${port}`);
    if (kind === "blocked_port") this.recordBlocked(c, `${h}:${port}`);
    return kind;
  }

  /**
   * A refused connection that looks like probing. A scanner makes thousands: report once a minute,
   * and treat many in a minute as a flood, which suspends the workspace when it repeats (D-542).
   */
  private recordBlocked(c: ComputerRegistration, target: string) {
    if (!this.abuse) return;
    const w = this.scanWindow(c);
    w.blocked += 1;
    const now = Date.now();
    if (now - (this.lastBlocked.get(c.ref) ?? 0) >= 60_000) {
      this.lastBlocked.set(c.ref, now);
      this.abuse.report(c.ref, "blocked_port", target);
    }
    if (w.blocked === SCAN_BLOCKED_PER_MINUTE) this.flood(c, `scan:${target}`);
  }

  /**
   * Limits on non-web ports, checked after the address is known: a few different destinations an
   * hour and a steady SSH rate are fine; more looks like brute force or a scan and is refused.
   */
  private nonWebRefused(c: ComputerRegistration, host: string, address: string, port: number) {
    if (!this.abuse || WEB_PORTS.includes(port) || isGitSsh(host, port)) return false;
    const now = Date.now();
    let w = this.nonWeb.get(c.ref);
    if (!w || now - w.hourStart >= 3_600_000) {
      w = { hourStart: now, targets: new Set(), minuteStart: now, ssh: 0 };
      this.nonWeb.set(c.ref, w);
    }
    if (now - w.minuteStart >= 60_000) {
      w.minuteStart = now;
      w.ssh = 0;
    }
    const target = `${address}:${port}`;
    const known = w.targets.has(target);
    if (!known && w.targets.size >= NONWEB_DISTINCT_PER_HOUR) {
      this.recordBlocked(c, `${host}:${port}`);
      return true;
    }
    if (port === 22 && w.ssh >= SSH_PER_MINUTE) {
      this.recordBlocked(c, `${host}:${port}`);
      return true;
    }
    w.targets.add(target);
    if (port === 22) w.ssh += 1;
    return false;
  }

  /** Scanning across many addresses on allowed ports: refuse once over the limit. */
  private scanning(c: ComputerRegistration, address: string): boolean {
    if (!this.abuse) return false;
    const w = this.scanWindow(c);
    w.targets.add(address);
    if (w.targets.size <= this.scanDistinct) return false;
    this.flood(c, `scan:${w.targets.size} addresses`);
    return true;
  }

  /**
   * New connections to one host this minute; over the limit the connection is refused (429
   * `flood`) and reported as `egress_flood`, which suspends the workspace when it repeats.
   */
  private hostFlood(c: ComputerRegistration, host: string): boolean {
    if (!this.abuse || this.floodPerHost <= 0) return false;
    const now = Date.now();
    let w = this.hostConnections.get(c.ref);
    if (!w || now - w.windowStart >= 60_000) {
      w = { windowStart: now, hosts: new Map() };
      this.hostConnections.set(c.ref, w);
    }
    const h = host.replace(/^\[|\]$/g, "").toLowerCase();
    const n = (w.hosts.get(h) ?? 0) + 1;
    w.hosts.set(h, n);
    if (n <= this.floodPerHost) return false;
    this.flood(c, `host:${h}`);
    return true;
  }

  /**
   * Copies the computer's upload to the destination, held to the computer's upload rate: one token
   * bucket shared by all its connections. Over the rate the source is paused (TCP backpressure
   * reaches the computer) until the bucket refills, rather than cutting the connection. Keeps the
   * destination's own backpressure, as `pipe` does.
   */
  private throttledPipe(c: ComputerRegistration, src: Readable, dst: Writable) {
    if (!this.abuse || this.uploadRate <= 0) return void src.pipe(dst);
    let waiting = false;
    let draining = false;
    const resume = () => {
      if (!waiting && !draining) src.resume();
    };
    src.on("data", (chunk: Buffer) => {
      const delay = this.takeUpload(c, chunk.length);
      if (!dst.write(chunk)) {
        draining = true;
        src.pause();
        dst.once("drain", () => {
          draining = false;
          resume();
        });
      }
      if (delay > 0) {
        waiting = true;
        src.pause();
        setTimeout(() => {
          waiting = false;
          resume();
        }, delay).unref();
      }
    });
    src.on("end", () => dst.end());
  }

  /** Takes bytes from the computer's upload bucket; returns how long (ms) to wait before more. */
  private takeUpload(c: ComputerRegistration, bytes: number): number {
    const now = Date.now();
    let b = this.uploads.get(c.ref);
    if (!b) {
      b = { tokens: this.uploadBurst, at: now };
      this.uploads.set(c.ref, b);
    }
    b.tokens = Math.min(this.uploadBurst, b.tokens + ((now - b.at) / 1000) * this.uploadRate);
    b.at = now;
    b.tokens -= bytes;
    return b.tokens >= 0 ? 0 : Math.ceil((-b.tokens / this.uploadRate) * 1000);
  }

  /** A rate-limit hit is reported at most once a minute per computer. */
  private flood(c: ComputerRegistration, target: string) {
    if (!this.abuse) return;
    const now = Date.now();
    if (now - (this.lastFlood.get(c.ref) ?? 0) < 60_000) return;
    this.lastFlood.set(c.ref, now);
    this.abuse.report(c.ref, "egress_flood", target);
  }

  // --- servers --------------------------------------------------------------

  /** The proxy server computers use (HTTP_PROXY / HTTPS_PROXY). */
  createProxyServer(): Server {
    const server = createServer((req, res) => void this.handleHttp(req, res));
    server.on("connect", (req, socket: Socket, head) => void this.handleConnect(req, socket, head));
    return server;
  }

  private deny(c: ComputerRegistration | null, target: string, reason: string) {
    this.log({ event: "egress_denied", computer: c?.ref ?? null, target, reason });
  }

  private async handleConnect(req: IncomingMessage, socket: Socket, head: Buffer) {
    socket.on("error", () => {});
    const c = this.authenticate(req);
    const target = req.url ?? "";
    if (!c) {
      socket.end(
        'HTTP/1.1 407 Proxy Authentication Required\r\nProxy-Authenticate: Basic realm="casama"\r\n\r\n',
      );
      return this.deny(null, target, "unauthenticated");
    }
    const m = target.match(/^(\[[^\]]+\]|[^:]+):(\d+)$/);
    if (!m) return void socket.end("HTTP/1.1 400 Bad Request\r\n\r\n");
    const [, host = "", port = "443"] = m;
    const abused = this.abuseCheck(c, host, Number(port));
    if (abused) {
      socket.end(`HTTP/1.1 403 Forbidden\r\nX-Casama-Egress: ${abused}\r\n\r\n`);
      return this.deny(c, target, abused);
    }
    if (!this.meter(c, 1, 0)) {
      socket.end("HTTP/1.1 429 Too Many Requests\r\n\r\n");
      this.flood(c, target);
      return this.deny(c, target, "rate_limited");
    }
    const verdict = await this.vet(c, host);
    if (!verdict.ok) {
      socket.end(`HTTP/1.1 403 Forbidden\r\nX-Casama-Egress: ${verdict.reason}\r\n\r\n`);
      return this.deny(c, target, verdict.reason);
    }
    if (this.scanning(c, verdict.address)) {
      socket.end("HTTP/1.1 429 Too Many Requests\r\nX-Casama-Egress: scanning\r\n\r\n");
      return this.deny(c, target, "scanning");
    }
    if (this.nonWebRefused(c, host, verdict.address, Number(port))) {
      socket.end("HTTP/1.1 429 Too Many Requests\r\nX-Casama-Egress: port_limit\r\n\r\n");
      return this.deny(c, target, "port_limit");
    }
    if (this.hostFlood(c, host)) {
      socket.end("HTTP/1.1 429 Too Many Requests\r\nX-Casama-Egress: flood\r\n\r\n");
      return this.deny(c, target, "flood");
    }
    const upstream = connect({ host: verdict.address, port: Number(port) }, () => {
      socket.write("HTTP/1.1 200 Connection Established\r\n\r\n");
      if (head.length) upstream.write(head);
      this.throttledPipe(c, socket, upstream);
      upstream.pipe(socket);
    });
    const count = (b: Buffer) => {
      if (!this.meter(c, 0, b.length)) {
        this.deny(c, target, "bandwidth_limited");
        socket.destroy();
        upstream.destroy();
      }
    };
    socket.on("data", count);
    upstream.on("data", count);
    upstream.on("error", () => socket.destroy());
    socket.on("close", () => upstream.destroy());
  }

  private async handleHttp(req: IncomingMessage, res: ServerResponse) {
    const c = this.authenticate(req);
    if (!c) {
      res.writeHead(407, { "proxy-authenticate": 'Basic realm="casama"' }).end();
      return this.deny(null, req.url ?? "", "unauthenticated");
    }
    let url: URL;
    try {
      url = new URL(req.url ?? "");
      if (url.protocol !== "http:") throw new Error("only http");
    } catch {
      return void res.writeHead(400).end("absolute http:// URL required");
    }
    const abused = this.abuseCheck(c, url.hostname, Number(url.port || 80));
    if (abused) {
      res
        .writeHead(403, { "x-casama-egress": abused })
        .end(`Blocked by egress policy: ${abused}\n`);
      return this.deny(c, url.host, abused);
    }
    if (!this.meter(c, 1, 0)) {
      res.writeHead(429).end();
      this.flood(c, url.host);
      return this.deny(c, url.host, "rate_limited");
    }
    const verdict = await this.vet(c, url.hostname);
    if (!verdict.ok) {
      res
        .writeHead(403, { "x-casama-egress": verdict.reason })
        .end(`Blocked by egress policy: ${verdict.reason}\n`);
      return this.deny(c, url.host, verdict.reason);
    }
    if (this.scanning(c, verdict.address)) {
      res.writeHead(429, { "x-casama-egress": "scanning" }).end();
      return this.deny(c, url.host, "scanning");
    }
    if (this.nonWebRefused(c, url.hostname, verdict.address, Number(url.port || 80))) {
      res.writeHead(429, { "x-casama-egress": "port_limit" }).end();
      return this.deny(c, url.host, "port_limit");
    }
    if (this.hostFlood(c, url.hostname)) {
      res.writeHead(429, { "x-casama-egress": "flood" }).end();
      return this.deny(c, url.host, "flood");
    }
    const headers = { ...req.headers };
    delete headers["proxy-authorization"];
    delete headers["proxy-connection"];
    headers.host = url.host;
    const upstream = httpRequest(
      {
        host: verdict.address,
        port: Number(url.port || 80),
        method: req.method,
        path: `${url.pathname}${url.search}`,
        headers,
      },
      (up) => {
        res.writeHead(up.statusCode ?? 502, up.headers);
        up.on("data", (b: Buffer) => this.meter(c, 0, b.length));
        up.pipe(res);
      },
    );
    upstream.on("error", () => {
      if (!res.headersSent) res.writeHead(502).end("upstream error");
      else res.destroy();
    });
    this.throttledPipe(c, req, upstream);
  }

  /** Control API for the supervisor: register and unregister computers. */
  createControlServer(): Server {
    return createServer(async (req, res) => {
      if (req.headers.authorization !== `Bearer ${this.controlToken}`)
        return void res.writeHead(401).end();
      const url = new URL(req.url ?? "/", "http://control");
      const json = (status: number, body: unknown) =>
        res.writeHead(status, { "content-type": "application/json" }).end(JSON.stringify(body));
      if (req.method === "GET" && url.pathname === "/healthz")
        return json(200, { ok: true, computers: this.computers.size });
      const ref = url.pathname.match(/^\/computers\/([\w-]+)$/)?.[1];
      if (!ref) return json(404, { code: "not_found" });
      if (req.method === "PUT") {
        const chunks: Buffer[] = [];
        for await (const c of req) chunks.push(c as Buffer);
        const body = JSON.parse(Buffer.concat(chunks).toString() || "{}") as Omit<
          ComputerRegistration,
          "ref"
        >;
        if (!body.token || body.token.length < 16)
          return json(400, { code: "bad_request", message: "token required" });
        this.computers.set(ref, { ...body, ref });
        return json(200, { ok: true });
      }
      if (req.method === "DELETE") {
        this.computers.delete(ref);
        this.usage.delete(ref);
        this.scans.delete(ref);
        this.nonWeb.delete(ref);
        this.hostConnections.delete(ref);
        this.uploads.delete(ref);
        return json(200, { ok: true });
      }
      json(405, { code: "method_not_allowed" });
    });
  }
}
