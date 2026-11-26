// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_part_received.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MovePartReceivedCWProxy {
  MovePartReceived n(int n);

  MovePartReceived size(int size);

  MovePartReceived sha256(String sha256);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MovePartReceived(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MovePartReceived(...).copyWith(id: 12, name: "My name")
  /// ```
  MovePartReceived call({int n, int size, String sha256});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMovePartReceived.copyWith(...)` or call `instanceOfMovePartReceived.copyWith.fieldName(value)` for a single field.
class _$MovePartReceivedCWProxyImpl implements _$MovePartReceivedCWProxy {
  const _$MovePartReceivedCWProxyImpl(this._value);

  final MovePartReceived _value;

  @override
  MovePartReceived n(int n) => call(n: n);

  @override
  MovePartReceived size(int size) => call(size: size);

  @override
  MovePartReceived sha256(String sha256) => call(sha256: sha256);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MovePartReceived(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MovePartReceived(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MovePartReceived call({
    Object? n = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? sha256 = const $CopyWithPlaceholder(),
  }) {
    return MovePartReceived(
      n: n == const $CopyWithPlaceholder() || n == null
          ? _value.n
          // ignore: cast_nullable_to_non_nullable
          : n as int,
      size: size == const $CopyWithPlaceholder() || size == null
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      sha256: sha256 == const $CopyWithPlaceholder() || sha256 == null
          ? _value.sha256
          // ignore: cast_nullable_to_non_nullable
          : sha256 as String,
    );
  }
}

extension $MovePartReceivedCopyWith on MovePartReceived {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMovePartReceived.copyWith(...)` or `instanceOfMovePartReceived.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MovePartReceivedCWProxy get copyWith => _$MovePartReceivedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovePartReceived _$MovePartReceivedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MovePartReceived', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['n', 'size', 'sha256']);
      final val = MovePartReceived(
        n: $checkedConvert('n', (v) => (v as num).toInt()),
        size: $checkedConvert('size', (v) => (v as num).toInt()),
        sha256: $checkedConvert('sha256', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MovePartReceivedToJson(MovePartReceived instance) =>
    <String, dynamic>{
      'n': instance.n,
      'size': instance.size,
      'sha256': instance.sha256,
    };
