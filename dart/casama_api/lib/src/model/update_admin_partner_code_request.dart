//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_admin_partner_code_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateAdminPartnerCodeRequest {
  /// Returns a new [UpdateAdminPartnerCodeRequest] instance.
  UpdateAdminPartnerCodeRequest({

     this.status,

     this.dodoDiscountCode,

     this.appleOfferCode,

     this.playPromoCode,
  });

  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final UpdateAdminPartnerCodeRequestStatusEnum? status;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateAdminPartnerCodeRequest &&
      other.status == status &&
      other.dodoDiscountCode == dodoDiscountCode &&
      other.appleOfferCode == appleOfferCode &&
      other.playPromoCode == playPromoCode;

    @override
    int get hashCode =>
        status.hashCode +
        (dodoDiscountCode == null ? 0 : dodoDiscountCode.hashCode) +
        (appleOfferCode == null ? 0 : appleOfferCode.hashCode) +
        (playPromoCode == null ? 0 : playPromoCode.hashCode);

  factory UpdateAdminPartnerCodeRequest.fromJson(Map<String, dynamic> json) => _$UpdateAdminPartnerCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAdminPartnerCodeRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum UpdateAdminPartnerCodeRequestStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'paused')
paused(r'paused'),
@JsonValue(r'retired')
retired(r'retired');

const UpdateAdminPartnerCodeRequestStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


