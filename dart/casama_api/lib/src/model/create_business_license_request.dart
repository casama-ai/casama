//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/license_feature.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_business_license_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateBusinessLicenseRequest {
  /// Returns a new [CreateBusinessLicenseRequest] instance.
  CreateBusinessLicenseRequest({

    required  this.customer,

    required  this.email,

    required  this.seats,

     this.features,

    required  this.expiresAt,

     this.offline,
  });

  @JsonKey(
    
    name: r'customer',
    required: true,
    includeIfNull: false,
  )


  final String customer;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



          // minimum: 1
          // maximum: 100000
  @JsonKey(
    
    name: r'seats',
    required: true,
    includeIfNull: false,
  )


  final int seats;



  @JsonKey(
    
    name: r'features',
    required: false,
    includeIfNull: false,
  )


  final List<LicenseFeature>? features;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



  @JsonKey(
    
    name: r'offline',
    required: false,
    includeIfNull: false,
  )


  final bool? offline;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateBusinessLicenseRequest &&
      other.customer == customer &&
      other.email == email &&
      other.seats == seats &&
      other.features == features &&
      other.expiresAt == expiresAt &&
      other.offline == offline;

    @override
    int get hashCode =>
        customer.hashCode +
        email.hashCode +
        seats.hashCode +
        features.hashCode +
        expiresAt.hashCode +
        offline.hashCode;

  factory CreateBusinessLicenseRequest.fromJson(Map<String, dynamic> json) => _$CreateBusinessLicenseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBusinessLicenseRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

