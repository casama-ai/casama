import { createRoute, z } from "@hono/zod-openapi";
import {
  AdminDiscount,
  AdminDiscountsResponse,
  CreateAdminDiscountRequest,
  UpdateAdminDiscountRequest,
} from "../admin-discounts.ts";
import { jsonBody, jsonResponse, problemResponses } from "../common.ts";

/**
 * Dodo discount codes managed from Admin → Discount Codes (docs/DISCOUNT-ADMIN-PLAN.md).
 * Instance owners list, create, update, turn off/on, and delete unused codes.
 */
const security = [{ bearerAuth: [] }];
const tags = ["admin-discounts"];
const errors = problemResponses;
const id = z.object({ id: z.string().trim().min(1).max(120) });

export const listAdminDiscounts = createRoute({
  operationId: "listAdminDiscounts",
  method: "get",
  path: "/v1/admin/discounts",
  tags,
  security,
  summary: "Every Dodo discount code and the active plans (instance owner)",
  responses: { ...errors, 200: jsonResponse("Discount codes and plans", AdminDiscountsResponse) },
});

export const createAdminDiscount = createRoute({
  operationId: "createAdminDiscount",
  method: "post",
  path: "/v1/admin/discounts",
  tags,
  security,
  summary: "Make a Dodo discount code (instance owner)",
  description:
    "Errors: 404 not_found (billing off), 400 invalid_plan, 400 invalid_dates, 400 discount_forever_free, 409 discount_exists, 409 discount_large.",
  request: { body: jsonBody(CreateAdminDiscountRequest) },
  responses: { ...errors, 200: jsonResponse("Discount code", AdminDiscount) },
});

export const updateAdminDiscount = createRoute({
  operationId: "updateAdminDiscount",
  method: "patch",
  path: "/v1/admin/discounts/{id}",
  tags,
  security,
  summary: "Edit a Dodo discount code or turn it off/on (instance owner)",
  description: "Errors: 404 not_found, 400 invalid_plan, 400 invalid_dates, 409 discount_large.",
  request: { params: id, body: jsonBody(UpdateAdminDiscountRequest) },
  responses: { ...errors, 200: jsonResponse("Discount code", AdminDiscount) },
});

export const deleteAdminDiscount = createRoute({
  operationId: "deleteAdminDiscount",
  method: "delete",
  path: "/v1/admin/discounts/{id}",
  tags,
  security,
  summary: "Delete an unused Dodo discount code (instance owner)",
  description: "Errors: 404 not_found, 409 discount_used.",
  request: { params: id },
  responses: { ...errors, 204: { description: "Deleted" } },
});
