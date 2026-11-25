import { describe, expect, it } from "vitest";
import { Redactor } from "../src/redact.ts";

describe("Redactor", () => {
  it("replaces known values with a labelled placeholder, every time they appear", () => {
    const r = new Redactor().add("hunter2-very-long", "ACME_PASSWORD");
    expect(r.text("pw=hunter2-very-long and again hunter2-very-long")).toBe(
      "pw=[secret:ACME_PASSWORD] and again [secret:ACME_PASSWORD]",
    );
  });

  it("ignores values shorter than 6 characters and empty ones", () => {
    const r = new Redactor()
      .add("abc", "SHORT")
      .add(undefined, "NONE")
      .add(null, "NULL")
      .add("", "E");
    expect(r.text("abc stays")).toBe("abc stays");
  });

  it("redacts strings deep inside objects and lists, leaving other values alone", () => {
    const r = new Redactor().add("sk-live-123456", "KEY");
    expect(
      r.value({ a: "token sk-live-123456", b: ["x", "sk-live-123456"], n: 3, ok: true, z: null }),
    ).toEqual({ a: "token [secret:KEY]", b: ["x", "[secret:KEY]"], n: 3, ok: true, z: null });
  });

  it("keeps what another redactor knew when merged", () => {
    const first = new Redactor().add("first-secret", "ONE");
    const second = new Redactor().add("second-secret", "TWO").merge(first).merge(undefined);
    expect(second.text("first-secret second-secret")).toBe("[secret:ONE] [secret:TWO]");
  });
});
