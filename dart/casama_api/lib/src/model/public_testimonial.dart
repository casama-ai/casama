//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/testimonial_source.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'public_testimonial.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PublicTestimonial {
  /// Returns a new [PublicTestimonial] instance.
  PublicTestimonial({

    required  this.quote,

    required  this.nameShown,

    required  this.roleShown,

    required  this.rating,

    required  this.source_,

    required  this.sourceUrl,

    required  this.incentiveNote,
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
    required: true,
    includeIfNull: true,
  )


  final String? roleShown;



          // minimum: 1
          // maximum: 5
  @JsonKey(
    
    name: r'rating',
    required: true,
    includeIfNull: true,
  )


  final int? rating;



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
    
    name: r'incentive_note',
    required: true,
    includeIfNull: true,
  )


  final String? incentiveNote;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PublicTestimonial &&
      other.quote == quote &&
      other.nameShown == nameShown &&
      other.roleShown == roleShown &&
      other.rating == rating &&
      other.source_ == source_ &&
      other.sourceUrl == sourceUrl &&
      other.incentiveNote == incentiveNote;

    @override
    int get hashCode =>
        quote.hashCode +
        nameShown.hashCode +
        (roleShown == null ? 0 : roleShown.hashCode) +
        (rating == null ? 0 : rating.hashCode) +
        source_.hashCode +
        (sourceUrl == null ? 0 : sourceUrl.hashCode) +
        (incentiveNote == null ? 0 : incentiveNote.hashCode);

  factory PublicTestimonial.fromJson(Map<String, dynamic> json) => _$PublicTestimonialFromJson(json);

  Map<String, dynamic> toJson() => _$PublicTestimonialToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

