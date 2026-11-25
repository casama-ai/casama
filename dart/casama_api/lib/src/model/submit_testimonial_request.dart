//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_testimonial_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SubmitTestimonialRequest {
  /// Returns a new [SubmitTestimonialRequest] instance.
  SubmitTestimonialRequest({

    required  this.quote,

    required  this.consent,

     this.orgId,

     this.platform,
  });

  @JsonKey(
    
    name: r'quote',
    required: true,
    includeIfNull: false,
  )


  final String quote;



  @JsonKey(
    
    name: r'consent',
    required: true,
    includeIfNull: false,
  )


  final bool consent;



  @JsonKey(
    
    name: r'org_id',
    required: false,
    includeIfNull: false,
  )


  final String? orgId;



  @JsonKey(
    
    name: r'platform',
    required: false,
    includeIfNull: false,
  )


  final String? platform;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SubmitTestimonialRequest &&
      other.quote == quote &&
      other.consent == consent &&
      other.orgId == orgId &&
      other.platform == platform;

    @override
    int get hashCode =>
        quote.hashCode +
        consent.hashCode +
        orgId.hashCode +
        platform.hashCode;

  factory SubmitTestimonialRequest.fromJson(Map<String, dynamic> json) => _$SubmitTestimonialRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitTestimonialRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

