// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_costs_by_day_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminCostsByDayInnerCWProxy {
  AdminCostsByDayInner date(String date);

  AdminCostsByDayInner values(List<num> values);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCostsByDayInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCostsByDayInner(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminCostsByDayInner call({String date, List<num> values});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminCostsByDayInner.copyWith(...)` or call `instanceOfAdminCostsByDayInner.copyWith.fieldName(value)` for a single field.
class _$AdminCostsByDayInnerCWProxyImpl
    implements _$AdminCostsByDayInnerCWProxy {
  const _$AdminCostsByDayInnerCWProxyImpl(this._value);

  final AdminCostsByDayInner _value;

  @override
  AdminCostsByDayInner date(String date) => call(date: date);

  @override
  AdminCostsByDayInner values(List<num> values) => call(values: values);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCostsByDayInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCostsByDayInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminCostsByDayInner call({
    Object? date = const $CopyWithPlaceholder(),
    Object? values = const $CopyWithPlaceholder(),
  }) {
    return AdminCostsByDayInner(
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String,
      values: values == const $CopyWithPlaceholder() || values == null
          ? _value.values
          // ignore: cast_nullable_to_non_nullable
          : values as List<num>,
    );
  }
}

extension $AdminCostsByDayInnerCopyWith on AdminCostsByDayInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminCostsByDayInner.copyWith(...)` or `instanceOfAdminCostsByDayInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminCostsByDayInnerCWProxy get copyWith =>
      _$AdminCostsByDayInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCostsByDayInner _$AdminCostsByDayInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminCostsByDayInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['date', 'values']);
  final val = AdminCostsByDayInner(
    date: $checkedConvert('date', (v) => v as String),
    values: $checkedConvert(
      'values',
      (v) => (v as List<dynamic>).map((e) => e as num).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminCostsByDayInnerToJson(
  AdminCostsByDayInner instance,
) => <String, dynamic>{'date': instance.date, 'values': instance.values};
