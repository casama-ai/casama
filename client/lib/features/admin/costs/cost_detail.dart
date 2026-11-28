import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/backend.dart' show CostQuery;
import '../../../core/display_text.dart';
import '../../../core/number_format.dart';
import '../../../core/widgets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../../ui/app_card.dart';
import '../../../ui/form_sheet.dart';
import '../../../ui/page.dart';
import '../../../ui/segmented.dart';
import 'cost_chart.dart';
import 'cost_colors.dart';
import 'cost_format.dart';
import 'cost_parts.dart';
import 'cost_table.dart';
import 'cost_view.dart';

/// One row, opened: its totals, the vendor's own figure against the server's, its days, and the
/// same spend cut another way ("Split by"). A key adds where it lives and its cap; an app adds
/// calls, failures and its estimated token cost. Beside the table on a wide window
/// ([onClose] set), a page of its own on a phone.
class CostDetail extends ConsumerStatefulWidget {
  const CostDetail({
    super.key,
    required this.row,
    required this.group,
    required this.base,
    required this.onDrill,
    this.onClose,
  });
  final AdminCostRow row;
  final CostGroup group;

  /// The view the row was opened from: its period, filters and fixed-bills switch carry over.
  final CostQuery base;

  /// Carries the row into the table as a filter, regrouped by the chosen split.
  final ValueChanged<CostGroup> onDrill;

  /// Closes the side panel; null on a page, where the back arrow does it.
  final VoidCallback? onClose;

  @override
  ConsumerState<CostDetail> createState() => _CostDetailState();
}

class _CostDetailState extends ConsumerState<CostDetail> {
  late CostGroup _split = costSplits(widget.group).first;
  AdminCosts? _last;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final text = context.textTheme;
    final scheme = context.colorScheme;
    final muted = scheme.onSurfaceVariant;
    final row = widget.row;
    final group = widget.group;
    final book = ref.watch(costColorBookProvider);
    final color = costColor(context, book, group, row.id);
    final name = costRowLabel(l10n, row.id, row.label);
    final labelled = row.id.isNotEmpty;

    final keys = group == CostGroup.key || group == CostGroup.service
        ? ref.watch(
            adminCostKeysProvider(
              CostQuery(
                days: widget.base.days,
                from: widget.base.from,
                to: widget.base.to,
              ),
            ),
          )
        : null;
    final key = group == CostGroup.key
        ? keys?.value?.where((k) => k.keyRef == row.id).firstOrNull
        : null;
    final billing = group == CostGroup.key
        ? key?.billingUrl
        : group == CostGroup.service
        ? keys?.value
              ?.where((k) => k.vendor == row.id && k.billingUrl.isUsable)
              .firstOrNull
              ?.billingUrl
        : null;
    final reported = row.reportedUsd ?? key?.reportedUsd;
    final spent = row.spentUsd;
    final basis = costBasisOf(context);
    // The margin is always at list prices, so a free plan never shows as a 100% margin.
    final listSpent = listRowSpentUsd(row);
    final margin = marginShare(row.chargedTrackedUsd, listSpent);
    final rate = costFailureRate(row);

    final query = costFiltered(widget.base, group, row.id, _split);
    final async = labelled ? ref.watch(adminCostsProvider(query)) : null;
    if (async?.value != null) _last = async!.value;
    final split = async?.value ?? _last;
    if (split != null) {
      book.register(split.group, split.series.map((s) => s.id));
    }
    Color splitColor(String id) =>
        costColor(context, book, split?.group ?? _split, id);

