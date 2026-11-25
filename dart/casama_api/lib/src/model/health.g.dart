// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HealthCWProxy {
  Health status(HealthStatusEnum status);

  Health checks(Map<String, String>? checks);

  Health pool(HealthPool? pool);

  Health slowPool(HealthPool? slowPool);

  Health httpP95Ms(num? httpP95Ms);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `Health(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Health(...).copyWith(id: 12, name: "My name")
  /// ```
  Health call({
    HealthStatusEnum status,
    Map<String, String>? checks,
    HealthPool? pool,
    HealthPool? slowPool,
    num? httpP95Ms,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfHealth.copyWith(...)` or call `instanceOfHealth.copyWith.fieldName(value)` for a single field.
class _$HealthCWProxyImpl implements _$HealthCWProxy {
  const _$HealthCWProxyImpl(this._value);

  final Health _value;

  @override
  Health status(HealthStatusEnum status) => call(status: status);

  @override
  Health checks(Map<String, String>? checks) => call(checks: checks);

  @override
  Health pool(HealthPool? pool) => call(pool: pool);

  @override
  Health slowPool(HealthPool? slowPool) => call(slowPool: slowPool);

  @override
  Health httpP95Ms(num? httpP95Ms) => call(httpP95Ms: httpP95Ms);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `Health(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Health(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  Health call({
    Object? status = const $CopyWithPlaceholder(),
    Object? checks = const $CopyWithPlaceholder(),
    Object? pool = const $CopyWithPlaceholder(),
    Object? slowPool = const $CopyWithPlaceholder(),
    Object? httpP95Ms = const $CopyWithPlaceholder(),
  }) {
    return Health(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as HealthStatusEnum,
      checks: checks == const $CopyWithPlaceholder()
          ? _value.checks
          // ignore: cast_nullable_to_non_nullable
          : checks as Map<String, String>?,
      pool: pool == const $CopyWithPlaceholder()
          ? _value.pool
          // ignore: cast_nullable_to_non_nullable
          : pool as HealthPool?,
      slowPool: slowPool == const $CopyWithPlaceholder()
          ? _value.slowPool
          // ignore: cast_nullable_to_non_nullable
          : slowPool as HealthPool?,
      httpP95Ms: httpP95Ms == const $CopyWithPlaceholder()
          ? _value.httpP95Ms
          // ignore: cast_nullable_to_non_nullable
          : httpP95Ms as num?,
    );
  }
}

extension $HealthCopyWith on Health {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfHealth.copyWith(...)` or `instanceOfHealth.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HealthCWProxy get copyWith => _$HealthCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Health _$HealthFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Health', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['status']);
  final val = Health(
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$HealthStatusEnumEnumMap, v),
    ),
    checks: $checkedConvert(
      'checks',
      (v) =>
          (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String)),
    ),
    pool: $checkedConvert(
      'pool',
      (v) => v == null ? null : HealthPool.fromJson(v as Map<String, dynamic>),
    ),
    slowPool: $checkedConvert(
      'slow_pool',
      (v) => v == null ? null : HealthPool.fromJson(v as Map<String, dynamic>),
    ),
    httpP95Ms: $checkedConvert('http_p95_ms', (v) => v as num?),
  );
  return val;
}, fieldKeyMap: const {'slowPool': 'slow_pool', 'httpP95Ms': 'http_p95_ms'});

Map<String, dynamic> _$HealthToJson(Health instance) => <String, dynamic>{
  'status': _$HealthStatusEnumEnumMap[instance.status]!,
  'checks': ?instance.checks,
  'pool': ?instance.pool?.toJson(),
  'slow_pool': ?instance.slowPool?.toJson(),
  'http_p95_ms': ?instance.httpP95Ms,
};

const _$HealthStatusEnumEnumMap = {
  HealthStatusEnum.ok: 'ok',
  HealthStatusEnum.degraded: 'degraded',
};
