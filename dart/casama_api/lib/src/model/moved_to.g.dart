// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moved_to.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MovedToCWProxy {
  MovedTo url(String url);

  MovedTo at(DateTime at);

  MovedTo moveId(String moveId);

  MovedTo target(MovedToTargetEnum target);

  MovedTo message(String message);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MovedTo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MovedTo(...).copyWith(id: 12, name: "My name")
  /// ```
  MovedTo call({
    String url,
    DateTime at,
    String moveId,
    MovedToTargetEnum target,
    String message,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMovedTo.copyWith(...)` or call `instanceOfMovedTo.copyWith.fieldName(value)` for a single field.
class _$MovedToCWProxyImpl implements _$MovedToCWProxy {
  const _$MovedToCWProxyImpl(this._value);

  final MovedTo _value;

  @override
  MovedTo url(String url) => call(url: url);

  @override
  MovedTo at(DateTime at) => call(at: at);

  @override
  MovedTo moveId(String moveId) => call(moveId: moveId);

  @override
  MovedTo target(MovedToTargetEnum target) => call(target: target);

  @override
  MovedTo message(String message) => call(message: message);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MovedTo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MovedTo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MovedTo call({
    Object? url = const $CopyWithPlaceholder(),
    Object? at = const $CopyWithPlaceholder(),
    Object? moveId = const $CopyWithPlaceholder(),
    Object? target = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return MovedTo(
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      at: at == const $CopyWithPlaceholder() || at == null
          ? _value.at
          // ignore: cast_nullable_to_non_nullable
          : at as DateTime,
      moveId: moveId == const $CopyWithPlaceholder() || moveId == null
          ? _value.moveId
          // ignore: cast_nullable_to_non_nullable
          : moveId as String,
      target: target == const $CopyWithPlaceholder() || target == null
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as MovedToTargetEnum,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $MovedToCopyWith on MovedTo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMovedTo.copyWith(...)` or `instanceOfMovedTo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MovedToCWProxy get copyWith => _$MovedToCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovedTo _$MovedToFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MovedTo', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['url', 'at', 'move_id', 'target', 'message'],
      );
      final val = MovedTo(
        url: $checkedConvert('url', (v) => v as String),
        at: $checkedConvert('at', (v) => DateTime.parse(v as String)),
        moveId: $checkedConvert('move_id', (v) => v as String),
        target: $checkedConvert(
          'target',
          (v) => $enumDecode(_$MovedToTargetEnumEnumMap, v),
        ),
        message: $checkedConvert('message', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'moveId': 'move_id'});

Map<String, dynamic> _$MovedToToJson(MovedTo instance) => <String, dynamic>{
  'url': instance.url,
  'at': instance.at.toIso8601String(),
  'move_id': instance.moveId,
  'target': _$MovedToTargetEnumEnumMap[instance.target]!,
  'message': instance.message,
};

const _$MovedToTargetEnumEnumMap = {
  MovedToTargetEnum.cloud: 'cloud',
  MovedToTargetEnum.server: 'server',
};
