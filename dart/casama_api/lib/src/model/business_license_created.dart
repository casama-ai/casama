//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'business_license_created.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BusinessLicenseCreated {
  /// Returns a new [BusinessLicenseCreated] instance.
  BusinessLicenseCreated({

    required  this.id,

    required  this.license,

    required  this.expiresAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



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
    bool operator ==(Object other) => identical(this, other) || other is BusinessLicenseCreated &&
      other.id == id &&
      other.license == license &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        id.hashCode +
        license.hashCode +
        expiresAt.hashCode;

  factory BusinessLicenseCreated.fromJson(Map<String, dynamic> json) => _$BusinessLicenseCreatedFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessLicenseCreatedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

