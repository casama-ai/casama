import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/display_text.dart';
import '../../../core/number_format.dart';
import '../../../core/widgets.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../../ui/app_card.dart';
import 'cost_format.dart';
import 'cost_parts.dart';
import 'cost_view.dart';

/// [rows] in the order the table shows them. A row with nothing to compare (no earlier period,
/// no failure count) goes last whichever way the column is sorted.
List<AdminCostRow> sortCostRows(
  List<AdminCostRow> rows,
  CostColumn column,
  bool ascending,
  AppLocalizations l10n,
) {
  num? key(AdminCostRow r) => switch (column) {
    CostColumn.name => null,
    CostColumn.spent || CostColumn.share => r.spentUsd,
    CostColumn.change =>
      r.previousSpentUsd == null
          ? null
          : r.previousSpentUsd! <= 0
          ? (r.spentUsd > 0 ? double.maxFinite : 0)
          : (r.spentUsd - r.previousSpentUsd!) / r.previousSpentUsd!,
    CostColumn.calls => r.calls,
    CostColumn.charged => r.chargedUsd,
    CostColumn.failed => costFailureRate(r),
    CostColumn.tokens => r.tokenUsdEst,
  };
  final out = [...rows];
  if (column == CostColumn.name) {
    String name(AdminCostRow r) =>
        costRowLabel(l10n, r.id, r.label).toLowerCase();
    out.sort(
      (a, b) =>
          ascending ? name(a).compareTo(name(b)) : name(b).compareTo(name(a)),
    );
    return out;
  }
  out.sort((a, b) {
    final x = key(a);
    final y = key(b);
    if (x == null || y == null) return x == null ? (y == null ? 0 : 1) : -1;
    final c = ascending ? x.compareTo(y) : y.compareTo(x);
    // Ties keep the bigger spender first, so the order never flickers.
    return c != 0 ? c : b.spentUsd.compareTo(a.spentUsd);
  });
  return out;
}

/// A word after a row's name that places it: a key's service, a workspace's plan, an app's kind.
String? costRowTag(AdminCostRow r) {
  final id = [
    r.vendor,
    r.planCode,
    r.integrationKind,
  ].where((s) => s.isUsable).firstOrNull;
  return id == null ? null : costTidyId(id);
}

const _costIdNames = {
  'openrouter': 'OpenRouter',
  'openai': 'OpenAI',
  'deepseek': 'DeepSeek',
  'zeptomail': 'ZeptoMail',
  'serpapi': 'SerpApi',
  'mcp': 'MCP',
  'local_mcp': 'Local MCP',
  'computer_mcp': 'Computer MCP',
  'openapi': 'OpenAPI',
  'a2a': 'A2A',
};

/// An id such as `own_servers` in words ("Own servers"), for the small tag beside a name.
String costTidyId(String id) {
  final known = _costIdNames[id];
  if (known != null) return known;
  final words = id.replaceAll('_', ' ').trim();
  return words.isEmpty ? id : '${words[0].toUpperCase()}${words.substring(1)}';
}

/// The whole row in words, for a screen reader.
String costRowSpoken(
  AppLocalizations l10n,
  AdminCostRow r,
  num total,
  CostGroup group,
) {
  final locale = l10n.localeName;
  final rate = costFailureRate(r);
  return [
    costRowLabel(l10n, r.id, r.label),
    ?costRowTag(r),
    if (group == CostGroup.app)
      l10n.costSpokenFees(costUsd(r.spentUsd, locale))
    else
      l10n.costSpokenSpent(costUsd(r.spentUsd, locale)),
    if (group != CostGroup.app && total > 0)
      l10n.costSpokenShare(costShare(r.spentUsd, total)),
    CostChange.of(l10n, r.spentUsd, r.previousSpentUsd).spoken,
    l10n.costSpokenCalls(r.calls.humanizedCount(locale)),
    if (rate != null) l10n.costSpokenFailed(costPercent(rate)),
    if (r.tokenUsdEst != null)
      l10n.costSpokenTokens(costUsd(r.tokenUsdEst, locale)),
    if (group != CostGroup.app && r.chargedUsd > 0)
      l10n.costSpokenCharged(costUsd(r.chargedUsd, locale)),
    costSourceLabel(l10n, r.source_),
  ].join(', ');
}

class _Column {
  const _Column(this.id, this.label, this.width, {this.end = true});
  final CostColumn id;
  final String label;
  final double width;

  /// Numbers line up on the right; the source badge sits on the left.
  final bool end;
}

