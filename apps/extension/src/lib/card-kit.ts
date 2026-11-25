/**
 * Rich & Live Data Cards for Casama for Chrome (Phase 3, D-335, D-337, D-458, D-471, D-480, D-481, D-487).
 *
 * - Tier 1 (~30 native DOM cards): Casama core cards + top live/composed cards, all built with h()
 *   (no raw innerHTML on untrusted data), responsive at 360px side-panel width.
 * - Tier 2 (Generic Structured Card Fallback): renders any remaining/future LIVE_COMPONENTS or
 *   plugin card with its title, summary, metrics, list items, source/freshness footer, and live refresh.
 */
import { h } from "./dom.ts";
import { markdownNodes } from "./md.ts";

export type CardComp = Record<string, unknown> & { id: string; component: string };

export interface RichCardContext {
  surfaceId: string;
  answered?: boolean;
  openUrl?: string;
  drawChild: (id: unknown, depth: number) => Node;
  depth: number;
  fireAction: (
    label: string,
    name: string,
    context: Record<string, unknown>,
    sourceId: string,
  ) => Promise<void>;
  onRefreshLiveCard?: (id: string) => Promise<Record<string, unknown> | null>;
  onWatchLiveCard?: (id: string, watch: boolean) => Promise<boolean>;
}

