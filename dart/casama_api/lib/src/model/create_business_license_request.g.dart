// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_business_license_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateBusinessLicenseRequestCWProxy {
  CreateBusinessLicenseRequest customer(String customer);

  CreateBusinessLicenseRequest email(String email);

  CreateBusinessLicenseRequest seats(int seats);

  CreateBusinessLicenseRequest features(List<LicenseFeature>? features);

  CreateBusinessLicenseRequest expiresAt(DateTime expiresAt);

  CreateBusinessLicenseRequest offline(bool? offline);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateBusinessLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateBusinessLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateBusinessLicenseRequest call({
    String customer,
    String email,
    int seats,
    List<LicenseFeature>? features,
    DateTime expiresAt,
    bool? offline,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateBusinessLicenseRequest.copyWith(...)` or call `instanceOfCreateBusinessLicenseRequest.copyWith.fieldName(value)` for a single field.
class _$CreateBusinessLicenseRequestCWProxyImpl
    implements _$CreateBusinessLicenseRequestCWProxy {
  const _$CreateBusinessLicenseRequestCWProxyImpl(this._value);

  final CreateBusinessLicenseRequest _value;

  @override
  CreateBusinessLicenseRequest customer(String customer) =>
      call(customer: customer);

  @override
  CreateBusinessLicenseRequest email(String email) => call(email: email);

  @override
  CreateBusinessLicenseRequest seats(int seats) => call(seats: seats);

  @override
  CreateBusinessLicenseRequest features(List<LicenseFeature>? features) =>
      call(features: features);

  @override
  CreateBusinessLicenseRequest expiresAt(DateTime expiresAt) =>
      call(expiresAt: expiresAt);

  @override
  CreateBusinessLicenseRequest offline(bool? offline) => call(offline: offline);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateBusinessLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateBusinessLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateBusinessLicenseRequest call({
    Object? customer = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? seats = const $CopyWithPlaceholder(),
    Object? features = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? offline = const $CopyWithPlaceholder(),
  }) {
    return CreateBusinessLicenseRequest(
      customer: customer == const $CopyWithPlaceholder() || customer == null
          ? _value.customer
          // ignore: cast_nullable_to_non_nullable
          : customer as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      seats: seats == const $CopyWithPlaceholder() || seats == null
          ? _value.seats
          // ignore: cast_nullable_to_non_nullable
          : seats as int,
      features: features == const $CopyWithPlaceholder()
          ? _value.features
          // ignore: cast_nullable_to_non_nullable
          : features as List<LicenseFeature>?,
      expiresAt: expiresAt == const $CopyWithPlaceholder() || expiresAt == null
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      offline: offline == const $CopyWithPlaceholder()
          ? _value.offline
          // ignore: cast_nullable_to_non_nullable
          : offline as bool?,
    );
  }
}

extension $CreateBusinessLicenseRequestCopyWith
    on CreateBusinessLicenseRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateBusinessLicenseRequest.copyWith(...)` or `instanceOfCreateBusinessLicenseRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateBusinessLicenseRequestCWProxy get copyWith =>
      _$CreateBusinessLicenseRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBusinessLicenseRequest _$CreateBusinessLicenseRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateBusinessLicenseRequest', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['customer', 'email', 'seats', 'expires_at'],
  );
  final val = CreateBusinessLicenseRequest(
    customer: $checkedConvert('customer', (v) => v as String),
    email: $checkedConvert('email', (v) => v as String),
    seats: $checkedConvert('seats', (v) => (v as num).toInt()),
    features: $checkedConvert(
      'features',
      (v) => (v as List<dynamic>?)
          ?.map((e) => $enumDecode(_$LicenseFeatureEnumMap, e))
          .toList(),
    ),
    expiresAt: $checkedConvert(
      'expires_at',
      (v) => DateTime.parse(v as String),
    ),
    offline: $checkedConvert('offline', (v) => v as bool?),
  );
  return val;
}, fieldKeyMap: const {'expiresAt': 'expires_at'});

Map<String, dynamic> _$CreateBusinessLicenseRequestToJson(
  CreateBusinessLicenseRequest instance,
) => <String, dynamic>{
  'customer': instance.customer,
  'email': instance.email,
  'seats': instance.seats,
  'features': ?instance.features
      ?.map((e) => _$LicenseFeatureEnumMap[e]!)
      .toList(),
  'expires_at': instance.expiresAt.toIso8601String(),
  'offline': ?instance.offline,
};

const _$LicenseFeatureEnumMap = {
  LicenseFeature.auditExport: 'audit_export',
  LicenseFeature.sso: 'sso',
  LicenseFeature.advancedRoles: 'advanced_roles',
  LicenseFeature.auditForwarding: 'audit_forwarding',
};