/// The wide table: one line per row with every number in its own sortable column. A click or
/// Enter on a row opens its detail.
class CostTable extends StatelessWidget {
  const CostTable({
    super.key,
    required this.rows,
    required this.group,
    required this.total,
    required this.sort,
    required this.ascending,
    required this.selectedId,
    required this.colorOf,
    required this.onOpen,
    required this.onSort,
    this.compact = false,
  });

  final List<AdminCostRow> rows;
  final CostGroup group;

  /// A narrow table (a tablet, or the detail open beside it): the name with the three numbers
  /// that matter most. The rest is in the row's detail.
  final bool compact;

  /// What the rows' shares are of.
  final num total;
  final CostColumn sort;
  final bool ascending;
  final String? selectedId;
  final Color Function(String id) colorOf;
  final ValueChanged<AdminCostRow> onOpen;
  final ValueChanged<CostColumn> onSort;

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, box) => _table(context, box.maxWidth));

  Widget _table(BuildContext context, double width) {
    final l10n = context.l10n;
    // Columns grow with the text size, so a larger font doesn't clip the numbers, but never so
    // far that the name is squeezed out: past that the numbers scale down to fit instead.
    final scale = MediaQuery.textScalerOf(context).scale(14) / 14;
    final fixed = group == CostGroup.app
        ? (compact ? 296.0 : 572.0)
        : (compact ? 252.0 : 528.0);
    final room = (width - 2 * AppSpace.md - 150) / fixed;
    final grow = scale.clamp(1.0, 1.6).clamp(0.6, room < 0.6 ? 0.6 : room);
    final columns = group == CostGroup.app
        ? [
            if (!compact)
              _Column(CostColumn.calls, l10n.costColCalls, 76 * grow),
            _Column(CostColumn.failed, l10n.costColFailed, 80 * grow),
            _Column(CostColumn.spent, l10n.costColFees, 104 * grow),
            _Column(CostColumn.tokens, l10n.costColTokens, 112 * grow),
            if (!compact)
              _Column(CostColumn.change, l10n.costColChange, 92 * grow),
          ]
        : [
            _Column(CostColumn.spent, l10n.costSpent, 92 * grow),
            _Column(CostColumn.share, l10n.costColShare, 68 * grow),
            _Column(CostColumn.change, l10n.costColChange, 92 * grow),
            if (!compact) ...[
              _Column(CostColumn.calls, l10n.costColCalls, 76 * grow),
              _Column(CostColumn.charged, l10n.costCharged, 92 * grow),
            ],
          ];
    final sourceWidth = compact ? 0.0 : 108 * grow;
    final biggest = rows.fold<num>(
      0,
      (m, r) => r.spentUsd > m ? r.spentUsd : m,
    );
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.md,
              AppSpace.xxs,
              AppSpace.md,
              AppSpace.xxs,
            ),
            child: Row(
              children: [
                Expanded(
                  child: _Header(
                    column: _Column(
                      CostColumn.name,
                      costGroupLabel(l10n, group),
                      0,
                      end: false,
                    ),
                    sort: sort,
                    ascending: ascending,
                    onSort: onSort,
                  ),
                ),
                for (final c in columns)
                  SizedBox(
                    width: c.width,
                    child: _Header(
                      column: c,
                      sort: sort,
                      ascending: ascending,
                      onSort: onSort,
                    ),
                  ),
                if (!compact)
                  SizedBox(
                    width: sourceWidth,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: AppSpace.md,
                      ),
                      child: Text(
                        l10n.costColSource,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: _headerStyle(context, false),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.appColors.hairline),
          for (final (i, r) in rows.indexed) ...[
            if (i > 0)
              Divider(
                height: 1,
                thickness: 1,
                indent: AppSpace.md,
                endIndent: AppSpace.md,
                color: context.appColors.hairline.withValues(alpha: 0.6),
              ),
            _WideRow(
              key: Key('costRow-${r.id}'),
              row: r,
              group: group,
              columns: columns,
              sourceWidth: sourceWidth,
              total: total,
              biggest: biggest,
              color: colorOf(r.id),
              selected: selectedId == r.id,
              onOpen: () => onOpen(r),
            ),
          ],
        ],
      ),
    );
  }
}

TextStyle? _headerStyle(BuildContext context, bool active) =>
    context.textTheme.labelMedium?.copyWith(
      color: active
          ? context.colorScheme.onSurface
          : context.colorScheme.onSurfaceVariant,
      fontWeight: active ? FontWeight.w700 : FontWeight.w600,
    );

