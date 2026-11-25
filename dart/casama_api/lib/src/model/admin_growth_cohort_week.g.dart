// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_cohort_week.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthCohortWeekCWProxy {
  AdminGrowthCohortWeek eligible(int eligible);

  AdminGrowthCohortWeek active(int active);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthCohortWeek(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthCohortWeek(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthCohortWeek call({int eligible, int active});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthCohortWeek.copyWith(...)` or call `instanceOfAdminGrowthCohortWeek.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthCohortWeekCWProxyImpl
    implements _$AdminGrowthCohortWeekCWProxy {
  const _$AdminGrowthCohortWeekCWProxyImpl(this._value);

  final AdminGrowthCohortWeek _value;

  @override
  AdminGrowthCohortWeek eligible(int eligible) => call(eligible: eligible);

  @override
  AdminGrowthCohortWeek active(int active) => call(active: active);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthCohortWeek(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthCohortWeek(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthCohortWeek call({
    Object? eligible = const $CopyWithPlaceholder(),
    Object? active = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthCohortWeek(
      eligible: eligible == const $CopyWithPlaceholder() || eligible == null
          ? _value.eligible
          // ignore: cast_nullable_to_non_nullable
          : eligible as int,
      active: active == const $CopyWithPlaceholder() || active == null
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as int,
    );
  }
}

extension $AdminGrowthCohortWeekCopyWith on AdminGrowthCohortWeek {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthCohortWeek.copyWith(...)` or `instanceOfAdminGrowthCohortWeek.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthCohortWeekCWProxy get copyWith =>
      _$AdminGrowthCohortWeekCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthCohortWeek _$AdminGrowthCohortWeekFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminGrowthCohortWeek', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['eligible', 'active']);
  final val = AdminGrowthCohortWeek(
    eligible: $checkedConvert('eligible', (v) => (v as num).toInt()),
    active: $checkedConvert('active', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$AdminGrowthCohortWeekToJson(
  AdminGrowthCohortWeek instance,
) => <String, dynamic>{
  'eligible': instance.eligible,
  'active': instance.active,
};
