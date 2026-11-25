// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_admin_partner_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateAdminPartnerRequestCWProxy {
  UpdateAdminPartnerRequest displayName(String? displayName);

  UpdateAdminPartnerRequest pictureUrl(String? pictureUrl);

  UpdateAdminPartnerRequest channelUrl(String? channelUrl);

  UpdateAdminPartnerRequest status(UpdateAdminPartnerRequestStatusEnum? status);

  UpdateAdminPartnerRequest rate(num? rate);

  UpdateAdminPartnerRequest notes(String? notes);

  UpdateAdminPartnerRequest userEmail(String? userEmail);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateAdminPartnerRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateAdminPartnerRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateAdminPartnerRequest call({
    String? displayName,
    String? pictureUrl,
    String? channelUrl,
    UpdateAdminPartnerRequestStatusEnum? status,
    num? rate,
    String? notes,
    String? userEmail,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateAdminPartnerRequest.copyWith(...)` or call `instanceOfUpdateAdminPartnerRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateAdminPartnerRequestCWProxyImpl
    implements _$UpdateAdminPartnerRequestCWProxy {
  const _$UpdateAdminPartnerRequestCWProxyImpl(this._value);

  final UpdateAdminPartnerRequest _value;

  @override
  UpdateAdminPartnerRequest displayName(String? displayName) =>
      call(displayName: displayName);

  @override
  UpdateAdminPartnerRequest pictureUrl(String? pictureUrl) =>
      call(pictureUrl: pictureUrl);

  @override
  UpdateAdminPartnerRequest channelUrl(String? channelUrl) =>
      call(channelUrl: channelUrl);

  @override
  UpdateAdminPartnerRequest status(
    UpdateAdminPartnerRequestStatusEnum? status,
  ) => call(status: status);

  @override
  UpdateAdminPartnerRequest rate(num? rate) => call(rate: rate);

  @override
  UpdateAdminPartnerRequest notes(String? notes) => call(notes: notes);

  @override
  UpdateAdminPartnerRequest userEmail(String? userEmail) =>
      call(userEmail: userEmail);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateAdminPartnerRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateAdminPartnerRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateAdminPartnerRequest call({
    Object? displayName = const $CopyWithPlaceholder(),
    Object? pictureUrl = const $CopyWithPlaceholder(),
    Object? channelUrl = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? rate = const $CopyWithPlaceholder(),
    Object? notes = const $CopyWithPlaceholder(),
    Object? userEmail = const $CopyWithPlaceholder(),
  }) {
    return UpdateAdminPartnerRequest(
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      pictureUrl: pictureUrl == const $CopyWithPlaceholder()
          ? _value.pictureUrl
          // ignore: cast_nullable_to_non_nullable
          : pictureUrl as String?,
      channelUrl: channelUrl == const $CopyWithPlaceholder()
          ? _value.channelUrl
          // ignore: cast_nullable_to_non_nullable
          : channelUrl as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as UpdateAdminPartnerRequestStatusEnum?,
      rate: rate == const $CopyWithPlaceholder()
          ? _value.rate
          // ignore: cast_nullable_to_non_nullable
          : rate as num?,
      notes: notes == const $CopyWithPlaceholder()
          ? _value.notes
          // ignore: cast_nullable_to_non_nullable
          : notes as String?,
      userEmail: userEmail == const $CopyWithPlaceholder()
          ? _value.userEmail
          // ignore: cast_nullable_to_non_nullable
          : userEmail as String?,
    );
  }
}

extension $UpdateAdminPartnerRequestCopyWith on UpdateAdminPartnerRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateAdminPartnerRequest.copyWith(...)` or `instanceOfUpdateAdminPartnerRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateAdminPartnerRequestCWProxy get copyWith =>
      _$UpdateAdminPartnerRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAdminPartnerRequest _$UpdateAdminPartnerRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateAdminPartnerRequest',
  json,
  ($checkedConvert) {
    final val = UpdateAdminPartnerRequest(
      displayName: $checkedConvert('display_name', (v) => v as String?),
      pictureUrl: $checkedConvert('picture_url', (v) => v as String?),
      channelUrl: $checkedConvert('channel_url', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(
          _$UpdateAdminPartnerRequestStatusEnumEnumMap,
          v,
        ),
      ),
      rate: $checkedConvert('rate', (v) => v as num?),
      notes: $checkedConvert('notes', (v) => v as String?),
      userEmail: $checkedConvert('user_email', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'pictureUrl': 'picture_url',
    'channelUrl': 'channel_url',
    'userEmail': 'user_email',
  },
);

Map<String, dynamic> _$UpdateAdminPartnerRequestToJson(
  UpdateAdminPartnerRequest instance,
) => <String, dynamic>{
  'display_name': ?instance.displayName,
  'picture_url': ?instance.pictureUrl,
  'channel_url': ?instance.channelUrl,
  'status': ?_$UpdateAdminPartnerRequestStatusEnumEnumMap[instance.status],
  'rate': ?instance.rate,
  'notes': ?instance.notes,
  'user_email': ?instance.userEmail,
};

const _$UpdateAdminPartnerRequestStatusEnumEnumMap = {
  UpdateAdminPartnerRequestStatusEnum.applied: 'applied',
  UpdateAdminPartnerRequestStatusEnum.active: 'active',
  UpdateAdminPartnerRequestStatusEnum.paused: 'paused',
  UpdateAdminPartnerRequestStatusEnum.banned: 'banned',
  UpdateAdminPartnerRequestStatusEnum.left: 'left',
};