class _Header extends StatelessWidget {
  const _Header({
    required this.column,
    required this.sort,
    required this.ascending,
    required this.onSort,
  });
  final _Column column;
  final CostColumn sort;
  final bool ascending;
  final ValueChanged<CostColumn> onSort;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final active = sort == column.id;
    final arrow = Icon(
      active
          ? (ascending ? LucideIcons.arrowUp : LucideIcons.arrowDown)
          : LucideIcons.chevronsUpDown,
      size: 13,
      color: active
          ? context.colorScheme.primary
          : context.colorScheme.onSurfaceVariant.withValues(alpha: 0.55),
    );
    final label = Flexible(
      child: Text(
        column.label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _headerStyle(context, active),
      ),
    );
    return Semantics(
      button: true,
      label: active
          ? (ascending
                ? l10n.costSortedAscending(column.label)
                : l10n.costSortedDescending(column.label))
          : l10n.costSortBy(column.label),
      onTap: () => onSort(column.id),
      excludeSemantics: true,
      child: InkWell(
        key: Key('costSort-${column.id.name}'),
        borderRadius: BorderRadius.circular(AppRadius.icon),
        onTap: () => onSort(column.id),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpace.xs),
          child: Row(
            mainAxisAlignment: column.end
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: column.end
                ? [arrow, const SizedBox(width: 3), label]
                : [label, const SizedBox(width: 3), arrow],
          ),
        ),
      ),
    );
  }
}

class _WideRow extends StatelessWidget {
  const _WideRow({
    super.key,
    required this.row,
    required this.group,
    required this.columns,
    required this.sourceWidth,
    required this.total,
    required this.biggest,
    required this.color,
    required this.selected,
    required this.onOpen,
  });

  final AdminCostRow row;
  final CostGroup group;
  final List<_Column> columns;
  final double sourceWidth;
  final num total;
  final num biggest;
  final Color color;
  final bool selected;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final scheme = context.colorScheme;
    final text = context.textTheme;
    final number = text.bodyMedium?.copyWith(fontFeatures: AppText.tabular);
    final muted = scheme.onSurfaceVariant;
    final tag = costRowTag(row);
    final rate = costFailureRate(row);

