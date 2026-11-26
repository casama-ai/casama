// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_state_memory_reindex.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsStateMemoryReindexCWProxy {
  CloudModelsStateMemoryReindex done(int done);

  CloudModelsStateMemoryReindex total(int total);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsStateMemoryReindex(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsStateMemoryReindex(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsStateMemoryReindex call({int done, int total});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsStateMemoryReindex.copyWith(...)` or call `instanceOfCloudModelsStateMemoryReindex.copyWith.fieldName(value)` for a single field.
class _$CloudModelsStateMemoryReindexCWProxyImpl
    implements _$CloudModelsStateMemoryReindexCWProxy {
  const _$CloudModelsStateMemoryReindexCWProxyImpl(this._value);

  final CloudModelsStateMemoryReindex _value;

  @override
  CloudModelsStateMemoryReindex done(int done) => call(done: done);

  @override
  CloudModelsStateMemoryReindex total(int total) => call(total: total);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsStateMemoryReindex(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsStateMemoryReindex(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsStateMemoryReindex call({
    Object? done = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsStateMemoryReindex(
      done: done == const $CopyWithPlaceholder() || done == null
          ? _value.done
          // ignore: cast_nullable_to_non_nullable
          : done as int,
      total: total == const $CopyWithPlaceholder() || total == null
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
    );
  }
}

extension $CloudModelsStateMemoryReindexCopyWith
    on CloudModelsStateMemoryReindex {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsStateMemoryReindex.copyWith(...)` or `instanceOfCloudModelsStateMemoryReindex.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsStateMemoryReindexCWProxy get copyWith =>
      _$CloudModelsStateMemoryReindexCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsStateMemoryReindex _$CloudModelsStateMemoryReindexFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsStateMemoryReindex', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['done', 'total']);
  final val = CloudModelsStateMemoryReindex(
    done: $checkedConvert('done', (v) => (v as num).toInt()),
    total: $checkedConvert('total', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$CloudModelsStateMemoryReindexToJson(
  CloudModelsStateMemoryReindex instance,
) => <String, dynamic>{'done': instance.done, 'total': instance.total};
