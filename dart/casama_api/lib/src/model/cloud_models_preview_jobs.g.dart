// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_preview_jobs.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsPreviewJobsCWProxy {
  CloudModelsPreviewJobs embedding(CloudModelsPreviewJobsEmbedding embedding);

  CloudModelsPreviewJobs image(CloudModelsPreviewJobsEmbedding image);

  CloudModelsPreviewJobs tts(CloudModelsPreviewJobsEmbedding tts);

  CloudModelsPreviewJobs stt(CloudModelsPreviewJobsEmbedding stt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreviewJobs(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreviewJobs(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsPreviewJobs call({
    CloudModelsPreviewJobsEmbedding embedding,
    CloudModelsPreviewJobsEmbedding image,
    CloudModelsPreviewJobsEmbedding tts,
    CloudModelsPreviewJobsEmbedding stt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsPreviewJobs.copyWith(...)` or call `instanceOfCloudModelsPreviewJobs.copyWith.fieldName(value)` for a single field.
class _$CloudModelsPreviewJobsCWProxyImpl
    implements _$CloudModelsPreviewJobsCWProxy {
  const _$CloudModelsPreviewJobsCWProxyImpl(this._value);

  final CloudModelsPreviewJobs _value;

  @override
  CloudModelsPreviewJobs embedding(CloudModelsPreviewJobsEmbedding embedding) =>
      call(embedding: embedding);

  @override
  CloudModelsPreviewJobs image(CloudModelsPreviewJobsEmbedding image) =>
      call(image: image);

  @override
  CloudModelsPreviewJobs tts(CloudModelsPreviewJobsEmbedding tts) =>
      call(tts: tts);

  @override
  CloudModelsPreviewJobs stt(CloudModelsPreviewJobsEmbedding stt) =>
      call(stt: stt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreviewJobs(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreviewJobs(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsPreviewJobs call({
    Object? embedding = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? tts = const $CopyWithPlaceholder(),
    Object? stt = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsPreviewJobs(
      embedding: embedding == const $CopyWithPlaceholder() || embedding == null
          ? _value.embedding
          // ignore: cast_nullable_to_non_nullable
          : embedding as CloudModelsPreviewJobsEmbedding,
      image: image == const $CopyWithPlaceholder() || image == null
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as CloudModelsPreviewJobsEmbedding,
      tts: tts == const $CopyWithPlaceholder() || tts == null
          ? _value.tts
          // ignore: cast_nullable_to_non_nullable
          : tts as CloudModelsPreviewJobsEmbedding,
      stt: stt == const $CopyWithPlaceholder() || stt == null
          ? _value.stt
          // ignore: cast_nullable_to_non_nullable
          : stt as CloudModelsPreviewJobsEmbedding,
    );
  }
}

extension $CloudModelsPreviewJobsCopyWith on CloudModelsPreviewJobs {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsPreviewJobs.copyWith(...)` or `instanceOfCloudModelsPreviewJobs.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsPreviewJobsCWProxy get copyWith =>
      _$CloudModelsPreviewJobsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsPreviewJobs _$CloudModelsPreviewJobsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsPreviewJobs', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['embedding', 'image', 'tts', 'stt']);
  final val = CloudModelsPreviewJobs(
    embedding: $checkedConvert(
      'embedding',
      (v) =>
          CloudModelsPreviewJobsEmbedding.fromJson(v as Map<String, dynamic>),
    ),
    image: $checkedConvert(
      'image',
      (v) =>
          CloudModelsPreviewJobsEmbedding.fromJson(v as Map<String, dynamic>),
    ),
    tts: $checkedConvert(
      'tts',
      (v) =>
          CloudModelsPreviewJobsEmbedding.fromJson(v as Map<String, dynamic>),
    ),
    stt: $checkedConvert(
      'stt',
      (v) =>
          CloudModelsPreviewJobsEmbedding.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$CloudModelsPreviewJobsToJson(
  CloudModelsPreviewJobs instance,
) => <String, dynamic>{
  'embedding': instance.embedding.toJson(),
  'image': instance.image.toJson(),
  'tts': instance.tts.toJson(),
  'stt': instance.stt.toJson(),
};
