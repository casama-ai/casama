// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_token.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveTokenCWProxy {
  MoveToken moveId(String moveId);

  MoveToken token(String token);

  MoveToken expiresAt(DateTime expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveToken(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveToken(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveToken call({String moveId, String token, DateTime expiresAt});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveToken.copyWith(...)` or call `instanceOfMoveToken.copyWith.fieldName(value)` for a single field.
class _$MoveTokenCWProxyImpl implements _$MoveTokenCWProxy {
  const _$MoveTokenCWProxyImpl(this._value);

  final MoveToken _value;

  @override
  MoveToken moveId(String moveId) => call(moveId: moveId);

  @override
  MoveToken token(String token) => call(token: token);

  @override
  MoveToken expiresAt(DateTime expiresAt) => call(expiresAt: expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveToken(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveToken(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveToken call({
    Object? moveId = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return MoveToken(
      moveId: moveId == const $CopyWithPlaceholder() || moveId == null
          ? _value.moveId
          // ignore: cast_nullable_to_non_nullable
          : moveId as String,
      token: token == const $CopyWithPlaceholder() || token == null
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
      expiresAt: expiresAt == const $CopyWithPlaceholder() || expiresAt == null
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $MoveTokenCopyWith on MoveToken {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveToken.copyWith(...)` or `instanceOfMoveToken.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveTokenCWProxy get copyWith => _$MoveTokenCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveToken _$MoveTokenFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveToken', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['move_id', 'token', 'expires_at']);
      final val = MoveToken(
        moveId: $checkedConvert('move_id', (v) => v as String),
        token: $checkedConvert('token', (v) => v as String),
        expiresAt: $checkedConvert(
          'expires_at',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'moveId': 'move_id', 'expiresAt': 'expires_at'});

Map<String, dynamic> _$MoveTokenToJson(MoveToken instance) => <String, dynamic>{
  'move_id': instance.moveId,
  'token': instance.token,
  'expires_at': instance.expiresAt.toIso8601String(),
};
