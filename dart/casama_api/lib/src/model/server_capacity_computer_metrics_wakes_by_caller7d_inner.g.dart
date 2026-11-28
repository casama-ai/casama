// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_capacity_computer_metrics_wakes_by_caller7d_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerCapacityComputerMetricsWakesByCaller7dInnerCWProxy {
  ServerCapacityComputerMetricsWakesByCaller7dInner caller(String caller);

  ServerCapacityComputerMetricsWakesByCaller7dInner count(int count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetricsWakesByCaller7dInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetricsWakesByCaller7dInner(...).copyWith(id: 12, name: "My name")
  /// ```
  ServerCapacityComputerMetricsWakesByCaller7dInner call({
    String caller,
    int count,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfServerCapacityComputerMetricsWakesByCaller7dInner.copyWith(...)` or call `instanceOfServerCapacityComputerMetricsWakesByCaller7dInner.copyWith.fieldName(value)` for a single field.
class _$ServerCapacityComputerMetricsWakesByCaller7dInnerCWProxyImpl
    implements _$ServerCapacityComputerMetricsWakesByCaller7dInnerCWProxy {
  const _$ServerCapacityComputerMetricsWakesByCaller7dInnerCWProxyImpl(
    this._value,
  );

  final ServerCapacityComputerMetricsWakesByCaller7dInner _value;

  @override
  ServerCapacityComputerMetricsWakesByCaller7dInner caller(String caller) =>
      call(caller: caller);

  @override
  ServerCapacityComputerMetricsWakesByCaller7dInner count(int count) =>
      call(count: count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetricsWakesByCaller7dInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetricsWakesByCaller7dInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ServerCapacityComputerMetricsWakesByCaller7dInner call({
    Object? caller = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return ServerCapacityComputerMetricsWakesByCaller7dInner(
      caller: caller == const $CopyWithPlaceholder() || caller == null
          ? _value.caller
          // ignore: cast_nullable_to_non_nullable
          : caller as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
    );
  }
}

extension $ServerCapacityComputerMetricsWakesByCaller7dInnerCopyWith
    on ServerCapacityComputerMetricsWakesByCaller7dInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfServerCapacityComputerMetricsWakesByCaller7dInner.copyWith(...)` or `instanceOfServerCapacityComputerMetricsWakesByCaller7dInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerCapacityComputerMetricsWakesByCaller7dInnerCWProxy get copyWith =>
      _$ServerCapacityComputerMetricsWakesByCaller7dInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerCapacityComputerMetricsWakesByCaller7dInner
_$ServerCapacityComputerMetricsWakesByCaller7dInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ServerCapacityComputerMetricsWakesByCaller7dInner', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['caller', 'count']);
  final val = ServerCapacityComputerMetricsWakesByCaller7dInner(
    caller: $checkedConvert('caller', (v) => v as String),
    count: $checkedConvert('count', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$ServerCapacityComputerMetricsWakesByCaller7dInnerToJson(
  ServerCapacityComputerMetricsWakesByCaller7dInner instance,
) => <String, dynamic>{'caller': instance.caller, 'count': instance.count};
