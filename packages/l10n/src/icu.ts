/**
 * A small ICU MessageFormat parser: enough to compare an English message with its translation
 * (arguments, plural and select branches) and to rewrite the literal text (pseudo-locale).
 *
 * Literal text keeps its raw spelling, so `stringifyIcu(parseIcu(s)) === s` for every message
 * that parses (apart from whitespace inside an argument's braces, which is normalised).
 */

export type IcuNode = string | IcuArg;

export interface IcuBranch {
  key: string;
  nodes: IcuNode[];
}

export interface IcuArg {
  name: string;
  /** null for a bare `{name}`; otherwise `plural`, `select`, `selectordinal`, `number`, … */
  type: string | null;
  /** The style of a `{n, number, …}` / `{d, date, …}` argument, as written. */
  style?: string;
  offset?: number;
  /** Only for plural, select and selectordinal. */
  branches?: IcuBranch[];
}

export interface IcuOptions {
  /**
   * ICU apostrophe quoting: `'{'` is a literal brace and `''` a literal apostrophe. Flutter's ARB
   * files have it off by default (`use-escaping: false`), where `'` is always a plain character.
   */
  apostrophes?: boolean;
}

export class IcuError extends Error {
  readonly position: number;
  constructor(message: string, position: number) {
    super(`${message} (at character ${position + 1})`);
    this.name = "IcuError";
    this.position = position;
  }
}

const BRANCHING = new Set(["plural", "select", "selectordinal"]);
const NAME = /[A-Za-z0-9_]/;

export function parseIcu(source: string, options: IcuOptions = {}): IcuNode[] {
  const apostrophes = options.apostrophes ?? false;
  let i = 0;

  const ws = () => {
    while (i < source.length && /\s/.test(source[i] as string)) i++;
  };
  const ident = (what: string): string => {
    const start = i;
    while (i < source.length && NAME.test(source[i] as string)) i++;
    if (i === start) throw new IcuError(`expected ${what}`, start);
    return source.slice(start, i);
  };

  const nodes = (depth: number): IcuNode[] => {
    const out: IcuNode[] = [];
    let text = "";
    const flush = () => {
      if (text) out.push(text);
      text = "";
    };
    while (i < source.length) {
      const c = source[i] as string;
      if (apostrophes && c === "'") {
        const next = source[i + 1];
        if (next === "'") {
          text += "''";
          i += 2;
          continue;
        }
        if (next === "{" || next === "}" || (depth > 0 && (next === "#" || next === "|"))) {
          // Quoted literal up to the next lone apostrophe.
          let j = i + 1;
          while (j < source.length) {
            if (source[j] === "'") {
              if (source[j + 1] === "'") {
                j += 2;
                continue;
              }
              break;
            }
            j++;
          }
          text += source.slice(i, Math.min(j + 1, source.length));
          i = j + 1;
          continue;
        }
        text += c;
        i++;
        continue;
      }
      if (c === "{") {
        flush();
        out.push(arg(depth));
        continue;
      }
      if (c === "}") {
        if (depth === 0) throw new IcuError("unmatched }", i);
        flush();
        return out;
      }
      text += c;
      i++;
    }
    if (depth > 0) throw new IcuError("missing }", source.length);
    flush();
    return out;
  };

  const arg = (depth: number): IcuArg => {
    const open = i;
    i++; // {
    ws();
    const name = ident("an argument name");
    ws();
    if (source[i] === "}") {
      i++;
      return { name, type: null };
    }
    if (source[i] !== ",") throw new IcuError(`unexpected character in {${name}…}`, i);
    i++;
    ws();
    const type = ident("an argument type");
    ws();
    if (source[i] === "}") {
      i++;
      return { name, type };
    }
    if (source[i] !== ",") throw new IcuError(`unexpected character in {${name}, ${type}…}`, i);
    i++;
    if (!BRANCHING.has(type)) {
      const end = source.indexOf("}", i);
      if (end === -1) throw new IcuError("missing }", open);
      const style = source.slice(i, end).trim();
      i = end + 1;
      return { name, type, style };
    }
    const result: IcuArg = { name, type, branches: [] };
    ws();
    const offset = /^offset:\s*(\d+)/.exec(source.slice(i));
    if (offset) {
      result.offset = Number(offset[1]);
      i += offset[0].length;
    }
    for (;;) {
      ws();
      if (i >= source.length) throw new IcuError(`missing } after {${name}, ${type}, …`, open);
      if (source[i] === "}") {
        i++;
        break;
      }
      let key: string;
      if (source[i] === "=") {
        const start = i;
        i++;
        while (i < source.length && /[0-9.]/.test(source[i] as string)) i++;
        if (i === start + 1) throw new IcuError("expected a number after =", start);
        key = source.slice(start, i);
      } else {
        key = ident(`a ${type} branch key`);
      }
      ws();
      if (source[i] !== "{") throw new IcuError(`expected { after branch ${key}`, i);
      i++;
      const body = nodes(depth + 1);
      i++; // the branch's }
      if (result.branches?.some((b) => b.key === key))
        throw new IcuError(`branch ${key} appears twice`, i);
      result.branches?.push({ key, nodes: body });
    }
    if (!result.branches?.length) throw new IcuError(`{${name}, ${type}} has no branches`, open);
    return result;
  };

  return nodes(0);
}

