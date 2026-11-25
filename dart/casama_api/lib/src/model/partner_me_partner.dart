//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partner_me_partner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PartnerMePartner {
  /// Returns a new [PartnerMePartner] instance.
  PartnerMePartner({

    required  this.code,

    required  this.link,

    required  this.status,

    required  this.portalUrl,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'link',
    required: true,
    includeIfNull: false,
  )


  final String link;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final String status;



  @JsonKey(
    
    name: r'portal_url',
    required: true,
    includeIfNull: false,
  )


  final String portalUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PartnerMePartner &&
      other.code == code &&
      other.link == link &&
      other.status == status &&
      other.portalUrl == portalUrl;

    @override
    int get hashCode =>
        code.hashCode +
        link.hashCode +
        status.hashCode +
        portalUrl.hashCode;

  factory PartnerMePartner.fromJson(Map<String, dynamic> json) => _$PartnerMePartnerFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerMePartnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

