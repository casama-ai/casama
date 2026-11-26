// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_check_after_reconnect_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveCheckAfterReconnectInnerCWProxy {
  MoveCheckAfterReconnectInner id(String id);

  MoveCheckAfterReconnectInner name(String name);

  MoveCheckAfterReconnectInner kind(String kind);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckAfterReconnectInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckAfterReconnectInner(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveCheckAfterReconnectInner call({String id, String name, String kind});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveCheckAfterReconnectInner.copyWith(...)` or call `instanceOfMoveCheckAfterReconnectInner.copyWith.fieldName(value)` for a single field.
class _$MoveCheckAfterReconnectInnerCWProxyImpl
    implements _$MoveCheckAfterReconnectInnerCWProxy {
  const _$MoveCheckAfterReconnectInnerCWProxyImpl(this._value);

  final MoveCheckAfterReconnectInner _value;

  @override
  MoveCheckAfterReconnectInner id(String id) => call(id: id);

  @override
  MoveCheckAfterReconnectInner name(String name) => call(name: name);

  @override
  MoveCheckAfterReconnectInner kind(String kind) => call(kind: kind);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckAfterReconnectInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckAfterReconnectInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveCheckAfterReconnectInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
  }) {
    return MoveCheckAfterReconnectInner(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as String,
    );
  }
}

extension $MoveCheckAfterReconnectInnerCopyWith
    on MoveCheckAfterReconnectInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveCheckAfterReconnectInner.copyWith(...)` or `instanceOfMoveCheckAfterReconnectInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveCheckAfterReconnectInnerCWProxy get copyWith =>
      _$MoveCheckAfterReconnectInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveCheckAfterReconnectInner _$MoveCheckAfterReconnectInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MoveCheckAfterReconnectInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'name', 'kind']);
  final val = MoveCheckAfterReconnectInner(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    kind: $checkedConvert('kind', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$MoveCheckAfterReconnectInnerToJson(
  MoveCheckAfterReconnectInner instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'kind': instance.kind,
};