const httpsUrl = (u: unknown) => (typeof u === "string" && /^https:\/\//.test(u) ? u : null);
const str = (v: unknown) => (v == null ? "" : String(v));
const num = (v: unknown) => (typeof v === "number" && Number.isFinite(v) ? v : null);

function fmtMoney(amount: unknown, currency?: unknown): string {
  const n = num(amount);
  if (n === null) return str(amount);
  const cur = str(currency || "USD").toUpperCase();
  try {
    return new Intl.NumberFormat(undefined, {
      style: "currency",
      currency: cur,
      maximumFractionDigits: n >= 100 ? 0 : 2,
    }).format(n);
  } catch {
    return `${cur} ${n.toLocaleString()}`;
  }
}

function fmtShortTime(iso: unknown): string {
  const s = str(iso);
  if (!s) return "";
  const d = new Date(s);
  if (Number.isNaN(d.getTime())) return s;
  return d.toLocaleString(undefined, {
    month: "short",
    day: "numeric",
    hour: "numeric",
    minute: "2-digit",
  });
}

function weatherGlyph(code: unknown): string {
  const k = str(code).toLowerCase();
  if (/thunder|storm/.test(k)) return "⛈";
  if (/snow|sleet|blizzard/.test(k)) return "❄";
  if (/rain|shower|drizzle/.test(k)) return "🌧";
  if (/fog|mist|haze/.test(k)) return "🌫";
  if (/partly|mostly_clear/.test(k)) return "⛅";
  if (/cloud|overcast/.test(k)) return "☁";
  if (/clear|sun/.test(k)) return "☀";
  return "🌡";
}

/** Tiny inline SVG sparkline or bar chart using DOM namespaces (no innerHTML). */
export function svgChart(
  values: number[],
  kind: "line" | "bar" = "line",
  opts: { positive?: boolean; negative?: boolean } = {},
): SVGSVGElement | null {
  if (values.length < 2) return null;
  const w = 280;
  const height = 56;
  const pad = 4;
  const min = Math.min(...values);
  const max = Math.max(...values);
  const span = max - min || 1;
  const ns = "http://www.w3.org/2000/svg";
  const svg = document.createElementNS(ns, "svg");
  svg.setAttribute("viewBox", `0 0 ${w} ${height}`);
  svg.setAttribute("class", "rc-chart");
  svg.setAttribute("aria-hidden", "true");
  const stroke = opts.negative
    ? "var(--negative)"
    : opts.positive
      ? "var(--positive)"
      : "var(--primary)";

  if (kind === "bar") {
    const bw = Math.max(2, (w - pad * 2) / values.length - 2);
    values.forEach((v, i) => {
      const rect = document.createElementNS(ns, "rect");
      const bh = Math.max(2, ((v - min) / span) * (height - pad * 2));
      rect.setAttribute("x", String(pad + i * ((w - pad * 2) / values.length)));
      rect.setAttribute("y", String(height - pad - bh));
      rect.setAttribute("width", String(bw));
      rect.setAttribute("height", String(bh));
      rect.setAttribute("rx", "2");
      rect.setAttribute("fill", stroke);
      svg.append(rect);
    });
  } else {
    const pts = values
      .map((v, i) => {
        const x = pad + (i / (values.length - 1)) * (w - pad * 2);
        const y = height - pad - ((v - min) / span) * (height - pad * 2);
        return `${x.toFixed(1)},${y.toFixed(1)}`;
      })
      .join(" ");
    const poly = document.createElementNS(ns, "polyline");
    poly.setAttribute("fill", "none");
    poly.setAttribute("stroke", stroke);
    poly.setAttribute("stroke-width", "2");
    poly.setAttribute("stroke-linecap", "round");
    poly.setAttribute("stroke-linejoin", "round");
    poly.setAttribute("points", pts);
    svg.append(poly);
  }
  return svg;
}

/** Source, freshness timestamp, live refresh button, and optional price watch button. */
function liveFooter(
  c: CardComp,
  ctx: RichCardContext,
  onReplace: (fresh: CardComp) => void,
): HTMLElement | null {
  const live = (c.live as Record<string, unknown> | undefined) ?? null;
  const source =
    (c.source as { name?: string; url?: string } | undefined) ??
    (live?.source as { name?: string; url?: string } | undefined);
  const liveId = typeof live?.id === "string" ? live.id : null;
  const fetchedAt =
    typeof live?.fetched_at === "string"
      ? live.fetched_at
      : typeof c.asOf === "string"
        ? c.asOf
        : null;
  const staleErr = typeof live?.error === "string" ? live.error : null;

  if (!source && !liveId && !fetchedAt && !staleErr) return null;

  const foot = h("div", { className: "rc-foot", "data-testid": "rc-foot" });
  const left = h("span", { className: "rc-source" });
  if (source?.name) {
    const su = httpsUrl(source.url);
    left.append(
      su ? h("a", { href: su, target: "_blank", rel: "noopener" }, source.name) : source.name,
    );
  }
  if (fetchedAt) {
    if (left.childNodes.length) left.append(" · ");
    left.append(fmtShortTime(fetchedAt));
  }
  if (staleErr) {
    left.append(h("span", { className: "rc-stale" }, ` · Stale (${staleErr})`));
  }
  foot.append(left);

  const right = h("span", { className: "rc-foot-actions" });
  if (liveId && c.component === "Fares" && ctx.onWatchLiveCard) {
    let watching = Boolean(live?.watching);
    const watchBtn = h(
      "button",
      {
        type: "button",
        className: "link rc-watch",
        "data-testid": "rc-watch",
        onClick: async () => {
          watchBtn.disabled = true;
          try {
            const ok = await ctx.onWatchLiveCard!(liveId, !watching);
            if (ok) {
              watching = !watching;
              watchBtn.textContent = watching ? "Watching" : "Watch price";
            }
          } finally {
            watchBtn.disabled = false;
          }
        },
      },
      watching ? "Watching" : "Watch price",
    ) as HTMLButtonElement;
    right.append(watchBtn);
  }
  if (liveId && ctx.onRefreshLiveCard) {
    const refBtn = h(
      "button",
      {
        type: "button",
        className: "link rc-refresh",
        "data-testid": "rc-refresh",
        title: "Refresh",
        onClick: async () => {
          refBtn.disabled = true;
          refBtn.textContent = "…";
          try {
            const fresh = await ctx.onRefreshLiveCard!(liveId);
            if (fresh) {
              onReplace({
                ...c,
                ...fresh,
                id: c.id,
                component: String(fresh.component ?? c.component),
              });
              return;
            }
          } finally {
            refBtn.disabled = false;
            refBtn.textContent = "↻";
          }
        },
      },
      "↻",
    ) as HTMLButtonElement;
    right.append(refBtn);
  }
  if (right.childNodes.length) foot.append(right);
  return foot;
}

export const TIER1_CARDS = new Set([
  // Casama core cards (11)
  "Map",
  "MessageDraft",
  "Event",
  "Agenda",
  "MessageList",
  "Checklist",
  "Stats",
  "Results",
  "PersonPicker",
  "Schedule",
  "Details",
  // Top Live Data & Composed cards (21)
  "Weather",
  "Forecast",
  "Quote",
  "Currency",
  "Parcel",
  "Fares",
  "FareDetails",
  "Stays",
  "Products",
  "Summary",
  "Comparison",
  "ProsCons",
  "Steps",
  "Timeline",
  "Quiz",
  "Status",
  "Dashboard",
  "Carousel",
  "Checkout",
  "Order",
]);

/** Renders any Tier 1 or Tier 2 card component into a self-updating DOM wrapper. */
export function renderRichCard(c: CardComp, ctx: RichCardContext): HTMLElement {
  const wrap = h("div", {
    className: `rc-card rc-${c.component.toLowerCase()}`,
    "data-testid": `card-${c.component}`,
  });
  const mount = (comp: CardComp) => {
    const inner = renderTier1(comp, ctx) ?? renderGenericCard(comp, ctx);
    const foot = liveFooter(comp, ctx, mount);
    wrap.replaceChildren(inner, ...(foot ? [foot] : []));
  };
  mount(c);
  return wrap;
}

function renderTier1(c: CardComp, ctx: RichCardContext): HTMLElement | null {
  switch (c.component) {
    case "Map": {
      const markers = (c.markers as Array<{ lat: number; lng: number; label?: string }>) ?? [];
      const center = (c.center as { lat: number; lng: number } | undefined) ?? markers[0];
      const lat = center?.lat ?? 0;
      const lng = center?.lng ?? 0;
      const zoom = num(c.zoom) ?? 13;
      const osmUrl = `https://www.openstreetmap.org/?mlat=${lat}&mlon=${lng}#map=${zoom}/${lat}/${lng}`;
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, str(c.title || markers[0]?.label || "Map")),
          h(
            "a",
            { href: osmUrl, target: "_blank", rel: "noopener", className: "rc-link" },
            "Open map ↗",
          ),
        ),
        h("div", { className: "meta" }, `${lat.toFixed(4)}, ${lng.toFixed(4)} · zoom ${zoom}`),
        markers.length
          ? h(
              "ul",
              { className: "rc-list" },
              ...markers
                .slice(0, 8)
                .map((m) =>
                  h("li", {}, `📍 ${m.label || `${m.lat.toFixed(4)}, ${m.lng.toFixed(4)}`}`),
                ),
            )
          : "",
      );
    }

    case "MessageDraft": {
      const to = Array.isArray(c.to) ? c.to.map(String) : [];
      const subj = h("input", {
        type: "text",
        value: str(c.subject),
        placeholder: "Subject",
        disabled: ctx.answered,
        "data-testid": "draft-subject",
      }) as HTMLInputElement;
      const body = h("textarea", {
        disabled: ctx.answered,
        "data-testid": "draft-body",
      }) as HTMLTextAreaElement;
      body.value = str(c.body);
      const sendBtn = h(
        "button",
        {
          type: "button",
          className: "primary",
          disabled: ctx.answered,
          "data-testid": "draft-send",
          onClick: () =>
            void ctx.fireAction(
              "Send",
              "draft.send",
              {
                kind: c.kind ?? "email",
                app: c.app,
                to,
                subject: subj.value,
                body: body.value,
              },
              c.id,
            ),
        },
        "Send",
      );
      const discardBtn = h(
        "button",
        {
          type: "button",
          disabled: ctx.answered,
          "data-testid": "draft-discard",
          onClick: () => void ctx.fireAction("Discard", "draft.discard", {}, c.id),
        },
        "Discard",
      );
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, str(c.title || (c.kind === "post" ? "Draft post" : "Message draft"))),
          c.app ? h("span", { className: "rc-badge" }, str(c.app)) : "",
        ),
        to.length ? h("div", { className: "meta" }, `To: ${to.join(", ")}`) : "",
        c.kind !== "message" ? subj : "",
        body,
        h("div", { className: "row" }, sendBtn, discardBtn),
      );
    }

    case "Event": {
      const attendees = Array.isArray(c.attendees) ? c.attendees.map(String) : [];
      const showActions = c.actions !== false;
      return h(
        "div",
        { className: "rc-body" },
        h("strong", {}, str(c.title || "Event")),
        h(
          "div",
          { className: "meta" },
          `${fmtShortTime(c.start)}${c.end ? ` – ${fmtShortTime(c.end)}` : ""}`,
        ),
        c.location ? h("div", { className: "meta" }, `📍 ${str(c.location)}`) : "",
        attendees.length ? h("div", { className: "meta" }, `With: ${attendees.join(", ")}`) : "",
        c.description ? h("p", { className: "rc-text" }, str(c.description)) : "",
        showActions
          ? h(
              "div",
              { className: "row" },
              h(
                "button",
                {
                  type: "button",
                  className: "primary",
                  disabled: ctx.answered,
                  onClick: () =>
                    void ctx.fireAction(
                      "Add to calendar",
                      "event.add",
                      {
                        title: c.title,
                        start: c.start,
                        end: c.end,
                        location: c.location,
                        attendees,
                        description: c.description,
                      },
                      c.id,
                    ),
                },
                "Add to calendar",
              ),
              h(
                "button",
                {
                  type: "button",
                  disabled: ctx.answered,
                  onClick: () => void ctx.fireAction("Change", "event.change", {}, c.id),
                },
                "Change",
              ),
              h(
                "button",
                {
                  type: "button",
                  className: "link",
                  disabled: ctx.answered,
                  onClick: () => void ctx.fireAction("Skip", "event.skip", {}, c.id),
                },
                "Skip",
              ),
            )
          : "",
      );
    }

    case "Agenda": {
      const events = (c.events as Array<Record<string, unknown>>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        h("strong", {}, str(c.title || c.date || "Agenda")),
        h(
          "div",
          { className: "rc-rows" },
          ...events
            .slice(0, 20)
            .map((ev) =>
              h(
                "div",
                { className: "rc-row-item" },
                h("div", { className: "rc-row-title" }, str(ev.title)),
                h(
                  "div",
                  { className: "meta" },
                  `${ev.allDay ? "All day" : fmtShortTime(ev.start)}${ev.location ? ` · ${str(ev.location)}` : ""}`,
                ),
              ),
            ),
        ),
      );
    }

    case "MessageList": {
      const msgs = (c.messages as Array<Record<string, unknown>>) ?? [];
      const canReply = c.reply !== false;
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, str(c.title || "Messages")),
          c.app ? h("span", { className: "rc-badge" }, str(c.app)) : "",
        ),
        h(
          "div",
          { className: "rc-rows" },
          ...msgs.slice(0, 15).map((m) =>
            h(
              "div",
              { className: "rc-row-item" },
              h(
                "div",
                { className: "rc-head" },
                h("strong", {}, str(m.from)),
                h("span", { className: "meta" }, str(m.time)),
              ),
              m.subject ? h("div", { className: "rc-row-title" }, str(m.subject)) : "",
              m.preview ? h("div", { className: "meta" }, str(m.preview).slice(0, 140)) : "",
              canReply
                ? h(
                    "button",
                    {
                      type: "button",
                      className: "link",
                      disabled: ctx.answered,
                      onClick: () =>
                        void ctx.fireAction(
                          `Reply to ${str(m.from)}`,
                          "message.reply",
                          { id: m.id, from: m.from, subject: m.subject },
                          c.id,
                        ),
                    },
                    "Reply",
                  )
                : "",
            ),
          ),
        ),
      );
    }

    case "Checklist": {
      const items =
        (c.items as Array<{ id: string; text: string; done?: boolean; due?: string }>) ?? [];
      const state = new Map(items.map((it) => [it.id, Boolean(it.done)]));
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        h(
          "div",
          { className: "ui-col" },
          ...items.slice(0, 40).map((it) => {
            const box = h("input", {
              type: "checkbox",
              checked: Boolean(it.done),
              disabled: ctx.answered,
              onChange: () => state.set(it.id, box.checked),
            }) as HTMLInputElement;
            return h(
              "label",
              { className: "ui-check" },
              box,
              h(
                "span",
                {},
                it.text,
                it.due ? h("span", { className: "meta" }, ` · ${it.due}`) : "",
              ),
            );
          }),
        ),
        h(
          "div",
          { className: "row" },
          h(
            "button",
            {
              type: "button",
              className: "primary",
              disabled: ctx.answered,
              onClick: () => {
                const done = [...state.entries()].filter(([, v]) => v).map(([k]) => k);
                const undone = [...state.entries()].filter(([, v]) => !v).map(([k]) => k);
                void ctx.fireAction("Save", "checklist.save", { done, undone }, c.id);
              },
            },
            "Save",
          ),
        ),
      );
    }

    case "Stats": {
      const stats = (c.stats as Array<Record<string, unknown>>) ?? [];
      const chart = c.chart as
        | {
            type?: "line" | "bar";
            labels?: string[];
            series?: Array<{ name?: string; values?: number[] }>;
          }
        | undefined;
      const firstSeries = chart?.series?.[0]?.values;
      const svg = firstSeries
        ? svgChart(firstSeries, chart?.type === "bar" ? "bar" : "line")
        : null;
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        stats.length
          ? h(
              "div",
              { className: "rc-kpi-grid" },
              ...stats.slice(0, 8).map((s) =>
                h(
                  "div",
                  { className: "rc-kpi" },
                  h("div", { className: "meta" }, str(s.label)),
                  h(
                    "div",
                    { className: "rc-kpi-val" },
                    `${str(s.value)}${s.unit ? ` ${str(s.unit)}` : ""}`,
                  ),
                  s.change
                    ? h(
                        "div",
                        {
                          className: `rc-delta ${s.trend === "up" ? "pos" : s.trend === "down" ? "neg" : ""}`,
                        },
                        str(s.change),
                      )
                    : "",
                ),
              ),
            )
          : "",
        svg ?? "",
      );
    }

    case "Results": {
      const items = (c.items as Array<Record<string, unknown>>) ?? [];
      const choose = Boolean(c.choose);
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        h(
          "div",
          { className: "rc-rows" },
          ...items.slice(0, 12).map((it) => {
            const u = httpsUrl(it.url);
            return h(
              "div",
              { className: "rc-row-item" },
              h(
                "div",
                { className: "rc-head" },
                u
                  ? h("a", { href: u, target: "_blank", rel: "noopener" }, str(it.title))
                  : h("strong", {}, str(it.title)),
                it.price != null ? h("span", { className: "rc-price" }, str(it.price)) : "",
              ),
              it.subtitle ? h("div", { className: "meta" }, str(it.subtitle)) : "",
              it.rating != null
                ? h(
                    "div",
                    { className: "meta" },
                    `★ ${str(it.rating)}${it.reviews ? ` (${str(it.reviews)})` : ""}${it.badge ? ` · ${str(it.badge)}` : ""}`,
                  )
                : "",
              choose
                ? h(
                    "button",
                    {
                      type: "button",
                      className: "link",
                      disabled: ctx.answered,
                      onClick: () =>
                        void ctx.fireAction(
                          `Choose ${str(it.title)}`,
                          "result.choose",
                          { id: it.id, title: it.title },
                          c.id,
                        ),
                    },
                    "Choose",
                  )
                : "",
            );
          }),
        ),
      );
    }

    case "PersonPicker": {
      const people = (c.people as Array<{ id?: string; name: string; detail?: string }>) ?? [];
      const multi = Boolean(c.multiple);
      const picked = new Set<number>();
      return h(
        "div",
        { className: "rc-body" },
        h("strong", {}, str(c.label || "Which person?")),
        h(
          "div",
          { className: "ui-col" },
          ...people.slice(0, 12).map((p, i) => {
            const inp = h("input", {
              type: multi ? "checkbox" : "radio",
              name: `${ctx.surfaceId}-${c.id}`,
              disabled: ctx.answered,
              onChange: () => {
                if (!multi) picked.clear();
                if (inp.checked) picked.add(i);
                else picked.delete(i);
              },
            }) as HTMLInputElement;
            return h(
              "label",
              { className: "ui-check" },
              inp,
              h(
                "span",
                {},
                p.name,
                p.detail ? h("span", { className: "meta" }, ` · ${p.detail}`) : "",
              ),
            );
          }),
        ),
        h(
          "div",
          { className: "row" },
          h(
            "button",
            {
              type: "button",
              className: "primary",
              disabled: ctx.answered,
              onClick: () =>
                void ctx.fireAction(
                  "Choose",
                  "person.pick",
                  { people: [...picked].map((i) => people[i]) },
                  c.id,
                ),
            },
            "Choose",
          ),
          h(
            "button",
            {
              type: "button",
              className: "link",
              disabled: ctx.answered,
              onClick: () => void ctx.fireAction("None of these", "person.none", {}, c.id),
            },
            "None",
          ),
        ),
      );
    }

    case "Schedule": {
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, str(c.title)),
          c.kind ? h("span", { className: "rc-badge" }, str(c.kind)) : "",
        ),
        h(
          "div",
          { className: "meta" },
          `🕒 ${str(c.when)}${c.next ? ` · Next: ${str(c.next)}` : ""}`,
        ),
        c.detail ? h("p", { className: "rc-text" }, str(c.detail)) : "",
        h(
          "div",
          { className: "row" },
          h(
            "button",
            {
              type: "button",
              disabled: ctx.answered,
              onClick: () => void ctx.fireAction("Change", "schedule.change", { ref: c.ref }, c.id),
            },
            "Change",
          ),
          h(
            "button",
            {
              type: "button",
              className: "link",
              disabled: ctx.answered,
              onClick: () =>
                void ctx.fireAction("Cancel it", "schedule.cancel", { ref: c.ref }, c.id),
            },
            "Cancel",
          ),
        ),
      );
    }

    case "Details": {
      const rows = (c.rows as Array<{ label: string; value: unknown }>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        h(
          "dl",
          { className: "rc-kv" },
          ...rows.slice(0, 30).flatMap((r) => [h("dt", {}, r.label), h("dd", {}, str(r.value))]),
        ),
        c.footer ? h("div", { className: "meta" }, str(c.footer)) : "",
      );
    }

    // ---- Top Live Data & Composed Cards ----

    case "Weather": {
      const place =
        (c.place as { name?: string; region?: string; country?: string } | undefined) ?? {};
      const now = (c.now as Record<string, unknown> | undefined) ?? {};
      const day = (c.day as Record<string, unknown> | undefined) ?? {};
      const hours = (c.hours as Array<Record<string, unknown>> | undefined) ?? [];
      const temp = num(now.temp);
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h(
            "strong",
            {},
            [place.name, place.region || place.country].filter(Boolean).join(", ") || "Weather",
          ),
          h("span", { className: "rc-big-icon" }, weatherGlyph(now.code ?? day.code)),
        ),
        h(
          "div",
          { className: "rc-hero" },
          temp !== null ? `${Math.round(temp)}°` : str(now.temp),
          day.high != null && day.low != null
            ? h(
                "span",
                { className: "meta" },
                ` H:${Math.round(Number(day.high))}° L:${Math.round(Number(day.low))}°`,
              )
            : "",
        ),
        h(
          "div",
          { className: "meta" },
          [
            now.feels != null ? `Feels ${Math.round(Number(now.feels))}°` : "",
            now.humidity != null ? `Humidity ${Math.round(Number(now.humidity))}%` : "",
            now.windKph != null ? `Wind ${Math.round(Number(now.windKph))} km/h` : "",
          ]
            .filter(Boolean)
            .join(" · "),
        ),
        hours.length
          ? h(
              "div",
              { className: "rc-strip" },
              ...hours
                .slice(0, 8)
                .map((hr) =>
                  h(
                    "div",
                    { className: "rc-strip-cell" },
                    h("div", { className: "meta" }, str(hr.t).slice(11, 16) || str(hr.t)),
                    h("div", {}, weatherGlyph(hr.code)),
                    h("strong", {}, hr.temp != null ? `${Math.round(Number(hr.temp))}°` : ""),
                  ),
                ),
            )
          : "",
      );
    }

    case "Forecast": {
      const place = (c.place as { name?: string; country?: string } | undefined) ?? {};
      const days = (c.days as Array<Record<string, unknown>>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        h("strong", {}, `${[place.name, place.country].filter(Boolean).join(", ")} forecast`),
        h(
          "div",
          { className: "rc-rows" },
          ...days
            .slice(0, 10)
            .map((d) =>
              h(
                "div",
                { className: "rc-head" },
                h("span", {}, str(d.date)),
                h("span", {}, weatherGlyph(d.code)),
                h(
                  "strong",
                  {},
                  `${Math.round(Number(d.low ?? 0))}° / ${Math.round(Number(d.high ?? 0))}°`,
                ),
              ),
            ),
        ),
      );
    }

    case "Quote": {
      const pct = num(c.changePct);
      const chg = num(c.change);
      const pos = (pct ?? chg ?? 0) > 0;
      const neg = (pct ?? chg ?? 0) < 0;
      const rawPts = ((c.chart as { points?: Array<[unknown, number]> } | undefined)?.points ?? [])
        .map((p) => Number(p[1]))
        .filter((n) => Number.isFinite(n));
      const svg = svgChart(rawPts, "line", { positive: pos, negative: neg });
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, `${str(c.symbol)}${c.name ? ` · ${str(c.name)}` : ""}`),
          c.marketState ? h("span", { className: "rc-badge" }, str(c.marketState)) : "",
        ),
        h(
          "div",
          { className: "rc-hero" },
          fmtMoney(c.price, c.currency),
          pct !== null
            ? h(
                "span",
                { className: `rc-delta ${pos ? "pos" : neg ? "neg" : ""}` },
                ` ${pos ? "+" : ""}${pct.toFixed(2)}%`,
              )
            : "",
        ),
        svg ?? "",
        c.dayLow != null && c.dayHigh != null
          ? h(
              "div",
              { className: "meta" },
              `Day: ${fmtMoney(c.dayLow, c.currency)} – ${fmtMoney(c.dayHigh, c.currency)}`,
            )
          : "",
      );
    }

    case "Currency": {
      const amount = num(c.amount) ?? 1;
      const base = str(c.base || "USD");
      const rates = (c.rates as Array<{ to: string; rate: number }>) ?? [];
      const trendPts = (
        (c.trend as { points?: Array<[unknown, number]> } | undefined)?.points ?? []
      )
        .map((p) => Number(p[1]))
        .filter((n) => Number.isFinite(n));
      const svg = svgChart(trendPts, "line");
      return h(
        "div",
        { className: "rc-body" },
        h("strong", {}, `${amount.toLocaleString()} ${base}`),
        h(
          "div",
          { className: "rc-rows" },
          ...rates.map((r) =>
            h(
              "div",
              { className: "rc-head" },
              h("span", { className: "rc-hero" }, fmtMoney(amount * r.rate, r.to)),
              h("span", { className: "meta" }, `1 ${base} = ${r.rate.toFixed(4)} ${r.to}`),
            ),
          ),
        ),
        svg ?? "",
      );
    }

    case "Parcel": {
      const events = (c.events as Array<Record<string, unknown>>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h(
            "strong",
            {},
            `${str(c.carrier || "Package")} ${str(c.trackingNumber || c.number || "")}`,
          ),
          c.status ? h("span", { className: "rc-badge" }, str(c.status)) : "",
        ),
        c.eta ? h("div", { className: "meta" }, `ETA: ${str(c.eta)}`) : "",
        h(
          "div",
          { className: "rc-rows" },
          ...events
            .slice(0, 8)
            .map((ev) =>
              h(
                "div",
                { className: "rc-row-item" },
                h("div", {}, str(ev.description || ev.status)),
                h(
                  "div",
                  { className: "meta" },
                  [str(ev.location), fmtShortTime(ev.time || ev.at)].filter(Boolean).join(" · "),
                ),
              ),
            ),
        ),
      );
    }

    case "Fares": {
      const from = (c.from as { code?: string; city?: string } | undefined) ?? {};
      const to = (c.to as { code?: string; city?: string } | undefined) ?? {};
      const options = (c.options as Array<Record<string, unknown>>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, `✈ ${from.code || from.city || ""} → ${to.code || to.city || ""}`),
          c.cheapest != null
            ? h("span", { className: "rc-price" }, `from ${fmtMoney(c.cheapest, c.currency)}`)
            : "",
        ),
        h(
          "div",
          { className: "meta" },
          [str(c.depart), c.return ? `– ${str(c.return)}` : "", str(c.cabin)]
            .filter(Boolean)
            .join(" · "),
        ),
        h(
          "div",
          { className: "rc-rows" },
          ...options
            .slice(0, 6)
            .map((o, idx) =>
              h(
                "div",
                { className: "rc-row-item" },
                h(
                  "div",
                  { className: "rc-head" },
                  h("strong", {}, str(o.airline || o.carrier || `Option ${idx + 1}`)),
                  h("span", { className: "rc-price" }, fmtMoney(o.price, c.currency)),
                ),
                h(
                  "div",
                  { className: "meta" },
                  [
                    o.stops === 0
                      ? "Nonstop"
                      : o.stops != null
                        ? `${o.stops} stop${o.stops === 1 ? "" : "s"}`
                        : "",
                    o.durationMin
                      ? `${Math.floor(Number(o.durationMin) / 60)}h ${Number(o.durationMin) % 60}m`
                      : "",
                    str(o.departTime || ""),
                  ]
                    .filter(Boolean)
                    .join(" · "),
                ),
              ),
            ),
        ),
      );
    }

    case "FareDetails": {
      const opt = (c.option as Record<string, unknown> | undefined) ?? {};
      const legs = (opt.legs as Array<Record<string, unknown>> | undefined) ?? [];
      const bookUrl = httpsUrl(opt.url ?? opt.bookingUrl);
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, str(opt.airline || "Flight details")),
          opt.price != null
            ? h("span", { className: "rc-price" }, fmtMoney(opt.price, c.currency))
            : "",
        ),
        ...legs.map((leg) =>
          h(
            "div",
            { className: "rc-row-item" },
            h("div", {}, `${str(leg.from)} → ${str(leg.to)} ${str(leg.flight || "")}`),
            h("div", { className: "meta" }, `${str(leg.depart)} – ${str(leg.arrive)}`),
          ),
        ),
        bookUrl
          ? h("a", { href: bookUrl, target: "_blank", rel: "noopener" }, "Book flight ↗")
          : "",
      );
    }

    case "Stays": {
      const place = (c.place as { name?: string } | undefined) ?? {};
      const stays = (c.stays as Array<Record<string, unknown>>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, `🏨 ${place.name || "Stays"}`),
          c.cheapest != null
            ? h("span", { className: "rc-price" }, `from ${fmtMoney(c.cheapest, c.currency)}`)
            : "",
        ),
        h(
          "div",
          { className: "meta" },
          [
            str(c.checkIn),
            c.checkOut ? `– ${str(c.checkOut)}` : "",
            c.nights ? `${c.nights} nights` : "",
          ]
            .filter(Boolean)
            .join(" · "),
        ),
        h(
          "div",
          { className: "rc-rows" },
          ...stays.slice(0, 6).map((s) => {
            const u = httpsUrl(s.url);
            return h(
              "div",
              { className: "rc-row-item" },
              h(
                "div",
                { className: "rc-head" },
                u
                  ? h("a", { href: u, target: "_blank", rel: "noopener" }, str(s.name))
                  : h("strong", {}, str(s.name)),
                s.price != null
                  ? h("span", { className: "rc-price" }, fmtMoney(s.price, c.currency))
                  : "",
              ),
              h(
                "div",
                { className: "meta" },
                [s.rating != null ? `★ ${s.rating}` : "", str(s.area || s.neighborhood || "")]
                  .filter(Boolean)
                  .join(" · "),
              ),
            );
          }),
        ),
      );
    }

    case "Products": {
      const products = (c.products as Array<Record<string, unknown>>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        h("strong", {}, `🛍 ${str(c.query || "Products")}`),
        h(
          "div",
          { className: "rc-rows" },
          ...products.slice(0, 8).map((p) => {
            const u = httpsUrl(p.url);
            return h(
              "div",
              { className: "rc-row-item" },
              h(
                "div",
                { className: "rc-head" },
                u
                  ? h("a", { href: u, target: "_blank", rel: "noopener" }, str(p.title || p.name))
                  : h("strong", {}, str(p.title || p.name)),
                p.price != null
                  ? h("span", { className: "rc-price" }, fmtMoney(p.price, c.currency))
                  : "",
              ),
              h(
                "div",
                { className: "meta" },
                [str(p.seller || p.store || ""), p.rating != null ? `★ ${p.rating}` : ""]
                  .filter(Boolean)
                  .join(" · "),
              ),
            );
          }),
        ),
      );
    }

    case "Summary": {
      const facts = (c.facts as Array<{ label: string; value: unknown }>) ?? [];
      const img = httpsUrl(c.imageUrl);
      const u = httpsUrl(c.url);
      return h(
        "div",
        { className: "rc-body" },
        img
          ? h("img", { src: img, alt: str(c.title), className: "rc-thumb", loading: "lazy" })
          : "",
        h(
          "strong",
          {},
          u ? h("a", { href: u, target: "_blank", rel: "noopener" }, str(c.title)) : str(c.title),
        ),
        c.subtitle ? h("div", { className: "meta" }, str(c.subtitle)) : "",
        c.text ? h("div", { className: "rc-text" }, markdownNodes(str(c.text))) : "",
        facts.length
          ? h(
              "dl",
              { className: "rc-kv" },
              ...facts
                .slice(0, 12)
                .flatMap((f) => [h("dt", {}, f.label), h("dd", {}, str(f.value))]),
            )
          : "",
      );
    }

    case "Comparison": {
      const items = (c.items as string[]) ?? [];
      const rows = (c.rows as Array<{ label: string; values: unknown[]; best?: number }>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        h(
          "div",
          { className: "rc-table-wrap" },
          h(
            "table",
            { className: "rc-table" },
            h(
              "thead",
              {},
              h("tr", {}, h("th", {}, ""), ...items.map((it) => h("th", {}, str(it)))),
            ),
            h(
              "tbody",
              {},
              ...rows
                .slice(0, 20)
                .map((r) =>
                  h(
                    "tr",
                    {},
                    h("th", {}, r.label),
                    ...(r.values ?? []).map((v, i) =>
                      h("td", { className: r.best === i ? "rc-best" : "" }, str(v)),
                    ),
                  ),
                ),
            ),
          ),
        ),
      );
    }

    case "ProsCons": {
      const pros = (c.pros as string[]) ?? [];
      const cons = (c.cons as string[]) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        h(
          "div",
          { className: "rc-pros-cons" },
          h(
            "div",
            {},
            h("div", { className: "rc-delta pos" }, "Pros"),
            h("ul", { className: "rc-list" }, ...pros.map((p) => h("li", {}, p))),
          ),
          h(
            "div",
            {},
            h("div", { className: "rc-delta neg" }, "Cons"),
            h("ul", { className: "rc-list" }, ...cons.map((p) => h("li", {}, p))),
          ),
        ),
        c.verdict ? h("div", { className: "meta" }, `Verdict: ${str(c.verdict)}`) : "",
      );
    }

    case "Steps": {
      const steps = (c.steps as Array<{ title: string; detail?: string }>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        h(
          "ol",
          { className: "rc-steps" },
          ...steps
            .slice(0, 20)
            .map((s) =>
              h(
                "li",
                {},
                h("strong", {}, s.title),
                s.detail ? h("div", { className: "meta" }, s.detail) : "",
              ),
            ),
        ),
      );
    }

    case "Timeline": {
      const events = (c.events as Array<{ when: string; title: string; detail?: string }>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        h(
          "div",
          { className: "rc-timeline" },
          ...events
            .slice(0, 30)
            .map((ev) =>
              h(
                "div",
                { className: "rc-tl-row" },
                h("span", { className: "meta" }, ev.when),
                h("strong", {}, ev.title),
                ev.detail ? h("div", { className: "meta" }, ev.detail) : "",
              ),
            ),
        ),
      );
    }

    case "Quiz": {
      const options = (c.options as string[]) ?? [];
      const correct = num(c.answer);
      const feedback = h("div", { className: "meta" });
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("div", { className: "meta" }, str(c.title)) : "",
        h("strong", {}, str(c.question)),
        h(
          "div",
          { className: "ui-col" },
          ...options.map((opt, idx) =>
            h(
              "button",
              {
                type: "button",
                disabled: ctx.answered,
                onClick: () => {
                  if (correct !== null) {
                    feedback.textContent =
                      idx === correct
                        ? `✓ Correct! ${str(c.explanation)}`
                        : `✕ Answer: ${options[correct] ?? ""}. ${str(c.explanation)}`;
                  }
                  void ctx.fireAction(opt, "quiz.answer", { index: idx, option: opt }, c.id);
                },
              },
              opt,
            ),
          ),
        ),
        feedback,
      );
    }

    case "Status": {
      const state = str(c.state);
      const jobs = (c.jobs as Array<{ name: string; state: string; detail?: string }>) ?? [];
      const stats = (c.stats as Array<{ label: string; value: unknown }>) ?? [];
      const u = httpsUrl(c.url);
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          u
            ? h(
                "a",
                { href: u, target: "_blank", rel: "noopener" },
                `${str(c.title)} ${str(c.ref)}`.trim(),
              )
            : h("strong", {}, `${str(c.title)} ${str(c.ref)}`.trim()),
          h("span", { className: `rc-badge state-${state.toLowerCase()}` }, state),
        ),
        c.subtitle ? h("div", { className: "meta" }, str(c.subtitle)) : "",
        stats.length
          ? h(
              "div",
              { className: "meta" },
              stats.map((s) => `${s.label}: ${str(s.value)}`).join(" · "),
            )
          : "",
        jobs.length
          ? h(
              "div",
              { className: "rc-rows" },
              ...jobs
                .slice(0, 15)
                .map((j) =>
                  h(
                    "div",
                    { className: "rc-head" },
                    h("span", {}, j.name),
                    h("span", { className: "meta" }, j.state),
                  ),
                ),
            )
          : "",
      );
    }

    case "Checkout": {
      const lines = (c.lines as Array<{ title: string; qty?: number; amount: number }>) ?? [];
      const fees = (c.fees as Array<{ label: string; amount: number }>) ?? [];
      return h(
        "div",
        { className: "rc-body" },
        h("strong", {}, str(c.title || `Checkout · ${str(c.seller)}`)),
        h(
          "dl",
          { className: "rc-kv" },
          ...lines.flatMap((l) => [
            h("dt", {}, `${l.qty && l.qty > 1 ? `${l.qty}× ` : ""}${l.title}`),
            h("dd", {}, fmtMoney(l.amount, c.currency)),
          ]),
          ...fees.flatMap((f) => [
            h("dt", {}, f.label),
            h("dd", {}, fmtMoney(f.amount, c.currency)),
          ]),
          h("dt", {}, h("strong", {}, "Total")),
          h("dd", {}, h("strong", {}, fmtMoney(c.total, c.currency))),
        ),
        c.terms ? h("div", { className: "meta" }, str(c.terms)) : "",
        h(
          "div",
          { className: "row" },
          h(
            "button",
            {
              type: "button",
              className: "primary",
              disabled: ctx.answered,
              onClick: () =>
                void ctx.fireAction("Confirm", "checkout.confirm", { total: c.total }, c.id),
            },
            "Confirm",
          ),
          h(
            "button",
            {
              type: "button",
              disabled: ctx.answered,
              onClick: () => void ctx.fireAction("Change", "checkout.change", {}, c.id),
            },
            "Change",
          ),
          h(
            "button",
            {
              type: "button",
              className: "link",
              disabled: ctx.answered,
              onClick: () => void ctx.fireAction("Cancel", "checkout.cancel", {}, c.id),
            },
            "Cancel",
          ),
        ),
      );
    }

    case "Order": {
      const items = (c.items as Array<{ title: string; qty?: number; amount?: number }>) ?? [];
      const u = httpsUrl(c.url);
      return h(
        "div",
        { className: "rc-body" },
        h(
          "div",
          { className: "rc-head" },
          h("strong", {}, `${str(c.store)}${c.orderId ? ` #${str(c.orderId)}` : ""}`),
          c.status ? h("span", { className: "rc-badge" }, str(c.status)) : "",
        ),
        c.eta ? h("div", { className: "meta" }, `ETA: ${str(c.eta)}`) : "",
        h(
          "ul",
          { className: "rc-list" },
          ...items
            .slice(0, 10)
            .map((it) => h("li", {}, `${it.qty && it.qty > 1 ? `${it.qty}× ` : ""}${it.title}`)),
        ),
        h(
          "div",
          { className: "row" },
          c.trackingNumber
            ? h(
                "button",
                {
                  type: "button",
                  className: "primary",
                  disabled: ctx.answered,
                  onClick: () =>
                    void ctx.fireAction(
                      "Track package",
                      "order.track",
                      { number: c.trackingNumber, carrier: c.carrier },
                      c.id,
                    ),
                },
                "Track",
              )
            : "",
          u ? h("a", { href: u, target: "_blank", rel: "noopener" }, "View order ↗") : "",
        ),
      );
    }

    case "Dashboard": {
      const kids = ((c.children as string[]) ?? []).map((id) => ctx.drawChild(id, ctx.depth + 1));
      return h(
        "div",
        { className: "rc-body rc-dashboard" },
        c.title ? h("strong", {}, str(c.title)) : "",
        ...kids,
      );
    }

    case "Carousel": {
      const kids = ((c.children as string[]) ?? []).map((id) =>
        h("div", { className: "rc-carousel-item" }, ctx.drawChild(id, ctx.depth + 1)),
      );
      return h(
        "div",
        { className: "rc-body" },
        c.title ? h("strong", {}, str(c.title)) : "",
        h("div", { className: "rc-carousel" }, ...kids),
      );
    }

    default:
      return null;
  }
}

