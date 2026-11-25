// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_admin_partner_code_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateAdminPartnerCodeRequestCWProxy {
  UpdateAdminPartnerCodeRequest status(
    UpdateAdminPartnerCodeRequestStatusEnum? status,
  );

  UpdateAdminPartnerCodeRequest dodoDiscountCode(String? dodoDiscountCode);

  UpdateAdminPartnerCodeRequest appleOfferCode(String? appleOfferCode);

  UpdateAdminPartnerCodeRequest playPromoCode(String? playPromoCode);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateAdminPartnerCodeRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateAdminPartnerCodeRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateAdminPartnerCodeRequest call({
    UpdateAdminPartnerCodeRequestStatusEnum? status,
    String? dodoDiscountCode,
    String? appleOfferCode,
    String? playPromoCode,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateAdminPartnerCodeRequest.copyWith(...)` or call `instanceOfUpdateAdminPartnerCodeRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateAdminPartnerCodeRequestCWProxyImpl
    implements _$UpdateAdminPartnerCodeRequestCWProxy {
  const _$UpdateAdminPartnerCodeRequestCWProxyImpl(this._value);

  final UpdateAdminPartnerCodeRequest _value;

  @override
  UpdateAdminPartnerCodeRequest status(
    UpdateAdminPartnerCodeRequestStatusEnum? status,
  ) => call(status: status);

  @override
  UpdateAdminPartnerCodeRequest dodoDiscountCode(String? dodoDiscountCode) =>
      call(dodoDiscountCode: dodoDiscountCode);

  @override
  UpdateAdminPartnerCodeRequest appleOfferCode(String? appleOfferCode) =>
      call(appleOfferCode: appleOfferCode);

  @override
  UpdateAdminPartnerCodeRequest playPromoCode(String? playPromoCode) =>
      call(playPromoCode: playPromoCode);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateAdminPartnerCodeRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateAdminPartnerCodeRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateAdminPartnerCodeRequest call({
    Object? status = const $CopyWithPlaceholder(),
    Object? dodoDiscountCode = const $CopyWithPlaceholder(),
    Object? appleOfferCode = const $CopyWithPlaceholder(),
    Object? playPromoCode = const $CopyWithPlaceholder(),
  }) {
    return UpdateAdminPartnerCodeRequest(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as UpdateAdminPartnerCodeRequestStatusEnum?,
      dodoDiscountCode: dodoDiscountCode == const $CopyWithPlaceholder()
          ? _value.dodoDiscountCode
          // ignore: cast_nullable_to_non_nullable
          : dodoDiscountCode as String?,
      appleOfferCode: appleOfferCode == const $CopyWithPlaceholder()
          ? _value.appleOfferCode
          // ignore: cast_nullable_to_non_nullable
          : appleOfferCode as String?,
      playPromoCode: playPromoCode == const $CopyWithPlaceholder()
          ? _value.playPromoCode
          // ignore: cast_nullable_to_non_nullable
          : playPromoCode as String?,
    );
  }
}

extension $UpdateAdminPartnerCodeRequestCopyWith
    on UpdateAdminPartnerCodeRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateAdminPartnerCodeRequest.copyWith(...)` or `instanceOfUpdateAdminPartnerCodeRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateAdminPartnerCodeRequestCWProxy get copyWith =>
      _$UpdateAdminPartnerCodeRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAdminPartnerCodeRequest _$UpdateAdminPartnerCodeRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateAdminPartnerCodeRequest',
  json,
  ($checkedConvert) {
    final val = UpdateAdminPartnerCodeRequest(
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(
          _$UpdateAdminPartnerCodeRequestStatusEnumEnumMap,
          v,
        ),
      ),
      dodoDiscountCode: $checkedConvert(
        'dodo_discount_code',
        (v) => v as String?,
      ),
      appleOfferCode: $checkedConvert('apple_offer_code', (v) => v as String?),
      playPromoCode: $checkedConvert('play_promo_code', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'dodoDiscountCode': 'dodo_discount_code',
    'appleOfferCode': 'apple_offer_code',
    'playPromoCode': 'play_promo_code',
  },
);

Map<String, dynamic> _$UpdateAdminPartnerCodeRequestToJson(
  UpdateAdminPartnerCodeRequest instance,
) => <String, dynamic>{
  'status': ?_$UpdateAdminPartnerCodeRequestStatusEnumEnumMap[instance.status],
  'dodo_discount_code': ?instance.dodoDiscountCode,
  'apple_offer_code': ?instance.appleOfferCode,
  'play_promo_code': ?instance.playPromoCode,
};

const _$UpdateAdminPartnerCodeRequestStatusEnumEnumMap = {
  UpdateAdminPartnerCodeRequestStatusEnum.active: 'active',
  UpdateAdminPartnerCodeRequestStatusEnum.paused: 'paused',
  UpdateAdminPartnerCodeRequestStatusEnum.retired: 'retired',
};
