//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trial_license_accepted.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TrialLicenseAccepted {
  /// Returns a new [TrialLicenseAccepted] instance.
  TrialLicenseAccepted({

    required  this.ok,
  });

  @JsonKey(
    
    name: r'ok',
    required: true,
    includeIfNull: false,
  )


  final bool ok;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TrialLicenseAccepted &&
      other.ok == ok;

    @override
    int get hashCode =>
        ok.hashCode;

  factory TrialLicenseAccepted.fromJson(Map<String, dynamic> json) => _$TrialLicenseAcceptedFromJson(json);

  Map<String, dynamic> toJson() => _$TrialLicenseAcceptedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

