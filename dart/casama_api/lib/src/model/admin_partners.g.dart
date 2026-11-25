// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_partners.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminPartnersCWProxy {
  AdminPartners enabled(bool enabled);

  AdminPartners platform(String? platform);

  AdminPartners rate(num rate);

  AdminPartners holdDays(int holdDays);

  AdminPartners totals(AdminPartnersTotals totals);

  AdminPartners partners(List<AdminPartner> partners);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartners(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartners(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminPartners call({
    bool enabled,
    String? platform,
    num rate,
    int holdDays,
    AdminPartnersTotals totals,
    List<AdminPartner> partners,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminPartners.copyWith(...)` or call `instanceOfAdminPartners.copyWith.fieldName(value)` for a single field.
class _$AdminPartnersCWProxyImpl implements _$AdminPartnersCWProxy {
  const _$AdminPartnersCWProxyImpl(this._value);

  final AdminPartners _value;

  @override
  AdminPartners enabled(bool enabled) => call(enabled: enabled);

  @override
  AdminPartners platform(String? platform) => call(platform: platform);

  @override
  AdminPartners rate(num rate) => call(rate: rate);

  @override
  AdminPartners holdDays(int holdDays) => call(holdDays: holdDays);

  @override
  AdminPartners totals(AdminPartnersTotals totals) => call(totals: totals);

  @override
  AdminPartners partners(List<AdminPartner> partners) =>
      call(partners: partners);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartners(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartners(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminPartners call({
    Object? enabled = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? rate = const $CopyWithPlaceholder(),
    Object? holdDays = const $CopyWithPlaceholder(),
    Object? totals = const $CopyWithPlaceholder(),
    Object? partners = const $CopyWithPlaceholder(),
  }) {
    return AdminPartners(
      enabled: enabled == const $CopyWithPlaceholder() || enabled == null
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String?,
      rate: rate == const $CopyWithPlaceholder() || rate == null
          ? _value.rate
          // ignore: cast_nullable_to_non_nullable
          : rate as num,
      holdDays: holdDays == const $CopyWithPlaceholder() || holdDays == null
          ? _value.holdDays
          // ignore: cast_nullable_to_non_nullable
          : holdDays as int,
      totals: totals == const $CopyWithPlaceholder() || totals == null
          ? _value.totals
          // ignore: cast_nullable_to_non_nullable
          : totals as AdminPartnersTotals,
      partners: partners == const $CopyWithPlaceholder() || partners == null
          ? _value.partners
          // ignore: cast_nullable_to_non_nullable
          : partners as List<AdminPartner>,
    );
  }
}

extension $AdminPartnersCopyWith on AdminPartners {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminPartners.copyWith(...)` or `instanceOfAdminPartners.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminPartnersCWProxy get copyWith => _$AdminPartnersCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminPartners _$AdminPartnersFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminPartners', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'enabled',
          'platform',
          'rate',
          'hold_days',
          'totals',
          'partners',
        ],
      );
      final val = AdminPartners(
        enabled: $checkedConvert('enabled', (v) => v as bool),
        platform: $checkedConvert('platform', (v) => v as String?),
        rate: $checkedConvert('rate', (v) => v as num),
        holdDays: $checkedConvert('hold_days', (v) => (v as num).toInt()),
        totals: $checkedConvert(
          'totals',
          (v) => AdminPartnersTotals.fromJson(v as Map<String, dynamic>),
        ),
        partners: $checkedConvert(
          'partners',
          (v) => (v as List<dynamic>)
              .map((e) => AdminPartner.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'holdDays': 'hold_days'});

Map<String, dynamic> _$AdminPartnersToJson(AdminPartners instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'platform': instance.platform,
      'rate': instance.rate,
      'hold_days': instance.holdDays,
      'totals': instance.totals.toJson(),
      'partners': instance.partners.map((e) => e.toJson()).toList(),
    };
