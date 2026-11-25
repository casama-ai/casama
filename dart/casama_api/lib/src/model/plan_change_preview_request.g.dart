// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_change_preview_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlanChangePreviewRequestCWProxy {
  PlanChangePreviewRequest planCode(String planCode);

  PlanChangePreviewRequest discountCode(String? discountCode);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PlanChangePreviewRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PlanChangePreviewRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  PlanChangePreviewRequest call({String planCode, String? discountCode});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPlanChangePreviewRequest.copyWith(...)` or call `instanceOfPlanChangePreviewRequest.copyWith.fieldName(value)` for a single field.
class _$PlanChangePreviewRequestCWProxyImpl
    implements _$PlanChangePreviewRequestCWProxy {
  const _$PlanChangePreviewRequestCWProxyImpl(this._value);

  final PlanChangePreviewRequest _value;

  @override
  PlanChangePreviewRequest planCode(String planCode) =>
      call(planCode: planCode);

  @override
  PlanChangePreviewRequest discountCode(String? discountCode) =>
      call(discountCode: discountCode);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PlanChangePreviewRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PlanChangePreviewRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PlanChangePreviewRequest call({
    Object? planCode = const $CopyWithPlaceholder(),
    Object? discountCode = const $CopyWithPlaceholder(),
  }) {
    return PlanChangePreviewRequest(
      planCode: planCode == const $CopyWithPlaceholder() || planCode == null
          ? _value.planCode
          // ignore: cast_nullable_to_non_nullable
          : planCode as String,
      discountCode: discountCode == const $CopyWithPlaceholder()
          ? _value.discountCode
          // ignore: cast_nullable_to_non_nullable
          : discountCode as String?,
    );
  }
}

extension $PlanChangePreviewRequestCopyWith on PlanChangePreviewRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPlanChangePreviewRequest.copyWith(...)` or `instanceOfPlanChangePreviewRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlanChangePreviewRequestCWProxy get copyWith =>
      _$PlanChangePreviewRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanChangePreviewRequest _$PlanChangePreviewRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PlanChangePreviewRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['plan_code']);
    final val = PlanChangePreviewRequest(
      planCode: $checkedConvert('plan_code', (v) => v as String),
      discountCode: $checkedConvert('discount_code', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'planCode': 'plan_code', 'discountCode': 'discount_code'},
);

Map<String, dynamic> _$PlanChangePreviewRequestToJson(
  PlanChangePreviewRequest instance,
) => <String, dynamic>{
  'plan_code': instance.planCode,
  'discount_code': ?instance.discountCode,
};
