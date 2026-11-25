// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_revenue.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthRevenueCWProxy {
  AdminGrowthRevenue charges(int charges);

  AdminGrowthRevenue grossUsd(num grossUsd);

  AdminGrowthRevenue netUsd(num netUsd);

  AdminGrowthRevenue refundedUsd(num refundedUsd);

  AdminGrowthRevenue unpricedCharges(int unpricedCharges);

  AdminGrowthRevenue bySource(List<AdminGrowthRevenueSource> bySource);

  AdminGrowthRevenue byDay(List<AdminGrowthRevenueDay> byDay);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthRevenue(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthRevenue(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthRevenue call({
    int charges,
    num grossUsd,
    num netUsd,
    num refundedUsd,
    int unpricedCharges,
    List<AdminGrowthRevenueSource> bySource,
    List<AdminGrowthRevenueDay> byDay,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthRevenue.copyWith(...)` or call `instanceOfAdminGrowthRevenue.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthRevenueCWProxyImpl implements _$AdminGrowthRevenueCWProxy {
  const _$AdminGrowthRevenueCWProxyImpl(this._value);

  final AdminGrowthRevenue _value;

  @override
  AdminGrowthRevenue charges(int charges) => call(charges: charges);

  @override
  AdminGrowthRevenue grossUsd(num grossUsd) => call(grossUsd: grossUsd);

  @override
  AdminGrowthRevenue netUsd(num netUsd) => call(netUsd: netUsd);

  @override
  AdminGrowthRevenue refundedUsd(num refundedUsd) =>
      call(refundedUsd: refundedUsd);

  @override
  AdminGrowthRevenue unpricedCharges(int unpricedCharges) =>
      call(unpricedCharges: unpricedCharges);

  @override
  AdminGrowthRevenue bySource(List<AdminGrowthRevenueSource> bySource) =>
      call(bySource: bySource);

  @override
  AdminGrowthRevenue byDay(List<AdminGrowthRevenueDay> byDay) =>
      call(byDay: byDay);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthRevenue(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthRevenue(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthRevenue call({
    Object? charges = const $CopyWithPlaceholder(),
    Object? grossUsd = const $CopyWithPlaceholder(),
    Object? netUsd = const $CopyWithPlaceholder(),
    Object? refundedUsd = const $CopyWithPlaceholder(),
    Object? unpricedCharges = const $CopyWithPlaceholder(),
    Object? bySource = const $CopyWithPlaceholder(),
    Object? byDay = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthRevenue(
      charges: charges == const $CopyWithPlaceholder() || charges == null
          ? _value.charges
          // ignore: cast_nullable_to_non_nullable
          : charges as int,
      grossUsd: grossUsd == const $CopyWithPlaceholder() || grossUsd == null
          ? _value.grossUsd
          // ignore: cast_nullable_to_non_nullable
          : grossUsd as num,
      netUsd: netUsd == const $CopyWithPlaceholder() || netUsd == null
          ? _value.netUsd
          // ignore: cast_nullable_to_non_nullable
          : netUsd as num,
      refundedUsd:
          refundedUsd == const $CopyWithPlaceholder() || refundedUsd == null
          ? _value.refundedUsd
          // ignore: cast_nullable_to_non_nullable
          : refundedUsd as num,
      unpricedCharges:
          unpricedCharges == const $CopyWithPlaceholder() ||
              unpricedCharges == null
          ? _value.unpricedCharges
          // ignore: cast_nullable_to_non_nullable
          : unpricedCharges as int,
      bySource: bySource == const $CopyWithPlaceholder() || bySource == null
          ? _value.bySource
          // ignore: cast_nullable_to_non_nullable
          : bySource as List<AdminGrowthRevenueSource>,
      byDay: byDay == const $CopyWithPlaceholder() || byDay == null
          ? _value.byDay
          // ignore: cast_nullable_to_non_nullable
          : byDay as List<AdminGrowthRevenueDay>,
    );
  }
}

extension $AdminGrowthRevenueCopyWith on AdminGrowthRevenue {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthRevenue.copyWith(...)` or `instanceOfAdminGrowthRevenue.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthRevenueCWProxy get copyWith =>
      _$AdminGrowthRevenueCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthRevenue _$AdminGrowthRevenueFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminGrowthRevenue',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'charges',
            'gross_usd',
            'net_usd',
            'refunded_usd',
            'unpriced_charges',
            'by_source',
            'by_day',
          ],
        );
        final val = AdminGrowthRevenue(
          charges: $checkedConvert('charges', (v) => (v as num).toInt()),
          grossUsd: $checkedConvert('gross_usd', (v) => v as num),
          netUsd: $checkedConvert('net_usd', (v) => v as num),
          refundedUsd: $checkedConvert('refunded_usd', (v) => v as num),
          unpricedCharges: $checkedConvert(
            'unpriced_charges',
            (v) => (v as num).toInt(),
          ),
          bySource: $checkedConvert(
            'by_source',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => AdminGrowthRevenueSource.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
          byDay: $checkedConvert(
            'by_day',
            (v) => (v as List<dynamic>)
                .map(
                  (e) =>
                      AdminGrowthRevenueDay.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'grossUsd': 'gross_usd',
        'netUsd': 'net_usd',
        'refundedUsd': 'refunded_usd',
        'unpricedCharges': 'unpriced_charges',
        'bySource': 'by_source',
        'byDay': 'by_day',
      },
    );

Map<String, dynamic> _$AdminGrowthRevenueToJson(AdminGrowthRevenue instance) =>
    <String, dynamic>{
      'charges': instance.charges,
      'gross_usd': instance.grossUsd,
      'net_usd': instance.netUsd,
      'refunded_usd': instance.refundedUsd,
      'unpriced_charges': instance.unpricedCharges,
      'by_source': instance.bySource.map((e) => e.toJson()).toList(),
      'by_day': instance.byDay.map((e) => e.toJson()).toList(),
    };
