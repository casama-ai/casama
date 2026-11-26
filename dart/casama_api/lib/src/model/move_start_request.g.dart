// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_start_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveStartRequestCWProxy {
  MoveStartRequest targetUrl(String targetUrl);

  MoveStartRequest token(String token);

  MoveStartRequest bringKeys(bool? bringKeys);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveStartRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveStartRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveStartRequest call({String targetUrl, String token, bool? bringKeys});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveStartRequest.copyWith(...)` or call `instanceOfMoveStartRequest.copyWith.fieldName(value)` for a single field.
class _$MoveStartRequestCWProxyImpl implements _$MoveStartRequestCWProxy {
  const _$MoveStartRequestCWProxyImpl(this._value);

  final MoveStartRequest _value;

  @override
  MoveStartRequest targetUrl(String targetUrl) => call(targetUrl: targetUrl);

  @override
  MoveStartRequest token(String token) => call(token: token);

  @override
  MoveStartRequest bringKeys(bool? bringKeys) => call(bringKeys: bringKeys);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveStartRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveStartRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveStartRequest call({
    Object? targetUrl = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? bringKeys = const $CopyWithPlaceholder(),
  }) {
    return MoveStartRequest(
      targetUrl: targetUrl == const $CopyWithPlaceholder() || targetUrl == null
          ? _value.targetUrl
          // ignore: cast_nullable_to_non_nullable
          : targetUrl as String,
      token: token == const $CopyWithPlaceholder() || token == null
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
      bringKeys: bringKeys == const $CopyWithPlaceholder()
          ? _value.bringKeys
          // ignore: cast_nullable_to_non_nullable
          : bringKeys as bool?,
    );
  }
}

extension $MoveStartRequestCopyWith on MoveStartRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveStartRequest.copyWith(...)` or `instanceOfMoveStartRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveStartRequestCWProxy get copyWith => _$MoveStartRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveStartRequest _$MoveStartRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MoveStartRequest',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['target_url', 'token']);
        final val = MoveStartRequest(
          targetUrl: $checkedConvert('target_url', (v) => v as String),
          token: $checkedConvert('token', (v) => v as String),
          bringKeys: $checkedConvert('bring_keys', (v) => v as bool? ?? true),
        );
        return val;
      },
      fieldKeyMap: const {'targetUrl': 'target_url', 'bringKeys': 'bring_keys'},
    );

Map<String, dynamic> _$MoveStartRequestToJson(MoveStartRequest instance) =>
    <String, dynamic>{
      'target_url': instance.targetUrl,
      'token': instance.token,
      'bring_keys': ?instance.bringKeys,
    };
