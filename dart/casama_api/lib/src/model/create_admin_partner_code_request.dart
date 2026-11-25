//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_admin_partner_code_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateAdminPartnerCodeRequest {
  /// Returns a new [CreateAdminPartnerCodeRequest] instance.
  CreateAdminPartnerCodeRequest({

    required  this.code,

     this.dodoDiscountCode,

     this.appleOfferCode,

     this.playPromoCode,

     this.waitlistUses,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'dodo_discount_code',
    required: false,
    includeIfNull: false,
  )


  final String? dodoDiscountCode;



  @JsonKey(
    
    name: r'apple_offer_code',
    required: false,
    includeIfNull: false,
  )


  final String? appleOfferCode;



  @JsonKey(
    
    name: r'play_promo_code',
    required: false,
    includeIfNull: false,
  )


  final String? playPromoCode;



          // minimum: 0
          // maximum: 100000
  @JsonKey(
    
    name: r'waitlist_uses',
    required: false,
    includeIfNull: false,
  )


  final int? waitlistUses;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateAdminPartnerCodeRequest &&
      other.code == code &&
      other.dodoDiscountCode == dodoDiscountCode &&
      other.appleOfferCode == appleOfferCode &&
      other.playPromoCode == playPromoCode &&
      other.waitlistUses == waitlistUses;

    @override
    int get hashCode =>
        code.hashCode +
        dodoDiscountCode.hashCode +
        appleOfferCode.hashCode +
        playPromoCode.hashCode +
        waitlistUses.hashCode;

  factory CreateAdminPartnerCodeRequest.fromJson(Map<String, dynamic> json) => _$CreateAdminPartnerCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdminPartnerCodeRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

