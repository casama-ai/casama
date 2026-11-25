// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_admin_partner_code_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateAdminPartnerCodeRequestCWProxy {
  CreateAdminPartnerCodeRequest code(String code);

  CreateAdminPartnerCodeRequest dodoDiscountCode(String? dodoDiscountCode);

  CreateAdminPartnerCodeRequest appleOfferCode(String? appleOfferCode);

  CreateAdminPartnerCodeRequest playPromoCode(String? playPromoCode);

  CreateAdminPartnerCodeRequest waitlistUses(int? waitlistUses);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateAdminPartnerCodeRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateAdminPartnerCodeRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateAdminPartnerCodeRequest call({
    String code,
    String? dodoDiscountCode,
    String? appleOfferCode,
    String? playPromoCode,
    int? waitlistUses,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateAdminPartnerCodeRequest.copyWith(...)` or call `instanceOfCreateAdminPartnerCodeRequest.copyWith.fieldName(value)` for a single field.
class _$CreateAdminPartnerCodeRequestCWProxyImpl
    implements _$CreateAdminPartnerCodeRequestCWProxy {
  const _$CreateAdminPartnerCodeRequestCWProxyImpl(this._value);

  final CreateAdminPartnerCodeRequest _value;

  @override
  CreateAdminPartnerCodeRequest code(String code) => call(code: code);

  @override
  CreateAdminPartnerCodeRequest dodoDiscountCode(String? dodoDiscountCode) =>
      call(dodoDiscountCode: dodoDiscountCode);

  @override
  CreateAdminPartnerCodeRequest appleOfferCode(String? appleOfferCode) =>
      call(appleOfferCode: appleOfferCode);

  @override
  CreateAdminPartnerCodeRequest playPromoCode(String? playPromoCode) =>
      call(playPromoCode: playPromoCode);

  @override
  CreateAdminPartnerCodeRequest waitlistUses(int? waitlistUses) =>
      call(waitlistUses: waitlistUses);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateAdminPartnerCodeRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateAdminPartnerCodeRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateAdminPartnerCodeRequest call({
    Object? code = const $CopyWithPlaceholder(),
    Object? dodoDiscountCode = const $CopyWithPlaceholder(),
    Object? appleOfferCode = const $CopyWithPlaceholder(),
    Object? playPromoCode = const $CopyWithPlaceholder(),
    Object? waitlistUses = const $CopyWithPlaceholder(),
  }) {
    return CreateAdminPartnerCodeRequest(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
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
      waitlistUses: waitlistUses == const $CopyWithPlaceholder()
          ? _value.waitlistUses
          // ignore: cast_nullable_to_non_nullable
          : waitlistUses as int?,
    );
  }
}

extension $CreateAdminPartnerCodeRequestCopyWith
    on CreateAdminPartnerCodeRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateAdminPartnerCodeRequest.copyWith(...)` or `instanceOfCreateAdminPartnerCodeRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateAdminPartnerCodeRequestCWProxy get copyWith =>
      _$CreateAdminPartnerCodeRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdminPartnerCodeRequest _$CreateAdminPartnerCodeRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CreateAdminPartnerCodeRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['code']);
    final val = CreateAdminPartnerCodeRequest(
      code: $checkedConvert('code', (v) => v as String),
      dodoDiscountCode: $checkedConvert(
        'dodo_discount_code',
        (v) => v as String?,
      ),
      appleOfferCode: $checkedConvert('apple_offer_code', (v) => v as String?),
      playPromoCode: $checkedConvert('play_promo_code', (v) => v as String?),
      waitlistUses: $checkedConvert(
        'waitlist_uses',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dodoDiscountCode': 'dodo_discount_code',
    'appleOfferCode': 'apple_offer_code',
    'playPromoCode': 'play_promo_code',
    'waitlistUses': 'waitlist_uses',
  },
);

Map<String, dynamic> _$CreateAdminPartnerCodeRequestToJson(
  CreateAdminPartnerCodeRequest instance,
) => <String, dynamic>{
  'code': instance.code,
  'dodo_discount_code': ?instance.dodoDiscountCode,
  'apple_offer_code': ?instance.appleOfferCode,
  'play_promo_code': ?instance.playPromoCode,
  'waitlist_uses': ?instance.waitlistUses,
};
