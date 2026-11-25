/**
 * Floating Screen Card in Chat (SCREEN-CARD-PLAN) + Bot Cursor overlay (BOT-CURSOR-PLAN, D-490).
 *
 * Appears while a bot runs screen tools (browser/desktop/screen) on its cloud computer,
 * polls lightweight JPEG screenshots with ETag/304 (`wake=false`), animates `screen.pointer`
 * with a gliding cursor arrow, click ripple, and typing dots, and auto-hides on finish.
 */
import { h } from "../lib/dom.ts";
import { LiveView, popOutLiveView } from "../lib/live-view.ts";
import { appUrl, type Here } from "../lib/workspace.ts";

export interface ScreenPointerEvent {
  computer_id: string;
  action: string;
  x: number;
  y: number;
  width: number;
  height: number;
}

/** Whether a tool name interacts with a bot computer's screen. */
export function isScreenTool(tool: string): boolean {
  return /^(browser|desktop|screen|computer|gui)[._-]/i.test(tool);
}

/**
 * Gliding bot cursor + click ripple + typing indicator laid over a screenshot/live-view frame.
 * Respects `prefers-reduced-motion` via CSS.
 */
export class BotCursorOverlay {
  readonly el = h("div", {
    className: "bot-cursor-layer",
    "aria-hidden": "true",
    "data-testid": "bot-cursor-layer",
  });
  private pointer = h(
    "div",
    { className: "bot-cursor", hidden: true, "data-testid": "bot-cursor" },
    h("span", { className: "bot-cursor-arrow" }, "➤"),
    h("span", { className: "bot-cursor-dots", hidden: true }, "⋯"),
  );
  private ripple = h("div", { className: "bot-cursor-ripple", hidden: true });
  private hideTimer: ReturnType<typeof setTimeout> | null = null;
  private rippleTimer: ReturnType<typeof setTimeout> | null = null;

  constructor() {
    this.el.append(this.ripple, this.pointer);
  }

  move(ev: ScreenPointerEvent) {
    if (!ev.width || !ev.height) return;
    const px = Math.max(0, Math.min(100, (ev.x / ev.width) * 100));
    const py = Math.max(0, Math.min(100, (ev.y / ev.height) * 100));
    this.pointer.hidden = false;
    this.pointer.style.left = `${px.toFixed(2)}%`;
    this.pointer.style.top = `${py.toFixed(2)}%`;
    const dots = this.pointer.querySelector<HTMLElement>(".bot-cursor-dots");
    const isTyping = ev.action === "type" || ev.action === "fill";
    if (dots) dots.hidden = !isTyping;
    if (ev.action === "click") {
      this.ripple.hidden = false;
      this.ripple.style.left = `${px.toFixed(2)}%`;
      this.ripple.style.top = `${py.toFixed(2)}%`;
      this.ripple.classList.remove("pop");
      void this.ripple.offsetWidth;
      this.ripple.classList.add("pop");
      if (this.rippleTimer) clearTimeout(this.rippleTimer);
      this.rippleTimer = setTimeout(() => {
        this.ripple.hidden = true;
      }, 650);
    }
    if (this.hideTimer) clearTimeout(this.hideTimer);
    this.hideTimer = setTimeout(() => {
      this.pointer.hidden = true;
    }, 3000);
  }

  destroy() {
    if (this.hideTimer) clearTimeout(this.hideTimer);
    if (this.rippleTimer) clearTimeout(this.rippleTimer);
    this.pointer.hidden = true;
    this.ripple.hidden = true;
  }
}

/** Collapsible floating 16:10 Screen Card pinned in the Chat tab during screen tool runs. */
export class ScreenCard {
  readonly el = h("div", { className: "screen-card", hidden: true, "data-testid": "screen-card" });
  private here: Here;
  private computerId: string | null = null;
  private computerName = "Bot's screen";
  private view: LiveView | null = null;
  private cursor = new BotCursorOverlay();
  private img = h("img", {
    className: "screen-card-img",
    alt: "Bot's screen preview",
    "data-testid": "screen-card-img",
  }) as HTMLImageElement;
  private status = h("span", { className: "meta", "data-testid": "screen-card-status" }, "Live");
  private badge = h("span", { className: "screen-card-needs", hidden: true }, "Needs you");
  private title = h("strong", {}, "Bot's screen");
  private dismissed = false;

  constructor(here: Here) {
    this.here = here;
    const stage = h(
      "div",
      {
        className: "screen-card-stage",
        onClick: () => {
          if (this.computerId) {
            void popOutLiveView(this.computerId, this.computerName).catch(() => {
              void chrome.tabs.create({
                url: appUrl(
                  this.here.account,
                  `/computer/live?c=${encodeURIComponent(this.computerId!)}`,
                ),
              });
            });
          }
        },
      },
      this.img,
      this.cursor.el,
    );
    this.el.append(
      h(
        "div",
        { className: "screen-card-head" },
        this.title,
        this.badge,
        this.status,
        h(
          "button",
          {
            type: "button",
            className: "link",
            "data-testid": "screen-card-popout",
            onClick: () => {
              if (this.computerId) void popOutLiveView(this.computerId, this.computerName);
            },
          },
          "Pop out",
        ),
        h(
          "button",
          {
            type: "button",
            className: "link",
            "data-testid": "screen-card-close",
            "aria-label": "Hide screen preview",
            onClick: () => {
              this.dismissed = true;
              this.hide();
            },
          },
          "×",
        ),
      ),
      stage,
    );
  }

  /** Starts showing the computer's live screen preview if not dismissed. */
  show(computerId: string, name?: string) {
    if (!computerId || this.dismissed) return;
    if (name) {
      this.computerName = name;
      this.title.textContent = name;
    }
    if (this.computerId === computerId && !this.el.hidden) return;
    this.view?.stop();
    this.computerId = computerId;
    this.el.hidden = false;
    this.view = new LiveView({
      account: this.here.account,
      computerId,
      img: this.img,
      width: 480,
      wake: false,
      everyMs: 1200,
      status: (t) => {
        this.status.textContent = t;
      },
    });
    void this.view.start();
  }

  setNeedsYou(on: boolean) {
    this.badge.hidden = !on;
    this.el.classList.toggle("needs-you", on);
  }

  pointer(ev: ScreenPointerEvent) {
    if (!this.computerId && ev.computer_id) this.show(ev.computer_id);
    if (this.el.hidden) return;
    this.cursor.move(ev);
  }

  /** Resets dismissed flag for a fresh run and hides the card. */
  reset() {
    this.dismissed = false;
    this.setNeedsYou(false);
    this.hide();
  }

  hide() {
    this.view?.stop();
    this.view = null;
    this.cursor.destroy();
    this.computerId = null;
    this.el.hidden = true;
  }
}