    final facts = group == CostGroup.app
        ? [
            CostFact(
              label: l10n.costColCalls,
              value: row.calls.humanizedCount(locale),
              valueKey: const Key('costDetail-calls'),
            ),
            CostFact(
              label: l10n.costFailureRate,
              value: costPercent(rate),
              valueKey: const Key('costDetail-failed'),
            ),
            CostFact(
              label: l10n.costColFees,
              value: costUsd(spent, locale),
              valueKey: const Key('costDetail-spent'),
            ),
            CostFact(
              label: l10n.costTokenCost,
              value: costUsd(row.tokenUsdEst, locale),
              note: row.tokenUsdEst == null ? null : l10n.costEstimated,
              valueKey: const Key('costDetail-tokens'),
            ),
          ]
        : [
            CostFact(
              label: costSpendLabel(l10n, basis),
              value: costUsd(spent, locale),
              note: basis == CostBasis.paid && (listSpent - spent).abs() > 0.000001
                  ? l10n.costAtListPrices(costUsd(listSpent, locale))
                  : null,
              valueKey: const Key('costDetail-spent'),
            ),
            CostFact(
              label: l10n.costCharged,
              value: costUsdOrDash(row.chargedUsd, locale),
              valueKey: const Key('costDetail-charged'),
            ),
            CostFact(
              label: l10n.costMarginListPrices,
              value: costPercent(margin),
              valueKey: const Key('costDetail-margin'),
            ),
            CostFact(
              label: l10n.costColCalls,
              value: row.calls.humanizedCount(locale),
              note: costPlanNote(l10n, row),
              valueKey: const Key('costDetail-calls'),
            ),
            if (row.capLimit != null && row.capLimit! > 0)
              CostFact(
                label: l10n.costFreePlan,
                value: l10n.costCapUsage(
                  row.capUsed == null
                      ? kMissingValue
                      : row.capUsed!.humanizedCount(locale),
                  row.capLimit!.humanizedCount(locale),
                  row.capUnit ?? '',
                ),
                valueKey: const Key('costDetail-cap'),
              ),
          ];

    return ListView(
      key: const Key('costDetail'),
      padding: EdgeInsets.fromLTRB(
        AppSpace.md,
        widget.onClose == null ? AppSpace.xs : AppSpace.md,
        AppSpace.md,
        AppSpace.xxl + MediaQuery.paddingOf(context).bottom,
      ),
      children: [
        // On a page the header already carries the name.
        if (widget.onClose != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: CostDot(color, size: 12),
              ),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: Semantics(
                  header: true,
                  child: Text(
                    name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: text.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ),
              IconButton(
                key: const Key('costDetailClose'),
                tooltip: l10n.close,
                onPressed: widget.onClose,
                icon: const Icon(LucideIcons.x, size: 20),
              ),
            ],
          ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: widget.onClose != null ? 20 : 0,
            top: 2,
            bottom: AppSpace.sm,
          ),
          child: Wrap(
            spacing: AppSpace.xs,
            runSpacing: AppSpace.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (widget.onClose == null) CostDot(color, size: 12),
              Text(
                [costGroupLabel(l10n, group), ?costRowTags(l10n, row)].join(' · '),
                style: text.bodySmall?.copyWith(color: muted),
              ),
              CostSourceBadge(row.source_),
              if (billing.isUsable)
                TextButton.icon(
                  key: const Key('costOpenBilling'),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.xs,
                    ),
                  ),
                  onPressed: () async {
                    final uri = Uri.tryParse(billing!);
                    if (uri != null && uri.scheme == 'https') {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  icon: const Icon(LucideIcons.externalLink, size: 15),
                  label: Text(l10n.costOpenBilling),
                ),
            ],
          ),
        ),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpace.sm,
            children: [
              for (var i = 0; i < facts.length; i += 2)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpace.sm,
                  children: [
                    Expanded(child: facts[i]),
                    Expanded(child: facts[i + 1]),
                  ],
                ),
              if (group == CostGroup.service || group == CostGroup.key) ...[
                Divider(height: 1, color: context.appColors.hairline),
                _Reported(
                  reported: reported,
                  recorded: spent,
                  updatedAt: split?.updatedAt,
                  metered: row.source_ == CostSource.metered && labelled,
                ),
              ],
            ],
          ),
        ),
        if (group == CostGroup.key && labelled) ...[
          const SizedBox(height: AppSpace.md),
          _KeyFacts(row: row, keys: keys!, found: key),
        ],
        if (!labelled) ...[
          const SizedBox(height: AppSpace.md),
          FormNote(l10n.costNotLabelledHelp),
        ] else ...[
          if (group == CostGroup.app && row.id != 'custom')
            _AppTools(base: widget.base, appId: row.id),
          SectionHeader(title: l10n.costByDay),
          AppCard(
            child: split == null
                ? (async!.hasError && !async.isLoading
                      ? InlineError(
                          error: async.error!,
                          onRetry: () =>
                              refreshCosts(ref, query),
                        )
                      : const SkeletonScope(
                          child: SkeletonBone(
                            height: 150,
                            radius: AppRadius.row,
                          ),
                        ))
                : split.byDay.isEmpty ||
                      split.totals.spentUsd <= 0 &&
                          split.byDay.every(
                            (d) => d.values.every((v) => v <= 0),
                          )
                ? Text(
                    l10n.costNothingRecorded,
                    style: text.bodySmall?.copyWith(color: muted),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CostChart(
                        costs: split,
                        series: costSeries(context, split, splitColor),
                        height: 150,
                      ),
                      const SizedBox(height: AppSpace.xs),
                      Text(
                        l10n.costDaysUtc,
                        style: text.labelSmall?.copyWith(color: muted),
                      ),
                    ],
                  ),
          ),
          // One way to split (an app, by workspace) needs a title, not a choice.
          if (costSplits(group).length < 2)
            SectionHeader(title: l10n.costByWorkspace)
          else ...[
            SectionHeader(title: l10n.costSplitBy),
            AppSegmentedControl<CostGroup>(
              key: const Key('costSplit'),
              values: costSplits(group),
              labels: {
                for (final g in costSplits(group)) g: costGroupLabel(l10n, g),
              },
              groupValue: _split,
              onValueChanged: (g) => setState(() => _split = g),
            ),
            const SizedBox(height: AppSpace.sm),
          ],
          if (async!.hasError && !async.isLoading)
            InlineError(
              error: async.error!,
              onRetry: () => refreshCosts(ref, query),
            )
          else if (split != null)
            // The last split stays, dimmed, while the next one loads.
            AnimatedOpacity(
              duration: AppMotion.of(context, AppMotion.fast),
              opacity: async.isLoading ? 0.5 : 1,
              child: _SplitRows(costs: split, colorOf: splitColor),
            )
          else
            const SkeletonScope(child: SkeletonCard(height: 132)),
          const SizedBox(height: AppSpace.sm),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: FilledButton.tonalIcon(
              key: const Key('costShowInTable'),
              onPressed: () => widget.onDrill(_split),
              icon: const Icon(LucideIcons.cornerDownRight, size: 18),
              label: Text(l10n.costShowInTable),
            ),
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            l10n.costShowInTableHelp(name, costGroupLabel(l10n, _split)),
            style: text.bodySmall?.copyWith(color: muted),
          ),
        ],
      ],
    );
  }
}

