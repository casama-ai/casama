// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_plan.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthPlanCWProxy {
  AdminGrowthPlan planCode(String planCode);

  AdminGrowthPlan subscribers(int subscribers);

  AdminGrowthPlan monthlyUsd(num? monthlyUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthPlan(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthPlan(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthPlan call({String planCode, int subscribers, num? monthlyUsd});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthPlan.copyWith(...)` or call `instanceOfAdminGrowthPlan.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthPlanCWProxyImpl implements _$AdminGrowthPlanCWProxy {
  const _$AdminGrowthPlanCWProxyImpl(this._value);

  final AdminGrowthPlan _value;

  @override
  AdminGrowthPlan planCode(String planCode) => call(planCode: planCode);

  @override
  AdminGrowthPlan subscribers(int subscribers) =>
      call(subscribers: subscribers);

  @override
  AdminGrowthPlan monthlyUsd(num? monthlyUsd) => call(monthlyUsd: monthlyUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthPlan(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthPlan(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthPlan call({
    Object? planCode = const $CopyWithPlaceholder(),
    Object? subscribers = const $CopyWithPlaceholder(),
    Object? monthlyUsd = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthPlan(
      planCode: planCode == const $CopyWithPlaceholder() || planCode == null
          ? _value.planCode
          // ignore: cast_nullable_to_non_nullable
          : planCode as String,
      subscribers:
          subscribers == const $CopyWithPlaceholder() || subscribers == null
          ? _value.subscribers
          // ignore: cast_nullable_to_non_nullable
          : subscribers as int,
      monthlyUsd: monthlyUsd == const $CopyWithPlaceholder()
          ? _value.monthlyUsd
          // ignore: cast_nullable_to_non_nullable
          : monthlyUsd as num?,
    );
  }
}

extension $AdminGrowthPlanCopyWith on AdminGrowthPlan {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthPlan.copyWith(...)` or `instanceOfAdminGrowthPlan.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthPlanCWProxy get copyWith => _$AdminGrowthPlanCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthPlan _$AdminGrowthPlanFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminGrowthPlan', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['plan_code', 'subscribers', 'monthly_usd'],
  );
  final val = AdminGrowthPlan(
    planCode: $checkedConvert('plan_code', (v) => v as String),
    subscribers: $checkedConvert('subscribers', (v) => (v as num).toInt()),
    monthlyUsd: $checkedConvert('monthly_usd', (v) => v as num?),
  );
  return val;
}, fieldKeyMap: const {'planCode': 'plan_code', 'monthlyUsd': 'monthly_usd'});

Map<String, dynamic> _$AdminGrowthPlanToJson(AdminGrowthPlan instance) =>
    <String, dynamic>{
      'plan_code': instance.planCode,
      'subscribers': instance.subscribers,
      'monthly_usd': instance.monthlyUsd,
    };
