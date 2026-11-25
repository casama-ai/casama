// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_partner_code.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminPartnerCodeCWProxy {
  AdminPartnerCode code(String code);

  AdminPartnerCode status(AdminPartnerCodeStatusEnum status);

  AdminPartnerCode dodoDiscountCode(String? dodoDiscountCode);

  AdminPartnerCode appleOfferCode(String? appleOfferCode);

  AdminPartnerCode playPromoCode(String? playPromoCode);

  AdminPartnerCode waitlist(bool waitlist);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartnerCode(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartnerCode(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminPartnerCode call({
    String code,
    AdminPartnerCodeStatusEnum status,
    String? dodoDiscountCode,
    String? appleOfferCode,
    String? playPromoCode,
    bool waitlist,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminPartnerCode.copyWith(...)` or call `instanceOfAdminPartnerCode.copyWith.fieldName(value)` for a single field.
class _$AdminPartnerCodeCWProxyImpl implements _$AdminPartnerCodeCWProxy {
  const _$AdminPartnerCodeCWProxyImpl(this._value);

  final AdminPartnerCode _value;

  @override
  AdminPartnerCode code(String code) => call(code: code);

  @override
  AdminPartnerCode status(AdminPartnerCodeStatusEnum status) =>
      call(status: status);

  @override
  AdminPartnerCode dodoDiscountCode(String? dodoDiscountCode) =>
      call(dodoDiscountCode: dodoDiscountCode);

  @override
  AdminPartnerCode appleOfferCode(String? appleOfferCode) =>
      call(appleOfferCode: appleOfferCode);

  @override
  AdminPartnerCode playPromoCode(String? playPromoCode) =>
      call(playPromoCode: playPromoCode);

  @override
  AdminPartnerCode waitlist(bool waitlist) => call(waitlist: waitlist);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartnerCode(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartnerCode(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminPartnerCode call({
    Object? code = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? dodoDiscountCode = const $CopyWithPlaceholder(),
    Object? appleOfferCode = const $CopyWithPlaceholder(),
    Object? playPromoCode = const $CopyWithPlaceholder(),
    Object? waitlist = const $CopyWithPlaceholder(),
  }) {
    return AdminPartnerCode(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AdminPartnerCodeStatusEnum,
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
      waitlist: waitlist == const $CopyWithPlaceholder() || waitlist == null
          ? _value.waitlist
          // ignore: cast_nullable_to_non_nullable
          : waitlist as bool,
    );
  }
}

extension $AdminPartnerCodeCopyWith on AdminPartnerCode {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminPartnerCode.copyWith(...)` or `instanceOfAdminPartnerCode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminPartnerCodeCWProxy get copyWith => _$AdminPartnerCodeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminPartnerCode _$AdminPartnerCodeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminPartnerCode',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'code',
        'status',
        'dodo_discount_code',
        'apple_offer_code',
        'play_promo_code',
        'waitlist',
      ],
    );
    final val = AdminPartnerCode(
      code: $checkedConvert('code', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$AdminPartnerCodeStatusEnumEnumMap, v),
      ),
      dodoDiscountCode: $checkedConvert(
        'dodo_discount_code',
        (v) => v as String?,
      ),
      appleOfferCode: $checkedConvert('apple_offer_code', (v) => v as String?),
      playPromoCode: $checkedConvert('play_promo_code', (v) => v as String?),
      waitlist: $checkedConvert('waitlist', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'dodoDiscountCode': 'dodo_discount_code',
    'appleOfferCode': 'apple_offer_code',
    'playPromoCode': 'play_promo_code',
  },
);

Map<String, dynamic> _$AdminPartnerCodeToJson(AdminPartnerCode instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': _$AdminPartnerCodeStatusEnumEnumMap[instance.status]!,
      'dodo_discount_code': instance.dodoDiscountCode,
      'apple_offer_code': instance.appleOfferCode,
      'play_promo_code': instance.playPromoCode,
      'waitlist': instance.waitlist,
    };

const _$AdminPartnerCodeStatusEnumEnumMap = {
  AdminPartnerCodeStatusEnum.active: 'active',
  AdminPartnerCodeStatusEnum.paused: 'paused',
  AdminPartnerCodeStatusEnum.retired: 'retired',
};
