// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_costs.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminCostsCWProxy {
  AdminCosts from(String from);

  AdminCosts to(String to);

  AdminCosts group(CostGroup group);

  AdminCosts includeFixed(bool includeFixed);

  AdminCosts totals(AdminCostTotals totals);

  AdminCosts previous(AdminCostTotals? previous);

  AdminCosts series(List<AdminCostsSeriesInner> series);

  AdminCosts byDay(List<AdminCostsByDayInner> byDay);

  AdminCosts rows(List<AdminCostRow> rows);

  AdminCosts updatedAt(String? updatedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCosts(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCosts(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminCosts call({
    String from,
    String to,
    CostGroup group,
    bool includeFixed,
    AdminCostTotals totals,
    AdminCostTotals? previous,
    List<AdminCostsSeriesInner> series,
    List<AdminCostsByDayInner> byDay,
    List<AdminCostRow> rows,
    String? updatedAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminCosts.copyWith(...)` or call `instanceOfAdminCosts.copyWith.fieldName(value)` for a single field.
class _$AdminCostsCWProxyImpl implements _$AdminCostsCWProxy {
  const _$AdminCostsCWProxyImpl(this._value);

  final AdminCosts _value;

  @override
  AdminCosts from(String from) => call(from: from);

  @override
  AdminCosts to(String to) => call(to: to);

  @override
  AdminCosts group(CostGroup group) => call(group: group);

  @override
  AdminCosts includeFixed(bool includeFixed) =>
      call(includeFixed: includeFixed);

  @override
  AdminCosts totals(AdminCostTotals totals) => call(totals: totals);

  @override
  AdminCosts previous(AdminCostTotals? previous) => call(previous: previous);

  @override
  AdminCosts series(List<AdminCostsSeriesInner> series) => call(series: series);

  @override
  AdminCosts byDay(List<AdminCostsByDayInner> byDay) => call(byDay: byDay);

  @override
  AdminCosts rows(List<AdminCostRow> rows) => call(rows: rows);

  @override
  AdminCosts updatedAt(String? updatedAt) => call(updatedAt: updatedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCosts(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCosts(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminCosts call({
    Object? from = const $CopyWithPlaceholder(),
    Object? to = const $CopyWithPlaceholder(),
    Object? group = const $CopyWithPlaceholder(),
    Object? includeFixed = const $CopyWithPlaceholder(),
    Object? totals = const $CopyWithPlaceholder(),
    Object? previous = const $CopyWithPlaceholder(),
    Object? series = const $CopyWithPlaceholder(),
    Object? byDay = const $CopyWithPlaceholder(),
    Object? rows = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return AdminCosts(
      from: from == const $CopyWithPlaceholder() || from == null
          ? _value.from
          // ignore: cast_nullable_to_non_nullable
          : from as String,
      to: to == const $CopyWithPlaceholder() || to == null
          ? _value.to
          // ignore: cast_nullable_to_non_nullable
          : to as String,
      group: group == const $CopyWithPlaceholder() || group == null
          ? _value.group
          // ignore: cast_nullable_to_non_nullable
          : group as CostGroup,
      includeFixed:
          includeFixed == const $CopyWithPlaceholder() || includeFixed == null
          ? _value.includeFixed
          // ignore: cast_nullable_to_non_nullable
          : includeFixed as bool,
      totals: totals == const $CopyWithPlaceholder() || totals == null
          ? _value.totals
          // ignore: cast_nullable_to_non_nullable
          : totals as AdminCostTotals,
      previous: previous == const $CopyWithPlaceholder()
          ? _value.previous
          // ignore: cast_nullable_to_non_nullable
          : previous as AdminCostTotals?,
      series: series == const $CopyWithPlaceholder() || series == null
          ? _value.series
          // ignore: cast_nullable_to_non_nullable
          : series as List<AdminCostsSeriesInner>,
      byDay: byDay == const $CopyWithPlaceholder() || byDay == null
          ? _value.byDay
          // ignore: cast_nullable_to_non_nullable
          : byDay as List<AdminCostsByDayInner>,
      rows: rows == const $CopyWithPlaceholder() || rows == null
          ? _value.rows
          // ignore: cast_nullable_to_non_nullable
          : rows as List<AdminCostRow>,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as String?,
    );
  }
}

extension $AdminCostsCopyWith on AdminCosts {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminCosts.copyWith(...)` or `instanceOfAdminCosts.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminCostsCWProxy get copyWith => _$AdminCostsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCosts _$AdminCostsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AdminCosts',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'from',
        'to',
        'group',
        'include_fixed',
        'totals',
        'previous',
        'series',
        'by_day',
        'rows',
        'updated_at',
      ],
    );
    final val = AdminCosts(
      from: $checkedConvert('from', (v) => v as String),
      to: $checkedConvert('to', (v) => v as String),
      group: $checkedConvert(
        'group',
        (v) => $enumDecode(_$CostGroupEnumMap, v),
      ),
      includeFixed: $checkedConvert('include_fixed', (v) => v as bool),
      totals: $checkedConvert(
        'totals',
        (v) => AdminCostTotals.fromJson(v as Map<String, dynamic>),
      ),
      previous: $checkedConvert(
        'previous',
        (v) => v == null
            ? null
            : AdminCostTotals.fromJson(v as Map<String, dynamic>),
      ),
      series: $checkedConvert(
        'series',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminCostsSeriesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      byDay: $checkedConvert(
        'by_day',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminCostsByDayInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      rows: $checkedConvert(
        'rows',
        (v) => (v as List<dynamic>)
            .map((e) => AdminCostRow.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      updatedAt: $checkedConvert('updated_at', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'includeFixed': 'include_fixed',
    'byDay': 'by_day',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$AdminCostsToJson(AdminCosts instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'group': _$CostGroupEnumMap[instance.group]!,
      'include_fixed': instance.includeFixed,
      'totals': instance.totals.toJson(),
      'previous': instance.previous?.toJson(),
      'series': instance.series.map((e) => e.toJson()).toList(),
      'by_day': instance.byDay.map((e) => e.toJson()).toList(),
      'rows': instance.rows.map((e) => e.toJson()).toList(),
      'updated_at': instance.updatedAt,
    };

const _$CostGroupEnumMap = {
  CostGroup.service: 'service',
  CostGroup.key: 'key',
  CostGroup.app: 'app',
  CostGroup.feature: 'feature',
  CostGroup.model: 'model',
  CostGroup.workspace: 'workspace',
};
