// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_check.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveCheckCWProxy {
  MoveCheck sizeBytes(num sizeBytes);

  MoveCheck estimateSeconds(num estimateSeconds);

  MoveCheck pauseSeconds(num pauseSeconds);

  MoveCheck longPause(bool longPause);

  MoveCheck counts(Map<String, num> counts);

  MoveCheck fit(MoveFit fit);

  MoveCheck updateFirst(MoveCheckUpdateFirstEnum? updateFirst);

  MoveCheck comes(List<String> comes);

  MoveCheck after(MoveCheckAfter after);

  MoveCheck target(MoveCheckTargetEnum target);

  MoveCheck alreadyMoved(MovedTo? alreadyMoved);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheck(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheck(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveCheck call({
    num sizeBytes,
    num estimateSeconds,
    num pauseSeconds,
    bool longPause,
    Map<String, num> counts,
    MoveFit fit,
    MoveCheckUpdateFirstEnum? updateFirst,
    List<String> comes,
    MoveCheckAfter after,
    MoveCheckTargetEnum target,
    MovedTo? alreadyMoved,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveCheck.copyWith(...)` or call `instanceOfMoveCheck.copyWith.fieldName(value)` for a single field.
class _$MoveCheckCWProxyImpl implements _$MoveCheckCWProxy {
  const _$MoveCheckCWProxyImpl(this._value);

  final MoveCheck _value;

  @override
  MoveCheck sizeBytes(num sizeBytes) => call(sizeBytes: sizeBytes);

  @override
  MoveCheck estimateSeconds(num estimateSeconds) =>
      call(estimateSeconds: estimateSeconds);

  @override
  MoveCheck pauseSeconds(num pauseSeconds) => call(pauseSeconds: pauseSeconds);

  @override
  MoveCheck longPause(bool longPause) => call(longPause: longPause);

  @override
  MoveCheck counts(Map<String, num> counts) => call(counts: counts);

  @override
  MoveCheck fit(MoveFit fit) => call(fit: fit);

  @override
  MoveCheck updateFirst(MoveCheckUpdateFirstEnum? updateFirst) =>
      call(updateFirst: updateFirst);

  @override
  MoveCheck comes(List<String> comes) => call(comes: comes);

  @override
  MoveCheck after(MoveCheckAfter after) => call(after: after);

  @override
  MoveCheck target(MoveCheckTargetEnum target) => call(target: target);

  @override
  MoveCheck alreadyMoved(MovedTo? alreadyMoved) =>
      call(alreadyMoved: alreadyMoved);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheck(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheck(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveCheck call({
    Object? sizeBytes = const $CopyWithPlaceholder(),
    Object? estimateSeconds = const $CopyWithPlaceholder(),
    Object? pauseSeconds = const $CopyWithPlaceholder(),
    Object? longPause = const $CopyWithPlaceholder(),
    Object? counts = const $CopyWithPlaceholder(),
    Object? fit = const $CopyWithPlaceholder(),
    Object? updateFirst = const $CopyWithPlaceholder(),
    Object? comes = const $CopyWithPlaceholder(),
    Object? after = const $CopyWithPlaceholder(),
    Object? target = const $CopyWithPlaceholder(),
    Object? alreadyMoved = const $CopyWithPlaceholder(),
  }) {
    return MoveCheck(
      sizeBytes: sizeBytes == const $CopyWithPlaceholder() || sizeBytes == null
          ? _value.sizeBytes
          // ignore: cast_nullable_to_non_nullable
          : sizeBytes as num,
      estimateSeconds:
          estimateSeconds == const $CopyWithPlaceholder() ||
              estimateSeconds == null
          ? _value.estimateSeconds
          // ignore: cast_nullable_to_non_nullable
          : estimateSeconds as num,
      pauseSeconds:
          pauseSeconds == const $CopyWithPlaceholder() || pauseSeconds == null
          ? _value.pauseSeconds
          // ignore: cast_nullable_to_non_nullable
          : pauseSeconds as num,
      longPause: longPause == const $CopyWithPlaceholder() || longPause == null
          ? _value.longPause
          // ignore: cast_nullable_to_non_nullable
          : longPause as bool,
      counts: counts == const $CopyWithPlaceholder() || counts == null
          ? _value.counts
          // ignore: cast_nullable_to_non_nullable
          : counts as Map<String, num>,
      fit: fit == const $CopyWithPlaceholder() || fit == null
          ? _value.fit
          // ignore: cast_nullable_to_non_nullable
          : fit as MoveFit,
      updateFirst: updateFirst == const $CopyWithPlaceholder()
          ? _value.updateFirst
          // ignore: cast_nullable_to_non_nullable
          : updateFirst as MoveCheckUpdateFirstEnum?,
      comes: comes == const $CopyWithPlaceholder() || comes == null
          ? _value.comes
          // ignore: cast_nullable_to_non_nullable
          : comes as List<String>,
      after: after == const $CopyWithPlaceholder() || after == null
          ? _value.after
          // ignore: cast_nullable_to_non_nullable
          : after as MoveCheckAfter,
      target: target == const $CopyWithPlaceholder() || target == null
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as MoveCheckTargetEnum,
      alreadyMoved: alreadyMoved == const $CopyWithPlaceholder()
          ? _value.alreadyMoved
          // ignore: cast_nullable_to_non_nullable
          : alreadyMoved as MovedTo?,
    );
  }
}

extension $MoveCheckCopyWith on MoveCheck {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveCheck.copyWith(...)` or `instanceOfMoveCheck.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveCheckCWProxy get copyWith => _$MoveCheckCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveCheck _$MoveCheckFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MoveCheck',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'size_bytes',
        'estimate_seconds',
        'pause_seconds',
        'long_pause',
        'counts',
        'fit',
        'update_first',
        'comes',
        'after',
        'target',
        'already_moved',
      ],
    );
    final val = MoveCheck(
      sizeBytes: $checkedConvert('size_bytes', (v) => v as num),
      estimateSeconds: $checkedConvert('estimate_seconds', (v) => v as num),
      pauseSeconds: $checkedConvert('pause_seconds', (v) => v as num),
      longPause: $checkedConvert('long_pause', (v) => v as bool),
      counts: $checkedConvert('counts', (v) => Map<String, num>.from(v as Map)),
      fit: $checkedConvert(
        'fit',
        (v) => MoveFit.fromJson(v as Map<String, dynamic>),
      ),
      updateFirst: $checkedConvert(
        'update_first',
        (v) => $enumDecodeNullable(_$MoveCheckUpdateFirstEnumEnumMap, v),
      ),
      comes: $checkedConvert(
        'comes',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      after: $checkedConvert(
        'after',
        (v) => MoveCheckAfter.fromJson(v as Map<String, dynamic>),
      ),
      target: $checkedConvert(
        'target',
        (v) => $enumDecode(_$MoveCheckTargetEnumEnumMap, v),
      ),
      alreadyMoved: $checkedConvert(
        'already_moved',
        (v) => v == null ? null : MovedTo.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'sizeBytes': 'size_bytes',
    'estimateSeconds': 'estimate_seconds',
    'pauseSeconds': 'pause_seconds',
    'longPause': 'long_pause',
    'updateFirst': 'update_first',
    'alreadyMoved': 'already_moved',
  },
);

Map<String, dynamic> _$MoveCheckToJson(MoveCheck instance) => <String, dynamic>{
  'size_bytes': instance.sizeBytes,
  'estimate_seconds': instance.estimateSeconds,
  'pause_seconds': instance.pauseSeconds,
  'long_pause': instance.longPause,
  'counts': instance.counts,
  'fit': instance.fit.toJson(),
  'update_first': _$MoveCheckUpdateFirstEnumEnumMap[instance.updateFirst],
  'comes': instance.comes,
  'after': instance.after.toJson(),
  'target': _$MoveCheckTargetEnumEnumMap[instance.target]!,
  'already_moved': instance.alreadyMoved?.toJson(),
};

const _$MoveCheckUpdateFirstEnumEnumMap = {
  MoveCheckUpdateFirstEnum.source_: 'source',
  MoveCheckUpdateFirstEnum.target: 'target',
};

const _$MoveCheckTargetEnumEnumMap = {
  MoveCheckTargetEnum.cloud: 'cloud',
  MoveCheckTargetEnum.server: 'server',
};
