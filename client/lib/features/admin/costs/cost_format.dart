import 'package:casama_sdk/casama_sdk.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/display_text.dart';
import '../../../core/number_format.dart';
import '../../../core/providers.dart' show formatUsd;
import '../../../core/widgets.dart';
import '../../../l10n/generated/app_localizations.dart';

/// The chart's stack for everything outside the biggest groups.
const kCostOtherId = '__other';

/// Money on the Costs tab: two decimals, "<$0.01" for anything under a cent, and a dash for a
/// number that isn't known (never "$0.00" for unknown).
String costUsd(num? value, String locale) {
  if (value == null) return kMissingValue;
  if (value < 0) return '−${costUsd(-value, locale)}';
  if (value == 0 || value >= 1) return formatUsd(value, locale);
  if (value < 0.01) {
    return '<${0.01.humanizedCurrency(locale, 'USD', decimalDigits: 2)}';
  }
  return value.humanizedCurrency(locale, 'USD', decimalDigits: 2);
}

/// [costUsd] for an amount where zero means "nothing here" (charged on a service nobody is
/// charged for): a dash instead of "$0.00".
String costUsdOrDash(num? value, String locale) =>
    value == null || value == 0 ? kMissingValue : costUsd(value, locale);

/// Margin of [charged] over [cost] as a share of what was charged, or null with nothing charged.
double? marginShare(num charged, num cost) =>
    charged > 0 ? (charged - cost) / charged : null;

String costPercent(double? share) =>
    share == null ? kMissingValue : '${(share * 100).round()}%';

/// A row's part of the total: "<1%" for a sliver, a dash when there is no total.
String costShare(num part, num total) {
  if (total <= 0) return kMissingValue;
  final share = part / total * 100;
  if (part > 0 && share < 1) return '<1%';
  return '${share.round()}%';
}

/// How a number moved against the period before it.
class CostChange {
  const CostChange._(this.text, this.direction, this.spoken);

  /// What the cell shows after its arrow: "+14%", "−3%", "0%", "New", or a dash.
  final String text;

  /// 1 up, -1 down, 0 flat or unknown.
  final int direction;

  /// The same for a screen reader ("up 14% from the period before").
  final String spoken;

  IconData? get icon => switch (direction) {
    1 => LucideIcons.arrowUp,
    -1 => LucideIcons.arrowDown,
    _ => null,
  };

  /// A change in money: percent of [previous]. Null [previous] is unknown.
  static CostChange of(AppLocalizations l10n, num current, num? previous) {
    if (previous == null) {
      return CostChange._(kMissingValue, 0, l10n.costChangeUnknown);
    }
    if (previous <= 0) {
      return current > 0
          ? CostChange._(l10n.costChangeNew, 1, l10n.costChangeNewSpoken)
          : CostChange._('0%', 0, l10n.costChangeFlat);
    }
    final pct = ((current - previous) / previous * 100).round();
    if (pct == 0) return CostChange._('0%', 0, l10n.costChangeFlat);
    final size = pct.abs() > 999 ? '>999%' : '${pct.abs()}%';
    return pct > 0
        ? CostChange._('+$size', 1, l10n.costChangeUp(size))
        : CostChange._('−$size', -1, l10n.costChangeDown(size));
  }

  /// A change in a percentage (the margin), in points.
  static CostChange points(
    AppLocalizations l10n,
    double? current,
    double? previous,
  ) {
    if (current == null || previous == null) {
      return CostChange._(kMissingValue, 0, l10n.costChangeUnknown);
    }
    final pts = ((current - previous) * 100).round();
    if (pts == 0) {
      return CostChange._(l10n.costPoints('0'), 0, l10n.costChangeFlat);
    }
    final size = l10n.costPoints('${pts.abs()}');
    return pts > 0
        ? CostChange._('+$size', 1, l10n.costChangeUp(size))
        : CostChange._('−$size', -1, l10n.costChangeDown(size));
  }
}

/// The row's name: "Not labelled" for what couldn't be placed, "Other" for the chart's rest.
String costRowLabel(AppLocalizations l10n, String id, String label) {
  if (id == kCostOtherId) return l10n.costOther;
  if (id.isEmpty) return l10n.costNotLabelled;
  return label.isUsable ? label : id;
}

String costGroupLabel(AppLocalizations l10n, CostGroup group) =>
    switch (group) {
      CostGroup.service => l10n.costGroupService,
      CostGroup.key => l10n.costGroupKey,
      CostGroup.app => l10n.costGroupApp,
      CostGroup.feature => l10n.costGroupFeature,
      CostGroup.model => l10n.costGroupModel,
      CostGroup.workspace => l10n.costGroupWorkspace,
    };

IconData costGroupIcon(CostGroup group) => switch (group) {
  CostGroup.service => LucideIcons.server,
  CostGroup.key => LucideIcons.keyRound,
  CostGroup.app => LucideIcons.plug,
  CostGroup.feature => LucideIcons.layoutGrid,
  CostGroup.model => LucideIcons.sparkles,
  CostGroup.workspace => LucideIcons.boxes,
};

String costSourceLabel(AppLocalizations l10n, CostSource source) =>
    switch (source) {
      CostSource.metered => l10n.costSourceMetered,
      CostSource.counted => l10n.costSourceCounted,
      CostSource.fixed => l10n.costSourceFixed,
      CostSource.estimated => l10n.costSourceEstimated,
    };

String costSourceHelp(AppLocalizations l10n, CostSource source) =>
    switch (source) {
      CostSource.metered => l10n.costSourceMeteredHelp,
      CostSource.counted => l10n.costSourceCountedHelp,
      CostSource.fixed => l10n.costSourceFixedHelp,
      CostSource.estimated => l10n.costSourceEstimatedHelp,
    };

/// A row's failed calls as a share of its calls; null when the row doesn't count failures.
double? costFailureRate(AdminCostRow row) =>
    row.failed == null || row.calls <= 0 ? null : row.failed! / row.calls;

/// A UTC day from the API ("2026-11-22"), or null when it isn't one.
DateTime? costDay(String day) => DateTime.tryParse('${day}T00:00:00Z');

/// "Oct 24 – Nov 22, 2026": the period's first and last UTC day.
String costRange(BuildContext context, String from, String to) {
  final a = costDay(from);
  final b = costDay(to);
  if (a == null || b == null) return '$from – $to';
  final locale = Localizations.localeOf(context).toString();
  final first = a.year == b.year
      ? DateFormat.MMMd(locale).format(a)
      : DateFormat.yMMMd(locale).format(a);
  return '$first – ${DateFormat.yMMMd(locale).format(b)}';
}

/// "3 hours ago" for a time from the API, or null when there is none.
String? costAgo(BuildContext context, String? iso) {
  final at = iso == null ? null : DateTime.tryParse(iso);
  return at == null ? null : relativeTime(at, context);
}
