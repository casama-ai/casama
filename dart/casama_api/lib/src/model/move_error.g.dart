// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveErrorCWProxy {
  MoveError code(String code);

  MoveError message(String message);

  MoveError step(String? step);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveError(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveError(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveError call({String code, String message, String? step});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveError.copyWith(...)` or call `instanceOfMoveError.copyWith.fieldName(value)` for a single field.
class _$MoveErrorCWProxyImpl implements _$MoveErrorCWProxy {
  const _$MoveErrorCWProxyImpl(this._value);

  final MoveError _value;

  @override
  MoveError code(String code) => call(code: code);

  @override
  MoveError message(String message) => call(message: message);

  @override
  MoveError step(String? step) => call(step: step);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveError(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveError(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveError call({
    Object? code = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? step = const $CopyWithPlaceholder(),
  }) {
    return MoveError(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      step: step == const $CopyWithPlaceholder()
          ? _value.step
          // ignore: cast_nullable_to_non_nullable
          : step as String?,
    );
  }
}

extension $MoveErrorCopyWith on MoveError {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveError.copyWith(...)` or `instanceOfMoveError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveErrorCWProxy get copyWith => _$MoveErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveError _$MoveErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveError', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'message']);
      final val = MoveError(
        code: $checkedConvert('code', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String),
        step: $checkedConvert('step', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$MoveErrorToJson(MoveError instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'step': ?instance.step,
};