/// "They say $4.61 · we recorded $4.44 · $0.17 not recorded". When the vendor gave no figure the
/// line greys out and says so, with when the numbers were last put together.
class _Reported extends StatelessWidget {
  const _Reported({
    required this.reported,
    required this.recorded,
    required this.updatedAt,
    required this.metered,
  });
  final num? reported;
  final num recorded;
  final String? updatedAt;
  final bool metered;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final muted = context.colorScheme.onSurfaceVariant;
    final r = reported;
    if (r == null) {
      final ago = costAgo(context, updatedAt);
      return Opacity(
        key: const Key('costReportedMissing'),
        opacity: 0.75,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Icon(LucideIcons.circleDashed, size: 15, color: muted),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                [
                  metered
                      ? l10n.costNoVendorFigure
                      : l10n.costNoVendorFigureKind,
                  if (ago != null) l10n.costUpdated(ago),
                ].join(' '),
                style: context.textTheme.bodySmall?.copyWith(
                  color: muted,
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      );
    }
    final gap = r - recorded;
    return Text(
      gap > 0.00005
          ? l10n.costReported(
              costUsd(r, locale),
              costUsd(recorded, locale),
              costUsd(gap, locale),
            )
          : l10n.costReportedMatch(
              costUsd(r, locale),
              costUsd(recorded, locale),
            ),
      key: const Key('costReported'),
      style: context.textTheme.bodySmall?.copyWith(
        height: 1.35,
        fontFeatures: AppText.tabular,
        fontWeight: gap > 0.00005 ? FontWeight.w600 : null,
      ),
    );
  }
}

