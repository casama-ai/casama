import { describe, expect, it } from "vitest";
import { assignableRoles, roleAtLeast } from "../src/roles.ts";

describe("roles", () => {
  it("orders owner > admin > member", () => {
    expect(roleAtLeast("owner", "admin")).toBe(true);
    expect(roleAtLeast("admin", "admin")).toBe(true);
    expect(roleAtLeast("member", "admin")).toBe(false);
  });
  it("only owners assign owner", () => {
    expect(assignableRoles("admin")).not.toContain("owner");
    expect(assignableRoles("member")).toEqual([]);
  });
});
