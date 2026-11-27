// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snooze_capacity_alarm_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SnoozeCapacityAlarmRequestCWProxy {
  SnoozeCapacityAlarmRequest minutes(Object? minutes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SnoozeCapacityAlarmRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SnoozeCapacityAlarmRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SnoozeCapacityAlarmRequest call({Object? minutes});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSnoozeCapacityAlarmRequest.copyWith(...)` or call `instanceOfSnoozeCapacityAlarmRequest.copyWith.fieldName(value)` for a single field.
class _$SnoozeCapacityAlarmRequestCWProxyImpl
    implements _$SnoozeCapacityAlarmRequestCWProxy {
  const _$SnoozeCapacityAlarmRequestCWProxyImpl(this._value);

  final SnoozeCapacityAlarmRequest _value;

  @override
  SnoozeCapacityAlarmRequest minutes(Object? minutes) => call(minutes: minutes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SnoozeCapacityAlarmRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SnoozeCapacityAlarmRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SnoozeCapacityAlarmRequest call({
    Object? minutes = const $CopyWithPlaceholder(),
  }) {
    return SnoozeCapacityAlarmRequest(
      minutes: minutes == const $CopyWithPlaceholder()
          ? _value.minutes
          // ignore: cast_nullable_to_non_nullable
          : minutes as Object?,
    );
  }
}

extension $SnoozeCapacityAlarmRequestCopyWith on SnoozeCapacityAlarmRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSnoozeCapacityAlarmRequest.copyWith(...)` or `instanceOfSnoozeCapacityAlarmRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SnoozeCapacityAlarmRequestCWProxy get copyWith =>
      _$SnoozeCapacityAlarmRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnoozeCapacityAlarmRequest _$SnoozeCapacityAlarmRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SnoozeCapacityAlarmRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['minutes']);
  final val = SnoozeCapacityAlarmRequest(
    minutes: $checkedConvert('minutes', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$SnoozeCapacityAlarmRequestToJson(
  SnoozeCapacityAlarmRequest instance,
) => <String, dynamic>{'minutes': instance.minutes};