export function stringifyIcu(nodes: IcuNode[]): string {
  let out = "";
  for (const n of nodes) {
    if (typeof n === "string") {
      out += n;
      continue;
    }
    if (n.type === null) out += `{${n.name}}`;
    else if (!n.branches)
      out += n.style ? `{${n.name}, ${n.type}, ${n.style}}` : `{${n.name}, ${n.type}}`;
    else {
      const offset = n.offset !== undefined ? `offset:${n.offset} ` : "";
      const branches = n.branches.map((b) => `${b.key}{${stringifyIcu(b.nodes)}}`).join(" ");
      out += `{${n.name}, ${n.type}, ${offset}${branches}}`;
    }
  }
  return out;
}

/** True when the text uses any ICU syntax (a brace that parses as an argument). */
export function hasIcuSyntax(text: string): boolean {
  return /\{\s*[A-Za-z0-9_]+\s*[,}]/.test(text);
}

/** Every argument name with its type (null for a bare placeholder), at any depth. */
export function icuArguments(nodes: IcuNode[]): Map<string, string | null> {
  const out = new Map<string, string | null>();
  const walk = (list: IcuNode[]) => {
    for (const n of list) {
      if (typeof n === "string") continue;
      if (!out.has(n.name) || out.get(n.name) === null) out.set(n.name, n.type);
      for (const b of n.branches ?? []) walk(b.nodes);
    }
  };
  walk(nodes);
  return out;
}

/** Every plural, select and selectordinal argument, at any depth. */
export function icuBranchingArgs(nodes: IcuNode[]): IcuArg[] {
  const out: IcuArg[] = [];
  const walk = (list: IcuNode[]) => {
    for (const n of list) {
      if (typeof n === "string") continue;
      if (n.branches) {
        out.push(n);
        for (const b of n.branches) walk(b.nodes);
      }
    }
  };
  walk(nodes);
  return out;
}

/** One way through a message: the branch taken at each plural/select, and what that path shows. */
export interface IcuVariant {
  /** Argument name → branch key taken. */
  choices: Map<string, string>;
  /** Simple and formatted arguments shown on this path. */
  args: Set<string>;
  /** The literal text shown on this path, joined. */
  literal: string;
}

/** Every path through the message (capped; returns null when there are more than `limit`). */
export function icuVariants(nodes: IcuNode[], limit = 256): IcuVariant[] | null {
  let variants: IcuVariant[] = [{ choices: new Map(), args: new Set(), literal: "" }];
  const extend = (base: IcuVariant[], list: IcuNode[]): IcuVariant[] | null => {
    let cur = base;
    for (const n of list) {
      if (typeof n === "string") {
        for (const v of cur) v.literal += n;
        continue;
      }
      if (!n.branches) {
        for (const v of cur) v.args.add(n.name);
        continue;
      }
      // The plural's own argument counts as shown (it usually is, through # or {n}).
      const next: IcuVariant[] = [];
      for (const v of cur) {
        for (const b of n.branches) {
          const copy: IcuVariant = {
            choices: new Map(v.choices).set(n.name, b.key),
            args: new Set(v.args),
            literal: v.literal,
          };
          const sub = extend([copy], b.nodes);
          if (!sub) return null;
          next.push(...sub);
          if (next.length > limit) return null;
        }
      }
      cur = next;
    }
    return cur;
  };
  const result = extend(variants, nodes);
  if (!result) return null;
  variants = result;
  return variants;
}

/** Rewrites the literal text of a message, leaving its structure alone (for the pseudo-locale). */
export function mapIcuLiterals(nodes: IcuNode[], fn: (text: string) => string): IcuNode[] {
  return nodes.map((n) => {
    if (typeof n === "string") return fn(n);
    if (!n.branches) return n;
    return {
      ...n,
      branches: n.branches.map((b) => ({ key: b.key, nodes: mapIcuLiterals(b.nodes, fn) })),
    };
  });
}

/**
 * Builds a plural message from per-category texts, for formats that keep plurals outside ICU
 * (Android `<plurals>`, Apple string catalog variations). The texts are used as they are.
 */
export function pluralToIcu(arg: string, cases: Record<string, string>): string {
  const keys = Object.keys(cases);
  const branches = keys.map((k) => `${k}{${cases[k]}}`).join(" ");
  return `{${arg}, plural, ${branches}}`;
}

/**
 * The reverse of pluralToIcu: a message that is exactly one plural argument, as per-category
 * texts. Returns null when the message is anything else. Braces inside a branch must be ICU
 * arguments, so printf placeholders (`%d`) pass through as literal text.
 */
export function icuToPlural(
  message: string,
): { arg: string; cases: Record<string, string> } | null {
  let nodes: IcuNode[];
  try {
    nodes = parseIcu(message.trim());
  } catch {
    return null;
  }
  if (nodes.length !== 1) return null;
  const only = nodes[0];
  if (!only || typeof only === "string" || only.type !== "plural" || !only.branches) return null;
  const cases: Record<string, string> = {};
  for (const b of only.branches) cases[b.key] = stringifyIcu(b.nodes);
  return { arg: only.name, cases };
}
