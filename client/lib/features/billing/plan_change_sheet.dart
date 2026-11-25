import 'dart:math' as math;

import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/backend.dart';
import '../../core/billing.dart';
import '../../core/date_format.dart';
import '../../core/number_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import '../app_lock/confirm_identity.dart';
import 'billing_screen.dart' show openUrlProvider, platformProvider;

/// Decimal places in a currency's minor unit, as Dodo counts amounts (ISO 4217): most have two,
/// a few have none or three.
@visibleForTesting
int currencyMinorDigits(String currency) => switch (currency.toUpperCase()) {
  'BIF' || 'CLP' || 'DJF' || 'GNF' || 'ISK' || 'JPY' || 'KMF' || 'KRW' || 'PYG' || 'RWF' ||
  'UGX' || 'VND' || 'VUV' || 'XAF' || 'XOF' || 'XPF' => 0,
  'BHD' || 'IQD' || 'JOD' || 'KWD' || 'LYD' || 'OMR' || 'TND' => 3,
  _ => 2,
};

/// Outcome of [showPlanChangeSheet].
enum PlanChangeOutcome {
  /// The subscription was changed in place.
  changed,

  /// The server opened a hosted checkout URL instead (e.g. subscription lapsed before confirm).
  redirected,

  /// The user closed the sheet without confirming.
  cancelled,
}

/// Shows the confirmation sheet for a web plan purchase of [planCode]
/// (docs/DISCOUNT-CODES-PLAN.md). For someone who already pays it previews the change; nothing is
/// charged until the person confirms (and passes the app lock when one is set). A new subscriber
/// is sent on to Dodo's checkout page, which shows the price and takes codes itself.
Future<PlanChangeOutcome> showPlanChangeSheet(
  BuildContext context,
  WidgetRef ref, {
  required String orgId,
  required String planCode,
  String? planName,
}) async {
  final result = await showAdaptiveSheet<PlanChangeOutcome>(
    context: context,
    builder: (_) =>
        _PlanChangeSheet(orgId: orgId, planCode: planCode, planName: planName),
  );
  return result ?? PlanChangeOutcome.cancelled;
}

class _PlanChangeSheet extends ConsumerStatefulWidget {
  const _PlanChangeSheet({
    required this.orgId,
    required this.planCode,
    this.planName,
  });

  final String orgId;
  final String planCode;
  final String? planName;

  @override
  ConsumerState<_PlanChangeSheet> createState() => _PlanChangeSheetState();
}

