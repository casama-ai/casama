//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/testimonial_source.dart';
import 'package:casama_api/src/model/testimonial_place.dart';
import 'package:casama_api/src/model/testimonial_state.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_admin_testimonial_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateAdminTestimonialRequest {
  /// Returns a new [CreateAdminTestimonialRequest] instance.
  CreateAdminTestimonialRequest({

    required  this.quote,

    required  this.nameShown,

     this.roleShown,

    required  this.source_,

     this.sourceUrl,

     this.consentText,

     this.consentAt,

     this.userEmail,

     this.rating,

     this.incentiveNote,

     this.places,

     this.sort,

     this.state,

     this.notes,
  });

  @JsonKey(
    
    name: r'quote',
    required: true,
    includeIfNull: false,
  )


  final String quote;



  @JsonKey(
    
    name: r'name_shown',
    required: true,
    includeIfNull: false,
  )


  final String nameShown;



  @JsonKey(
    
    name: r'role_shown',
    required: false,
    includeIfNull: false,
  )


  final String? roleShown;



  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  )


  final TestimonialSource source_;



  @JsonKey(
    
    name: r'source_url',
    required: false,
    includeIfNull: false,
  )


  final String? sourceUrl;



  @JsonKey(
    
    name: r'consent_text',
    required: false,
    includeIfNull: false,
  )


  final String? consentText;



  @JsonKey(
    
    name: r'consent_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? consentAt;



  @JsonKey(
    
    name: r'user_email',
    required: false,
    includeIfNull: false,
  )


  final String? userEmail;



          // minimum: 0
          // maximum: 5
  @JsonKey(
    
    name: r'rating',
    required: false,
    includeIfNull: false,
  )


  final int? rating;



  @JsonKey(
    
    name: r'incentive_note',
    required: false,
    includeIfNull: false,
  )


  final String? incentiveNote;



  @JsonKey(
    
    name: r'places',
    required: false,
    includeIfNull: false,
  )


  final List<TestimonialPlace>? places;



          // minimum: -100000
          // maximum: 100000
  @JsonKey(
    
    name: r'sort',
    required: false,
    includeIfNull: false,
  )


  final int? sort;



  @JsonKey(
    
    name: r'state',
    required: false,
    includeIfNull: false,
  )


  final TestimonialState? state;



  @JsonKey(
    
    name: r'notes',
    required: false,
    includeIfNull: false,
  )


  final String? notes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateAdminTestimonialRequest &&
      other.quote == quote &&
      other.nameShown == nameShown &&
      other.roleShown == roleShown &&
      other.source_ == source_ &&
      other.sourceUrl == sourceUrl &&
      other.consentText == consentText &&
      other.consentAt == consentAt &&
      other.userEmail == userEmail &&
      other.rating == rating &&
      other.incentiveNote == incentiveNote &&
      other.places == places &&
      other.sort == sort &&
      other.state == state &&
      other.notes == notes;

    @override
    int get hashCode =>
        quote.hashCode +
        nameShown.hashCode +
        (roleShown == null ? 0 : roleShown.hashCode) +
        source_.hashCode +
        (sourceUrl == null ? 0 : sourceUrl.hashCode) +
        (consentText == null ? 0 : consentText.hashCode) +
        (consentAt == null ? 0 : consentAt.hashCode) +
        (userEmail == null ? 0 : userEmail.hashCode) +
        (rating == null ? 0 : rating.hashCode) +
        (incentiveNote == null ? 0 : incentiveNote.hashCode) +
        places.hashCode +
        sort.hashCode +
        state.hashCode +
        (notes == null ? 0 : notes.hashCode);

  factory CreateAdminTestimonialRequest.fromJson(Map<String, dynamic> json) => _$CreateAdminTestimonialRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdminTestimonialRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

