//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_selfhost_license_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetSelfhostLicenseRequest {
  /// Returns a new [SetSelfhostLicenseRequest] instance.
  SetSelfhostLicenseRequest({

    required  this.license,
  });

  @JsonKey(
    
    name: r'license',
    required: true,
    includeIfNull: false,
  )


  final String license;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetSelfhostLicenseRequest &&
      other.license == license;

    @override
    int get hashCode =>
        license.hashCode;

  factory SetSelfhostLicenseRequest.fromJson(Map<String, dynamic> json) => _$SetSelfhostLicenseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetSelfhostLicenseRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

