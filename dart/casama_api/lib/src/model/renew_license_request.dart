//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'renew_license_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RenewLicenseRequest {
  /// Returns a new [RenewLicenseRequest] instance.
  RenewLicenseRequest({

    required  this.license,

    required  this.instanceId,

    required  this.engineVersion,

     this.members,

     this.bots,
  });

  @JsonKey(
    
    name: r'license',
    required: true,
    includeIfNull: false,
  )


  final String license;



  @JsonKey(
    
    name: r'instance_id',
    required: true,
    includeIfNull: false,
  )


  final String instanceId;



  @JsonKey(
    
    name: r'engine_version',
    required: true,
    includeIfNull: false,
  )


  final String engineVersion;



          // minimum: 0
          // maximum: 10000000
  @JsonKey(
    
    name: r'members',
    required: false,
    includeIfNull: false,
  )


  final int? members;



          // minimum: 0
          // maximum: 10000000
  @JsonKey(
    
    name: r'bots',
    required: false,
    includeIfNull: false,
  )


  final int? bots;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RenewLicenseRequest &&
      other.license == license &&
      other.instanceId == instanceId &&
      other.engineVersion == engineVersion &&
      other.members == members &&
      other.bots == bots;

    @override
    int get hashCode =>
        license.hashCode +
        instanceId.hashCode +
        engineVersion.hashCode +
        members.hashCode +
        bots.hashCode;

  factory RenewLicenseRequest.fromJson(Map<String, dynamic> json) => _$RenewLicenseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RenewLicenseRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

