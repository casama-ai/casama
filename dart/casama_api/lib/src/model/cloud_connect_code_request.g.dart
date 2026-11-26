// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_connect_code_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudConnectCodeRequestCWProxy {
  CloudConnectCodeRequest orgId(String orgId);

  CloudConnectCodeRequest instanceId(String instanceId);

  CloudConnectCodeRequest instanceName(String? instanceName);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudConnectCodeRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudConnectCodeRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudConnectCodeRequest call({
    String orgId,
    String instanceId,
    String? instanceName,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudConnectCodeRequest.copyWith(...)` or call `instanceOfCloudConnectCodeRequest.copyWith.fieldName(value)` for a single field.
class _$CloudConnectCodeRequestCWProxyImpl
    implements _$CloudConnectCodeRequestCWProxy {
  const _$CloudConnectCodeRequestCWProxyImpl(this._value);

  final CloudConnectCodeRequest _value;

  @override
  CloudConnectCodeRequest orgId(String orgId) => call(orgId: orgId);

  @override
  CloudConnectCodeRequest instanceId(String instanceId) =>
      call(instanceId: instanceId);

  @override
  CloudConnectCodeRequest instanceName(String? instanceName) =>
      call(instanceName: instanceName);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudConnectCodeRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudConnectCodeRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudConnectCodeRequest call({
    Object? orgId = const $CopyWithPlaceholder(),
    Object? instanceId = const $CopyWithPlaceholder(),
    Object? instanceName = const $CopyWithPlaceholder(),
  }) {
    return CloudConnectCodeRequest(
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      instanceId:
          instanceId == const $CopyWithPlaceholder() || instanceId == null
          ? _value.instanceId
          // ignore: cast_nullable_to_non_nullable
          : instanceId as String,
      instanceName: instanceName == const $CopyWithPlaceholder()
          ? _value.instanceName
          // ignore: cast_nullable_to_non_nullable
          : instanceName as String?,
    );
  }
}

extension $CloudConnectCodeRequestCopyWith on CloudConnectCodeRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudConnectCodeRequest.copyWith(...)` or `instanceOfCloudConnectCodeRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudConnectCodeRequestCWProxy get copyWith =>
      _$CloudConnectCodeRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudConnectCodeRequest _$CloudConnectCodeRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CloudConnectCodeRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['org_id', 'instance_id']);
    final val = CloudConnectCodeRequest(
      orgId: $checkedConvert('org_id', (v) => v as String),
      instanceId: $checkedConvert('instance_id', (v) => v as String),
      instanceName: $checkedConvert('instance_name', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'instanceId': 'instance_id',
    'instanceName': 'instance_name',
  },
);

Map<String, dynamic> _$CloudConnectCodeRequestToJson(
  CloudConnectCodeRequest instance,
) => <String, dynamic>{
  'org_id': instance.orgId,
  'instance_id': instance.instanceId,
  'instance_name': ?instance.instanceName,
};
