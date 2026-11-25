//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_admin_partner_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateAdminPartnerRequest {
  /// Returns a new [CreateAdminPartnerRequest] instance.
  CreateAdminPartnerRequest({

    required  this.displayName,

     this.email,

     this.channelUrl,

     this.toltPartnerId,
  });

  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: false,
  )


  final String displayName;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'channel_url',
    required: false,
    includeIfNull: false,
  )


  final String? channelUrl;



  @JsonKey(
    
    name: r'tolt_partner_id',
    required: false,
    includeIfNull: false,
  )


  final String? toltPartnerId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateAdminPartnerRequest &&
      other.displayName == displayName &&
      other.email == email &&
      other.channelUrl == channelUrl &&
      other.toltPartnerId == toltPartnerId;

    @override
    int get hashCode =>
        displayName.hashCode +
        email.hashCode +
        channelUrl.hashCode +
        toltPartnerId.hashCode;

  factory CreateAdminPartnerRequest.fromJson(Map<String, dynamic> json) => _$CreateAdminPartnerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdminPartnerRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

