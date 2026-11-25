//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_partner_code.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminPartnerCode {
  /// Returns a new [AdminPartnerCode] instance.
  AdminPartnerCode({

    required  this.code,

    required  this.status,

    required  this.dodoDiscountCode,

    required  this.appleOfferCode,

    required  this.playPromoCode,

    required  this.waitlist,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final AdminPartnerCodeStatusEnum status;



  @JsonKey(
    
    name: r'dodo_discount_code',
    required: true,
    includeIfNull: true,
  )


  final String? dodoDiscountCode;



  @JsonKey(
    
    name: r'apple_offer_code',
    required: true,
    includeIfNull: true,
  )


  final String? appleOfferCode;



  @JsonKey(
    
    name: r'play_promo_code',
    required: true,
    includeIfNull: true,
  )


  final String? playPromoCode;



  @JsonKey(
    
    name: r'waitlist',
    required: true,
    includeIfNull: false,
  )


  final bool waitlist;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminPartnerCode &&
      other.code == code &&
      other.status == status &&
      other.dodoDiscountCode == dodoDiscountCode &&
      other.appleOfferCode == appleOfferCode &&
      other.playPromoCode == playPromoCode &&
      other.waitlist == waitlist;

    @override
    int get hashCode =>
        code.hashCode +
        status.hashCode +
        (dodoDiscountCode == null ? 0 : dodoDiscountCode.hashCode) +
        (appleOfferCode == null ? 0 : appleOfferCode.hashCode) +
        (playPromoCode == null ? 0 : playPromoCode.hashCode) +
        waitlist.hashCode;

  factory AdminPartnerCode.fromJson(Map<String, dynamic> json) => _$AdminPartnerCodeFromJson(json);

  Map<String, dynamic> toJson() => _$AdminPartnerCodeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AdminPartnerCodeStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'paused')
paused(r'paused'),
@JsonValue(r'retired')
retired(r'retired');

const AdminPartnerCodeStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


