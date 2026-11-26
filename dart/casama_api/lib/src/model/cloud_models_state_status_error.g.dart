// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_state_status_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsStateStatusErrorCWProxy {
  CloudModelsStateStatusError code(String code);

  CloudModelsStateStatusError message(String message);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsStateStatusError(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsStateStatusError(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsStateStatusError call({String code, String message});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsStateStatusError.copyWith(...)` or call `instanceOfCloudModelsStateStatusError.copyWith.fieldName(value)` for a single field.
class _$CloudModelsStateStatusErrorCWProxyImpl
    implements _$CloudModelsStateStatusErrorCWProxy {
  const _$CloudModelsStateStatusErrorCWProxyImpl(this._value);

  final CloudModelsStateStatusError _value;

  @override
  CloudModelsStateStatusError code(String code) => call(code: code);

  @override
  CloudModelsStateStatusError message(String message) => call(message: message);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsStateStatusError(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsStateStatusError(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsStateStatusError call({
    Object? code = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsStateStatusError(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $CloudModelsStateStatusErrorCopyWith on CloudModelsStateStatusError {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsStateStatusError.copyWith(...)` or `instanceOfCloudModelsStateStatusError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsStateStatusErrorCWProxy get copyWith =>
      _$CloudModelsStateStatusErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsStateStatusError _$CloudModelsStateStatusErrorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsStateStatusError', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['code', 'message']);
  final val = CloudModelsStateStatusError(
    code: $checkedConvert('code', (v) => v as String),
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$CloudModelsStateStatusErrorToJson(
  CloudModelsStateStatusError instance,
) => <String, dynamic>{'code': instance.code, 'message': instance.message};
