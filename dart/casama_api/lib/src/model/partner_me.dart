//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/partner_me_sent_by.dart';
import 'package:casama_api/src/model/partner_me_partner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partner_me.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PartnerMe {
  /// Returns a new [PartnerMe] instance.
  PartnerMe({

    required  this.enabled,

    required  this.sentBy,

    required  this.canClaim,

    required  this.claimDaysLeft,

    required  this.partner,
  });

  @JsonKey(
    
    name: r'enabled',
    required: true,
    includeIfNull: false,
  )


  final bool enabled;



  @JsonKey(
    
    name: r'sent_by',
    required: true,
    includeIfNull: true,
  )


  final PartnerMeSentBy? sentBy;



  @JsonKey(
    
    name: r'can_claim',
    required: true,
    includeIfNull: false,
  )


  final bool canClaim;



  @JsonKey(
    
    name: r'claim_days_left',
    required: true,
    includeIfNull: false,
  )


  final int claimDaysLeft;



  @JsonKey(
    
    name: r'partner',
    required: true,
    includeIfNull: true,
  )


  final PartnerMePartner? partner;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PartnerMe &&
      other.enabled == enabled &&
      other.sentBy == sentBy &&
      other.canClaim == canClaim &&
      other.claimDaysLeft == claimDaysLeft &&
      other.partner == partner;

    @override
    int get hashCode =>
        enabled.hashCode +
        (sentBy == null ? 0 : sentBy.hashCode) +
        canClaim.hashCode +
        claimDaysLeft.hashCode +
        (partner == null ? 0 : partner.hashCode);

  factory PartnerMe.fromJson(Map<String, dynamic> json) => _$PartnerMeFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerMeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

