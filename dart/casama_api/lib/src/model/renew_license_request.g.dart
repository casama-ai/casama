// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renew_license_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RenewLicenseRequestCWProxy {
  RenewLicenseRequest license(String license);

  RenewLicenseRequest instanceId(String instanceId);

  RenewLicenseRequest engineVersion(String engineVersion);

  RenewLicenseRequest members(int? members);

  RenewLicenseRequest bots(int? bots);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `RenewLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RenewLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  RenewLicenseRequest call({
    String license,
    String instanceId,
    String engineVersion,
    int? members,
    int? bots,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRenewLicenseRequest.copyWith(...)` or call `instanceOfRenewLicenseRequest.copyWith.fieldName(value)` for a single field.
class _$RenewLicenseRequestCWProxyImpl implements _$RenewLicenseRequestCWProxy {
  const _$RenewLicenseRequestCWProxyImpl(this._value);

  final RenewLicenseRequest _value;

  @override
  RenewLicenseRequest license(String license) => call(license: license);

  @override
  RenewLicenseRequest instanceId(String instanceId) =>
      call(instanceId: instanceId);

  @override
  RenewLicenseRequest engineVersion(String engineVersion) =>
      call(engineVersion: engineVersion);

  @override
  RenewLicenseRequest members(int? members) => call(members: members);

  @override
  RenewLicenseRequest bots(int? bots) => call(bots: bots);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `RenewLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RenewLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RenewLicenseRequest call({
    Object? license = const $CopyWithPlaceholder(),
    Object? instanceId = const $CopyWithPlaceholder(),
    Object? engineVersion = const $CopyWithPlaceholder(),
    Object? members = const $CopyWithPlaceholder(),
    Object? bots = const $CopyWithPlaceholder(),
  }) {
    return RenewLicenseRequest(
      license: license == const $CopyWithPlaceholder() || license == null
          ? _value.license
          // ignore: cast_nullable_to_non_nullable
          : license as String,
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
      members: members == const $CopyWithPlaceholder()
          ? _value.members
          // ignore: cast_nullable_to_non_nullable
          : members as int?,
      bots: bots == const $CopyWithPlaceholder()
          ? _value.bots
          // ignore: cast_nullable_to_non_nullable
          : bots as int?,
    );
  }
}

extension $RenewLicenseRequestCopyWith on RenewLicenseRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRenewLicenseRequest.copyWith(...)` or `instanceOfRenewLicenseRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RenewLicenseRequestCWProxy get copyWith =>
      _$RenewLicenseRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenewLicenseRequest _$RenewLicenseRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RenewLicenseRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['license', 'instance_id', 'engine_version'],
        );
        final val = RenewLicenseRequest(
          license: $checkedConvert('license', (v) => v as String),
          instanceId: $checkedConvert('instance_id', (v) => v as String),
          engineVersion: $checkedConvert('engine_version', (v) => v as String),
          members: $checkedConvert('members', (v) => (v as num?)?.toInt()),
          bots: $checkedConvert('bots', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'instanceId': 'instance_id',
        'engineVersion': 'engine_version',
      },
    );

Map<String, dynamic> _$RenewLicenseRequestToJson(
  RenewLicenseRequest instance,
) => <String, dynamic>{
  'license': instance.license,
  'instance_id': instance.instanceId,
  'engine_version': instance.engineVersion,
  'members': ?instance.members,
  'bots': ?instance.bots,
};
