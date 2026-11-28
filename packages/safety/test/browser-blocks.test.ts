import { describe, expect, it } from "vitest";
import { detectBrowserBlock } from "../src/browser-blocks.ts";

describe("pages that keep a bot's computer out", () => {
  it("sees challenges and refusals", () => {
    expect(detectBrowserBlock("Just a moment...\nVerify you are human")?.kind).toBe("challenge");
    expect(detectBrowserBlock("Press & Hold to confirm you are a human")?.kind).toBe("challenge");
    expect(
      detectBrowserBlock(
        "Our systems have detected unusual traffic from your computer network. This page checks to see if it's really you.",
      )?.kind,
    ).toBe("challenge");
    expect(detectBrowserBlock("Access Denied\nYou don't have permission")?.kind).toBe("denied");
    expect(detectBrowserBlock("Sorry, you have been blocked")?.kind).toBe("denied");
    expect(detectBrowserBlock("403 Forbidden")?.kind).toBe("denied");
    // Slider puzzles and named anti-bot guards (D-520).
    expect(detectBrowserBlock("Slide to complete the puzzle")?.kind).toBe("challenge");
    expect(detectBrowserBlock('- text "Drag the slider to fit the piece"')?.kind).toBe("challenge");
    expect(detectBrowserBlock("Please verify you are not a robot")?.kind).toBe("challenge");
    expect(detectBrowserBlock("Unusual activity detected. Please try again later.")?.kind).toBe(
      "challenge",
    );
    expect(detectBrowserBlock("WhaleGuard: request intercepted")?.kind).toBe("denied");
    // Cloudflare's newer check page, which a shop showed the computer for ever (customer build 117).
    expect(
      detectBrowserBlock(
        "www.ao.com Performing security verification This website uses a security service to protect against malicious bots. This page is displayed while the website verifies you are not a bot.",
      )?.kind,
    ).toBe("challenge");
    expect(
      detectBrowserBlock(
        "Verify you are human by completing the action below. www.example.co.uk needs to review the security of your connection before proceeding.",
      )?.kind,
    ).toBe("challenge");
  });

  it("leaves ordinary pages alone, even ones that mention a CAPTCHA", () => {
    expect(detectBrowserBlock("")).toBeNull();
    expect(detectBrowserBlock('- button "Add to basket" [ref=e1]')).toBeNull();
    const article = `How CAPTCHAs work. ${"Sites sometimes ask visitors to complete the captcha before they continue, and a page may say access denied when a rule matches. ".repeat(20)}`;
    expect(article.length).toBeGreaterThan(1200);
    expect(detectBrowserBlock(article)).toBeNull();
    // A long page still counts when it carries a phrase only a block page has.
    expect(detectBrowserBlock(`${article} Sorry, you have been blocked.`)?.kind).toBe("denied");
    expect(detectBrowserBlock(`${article} whaleguard`)?.kind).toBe("denied");
  });
});
