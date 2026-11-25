// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_me.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PartnerMeCWProxy {
  PartnerMe enabled(bool enabled);

  PartnerMe sentBy(PartnerMeSentBy? sentBy);

  PartnerMe canClaim(bool canClaim);

  PartnerMe claimDaysLeft(int claimDaysLeft);

  PartnerMe partner(PartnerMePartner? partner);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PartnerMe(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PartnerMe(...).copyWith(id: 12, name: "My name")
  /// ```
  PartnerMe call({
    bool enabled,
    PartnerMeSentBy? sentBy,
    bool canClaim,
    int claimDaysLeft,
    PartnerMePartner? partner,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPartnerMe.copyWith(...)` or call `instanceOfPartnerMe.copyWith.fieldName(value)` for a single field.
class _$PartnerMeCWProxyImpl implements _$PartnerMeCWProxy {
  const _$PartnerMeCWProxyImpl(this._value);

  final PartnerMe _value;

  @override
  PartnerMe enabled(bool enabled) => call(enabled: enabled);

  @override
  PartnerMe sentBy(PartnerMeSentBy? sentBy) => call(sentBy: sentBy);

  @override
  PartnerMe canClaim(bool canClaim) => call(canClaim: canClaim);

  @override
  PartnerMe claimDaysLeft(int claimDaysLeft) =>
      call(claimDaysLeft: claimDaysLeft);

  @override
  PartnerMe partner(PartnerMePartner? partner) => call(partner: partner);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PartnerMe(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PartnerMe(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PartnerMe call({
    Object? enabled = const $CopyWithPlaceholder(),
    Object? sentBy = const $CopyWithPlaceholder(),
    Object? canClaim = const $CopyWithPlaceholder(),
    Object? claimDaysLeft = const $CopyWithPlaceholder(),
    Object? partner = const $CopyWithPlaceholder(),
  }) {
    return PartnerMe(
      enabled: enabled == const $CopyWithPlaceholder() || enabled == null
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool,
      sentBy: sentBy == const $CopyWithPlaceholder()
          ? _value.sentBy
          // ignore: cast_nullable_to_non_nullable
          : sentBy as PartnerMeSentBy?,
      canClaim: canClaim == const $CopyWithPlaceholder() || canClaim == null
          ? _value.canClaim
          // ignore: cast_nullable_to_non_nullable
          : canClaim as bool,
      claimDaysLeft:
          claimDaysLeft == const $CopyWithPlaceholder() || claimDaysLeft == null
          ? _value.claimDaysLeft
          // ignore: cast_nullable_to_non_nullable
          : claimDaysLeft as int,
      partner: partner == const $CopyWithPlaceholder()
          ? _value.partner
          // ignore: cast_nullable_to_non_nullable
          : partner as PartnerMePartner?,
    );
  }
}

extension $PartnerMeCopyWith on PartnerMe {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPartnerMe.copyWith(...)` or `instanceOfPartnerMe.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PartnerMeCWProxy get copyWith => _$PartnerMeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerMe _$PartnerMeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PartnerMe',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'enabled',
        'sent_by',
        'can_claim',
        'claim_days_left',
        'partner',
      ],
    );
    final val = PartnerMe(
      enabled: $checkedConvert('enabled', (v) => v as bool),
      sentBy: $checkedConvert(
        'sent_by',
        (v) => v == null
            ? null
            : PartnerMeSentBy.fromJson(v as Map<String, dynamic>),
      ),
      canClaim: $checkedConvert('can_claim', (v) => v as bool),
      claimDaysLeft: $checkedConvert(
        'claim_days_left',
        (v) => (v as num).toInt(),
      ),
      partner: $checkedConvert(
        'partner',
        (v) => v == null
            ? null
            : PartnerMePartner.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'sentBy': 'sent_by',
    'canClaim': 'can_claim',
    'claimDaysLeft': 'claim_days_left',
  },
);

Map<String, dynamic> _$PartnerMeToJson(PartnerMe instance) => <String, dynamic>{
  'enabled': instance.enabled,
  'sent_by': instance.sentBy?.toJson(),
  'can_claim': instance.canClaim,
  'claim_days_left': instance.claimDaysLeft,
  'partner': instance.partner?.toJson(),
};
