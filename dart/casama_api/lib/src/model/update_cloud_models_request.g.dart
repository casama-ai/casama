// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cloud_models_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateCloudModelsRequestCWProxy {
  UpdateCloudModelsRequest policy(CloudModelsPolicy? policy);

  UpdateCloudModelsRequest fallback(CloudModelsFallback? fallback);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateCloudModelsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateCloudModelsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateCloudModelsRequest call({
    CloudModelsPolicy? policy,
    CloudModelsFallback? fallback,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateCloudModelsRequest.copyWith(...)` or call `instanceOfUpdateCloudModelsRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateCloudModelsRequestCWProxyImpl
    implements _$UpdateCloudModelsRequestCWProxy {
  const _$UpdateCloudModelsRequestCWProxyImpl(this._value);

  final UpdateCloudModelsRequest _value;

  @override
  UpdateCloudModelsRequest policy(CloudModelsPolicy? policy) =>
      call(policy: policy);

  @override
  UpdateCloudModelsRequest fallback(CloudModelsFallback? fallback) =>
      call(fallback: fallback);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateCloudModelsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateCloudModelsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateCloudModelsRequest call({
    Object? policy = const $CopyWithPlaceholder(),
    Object? fallback = const $CopyWithPlaceholder(),
  }) {
    return UpdateCloudModelsRequest(
      policy: policy == const $CopyWithPlaceholder()
          ? _value.policy
          // ignore: cast_nullable_to_non_nullable
          : policy as CloudModelsPolicy?,
      fallback: fallback == const $CopyWithPlaceholder()
          ? _value.fallback
          // ignore: cast_nullable_to_non_nullable
          : fallback as CloudModelsFallback?,
    );
  }
}

extension $UpdateCloudModelsRequestCopyWith on UpdateCloudModelsRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateCloudModelsRequest.copyWith(...)` or `instanceOfUpdateCloudModelsRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateCloudModelsRequestCWProxy get copyWith =>
      _$UpdateCloudModelsRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCloudModelsRequest _$UpdateCloudModelsRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateCloudModelsRequest', json, ($checkedConvert) {
  final val = UpdateCloudModelsRequest(
    policy: $checkedConvert(
      'policy',
      (v) => v == null
          ? null
          : CloudModelsPolicy.fromJson(v as Map<String, dynamic>),
    ),
    fallback: $checkedConvert(
      'fallback',
      (v) => v == null
          ? null
          : CloudModelsFallback.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$UpdateCloudModelsRequestToJson(
  UpdateCloudModelsRequest instance,
) => <String, dynamic>{
  'policy': ?instance.policy?.toJson(),
  'fallback': ?instance.fallback?.toJson(),
};
