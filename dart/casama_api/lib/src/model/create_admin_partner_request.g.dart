// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_admin_partner_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateAdminPartnerRequestCWProxy {
  CreateAdminPartnerRequest displayName(String displayName);

  CreateAdminPartnerRequest email(String? email);

  CreateAdminPartnerRequest channelUrl(String? channelUrl);

  CreateAdminPartnerRequest toltPartnerId(String? toltPartnerId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateAdminPartnerRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateAdminPartnerRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateAdminPartnerRequest call({
    String displayName,
    String? email,
    String? channelUrl,
    String? toltPartnerId,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateAdminPartnerRequest.copyWith(...)` or call `instanceOfCreateAdminPartnerRequest.copyWith.fieldName(value)` for a single field.
class _$CreateAdminPartnerRequestCWProxyImpl
    implements _$CreateAdminPartnerRequestCWProxy {
  const _$CreateAdminPartnerRequestCWProxyImpl(this._value);

  final CreateAdminPartnerRequest _value;

  @override
  CreateAdminPartnerRequest displayName(String displayName) =>
      call(displayName: displayName);

  @override
  CreateAdminPartnerRequest email(String? email) => call(email: email);

  @override
  CreateAdminPartnerRequest channelUrl(String? channelUrl) =>
      call(channelUrl: channelUrl);

  @override
  CreateAdminPartnerRequest toltPartnerId(String? toltPartnerId) =>
      call(toltPartnerId: toltPartnerId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateAdminPartnerRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateAdminPartnerRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateAdminPartnerRequest call({
    Object? displayName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? channelUrl = const $CopyWithPlaceholder(),
    Object? toltPartnerId = const $CopyWithPlaceholder(),
  }) {
    return CreateAdminPartnerRequest(
      displayName:
          displayName == const $CopyWithPlaceholder() || displayName == null
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      channelUrl: channelUrl == const $CopyWithPlaceholder()
          ? _value.channelUrl
          // ignore: cast_nullable_to_non_nullable
          : channelUrl as String?,
      toltPartnerId: toltPartnerId == const $CopyWithPlaceholder()
          ? _value.toltPartnerId
          // ignore: cast_nullable_to_non_nullable
          : toltPartnerId as String?,
    );
  }
}

extension $CreateAdminPartnerRequestCopyWith on CreateAdminPartnerRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateAdminPartnerRequest.copyWith(...)` or `instanceOfCreateAdminPartnerRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateAdminPartnerRequestCWProxy get copyWith =>
      _$CreateAdminPartnerRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdminPartnerRequest _$CreateAdminPartnerRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CreateAdminPartnerRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['display_name']);
    final val = CreateAdminPartnerRequest(
      displayName: $checkedConvert('display_name', (v) => v as String),
      email: $checkedConvert('email', (v) => v as String?),
      channelUrl: $checkedConvert('channel_url', (v) => v as String?),
      toltPartnerId: $checkedConvert('tolt_partner_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'channelUrl': 'channel_url',
    'toltPartnerId': 'tolt_partner_id',
  },
);

Map<String, dynamic> _$CreateAdminPartnerRequestToJson(
  CreateAdminPartnerRequest instance,
) => <String, dynamic>{
  'display_name': instance.displayName,
  'email': ?instance.email,
  'channel_url': ?instance.channelUrl,
  'tolt_partner_id': ?instance.toltPartnerId,
};
