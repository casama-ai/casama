// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_link_status_plan.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudLinkStatusPlanCWProxy {
  CloudLinkStatusPlan code(String code);

  CloudLinkStatusPlan name(String name);

  CloudLinkStatusPlan paid(bool paid);

  CloudLinkStatusPlan ended(bool? ended);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusPlan(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusPlan(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudLinkStatusPlan call({String code, String name, bool paid, bool? ended});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudLinkStatusPlan.copyWith(...)` or call `instanceOfCloudLinkStatusPlan.copyWith.fieldName(value)` for a single field.
class _$CloudLinkStatusPlanCWProxyImpl implements _$CloudLinkStatusPlanCWProxy {
  const _$CloudLinkStatusPlanCWProxyImpl(this._value);

  final CloudLinkStatusPlan _value;

  @override
  CloudLinkStatusPlan code(String code) => call(code: code);

  @override
  CloudLinkStatusPlan name(String name) => call(name: name);

  @override
  CloudLinkStatusPlan paid(bool paid) => call(paid: paid);

  @override
  CloudLinkStatusPlan ended(bool? ended) => call(ended: ended);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusPlan(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusPlan(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudLinkStatusPlan call({
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? paid = const $CopyWithPlaceholder(),
    Object? ended = const $CopyWithPlaceholder(),
  }) {
    return CloudLinkStatusPlan(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      paid: paid == const $CopyWithPlaceholder() || paid == null
          ? _value.paid
          // ignore: cast_nullable_to_non_nullable
          : paid as bool,
      ended: ended == const $CopyWithPlaceholder()
          ? _value.ended
          // ignore: cast_nullable_to_non_nullable
          : ended as bool?,
    );
  }
}

extension $CloudLinkStatusPlanCopyWith on CloudLinkStatusPlan {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudLinkStatusPlan.copyWith(...)` or `instanceOfCloudLinkStatusPlan.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudLinkStatusPlanCWProxy get copyWith =>
      _$CloudLinkStatusPlanCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudLinkStatusPlan _$CloudLinkStatusPlanFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CloudLinkStatusPlan', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'name', 'paid']);
      final val = CloudLinkStatusPlan(
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        paid: $checkedConvert('paid', (v) => v as bool),
        ended: $checkedConvert('ended', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$CloudLinkStatusPlanToJson(
  CloudLinkStatusPlan instance,
) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'paid': instance.paid,
  'ended': ?instance.ended,
};
