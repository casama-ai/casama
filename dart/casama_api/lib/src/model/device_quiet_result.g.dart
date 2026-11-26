// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_quiet_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeviceQuietResultCWProxy {
  DeviceQuietResult id(String id);

  DeviceQuietResult quietUntil(DateTime? quietUntil);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeviceQuietResult(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeviceQuietResult(...).copyWith(id: 12, name: "My name")
  /// ```
  DeviceQuietResult call({String id, DateTime? quietUntil});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDeviceQuietResult.copyWith(...)` or call `instanceOfDeviceQuietResult.copyWith.fieldName(value)` for a single field.
class _$DeviceQuietResultCWProxyImpl implements _$DeviceQuietResultCWProxy {
  const _$DeviceQuietResultCWProxyImpl(this._value);

  final DeviceQuietResult _value;

  @override
  DeviceQuietResult id(String id) => call(id: id);

  @override
  DeviceQuietResult quietUntil(DateTime? quietUntil) =>
      call(quietUntil: quietUntil);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeviceQuietResult(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeviceQuietResult(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DeviceQuietResult call({
    Object? id = const $CopyWithPlaceholder(),
    Object? quietUntil = const $CopyWithPlaceholder(),
  }) {
    return DeviceQuietResult(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      quietUntil: quietUntil == const $CopyWithPlaceholder()
          ? _value.quietUntil
          // ignore: cast_nullable_to_non_nullable
          : quietUntil as DateTime?,
    );
  }
}

extension $DeviceQuietResultCopyWith on DeviceQuietResult {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDeviceQuietResult.copyWith(...)` or `instanceOfDeviceQuietResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceQuietResultCWProxy get copyWith =>
      _$DeviceQuietResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceQuietResult _$DeviceQuietResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeviceQuietResult', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'quiet_until']);
      final val = DeviceQuietResult(
        id: $checkedConvert('id', (v) => v as String),
        quietUntil: $checkedConvert(
          'quiet_until',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'quietUntil': 'quiet_until'});

Map<String, dynamic> _$DeviceQuietResultToJson(DeviceQuietResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quiet_until': instance.quietUntil?.toIso8601String(),
    };