    Widget fit(Widget child) => FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerEnd,
      child: child,
    );
    Widget cell(CostColumn c) => switch (c) {
      CostColumn.spent => fit(
        Text(
          costUsd(row.spentUsd, locale),
          maxLines: 1,
          style: number?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      CostColumn.share => fit(
        Text(
          costShare(row.spentUsd, total),
          maxLines: 1,
          style: number?.copyWith(color: muted),
        ),
      ),
      CostColumn.change => fit(
        CostChangeText(
          CostChange.of(l10n, row.spentUsd, row.previousSpentUsd),
          style: number,
        ),
      ),
      CostColumn.calls => fit(
        Text(row.calls.humanizedCount(locale), maxLines: 1, style: number),
      ),
      CostColumn.charged => fit(
        Text(costUsdOrDash(row.chargedUsd, locale), maxLines: 1, style: number),
      ),
      CostColumn.failed => fit(
        Text(
          costPercent(rate),
          maxLines: 1,
          style: number?.copyWith(
            color: rate != null && rate >= 0.1
                ? context.appColors.negative
                : null,
            fontWeight: rate != null && rate >= 0.1 ? FontWeight.w700 : null,
          ),
        ),
      ),
      CostColumn.tokens => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          fit(
            Text(costUsd(row.tokenUsdEst, locale), maxLines: 1, style: number),
          ),
          if (row.tokenUsdEst != null)
            fit(
              Text(
                l10n.costEstimated,
                maxLines: 1,
                style: text.labelSmall?.copyWith(color: muted),
              ),
            ),
        ],
      ),
      CostColumn.name => const SizedBox.shrink(),
    };

    return Semantics(
      button: true,
      selected: selected,
      label: costRowSpoken(l10n, row, total, group),
      hint: l10n.costOpenRowHint,
      onTap: onOpen,
      excludeSemantics: true,
      child: Material(
        color: selected
            ? scheme.primary.withValues(alpha: context.isDark ? 0.16 : 0.08)
            : Colors.transparent,
        child: InkWell(
          onTap: onOpen,
          focusColor: scheme.primary.withValues(alpha: 0.12),
          hoverColor: scheme.onSurface.withValues(alpha: 0.04),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpace.md,
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          CostDot(color),
                          const SizedBox(width: AppSpace.xs),
                          Flexible(
                            flex: 3,
                            child: Text(
                              costRowLabel(l10n, row.id, row.label),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: text.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontStyle: row.id.isEmpty
                                    ? FontStyle.italic
                                    : null,
                              ),
                            ),
                          ),
                          if (tag != null) ...[
                            const SizedBox(width: AppSpace.xs),
                            Flexible(
                              child: Text(
                                tag,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: text.bodySmall?.copyWith(color: muted),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 18,
                          end: AppSpace.md,
                        ),
                        child: CostBar(
                          fraction: biggest <= 0 ? 0 : row.spentUsd / biggest,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
                for (final c in columns)
                  SizedBox(width: c.width, child: cell(c.id)),
                if (sourceWidth > 0)
                  SizedBox(
                    width: sourceWidth,
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: AppSpace.md,
                        ),
                        child: CostSourceBadge(row.source_),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The phone's list: two lines per row. The name and what it spent, then its bar with its share,
/// change and source. A tap pushes the row's detail.
class CostList extends StatelessWidget {
  const CostList({
    super.key,
    required this.rows,
    required this.group,
    required this.total,
    required this.colorOf,
    required this.onOpen,
  });
  final List<AdminCostRow> rows;
  final CostGroup group;
  final num total;
  final Color Function(String id) colorOf;
  final ValueChanged<AdminCostRow> onOpen;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final text = context.textTheme;
    final muted = context.colorScheme.onSurfaceVariant;
    final biggest = rows.fold<num>(
      0,
      (m, r) => r.spentUsd > m ? r.spentUsd : m,
    );
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final (i, r) in rows.indexed) ...[
            if (i > 0)
              Divider(
                height: 1,
                thickness: 1,
                indent: AppSpace.md,
                endIndent: AppSpace.md,
                color: context.appColors.hairline.withValues(alpha: 0.6),
              ),
            Semantics(
              button: true,
              label: costRowSpoken(l10n, r, total, group),
              hint: l10n.costOpenRowHint,
              onTap: () => onOpen(r),
              excludeSemantics: true,
              child: InkWell(
                key: Key('costRow-${r.id}'),
                onTap: () => onOpen(r),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpace.md,
                    AppSpace.sm,
                    AppSpace.md,
                    AppSpace.sm,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          CostDot(colorOf(r.id)),
                          const SizedBox(width: AppSpace.xs),
                          Expanded(
                            child: Text(
                              costRowLabel(l10n, r.id, r.label),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: text.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontStyle: r.id.isEmpty
                                    ? FontStyle.italic
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpace.sm),
                          Text(
                            costUsd(r.spentUsd, locale),
                            maxLines: 1,
                            style: text.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFeatures: AppText.tabular,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          // The bar takes what the words leave; the words never take
                          // more than two thirds, so there is always a bar.
                          Expanded(
                            child: CostBar(
                              fraction: biggest <= 0 ? 0 : r.spentUsd / biggest,
                              color: colorOf(r.id),
                            ),
                          ),
                          const SizedBox(width: AppSpace.sm),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth:
                                  (MediaQuery.sizeOf(context).width - 64) *
                                  0.66,
                            ),
                            child: Align(
                              widthFactor: 1,
                              alignment: AlignmentDirectional.centerEnd,
                              child: _PhoneMeta(
                                row: r,
                                group: group,
                                total: total,
                                style: text.bodySmall?.copyWith(
                                  color: muted,
                                  fontFeatures: AppText.tabular,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// "75% · ↑ +14% · Metered" for a service; calls, failures and the estimated token cost for an app.
class _PhoneMeta extends StatelessWidget {
  const _PhoneMeta({
    required this.row,
    required this.group,
    required this.total,
    required this.style,
  });
  final AdminCostRow row;
  final CostGroup group;
  final num total;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final change = CostChange.of(l10n, row.spentUsd, row.previousSpentUsd);
    final rate = costFailureRate(row);
    final before = group == CostGroup.app
        ? [
            l10n.costCallsCount(row.calls.humanizedCount(locale)),
            if (rate != null) l10n.costFailedShare(costPercent(rate)),
            if (row.tokenUsdEst != null)
              l10n.costTokensEstimated(costUsd(row.tokenUsdEst, locale)),
          ]
        : [costShare(row.spentUsd, total)];
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${before.join(' · ')} · '),
          if (change.icon != null)
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                change.icon,
                size: MediaQuery.textScalerOf(context).scale(12),
                color: style?.color,
              ),
            ),
          TextSpan(text: change.text),
          if (group != CostGroup.app)
            TextSpan(text: ' · ${costSourceLabel(l10n, row.source_)}'),
        ],
      ),
      maxLines: group == CostGroup.app ? 2 : 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.end,
      style: style,
    );
  }
}
