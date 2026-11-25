//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_admin_partner_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateAdminPartnerRequest {
  /// Returns a new [UpdateAdminPartnerRequest] instance.
  UpdateAdminPartnerRequest({

     this.displayName,

     this.pictureUrl,

     this.channelUrl,

     this.status,

     this.rate,

     this.notes,

     this.userEmail,
  });

  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



  @JsonKey(
    
    name: r'picture_url',
    required: false,
    includeIfNull: false,
  )


  final String? pictureUrl;



  @JsonKey(
    
    name: r'channel_url',
    required: false,
    includeIfNull: false,
  )


  final String? channelUrl;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final UpdateAdminPartnerRequestStatusEnum? status;



          // minimum: 0
          // maximum: 1
  @JsonKey(
    
    name: r'rate',
    required: false,
    includeIfNull: false,
  )


  final num? rate;



  @JsonKey(
    
    name: r'notes',
    required: false,
    includeIfNull: false,
  )


  final String? notes;



  @JsonKey(
    
    name: r'user_email',
    required: false,
    includeIfNull: false,
  )


  final String? userEmail;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateAdminPartnerRequest &&
      other.displayName == displayName &&
      other.pictureUrl == pictureUrl &&
      other.channelUrl == channelUrl &&
      other.status == status &&
      other.rate == rate &&
      other.notes == notes &&
      other.userEmail == userEmail;

    @override
    int get hashCode =>
        displayName.hashCode +
        (pictureUrl == null ? 0 : pictureUrl.hashCode) +
        (channelUrl == null ? 0 : channelUrl.hashCode) +
        status.hashCode +
        (rate == null ? 0 : rate.hashCode) +
        (notes == null ? 0 : notes.hashCode) +
        (userEmail == null ? 0 : userEmail.hashCode);

  factory UpdateAdminPartnerRequest.fromJson(Map<String, dynamic> json) => _$UpdateAdminPartnerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAdminPartnerRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum UpdateAdminPartnerRequestStatusEnum {
@JsonValue(r'applied')
applied(r'applied'),
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'paused')
paused(r'paused'),
@JsonValue(r'banned')
banned(r'banned'),
@JsonValue(r'left')
left(r'left');

const UpdateAdminPartnerRequestStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


