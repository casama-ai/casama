// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_connect_code.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudConnectCodeCWProxy {
  CloudConnectCode code(String code);

  CloudConnectCode expiresAt(DateTime expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudConnectCode(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudConnectCode(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudConnectCode call({String code, DateTime expiresAt});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudConnectCode.copyWith(...)` or call `instanceOfCloudConnectCode.copyWith.fieldName(value)` for a single field.
class _$CloudConnectCodeCWProxyImpl implements _$CloudConnectCodeCWProxy {
  const _$CloudConnectCodeCWProxyImpl(this._value);

  final CloudConnectCode _value;

  @override
  CloudConnectCode code(String code) => call(code: code);

  @override
  CloudConnectCode expiresAt(DateTime expiresAt) => call(expiresAt: expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudConnectCode(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudConnectCode(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudConnectCode call({
    Object? code = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return CloudConnectCode(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      expiresAt: expiresAt == const $CopyWithPlaceholder() || expiresAt == null
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $CloudConnectCodeCopyWith on CloudConnectCode {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudConnectCode.copyWith(...)` or `instanceOfCloudConnectCode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudConnectCodeCWProxy get copyWith => _$CloudConnectCodeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudConnectCode _$CloudConnectCodeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CloudConnectCode', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'expires_at']);
      final val = CloudConnectCode(
        code: $checkedConvert('code', (v) => v as String),
        expiresAt: $checkedConvert(
          'expires_at',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'expiresAt': 'expires_at'});

Map<String, dynamic> _$CloudConnectCodeToJson(CloudConnectCode instance) =>
    <String, dynamic>{
      'code': instance.code,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
