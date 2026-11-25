// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CheckoutRequestCWProxy {
  CheckoutRequest planCode(String? planCode);

  CheckoutRequest packCode(String? packCode);

  CheckoutRequest returnUrl(String? returnUrl);

  CheckoutRequest discountCode(String? discountCode);

  CheckoutRequest expectedTotal(int? expectedTotal);

  CheckoutRequest expectedCurrency(String? expectedCurrency);

  CheckoutRequest newSubscriptionOnly(bool? newSubscriptionOnly);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CheckoutRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CheckoutRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CheckoutRequest call({
    String? planCode,
    String? packCode,
    String? returnUrl,
    String? discountCode,
    int? expectedTotal,
    String? expectedCurrency,
    bool? newSubscriptionOnly,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCheckoutRequest.copyWith(...)` or call `instanceOfCheckoutRequest.copyWith.fieldName(value)` for a single field.
class _$CheckoutRequestCWProxyImpl implements _$CheckoutRequestCWProxy {
  const _$CheckoutRequestCWProxyImpl(this._value);

  final CheckoutRequest _value;

  @override
  CheckoutRequest planCode(String? planCode) => call(planCode: planCode);

  @override
  CheckoutRequest packCode(String? packCode) => call(packCode: packCode);

  @override
  CheckoutRequest returnUrl(String? returnUrl) => call(returnUrl: returnUrl);

  @override
  CheckoutRequest discountCode(String? discountCode) =>
      call(discountCode: discountCode);

  @override
  CheckoutRequest expectedTotal(int? expectedTotal) =>
      call(expectedTotal: expectedTotal);

  @override
  CheckoutRequest expectedCurrency(String? expectedCurrency) =>
      call(expectedCurrency: expectedCurrency);

  @override
  CheckoutRequest newSubscriptionOnly(bool? newSubscriptionOnly) =>
      call(newSubscriptionOnly: newSubscriptionOnly);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CheckoutRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CheckoutRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CheckoutRequest call({
    Object? planCode = const $CopyWithPlaceholder(),
    Object? packCode = const $CopyWithPlaceholder(),
    Object? returnUrl = const $CopyWithPlaceholder(),
    Object? discountCode = const $CopyWithPlaceholder(),
    Object? expectedTotal = const $CopyWithPlaceholder(),
    Object? expectedCurrency = const $CopyWithPlaceholder(),
    Object? newSubscriptionOnly = const $CopyWithPlaceholder(),
  }) {
    return CheckoutRequest(
      planCode: planCode == const $CopyWithPlaceholder()
          ? _value.planCode
          // ignore: cast_nullable_to_non_nullable
          : planCode as String?,
      packCode: packCode == const $CopyWithPlaceholder()
          ? _value.packCode
          // ignore: cast_nullable_to_non_nullable
          : packCode as String?,
      returnUrl: returnUrl == const $CopyWithPlaceholder()
          ? _value.returnUrl
          // ignore: cast_nullable_to_non_nullable
          : returnUrl as String?,
      discountCode: discountCode == const $CopyWithPlaceholder()
          ? _value.discountCode
          // ignore: cast_nullable_to_non_nullable
          : discountCode as String?,
      expectedTotal: expectedTotal == const $CopyWithPlaceholder()
          ? _value.expectedTotal
          // ignore: cast_nullable_to_non_nullable
          : expectedTotal as int?,
      expectedCurrency: expectedCurrency == const $CopyWithPlaceholder()
          ? _value.expectedCurrency
          // ignore: cast_nullable_to_non_nullable
          : expectedCurrency as String?,
      newSubscriptionOnly: newSubscriptionOnly == const $CopyWithPlaceholder()
          ? _value.newSubscriptionOnly
          // ignore: cast_nullable_to_non_nullable
          : newSubscriptionOnly as bool?,
    );
  }
}

extension $CheckoutRequestCopyWith on CheckoutRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCheckoutRequest.copyWith(...)` or `instanceOfCheckoutRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CheckoutRequestCWProxy get copyWith => _$CheckoutRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CheckoutRequest',
      json,
      ($checkedConvert) {
        final val = CheckoutRequest(
          planCode: $checkedConvert('plan_code', (v) => v as String?),
          packCode: $checkedConvert('pack_code', (v) => v as String?),
          returnUrl: $checkedConvert('return_url', (v) => v as String?),
          discountCode: $checkedConvert('discount_code', (v) => v as String?),
          expectedTotal: $checkedConvert(
            'expected_total',
            (v) => (v as num?)?.toInt(),
          ),
          expectedCurrency: $checkedConvert(
            'expected_currency',
            (v) => v as String?,
          ),
          newSubscriptionOnly: $checkedConvert(
            'new_subscription_only',
            (v) => v as bool?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'planCode': 'plan_code',
        'packCode': 'pack_code',
        'returnUrl': 'return_url',
        'discountCode': 'discount_code',
        'expectedTotal': 'expected_total',
        'expectedCurrency': 'expected_currency',
        'newSubscriptionOnly': 'new_subscription_only',
      },
    );

Map<String, dynamic> _$CheckoutRequestToJson(CheckoutRequest instance) =>
    <String, dynamic>{
      'plan_code': ?instance.planCode,
      'pack_code': ?instance.packCode,
      'return_url': ?instance.returnUrl,
      'discount_code': ?instance.discountCode,
      'expected_total': ?instance.expectedTotal,
      'expected_currency': ?instance.expectedCurrency,
      'new_subscription_only': ?instance.newSubscriptionOnly,
    };
