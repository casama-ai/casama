// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_capacity_computer_metrics.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerCapacityComputerMetricsCWProxy {
  ServerCapacityComputerMetrics wakeTimes(
    List<ServerCapacityComputerMetricsWakeTimesInner> wakeTimes,
  );

  ServerCapacityComputerMetrics browserOoms7d(int browserOoms7d);

  ServerCapacityComputerMetrics wakesByCaller7d(
    List<ServerCapacityComputerMetricsWakesByCaller7dInner> wakesByCaller7d,
  );

  ServerCapacityComputerMetrics shellPrograms7d(
    List<ServerCapacityComputerMetricsShellPrograms7dInner> shellPrograms7d,
  );

  ServerCapacityComputerMetrics jobBoxes7d(
    ServerCapacityComputerMetricsJobBoxes7d jobBoxes7d,
  );

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetrics(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetrics(...).copyWith(id: 12, name: "My name")
  /// ```
  ServerCapacityComputerMetrics call({
    List<ServerCapacityComputerMetricsWakeTimesInner> wakeTimes,
    int browserOoms7d,
    List<ServerCapacityComputerMetricsWakesByCaller7dInner> wakesByCaller7d,
    List<ServerCapacityComputerMetricsShellPrograms7dInner> shellPrograms7d,
    ServerCapacityComputerMetricsJobBoxes7d jobBoxes7d,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfServerCapacityComputerMetrics.copyWith(...)` or call `instanceOfServerCapacityComputerMetrics.copyWith.fieldName(value)` for a single field.
class _$ServerCapacityComputerMetricsCWProxyImpl
    implements _$ServerCapacityComputerMetricsCWProxy {
  const _$ServerCapacityComputerMetricsCWProxyImpl(this._value);

  final ServerCapacityComputerMetrics _value;

  @override
  ServerCapacityComputerMetrics wakeTimes(
    List<ServerCapacityComputerMetricsWakeTimesInner> wakeTimes,
  ) => call(wakeTimes: wakeTimes);

  @override
  ServerCapacityComputerMetrics browserOoms7d(int browserOoms7d) =>
      call(browserOoms7d: browserOoms7d);

  @override
  ServerCapacityComputerMetrics wakesByCaller7d(
    List<ServerCapacityComputerMetricsWakesByCaller7dInner> wakesByCaller7d,
  ) => call(wakesByCaller7d: wakesByCaller7d);

  @override
  ServerCapacityComputerMetrics shellPrograms7d(
    List<ServerCapacityComputerMetricsShellPrograms7dInner> shellPrograms7d,
  ) => call(shellPrograms7d: shellPrograms7d);

  @override
  ServerCapacityComputerMetrics jobBoxes7d(
    ServerCapacityComputerMetricsJobBoxes7d jobBoxes7d,
  ) => call(jobBoxes7d: jobBoxes7d);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ServerCapacityComputerMetrics(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ServerCapacityComputerMetrics(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ServerCapacityComputerMetrics call({
    Object? wakeTimes = const $CopyWithPlaceholder(),
    Object? browserOoms7d = const $CopyWithPlaceholder(),
    Object? wakesByCaller7d = const $CopyWithPlaceholder(),
    Object? shellPrograms7d = const $CopyWithPlaceholder(),
    Object? jobBoxes7d = const $CopyWithPlaceholder(),
  }) {
    return ServerCapacityComputerMetrics(
      wakeTimes: wakeTimes == const $CopyWithPlaceholder() || wakeTimes == null
          ? _value.wakeTimes
          // ignore: cast_nullable_to_non_nullable
          : wakeTimes as List<ServerCapacityComputerMetricsWakeTimesInner>,
      browserOoms7d:
          browserOoms7d == const $CopyWithPlaceholder() || browserOoms7d == null
          ? _value.browserOoms7d
          // ignore: cast_nullable_to_non_nullable
          : browserOoms7d as int,
      wakesByCaller7d:
          wakesByCaller7d == const $CopyWithPlaceholder() ||
              wakesByCaller7d == null
          ? _value.wakesByCaller7d
          // ignore: cast_nullable_to_non_nullable
          : wakesByCaller7d
                as List<ServerCapacityComputerMetricsWakesByCaller7dInner>,
      shellPrograms7d:
          shellPrograms7d == const $CopyWithPlaceholder() ||
              shellPrograms7d == null
          ? _value.shellPrograms7d
          // ignore: cast_nullable_to_non_nullable
          : shellPrograms7d
                as List<ServerCapacityComputerMetricsShellPrograms7dInner>,
      jobBoxes7d:
          jobBoxes7d == const $CopyWithPlaceholder() || jobBoxes7d == null
          ? _value.jobBoxes7d
          // ignore: cast_nullable_to_non_nullable
          : jobBoxes7d as ServerCapacityComputerMetricsJobBoxes7d,
    );
  }
}

extension $ServerCapacityComputerMetricsCopyWith
    on ServerCapacityComputerMetrics {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfServerCapacityComputerMetrics.copyWith(...)` or `instanceOfServerCapacityComputerMetrics.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerCapacityComputerMetricsCWProxy get copyWith =>
      _$ServerCapacityComputerMetricsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerCapacityComputerMetrics _$ServerCapacityComputerMetricsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapacityComputerMetrics',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'wake_times',
        'browser_ooms_7d',
        'wakes_by_caller_7d',
        'shell_programs_7d',
        'job_boxes_7d',
      ],
    );
    final val = ServerCapacityComputerMetrics(
      wakeTimes: $checkedConvert(
        'wake_times',
        (v) => (v as List<dynamic>)
            .map(
              (e) => ServerCapacityComputerMetricsWakeTimesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      browserOoms7d: $checkedConvert(
        'browser_ooms_7d',
        (v) => (v as num).toInt(),
      ),
      wakesByCaller7d: $checkedConvert(
        'wakes_by_caller_7d',
        (v) => (v as List<dynamic>)
            .map(
              (e) => ServerCapacityComputerMetricsWakesByCaller7dInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      shellPrograms7d: $checkedConvert(
        'shell_programs_7d',
        (v) => (v as List<dynamic>)
            .map(
              (e) => ServerCapacityComputerMetricsShellPrograms7dInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      jobBoxes7d: $checkedConvert(
        'job_boxes_7d',
        (v) => ServerCapacityComputerMetricsJobBoxes7d.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'wakeTimes': 'wake_times',
    'browserOoms7d': 'browser_ooms_7d',
    'wakesByCaller7d': 'wakes_by_caller_7d',
    'shellPrograms7d': 'shell_programs_7d',
    'jobBoxes7d': 'job_boxes_7d',
  },
);

Map<String, dynamic> _$ServerCapacityComputerMetricsToJson(
  ServerCapacityComputerMetrics instance,
) => <String, dynamic>{
  'wake_times': instance.wakeTimes.map((e) => e.toJson()).toList(),
  'browser_ooms_7d': instance.browserOoms7d,
  'wakes_by_caller_7d': instance.wakesByCaller7d
      .map((e) => e.toJson())
      .toList(),
  'shell_programs_7d': instance.shellPrograms7d.map((e) => e.toJson()).toList(),
  'job_boxes_7d': instance.jobBoxes7d.toJson(),
};
