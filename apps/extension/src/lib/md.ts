/**
 * Markdown as safe HTML, for replies in the panel and saved PDFs. Everything is escaped first and
 * only a fixed set of tags comes back; links must be http(s). Pictures are never loaded on their
 * own: a reply could otherwise send data out in a picture's address just by being shown (a page
 * can ask a bot to do that), so they become links that open in a new tab when clicked.
 */
const esc = (s: string) =>
  s.replace(
    /[&<>"']/g,
    (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]!,
  );

const safeUrl = (u: string) => (/^https?:\/\/[^\s"<>]+$/i.test(u) ? u : null);
const link = (url: string, label: string) =>
  `<a href="${esc(url)}" target="_blank" rel="noopener noreferrer">${label}</a>`;

/** Matches `[label](url)` or `![alt](url)` where url may contain balanced single-level parentheses (B18). */
const MD_URL = "((?:[^()\\s]|\\([^()\\s]*\\))+)";
const IMG_RE = new RegExp(`!\\[([^\\]]*)\\]\\(${MD_URL}\\)`, "g");
const LINK_RE = new RegExp(`\\[([^\\]]+)\\]\\(${MD_URL}\\)`, "g");

function trimBareUrl(raw: string): { url: string; tail: string } {
  let url = raw;
  let tail = "";
  while (url.length) {
    const last = url.at(-1)!;
    if (/[.,;:!?]/.test(last)) {
      tail = last + tail;
      url = url.slice(0, -1);
    } else if (last === ")") {
      const opens = (url.match(/\(/g) ?? []).length;
      const closes = (url.match(/\)/g) ?? []).length;
      if (closes > opens) {
        tail = last + tail;
        url = url.slice(0, -1);
      } else {
        break;
      }
    } else {
      break;
    }
  }
  return { url, tail };
}

function inline(s: string): string {
  // Code spans, links and pictures are set aside first (as NUL-marked slots), so the escaping and
  // the emphasis rules below never touch the HTML made for them, and none can nest in another.
  const slots: string[] = [];
  const slot = (html: string) => `\u0000${slots.push(html) - 1}\u0000`;
  let t = s.replace(/`([^`\n]+)`/g, (_, c: string) => slot(`<code>${esc(c)}</code>`));
  t = t.replace(IMG_RE, (_, alt: string, url: string) => {
    const u = safeUrl(url);
    const label = esc(alt.trim() || "Picture");
    return slot(u ? link(u, `Picture: ${label}`) : label);
  });
  t = t.replace(LINK_RE, (_, text: string, url: string) => {
    const u = safeUrl(url);
    return slot(u ? link(u, esc(text)) : esc(text));
  });
  t = t.replace(
    // biome-ignore lint/suspicious/noControlCharactersInRegex: an address stops at a slot's NUL.
    /(^|[\s(])(https?:\/\/[^\s<\u0000]+)/g,
    (_, pre: string, raw: string) => {
      const { url, tail } = trimBareUrl(raw);
      const u = safeUrl(url);
      return `${pre}${u ? slot(link(u, esc(url))) : url}${tail}`;
    },
  );
  t = esc(t)
    .replace(/\*\*(.+?)\*\*/g, "<strong>$1</strong>")
    .replace(/__(.+?)__/g, "<strong>$1</strong>")
    .replace(/(^|[^*\w])\*(?!\s)(.+?)(?<!\s)\*(?!\w)/g, "$1<em>$2</em>")
    .replace(/~~(.+?)~~/g, "<del>$1</del>");
  // biome-ignore lint/suspicious/noControlCharactersInRegex: NUL marks the slots set aside above.
  return t.replace(/\u0000(\d+)\u0000/g, (_, i: string) => slots[Number(i)] ?? "");
}

const LIST_ITEM_RE = /^(\s*)([-*+]|\d+[.)])\s+(.*)$/;

function renderList(
  lines: string[],
  start: number,
  baseIndent: number,
  ordered: boolean,
): { html: string; next: number } {
  const tag = ordered ? "ol" : "ul";
  const parts: string[] = [];
  let i = start;
  while (i < lines.length) {
    const m = LIST_ITEM_RE.exec(lines[i]!);
    if (!m) break;
    const indent = m[1]!.replace(/\t/g, "  ").length;
    const itemOrdered = /^\d/.test(m[2]!);
    if (indent < baseIndent) break;
    if (indent === baseIndent && itemOrdered !== ordered) break;
    if (indent > baseIndent) {
      // Nested list under the previous item (if any)
      const nested = renderList(lines, i, indent, itemOrdered);
      if (parts.length) {
        parts[parts.length - 1] = `${parts.at(-1)!.slice(0, -5)}${nested.html}</li>`;
      } else {
        parts.push(`<li>${nested.html}</li>`);
      }
      i = nested.next;
      continue;
    }
    parts.push(`<li>${inline(m[3]!)}</li>`);
    i++;
  }
  return { html: `<${tag}>${parts.join("")}</${tag}>`, next: i };
}

export function markdownToHtml(md: string): string {
  const lines = md.replace(/\r\n?/g, "\n").split("\n");
  const out: string[] = [];
  let i = 0;
  while (i < lines.length) {
    const line = lines[i]!;
    const fence = /^```([\w+-]*)\s*$/.exec(line);
    if (fence) {
      const lang = fence[1] ?? "";
      const body: string[] = [];
      i++;
      while (i < lines.length && !/^```\s*$/.test(lines[i]!)) body.push(lines[i++]!);
      i++;
      const attr = lang ? ` data-lang="${esc(lang)}"` : "";
      out.push(`<pre${attr}><code>${esc(body.join("\n"))}</code></pre>`);
      continue;
    }
    const heading = /^(#{1,6})\s+(.*)$/.exec(line);
    if (heading) {
      const n = Math.min(6, heading[1]!.length + 2);
      out.push(`<h${n}>${inline(heading[2]!)}</h${n}>`);
      i++;
      continue;
    }
    if (/^\s*(-{3,}|\*{3,}|_{3,})\s*$/.test(line)) {
      out.push("<hr>");
      i++;
      continue;
    }
    if (/^>\s?/.test(line)) {
      const body: string[] = [];
      while (i < lines.length && /^>\s?/.test(lines[i]!))
        body.push(lines[i++]!.replace(/^>\s?/, ""));
      out.push(`<blockquote>${markdownToHtml(body.join("\n"))}</blockquote>`);
      continue;
    }
    const listMatch = LIST_ITEM_RE.exec(line);
    if (listMatch) {
      const indent = listMatch[1]!.replace(/\t/g, "  ").length;
      const ordered = /^\d/.test(listMatch[2]!);
      const rendered = renderList(lines, i, indent, ordered);
      out.push(rendered.html);
      i = rendered.next;
      continue;
    }
    if (
      /^\|.*\|\s*$/.test(line) &&
      i + 1 < lines.length &&
      /^\|[\s:|-]+\|\s*$/.test(lines[i + 1]!)
    ) {
      const cells = (l: string) =>
        l
          .trim()
          .replace(/^\||\|$/g, "")
          .split("|")
          .map((c) => c.trim());
      const head = cells(line);
      i += 2;
      const rows: string[][] = [];
      while (i < lines.length && /^\|.*\|\s*$/.test(lines[i]!)) rows.push(cells(lines[i++]!));
      out.push(
        `<table><thead><tr>${head.map((c) => `<th>${inline(c)}</th>`).join("")}</tr></thead><tbody>${rows
          .map((r) => `<tr>${r.map((c) => `<td>${inline(c)}</td>`).join("")}</tr>`)
          .join("")}</tbody></table>`,
      );
      continue;
    }
    if (!line.trim()) {
      i++;
      continue;
    }
    const para: string[] = [];
    while (
      i < lines.length &&
      lines[i]!.trim() &&
      !/^(#{1,6}\s|```|>|\s*([-*+]|\d+[.)])\s)/.test(lines[i]!)
    )
      para.push(lines[i++]!);
    out.push(`<p>${para.map(inline).join("<br>")}</p>`);
  }
  return out.join("");
}

/** Markdown as nodes to append, enhancing code fences with language label and Copy button (B18). */
export function markdownNodes(md: string): DocumentFragment {
  const t = document.createElement("template");
  t.innerHTML = markdownToHtml(md);
  for (const pre of [...t.content.querySelectorAll("pre")]) {
    const code = pre.querySelector("code");
    const lang = pre.getAttribute("data-lang") ?? "";
    const wrap = document.createElement("div");
    wrap.className = "code-block";
    const head = document.createElement("div");
    head.className = "code-head";
    const label = document.createElement("span");
    label.className = "code-lang";
    label.textContent = lang || "code";
    const copy = document.createElement("button");
    copy.type = "button";
    copy.className = "link code-copy";
    copy.textContent = "Copy";
    copy.addEventListener("click", () => {
      const text = code?.textContent ?? "";
      void navigator.clipboard?.writeText(text).then(() => {
        copy.textContent = "Copied";
        setTimeout(() => {
          copy.textContent = "Copy";
        }, 1500);
      });
    });
    head.append(label, copy);
    pre.replaceWith(wrap);
    wrap.append(head, pre);
  }
  return t.content;
}