/// A key's own facts: what it is for, where its value lives, whether it is set, when it last
/// worked and how much of its cap is left. Names only; the value never reaches the app.
class _KeyFacts extends StatelessWidget {
  const _KeyFacts({required this.row, required this.keys, required this.found});
  final AdminCostRow row;
  final AsyncValue<List<AdminCostKey>> keys;
  final AdminCostKey? found;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final k = found;
    if (k == null) {
      if (keys.isLoading) {
        return const SkeletonScope(child: SkeletonCard(height: 180));
      }
      // A key the catalog doesn't know (or an older server): the row's own facts are all there is.
      final used = costAgo(context, row.lastUsedAt);
      return used == null
          ? const SizedBox.shrink()
          : AppCard(child: _Prop(l10n.costKeyLastUsed, used));
    }
    final used = costAgo(context, k.lastUsedAt ?? row.lastUsedAt);
    final cap = k.limitUsd;
    final left = k.limitRemainingUsd;
    return AppCard(
      key: const Key('costKeyFacts'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpace.sm,
        children: [
          if (k.purpose.isUsable) _Prop(l10n.costKeyPurpose, k.purpose),
          _Prop(l10n.costKeyService, k.vendorLabel.orPlaceholder(k.vendor)),
          _Prop(l10n.costKeySetting, k.keyRef, mono: true),
          _Prop(l10n.costKeySetIn, k.setIn.orPlaceholder()),
          _Prop(l10n.costKeyVault, k.vaultItem.orPlaceholder()),
          _Prop(
            l10n.costKeyStatus,
            k.configured ? l10n.costKeyConfigured : l10n.costKeyNotConfigured,
            icon: k.configured
                ? LucideIcons.circleCheck
                : LucideIcons.circleAlert,
            color: k.configured
                ? context.appColors.positive
                : context.appColors.warning,
          ),
          _Prop(l10n.costKeyLastUsed, used ?? l10n.costKeyNotUsed),
          if (cap != null) ...[
            _Prop(
              l10n.costKeyCap,
              left == null
                  ? costUsd(cap, locale)
                  : l10n.costKeyCapLeft(
                      costUsd(left, locale),
                      costUsd(cap, locale),
                    ),
            ),
            if (left != null && cap > 0)
              Semantics(
                label: l10n.costKeyCapUsed(
                  costPercent(((cap - left) / cap).clamp(0, 1).toDouble()),
                ),
                child: CostBar(
                  fraction: ((cap - left) / cap).toDouble(),
                  color: left / cap < 0.15
                      ? context.appColors.warning
                      : context.colorScheme.primary,
                  height: 6,
                ),
              ),
          ] else
            _Prop(l10n.costKeyCap, l10n.costKeyNoCap),
        ],
      ),
    );
  }
}

