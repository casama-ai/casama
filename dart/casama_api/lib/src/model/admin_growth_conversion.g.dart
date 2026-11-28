// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_conversion.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthConversionCWProxy {
  AdminGrowthConversion hitLimit(int hitLimit);

  AdminGrowthConversion sawPaywall(int sawPaywall);

  AdminGrowthConversion selectedPlan(int selectedPlan);

  AdminGrowthConversion startedCheckout(int startedCheckout);

  AdminGrowthConversion startedTrial(int startedTrial);

  AdminGrowthConversion paid(int paid);

  AdminGrowthConversion bySource(List<AdminGrowthPaywallSource> bySource);

  AdminGrowthConversion connectionFailures(
    List<AdminGrowthConnectionFailure> connectionFailures,
  );

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthConversion(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthConversion(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthConversion call({
    int hitLimit,
    int sawPaywall,
    int selectedPlan,
    int startedCheckout,
    int startedTrial,
    int paid,
    List<AdminGrowthPaywallSource> bySource,
    List<AdminGrowthConnectionFailure> connectionFailures,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthConversion.copyWith(...)` or call `instanceOfAdminGrowthConversion.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthConversionCWProxyImpl
    implements _$AdminGrowthConversionCWProxy {
  const _$AdminGrowthConversionCWProxyImpl(this._value);

  final AdminGrowthConversion _value;

  @override
  AdminGrowthConversion hitLimit(int hitLimit) => call(hitLimit: hitLimit);

  @override
  AdminGrowthConversion sawPaywall(int sawPaywall) =>
      call(sawPaywall: sawPaywall);

  @override
  AdminGrowthConversion selectedPlan(int selectedPlan) =>
      call(selectedPlan: selectedPlan);

  @override
  AdminGrowthConversion startedCheckout(int startedCheckout) =>
      call(startedCheckout: startedCheckout);

  @override
  AdminGrowthConversion startedTrial(int startedTrial) =>
      call(startedTrial: startedTrial);

  @override
  AdminGrowthConversion paid(int paid) => call(paid: paid);

  @override
  AdminGrowthConversion bySource(List<AdminGrowthPaywallSource> bySource) =>
      call(bySource: bySource);

  @override
  AdminGrowthConversion connectionFailures(
    List<AdminGrowthConnectionFailure> connectionFailures,
  ) => call(connectionFailures: connectionFailures);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthConversion(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthConversion(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthConversion call({
    Object? hitLimit = const $CopyWithPlaceholder(),
    Object? sawPaywall = const $CopyWithPlaceholder(),
    Object? selectedPlan = const $CopyWithPlaceholder(),
    Object? startedCheckout = const $CopyWithPlaceholder(),
    Object? startedTrial = const $CopyWithPlaceholder(),
    Object? paid = const $CopyWithPlaceholder(),
    Object? bySource = const $CopyWithPlaceholder(),
    Object? connectionFailures = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthConversion(
      hitLimit: hitLimit == const $CopyWithPlaceholder() || hitLimit == null
          ? _value.hitLimit
          // ignore: cast_nullable_to_non_nullable
          : hitLimit as int,
      sawPaywall:
          sawPaywall == const $CopyWithPlaceholder() || sawPaywall == null
          ? _value.sawPaywall
          // ignore: cast_nullable_to_non_nullable
          : sawPaywall as int,
      selectedPlan:
          selectedPlan == const $CopyWithPlaceholder() || selectedPlan == null
          ? _value.selectedPlan
          // ignore: cast_nullable_to_non_nullable
          : selectedPlan as int,
      startedCheckout:
          startedCheckout == const $CopyWithPlaceholder() ||
              startedCheckout == null
          ? _value.startedCheckout
          // ignore: cast_nullable_to_non_nullable
          : startedCheckout as int,
      startedTrial:
          startedTrial == const $CopyWithPlaceholder() || startedTrial == null
          ? _value.startedTrial
          // ignore: cast_nullable_to_non_nullable
          : startedTrial as int,
      paid: paid == const $CopyWithPlaceholder() || paid == null
          ? _value.paid
          // ignore: cast_nullable_to_non_nullable
          : paid as int,
      bySource: bySource == const $CopyWithPlaceholder() || bySource == null
          ? _value.bySource
          // ignore: cast_nullable_to_non_nullable
          : bySource as List<AdminGrowthPaywallSource>,
      connectionFailures:
          connectionFailures == const $CopyWithPlaceholder() ||
              connectionFailures == null
          ? _value.connectionFailures
          // ignore: cast_nullable_to_non_nullable
          : connectionFailures as List<AdminGrowthConnectionFailure>,
    );
  }
}

extension $AdminGrowthConversionCopyWith on AdminGrowthConversion {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthConversion.copyWith(...)` or `instanceOfAdminGrowthConversion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthConversionCWProxy get copyWith =>
      _$AdminGrowthConversionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthConversion _$AdminGrowthConversionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminGrowthConversion',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'hit_limit',
        'saw_paywall',
        'selected_plan',
        'started_checkout',
        'started_trial',
        'paid',
        'by_source',
        'connection_failures',
      ],
    );
    final val = AdminGrowthConversion(
      hitLimit: $checkedConvert('hit_limit', (v) => (v as num).toInt()),
      sawPaywall: $checkedConvert('saw_paywall', (v) => (v as num).toInt()),
      selectedPlan: $checkedConvert('selected_plan', (v) => (v as num).toInt()),
      startedCheckout: $checkedConvert(
        'started_checkout',
        (v) => (v as num).toInt(),
      ),
      startedTrial: $checkedConvert('started_trial', (v) => (v as num).toInt()),
      paid: $checkedConvert('paid', (v) => (v as num).toInt()),
      bySource: $checkedConvert(
        'by_source',
        (v) => (v as List<dynamic>)
            .map(
              (e) =>
                  AdminGrowthPaywallSource.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      connectionFailures: $checkedConvert(
        'connection_failures',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminGrowthConnectionFailure.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'hitLimit': 'hit_limit',
    'sawPaywall': 'saw_paywall',
    'selectedPlan': 'selected_plan',
    'startedCheckout': 'started_checkout',
    'startedTrial': 'started_trial',
    'bySource': 'by_source',
    'connectionFailures': 'connection_failures',
  },
);

Map<String, dynamic> _$AdminGrowthConversionToJson(
  AdminGrowthConversion instance,
) => <String, dynamic>{
  'hit_limit': instance.hitLimit,
  'saw_paywall': instance.sawPaywall,
  'selected_plan': instance.selectedPlan,
  'started_checkout': instance.startedCheckout,
  'started_trial': instance.startedTrial,
  'paid': instance.paid,
  'by_source': instance.bySource.map((e) => e.toJson()).toList(),
  'connection_failures': instance.connectionFailures
      .map((e) => e.toJson())
      .toList(),
};
