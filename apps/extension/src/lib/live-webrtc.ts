/**
 * Optional WebRTC live video stream for the pop-out Live View (Phase 5).
 *
 * Uses the same Neko signaling protocol as the Flutter app (`client/lib/core/live.dart`):
 * POST /v1/computers/{id}/stream-session -> WebSocket -> system/init -> signal/request ->
 * signal/provide (offer) -> signal/answer + signal/candidate -> <video>.
 *
 * If the computer has no desktop (409 no_desktop), needs a plan, or WebRTC fails/times out,
 * calls [onFallback] so the pop-out seamlessly returns to lightweight JPEG polling (LiveView).
 */
import type { Here } from "./workspace.ts";

export interface WebRtcOptions {
  api: Here["api"];
  computerId: string;
  video: HTMLVideoElement;
  status: (text: string) => void;
  onFallback: (reason: string) => void;
}

interface NekoMessage {
  event?: string;
  payload?: Record<string, unknown>;
}

const CONNECT_TIMEOUT_MS = 12_000;

export class LiveWebRtc {
  private opts: WebRtcOptions;
  private ws: WebSocket | null = null;
  private pc: RTCPeerConnection | null = null;
  private timeout: ReturnType<typeof setTimeout> | null = null;
  private stopped = false;
  private live = false;

  constructor(opts: WebRtcOptions) {
    this.opts = opts;
  }

  async start(): Promise<void> {
    this.stopped = false;
    this.live = false;
    this.opts.status("Starting live video…");
    let session: {
      signaling_url: string;
      ice_servers: Array<{ urls: string | string[]; username?: string; credential?: string }>;
      ice_transport_policy?: RTCIceTransportPolicy;
    };
    try {
      session = await this.opts.api.unwrap(
        this.opts.api.POST("/v1/computers/{id}/stream-session", {
          params: { path: { id: this.opts.computerId } },
          body: { mode: "view" },
        }),
      );
    } catch (err) {
      const code = (err as { code?: string; status?: number } | null)?.code;
      const status = (err as { status?: number } | null)?.status;
      const msg =
        code === "no_desktop" || status === 409
          ? "No desktop on this computer"
          : err instanceof Error
            ? err.message
            : "Live video unavailable";
      this.fallback(msg);
      return;
    }
    if (this.stopped) return;

    const pc = new RTCPeerConnection({
      iceServers: session.ice_servers,
      iceTransportPolicy: session.ice_transport_policy ?? "relay",
    });
    this.pc = pc;
    const ws = new WebSocket(session.signaling_url);
    this.ws = ws;

    const sendJson = (event: string, payload?: Record<string, unknown>) => {
      if (ws.readyState !== WebSocket.OPEN) return;
      ws.send(JSON.stringify(payload ? { event, payload } : { event }));
    };

    pc.ontrack = (ev) => {
      if (this.stopped) return;
      const stream = ev.streams[0];
      if (stream) {
        this.opts.video.srcObject = stream;
        void this.opts.video.play().catch(() => {});
      }
    };
    pc.onicecandidate = (ev) => {
      if (!ev.candidate?.candidate) return;
      sendJson("signal/candidate", {
        candidate: ev.candidate.candidate,
        sdpMid: ev.candidate.sdpMid,
        sdpMLineIndex: ev.candidate.sdpMLineIndex,
      });
    };
    pc.onconnectionstatechange = () => {
      if (this.stopped) return;
      if (pc.connectionState === "connected") {
        this.live = true;
        this.clearTimer();
        this.opts.status("Live video");
      } else if (pc.connectionState === "failed" || pc.connectionState === "closed") {
        this.fallback("Live video disconnected");
      }
    };

    const early: RTCIceCandidateInit[] = [];
    let haveRemote = false;
    let queue = Promise.resolve();

    ws.onmessage = (ev) => {
      if (this.stopped || typeof ev.data !== "string") return;
      queue = queue
        .then(async () => {
          const msg = JSON.parse(ev.data as string) as NekoMessage;
          const payload = msg.payload ?? {};
          switch (msg.event) {
            case "system/init":
              sendJson("signal/request", { video: {}, audio: {} });
              break;
            case "signal/provide": {
              const sdp = typeof payload.sdp === "string" ? payload.sdp : "";
              if (!sdp) break;
              await pc.setRemoteDescription({ type: "offer", sdp });
              haveRemote = true;
              for (const c of early.splice(0)) {
                await pc.addIceCandidate(c).catch(() => {});
              }
              const answer = await pc.createAnswer();
              await pc.setLocalDescription(answer);
              sendJson("signal/answer", { sdp: answer.sdp });
              break;
            }
            case "signal/candidate": {
              const cand: RTCIceCandidateInit = {
                candidate: typeof payload.candidate === "string" ? payload.candidate : undefined,
                sdpMid: typeof payload.sdpMid === "string" ? payload.sdpMid : undefined,
                sdpMLineIndex:
                  typeof payload.sdpMLineIndex === "number" ? payload.sdpMLineIndex : undefined,
              };
              if (haveRemote) await pc.addIceCandidate(cand).catch(() => {});
              else early.push(cand);
              break;
            }
          }
        })
        .catch(() => {});
    };

    ws.onerror = () => {
      if (!this.stopped) this.fallback("Live video connection failed");
    };
    ws.onclose = () => {
      if (!this.stopped) this.fallback(this.live ? "Live video ended" : "Live video unavailable");
    };

    this.timeout = setTimeout(() => {
      if (!this.stopped && !this.live) {
        this.fallback("Live video timed out");
      }
    }, CONNECT_TIMEOUT_MS);
  }

  private clearTimer() {
    if (this.timeout) {
      clearTimeout(this.timeout);
      this.timeout = null;
    }
  }

  private fallback(reason: string) {
    if (this.stopped) return;
    this.stop();
    this.opts.onFallback(reason);
  }

  stop() {
    this.stopped = true;
    this.clearTimer();
    try {
      this.ws?.close();
    } catch {
      // ignore
    }
    this.ws = null;
    try {
      this.pc?.close();
    } catch {
      // ignore
    }
    this.pc = null;
    if (this.opts.video.srcObject) {
      this.opts.video.srcObject = null;
    }
  }
}
