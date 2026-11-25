// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_partner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminPartnerCWProxy {
  AdminPartner id(String id);

  AdminPartner displayName(String displayName);

  AdminPartner email(String? email);

  AdminPartner pictureUrl(String? pictureUrl);

  AdminPartner channelUrl(String? channelUrl);

  AdminPartner country(String? country);

  AdminPartner status(AdminPartnerStatusEnum status);

  AdminPartner rate(num? rate);

  AdminPartner toltPartnerId(String? toltPartnerId);

  AdminPartner userId(String? userId);

  AdminPartner notes(String? notes);

  AdminPartner codes(List<AdminPartnerCode> codes);

  AdminPartner referred(int referred);

  AdminPartner paying(int paying);

  AdminPartner pendingUsd(num pendingUsd);

  AdminPartner payableUsd(num payableUsd);

  AdminPartner paidUsd(num paidUsd);

  AdminPartner createdAt(DateTime createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartner(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminPartner call({
    String id,
    String displayName,
    String? email,
    String? pictureUrl,
    String? channelUrl,
    String? country,
    AdminPartnerStatusEnum status,
    num? rate,
    String? toltPartnerId,
    String? userId,
    String? notes,
    List<AdminPartnerCode> codes,
    int referred,
    int paying,
    num pendingUsd,
    num payableUsd,
    num paidUsd,
    DateTime createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminPartner.copyWith(...)` or call `instanceOfAdminPartner.copyWith.fieldName(value)` for a single field.
class _$AdminPartnerCWProxyImpl implements _$AdminPartnerCWProxy {
  const _$AdminPartnerCWProxyImpl(this._value);

  final AdminPartner _value;

  @override
  AdminPartner id(String id) => call(id: id);

  @override
  AdminPartner displayName(String displayName) =>
      call(displayName: displayName);

  @override
  AdminPartner email(String? email) => call(email: email);

  @override
  AdminPartner pictureUrl(String? pictureUrl) => call(pictureUrl: pictureUrl);

  @override
  AdminPartner channelUrl(String? channelUrl) => call(channelUrl: channelUrl);

  @override
  AdminPartner country(String? country) => call(country: country);

  @override
  AdminPartner status(AdminPartnerStatusEnum status) => call(status: status);

  @override
  AdminPartner rate(num? rate) => call(rate: rate);

  @override
  AdminPartner toltPartnerId(String? toltPartnerId) =>
      call(toltPartnerId: toltPartnerId);

  @override
  AdminPartner userId(String? userId) => call(userId: userId);

  @override
  AdminPartner notes(String? notes) => call(notes: notes);

  @override
  AdminPartner codes(List<AdminPartnerCode> codes) => call(codes: codes);

  @override
  AdminPartner referred(int referred) => call(referred: referred);

  @override
  AdminPartner paying(int paying) => call(paying: paying);

  @override
  AdminPartner pendingUsd(num pendingUsd) => call(pendingUsd: pendingUsd);

  @override
  AdminPartner payableUsd(num payableUsd) => call(payableUsd: payableUsd);

  @override
  AdminPartner paidUsd(num paidUsd) => call(paidUsd: paidUsd);

  @override
  AdminPartner createdAt(DateTime createdAt) => call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminPartner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? pictureUrl = const $CopyWithPlaceholder(),
    Object? channelUrl = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? rate = const $CopyWithPlaceholder(),
    Object? toltPartnerId = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? notes = const $CopyWithPlaceholder(),
    Object? codes = const $CopyWithPlaceholder(),
    Object? referred = const $CopyWithPlaceholder(),
    Object? paying = const $CopyWithPlaceholder(),
    Object? pendingUsd = const $CopyWithPlaceholder(),
    Object? payableUsd = const $CopyWithPlaceholder(),
    Object? paidUsd = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return AdminPartner(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      displayName:
          displayName == const $CopyWithPlaceholder() || displayName == null
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      pictureUrl: pictureUrl == const $CopyWithPlaceholder()
          ? _value.pictureUrl
          // ignore: cast_nullable_to_non_nullable
          : pictureUrl as String?,
      channelUrl: channelUrl == const $CopyWithPlaceholder()
          ? _value.channelUrl
          // ignore: cast_nullable_to_non_nullable
          : channelUrl as String?,
      country: country == const $CopyWithPlaceholder()
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AdminPartnerStatusEnum,
      rate: rate == const $CopyWithPlaceholder()
          ? _value.rate
          // ignore: cast_nullable_to_non_nullable
          : rate as num?,
      toltPartnerId: toltPartnerId == const $CopyWithPlaceholder()
          ? _value.toltPartnerId
          // ignore: cast_nullable_to_non_nullable
          : toltPartnerId as String?,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
      notes: notes == const $CopyWithPlaceholder()
          ? _value.notes
          // ignore: cast_nullable_to_non_nullable
          : notes as String?,
      codes: codes == const $CopyWithPlaceholder() || codes == null
          ? _value.codes
          // ignore: cast_nullable_to_non_nullable
          : codes as List<AdminPartnerCode>,
      referred: referred == const $CopyWithPlaceholder() || referred == null
          ? _value.referred
          // ignore: cast_nullable_to_non_nullable
          : referred as int,
      paying: paying == const $CopyWithPlaceholder() || paying == null
          ? _value.paying
          // ignore: cast_nullable_to_non_nullable
          : paying as int,
      pendingUsd:
          pendingUsd == const $CopyWithPlaceholder() || pendingUsd == null
          ? _value.pendingUsd
          // ignore: cast_nullable_to_non_nullable
          : pendingUsd as num,
      payableUsd:
          payableUsd == const $CopyWithPlaceholder() || payableUsd == null
          ? _value.payableUsd
          // ignore: cast_nullable_to_non_nullable
          : payableUsd as num,
      paidUsd: paidUsd == const $CopyWithPlaceholder() || paidUsd == null
          ? _value.paidUsd
          // ignore: cast_nullable_to_non_nullable
          : paidUsd as num,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $AdminPartnerCopyWith on AdminPartner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminPartner.copyWith(...)` or `instanceOfAdminPartner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminPartnerCWProxy get copyWith => _$AdminPartnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminPartner _$AdminPartnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminPartner',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'display_name',
        'email',
        'picture_url',
        'channel_url',
        'country',
        'status',
        'rate',
        'tolt_partner_id',
        'user_id',
        'notes',
        'codes',
        'referred',
        'paying',
        'pending_usd',
        'payable_usd',
        'paid_usd',
        'created_at',
      ],
    );
    final val = AdminPartner(
      id: $checkedConvert('id', (v) => v as String),
      displayName: $checkedConvert('display_name', (v) => v as String),
      email: $checkedConvert('email', (v) => v as String?),
      pictureUrl: $checkedConvert('picture_url', (v) => v as String?),
      channelUrl: $checkedConvert('channel_url', (v) => v as String?),
      country: $checkedConvert('country', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$AdminPartnerStatusEnumEnumMap, v),
      ),
      rate: $checkedConvert('rate', (v) => v as num?),
      toltPartnerId: $checkedConvert('tolt_partner_id', (v) => v as String?),
      userId: $checkedConvert('user_id', (v) => v as String?),
      notes: $checkedConvert('notes', (v) => v as String?),
      codes: $checkedConvert(
        'codes',
        (v) => (v as List<dynamic>)
            .map((e) => AdminPartnerCode.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      referred: $checkedConvert('referred', (v) => (v as num).toInt()),
      paying: $checkedConvert('paying', (v) => (v as num).toInt()),
      pendingUsd: $checkedConvert('pending_usd', (v) => v as num),
      payableUsd: $checkedConvert('payable_usd', (v) => v as num),
      paidUsd: $checkedConvert('paid_usd', (v) => v as num),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'pictureUrl': 'picture_url',
    'channelUrl': 'channel_url',
    'toltPartnerId': 'tolt_partner_id',
    'userId': 'user_id',
    'pendingUsd': 'pending_usd',
    'payableUsd': 'payable_usd',
    'paidUsd': 'paid_usd',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$AdminPartnerToJson(AdminPartner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'email': instance.email,
      'picture_url': instance.pictureUrl,
      'channel_url': instance.channelUrl,
      'country': instance.country,
      'status': _$AdminPartnerStatusEnumEnumMap[instance.status]!,
      'rate': instance.rate,
      'tolt_partner_id': instance.toltPartnerId,
      'user_id': instance.userId,
      'notes': instance.notes,
      'codes': instance.codes.map((e) => e.toJson()).toList(),
      'referred': instance.referred,
      'paying': instance.paying,
      'pending_usd': instance.pendingUsd,
      'payable_usd': instance.payableUsd,
      'paid_usd': instance.paidUsd,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$AdminPartnerStatusEnumEnumMap = {
  AdminPartnerStatusEnum.applied: 'applied',
  AdminPartnerStatusEnum.active: 'active',
  AdminPartnerStatusEnum.paused: 'paused',
  AdminPartnerStatusEnum.banned: 'banned',
  AdminPartnerStatusEnum.left: 'left',
};
