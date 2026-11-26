// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_check_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveCheckRequestCWProxy {
  MoveCheckRequest targetUrl(String targetUrl);

  MoveCheckRequest token(String token);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveCheckRequest call({String targetUrl, String token});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveCheckRequest.copyWith(...)` or call `instanceOfMoveCheckRequest.copyWith.fieldName(value)` for a single field.
class _$MoveCheckRequestCWProxyImpl implements _$MoveCheckRequestCWProxy {
  const _$MoveCheckRequestCWProxyImpl(this._value);

  final MoveCheckRequest _value;

  @override
  MoveCheckRequest targetUrl(String targetUrl) => call(targetUrl: targetUrl);

  @override
  MoveCheckRequest token(String token) => call(token: token);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveCheckRequest call({
    Object? targetUrl = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return MoveCheckRequest(
      targetUrl: targetUrl == const $CopyWithPlaceholder() || targetUrl == null
          ? _value.targetUrl
          // ignore: cast_nullable_to_non_nullable
          : targetUrl as String,
      token: token == const $CopyWithPlaceholder() || token == null
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
    );
  }
}

extension $MoveCheckRequestCopyWith on MoveCheckRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveCheckRequest.copyWith(...)` or `instanceOfMoveCheckRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveCheckRequestCWProxy get copyWith => _$MoveCheckRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveCheckRequest _$MoveCheckRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveCheckRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['target_url', 'token']);
      final val = MoveCheckRequest(
        targetUrl: $checkedConvert('target_url', (v) => v as String),
        token: $checkedConvert('token', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'targetUrl': 'target_url'});

Map<String, dynamic> _$MoveCheckRequestToJson(MoveCheckRequest instance) =>
    <String, dynamic>{
      'target_url': instance.targetUrl,
      'token': instance.token,
    };
