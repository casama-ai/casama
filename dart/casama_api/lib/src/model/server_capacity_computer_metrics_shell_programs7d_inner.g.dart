// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_capacity_computer_metrics_shell_programs7d_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerCapacityComputerMetricsShellPrograms7dInnerCWProxy {
  ServerCapacityComputerMetricsShellPrograms7dInner program(String program);

  ServerCapacityComputerMetricsShellPrograms7dInner count(int count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetricsShellPrograms7dInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetricsShellPrograms7dInner(...).copyWith(id: 12, name: "My name")
  /// ```
  ServerCapacityComputerMetricsShellPrograms7dInner call({
    String program,
    int count,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfServerCapacityComputerMetricsShellPrograms7dInner.copyWith(...)` or call `instanceOfServerCapacityComputerMetricsShellPrograms7dInner.copyWith.fieldName(value)` for a single field.
class _$ServerCapacityComputerMetricsShellPrograms7dInnerCWProxyImpl
    implements _$ServerCapacityComputerMetricsShellPrograms7dInnerCWProxy {
  const _$ServerCapacityComputerMetricsShellPrograms7dInnerCWProxyImpl(
    this._value,
  );

  final ServerCapacityComputerMetricsShellPrograms7dInner _value;

  @override
  ServerCapacityComputerMetricsShellPrograms7dInner program(String program) =>
      call(program: program);

  @override
  ServerCapacityComputerMetricsShellPrograms7dInner count(int count) =>
      call(count: count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetricsShellPrograms7dInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetricsShellPrograms7dInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ServerCapacityComputerMetricsShellPrograms7dInner call({
    Object? program = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return ServerCapacityComputerMetricsShellPrograms7dInner(
      program: program == const $CopyWithPlaceholder() || program == null
          ? _value.program
          // ignore: cast_nullable_to_non_nullable
          : program as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
    );
  }
}

extension $ServerCapacityComputerMetricsShellPrograms7dInnerCopyWith
    on ServerCapacityComputerMetricsShellPrograms7dInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfServerCapacityComputerMetricsShellPrograms7dInner.copyWith(...)` or `instanceOfServerCapacityComputerMetricsShellPrograms7dInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerCapacityComputerMetricsShellPrograms7dInnerCWProxy get copyWith =>
      _$ServerCapacityComputerMetricsShellPrograms7dInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerCapacityComputerMetricsShellPrograms7dInner
_$ServerCapacityComputerMetricsShellPrograms7dInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ServerCapacityComputerMetricsShellPrograms7dInner', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['program', 'count']);
  final val = ServerCapacityComputerMetricsShellPrograms7dInner(
    program: $checkedConvert('program', (v) => v as String),
    count: $checkedConvert('count', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$ServerCapacityComputerMetricsShellPrograms7dInnerToJson(
  ServerCapacityComputerMetricsShellPrograms7dInner instance,
) => <String, dynamic>{'program': instance.program, 'count': instance.count};
