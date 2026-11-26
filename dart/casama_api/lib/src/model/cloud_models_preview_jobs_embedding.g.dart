// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_preview_jobs_embedding.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsPreviewJobsEmbeddingCWProxy {
  CloudModelsPreviewJobsEmbedding hasOwn(bool hasOwn);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreviewJobsEmbedding(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreviewJobsEmbedding(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsPreviewJobsEmbedding call({bool hasOwn});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsPreviewJobsEmbedding.copyWith(...)` or call `instanceOfCloudModelsPreviewJobsEmbedding.copyWith.fieldName(value)` for a single field.
class _$CloudModelsPreviewJobsEmbeddingCWProxyImpl
    implements _$CloudModelsPreviewJobsEmbeddingCWProxy {
  const _$CloudModelsPreviewJobsEmbeddingCWProxyImpl(this._value);

  final CloudModelsPreviewJobsEmbedding _value;

  @override
  CloudModelsPreviewJobsEmbedding hasOwn(bool hasOwn) => call(hasOwn: hasOwn);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreviewJobsEmbedding(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreviewJobsEmbedding(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsPreviewJobsEmbedding call({
    Object? hasOwn = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsPreviewJobsEmbedding(
      hasOwn: hasOwn == const $CopyWithPlaceholder() || hasOwn == null
          ? _value.hasOwn
          // ignore: cast_nullable_to_non_nullable
          : hasOwn as bool,
    );
  }
}

extension $CloudModelsPreviewJobsEmbeddingCopyWith
    on CloudModelsPreviewJobsEmbedding {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsPreviewJobsEmbedding.copyWith(...)` or `instanceOfCloudModelsPreviewJobsEmbedding.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsPreviewJobsEmbeddingCWProxy get copyWith =>
      _$CloudModelsPreviewJobsEmbeddingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsPreviewJobsEmbedding _$CloudModelsPreviewJobsEmbeddingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsPreviewJobsEmbedding', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['has_own']);
  final val = CloudModelsPreviewJobsEmbedding(
    hasOwn: $checkedConvert('has_own', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'hasOwn': 'has_own'});

Map<String, dynamic> _$CloudModelsPreviewJobsEmbeddingToJson(
  CloudModelsPreviewJobsEmbedding instance,
) => <String, dynamic>{'has_own': instance.hasOwn};
