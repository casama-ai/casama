// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_device_quiet_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateDeviceQuietRequestCWProxy {
  UpdateDeviceQuietRequest quietUntil(DateTime? quietUntil);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateDeviceQuietRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateDeviceQuietRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateDeviceQuietRequest call({DateTime? quietUntil});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateDeviceQuietRequest.copyWith(...)` or call `instanceOfUpdateDeviceQuietRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateDeviceQuietRequestCWProxyImpl
    implements _$UpdateDeviceQuietRequestCWProxy {
  const _$UpdateDeviceQuietRequestCWProxyImpl(this._value);

  final UpdateDeviceQuietRequest _value;

  @override
  UpdateDeviceQuietRequest quietUntil(DateTime? quietUntil) =>
      call(quietUntil: quietUntil);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateDeviceQuietRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateDeviceQuietRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateDeviceQuietRequest call({
    Object? quietUntil = const $CopyWithPlaceholder(),
  }) {
    return UpdateDeviceQuietRequest(
      quietUntil: quietUntil == const $CopyWithPlaceholder()
          ? _value.quietUntil
          // ignore: cast_nullable_to_non_nullable
          : quietUntil as DateTime?,
    );
  }
}

extension $UpdateDeviceQuietRequestCopyWith on UpdateDeviceQuietRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateDeviceQuietRequest.copyWith(...)` or `instanceOfUpdateDeviceQuietRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateDeviceQuietRequestCWProxy get copyWith =>
      _$UpdateDeviceQuietRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDeviceQuietRequest _$UpdateDeviceQuietRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateDeviceQuietRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['quiet_until']);
  final val = UpdateDeviceQuietRequest(
    quietUntil: $checkedConvert(
      'quiet_until',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
}, fieldKeyMap: const {'quietUntil': 'quiet_until'});

Map<String, dynamic> _$UpdateDeviceQuietRequestToJson(
  UpdateDeviceQuietRequest instance,
) => <String, dynamic>{'quiet_until': instance.quietUntil?.toIso8601String()};
