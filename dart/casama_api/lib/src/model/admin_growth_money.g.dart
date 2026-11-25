// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_money.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthMoneyCWProxy {
  AdminGrowthMoney paidSubscribers(int paidSubscribers);

  AdminGrowthMoney monthlyUsd(num monthlyUsd);

  AdminGrowthMoney lifetimeUsd(num lifetimeUsd);

  AdminGrowthMoney lifetimeNetUsd(num lifetimeNetUsd);

  AdminGrowthMoney newPaid(int newPaid);

  AdminGrowthMoney compActive(int compActive);

  AdminGrowthMoney testActive(int testActive);

  AdminGrowthMoney byPlan(List<AdminGrowthPlan> byPlan);

  AdminGrowthMoney revenue(AdminGrowthRevenue revenue);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthMoney(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthMoney(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthMoney call({
    int paidSubscribers,
    num monthlyUsd,
    num lifetimeUsd,
    num lifetimeNetUsd,
    int newPaid,
    int compActive,
    int testActive,
    List<AdminGrowthPlan> byPlan,
    AdminGrowthRevenue revenue,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthMoney.copyWith(...)` or call `instanceOfAdminGrowthMoney.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthMoneyCWProxyImpl implements _$AdminGrowthMoneyCWProxy {
  const _$AdminGrowthMoneyCWProxyImpl(this._value);

  final AdminGrowthMoney _value;

  @override
  AdminGrowthMoney paidSubscribers(int paidSubscribers) =>
      call(paidSubscribers: paidSubscribers);

  @override
  AdminGrowthMoney monthlyUsd(num monthlyUsd) => call(monthlyUsd: monthlyUsd);

  @override
  AdminGrowthMoney lifetimeUsd(num lifetimeUsd) =>
      call(lifetimeUsd: lifetimeUsd);

  @override
  AdminGrowthMoney lifetimeNetUsd(num lifetimeNetUsd) =>
      call(lifetimeNetUsd: lifetimeNetUsd);

  @override
  AdminGrowthMoney newPaid(int newPaid) => call(newPaid: newPaid);

  @override
  AdminGrowthMoney compActive(int compActive) => call(compActive: compActive);

  @override
  AdminGrowthMoney testActive(int testActive) => call(testActive: testActive);

  @override
  AdminGrowthMoney byPlan(List<AdminGrowthPlan> byPlan) => call(byPlan: byPlan);

  @override
  AdminGrowthMoney revenue(AdminGrowthRevenue revenue) =>
      call(revenue: revenue);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthMoney(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthMoney(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthMoney call({
    Object? paidSubscribers = const $CopyWithPlaceholder(),
    Object? monthlyUsd = const $CopyWithPlaceholder(),
    Object? lifetimeUsd = const $CopyWithPlaceholder(),
    Object? lifetimeNetUsd = const $CopyWithPlaceholder(),
    Object? newPaid = const $CopyWithPlaceholder(),
    Object? compActive = const $CopyWithPlaceholder(),
    Object? testActive = const $CopyWithPlaceholder(),
    Object? byPlan = const $CopyWithPlaceholder(),
    Object? revenue = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthMoney(
      paidSubscribers:
          paidSubscribers == const $CopyWithPlaceholder() ||
              paidSubscribers == null
          ? _value.paidSubscribers
          // ignore: cast_nullable_to_non_nullable
          : paidSubscribers as int,
      monthlyUsd:
          monthlyUsd == const $CopyWithPlaceholder() || monthlyUsd == null
          ? _value.monthlyUsd
          // ignore: cast_nullable_to_non_nullable
          : monthlyUsd as num,
      lifetimeUsd:
          lifetimeUsd == const $CopyWithPlaceholder() || lifetimeUsd == null
          ? _value.lifetimeUsd
          // ignore: cast_nullable_to_non_nullable
          : lifetimeUsd as num,
      lifetimeNetUsd:
          lifetimeNetUsd == const $CopyWithPlaceholder() ||
              lifetimeNetUsd == null
          ? _value.lifetimeNetUsd
          // ignore: cast_nullable_to_non_nullable
          : lifetimeNetUsd as num,
      newPaid: newPaid == const $CopyWithPlaceholder() || newPaid == null
          ? _value.newPaid
          // ignore: cast_nullable_to_non_nullable
          : newPaid as int,
      compActive:
          compActive == const $CopyWithPlaceholder() || compActive == null
          ? _value.compActive
          // ignore: cast_nullable_to_non_nullable
          : compActive as int,
      testActive:
          testActive == const $CopyWithPlaceholder() || testActive == null
          ? _value.testActive
          // ignore: cast_nullable_to_non_nullable
          : testActive as int,
      byPlan: byPlan == const $CopyWithPlaceholder() || byPlan == null
          ? _value.byPlan
          // ignore: cast_nullable_to_non_nullable
          : byPlan as List<AdminGrowthPlan>,
      revenue: revenue == const $CopyWithPlaceholder() || revenue == null
          ? _value.revenue
          // ignore: cast_nullable_to_non_nullable
          : revenue as AdminGrowthRevenue,
    );
  }
}

extension $AdminGrowthMoneyCopyWith on AdminGrowthMoney {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthMoney.copyWith(...)` or `instanceOfAdminGrowthMoney.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthMoneyCWProxy get copyWith => _$AdminGrowthMoneyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthMoney _$AdminGrowthMoneyFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminGrowthMoney',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'paid_subscribers',
            'monthly_usd',
            'lifetime_usd',
            'lifetime_net_usd',
            'new_paid',
            'comp_active',
            'test_active',
            'by_plan',
            'revenue',
          ],
        );
        final val = AdminGrowthMoney(
          paidSubscribers: $checkedConvert(
            'paid_subscribers',
            (v) => (v as num).toInt(),
          ),
          monthlyUsd: $checkedConvert('monthly_usd', (v) => v as num),
          lifetimeUsd: $checkedConvert('lifetime_usd', (v) => v as num),
          lifetimeNetUsd: $checkedConvert('lifetime_net_usd', (v) => v as num),
          newPaid: $checkedConvert('new_paid', (v) => (v as num).toInt()),
          compActive: $checkedConvert('comp_active', (v) => (v as num).toInt()),
          testActive: $checkedConvert('test_active', (v) => (v as num).toInt()),
          byPlan: $checkedConvert(
            'by_plan',
            (v) => (v as List<dynamic>)
                .map((e) => AdminGrowthPlan.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          revenue: $checkedConvert(
            'revenue',
            (v) => AdminGrowthRevenue.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'paidSubscribers': 'paid_subscribers',
        'monthlyUsd': 'monthly_usd',
        'lifetimeUsd': 'lifetime_usd',
        'lifetimeNetUsd': 'lifetime_net_usd',
        'newPaid': 'new_paid',
        'compActive': 'comp_active',
        'testActive': 'test_active',
        'byPlan': 'by_plan',
      },
    );

Map<String, dynamic> _$AdminGrowthMoneyToJson(AdminGrowthMoney instance) =>
    <String, dynamic>{
      'paid_subscribers': instance.paidSubscribers,
      'monthly_usd': instance.monthlyUsd,
      'lifetime_usd': instance.lifetimeUsd,
      'lifetime_net_usd': instance.lifetimeNetUsd,
      'new_paid': instance.newPaid,
      'comp_active': instance.compActive,
      'test_active': instance.testActive,
      'by_plan': instance.byPlan.map((e) => e.toJson()).toList(),
      'revenue': instance.revenue.toJson(),
    };
