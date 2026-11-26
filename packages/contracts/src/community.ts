import { z } from "@hono/zod-openapi";

/**
 * GitHub stars from real users (D-577, docs/GITHUB-STARS-PLAN.md §5.3). The app asks once, on
 * Casama Cloud, at a good moment; this says whether it may and whether the person looks like a
 * developer (who qualify sooner). Asking is only ever a link to the repo: nothing stars for anyone
 * and nothing is given for a star.
 */
export const StarAsk = z
  .object({
    /** The server allows the ask: it's Casama Cloud and the flag `github_star_ask` isn't off. */
    ask: z.boolean(),
    /**
     * The person or one of their workspaces has a developer signal: GitHub connected as an app, a
     * personal API key, an MCP connection, or a sign-in from the `casama` CLI.
     */
    developer: z.boolean(),
  })
  .openapi("StarAsk");
