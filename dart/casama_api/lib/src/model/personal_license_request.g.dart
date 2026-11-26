// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_license_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonalLicenseRequestCWProxy {
  PersonalLicenseRequest instanceId(String instanceId);

  PersonalLicenseRequest engineVersion(String engineVersion);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PersonalLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PersonalLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  PersonalLicenseRequest call({String instanceId, String engineVersion});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPersonalLicenseRequest.copyWith(...)` or call `instanceOfPersonalLicenseRequest.copyWith.fieldName(value)` for a single field.
class _$PersonalLicenseRequestCWProxyImpl
    implements _$PersonalLicenseRequestCWProxy {
  const _$PersonalLicenseRequestCWProxyImpl(this._value);

  final PersonalLicenseRequest _value;

  @override
  PersonalLicenseRequest instanceId(String instanceId) =>
      call(instanceId: instanceId);

  @override
  PersonalLicenseRequest engineVersion(String engineVersion) =>
      call(engineVersion: engineVersion);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PersonalLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PersonalLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PersonalLicenseRequest call({
    Object? instanceId = const $CopyWithPlaceholder(),
    Object? engineVersion = const $CopyWithPlaceholder(),
  }) {
    return PersonalLicenseRequest(
      instanceId:
          instanceId == const $CopyWithPlaceholder() || instanceId == null
          ? _value.instanceId
          // ignore: cast_nullable_to_non_nullable
          : instanceId as String,
      engineVersion:
          engineVersion == const $CopyWithPlaceholder() || engineVersion == null
          ? _value.engineVersion
          // ignore: cast_nullable_to_non_nullable
          : engineVersion as String,
    );
  }
}

extension $PersonalLicenseRequestCopyWith on PersonalLicenseRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPersonalLicenseRequest.copyWith(...)` or `instanceOfPersonalLicenseRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonalLicenseRequestCWProxy get copyWith =>
      _$PersonalLicenseRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalLicenseRequest _$PersonalLicenseRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PersonalLicenseRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['instance_id', 'engine_version']);
    final val = PersonalLicenseRequest(
      instanceId: $checkedConvert('instance_id', (v) => v as String),
      engineVersion: $checkedConvert('engine_version', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'instanceId': 'instance_id',
    'engineVersion': 'engine_version',
  },
);

Map<String, dynamic> _$PersonalLicenseRequestToJson(
  PersonalLicenseRequest instance,
) => <String, dynamic>{
  'instance_id': instance.instanceId,
  'engine_version': instance.engineVersion,
};
