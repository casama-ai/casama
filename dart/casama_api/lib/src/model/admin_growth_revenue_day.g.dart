// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_revenue_day.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthRevenueDayCWProxy {
  AdminGrowthRevenueDay date(String date);

  AdminGrowthRevenueDay dodoUsd(num dodoUsd);

  AdminGrowthRevenueDay appStoreUsd(num appStoreUsd);

  AdminGrowthRevenueDay googlePlayUsd(num googlePlayUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthRevenueDay(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthRevenueDay(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthRevenueDay call({
    String date,
    num dodoUsd,
    num appStoreUsd,
    num googlePlayUsd,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthRevenueDay.copyWith(...)` or call `instanceOfAdminGrowthRevenueDay.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthRevenueDayCWProxyImpl
    implements _$AdminGrowthRevenueDayCWProxy {
  const _$AdminGrowthRevenueDayCWProxyImpl(this._value);

  final AdminGrowthRevenueDay _value;

  @override
  AdminGrowthRevenueDay date(String date) => call(date: date);

  @override
  AdminGrowthRevenueDay dodoUsd(num dodoUsd) => call(dodoUsd: dodoUsd);

  @override
  AdminGrowthRevenueDay appStoreUsd(num appStoreUsd) =>
      call(appStoreUsd: appStoreUsd);

  @override
  AdminGrowthRevenueDay googlePlayUsd(num googlePlayUsd) =>
      call(googlePlayUsd: googlePlayUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthRevenueDay(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthRevenueDay(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthRevenueDay call({
    Object? date = const $CopyWithPlaceholder(),
    Object? dodoUsd = const $CopyWithPlaceholder(),
    Object? appStoreUsd = const $CopyWithPlaceholder(),
    Object? googlePlayUsd = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthRevenueDay(
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String,
      dodoUsd: dodoUsd == const $CopyWithPlaceholder() || dodoUsd == null
          ? _value.dodoUsd
          // ignore: cast_nullable_to_non_nullable
          : dodoUsd as num,
      appStoreUsd:
          appStoreUsd == const $CopyWithPlaceholder() || appStoreUsd == null
          ? _value.appStoreUsd
          // ignore: cast_nullable_to_non_nullable
          : appStoreUsd as num,
      googlePlayUsd:
          googlePlayUsd == const $CopyWithPlaceholder() || googlePlayUsd == null
          ? _value.googlePlayUsd
          // ignore: cast_nullable_to_non_nullable
          : googlePlayUsd as num,
    );
  }
}

extension $AdminGrowthRevenueDayCopyWith on AdminGrowthRevenueDay {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthRevenueDay.copyWith(...)` or `instanceOfAdminGrowthRevenueDay.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthRevenueDayCWProxy get copyWith =>
      _$AdminGrowthRevenueDayCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthRevenueDay _$AdminGrowthRevenueDayFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminGrowthRevenueDay',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'date',
        'dodo_usd',
        'app_store_usd',
        'google_play_usd',
      ],
    );
    final val = AdminGrowthRevenueDay(
      date: $checkedConvert('date', (v) => v as String),
      dodoUsd: $checkedConvert('dodo_usd', (v) => v as num),
      appStoreUsd: $checkedConvert('app_store_usd', (v) => v as num),
      googlePlayUsd: $checkedConvert('google_play_usd', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'dodoUsd': 'dodo_usd',
    'appStoreUsd': 'app_store_usd',
    'googlePlayUsd': 'google_play_usd',
  },
);

Map<String, dynamic> _$AdminGrowthRevenueDayToJson(
  AdminGrowthRevenueDay instance,
) => <String, dynamic>{
  'date': instance.date,
  'dodo_usd': instance.dodoUsd,
  'app_store_usd': instance.appStoreUsd,
  'google_play_usd': instance.googlePlayUsd,
};
