//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trial_license_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TrialLicenseRequest {
  /// Returns a new [TrialLicenseRequest] instance.
  TrialLicenseRequest({

    required  this.email,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TrialLicenseRequest &&
      other.email == email;

    @override
    int get hashCode =>
        email.hashCode;

  factory TrialLicenseRequest.fromJson(Map<String, dynamic> json) => _$TrialLicenseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TrialLicenseRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

