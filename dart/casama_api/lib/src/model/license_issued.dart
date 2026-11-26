//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'license_issued.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LicenseIssued {
  /// Returns a new [LicenseIssued] instance.
  LicenseIssued({

    required  this.license,

    required  this.expiresAt,
  });

  @JsonKey(
    
    name: r'license',
    required: true,
    includeIfNull: false,
  )


  final String license;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LicenseIssued &&
      other.license == license &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        license.hashCode +
        expiresAt.hashCode;

  factory LicenseIssued.fromJson(Map<String, dynamic> json) => _$LicenseIssuedFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseIssuedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

