// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_discounts_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminDiscountsResponseCWProxy {
  AdminDiscountsResponse discounts(List<AdminDiscount> discounts);

  AdminDiscountsResponse plans(List<AdminDiscountPlan> plans);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminDiscountsResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminDiscountsResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminDiscountsResponse call({
    List<AdminDiscount> discounts,
    List<AdminDiscountPlan> plans,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminDiscountsResponse.copyWith(...)` or call `instanceOfAdminDiscountsResponse.copyWith.fieldName(value)` for a single field.
class _$AdminDiscountsResponseCWProxyImpl
    implements _$AdminDiscountsResponseCWProxy {
  const _$AdminDiscountsResponseCWProxyImpl(this._value);

  final AdminDiscountsResponse _value;

  @override
  AdminDiscountsResponse discounts(List<AdminDiscount> discounts) =>
      call(discounts: discounts);

  @override
  AdminDiscountsResponse plans(List<AdminDiscountPlan> plans) =>
      call(plans: plans);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminDiscountsResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminDiscountsResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminDiscountsResponse call({
    Object? discounts = const $CopyWithPlaceholder(),
    Object? plans = const $CopyWithPlaceholder(),
  }) {
    return AdminDiscountsResponse(
      discounts: discounts == const $CopyWithPlaceholder() || discounts == null
          ? _value.discounts
          // ignore: cast_nullable_to_non_nullable
          : discounts as List<AdminDiscount>,
      plans: plans == const $CopyWithPlaceholder() || plans == null
          ? _value.plans
          // ignore: cast_nullable_to_non_nullable
          : plans as List<AdminDiscountPlan>,
    );
  }
}

extension $AdminDiscountsResponseCopyWith on AdminDiscountsResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminDiscountsResponse.copyWith(...)` or `instanceOfAdminDiscountsResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminDiscountsResponseCWProxy get copyWith =>
      _$AdminDiscountsResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDiscountsResponse _$AdminDiscountsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminDiscountsResponse', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['discounts', 'plans']);
  final val = AdminDiscountsResponse(
    discounts: $checkedConvert(
      'discounts',
      (v) => (v as List<dynamic>)
          .map((e) => AdminDiscount.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    plans: $checkedConvert(
      'plans',
      (v) => (v as List<dynamic>)
          .map((e) => AdminDiscountPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminDiscountsResponseToJson(
  AdminDiscountsResponse instance,
) => <String, dynamic>{
  'discounts': instance.discounts.map((e) => e.toJson()).toList(),
  'plans': instance.plans.map((e) => e.toJson()).toList(),
};
