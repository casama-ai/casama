import { createRoute, z } from "@hono/zod-openapi";
import { jsonBody, jsonResponse, problemResponses, Uuid } from "../common.ts";
import {
  AdminPartner,
  AdminPartnerCode,
  AdminPartnerCommission,
  AdminPartnerSync,
  AdminPartners,
  ClaimPartnerRequest,
  CreateAdminPartnerCodeRequest,
  CreateAdminPartnerRequest,
  PartnerMe,
  PartnerPreview,
  UpdateAdminPartnerCodeRequest,
  UpdateAdminPartnerCommissionRequest,
  UpdateAdminPartnerRequest,
} from "../partners.ts";

/**
 * Casama Partners (D-543, docs/CREATOR-PROGRAM-PLAN.md): creators share a code or a link
 * (casama.ai/c/<code>). A new account enters it within a few days of signing up and before paying;
 * the creator earns a share of what that account pays for a year. The instance owner runs the
 * program from Admin → Partners; payouts run in the partner portal (Tolt).
 */
const security = [{ bearerAuth: [] }];
const tags = ["partners"];
const errors = problemResponses;

export const getPartnerMe = createRoute({
  operationId: "getPartnerMe",
  method: "get",
  path: "/v1/me/partner",
  tags,
  security,
  summary:
    "The creator who sent you, whether you can still enter a code, and your own partner code",
  responses: { ...errors, 200: jsonResponse("Partner", PartnerMe) },
});

export const claimPartner = createRoute({
  operationId: "claimPartner",
  method: "post",
  path: "/v1/me/partner/claim",
  tags,
  security,
  summary: "Enter a creator's code (new accounts, before the first payment)",
  description:
    "Errors: 404 partner_not_found, 400 partner_own_code, 400 partner_window_closed, 400 partner_already_paying, 409 partner_already, 409 partner_referred, 404 partners_off, 429 too_many_attempts.",
  request: { body: jsonBody(ClaimPartnerRequest) },
  responses: { ...errors, 200: jsonResponse("Partner", PartnerMe) },
});

export const previewPartner = createRoute({
  operationId: "previewPartner",
  method: "get",
  path: "/v1/partner/preview",
  tags,
  summary: "Who a creator code belongs to (no sign-in)",
  request: { query: z.object({ code: z.string().min(1).max(200) }) },
  responses: { ...errors, 200: jsonResponse("Creator", PartnerPreview) },
});

export const listAdminPartners = createRoute({
  operationId: "listAdminPartners",
  method: "get",
  path: "/v1/admin/partners",
  tags,
  security,
  summary: "Partners, their codes and earnings (instance owner)",
  responses: { ...errors, 200: jsonResponse("Partners", AdminPartners) },
});

export const createAdminPartner = createRoute({
  operationId: "createAdminPartner",
  method: "post",
  path: "/v1/admin/partners",
  tags,
  security,
  summary: "Add a partner by hand (instance owner)",
  request: { body: jsonBody(CreateAdminPartnerRequest) },
  responses: { ...errors, 200: jsonResponse("Partner", AdminPartner) },
});

export const updateAdminPartner = createRoute({
  operationId: "updateAdminPartner",
  method: "patch",
  path: "/v1/admin/partners/{id}",
  tags,
  security,
  summary: "Approve, pause, ban or change a partner (instance owner)",
  request: { params: z.object({ id: Uuid }), body: jsonBody(UpdateAdminPartnerRequest) },
  responses: { ...errors, 200: jsonResponse("Partner", AdminPartner) },
});

export const createAdminPartnerCode = createRoute({
  operationId: "createAdminPartnerCode",
  method: "post",
  path: "/v1/admin/partners/{id}/codes",
  tags,
  security,
  summary: "Give a partner a code (instance owner)",
  description: "Errors: 409 partner_code_taken.",
  request: { params: z.object({ id: Uuid }), body: jsonBody(CreateAdminPartnerCodeRequest) },
  responses: { ...errors, 200: jsonResponse("Code", AdminPartnerCode) },
});

export const updateAdminPartnerCode = createRoute({
  operationId: "updateAdminPartnerCode",
  method: "patch",
  path: "/v1/admin/partner-codes/{code}",
  tags,
  security,
  summary: "Pause, retire or change a partner code (instance owner)",
  request: {
    params: z.object({ code: z.string().min(3).max(20) }),
    body: jsonBody(UpdateAdminPartnerCodeRequest),
  },
  responses: { ...errors, 200: jsonResponse("Code", AdminPartnerCode) },
});

export const listAdminPartnerCommissions = createRoute({
  operationId: "listAdminPartnerCommissions",
  method: "get",
  path: "/v1/admin/partner-commissions",
  tags,
  security,
  summary: "Commissions, newest first (instance owner)",
  request: {
    query: z.object({
      partner_id: Uuid.optional(),
      status: z.enum(["pending", "payable", "paid", "held_for_review", "void"]).optional(),
      limit: z.coerce.number().int().min(1).max(500).optional(),
    }),
  },
  responses: { ...errors, 200: jsonResponse("Commissions", z.array(AdminPartnerCommission)) },
});

export const updateAdminPartnerCommission = createRoute({
  operationId: "updateAdminPartnerCommission",
  method: "patch",
  path: "/v1/admin/partner-commissions/{id}",
  tags,
  security,
  summary: "Hold, release or void a commission (instance owner)",
  request: { params: z.object({ id: Uuid }), body: jsonBody(UpdateAdminPartnerCommissionRequest) },
  responses: { ...errors, 200: jsonResponse("Commission", AdminPartnerCommission) },
});

export const syncAdminPartners = createRoute({
  operationId: "syncAdminPartners",
  method: "post",
  path: "/v1/admin/partners/sync",
  tags,
  security,
  summary: "Sync with the partner portal now (instance owner)",
  responses: { ...errors, 200: jsonResponse("Sync", AdminPartnerSync) },
});
