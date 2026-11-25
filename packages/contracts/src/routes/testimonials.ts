import { createRoute, z } from "@hono/zod-openapi";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";
import {
  AdminTestimonial,
  AdminTestimonials,
  CreateAdminTestimonialRequest,
  PublicTestimonials,
  ReorderAdminTestimonialsRequest,
  SubmitTestimonialRequest,
  SubmittedTestimonial,
  TestimonialAsk,
  TestimonialPlace,
  UpdateAdminTestimonialRequest,
} from "../testimonials.ts";

/**
 * Testimonials (D-545, docs/TESTIMONIALS-PLAN.md). The server keeps the list; casama.ai is built
 * from the public read, and the app shows it on the paywall and the sign-in screen. The instance
 * owner adds and chooses quotes in Admin → Testimonials; the app's sheet only sends drafts.
 */
const security = [{ bearerAuth: [] }];
const tags = ["testimonials"];
const errors = problemResponses;

export const listTestimonials = createRoute({
  operationId: "listTestimonials",
  method: "get",
  path: "/v1/testimonials",
  tags,
  summary: "Live quotes about Casama (no sign-in; cached for an hour)",
  request: { query: z.object({ place: TestimonialPlace.optional() }) },
  responses: { ...errors, 200: jsonResponse("Testimonials", PublicTestimonials) },
});

export const getTestimonialAsk = createRoute({
  operationId: "getTestimonialAsk",
  method: "get",
  path: "/v1/me/testimonial",
  tags,
  security,
  summary: "Whether you can send a quote now, and the name it would show",
  responses: { ...errors, 200: jsonResponse("Ask", TestimonialAsk) },
});

export const submitTestimonial = createRoute({
  operationId: "submitTestimonial",
  method: "post",
  path: "/v1/me/testimonial",
  tags,
  security,
  summary: "Send a sentence about Casama (kept as a draft for the owner; one per 90 days)",
  description: "Errors: 400 testimonial_empty, 429 testimonial_limit.",
  request: { body: jsonBody(SubmitTestimonialRequest) },
  responses: { ...errors, 200: jsonResponse("Sent", SubmittedTestimonial) },
});

export const listAdminTestimonials = createRoute({
  operationId: "listAdminTestimonials",
  method: "get",
  path: "/v1/admin/testimonials",
  tags,
  security,
  summary: "Every testimonial with its consent record (instance owner)",
  responses: { ...errors, 200: jsonResponse("Testimonials", AdminTestimonials) },
});

export const createAdminTestimonial = createRoute({
  operationId: "createAdminTestimonial",
  method: "post",
  path: "/v1/admin/testimonials",
  tags,
  security,
  summary: "Add a testimonial (instance owner)",
  description: "Errors: 400 testimonial_needs_consent, 404 not_found (no account with that email).",
  request: { body: jsonBody(CreateAdminTestimonialRequest) },
  responses: { ...errors, 200: jsonResponse("Testimonial", AdminTestimonial) },
});

export const updateAdminTestimonial = createRoute({
  operationId: "updateAdminTestimonial",
  method: "patch",
  path: "/v1/admin/testimonials/{id}",
  tags,
  security,
  summary: "Edit, show, hide or withdraw a testimonial (instance owner)",
  description:
    "Errors: 400 testimonial_needs_consent, 400 testimonial_placeholder, 409 testimonial_withdrawn (withdrawn comes back only with new consent, never while the account is being deleted), 404 not_found.",
  request: { params: z.object({ id: Uuid }), body: jsonBody(UpdateAdminTestimonialRequest) },
  responses: { ...errors, 200: jsonResponse("Testimonial", AdminTestimonial) },
});

export const reorderAdminTestimonials = createRoute({
  operationId: "reorderAdminTestimonials",
  method: "post",
  path: "/v1/admin/testimonials/order",
  tags,
  security,
  summary: "Put testimonials in a new order (instance owner)",
  request: { body: jsonBody(ReorderAdminTestimonialsRequest) },
  responses: { ...errors, 200: jsonResponse("Testimonials", AdminTestimonials) },
});

export const deleteAdminTestimonial = createRoute({
  operationId: "deleteAdminTestimonial",
  method: "delete",
  path: "/v1/admin/testimonials/{id}",
  tags,
  security,
  summary: "Delete a testimonial for good (instance owner)",
  request: { params: z.object({ id: Uuid }) },
  responses: { ...errors, 204: { description: "Deleted" } },
});
