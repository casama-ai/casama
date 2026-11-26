import { createRoute } from "@hono/zod-openapi";
import { jsonResponse, problemResponses } from "../common.ts";
import { StarAsk } from "../community.ts";

/** The open-source project's community links in the app (D-577). */
const security = [{ bearerAuth: [] }];
const tags = ["community"];

export const getStarAsk = createRoute({
  operationId: "getStarAsk",
  method: "get",
  path: "/v1/me/star-ask",
  tags,
  security,
  summary:
    "Whether the app may ask you once to star Casama on GitHub, and whether you're a developer",
  description:
    "Casama Cloud only, and off when the remote flag github_star_ask is false. It only ever leads to a link: nothing stars for you and nothing is given for a star.",
  responses: { ...problemResponses, 200: jsonResponse("Star ask", StarAsk) },
});
