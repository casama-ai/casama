// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_revenue_source.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthRevenueSourceCWProxy {
  AdminGrowthRevenueSource source_(String source_);

  AdminGrowthRevenueSource charges(int charges);

  AdminGrowthRevenueSource grossUsd(num grossUsd);

  AdminGrowthRevenueSource netUsd(num netUsd);

  AdminGrowthRevenueSource refundedUsd(num refundedUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthRevenueSource(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthRevenueSource(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthRevenueSource call({
    String source_,
    int charges,
    num grossUsd,
    num netUsd,
    num refundedUsd,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthRevenueSource.copyWith(...)` or call `instanceOfAdminGrowthRevenueSource.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthRevenueSourceCWProxyImpl
    implements _$AdminGrowthRevenueSourceCWProxy {
  const _$AdminGrowthRevenueSourceCWProxyImpl(this._value);

  final AdminGrowthRevenueSource _value;

  @override
  AdminGrowthRevenueSource source_(String source_) => call(source_: source_);

  @override
  AdminGrowthRevenueSource charges(int charges) => call(charges: charges);

  @override
  AdminGrowthRevenueSource grossUsd(num grossUsd) => call(grossUsd: grossUsd);

  @override
  AdminGrowthRevenueSource netUsd(num netUsd) => call(netUsd: netUsd);

  @override
  AdminGrowthRevenueSource refundedUsd(num refundedUsd) =>
      call(refundedUsd: refundedUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthRevenueSource(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthRevenueSource(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthRevenueSource call({
    Object? source_ = const $CopyWithPlaceholder(),
    Object? charges = const $CopyWithPlaceholder(),
    Object? grossUsd = const $CopyWithPlaceholder(),
    Object? netUsd = const $CopyWithPlaceholder(),
    Object? refundedUsd = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthRevenueSource(
      source_: source_ == const $CopyWithPlaceholder() || source_ == null
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String,
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
    );
  }
}

extension $AdminGrowthRevenueSourceCopyWith on AdminGrowthRevenueSource {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthRevenueSource.copyWith(...)` or `instanceOfAdminGrowthRevenueSource.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthRevenueSourceCWProxy get copyWith =>
      _$AdminGrowthRevenueSourceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthRevenueSource _$AdminGrowthRevenueSourceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminGrowthRevenueSource',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'source',
        'charges',
        'gross_usd',
        'net_usd',
        'refunded_usd',
      ],
    );
    final val = AdminGrowthRevenueSource(
      source_: $checkedConvert('source', (v) => v as String),
      charges: $checkedConvert('charges', (v) => (v as num).toInt()),
      grossUsd: $checkedConvert('gross_usd', (v) => v as num),
      netUsd: $checkedConvert('net_usd', (v) => v as num),
      refundedUsd: $checkedConvert('refunded_usd', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'source_': 'source',
    'grossUsd': 'gross_usd',
    'netUsd': 'net_usd',
    'refundedUsd': 'refunded_usd',
  },
);

Map<String, dynamic> _$AdminGrowthRevenueSourceToJson(
  AdminGrowthRevenueSource instance,
) => <String, dynamic>{
  'source': instance.source_,
  'charges': instance.charges,
  'gross_usd': instance.grossUsd,
  'net_usd': instance.netUsd,
  'refunded_usd': instance.refundedUsd,
};
