// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_preview.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsPreviewCWProxy {
  CloudModelsPreview bots(List<CloudModelsPreviewBotsInner> bots);

  CloudModelsPreview jobs(CloudModelsPreviewJobs jobs);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreview(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreview(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsPreview call({
    List<CloudModelsPreviewBotsInner> bots,
    CloudModelsPreviewJobs jobs,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsPreview.copyWith(...)` or call `instanceOfCloudModelsPreview.copyWith.fieldName(value)` for a single field.
class _$CloudModelsPreviewCWProxyImpl implements _$CloudModelsPreviewCWProxy {
  const _$CloudModelsPreviewCWProxyImpl(this._value);

  final CloudModelsPreview _value;

  @override
  CloudModelsPreview bots(List<CloudModelsPreviewBotsInner> bots) =>
      call(bots: bots);

  @override
  CloudModelsPreview jobs(CloudModelsPreviewJobs jobs) => call(jobs: jobs);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreview(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreview(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsPreview call({
    Object? bots = const $CopyWithPlaceholder(),
    Object? jobs = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsPreview(
      bots: bots == const $CopyWithPlaceholder() || bots == null
          ? _value.bots
          // ignore: cast_nullable_to_non_nullable
          : bots as List<CloudModelsPreviewBotsInner>,
      jobs: jobs == const $CopyWithPlaceholder() || jobs == null
          ? _value.jobs
          // ignore: cast_nullable_to_non_nullable
          : jobs as CloudModelsPreviewJobs,
    );
  }
}

extension $CloudModelsPreviewCopyWith on CloudModelsPreview {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsPreview.copyWith(...)` or `instanceOfCloudModelsPreview.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsPreviewCWProxy get copyWith =>
      _$CloudModelsPreviewCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsPreview _$CloudModelsPreviewFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CloudModelsPreview', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['bots', 'jobs']);
      final val = CloudModelsPreview(
        bots: $checkedConvert(
          'bots',
          (v) => (v as List<dynamic>)
              .map(
                (e) => CloudModelsPreviewBotsInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
        jobs: $checkedConvert(
          'jobs',
          (v) => CloudModelsPreviewJobs.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CloudModelsPreviewToJson(CloudModelsPreview instance) =>
    <String, dynamic>{
      'bots': instance.bots.map((e) => e.toJson()).toList(),
      'jobs': instance.jobs.toJson(),
    };
