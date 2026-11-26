// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfhost_stats_by_engine_version_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelfhostStatsByEngineVersionInnerCWProxy {
  SelfhostStatsByEngineVersionInner engineVersion(String engineVersion);

  SelfhostStatsByEngineVersionInner servers(int servers);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStatsByEngineVersionInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStatsByEngineVersionInner(...).copyWith(id: 12, name: "My name")
  /// ```
  SelfhostStatsByEngineVersionInner call({String engineVersion, int servers});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSelfhostStatsByEngineVersionInner.copyWith(...)` or call `instanceOfSelfhostStatsByEngineVersionInner.copyWith.fieldName(value)` for a single field.
class _$SelfhostStatsByEngineVersionInnerCWProxyImpl
    implements _$SelfhostStatsByEngineVersionInnerCWProxy {
  const _$SelfhostStatsByEngineVersionInnerCWProxyImpl(this._value);

  final SelfhostStatsByEngineVersionInner _value;

  @override
  SelfhostStatsByEngineVersionInner engineVersion(String engineVersion) =>
      call(engineVersion: engineVersion);

  @override
  SelfhostStatsByEngineVersionInner servers(int servers) =>
      call(servers: servers);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStatsByEngineVersionInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStatsByEngineVersionInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SelfhostStatsByEngineVersionInner call({
    Object? engineVersion = const $CopyWithPlaceholder(),
    Object? servers = const $CopyWithPlaceholder(),
  }) {
    return SelfhostStatsByEngineVersionInner(
      engineVersion:
          engineVersion == const $CopyWithPlaceholder() || engineVersion == null
          ? _value.engineVersion
          // ignore: cast_nullable_to_non_nullable
          : engineVersion as String,
      servers: servers == const $CopyWithPlaceholder() || servers == null
          ? _value.servers
          // ignore: cast_nullable_to_non_nullable
          : servers as int,
    );
  }
}

extension $SelfhostStatsByEngineVersionInnerCopyWith
    on SelfhostStatsByEngineVersionInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSelfhostStatsByEngineVersionInner.copyWith(...)` or `instanceOfSelfhostStatsByEngineVersionInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelfhostStatsByEngineVersionInnerCWProxy get copyWith =>
      _$SelfhostStatsByEngineVersionInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfhostStatsByEngineVersionInner _$SelfhostStatsByEngineVersionInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SelfhostStatsByEngineVersionInner', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['engine_version', 'servers']);
  final val = SelfhostStatsByEngineVersionInner(
    engineVersion: $checkedConvert('engine_version', (v) => v as String),
    servers: $checkedConvert('servers', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'engineVersion': 'engine_version'});

Map<String, dynamic> _$SelfhostStatsByEngineVersionInnerToJson(
  SelfhostStatsByEngineVersionInner instance,
) => <String, dynamic>{
  'engine_version': instance.engineVersion,
  'servers': instance.servers,
};
