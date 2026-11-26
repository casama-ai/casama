//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_license_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonalLicenseRequest {
  /// Returns a new [PersonalLicenseRequest] instance.
  PersonalLicenseRequest({

    required  this.instanceId,

    required  this.engineVersion,
  });

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





    @override
    bool operator ==(Object other) => identical(this, other) || other is PersonalLicenseRequest &&
      other.instanceId == instanceId &&
      other.engineVersion == engineVersion;

    @override
    int get hashCode =>
        instanceId.hashCode +
        engineVersion.hashCode;

  factory PersonalLicenseRequest.fromJson(Map<String, dynamic> json) => _$PersonalLicenseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalLicenseRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

