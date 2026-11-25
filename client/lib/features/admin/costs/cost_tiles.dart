import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/display_text.dart';
import '../../../core/widgets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../../ui/adaptive_modal.dart';
import '../../../ui/app_card.dart';
import '../../../ui/form_sheet.dart';
import 'cost_format.dart';
import 'cost_parts.dart';

/// The four numbers above everything else: spent (the headline), charged, margin, and what the
/// vendors report above what the server recorded. Four across on a wide window, two by two on a
/// phone.
class CostTiles extends StatelessWidget {
  const CostTiles({
    super.key,
    required this.costs,
    required this.days,
    required this.across,
    this.services,
    this.filtered = false,
  });
  final AdminCosts costs;

  /// How long the period is, for "vs the 30 days before".
  final int days;

  /// Tiles per row: 4 or 2.
  final int across;

  /// The same period by service with nothing filtered: who the "not recorded" tile is about.
  /// Null while it loads or when it failed.
  final AdminCosts? services;

  /// The view is narrowed, so [services] says more than the tile's own number does.
  final bool filtered;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final t = costs.totals;
    final p = costs.previous;
    final margin = marginShare(t.chargedTrackedUsd, t.spentUsd);
    final before = l10n.costVsBefore(days);
    final gaps = costGaps(services);
    // With no vendor reporting a figure, zero isn't "all recorded": it isn't known.
    final known =
        t.notRecordedUsd > 0 || services == null || gaps.reporting > 0;
    final tiles = [
      CostTile(
        key: const Key('costTile-spent'),
        label: l10n.costSpent,
        value: costUsd(t.spentUsd, locale),
        headline: true,
        change: CostChange.of(l10n, t.spentUsd, p?.spentUsd),
        changeSuffix: before,
      ),
      CostTile(
        key: const Key('costTile-charged'),
        label: l10n.costCharged,
        value: costUsd(t.chargedUsd, locale),
        change: CostChange.of(l10n, t.chargedUsd, p?.chargedUsd),
        changeSuffix: before,
      ),
      CostTile(
        key: const Key('costTile-margin'),
        label: l10n.costMargin,
        value: costPercent(margin),
        valueColor: margin != null && margin < 0
            ? context.appColors.negative
            : null,
        change: margin == null
            ? null
            : CostChange.points(
                l10n,
                margin,
                p == null ? null : marginShare(p.chargedTrackedUsd, p.spentUsd),
              ),
        changeSuffix: before,
        caption: margin == null ? l10n.costMarginNone : null,
      ),
      CostTile(
        key: const Key('costTile-notRecorded'),
        label: l10n.costNotRecorded,
        value: known ? costUsd(t.notRecordedUsd, locale) : kMissingValue,
        caption: !known
            ? l10n.costNoVendorFigures
            : filtered || services == null
            ? l10n.costNotRecordedWhy
            : gaps.behind.isEmpty
            ? l10n.costNotRecordedNone
            : l10n.costServicesCount(gaps.behind.length),
        hint: l10n.costNotRecordedHint,
        onTap: () => showNotRecordedSheet(context, services: services),
      ),
    ];
    return Column(
      spacing: AppSpace.sm,
      children: [
        for (var r = 0; r < tiles.length; r += across)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSpace.sm,
              children: [
                for (var c = r; c < r + across; c++) Expanded(child: tiles[c]),
              ],
            ),
          ),
      ],
    );
  }
}

/// The services whose own figure is above what the server recorded ([behind], biggest gap first),
/// how many report a figure at all ([reporting]), and the ones that report none ([silent]).
({List<AdminCostRow> behind, int reporting, List<AdminCostRow> silent})
costGaps(AdminCosts? services) {
  final rows = services?.rows ?? const <AdminCostRow>[];
  final reporting = rows.where((r) => r.reportedUsd != null).toList();
  final behind =
      reporting.where((r) => r.reportedUsd! - r.spentUsd > 0.00005).toList()
        ..sort(
          (a, b) => (b.reportedUsd! - b.spentUsd).compareTo(
            a.reportedUsd! - a.spentUsd,
          ),
        );
  final silent = rows
      .where(
        (r) =>
            r.reportedUsd == null &&
            r.id.isNotEmpty &&
            r.source_ == CostSource.metered,
      )
      .toList();
  return (behind: behind, reporting: reporting.length, silent: silent);
}

