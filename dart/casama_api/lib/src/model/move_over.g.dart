// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_over.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveOverCWProxy {
  MoveOver what(MoveOverWhatEnum what);

  MoveOver have(num have);

  MoveOver limit(num limit);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveOver(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveOver(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveOver call({MoveOverWhatEnum what, num have, num limit});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveOver.copyWith(...)` or call `instanceOfMoveOver.copyWith.fieldName(value)` for a single field.
class _$MoveOverCWProxyImpl implements _$MoveOverCWProxy {
  const _$MoveOverCWProxyImpl(this._value);

  final MoveOver _value;

  @override
  MoveOver what(MoveOverWhatEnum what) => call(what: what);

  @override
  MoveOver have(num have) => call(have: have);

  @override
  MoveOver limit(num limit) => call(limit: limit);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveOver(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveOver(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveOver call({
    Object? what = const $CopyWithPlaceholder(),
    Object? have = const $CopyWithPlaceholder(),
    Object? limit = const $CopyWithPlaceholder(),
  }) {
    return MoveOver(
      what: what == const $CopyWithPlaceholder() || what == null
          ? _value.what
          // ignore: cast_nullable_to_non_nullable
          : what as MoveOverWhatEnum,
      have: have == const $CopyWithPlaceholder() || have == null
          ? _value.have
          // ignore: cast_nullable_to_non_nullable
          : have as num,
      limit: limit == const $CopyWithPlaceholder() || limit == null
          ? _value.limit
          // ignore: cast_nullable_to_non_nullable
          : limit as num,
    );
  }
}

extension $MoveOverCopyWith on MoveOver {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveOver.copyWith(...)` or `instanceOfMoveOver.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveOverCWProxy get copyWith => _$MoveOverCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveOver _$MoveOverFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveOver', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['what', 'have', 'limit']);
      final val = MoveOver(
        what: $checkedConvert(
          'what',
          (v) => $enumDecode(_$MoveOverWhatEnumEnumMap, v),
        ),
        have: $checkedConvert('have', (v) => v as num),
        limit: $checkedConvert('limit', (v) => v as num),
      );
      return val;
    });

Map<String, dynamic> _$MoveOverToJson(MoveOver instance) => <String, dynamic>{
  'what': _$MoveOverWhatEnumEnumMap[instance.what]!,
  'have': instance.have,
  'limit': instance.limit,
};

const _$MoveOverWhatEnumEnumMap = {
  MoveOverWhatEnum.people: 'people',
  MoveOverWhatEnum.bots: 'bots',
  MoveOverWhatEnum.computers: 'computers',
  MoveOverWhatEnum.storage: 'storage',
};
