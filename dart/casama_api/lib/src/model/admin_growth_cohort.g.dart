// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_cohort.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthCohortCWProxy {
  AdminGrowthCohort week(String week);

  AdminGrowthCohort size(int size);

  AdminGrowthCohort weeks(List<AdminGrowthCohortWeek> weeks);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthCohort(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthCohort(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthCohort call({
    String week,
    int size,
    List<AdminGrowthCohortWeek> weeks,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthCohort.copyWith(...)` or call `instanceOfAdminGrowthCohort.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthCohortCWProxyImpl implements _$AdminGrowthCohortCWProxy {
  const _$AdminGrowthCohortCWProxyImpl(this._value);

  final AdminGrowthCohort _value;

  @override
  AdminGrowthCohort week(String week) => call(week: week);

  @override
  AdminGrowthCohort size(int size) => call(size: size);

  @override
  AdminGrowthCohort weeks(List<AdminGrowthCohortWeek> weeks) =>
      call(weeks: weeks);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthCohort(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthCohort(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthCohort call({
    Object? week = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? weeks = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthCohort(
      week: week == const $CopyWithPlaceholder() || week == null
          ? _value.week
          // ignore: cast_nullable_to_non_nullable
          : week as String,
      size: size == const $CopyWithPlaceholder() || size == null
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      weeks: weeks == const $CopyWithPlaceholder() || weeks == null
          ? _value.weeks
          // ignore: cast_nullable_to_non_nullable
          : weeks as List<AdminGrowthCohortWeek>,
    );
  }
}

extension $AdminGrowthCohortCopyWith on AdminGrowthCohort {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthCohort.copyWith(...)` or `instanceOfAdminGrowthCohort.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthCohortCWProxy get copyWith =>
      _$AdminGrowthCohortCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthCohort _$AdminGrowthCohortFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminGrowthCohort', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['week', 'size', 'weeks']);
      final val = AdminGrowthCohort(
        week: $checkedConvert('week', (v) => v as String),
        size: $checkedConvert('size', (v) => (v as num).toInt()),
        weeks: $checkedConvert(
          'weeks',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    AdminGrowthCohortWeek.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminGrowthCohortToJson(AdminGrowthCohort instance) =>
    <String, dynamic>{
      'week': instance.week,
      'size': instance.size,
      'weeks': instance.weeks.map((e) => e.toJson()).toList(),
    };
