// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_pool.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HealthPoolCWProxy {
  HealthPool max(int max);

  HealthPool inUse(int inUse);

  HealthPool waiting(int waiting);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `HealthPool(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HealthPool(...).copyWith(id: 12, name: "My name")
  /// ```
  HealthPool call({int max, int inUse, int waiting});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfHealthPool.copyWith(...)` or call `instanceOfHealthPool.copyWith.fieldName(value)` for a single field.
class _$HealthPoolCWProxyImpl implements _$HealthPoolCWProxy {
  const _$HealthPoolCWProxyImpl(this._value);

  final HealthPool _value;

  @override
  HealthPool max(int max) => call(max: max);

  @override
  HealthPool inUse(int inUse) => call(inUse: inUse);

  @override
  HealthPool waiting(int waiting) => call(waiting: waiting);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `HealthPool(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HealthPool(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  HealthPool call({
    Object? max = const $CopyWithPlaceholder(),
    Object? inUse = const $CopyWithPlaceholder(),
    Object? waiting = const $CopyWithPlaceholder(),
  }) {
    return HealthPool(
      max: max == const $CopyWithPlaceholder() || max == null
          ? _value.max
          // ignore: cast_nullable_to_non_nullable
          : max as int,
      inUse: inUse == const $CopyWithPlaceholder() || inUse == null
          ? _value.inUse
          // ignore: cast_nullable_to_non_nullable
          : inUse as int,
      waiting: waiting == const $CopyWithPlaceholder() || waiting == null
          ? _value.waiting
          // ignore: cast_nullable_to_non_nullable
          : waiting as int,
    );
  }
}

extension $HealthPoolCopyWith on HealthPool {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfHealthPool.copyWith(...)` or `instanceOfHealthPool.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HealthPoolCWProxy get copyWith => _$HealthPoolCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthPool _$HealthPoolFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HealthPool', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['max', 'in_use', 'waiting']);
      final val = HealthPool(
        max: $checkedConvert('max', (v) => (v as num).toInt()),
        inUse: $checkedConvert('in_use', (v) => (v as num).toInt()),
        waiting: $checkedConvert('waiting', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'inUse': 'in_use'});

Map<String, dynamic> _$HealthPoolToJson(HealthPool instance) =>
    <String, dynamic>{
      'max': instance.max,
      'in_use': instance.inUse,
      'waiting': instance.waiting,
    };
