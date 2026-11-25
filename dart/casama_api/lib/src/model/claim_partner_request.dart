//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'claim_partner_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClaimPartnerRequest {
  /// Returns a new [ClaimPartnerRequest] instance.
  ClaimPartnerRequest({

    required  this.code,

     this.via,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'via',
    required: false,
    includeIfNull: false,
  )


  final ClaimPartnerRequestViaEnum? via;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClaimPartnerRequest &&
      other.code == code &&
      other.via == via;

    @override
    int get hashCode =>
        code.hashCode +
        via.hashCode;

  factory ClaimPartnerRequest.fromJson(Map<String, dynamic> json) => _$ClaimPartnerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimPartnerRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum ClaimPartnerRequestViaEnum {
@JsonValue(r'link_web')
linkWeb(r'link_web'),
@JsonValue(r'play_referrer')
playReferrer(r'play_referrer'),
@JsonValue(r'typed')
typed(r'typed');

const ClaimPartnerRequestViaEnum(this.value);

final String value;

@override
String toString() => value;
}


