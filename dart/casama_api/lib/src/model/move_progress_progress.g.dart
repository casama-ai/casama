// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_progress_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveProgressProgressCWProxy {
  MoveProgressProgress doneBytes(num doneBytes);

  MoveProgressProgress totalBytes(num totalBytes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveProgressProgress(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveProgressProgress(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveProgressProgress call({num doneBytes, num totalBytes});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveProgressProgress.copyWith(...)` or call `instanceOfMoveProgressProgress.copyWith.fieldName(value)` for a single field.
class _$MoveProgressProgressCWProxyImpl
    implements _$MoveProgressProgressCWProxy {
  const _$MoveProgressProgressCWProxyImpl(this._value);

  final MoveProgressProgress _value;

  @override
  MoveProgressProgress doneBytes(num doneBytes) => call(doneBytes: doneBytes);

  @override
  MoveProgressProgress totalBytes(num totalBytes) =>
      call(totalBytes: totalBytes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveProgressProgress(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveProgressProgress(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveProgressProgress call({
    Object? doneBytes = const $CopyWithPlaceholder(),
    Object? totalBytes = const $CopyWithPlaceholder(),
  }) {
    return MoveProgressProgress(
      doneBytes: doneBytes == const $CopyWithPlaceholder() || doneBytes == null
          ? _value.doneBytes
          // ignore: cast_nullable_to_non_nullable
          : doneBytes as num,
      totalBytes:
          totalBytes == const $CopyWithPlaceholder() || totalBytes == null
          ? _value.totalBytes
          // ignore: cast_nullable_to_non_nullable
          : totalBytes as num,
    );
  }
}

extension $MoveProgressProgressCopyWith on MoveProgressProgress {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveProgressProgress.copyWith(...)` or `instanceOfMoveProgressProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveProgressProgressCWProxy get copyWith =>
      _$MoveProgressProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveProgressProgress _$MoveProgressProgressFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MoveProgressProgress', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['done_bytes', 'total_bytes']);
  final val = MoveProgressProgress(
    doneBytes: $checkedConvert('done_bytes', (v) => v as num),
    totalBytes: $checkedConvert('total_bytes', (v) => v as num),
  );
  return val;
}, fieldKeyMap: const {'doneBytes': 'done_bytes', 'totalBytes': 'total_bytes'});

Map<String, dynamic> _$MoveProgressProgressToJson(
  MoveProgressProgress instance,
) => <String, dynamic>{
  'done_bytes': instance.doneBytes,
  'total_bytes': instance.totalBytes,
};