class CostTile extends StatelessWidget {
  const CostTile({
    super.key,
    required this.label,
    required this.value,
    this.headline = false,
    this.valueColor,
    this.change,
    this.changeSuffix,
    this.caption,
    this.hint,
    this.onTap,
  });

  final String label;
  final String value;

  /// The tab's one headline number: drawn larger, in the accent.
  final bool headline;
  final Color? valueColor;
  final CostChange? change;
  final String? changeSuffix;

  /// A line in place of the change (or under it): what the number is about.
  final String? caption;

  /// What a tap does, for a screen reader.
  final String? hint;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final text = context.textTheme;
    final muted = scheme.onSurfaceVariant;
    final c = change;
    return Semantics(
      container: true,
      button: onTap != null,
      label: [
        label,
        value,
        if (c != null)
          '${c.spoken}${changeSuffix == null ? '' : ' $changeSuffix'}',
        ?caption,
      ].join(', '),
      hint: hint,
      onTap: onTap,
      excludeSemantics: true,
      child: AppCard(
        onTap: onTap,
        padding: const EdgeInsets.fromLTRB(
          AppSpace.md,
          AppSpace.sm + 2,
          AppSpace.md,
          AppSpace.sm + 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: text.labelLarge?.copyWith(
                      color: muted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (onTap != null)
                  Icon(LucideIcons.info, size: 15, color: muted),
              ],
            ),
            const SizedBox(height: AppSpace.xxs),
            // Scales down rather than clipping when the text is large or the tile narrow.
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                value,
                maxLines: 1,
                style: (headline ? text.headlineMedium : text.headlineSmall)
                    ?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontFeatures: AppText.tabular,
                      height: 1.15,
                      letterSpacing: -0.4,
                      color: valueColor ?? (headline ? scheme.primary : null),
                    ),
              ),
            ),
            const SizedBox(height: AppSpace.xxs),
            if (c != null)
              CostChangeText(
                c,
                style: text.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                suffix: changeSuffix,
              ),
            if (caption != null)
              Text(caption!, style: text.bodySmall?.copyWith(color: muted)),
          ],
        ),
      ),
    );
  }
}

/// What "not recorded" means, and the services it is about: each one's own figure against the
/// server's.
Future<void> showNotRecordedSheet(
  BuildContext context, {
  required AdminCosts? services,
}) {
  return showAdaptiveSheet<void>(
    context: context,
    builder: (sheet) {
      final l10n = sheet.l10n;
      final locale = l10n.localeName;
      final text = sheet.textTheme;
      final muted = sheet.colorScheme.onSurfaceVariant;
      final gaps = costGaps(services);
      return FormSheet(
        icon: LucideIcons.scale,
        title: l10n.costNotRecorded,
        subtitle: l10n.costNotRecordedHelp,
        submitLabel: l10n.close,
        submitKey: const Key('costNotRecordedClose'),
        showCancel: false,
        onSubmit: () => Navigator.pop(sheet),
        children: [
          if (services == null)
            FormNote(l10n.costNotRecordedNoList)
          else if (gaps.behind.isEmpty)
            FormNote(
              gaps.reporting == 0
                  ? l10n.costNoVendorFiguresHelp
                  : l10n.costNotRecordedAllMatch,
              icon: gaps.reporting == 0
                  ? LucideIcons.info
                  : LucideIcons.circleCheck,
            )
          else
            GroupedCard(
              dividerIndent: AppSpace.md,
              children: [
                for (final r in gaps.behind)
                  Padding(
                    key: Key('costGap-${r.id}'),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.md,
                      vertical: AppSpace.sm,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                costRowLabel(l10n, r.id, r.label),
                                style: text.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                l10n.costTheySayWeRecorded(
                                  costUsd(r.reportedUsd, locale),
                                  costUsd(r.spentUsd, locale),
                                ),
                                style: text.bodySmall?.copyWith(color: muted),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: AppSpace.sm),
                        Text(
                          costUsd(r.reportedUsd! - r.spentUsd, locale),
                          style: text.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontFeatures: AppText.tabular,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          if (gaps.silent.isNotEmpty)
            FormNote(
              l10n.costNoFigureFrom(
                gaps.silent
                    .map((r) => costRowLabel(l10n, r.id, r.label))
                    .join(', '),
              ),
              icon: LucideIcons.circleDashed,
            ),
        ],
      );
    },
  );
}