const SKIP_KEYS = new Set([
  "id",
  "component",
  "live",
  "source",
  "title",
  "name",
  "subtitle",
  "summary",
  "text",
  "url",
  "imageUrl",
  "logoUrl",
]);

/** Tier 2 Generic Structured Fallback: renders ANY other or future card cleanly from its JSON props. */
export function renderGenericCard(c: CardComp, ctx: RichCardContext): HTMLElement {
  const title = str(c.title || c.name || c.word || c.league || c.component);
  const subtitle = str(c.subtitle || c.phonetic || c.kind || "");
  const bodyText = str(c.text || c.summary || c.description || "");
  const u = httpsUrl(c.url);
  const img = httpsUrl(c.imageUrl ?? c.logoUrl);

  const scalars: Array<[string, string]> = [];
  const lists: Array<[string, unknown[]]> = [];

  for (const [k, v] of Object.entries(c)) {
    if (SKIP_KEYS.has(k) || v == null || v === "") continue;
    if (typeof v === "string" || typeof v === "number" || typeof v === "boolean") {
      scalars.push([k.replace(/([A-Z])/g, " $1").replace(/_/g, " "), String(v)]);
    } else if (Array.isArray(v) && v.length) {
      lists.push([k.replace(/([A-Z])/g, " $1").replace(/_/g, " "), v]);
    }
  }

  return h(
    "div",
    { className: "rc-body rc-generic", "data-testid": "card-generic" },
    img ? h("img", { src: img, alt: title, className: "rc-thumb", loading: "lazy" }) : "",
    h(
      "div",
      { className: "rc-head" },
      u ? h("a", { href: u, target: "_blank", rel: "noopener" }, title) : h("strong", {}, title),
      h("span", { className: "rc-badge" }, c.component),
    ),
    subtitle ? h("div", { className: "meta" }, subtitle) : "",
    bodyText ? h("p", { className: "rc-text" }, bodyText.slice(0, 420)) : "",
    scalars.length
      ? h(
          "dl",
          { className: "rc-kv" },
          ...scalars
            .slice(0, 10)
            .flatMap(([k, v]) => [h("dt", {}, k), h("dd", {}, v.slice(0, 120))]),
        )
      : "",
    ...lists.slice(0, 2).map(([label, arr]) =>
      h(
        "div",
        { className: "rc-generic-list" },
        h("div", { className: "meta" }, label),
        h(
          "ul",
          { className: "rc-list" },
          ...arr.slice(0, 6).map((item) => {
            if (typeof item === "string" || typeof item === "number")
              return h("li", {}, String(item));
            if (item && typeof item === "object") {
              const o = item as Record<string, unknown>;
              const line = [o.title, o.name, o.label, o.text, o.meaning, o.value, o.status]
                .filter((x) => x != null && String(x).trim())
                .slice(0, 3)
                .map(String)
                .join(" · ");
              if (line) return h("li", {}, line);
            }
            return h("li", {}, JSON.stringify(item).slice(0, 100));
          }),
        ),
      ),
    ),
    ctx.openUrl
      ? h(
          "div",
          { className: "row", style: "margin-top:6px" },
          h(
            "a",
            { href: ctx.openUrl, target: "_blank", rel: "noopener", className: "meta" },
            "Open in Casama ↗",
          ),
        )
      : "",
  );
}
