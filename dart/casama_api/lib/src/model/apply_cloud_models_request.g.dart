// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_cloud_models_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ApplyCloudModelsRequestCWProxy {
  ApplyCloudModelsRequest bots(List<String> bots);

  ApplyCloudModelsRequest workspaceDefault(bool? workspaceDefault);

  ApplyCloudModelsRequest embedding(bool? embedding);

  ApplyCloudModelsRequest fallback(CloudModelsFallback? fallback);

  ApplyCloudModelsRequest policy(CloudModelsPolicy? policy);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ApplyCloudModelsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ApplyCloudModelsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  ApplyCloudModelsRequest call({
    List<String> bots,
    bool? workspaceDefault,
    bool? embedding,
    CloudModelsFallback? fallback,
    CloudModelsPolicy? policy,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfApplyCloudModelsRequest.copyWith(...)` or call `instanceOfApplyCloudModelsRequest.copyWith.fieldName(value)` for a single field.
class _$ApplyCloudModelsRequestCWProxyImpl
    implements _$ApplyCloudModelsRequestCWProxy {
  const _$ApplyCloudModelsRequestCWProxyImpl(this._value);

  final ApplyCloudModelsRequest _value;

  @override
  ApplyCloudModelsRequest bots(List<String> bots) => call(bots: bots);

  @override
  ApplyCloudModelsRequest workspaceDefault(bool? workspaceDefault) =>
      call(workspaceDefault: workspaceDefault);

  @override
  ApplyCloudModelsRequest embedding(bool? embedding) =>
      call(embedding: embedding);

  @override
  ApplyCloudModelsRequest fallback(CloudModelsFallback? fallback) =>
      call(fallback: fallback);

  @override
  ApplyCloudModelsRequest policy(CloudModelsPolicy? policy) =>
      call(policy: policy);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ApplyCloudModelsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ApplyCloudModelsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ApplyCloudModelsRequest call({
    Object? bots = const $CopyWithPlaceholder(),
    Object? workspaceDefault = const $CopyWithPlaceholder(),
    Object? embedding = const $CopyWithPlaceholder(),
    Object? fallback = const $CopyWithPlaceholder(),
    Object? policy = const $CopyWithPlaceholder(),
  }) {
    return ApplyCloudModelsRequest(
      bots: bots == const $CopyWithPlaceholder() || bots == null
          ? _value.bots
          // ignore: cast_nullable_to_non_nullable
          : bots as List<String>,
      workspaceDefault: workspaceDefault == const $CopyWithPlaceholder()
          ? _value.workspaceDefault
          // ignore: cast_nullable_to_non_nullable
          : workspaceDefault as bool?,
      embedding: embedding == const $CopyWithPlaceholder()
          ? _value.embedding
          // ignore: cast_nullable_to_non_nullable
          : embedding as bool?,
      fallback: fallback == const $CopyWithPlaceholder()
          ? _value.fallback
          // ignore: cast_nullable_to_non_nullable
          : fallback as CloudModelsFallback?,
      policy: policy == const $CopyWithPlaceholder()
          ? _value.policy
          // ignore: cast_nullable_to_non_nullable
          : policy as CloudModelsPolicy?,
    );
  }
}

extension $ApplyCloudModelsRequestCopyWith on ApplyCloudModelsRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfApplyCloudModelsRequest.copyWith(...)` or `instanceOfApplyCloudModelsRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ApplyCloudModelsRequestCWProxy get copyWith =>
      _$ApplyCloudModelsRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyCloudModelsRequest _$ApplyCloudModelsRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ApplyCloudModelsRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['bots']);
  final val = ApplyCloudModelsRequest(
    bots: $checkedConvert(
      'bots',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    workspaceDefault: $checkedConvert('workspace_default', (v) => v as bool?),
    embedding: $checkedConvert('embedding', (v) => v as bool?),
    fallback: $checkedConvert(
      'fallback',
      (v) => v == null
          ? null
          : CloudModelsFallback.fromJson(v as Map<String, dynamic>),
    ),
    policy: $checkedConvert(
      'policy',
      (v) => v == null
          ? null
          : CloudModelsPolicy.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
}, fieldKeyMap: const {'workspaceDefault': 'workspace_default'});

Map<String, dynamic> _$ApplyCloudModelsRequestToJson(
  ApplyCloudModelsRequest instance,
) => <String, dynamic>{
  'bots': instance.bots,
  'workspace_default': ?instance.workspaceDefault,
  'embedding': ?instance.embedding,
  'fallback': ?instance.fallback?.toJson(),
  'policy': ?instance.policy?.toJson(),
};