class _PlanChangeSheetState extends ConsumerState<_PlanChangeSheet> {
  final _codeController = TextEditingController();
  PlanChangePreview? _preview;
  String? _loadError;
  var _loading = true;
  var _showCodeField = false;
  var _applyingCode = false;
  String? _appliedCode;
  String? _codeError;
  var _priceMoved = false;
  var _confirming = false;
  var _retriedAfterRace = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadInitial);
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _loadInitial() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final p = await ref
          .read(backendProvider)
          .previewPlanChange(widget.orgId, planCode: widget.planCode);
      if (!mounted) return;
      setState(() {
        _preview = p;
        _loading = false;
      });
    } on DioException catch (e) {
      if (!mounted) return;
      final data = e.response?.data;
      if (e.response?.statusCode == 409 &&
          data is Map &&
          data['code'] == 'use_checkout') {
        // No subscription to change: a new one starts on Dodo's checkout page. The server refuses
        // (409 subscription_exists) if one became active meanwhile, and the sheet previews again
        // instead of changing it unseen.
        final String? url;
        try {
          url = await ref
              .read(backendProvider)
              .checkoutUrl(
                widget.orgId,
                planCode: widget.planCode,
                newSubscriptionOnly: true,
              );
        } on DioException catch (e) {
          if (!mounted) return;
          final d = e.response?.data;
          if (e.response?.statusCode == 409 &&
              d is Map &&
              d['code'] == 'subscription_exists' &&
              !_retriedAfterRace) {
            _retriedAfterRace = true;
            return _loadInitial();
          }
          setState(() {
            _loading = false;
            _loadError = errorText(context, e);
          });
          return;
        } catch (e) {
          if (!mounted) return;
          setState(() {
            _loading = false;
            _loadError = errorText(context, e);
          });
          return;
        }
        if (!mounted) return;
        if (url != null) {
          await ref.read(openUrlProvider)(url);
          if (mounted) Navigator.of(context).pop(PlanChangeOutcome.redirected);
          return;
        }
        Navigator.of(context).pop(PlanChangeOutcome.cancelled);
        return;
      }
      setState(() {
        _loading = false;
        _loadError = errorText(context, e);
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _loadError = errorText(context, e);
      });
    }
  }

  Future<void> _applyCode() async {
    final raw = _codeController.text.trim();
    if (raw.isEmpty || _applyingCode) return;
    setState(() {
      _applyingCode = true;
      _codeError = null;
      _priceMoved = false;
    });
    try {
      final p = await ref
          .read(backendProvider)
          .previewPlanChange(
            widget.orgId,
            planCode: widget.planCode,
            discountCode: raw,
          );
      if (!mounted) return;
      setState(() {
        _preview = p;
        _appliedCode = p.discountCode ?? raw.toUpperCase();
        _codeController.text = _appliedCode!;
        _applyingCode = false;
        _codeError = null;
      });
    } on DioException catch (e) {
      if (!mounted) return;
      final status = e.response?.statusCode;
      final data = e.response?.data;
      final refusal = status == 400 && data is Map
          ? _codeRefusal(context.l10n, data['code'])
          : null;
      setState(() {
        _applyingCode = false;
        _codeError = refusal ?? errorText(context, e);
        // A refused code leaves the field, so Confirm goes on without it instead of trying
        // the same code again; the error stays until the person types.
        if (refusal != null) _codeController.clear();
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _applyingCode = false;
        _codeError = errorText(context, e);
      });
    }
  }

  Future<void> _removeCode() async {
    if (_applyingCode) return;
    setState(() {
      _applyingCode = true;
      _codeError = null;
      _priceMoved = false;
    });
    try {
      final p = await ref
          .read(backendProvider)
          .previewPlanChange(widget.orgId, planCode: widget.planCode);
      if (!mounted) return;
      setState(() {
        _preview = p;
        _appliedCode = null;
        _codeController.clear();
        _applyingCode = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _applyingCode = false;
        _codeError = errorText(context, e);
      });
    }
  }

  /// The message under the code field for a code the server refused, or null for other errors.
  String? _codeRefusal(AppLocalizations l10n, Object? code) => switch (code) {
    'invalid_discount_code' || 'validation_failed' => l10n.planChangeInvalidCode,
    'discount_costs_more' => l10n.planChangeCodeCostsMore,
    'discount_ends_lasting' => l10n.planChangeCodeEndsLasting,
    'discount_not_better' => l10n.planChangeCodeNotBetter,
    _ => null,
  };

  /// Previews again without a code, keeping any error shown under the code field.
  Future<void> _reloadWithoutCode() async {
    try {
      final p = await ref
          .read(backendProvider)
          .previewPlanChange(widget.orgId, planCode: widget.planCode);
      if (mounted) setState(() => _preview = p);
    } catch (e) {
      if (mounted) setState(() => _loadError = errorText(context, e));
    }
  }

  Future<void> _confirm() async {
    final preview = _preview;
    if (preview == null || _confirming) return;
    // A code typed but not applied yet: apply it first so the person sees the price it gives
    // before anything is charged, then they confirm again.
    if (_appliedCode == null && _codeController.text.trim().isNotEmpty) {
      await _applyCode();
      return;
    }
    setState(() {
      _confirming = true;
      _priceMoved = false;
    });
    try {
      // Ask for the app lock first when one is set (D-375), the same as Manage subscription.
      if (!await confirmIdentity(context, ref) || !mounted) {
        if (mounted) setState(() => _confirming = false);
        return;
      }
      final url = await ref
          .read(backendProvider)
          .checkoutUrl(
            widget.orgId,
            planCode: widget.planCode,
            discountCode: _appliedCode,
            expectedTotal: preview.immediateTotal,
            expectedCurrency: preview.currency,
          );
      if (!mounted) return;
      if (url != null) {
        await ref.read(openUrlProvider)(url);
        if (mounted) Navigator.of(context).pop(PlanChangeOutcome.redirected);
        return;
      }
      Navigator.of(context).pop(PlanChangeOutcome.changed);
    } on PlanChangePriceChangedException catch (e) {
      if (!mounted) return;
      setState(() {
        _preview = e.preview;
        _priceMoved = true;
        _confirming = false;
      });
    } on DioException catch (e, st) {
      if (!mounted) return;
      final status = e.response?.statusCode;
      final data = e.response?.data;
      final refusal = status == 400 && data is Map
          ? _codeRefusal(context.l10n, data['code'])
          : null;
      if (refusal != null) {
        // The code stopped working since it was applied: show the field again with the error,
        // and the price without the code, so nothing on screen promises the discount. The field
        // is left empty, so the next Confirm goes on without the code.
        setState(() {
          _confirming = false;
          _appliedCode = null;
          _showCodeField = true;
          _codeController.clear();
          _codeError = refusal;
        });
        await _reloadWithoutCode();
        return;
      }
      setState(() => _confirming = false);
      showError(context, e, st);
    } catch (e, st) {
      if (!mounted) return;
      setState(() => _confirming = false);
      showError(context, e, st);
    }
  }

  String _formatMinor(int minor, String currency, String locale) {
    final digits = currencyMinorDigits(currency);
    final amount = minor / math.pow(10, digits);
    return amount.humanizedCurrency(locale, currency, decimalDigits: digits);
  }

  String _periodLabel(AppLocalizations l10n, PlanChangePreviewIntervalEnum i) =>
      switch (i) {
        PlanChangePreviewIntervalEnum.week => l10n.planChangePeriodWeek,
        PlanChangePreviewIntervalEnum.month => l10n.planChangePeriodMonth,
        PlanChangePreviewIntervalEnum.year => l10n.planChangePeriodYear,
      };

  String _discountSummary(
    AppLocalizations l10n,
    PlanChangePreview preview,
    String locale,
  ) {
    final cycles = preview.discountCycles;
    // "Every renewal" only when the discount also stays on later plan changes; otherwise it ends
    // if the plan changes again, and the sheet says so.
    final kept = preview.discountPreserved == true;
    if (preview.discountPercent case final pct?) {
      final pctText = pct == pct.roundToDouble()
          ? pct.round().toString()
          : pct.toString();
      return cycles != null
          ? l10n.planChangePercentForRenewals(pctText, cycles)
          : kept
          ? l10n.planChangePercentEveryRenewal(pctText)
          : l10n.planChangePercentUntilPlanChange(pctText);
    }
    if (preview.discountAmount case final flat?) {
      final amtText = _formatMinor(flat, preview.currency, locale);
      return cycles != null
          ? l10n.planChangeAmountForRenewals(amtText, cycles)
          : kept
          ? l10n.planChangeAmountEveryRenewal(amtText)
          : l10n.planChangeAmountUntilPlanChange(amtText);
    }
    return l10n.planChangeDiscountApplied;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final locale = l10n.localeName;
    final preview = _preview;
    final codesAllowed = giftCodesAllowed(
      platform: ref.watch(platformProvider),
      isWeb: kIsWeb,
    );
    final title = preview != null
        ? l10n.planChangeSwitchTo(preview.planName)
        : widget.planName != null
        ? l10n.planChangeSwitchTo(widget.planName!)
        : l10n.planChangeTitle;

    return FormSheet(
      key: const Key('planChangeSheet'),
      title: title,
      icon: LucideIcons.gem,
      submitLabel: l10n.planChangeConfirmAndPay,
      submitKey: const Key('planChangeConfirm'),
      busy: _confirming,
      onSubmit: _loading || _applyingCode || preview == null ? null : _confirm,
      children: [
        if (_loading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpace.xl),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (_loadError case final err?) ...[
          AppCard(
            padding: const EdgeInsets.all(AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  err,
                  key: const Key('planChangeLoadError'),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: scheme.error,
                  ),
                ),
                const SizedBox(height: AppSpace.sm),
                TextButton(
                  key: const Key('planChangeRetry'),
                  onPressed: _loadInitial,
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ] else if (preview != null) ...[
          if (_priceMoved) ...[
            Container(
              key: const Key('planChangePriceChanged'),
              padding: const EdgeInsets.all(AppSpace.sm),
              decoration: BoxDecoration(
                color: scheme.errorContainer.withValues(alpha: 0.45),
                borderRadius: AppRadius.cardAll,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(LucideIcons.circleAlert, size: 18, color: scheme.error),
                  const SizedBox(width: AppSpace.xs),
                  Expanded(
                    child: Text(
                      l10n.planChangePriceMoved,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurface,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpace.md),
          ],
          AppCard(
            key: const Key('planChangeBreakdown'),
            padding: const EdgeInsets.all(AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (preview.credit > 0) ...[
                  _AmountRow(
                    key: const Key('planChangeCreditRow'),
                    label: l10n.planChangeCredit,
                    value:
                        '−${_formatMinor(preview.credit, preview.currency, locale)}',
                    valueColor: context.appColors.positive,
                  ),
                  const SizedBox(height: AppSpace.xs),
                ],
                _AmountRow(
                  key: const Key('planChangeTotalRow'),
                  label: l10n.planChangeChargedNow,
                  value: _formatMinor(
                    preview.immediateTotal,
                    preview.currency,
                    locale,
                  ),
                  emphasized: true,
                ),
                if (preview.immediateTax > 0) ...[
                  const SizedBox(height: 2),
                  Text(
                    l10n.planChangeTaxIncluded(
                      _formatMinor(
                        preview.immediateTax,
                        preview.currency,
                        locale,
                      ),
                    ),
                    key: const Key('planChangeTaxLine'),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const Divider(height: AppSpace.lg),
                Text(
                  l10n.planChangeThen(
                    _formatMinor(
                      preview.recurringPreTax,
                      preview.currency,
                      locale,
                    ),
                    _periodLabel(l10n, preview.interval),
                  ),
                  key: const Key('planChangeRenewalLine'),
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (preview.nextBillingDate case final next?) ...[
                  const SizedBox(height: 2),
                  Text(
                    l10n.planChangeNextBilling(
                      next.toLocal().formattedWeekdayDate(context),
                    ),
                    key: const Key('planChangeNextBillingLine'),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
                if (preview.discountApplied) ...[
                  const SizedBox(height: AppSpace.sm),
                  Row(
                    key: const Key('planChangeDiscountApplied'),
                    children: [
                      Icon(
                        LucideIcons.tag,
                        size: 16,
                        color: context.appColors.positive,
                      ),
                      const SizedBox(width: AppSpace.xs),
                      Expanded(
                        child: Text(
                          _discountSummary(l10n, preview, locale),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.appColors.positive,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (_appliedCode != null)
                        TextButton(
                          key: const Key('planChangeRemoveCode'),
                          onPressed: _applyingCode || _confirming
                              ? null
                              : _removeCode,
                          child: Text(l10n.planChangeRemove),
                        ),
                    ],
                  ),
                  // A code replaces the discount the subscription keeps today: say so.
                  if (preview.replacesDiscount == true) ...[
                    const SizedBox(height: 2),
                    Text(
                      switch (preview.replacedDiscountPercent) {
                        final num p => l10n.planChangeReplacesPercent(
                          p == p.roundToDouble() ? p.round().toString() : p.toString(),
                        ),
                        _ => l10n.planChangeReplacesDiscount,
                      },
                      key: const Key('planChangeReplacesLine'),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ),
          if (codesAllowed) ...[
            const SizedBox(height: AppSpace.sm),
            if (!_showCodeField && _appliedCode == null)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  key: const Key('planChangeHaveCode'),
                  onPressed: _confirming
                      ? null
                      : () => setState(() => _showCodeField = true),
                  icon: const Icon(LucideIcons.tag, size: 16),
                  label: Text(l10n.planChangeHaveCode),
                ),
              )
            else if (_appliedCode == null) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      key: const Key('planChangeCodeField'),
                      controller: _codeController,
                      enabled: !_applyingCode && !_confirming,
                      textCapitalization: TextCapitalization.characters,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        labelText: l10n.planChangeCodeLabel,
                        hintText: l10n.planChangeCodeHint,
                        errorText: _codeError,
                      ),
                      onChanged: (_) {
                        if (_codeError != null) {
                          setState(() => _codeError = null);
                        }
                      },
                      onSubmitted: (_) => _applyCode(),
                    ),
                  ),
                  const SizedBox(width: AppSpace.xs),
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpace.xs),
                    child: FilledButton.tonal(
                      key: const Key('planChangeApplyCode'),
                      onPressed: _applyingCode || _confirming
                          ? null
                          : _applyCode,
                      child: _applyingCode
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(l10n.planChangeApply),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ],
      ],
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({
    super.key,
    required this.label,
    required this.value,
    this.emphasized = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool emphasized;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final style = emphasized
        ? context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)
        : context.textTheme.bodyMedium;
    return Row(
      children: [
        Expanded(child: Text(label, style: style)),
        Text(value, style: style?.copyWith(color: valueColor)),
      ],
    );
  }
}
