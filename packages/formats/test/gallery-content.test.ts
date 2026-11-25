import { describe, expect, it } from "vitest";
import {
  botTemplateFromGallery,
  checkBotDocument,
  checkPluginDocument,
  checkRoutineDocument,
} from "../src/gallery-content.ts";

const bot = {
  description: "Helps with homework.",
  category: "life",
  icon: "graduation-cap",
  mascot: "thinker",
  persona: "You are a patient study partner who asks one question at a time.",
  starters: ["Quiz me"],
  autonomy: "ask_always",
};

describe("gallery bots", () => {
  it("accepts a starter bot and makes a template", () => {
    expect(checkBotDocument(bot).errors).toEqual([]);
    expect(botTemplateFromGallery("study-buddy", "Study buddy", bot)).toMatchObject({
      id: "study-buddy",
      skills: [],
    });
  });

  it("never starts autonomous and only uses shipped mascots", () => {
    expect(checkBotDocument({ ...bot, autonomy: "autonomous" }).errors.length).toBe(1);
    expect(checkBotDocument({ ...bot, mascot: "dragon" }).errors.length).toBe(1);
    expect(checkBotDocument({ ...bot, model: "x" }).errors.length).toBe(1);
  });

  it("checks its routines' schedules", () => {
    const routine = { name: "Daily", instructions_md: "Do it.", schedule_cron: "0 9 * * *" };
    expect(checkBotDocument({ ...bot, routines: [routine] }).errors).toEqual([]);
    expect(
      checkBotDocument({ ...bot, routines: [{ ...routine, schedule_cron: "every day" }] }).errors,
    ).toHaveLength(1);
  });
});

describe("routine ideas and plugins", () => {
  it("checks a routine idea", () => {
    const idea = {
      description: "Weekly review.",
      category: "work",
      icon: "calendar-check",
      instructions_md: "Write my weekly review.",
      schedule_cron: "0 16 * * 5",
    };
    expect(checkRoutineDocument(idea).errors).toEqual([]);
    expect(checkRoutineDocument({ ...idea, category: "games" }).errors).toHaveLength(1);
  });

  it("pins a plugin to a full commit on GitHub", () => {
    const p = {
      description: "Example.",
      url: "https://github.com/casama-ai/casama/tree/main/examples/hello-plugin",
      commit: "9ae3da77b6fd95fff461cf7c7b48c0289096eed6",
      adds: ["A skill"],
    };
    expect(checkPluginDocument(p).errors).toEqual([]);
    expect(checkPluginDocument({ ...p, commit: "main" }).errors).toHaveLength(1);
    expect(checkPluginDocument({ ...p, url: "https://gitlab.com/a/b" }).errors).toHaveLength(1);
  });
});
