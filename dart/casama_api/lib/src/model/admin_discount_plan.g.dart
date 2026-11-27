// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_discount_plan.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminDiscountPlanCWProxy {
  AdminDiscountPlan code(String code);

  AdminDiscountPlan name(String name);

  AdminDiscountPlan interval(AdminDiscountPlanIntervalEnum interval);

  AdminDiscountPlan priceLabel(String? priceLabel);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminDiscountPlan(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminDiscountPlan(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminDiscountPlan call({
    String code,
    String name,
    AdminDiscountPlanIntervalEnum interval,
    String? priceLabel,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminDiscountPlan.copyWith(...)` or call `instanceOfAdminDiscountPlan.copyWith.fieldName(value)` for a single field.
class _$AdminDiscountPlanCWProxyImpl implements _$AdminDiscountPlanCWProxy {
  const _$AdminDiscountPlanCWProxyImpl(this._value);

  final AdminDiscountPlan _value;

  @override
  AdminDiscountPlan code(String code) => call(code: code);

  @override
  AdminDiscountPlan name(String name) => call(name: name);

  @override
  AdminDiscountPlan interval(AdminDiscountPlanIntervalEnum interval) =>
      call(interval: interval);

  @override
  AdminDiscountPlan priceLabel(String? priceLabel) =>
      call(priceLabel: priceLabel);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminDiscountPlan(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminDiscountPlan(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminDiscountPlan call({
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? interval = const $CopyWithPlaceholder(),
    Object? priceLabel = const $CopyWithPlaceholder(),
  }) {
    return AdminDiscountPlan(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      interval: interval == const $CopyWithPlaceholder() || interval == null
          ? _value.interval
          // ignore: cast_nullable_to_non_nullable
          : interval as AdminDiscountPlanIntervalEnum,
      priceLabel: priceLabel == const $CopyWithPlaceholder()
          ? _value.priceLabel
          // ignore: cast_nullable_to_non_nullable
          : priceLabel as String?,
    );
  }
}

extension $AdminDiscountPlanCopyWith on AdminDiscountPlan {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminDiscountPlan.copyWith(...)` or `instanceOfAdminDiscountPlan.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminDiscountPlanCWProxy get copyWith =>
      _$AdminDiscountPlanCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDiscountPlan _$AdminDiscountPlanFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminDiscountPlan', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['code', 'name', 'interval', 'price_label'],
      );
      final val = AdminDiscountPlan(
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        interval: $checkedConvert(
          'interval',
          (v) => $enumDecode(_$AdminDiscountPlanIntervalEnumEnumMap, v),
        ),
        priceLabel: $checkedConvert('price_label', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'priceLabel': 'price_label'});

Map<String, dynamic> _$AdminDiscountPlanToJson(AdminDiscountPlan instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'interval': _$AdminDiscountPlanIntervalEnumEnumMap[instance.interval]!,
      'price_label': instance.priceLabel,
    };

const _$AdminDiscountPlanIntervalEnumEnumMap = {
  AdminDiscountPlanIntervalEnum.month: 'month',
  AdminDiscountPlanIntervalEnum.year: 'year',
  AdminDiscountPlanIntervalEnum.week: 'week',
};