class _Prop extends StatelessWidget {
  const _Prop(
    this.label,
    this.value, {
    this.mono = false,
    this.icon,
    this.color,
  });
  final String label;
  final String value;
  final bool mono;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final text = context.textTheme;
    final style = mono
        ? AppText.mono.copyWith(
            color: context.colorScheme.onSurface,
            fontSize: 12.5,
          )
        : text.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: color);
    return Semantics(
      label: '$label: $value',
      excludeSemantics: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: text.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (icon != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(icon, size: 15, color: color),
                  ),
                  const SizedBox(width: 4),
                ],
                Flexible(
                  child: Text(value, textAlign: TextAlign.end, style: style),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// An app's tools, busiest first: calls, how often they failed and what their results cost in
/// model tokens (an estimate). The tool list itself, sent to the model with every request, is a
/// row of its own at the end. Nothing for custom servers, whose tools the server doesn't name.
class _AppTools extends ConsumerWidget {
  const _AppTools({required this.base, required this.appId});
  final CostQuery base;
  final String appId;

  static const _shown = 8;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final text = context.textTheme;
    final muted = context.colorScheme.onSurfaceVariant;
    final query = base.copyWith(
      group: CostGroup.app,
      filters: {...base.filters, CostGroup.app: appId},
    );
    final async = ref.watch(adminCostsProvider(query));
    final Widget body;
    if (async.hasError && !async.isLoading) {
      body = AppCard(
        child: InlineError(
          error: async.error!,
          onRetry: () => refreshCosts(ref, query),
        ),
      );
    } else if (async.value == null) {
      body = const SkeletonScope(child: SkeletonCard(height: 132));
    } else {
      final rows = async.value!.rows;
      final tools = rows.where((r) => r.id.isNotEmpty).toList()
        ..sort((a, b) => b.calls.compareTo(a.calls));
      final list = rows.where((r) => r.id.isEmpty).firstOrNull;
      final shown = [...tools.take(_shown), ?list];
      if (shown.isEmpty) return const SizedBox.shrink();
      body = AppCard(
        key: const Key('costTools'),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.md,
          vertical: AppSpace.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final r in shown)
              Builder(
                builder: (context) {
                  final name = r.id.isEmpty ? l10n.costToolList : r.id;
                  final rate = costFailureRate(r);
                  final meta = [
                    if (r.id.isNotEmpty)
                      l10n.costCallsCount(r.calls.humanizedCount(locale)),
                    if (r.id.isNotEmpty && rate != null)
                      l10n.costFailedShare(costPercent(rate)),
                    if (r.tokenUsdEst != null)
                      l10n.costTokensEstimated(costUsd(r.tokenUsdEst, locale)),
                  ].join(' \u00B7 ');
                  return Semantics(
                    container: true,
                    label: '$name, $meta',
                    excludeSemantics: true,
                    child: Padding(
                      key: Key('costTool-${r.id}'),
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: r.id.isEmpty
                                ? text.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  )
                                : AppText.mono.copyWith(
                                    color: context.colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            meta,
                            style: text.bodySmall?.copyWith(
                              color: rate != null && rate >= 0.1
                                  ? context.appColors.negative
                                  : muted,
                              fontFeatures: AppText.tabular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            if (tools.length > _shown)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  l10n.costMoreTools(tools.length - _shown),
                  style: text.bodySmall?.copyWith(color: muted),
                ),
              ),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.costTopTools),
        body,
      ],
    );
  }
}

/// The row's spend cut by the chosen split: colour, name and amount, biggest first.
class _SplitRows extends StatelessWidget {
  const _SplitRows({required this.costs, required this.colorOf});
  final AdminCosts costs;
  final Color Function(String id) colorOf;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final text = context.textTheme;
    final muted = context.colorScheme.onSurfaceVariant;
    final rows = [...costs.rows]
      ..sort((a, b) => b.spentUsd.compareTo(a.spentUsd));
    if (rows.isEmpty) {
      return AppCard(
        child: Text(
          l10n.costNothingRecorded,
          style: text.bodySmall?.copyWith(color: muted),
        ),
      );
    }
    final biggest = rows.first.spentUsd;
    const shown = 12;
    return AppCard(
      key: const Key('costSplitRows'),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.md,
        vertical: AppSpace.xs,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final r in rows.take(shown))
            Semantics(
              label: [
                costRowLabel(l10n, r.id, r.label),
                costUsd(r.spentUsd, locale),
                if (costAgo(context, r.lastUsedAt) case final ago?)
                  l10n.costLastUsed(ago),
              ].join(', '),
              excludeSemantics: true,
              child: Padding(
                key: Key('costSplitRow-${r.id}'),
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CostDot(colorOf(r.id), size: 9),
                        const SizedBox(width: AppSpace.xs),
                        Expanded(
                          child: Text(
                            costRowLabel(l10n, r.id, r.label),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: text.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontStyle: r.id.isEmpty ? FontStyle.italic : null,
                            ),
                          ),
                        ),
                        if (costAgo(context, r.lastUsedAt) case final ago?) ...[
                          const SizedBox(width: AppSpace.xs),
                          Flexible(
                            child: Text(
                              l10n.costLastUsed(ago),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: text.bodySmall?.copyWith(color: muted),
                            ),
                          ),
                        ],
                        const SizedBox(width: AppSpace.sm),
                        Text(
                          costUsd(r.spentUsd, locale),
                          maxLines: 1,
                          style: text.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontFeatures: AppText.tabular,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 17),
                      child: CostBar(
                        fraction: biggest <= 0 ? 0 : r.spentUsd / biggest,
                        color: colorOf(r.id),
                        height: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (rows.length > shown)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Text(
                l10n.costMoreRows(rows.length - shown),
                style: text.bodySmall?.copyWith(color: muted),
              ),
            ),
        ],
      ),
    );
  }
}

/// The detail as a page of its own (phones and narrow windows).
class CostDetailPage extends StatelessWidget {
  const CostDetailPage({
    super.key,
    required this.row,
    required this.group,
    required this.base,
    required this.onDrill,
  });
  final AdminCostRow row;
  final CostGroup group;
  final CostQuery base;
  final ValueChanged<CostGroup> onDrill;

  @override
  Widget build(BuildContext context) => SubPage(
    title: costRowLabel(context.l10n, row.id, row.label),
    body: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kPageMaxWidth),
        child: CostDetail(
          row: row,
          group: group,
          base: base,
          onDrill: (split) {
            Navigator.of(context).pop();
            onDrill(split);
          },
        ),
      ),
    ),
  );
}
