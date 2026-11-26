// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_link_status_seats.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudLinkStatusSeatsCWProxy {
  CloudLinkStatusSeats plan(num plan);

  CloudLinkStatusSeats used(num used);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusSeats(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusSeats(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudLinkStatusSeats call({num plan, num used});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudLinkStatusSeats.copyWith(...)` or call `instanceOfCloudLinkStatusSeats.copyWith.fieldName(value)` for a single field.
class _$CloudLinkStatusSeatsCWProxyImpl
    implements _$CloudLinkStatusSeatsCWProxy {
  const _$CloudLinkStatusSeatsCWProxyImpl(this._value);

  final CloudLinkStatusSeats _value;

  @override
  CloudLinkStatusSeats plan(num plan) => call(plan: plan);

  @override
  CloudLinkStatusSeats used(num used) => call(used: used);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusSeats(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusSeats(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudLinkStatusSeats call({
    Object? plan = const $CopyWithPlaceholder(),
    Object? used = const $CopyWithPlaceholder(),
  }) {
    return CloudLinkStatusSeats(
      plan: plan == const $CopyWithPlaceholder() || plan == null
          ? _value.plan
          // ignore: cast_nullable_to_non_nullable
          : plan as num,
      used: used == const $CopyWithPlaceholder() || used == null
          ? _value.used
          // ignore: cast_nullable_to_non_nullable
          : used as num,
    );
  }
}

extension $CloudLinkStatusSeatsCopyWith on CloudLinkStatusSeats {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudLinkStatusSeats.copyWith(...)` or `instanceOfCloudLinkStatusSeats.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudLinkStatusSeatsCWProxy get copyWith =>
      _$CloudLinkStatusSeatsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudLinkStatusSeats _$CloudLinkStatusSeatsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudLinkStatusSeats', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['plan', 'used']);
  final val = CloudLinkStatusSeats(
    plan: $checkedConvert('plan', (v) => v as num),
    used: $checkedConvert('used', (v) => v as num),
  );
  return val;
});

Map<String, dynamic> _$CloudLinkStatusSeatsToJson(
  CloudLinkStatusSeats instance,
) => <String, dynamic>{'plan': instance.plan, 'used': instance.used};
