//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/testimonial_source.dart';
import 'package:casama_api/src/model/testimonial_place.dart';
import 'package:casama_api/src/model/testimonial_state.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_testimonial.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminTestimonial {
  /// Returns a new [AdminTestimonial] instance.
  AdminTestimonial({

    required  this.id,

    required  this.quote,

    required  this.nameShown,

    required  this.roleShown,

    required  this.source_,

    required  this.sourceUrl,

    required  this.consentText,

    required  this.consentAt,

    required  this.userEmail,

    required  this.rating,

    required  this.incentiveNote,

    required  this.places,

    required  this.sort,

    required  this.state,

    required  this.notes,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.withdrawnAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



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
    required: true,
    includeIfNull: true,
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
    required: true,
    includeIfNull: true,
  )


  final String? sourceUrl;



  @JsonKey(
    
    name: r'consent_text',
    required: true,
    includeIfNull: true,
  )


  final String? consentText;



  @JsonKey(
    
    name: r'consent_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? consentAt;



  @JsonKey(
    
    name: r'user_email',
    required: true,
    includeIfNull: true,
  )


  final String? userEmail;



          // minimum: 1
          // maximum: 5
  @JsonKey(
    
    name: r'rating',
    required: true,
    includeIfNull: true,
  )


  final int? rating;



  @JsonKey(
    
    name: r'incentive_note',
    required: true,
    includeIfNull: true,
  )


  final String? incentiveNote;



  @JsonKey(
    
    name: r'places',
    required: true,
    includeIfNull: false,
  )


  final List<TestimonialPlace> places;



  @JsonKey(
    
    name: r'sort',
    required: true,
    includeIfNull: false,
  )


  final int sort;



  @JsonKey(
    
    name: r'state',
    required: true,
    includeIfNull: false,
  )


  final TestimonialState state;



  @JsonKey(
    
    name: r'notes',
    required: true,
    includeIfNull: true,
  )


  final String? notes;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



  @JsonKey(
    
    name: r'withdrawn_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? withdrawnAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminTestimonial &&
      other.id == id &&
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
      other.notes == notes &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.withdrawnAt == withdrawnAt;

    @override
    int get hashCode =>
        id.hashCode +
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
        (notes == null ? 0 : notes.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        (withdrawnAt == null ? 0 : withdrawnAt.hashCode);

  factory AdminTestimonial.fromJson(Map<String, dynamic> json) => _$AdminTestimonialFromJson(json);

  Map<String, dynamic> toJson() => _$AdminTestimonialToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

