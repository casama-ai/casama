import { describe, expect, it } from "vitest";
import { needsApproval, subagentBudget } from "../src/approvals.ts";

const base = {
  autonomy: "ask_risky" as const,
  risk: "low" as const,
  readOnly: false,
  untrustedSinceApproval: false,
  granted: false,
};

describe("needsApproval", () => {
  it("a routine set up after reading untrusted content asks first, unless the bot is autonomous (D-269)", () => {
    const routine = { ...base, selfOnly: true, schedulesWork: true };
    expect(needsApproval(routine)).toBe(false);
    expect(needsApproval({ ...routine, untrustedSinceApproval: true })).toBe(true);
    expect(needsApproval({ ...routine, untrustedSinceApproval: true, granted: true })).toBe(false);
    expect(
      needsApproval({ ...routine, untrustedSinceApproval: true, autonomy: "autonomous" }),
    ).toBe(false);
    // Other self-only tools still never ask.
    expect(needsApproval({ ...base, selfOnly: true, untrustedSinceApproval: true })).toBe(false);
  });

  it("ask_risky: high risk always, medium only when it sends data out after untrusted input (D-213)", () => {
    expect(needsApproval({ ...base, risk: "high" })).toBe(true);
    expect(needsApproval({ ...base, risk: "medium" })).toBe(false);
    expect(needsApproval({ ...base, risk: "medium", untrustedSinceApproval: true })).toBe(false);
    expect(needsApproval({ ...base, risk: "medium", sendsOut: true })).toBe(false);
    expect(
      needsApproval({ ...base, risk: "medium", untrustedSinceApproval: true, sendsOut: true }),
    ).toBe(true);
    expect(
      needsApproval({ ...base, risk: "low", untrustedSinceApproval: true, sendsOut: true }),
    ).toBe(false);
    expect(needsApproval({ ...base, risk: "medium", confirmUnderDefault: true })).toBe(true);
  });
  it("self-only tools (the bot's own notes, schedule, tasks, messages to the person) never ask (D-155)", () => {
    for (const autonomy of ["ask_always", "ask_risky", "autonomous"] as const)
      expect(
        needsApproval({
          ...base,
          autonomy,
          risk: "medium",
          selfOnly: true,
          untrustedSinceApproval: true,
        }),
      ).toBe(false);
  });
  it("ask_always asks for anything with side effects; read-only never asks", () => {
    expect(needsApproval({ ...base, autonomy: "ask_always" })).toBe(true);
    expect(needsApproval({ ...base, autonomy: "ask_always", readOnly: true })).toBe(false);
  });
  it("autonomous never asks, on the person's own Mac too; grants skip asking (D-394)", () => {
    expect(needsApproval({ ...base, autonomy: "autonomous", risk: "high" })).toBe(false);
    expect(
      needsApproval({ ...base, autonomy: "autonomous", risk: "high", forceHighRisk: true }),
    ).toBe(false);
    expect(needsApproval({ ...base, risk: "high", granted: true })).toBe(false);
    expect(needsApproval({ ...base, risk: "high", granted: true, forceHighRisk: true })).toBe(
      false,
    );
    // Without a grant, high risk on the Mac still asks under the default and ask_always.
    expect(needsApproval({ ...base, risk: "high", forceHighRisk: true })).toBe(true);
    expect(
      needsApproval({ ...base, autonomy: "ask_always", risk: "high", forceHighRisk: true }),
    ).toBe(true);
  });
  it("full access never asks, whatever the autonomy (D-394)", () => {
    for (const autonomy of ["ask_always", "ask_risky", "autonomous"] as const)
      expect(
        needsApproval({
          ...base,
          autonomy,
          risk: "high",
          forceHighRisk: true,
          confirmUnderDefault: true,
          schedulesWork: true,
          untrustedSinceApproval: true,
          sendsOut: true,
          fullAccess: true,
        }),
      ).toBe(false);
  });
});

describe("delegation", () => {
  it("gives subagents 20% of the parent's remaining budget", () => {
    expect(subagentBudget(1, 0.5)).toBe(0.1);
    expect(subagentBudget(1, 1)).toBe(0.01);
    expect(subagentBudget(null, 0)).toBe(0.5);
  });
});
