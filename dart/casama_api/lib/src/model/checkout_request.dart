//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CheckoutRequest {
  /// Returns a new [CheckoutRequest] instance.
  CheckoutRequest({

     this.planCode,

     this.packCode,

     this.returnUrl,

     this.discountCode,

     this.expectedTotal,

     this.expectedCurrency,

     this.newSubscriptionOnly,
  });

  @JsonKey(
    
    name: r'plan_code',
    required: false,
    includeIfNull: false,
  )


  final String? planCode;



  @JsonKey(
    
    name: r'pack_code',
    required: false,
    includeIfNull: false,
  )


  final String? packCode;



  @JsonKey(
    
    name: r'return_url',
    required: false,
    includeIfNull: false,
  )


  final String? returnUrl;



      /// Discount code (case-insensitive, 3–64 letters, digits, hyphens or underscores)
  @JsonKey(
    
    name: r'discount_code',
    required: false,
    includeIfNull: false,
  )


  final String? discountCode;



      /// Immediate total from preview, in minor units (e.g. cents)
  @JsonKey(
    
    name: r'expected_total',
    required: false,
    includeIfNull: false,
  )


  final int? expectedTotal;



      /// ISO 4217 currency code matching expected_total (e.g. USD)
  @JsonKey(
    
    name: r'expected_currency',
    required: false,
    includeIfNull: false,
  )


  final String? expectedCurrency;



      /// Only start a new subscription. When the workspace already has one, answer 409 subscription_exists instead of changing it (the app previews first)
  @JsonKey(
    
    name: r'new_subscription_only',
    required: false,
    includeIfNull: false,
  )


  final bool? newSubscriptionOnly;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CheckoutRequest &&
      other.planCode == planCode &&
      other.packCode == packCode &&
      other.returnUrl == returnUrl &&
      other.discountCode == discountCode &&
      other.expectedTotal == expectedTotal &&
      other.expectedCurrency == expectedCurrency &&
      other.newSubscriptionOnly == newSubscriptionOnly;

    @override
    int get hashCode =>
        planCode.hashCode +
        packCode.hashCode +
        returnUrl.hashCode +
        discountCode.hashCode +
        expectedTotal.hashCode +
        expectedCurrency.hashCode +
        newSubscriptionOnly.hashCode;

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) => _$CheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

