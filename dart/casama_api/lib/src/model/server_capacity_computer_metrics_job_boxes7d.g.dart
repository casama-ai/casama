// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_capacity_computer_metrics_job_boxes7d.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerCapacityComputerMetricsJobBoxes7dCWProxy {
  ServerCapacityComputerMetricsJobBoxes7d count(int count);

  ServerCapacityComputerMetricsJobBoxes7d p50Ms(int? p50Ms);

  ServerCapacityComputerMetricsJobBoxes7d p90Ms(int? p90Ms);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetricsJobBoxes7d(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetricsJobBoxes7d(...).copyWith(id: 12, name: "My name")
  /// ```
  ServerCapacityComputerMetricsJobBoxes7d call({
    int count,
    int? p50Ms,
    int? p90Ms,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfServerCapacityComputerMetricsJobBoxes7d.copyWith(...)` or call `instanceOfServerCapacityComputerMetricsJobBoxes7d.copyWith.fieldName(value)` for a single field.
class _$ServerCapacityComputerMetricsJobBoxes7dCWProxyImpl
    implements _$ServerCapacityComputerMetricsJobBoxes7dCWProxy {
  const _$ServerCapacityComputerMetricsJobBoxes7dCWProxyImpl(this._value);

  final ServerCapacityComputerMetricsJobBoxes7d _value;

  @override
  ServerCapacityComputerMetricsJobBoxes7d count(int count) =>
      call(count: count);

  @override
  ServerCapacityComputerMetricsJobBoxes7d p50Ms(int? p50Ms) =>
      call(p50Ms: p50Ms);

  @override
  ServerCapacityComputerMetricsJobBoxes7d p90Ms(int? p90Ms) =>
      call(p90Ms: p90Ms);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetricsJobBoxes7d(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetricsJobBoxes7d(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ServerCapacityComputerMetricsJobBoxes7d call({
    Object? count = const $CopyWithPlaceholder(),
    Object? p50Ms = const $CopyWithPlaceholder(),
    Object? p90Ms = const $CopyWithPlaceholder(),
  }) {
    return ServerCapacityComputerMetricsJobBoxes7d(
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
      p50Ms: p50Ms == const $CopyWithPlaceholder()
          ? _value.p50Ms
          // ignore: cast_nullable_to_non_nullable
          : p50Ms as int?,
      p90Ms: p90Ms == const $CopyWithPlaceholder()
          ? _value.p90Ms
          // ignore: cast_nullable_to_non_nullable
          : p90Ms as int?,
    );
  }
}

extension $ServerCapacityComputerMetricsJobBoxes7dCopyWith
    on ServerCapacityComputerMetricsJobBoxes7d {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfServerCapacityComputerMetricsJobBoxes7d.copyWith(...)` or `instanceOfServerCapacityComputerMetricsJobBoxes7d.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerCapacityComputerMetricsJobBoxes7dCWProxy get copyWith =>
      _$ServerCapacityComputerMetricsJobBoxes7dCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerCapacityComputerMetricsJobBoxes7d
_$ServerCapacityComputerMetricsJobBoxes7dFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ServerCapacityComputerMetricsJobBoxes7d', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['count', 'p50_ms', 'p90_ms']);
      final val = ServerCapacityComputerMetricsJobBoxes7d(
        count: $checkedConvert('count', (v) => (v as num).toInt()),
        p50Ms: $checkedConvert('p50_ms', (v) => (v as num?)?.toInt()),
        p90Ms: $checkedConvert('p90_ms', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'p50Ms': 'p50_ms', 'p90Ms': 'p90_ms'});

Map<String, dynamic> _$ServerCapacityComputerMetricsJobBoxes7dToJson(
  ServerCapacityComputerMetricsJobBoxes7d instance,
) => <String, dynamic>{
  'count': instance.count,
  'p50_ms': instance.p50Ms,
  'p90_ms': instance.p90Ms,
};
