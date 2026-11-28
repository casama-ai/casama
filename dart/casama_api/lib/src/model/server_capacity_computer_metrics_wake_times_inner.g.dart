// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_capacity_computer_metrics_wake_times_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerCapacityComputerMetricsWakeTimesInnerCWProxy {
  ServerCapacityComputerMetricsWakeTimesInner mode(String mode);

  ServerCapacityComputerMetricsWakeTimesInner count(int count);

  ServerCapacityComputerMetricsWakeTimesInner p50Ms(int p50Ms);

  ServerCapacityComputerMetricsWakeTimesInner p90Ms(int p90Ms);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetricsWakeTimesInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetricsWakeTimesInner(...).copyWith(id: 12, name: "My name")
  /// ```
  ServerCapacityComputerMetricsWakeTimesInner call({
    String mode,
    int count,
    int p50Ms,
    int p90Ms,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfServerCapacityComputerMetricsWakeTimesInner.copyWith(...)` or call `instanceOfServerCapacityComputerMetricsWakeTimesInner.copyWith.fieldName(value)` for a single field.
class _$ServerCapacityComputerMetricsWakeTimesInnerCWProxyImpl
    implements _$ServerCapacityComputerMetricsWakeTimesInnerCWProxy {
  const _$ServerCapacityComputerMetricsWakeTimesInnerCWProxyImpl(this._value);

  final ServerCapacityComputerMetricsWakeTimesInner _value;

  @override
  ServerCapacityComputerMetricsWakeTimesInner mode(String mode) =>
      call(mode: mode);

  @override
  ServerCapacityComputerMetricsWakeTimesInner count(int count) =>
      call(count: count);

  @override
  ServerCapacityComputerMetricsWakeTimesInner p50Ms(int p50Ms) =>
      call(p50Ms: p50Ms);

  @override
  ServerCapacityComputerMetricsWakeTimesInner p90Ms(int p90Ms) =>
      call(p90Ms: p90Ms);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetricsWakeTimesInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetricsWakeTimesInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ServerCapacityComputerMetricsWakeTimesInner call({
    Object? mode = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? p50Ms = const $CopyWithPlaceholder(),
    Object? p90Ms = const $CopyWithPlaceholder(),
  }) {
    return ServerCapacityComputerMetricsWakeTimesInner(
      mode: mode == const $CopyWithPlaceholder() || mode == null
          ? _value.mode
          // ignore: cast_nullable_to_non_nullable
          : mode as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
      p50Ms: p50Ms == const $CopyWithPlaceholder() || p50Ms == null
          ? _value.p50Ms
          // ignore: cast_nullable_to_non_nullable
          : p50Ms as int,
      p90Ms: p90Ms == const $CopyWithPlaceholder() || p90Ms == null
          ? _value.p90Ms
          // ignore: cast_nullable_to_non_nullable
          : p90Ms as int,
    );
  }
}

extension $ServerCapacityComputerMetricsWakeTimesInnerCopyWith
    on ServerCapacityComputerMetricsWakeTimesInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfServerCapacityComputerMetricsWakeTimesInner.copyWith(...)` or `instanceOfServerCapacityComputerMetricsWakeTimesInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerCapacityComputerMetricsWakeTimesInnerCWProxy get copyWith =>
      _$ServerCapacityComputerMetricsWakeTimesInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerCapacityComputerMetricsWakeTimesInner
_$ServerCapacityComputerMetricsWakeTimesInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ServerCapacityComputerMetricsWakeTimesInner', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['mode', 'count', 'p50_ms', 'p90_ms']);
  final val = ServerCapacityComputerMetricsWakeTimesInner(
    mode: $checkedConvert('mode', (v) => v as String),
    count: $checkedConvert('count', (v) => (v as num).toInt()),
    p50Ms: $checkedConvert('p50_ms', (v) => (v as num).toInt()),
    p90Ms: $checkedConvert('p90_ms', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'p50Ms': 'p50_ms', 'p90Ms': 'p90_ms'});

Map<String, dynamic> _$ServerCapacityComputerMetricsWakeTimesInnerToJson(
  ServerCapacityComputerMetricsWakeTimesInner instance,
) => <String, dynamic>{
  'mode': instance.mode,
  'count': instance.count,
  'p50_ms': instance.p50Ms,
  'p90_ms': instance.p90Ms,
};
